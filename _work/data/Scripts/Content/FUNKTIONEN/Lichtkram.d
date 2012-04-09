//#################################################
//
//    Fast Dynamic Lights
//
//#################################################

/*

Version: 0.0
Still contains Exodus-specific code. Some, though not much, effort is needed
to personalise this code for your needs.


In many situations static lighting is the lighting method to choose, as it
provides detailed, complex lighting without any runtime costs. But static lighting
is, of course, static. That means, is does not support any variation of
lighting over time, that is, flickering torchlight is equally impossible as
time-dependent daylight in portal rooms. Additionally, static lighting does
not work (well) in non portal rooms at night time.

Dynamic lights have the advantage, that they can be switched on and off
and even dimmed at runtime and work perfectly well at nighttime,
but they are extremely expensive to render even if the hero is very far away.

The Idea of this script is to find a compromise between dynamic lights
and static lights.

In order to have the flexibility of dynamic lights but less of the cost,
a good solution is to only insert the lightvobs of the hero is in the
vicinity of the light source. The scene not being lit if seen from far away
is an acceptable price to pay in many situations.
Insertion and deletion of lights can be done in a continuous way
(smooth light fading instead of sudden on/off switching).

//--------------------------------------
// Basic Usage
//--------------------------------------

Every light that is supposed to be managed by this system is not set into the
world directly as a lightvob (zCVobLight) but as a lightspawner instead.
A lightspawner is an oCMobFire that spawns a single vob of type zCVobLight
(or a vobtree with a zCVobLight as the parent vob) when receiving a trigger.

The name of the lightspawner is used to distinguish between different
types of lights. We call this name the lighttype.

At the first startup of the world, FDL_Startup(var string lighttype) should
be called once for every lighttype that should be managed by the system.

Every frame the function FDL_FRAMEUPDATE should be called. This function checks
for lights to insert, destroy or alter in brightness according to the
position of the camera (and some abitrary user conditions).

There are several ranges configurable as constants that are central to
this script, some of which are related to light fading. They are given
in decreasing order.

insert range: If the distance to the camera is smaller than the insert range
              lightvobs are allowed to be inserted into the world.
              The higher the insert range, the more lights will be present
              in the world and the more time will be needed to render them.
faded range:  If the distance to the camera is bigger than faded range,
              the light is considered black. If the distance to the camera is
              smaller than faded range, the light is guaranteed (by this script)
              to be inserted into the world.
              A small difference between insert range and faded range allows this
              script some flexibility (if the distance of a vob to the camera is
              between these two values, this script may, or may not insert it into
              the world. This allows a certain lazyness (which saves time)).
start fade:   Used in user provided code only. The idea is to have the light
              at full brightness up to this distance and use the interval
              of [start fade, faded range] to fade to black.

User provided functions are:

FDL_IsLightActive: Decides whether or not a certain group of lights should be
                   inserted into the world at that time. Can be used to
                   disable lights at a certain time of the day or arbitrary,
                   possibly story related conditions. Whereas black lights
                   do cost performance, unactive lights do not.
FDL_UpdateLight:   Sets the light of the lightvob. Can take in account the
                   lighttype (name of the underlying spawner), the distance
                   to the camera and arbitrary other conditions.
                   Should respect the start fade and faded range constants.

Note: This script makes use of a function sysGetTime.
It can be implemented like this:

*******************************************************
*  func int sysGetTime() {                            *
*     const int sysGetTimePtr = 5264000; //0x505280;  *
*     CALL__cdecl(sysGetTimePtr);                     *
*     return CALL_RetValAsInt();                      *
*  };                                                 *
*******************************************************

Note: This script currently makes use of the Gothic.ini entry:

*************************
*  [EXODUS]             *
*  exLightingQuality=   *
*************************

obviously, you should change at least the name of the entry,
before you use this script. Currently the ini entry scales
all the ranges (insert, faded, start fade) by 1, 2 or 3.
The value 0 is used to deactivate the system entirely.

Note: This script already contains data for some lighttypes.
The colours of these lights (ignoring changes related to the
distance to the camera at this point) are:

FDL_DAYLIGHT: Off at night, bright at day. Additional blue in the morning
              additional red in the evening. Smooth transitions.
FDL_LATERNE:  Warm light at night, off during the day.
              No smooth transitions (at 8pm they just pop alive).
FDL_DOORSTEP: Pretty much the same as FDL_LATERNE
FDL_FIRE:     Warm light, independent from the time of day.

*/

//--------------------------------------
// Konfiguration
//--------------------------------------

//Ab welcher Distanz einfügen? (alle Distanzen werden Skaliert durch die Lichtqualität)
const int FDL_LIGHT_BASIC_INSERTRANGE_CM     = 1500; // !> FDL_LIGHT_FADEDRANGE //Vorsicht: Differenz zu "faded" wird benutzt um zu entscheiden ab welcher Kameraauslenkung nach neuen Lichtern gesucht werden muss
var int FDL_LIGHT_INSERTRANGE_CM;
//Ab welcher Distanz vollständig ausgeblendet
const int FDL_LIGHT_BASIC_FADEDRANGE_CM     = 1200; // !>= FDL_LIGHT_STARTFADERANGE_CM
var int FDL_LIGHT_FADEDRANGE_CM;
//Ab welcher Distanz das Licht ausblenden
const int FDL_LIGHT_BASIC_STARTFADERANGE_CM  = 900; // !<= FDL_LIGHT_FADEDRANGE
var int FDL_LIGHT_STARTFADERANGE_CM;

const int FDL_VerticalDistWeight               =   3; //Vertikale Distanz wird stärker gewichtet.
const int FDL_CamAndPlayerNotInSectorDist      = 750;

const int FDL_MAX_COLOR_DIFF_PER_SECOND = 100; //Geschwindigkeit mit der Farbkanäle angepasst werden, Einheiten pro Sekunde.

//Welchen Namen hat die Triggerschleife?
const string FDL_TRIGGERSCRIPT_NAME = "FDL_TRIGGERSCRIPT";

//In jedem wievielten Frame updaten?
const int FDL_FRAMES_PER_CHECK       = 2; //Frames, bis wieder mal eine Gridposition nach Lichtern durchsucht wird, die man aktivieren will.
const int FDL_FRAMES_PER_UPDATE 	 = 2; //1 = Jeden Frame wird Farbe der aktiven Lichter überprüft
var int FDL_UpdateLightFrameSkipper;

//Info: Anzahl der aktiven Lichter.
var int FDL_ActiveLights;

//#################################################################
//
//  Anpassen der Lichthelligkeit in jedem Frame
//
//#################################################################

//--------------------------------------
// zCOLOR
//--------------------------------------

const int zCOLOR_CHANNEL     = (1 << 8) - 1;
const int zCOLOR_SHIFT_RED   = 16;
const int zCOLOR_SHIFT_GREEN = 8;
const int zCOLOR_SHIFT_BLUE  = 0;
const int zCOLOR_SHIFT_ALPHA = 24;

const int zCOLOR_RED   = zCOLOR_CHANNEL << zCOLOR_SHIFT_RED;
const int zCOLOR_GREEN = zCOLOR_CHANNEL << zCOLOR_SHIFT_GREEN;
const int zCOLOR_BLUE  = zCOLOR_CHANNEL << zCOLOR_SHIFT_BLUE;
const int zCOLOR_ALPHA = zCOLOR_CHANNEL << zCOLOR_SHIFT_ALPHA;


func int clamp (var int v, var int min, var int max) {
    if (v < min) { return min; };
    if (v > max) { return max; };
    return v;
};

func int RGBAToZColor (var int r, var int g, var int b, var int a) {
    //clamping for safety
    r = clamp (r, 0, 255) << zCOLOR_SHIFT_RED;
    g = clamp (g, 0, 255) << zCOLOR_SHIFT_GREEN;
    b = clamp (b, 0, 255) << zCOLOR_SHIFT_BLUE;
    a = clamp (a, 0, 255) << zCOLOR_SHIFT_ALPHA;
    
    return r | g | b | a;
};

const int LaternenAnHour = 20; //soll Synchron zu den gespawnten Feuer-Decals sein.
const int LaternenAusHour = 5;

func int FDL_IsLightActive (var string vobName) {
	if (Hlp_StrCmp (vobName, "FDL_DAYLIGHT")) {
		return Wld_IsTime (03,00,21,00);
	} else if (Hlp_StrCmp (vobName, "FDL_LATERNE")) {
		return Wld_IsTime (LaternenAnHour,00,LaternenAusHour,00);
    } else if (Hlp_StrCmp (vobName, "FDL_DOORSTEP")) {
        return Wld_IsTime (19,00,05,00);
    } else if (Hlp_StrCmp (vobname, "FDL_FIRE")) {
        return true; //Normale Fackeln.
    };
	
	PrintDebug (ConcatStrings ("FDL_IsLightActive: Unhandled Vobname: ", vobName));
	return true;
};

var int   FDL_MaxColorDiffThisFrame; //wird jeden Frame vom System initialisiert

const int FDL_MAXDIFFPERCHANNELANDFRAME = 7 * FDL_FRAMES_PER_UPDATE;

func void FDL_UpdateLight (var zCVobLight light, var int dist) {
	var int r; var int g; var int b; var int scale;
    var int oldR; var int oldG; var int oldB;
	oldR = (light.lightColor & zCOLOR_RED)   >> zCOLOR_SHIFT_RED;
	oldG = (light.lightColor & zCOLOR_GREEN) >> zCOLOR_SHIFT_GREEN;
	oldB = (light.lightColor & zCOLOR_BLUE)  >> zCOLOR_SHIFT_BLUE;
    
	scale = 255;
	
	//Tageslicht ist Tageszeitabhängig:
	if (Hlp_StrCmp (light.lightPresetInUse, "FDL_DAYLIGHT")) {
        r = 255;
        g = 255;
        b = 255;
    
		//########## Zeit bestimmen #############
		var int time_min; time_min = truncf (MEM_WorldTimer.worldTime);
		time_min /= oCWorldTimer_TicksPerMin_approx;
		
		//########## Grundskalierung #############
		
		var int distFromMidDay;
		distFromMidDay = time_min - 750; //12:30 ist "Mitte"
		if (distFromMidDay < 0) { distFromMidDay = - distFromMidDay; };
		
		scale = (scale * (510 - distFromMidDay)) / 300; //zwischen 4 Uhr morgens und 9 Uhr abends ist Licht, 9:30 Uhr bis 15:30 Uhr maximal hell.
		
		if (scale > 255) {
			scale = 255; //zwischen 10 und 14 Uhr: truncate.
		};
		
		//########## Morgens mehr blau #############
		var int distFromMorning;
		distFromMorning = time_min - 420; //distanz von 7 Uhr
		if (distFromMorning < 0) { distFromMorning = - distFromMorning; };
		
		var int blueBonus;
		blueBonus = (100 * (180 - distFromMorning)) / 180; //3 stunden um 7 Uhr wird 100 Bonusblau gelerpt.
		
		if (blueBonus > 0) {
			b += blueBonus;
		};
		
		//########## Abends mehr rot #############
		var int distFromEvening;
		distFromEvening = time_min - 1140; //distanz von 19 Uhr
		if (distFromEvening < 0) { distFromEvening = - distFromEvening; };
		
		var int redBonus;
		redBonus = (100 * (180 - distFromEvening)) / 180; //3 stunden um 19 Uhr wird 100 Bonusrot gelerpt.
		
		if (redBonus > 0) {
			r += redBonus;
		};
		
		//########## Regen dämpft #############
		if (Wld_IsRaining()) {
			var int rainWeightPercent;
			rainWeightPercent = roundf(mulf(mkf(100),MEM_SkyController.rainFX_outdoorRainFXWeight));
			
			scale = (scale + (scale * rainWeightPercent) / 100) / 2; //auf 50% runter
		};
	} else /* if (Hlp_StrCmp (light.lightPresetInUse, "FDL_LATERNE"))
    || (Hlp_StrCmp (light.lightPresetInUse, "FDL_DOORSTEP"))
    || (Hlp_StrCmp (light.lightPresetInUse, "FDL_FIRE")) */ {
		r = 255;
		g = 105;
		b =  54;
	};
	
	//Zusätzlich: Licht langsam reinfaden und ausblenden:
	if (dist > FDL_LIGHT_STARTFADERANGE_CM) {
		var int fadePos;
		var int fadeDist; //soviel Zeit zum Faden
		fadePos  = FDL_LIGHT_FADEDRANGE_CM - dist;
		fadeDist = FDL_LIGHT_FADEDRANGE_CM - FDL_LIGHT_STARTFADERANGE_CM;
		
		scale = (scale * fadePos) / fadeDist;
	};
	
	//Berechnete Werte anwenden:
	if (scale < 0) { scale = 0;	};

	if (scale != 255) {	
		r = (r * scale) / 255;
		g = (g * scale) / 255;
		b = (b * scale) / 255;
	};
	
    //Clampen
    r = clamp(r, 0, 255);
    b = clamp(b, 0, 255);
    g = clamp(g, 0, 255);
	
    r = clamp(r, oldR - FDL_MaxColorDiffThisFrame, oldR + FDL_MaxColorDiffThisFrame);
    g = clamp(g, oldG - FDL_MaxColorDiffThisFrame, oldG + FDL_MaxColorDiffThisFrame);
    b = clamp(b, oldB - FDL_MaxColorDiffThisFrame, oldB + FDL_MaxColorDiffThisFrame);
    
    light.lightColor = (b << zCOLOR_SHIFT_BLUE) | (g << zCOLOR_SHIFT_GREEN) | (r << zCOLOR_SHIFT_RED);
};

func void FDL_FadeLightToBlack(var zCVobLight light) {
    var int r; var int g; var int b; var int scale;
    r = (light.lightColor & zCOLOR_RED)   >> zCOLOR_SHIFT_RED;
	g = (light.lightColor & zCOLOR_GREEN) >> zCOLOR_SHIFT_GREEN;
	b = (light.lightColor & zCOLOR_BLUE)  >> zCOLOR_SHIFT_BLUE;
    
    r -= FDL_MAXDIFFPERCHANNELANDFRAME;
    g -= FDL_MAXDIFFPERCHANNELANDFRAME;
    b -= FDL_MAXDIFFPERCHANNELANDFRAME;
    
    if (r < 0) { r = 0; };
    if (g < 0) { g = 0; };
    if (b < 0) { b = 0; };
    
    light.lightColor = (b << zCOLOR_SHIFT_BLUE) | (g << zCOLOR_SHIFT_GREEN) | (r << zCOLOR_SHIFT_RED);
};

//#################################################################
//
//  Implementierung
//
//#################################################################

/* debug */
var int FDLINT_StopAndDrop;
var int FDLINT_Debug;

/* Ini-Einstellung */
var int FDL_LightQuality; const int FDL_MAXLIGHTQUALITY = 2;
var int FDLINT_IsShutdown; //wird gebraucht, wenn Lichtqualität == 0

//Wie groß soll das Gitter sein, in das die Vobs sortiert werden? Sollte so passen.
const int FDL_GRIDSIZE_CM = FDL_LIGHT_BASIC_INSERTRANGE_CM * FDL_MAXLIGHTQUALITY; //! >= FDL_LIGHT_BASIC_INSERTRANGE_CM * FDL_MAXLIGHTQUALITY

//Noch nicht sofort das Licht entfernen, sonst kommt es evtl zu flattern (spawnen, zerstören, spawnen zerstören...).
const int FDL_LIGHT_BASIC_REMOVERANGE_CM     = FDL_LIGHT_BASIC_INSERTRANGE_CM + 100; //! >= FDL_LIGHT_BASIC_INSERTRANGE_CM
var int FDL_LIGHT_REMOVERANGE_CM;

const string FDLINT_SpawnerBaseName = "FDL_";
const string FDLINT_ActiveSpawnerName = "FDL_ACTIVE";

//--------------------------------------
// Math
//--------------------------------------

//abgerundete Wurzel
func int FDL_sqrt_int (var int x) {
	//Spezialfälle:
	if (x <= 0) {
		if (x < 0) {
			MEM_AssertFail ("FDL_sqrt_int: x may not be negative!");
		};
		
		return 0;
	};
	
	//nach und nach die hochwertigen bits setzen:
	var int res; res = 0;
	var int bit; bit = 1 << 15;
	
	var int loop; loop = MEM_StackPos.position;
	
	/* while */ if (bit) {
		if ( (res | bit) * (res | bit) <= x) {
			res = res | bit;
		};
		
		bit = bit >> 1;
		MEM_StackPos.position = loop;
	};
	
	return res;
};

//div, das immer nach unten abrundet
func int FDLINT_Pos2GridPos(var int p) {
	if (p > 0) {
		return p / FDL_GRIDSIZE_CM; //[0,...]
	} else {
		return -1 - (-p - 1) / FDL_GRIDSIZE_CM; //[...,-1]
	};
};

//--------------------------------------
// Grid Handling
//--------------------------------------

var int FDLINT_CamPos_X; var int FDLINT_CamPos_Y; var int FDLINT_CamPos_Z;
var int FDLINT_CamGridPos_X; var int FDLINT_CamGridPos_Z;

var int FDLINT_CamSectPtr; var int FDLINT_PlayerSectPtr;

func string FDLINT_SpawnerName (var int posX, var int posZ) {
	var string txt;
	txt = FDLINT_SpawnerBaseName;
	txt = ConcatStrings (txt, IntToString (posX));
	txt = ConcatStrings (txt, "_");
	txt = ConcatStrings (txt, IntToString (posZ));
	return txt;
};

func string FDLINT_BuildSpawnerName (var int vobPtr) {
	var zCVob vob;
	vob = MEM_PtrToInst (vobPtr);
	
	var int posX; var int posZ;
	posX = truncf (vob.trafoObjToWorld[zCVob_trafoObjToWorld_X]);
	posZ = truncf (vob.trafoObjToWorld[zCVob_trafoObjToWorld_Z]);
	
	posX = FDLINT_Pos2GridPos (posX);
	posZ = FDLINT_Pos2GridPos (posZ);
	
	return FDLINT_SpawnerName (posX, posZ);
};

func void FDLINT_UpdateCamPos () {
	var zCVob camVob;
	camVob = MEM_PtrToInst (MEM_Camera.connectedVob);
	
	var int posX; var int posZ;
	FDLINT_CamPos_X = truncf (camVob.trafoObjToWorld[zCVob_trafoObjToWorld_X]);
    FDLINT_CamPos_Y = truncf (camVob.trafoObjToWorld[zCVob_trafoObjToWorld_Y]);
	FDLINT_CamPos_Z = truncf (camVob.trafoObjToWorld[zCVob_trafoObjToWorld_Z]);
	
	FDLINT_CamGridPos_X = FDLINT_Pos2GridPos (FDLINT_CamPos_X); 
	FDLINT_CamGridPos_Z = FDLINT_Pos2GridPos (FDLINT_CamPos_Z);
    
    FDLINT_CamSectPtr = GetVobSector (MEM_Camera.connectedVob);
    FDLINT_PlayerSectPtr = GetVobSector (MEM_InstToPtr (hero));
};
	
//--------------------------------------
// Einsortieren der Spawner ins Gitter
//--------------------------------------

func void FDLINT_ResetSpawner (var int spawnerPtr) {
    MEM_UntriggerVob (spawnerPtr);
	
	var string newName;
	newName = FDLINT_BuildSpawnerName (spawnerPtr);
	
	MEM_RenameVob (spawnerPtr, newName);
};

//--------------------------------------
// Müssen spawner aktiviert werden?
//--------------------------------------

func int FDLINT_GetSpawnerDistQuad (var int spawnerPtr) {
	var zCVob spawner;
	spawner = MEM_PtrToInst (spawnerPtr);
	
	var int posX; posX = truncf (spawner.trafoObjToWorld[zCVob_trafoObjToWorld_X]);
    var int posY; posY = truncf (spawner.trafoObjToWorld[zCVob_trafoObjToWorld_Y]);
	var int posZ; posZ = truncf (spawner.trafoObjToWorld[zCVob_trafoObjToWorld_Z]);
	
	var int dx; dx = posX - FDLINT_CamPos_X;
    var int dy; dy = (posY - FDLINT_CamPos_Y) * FDL_VerticalDistWeight;
	var int dz; dz = posZ - FDLINT_CamPos_Z;
    
	if (dx < 0) { dx = -dx; };
    if (dy < 0) { dy = -dy; };
	if (dz < 0) { dz = -dz; };
	
	if (dx > (1 << 14))
	|| (dy > (1 << 14))
    || (dz > (1 << 14)){
		return (1 << 31) - 1; //INT_MAX, gegen überlauf
	};
	
	return dx * dx + dy * dy + dz * dz;
};

func int FDLINT_GetSpawnerDist (var int spawnerPtr) {
	return FDL_sqrt_int (FDLINT_GetSpawnerDistQuad (spawnerPtr));
};

const int FDLINT_SectorActive = 1;
const int FDLINT_SectorCamera = 2;
const int FDLINT_SectorPlayer = 4;
const int FDLINT_SectorPlayerAndCam = 6;
const int FDLINT_ClassKosher = FDLINT_SectorActive | FDLINT_SectorCamera | FDLINT_SectorPlayer;
func int FDLINT_ClassifySpawnerSector(var int spawnerPtr) {
    var int sectPtr; sectPtr = GetVobSector (spawnerPtr);
    var int res; res = 0;
    
    if (!sectPtr) {
        //nicht im Portalraum, also draußen.
        //draußen ist eigentlich immer aktiv:
        res = res | FDLINT_SectorActive;
    } else {
        var zCBspSector sect;
        sect = MEM_PtrToInst (sectPtr);
        
        if (sect.activated == MEM_ReadInt (bspFrameCtr_Address)) {
            res = res | FDLINT_SectorActive;
        };
    };
    
    if (sectPtr == FDLINT_CamSectPtr) {
        res = res | FDLINT_SectorCamera;
    };
    
    if (sectPtr == FDLINT_PlayerSectPtr) {
        res = res | FDLINT_SectorPlayer;
    };
    
    return res;
};

func void FDLINT_CheckSpawner (var int spawnerPtr) {
	var oCMobFire spawner;
	spawner = MEM_PtrToInst (spawnerPtr);
	
	//Soll das überhaupt gerade aktiv sein?
	if (!FDL_IsLightActive (spawner._oCMobInter_onStateFuncName)) {
		return;
	};
    
    var int distQuad; distQuad = FDLINT_GetSpawnerDistQuad (spawnerPtr);
	if (distQuad >= FDL_LIGHT_INSERTRANGE_CM * FDL_LIGHT_INSERTRANGE_CM) {
        return;
    };
    
    var int spawnerClass; spawnerClass = FDLINT_ClassifySpawnerSector(spawnerPtr);
    
    if (spawnerClass != FDLINT_ClassKosher) {
        if !(spawnerClass & FDLINT_SectorActive) {
            return;
        };
        
        if !(spawnerClass & FDLINT_SectorPlayerAndCam) {
            //weder Spieler noch Kamera im Sektor:
            var int dist; dist = FDL_sqrt_int (distQuad);
            dist += FDL_CamAndPlayerNotInSectorDist * FDL_LightQuality;
            
            //jetzt immernoch drin?
            if (dist >= FDL_LIGHT_INSERTRANGE_CM) {
                return;
            };
        };
    };
	
    //aktivieren
    MEM_TriggerVob   (spawnerPtr);
	MEM_RenameVob (spawnerPtr, FDLINT_ActiveSpawnerName);
    
    //licht ist beim spawnen schwarz:
    if (spawner.fireVobtree) {
        var zCVobLight light;
        light = MEM_PtrToInst (spawner.fireVobtree);
        
        if (light._vtbl == zCVobLight_vtbl) {
            light.lightColor = light.lightColor & zCOLOR_ALPHA;
        };
    };
};

func void FDLINT_CheckSpawnersInCell (var int posX, var int posZ) {
	var string spawnerName;
	spawnerName = FDLINT_SpawnerName (posX, posZ);
	
	var zCArray spawners;
	spawners = MEM_PtrToInst (MEM_SearchAllVobsByName (spawnerName));
	
	var int i; i = 0;
	var int loop; loop = MEM_StackPos.position;
	
	if (i < spawners.numInArray) {
		FDLINT_CheckSpawner (MEM_ReadIntArray (spawners.array, i));
		
		i += 1;
		MEM_StackPos.position = loop;
	};
	
	MEM_ArrayFree (MEM_InstToPtr (spawners));
};

var int FDLINT_CheckSpawnersInRange_Init;
func void FDLINT_CheckSpawnersInRange() {
    //will ich diesen Frame überhaupt checken?
    var int frameCount; frameCount += 1;
    if (frameCount > FDL_FRAMES_PER_CHECK) {
        frameCount -= FDL_FRAMES_PER_CHECK;
    } else {
        return;
    };

	var int updating;
	var int updateProgress;
	
	if (!updating) {
		var int lastCamPosX;
		var int lastCamPosZ;
		var int newCamPosX;
		var int newCamPosZ;
		var int newCamGridX;
		var int newCamGridZ;
		/*
		var int dx; var int dz;
		dx = FDLINT_CamPos_X - lastCamPosX;
		dz = FDLINT_CamPos_Z - lastCamPosZ;
		
		var int absdx; var int absdz;
		if (dx < 0) { absdx = - dx; } else { absdx = dx; };
		if (dz < 0) { absdz = - dz; } else { absdz = dz; };
		
		// solange ich mich nicht weit von der Stelle bewegt habe
		// brauche ich kein Update
        
		if (FDLINT_CheckSpawnersInRange_Init)
		&& (absdz + absdx < FDL_LIGHT_INSERTRANGE_CM - FDL_LIGHT_FADEDRANGE_CM) {
			return;
		};*/
		
		//ich muss updaten
		updating = true;
		newCamPosX = FDLINT_CamPos_X;
		newCamPosZ = FDLINT_CamPos_Z;
		newCamGridX = FDLINT_CamGridPos_X;
		newCamGridZ = FDLINT_CamGridPos_Z;
		
		FDLINT_CheckSpawnersInRange_Init = true;
	};
	
	FDL_UpdateLightFrameSkipper = 0; //gleich auch noch ein Update machen, sonst flackerts, falls ich Lichter dazubekommen habe.
	
	//Update auf 10 Frames verteilen, erst Mitte, dann benachbarte Zellen, dann diagonale. Zwischendrinn nochmal Mitte.
		 if (updateProgress == 0) {	FDLINT_CheckSpawnersInCell (newCamGridX +0, newCamGridZ +0); }
	else if (updateProgress == 1) {	FDLINT_CheckSpawnersInCell (newCamGridX -1, newCamGridZ +0); }
	else if (updateProgress == 2) {	FDLINT_CheckSpawnersInCell (newCamGridX +0, newCamGridZ -1); }
	else if (updateProgress == 3) {	FDLINT_CheckSpawnersInCell (newCamGridX +1, newCamGridZ +0); }
	else if (updateProgress == 4) {	FDLINT_CheckSpawnersInCell (newCamGridX +0, newCamGridZ +1); }
    else if (updateProgress == 5) {	FDLINT_CheckSpawnersInCell (newCamGridX +0, newCamGridZ +0); }
	else if (updateProgress == 6) {	FDLINT_CheckSpawnersInCell (newCamGridX -1, newCamGridZ -1); }
	else if (updateProgress == 7) {	FDLINT_CheckSpawnersInCell (newCamGridX -1, newCamGridZ +1); }
	else if (updateProgress == 8) {	FDLINT_CheckSpawnersInCell (newCamGridX +1, newCamGridZ -1); }
	else if (updateProgress == 9) {	FDLINT_CheckSpawnersInCell (newCamGridX +1, newCamGridZ +1);
		lastCamPosX = newCamPosX;
		lastCamPosZ = newCamPosZ;
		
		updateProgress = 0;
		updating = false;
		return;
	};
	
	updateProgress += 1;
};

//--------------------------------------
// Update eines Lichts:
//--------------------------------------

func void FDLINT_UpdateActiveLights() {
	//************************************************
    //   TimeDiff ~ Color Diff
    //************************************************
    
    var int sysTimeOld;
    var int sysTime;
    
    sysTime = sysGetTime();
    FDL_MaxColorDiffThisFrame = (FDL_MAX_COLOR_DIFF_PER_SECOND * (sysTime - sysTimeOld)) / 1000;
    FDL_MaxColorDiffThisFrame = clamp (FDL_MaxColorDiffThisFrame, 1, 255);
    
    sysTimeOld = sysTime;
    
    //************************************************
    //   Durch alle Lichter durch
    //************************************************
    
	FDL_ActiveLights = 0;
    
	var zCArray spawners;
	spawners = MEM_PtrToInst (MEM_SearchAllVobsByName (FDLINT_ActiveSpawnerName));
	FDL_ActiveLights = spawners.numInArray;
    
	var int i; i = 0;
	var int loop; loop = MEM_StackPos.position;
	
	if (i < spawners.numInArray) {
		var int spawnerPtr;
		spawnerPtr = MEM_ReadIntArray (spawners.array, i);
		var oCMobFire spawner;
		spawner = MEM_PtrToInst (spawnerPtr);
            
		var int dist;
		dist = FDLINT_GetSpawnerDist (spawnerPtr);
        var zCVobLight light;
		
        var int spawnerClass; spawnerClass = FDLINT_ClassifySpawnerSector(spawnerPtr);
        
        if (spawnerClass != FDLINT_ClassKosher) {
            if !(spawnerClass & FDLINT_SectorActive) {
                dist = (1 << 31) - 1; //INT_MAX
            } else if !(spawnerClass & FDLINT_SectorPlayerAndCam) {
                //weder Spieler noch Kamera im Sektor:
                dist += FDL_CamAndPlayerNotInSectorDist * FDL_LightQuality;
            };
        };
        
		if (FDL_LightQuality == 0) { //gerade am ausschalten
			FDLINT_ResetSpawner (spawnerPtr);
		} else if (dist > FDL_LIGHT_REMOVERANGE_CM) {
             //dann bitte ausblenden:
             if (spawner.fireVobtree) {
                light = MEM_PtrToInst (spawner.fireVobtree);
                
                if (light._vtbl == zCVobLight_vtbl) {
                    FDL_FadeLightToBlack (light);
                    
                    //schon ganz schwarz?
                    if ! (light.lightColor & ~ zCOLOR_ALPHA) {
                        FDLINT_ResetSpawner (spawnerPtr);
                    };
                } else {
                    //ungültig
                    MEM_Warn ("FDLINT_UpdateActiveLights: Child is not a zCVobLight.");
                    FDLINT_ResetSpawner (spawnerPtr);
                };
            } else {
                //ungültig
                MEM_Warn ("FDLINT_UpdateActiveLights: Spawner has no fireVobtree?");
                FDLINT_ResetSpawner (spawnerPtr);
            };
        } else {
			//In Reichweite:
			if (!spawner.fireVobtree) {
				/* kann nach dem Laden passieren. Dann einfach nochmal triggern:
					PrintDebug ("FDLINT_UpdateActiveLights: FireVobtree missing... Ignore this on loading.");
				*/
				
				MEM_TriggerVob (spawnerPtr);
			};
				
			if (!spawner.fireVobtree) {
				//immernoch nicht?!
				MEM_Warn ("FDLINT_UpdateActiveLights: Light-Spawner was triggered but doesn't seem to have a child! Ignoring...");
			} else {
				light = MEM_PtrToInst (spawner.fireVobtree);
				
				if (light._vtbl != zCVobLight_vtbl) {
					MEM_Warn (ConcatStrings ("FDLINT_UpdateActiveLights: Light-Spawners first child is not a zCVobLight! vtbl is: ", IntToString (light._vtbl)));
				} else {
					//Wirkliche Animation nicht erwünscht, brauche aber colorAniList als Backup
					light.colorAniFPS = 0;
					
					if (!FDLINT_Debug) {
						if (dist > FDL_LIGHT_INSERTRANGE_CM) {
							//für den Nutzer gar nicht wirklich da.
							light.lightColor = 0;
						} else {
							//ansonsten Nutzer fragen:
							FDL_UpdateLight (light, dist);
							
							if ! (light.lightColor & ~ zCOLOR_ALPHA) {
								//Berechnetes Licht: Schwarz. Brauch der vielleicht gar nicht mehr an sein?
								if (!FDL_IsLightActive (spawner._oCMobInter_onStateFuncName)) {
									FDLINT_ResetSpawner (spawnerPtr);
								};
							};
						};
					};
				};
			};
		};
		
		i += 1;
		MEM_StackPos.position = loop;
	};
	
	MEM_ArrayFree (MEM_InstToPtr (spawners));
};

//--------------------------------------
// "public"
//--------------------------------------

func void FDLINT_TriggerLoop() {
	//Wieder triggern:
	Wld_SendTrigger (FDL_TRIGGERSCRIPT_NAME);
	var zCVob trigger;
	
	var int triggerPtr;
	triggerPtr = MEM_SearchVobByName (FDL_TRIGGERSCRIPT_NAME);
	
	if (!triggerPtr) {
		MEM_Error ("FDL_Startup: oCTriggerScript for loop (see constant FDL_TRIGGERSCRIPT_NAME) not found!");
		return;
	};
	
	trigger = MEM_PtrToInst (triggerPtr);
	trigger.nextOnTimer = MEM_Timer.totalTimeFloat;
};

func void FDL_Startup (var string spawnerName) {
	//überall aus zeitsensitivem Code rausgenommen, daher hier:
	//Vorsicht: Es wird erwartet, dass User selbstständig ini Init World dies ausführt:
	MEM_InitGlobalInst();
	MEM_InitLabels();
	
	var zCArray spawners;
	spawners = MEM_PtrToInst (MEM_SearchAllVobsByName (spawnerName));
	
	var int i; i = 0;
	var int loop; loop = MEM_StackPos.position;
	
	if (i < spawners.numInArray) {
		var int spawnerPtr;
		spawnerPtr = MEM_ReadIntArray (spawners.array, i);
		
		//Namen merken:
		var oCMobFire spawner;
		spawner = MEM_PtrToInst (spawnerPtr);
		spawner._oCMobInter_onStateFuncName = spawner._zCObject_objectName;
		
		FDLINT_ResetSpawner (spawnerPtr);
		
		i += 1;
		MEM_StackPos.position = loop;
	};
	
	MEM_ArrayFree (MEM_InstToPtr (spawners));
	
	//FDLINT_TriggerLoop();
};

//Soll per Loop getriggert werden:
func void FDL_FRAMEUPDATE() {
	var int newQual;
	//newQual = STR_ToInt (MEM_GetGothOpt ("XERES", "LightingQuality"));

	newQual = 3;
	
	if (newQual < 0) {
		newQual = 0;
	} else if (newQual > FDL_MAXLIGHTQUALITY) {
		newQual = FDL_MAXLIGHTQUALITY;
	};
	
	if (newQual != FDL_LightQuality) {
		PrintDebug (ConcatStrings ("FDL_FRAMEUPDATE: Light-Quality changed. New value is: ", IntToString (newQual)));
		FDL_LightQuality = newQual;
		FDLINT_CheckSpawnersInRange_Init = false; //sofort alle checken
		FDLINT_IsShutDown = false;
		
		FDL_LIGHT_INSERTRANGE_CM 	= FDL_LIGHT_BASIC_INSERTRANGE_CM 	* FDL_LightQuality;
		FDL_LIGHT_REMOVERANGE_CM 	= FDL_LIGHT_BASIC_REMOVERANGE_CM 	* FDL_LightQuality;
		FDL_LIGHT_STARTFADERANGE_CM = FDL_LIGHT_BASIC_STARTFADERANGE_CM * FDL_LightQuality;
		FDL_LIGHT_FADEDRANGE_CM 	= FDL_LIGHT_BASIC_FADEDRANGE_CM 	* FDL_LightQuality;
	};
	
	if (FDLINT_StopAndDrop) //debug
	|| (FDLINT_IsShutDown) //shutdown complete
	{
		return;
	};
	
	//Schlafen / set Time. Manchmal müssen Lichter gespawnt werden ohne, dass sich die Kamera bewegt.
	var int time;
	if (World_Time_Intern - time > 10) { //plötzlicher Sprung: Lieber mal schauen ob ich Lichter spawnen muss
		FDLINT_CheckSpawnersInRange_Init = false;
	};
	time = World_Time_Intern;
	
	FDLINT_UpdateCamPos();
	
	//neue Lichter aufnehmen?
	FDLINT_CheckSpawnersInRange ();
	
	if (FDL_UpdateLightFrameSkipper >= 0) {
		FDL_UpdateLightFrameSkipper = FDL_Frames_Per_Update;
		
		//aktive Lichter anpassen oder zerstören
		FDLINT_UpdateActiveLights();
		
		if (FDL_LightQuality == 0) {
			//shutdown complete, gerade alle ausgeschaltet
			FDLINT_IsShutDown = true;
		};
	};
	
	FDL_UpdateLightFrameSkipper -= 1;
};

//------------------------------------------------
//  Performance Test
//------------------------------------------------

INSTANCE FDL_StopAndDrop	(C_ITEM)
{
	name 				=	"Fast dynamic lights Testbrief";
	
	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	visual 				=	"ItWr_Scroll_01.3DS";
	
	scemeName			=	"WURSCHTEL";

	on_state[0]			=   Use_FDL_StopAndDrop;
	description			= 	name;
	TEXT[2]				=   "hält das FDL System an / startet es wieder";
	TEXT[3]				=   "nur zu Testzwecken!";
};

FUNC VOID Use_FDL_StopAndDrop()
{
	FDLINT_StopAndDrop = !FDLINT_StopAndDrop;
	
	if (!FDLINT_StopAndDrop) {
		Print ("restarting...");
		FDLINT_TriggerLoop();
	} else {
		Print ("stopping.");
	};
};

INSTANCE FDL_Debug	(C_ITEM)
{
	name 				=	"Fast dynamic lights Testbrief";
	
	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	visual 				=	"ItWr_Scroll_01.3DS";
	
	scemeName			=	"WURSCHTEL";

	on_state[0]			=   Use_FDL_Debug;
	description			= 	name;
	TEXT[2]				=   "alle lichter sind immer weiß";
	TEXT[3]				=   "(zum Testen ob Lichter korrekt entfernt werden)";
};

func void Use_FDL_Debug() {
	FDLINT_Debug = !FDLINT_Debug;
	
	if (FDLINT_Debug) {
		Print ("debugging on");
	} else {
		Print ("debugging off");
	};
		
};