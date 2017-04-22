//****************************
// 	

var int OLDWOLRDThomas;
var int BUCHLABYRINTH_SCHALTER1;
var int BUCHLABYRINTH_SCHALTER2;
var int BUCHLABYRINTH_SCHALTER3;
var int BUCHLABYRINTH_SCHALTER4;
var int BUCHLABYRINTH_TRUHE1;
var int BUCHLABYRINTH_TRUHE2;
var int BUCHLABYRINTH_TRUHE3;
var int BUCHLABYRINTH_TRUHE4;

CONST STRING MOBNAME_LABYRINTHTRUHE			= "Schatztruhe";					//Kisten

FUNC VOID ENTER_EVT_OLDWORLDMONSTER ()
{
	if (OLDWOLRDThomas == FALSE)
	{
		Wld_PlayEffect("FX_EarthQuake",  hero, hero, 0, 0, 0, FALSE );
		Snd_Play 	("Ravens_Earthquake4" );

                 //****************************
                 // 	
                 //  Ehemaliges Lager der Waldleufer an der Küste

		Wld_InsertNpc (Schattenwark,"FP_ROAM_OLDWORLD_PUMALOCH_1");
		Wld_InsertNpc (Schattenwark,"FP_ROAM_OLDWORLD_PUMALOCH_2");
		Wld_InsertNpc (Schattenwark,"FP_ROAM_OLDWORLD_PUMALOCH_3");

                 //****************************
                 // 	Buchlabyrinth
                 // 

		/*Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_OLDWORLD_DUNGEON_1");
		Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_OLDWORLD_DUNGEON_2");
		Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_OLDWORLD_DUNGEON_3");
		Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_OLDWORLD_DUNGEON_4");
		Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_OLDWORLD_DUNGEON_5");

		Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_OLDWORLD_DUNGEON_6");
		Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_OLDWORLD_DUNGEON_7");
		Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_OLDWORLD_DUNGEON_8");
		Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_OLDWORLD_DUNGEON_9");
		Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_OLDWORLD_DUNGEON_10");
		Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_OLDWORLD_DUNGEON_11");
		Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_OLDWORLD_DUNGEON_12");*/

                /*Wld_InsertNpc (SKELETRazor,"FP_ROAM_OLDWORLD_SKELETRAZOR_1");
                Wld_InsertNpc (SKELETRazor,"FP_ROAM_OLDWORLD_SKELETRAZOR_2");
                Wld_InsertNpc (SKELETRazor,"FP_ROAM_OLDWORLD_SKELETRAZOR_3");
                Wld_InsertNpc (SKELETRazor,"FP_ROAM_OLDWORLD_SKELETRAZOR_4");
                Wld_InsertNpc (SKELETRazor,"FP_ROAM_OLDWORLD_SKELETRAZOR_5");*/  

                Wld_InsertNpc (Scavenger_Demon,"FP_ROAM_OLDWORLD_BURG_1");
                Wld_InsertNpc (Scavenger_Demon,"FP_ROAM_OLDWORLD_BURG_2");
                Wld_InsertNpc (Scavenger_Demon,"FP_ROAM_OLDWORLD_BURG_3");
                Wld_InsertNpc (Scavenger_Demon,"FP_ROAM_OLDWORLD_BURG_4");
                Wld_InsertNpc (Scavenger_Demon,"FP_ROAM_OLDWORLD_BURG_5");

                 //****************************
                 // 	
                 // Plato hinter Xardas Turm


                Wld_InsertNpc (Scavenger_Demon,"FP_ROAM_OLDWORLD_GRASPLATO_1");
                Wld_InsertNpc (Scavenger_Demon,"FP_ROAM_OLDWORLD_GRASPLATO_2");
                Wld_InsertNpc (Scavenger_Demon,"FP_ROAM_OLDWORLD_GRASPLATO_3");
                Wld_InsertNpc (Scavenger_Demon,"FP_ROAM_OLDWORLD_GRASPLATO_4");
                Wld_InsertNpc (Scavenger_Demon,"FP_ROAM_OLDWORLD_GRASPLATO_5");

                Wld_InsertNpc (Scavenger_Demon,"FP_ROAM_OLDWORLD_GRASPLATO_6");
                Wld_InsertNpc (Scavenger_Demon,"FP_ROAM_OLDWORLD_GRASPLATO_7");
                Wld_InsertNpc (Scavenger_Demon,"FP_ROAM_OLDWORLD_GRASPLATO_8");
                Wld_InsertNpc (Scavenger_Demon,"FP_ROAM_OLDWORLD_GRASPLATO_9");
                Wld_InsertNpc (Scavenger_Demon,"FP_ROAM_OLDWORLD_GRASPLATO_10");

                Wld_InsertNpc (Scavenger_Demon,"FP_ROAM_OLDWORLD_GRASPLATO_11");
                Wld_InsertNpc (Scavenger_Demon,"FP_ROAM_OLDWORLD_GRASPLATO_12");
                Wld_InsertNpc (Scavenger_Demon,"FP_ROAM_OLDWORLD_GRASPLATO_13");
                Wld_InsertNpc (Scavenger_Demon,"FP_ROAM_OLDWORLD_GRASPLATO_14");
                Wld_InsertNpc (Scavenger_Demon,"FP_ROAM_OLDWORLD_GRASPLATO_15");

                Wld_InsertNpc (Hauertroll,"FP_ROAM_OLDWORLD_GRASPLATOTROL_1");
                Wld_InsertNpc (Hauertroll,"FP_ROAM_OLDWORLD_GRASPLATOTROL_2");

                Wld_InsertNpc (Gobbo_Tugettso01,"FP_ROAM_OLDWORLD_GRASPLATO_100");
                Wld_InsertNpc (Gobbo_Tugettso02,"FP_ROAM_OLDWORLD_GRASPLATO_101");
                Wld_InsertNpc (Gobbo_Tugettso03,"FP_ROAM_OLDWORLD_GRASPLATO_102");
                Wld_InsertNpc (Gobbo_Tugettso04,"FP_ROAM_OLDWORLD_GRASPLATO_103");

                Wld_InsertNpc (Schattenwark,"FP_ROAM_OLDWORLD_GRASPLATO_104");

                Wld_InsertNpc (Shadowbeast,"FP_ROAM_OLDWORLD_GRASPLATOSHA_1");

               
//****************************
// 
//****************************Felsen überdem neeun Lager

                Wld_InsertNpc (Gobbo_Tugettso01,"FP_ROAM_OLDWORLD_NEUESLAGER_104");
                Wld_InsertNpc (Gobbo_Tugettso02,"FP_ROAM_OLDWORLD_NEUESLAGER_105");
                Wld_InsertNpc (Gobbo_Tugettso03,"FP_ROAM_OLDWORLD_NEUESLAGER_106");
                Wld_InsertNpc (Gobbo_Tugettso04,"FP_ROAM_OLDWORLD_NEUESLAGER_107");

                Wld_InsertNpc (Scavenger_Demon,"FP_ROAM_OLDWORLD_NEUESLAGER_108");
                Wld_InsertNpc (Scavenger_Demon,"FP_ROAM_OLDWORLD_NEUESLAGER_109");
                Wld_InsertNpc (Scavenger_Demon,"FP_ROAM_OLDWORLD_NEUESLAGER_1010");
                Wld_InsertNpc (Scavenger_Demon,"FP_ROAM_OLDWORLD_NEUESLAGER_1011");
                Wld_InsertNpc (Scavenger_Demon,"FP_ROAM_OLDWORLD_NEUESLAGER_1012");

                Wld_InsertNpc (Scavenger_Demon,"FP_ROAM_OLDWORLD_NEUESLAGER_1021");
                Wld_InsertNpc (Scavenger_Demon,"FP_ROAM_OLDWORLD_NEUESLAGER_1022");

                Wld_InsertNpc (Scavenger_Demon,"FP_ROAM_OLDWORLD_NEUESLAGER_1024");
                Wld_InsertNpc (Scavenger_Demon,"FP_ROAM_OLDWORLD_NEUESLAGER_1025");

                Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_OLDWORLD_NEUESLAGER_1015");
                Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_OLDWORLD_NEUESLAGER_1016");

                Wld_InsertNpc (Scavenger_Demon,"FP_ROAM_OLDWORLD_NEUESLAGER_1011");
                Wld_InsertNpc (Scavenger_Demon,"FP_ROAM_OLDWORLD_NEUESLAGER_1012");

               
//****************************
// 
//****************************Plato hinterder neuen Mine
// 
                 Wld_InsertNpc (Shadowbeast,"FP_ROAM_OLDWORLD_PLATOZURBURG_1");


//****************************
// 
//****************************Bei den Waldleufern
// 

               Wld_InsertNpc (Harpie,"FP_ROAM_OLDWORLD_HARPIENLOCH_1");
               Wld_InsertNpc (Harpie,"FP_ROAM_OLDWORLD_HARPIENLOCH_2");
               Wld_InsertNpc (Harpie,"FP_ROAM_OLDWORLD_HARPIENLOCH_3");
               Wld_InsertNpc (Harpie,"FP_ROAM_OLDWORLD_HARPIENLOCH_4");
               Wld_InsertNpc (Harpie,"FP_ROAM_OLDWORLD_HARPIENLOCH_5");
               Wld_InsertNpc (Harpie,"FP_ROAM_OLDWORLD_HARPIENLOCH_6");
               Wld_InsertNpc (Harpie,"FP_ROAM_OLDWORLD_HARPIENLOCH_7");
               Wld_InsertNpc (Harpie,"FP_ROAM_OLDWORLD_HARPIENLOCH_8");

                Wld_InsertNpc (Molerat,"FP_ROAM_OLDWORLD_ALTERWALD_1");
                Wld_InsertNpc (Molerat,"FP_ROAM_OLDWORLD_ALTERWALD_2");
                Wld_InsertNpc (Molerat,"FP_ROAM_OLDWORLD_ALTERWALD_3");

               Wld_InsertNpc (DemonLord,"FP_ROAM_OLDWORLD_ALTERWALD_6");

               Wld_InsertNpc (Shadowbeast_Skeleton,"FP_ROAM_OLDWORLD_ALTERWALD_7");

               Wld_InsertNpc (Keiler,"FP_ROAM_OLDWORLD_ALTERWALD_10");
               Wld_InsertNpc (Keiler,"FP_ROAM_OLDWORLD_ALTERWALD_11");

               Wld_InsertNpc (Keiler,"FP_ROAM_OLDWORLD_ALTERWALD_16");
               Wld_InsertNpc (Keiler,"FP_ROAM_OLDWORLD_ALTERWALD_17");

                Wld_InsertNpc (Scavenger,"FP_ROAM_OLDWORLD_ALTERWALDOBEN_1");
                Wld_InsertNpc (Scavenger,"FP_ROAM_OLDWORLD_ALTERWALDOBEN_2");
                Wld_InsertNpc (Scavenger,"FP_ROAM_OLDWORLD_ALTERWALDOBEN_3");

                Wld_InsertNpc (Razor,"FP_ROAM_OLDWORLD_ALTERWALDOBEN_4");

                Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_OLDWORLD_ALTERWALDOBEN_5");
                Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_OLDWORLD_ALTERWALDOBEN_6"); 
                Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_OLDWORLD_ALTERWALDOBEN_7");
                Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_OLDWORLD_ALTERWALDOBEN_8");
                Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_OLDWORLD_ALTERWALDOBEN_9");
                Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_OLDWORLD_ALTERWALDOBEN_10");
                Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_OLDWORLD_ALTERWALDOBEN_11");
                Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_OLDWORLD_ALTERWALDOBEN_12");

		OLDWOLRDThomas = TRUE;
	};	
};

/********************************************************************************/
/*************************Die Tore im Buchlabyrinth ****************************************/

FUNC VOID EVT_BUCHLABYRINTH_SCHALTER1 ()
{
	if (BUCHLABYRINTH_SCHALTER1 == FALSE)
	{
		Wld_SendTrigger	("TOR1");
             
		Snd_Play 	("MYSTERY_03");

                Wld_InsertNpc (ZombieRandom_Lib,"FP_ROAM_OLDWORLD_SKELETRAZOR_7");

		BUCHLABYRINTH_SCHALTER1 = TRUE;
	};
};

FUNC VOID EVT_BUCHLABYRINTH_SCHALTER2 ()
{
	if (BUCHLABYRINTH_SCHALTER2 == FALSE)
	{
		Wld_SendTrigger	("TOR2");
		Snd_Play 	("MYSTERY_03");

                Wld_InsertNpc (Spider_Lib,"FP_ROAM_OLDWORLD_SKELETRAZOR_9");

		BUCHLABYRINTH_SCHALTER2 = TRUE;
	};
};

FUNC VOID EVT_BUCHLABYRINTH_SCHALTER3 ()
{
	if (BUCHLABYRINTH_SCHALTER3 == FALSE)
	{
		Wld_SendTrigger	("TOR3_1");
		Wld_SendTrigger	("TOR3_2");

		Wld_SendTrigger	("TOR32");
		Snd_Play 	("MYSTERY_03");

                Wld_InsertNpc (ZombieRandom_Lib,"FP_ROAM_OLDWORLD_SKELETRAZOR_13");

		BUCHLABYRINTH_SCHALTER3 = TRUE;
	};
};

FUNC VOID EVT_BUCHLABYRINTH_SCHALTER4 ()
{
	if (BUCHLABYRINTH_SCHALTER4 == FALSE)
	{
		Wld_SendTrigger	("TOR4");
		Snd_Play 	("MYSTERY_03");

                Wld_InsertNpc (ZombieRandom_Lib,"FP_ROAM_OLDWORLD_SKELETRAZOR_14");
                Wld_InsertNpc (Spider_Lib,"FP_ROAM_OLDWORLD_SKELETRAZOR_17");

		BUCHLABYRINTH_SCHALTER4 = TRUE;
	};
};


/********************************************************************************/
/*************************Truhen im Labyrinth ****************************************/

FUNC VOID EVT_BUCHLABYRINTH_TRUHE1_S1 ()
{
	if (BUCHLABYRINTH_TRUHE1 == FALSE)
	{
		Snd_Play 	(" MYSTERY_03" );
             
                Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_OLDWORLD_SKELETRAZOR_18");
                Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_OLDWORLD_SKELETRAZOR_19");
                Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_OLDWORLD_SKELETRAZOR_20");
                Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_OLDWORLD_SKELETRAZOR_21");


		BUCHLABYRINTH_TRUHE1 = TRUE;
	};
};


FUNC VOID EVT_BUCHLABYRINTH_TRUHE2_S1 ()
{
	if (BUCHLABYRINTH_TRUHE2 == FALSE)
	{
		Snd_Play 	(" MYSTERY_03" );
             
                Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_OLDWORLD_SKELETRAZOR_38");
                Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_OLDWORLD_SKELETRAZOR_39");
                Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_OLDWORLD_SKELETRAZOR_40");
                Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_OLDWORLD_SKELETRAZOR_41");
                Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_OLDWORLD_SKELETRAZOR_42");
                Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_OLDWORLD_SKELETRAZOR_43");

		BUCHLABYRINTH_TRUHE2 = TRUE;
	};
};



FUNC VOID EVT_BUCHLABYRINTH_TRUHE3_S1 ()
{
	if (BUCHLABYRINTH_TRUHE3 == FALSE)
	{
		Snd_Play 	(" MYSTERY_03" );
             
                Wld_InsertNpc (Skeleton_Lord,"FP_ROAM_OLDWORLD_SKELETRAZOR_44");
                Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_OLDWORLD_SKELETRAZOR_45");
                Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_OLDWORLD_SKELETRAZOR_46");
                Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_OLDWORLD_SKELETRAZOR_47");

		BUCHLABYRINTH_TRUHE3 = TRUE;
	};
};



FUNC VOID EVT_BUCHLABYRINTH_TRUHE4_S1 ()
{
	if (BUCHLABYRINTH_TRUHE4 == FALSE)
	{
		Snd_Play 	("MYSTERY_03");
             
                Wld_InsertNpc (Skeleton_Lord,"FP_ROAM_OLDWORLD_SKELETRAZOR_48");
                Wld_InsertNpc (Skeleton_Lord,"FP_ROAM_OLDWORLD_SKELETRAZOR_49");
                Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_OLDWORLD_SKELETRAZOR_50");
                Wld_InsertNpc (Gobbo_Skeleton,"FP_ROAM_OLDWORLD_SKELETRAZOR_51");

		BUCHLABYRINTH_TRUHE4 = TRUE;
	};
};

FUNC VOID EVT_FOKUS_TROLL ()
{
	if (Kapitel == 2)
	{
		Wld_SpawnNpcRange(hero, Gobbo_Warrior_Weg, 5, 500);

		B_LogEntry	(TOPIC_MOD_FOKUSSUCHE, "Nanu? Anscheinend war eine Gruppe Goblins ebenfalls hinter dem Fokusstein im Norden her. Was könnten die damit vorhaben?");
	};
};

/********************************************************************************/
/*************************Tiere und neue Monster****************************************/



func void Set_SKELETRazor_Visuals()
{
	Mdl_SetVisual			(self,	"Razor.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"RAZSKELET_BODY",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};


INSTANCE SKELETRazor (Mst_Default_Razor)
{
	name = "Dino-Skelett";

	Set_SKELETRazor_Visuals();
	Npc_SetToFistMode(self);
};


func void B_SetVisuals_Schattenwark()
{
	Mdl_SetVisual			(self,"StonePuma.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"SHAWARK_BODY",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

INSTANCE Schattenwark	(Mst_Default_StonePuma)
{
	B_SetVisuals_Schattenwark();
	Npc_SetToFistMode(self);

	CreateInvItems	(self, ItFo_MuttonRaw, 2);


	//----- Monster ----
	name							=	"Schattenwarg";
	guild							=	GIL_Gargoyle;
	aivar[AIV_MM_REAL_ID]			= 	ID_Gargoyle;
	level							=	20;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	400;
	attribute	[ATR_DEXTERITY]		=	400;
	attribute	[ATR_HITPOINTS_MAX]	=	800;
	attribute	[ATR_HITPOINTS]		=	800;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	100000;
	protection	[PROT_EDGE]			=	100000;
	protection	[PROT_POINT]		=	100000;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	50;
};

INSTANCE Schattenwark_XW_01	(Mst_Default_StonePuma)
{
	B_SetVisuals_Schattenwark();
	Npc_SetToFistMode(self);

	CreateInvItems	(self, ItFo_MuttonRaw, 2);

	//----- Monster ----
	name							=	"Schattenwarg";
	guild							=	GIL_Gargoyle;
	aivar[AIV_MM_REAL_ID]			= 	ID_Gargoyle;
	level							=	20;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	400;
	attribute	[ATR_DEXTERITY]		=	400;
	attribute	[ATR_HITPOINTS_MAX]	=	800;
	attribute	[ATR_HITPOINTS]		=	800;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	100000;
	protection	[PROT_EDGE]			=	100000;
	protection	[PROT_POINT]		=	100000;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	50;

	start_aistate	= ZS_MM_Rtn_XWArena;
};

INSTANCE Schattenwark_XW_02	(Mst_Default_StonePuma)
{
	B_SetVisuals_Schattenwark();
	Npc_SetToFistMode(self);

	CreateInvItems	(self, ItFo_MuttonRaw, 2);

	//----- Monster ----
	name							=	"Schattenwarg";
	guild							=	GIL_Gargoyle;
	aivar[AIV_MM_REAL_ID]			= 	ID_Gargoyle;
	level							=	20;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	400;
	attribute	[ATR_DEXTERITY]		=	400;
	attribute	[ATR_HITPOINTS_MAX]	=	800;
	attribute	[ATR_HITPOINTS]		=	800;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	100000;
	protection	[PROT_EDGE]			=	100000;
	protection	[PROT_POINT]		=	100000;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	50;

	start_aistate	= ZS_MM_Rtn_XWArena;
};

INSTANCE Schattenwark_XW_03	(Mst_Default_StonePuma)
{
	B_SetVisuals_Schattenwark();
	Npc_SetToFistMode(self);

	CreateInvItems	(self, ItFo_MuttonRaw, 2);

	//----- Monster ----
	name							=	"Schattenwarg";
	guild							=	GIL_Gargoyle;
	aivar[AIV_MM_REAL_ID]			= 	ID_Gargoyle;
	level							=	20;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	400;
	attribute	[ATR_DEXTERITY]		=	400;
	attribute	[ATR_HITPOINTS_MAX]	=	800;
	attribute	[ATR_HITPOINTS]		=	800;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	100000;
	protection	[PROT_EDGE]			=	100000;
	protection	[PROT_POINT]		=	100000;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	50;

	start_aistate	= ZS_MM_Rtn_XWArena;
};

INSTANCE Schattenwark_XW_04	(Mst_Default_StonePuma)
{
	B_SetVisuals_Schattenwark();
	Npc_SetToFistMode(self);

	CreateInvItems	(self, ItFo_MuttonRaw, 2);

	//----- Monster ----
	name							=	"Schattenwarg";
	guild							=	GIL_Gargoyle;
	aivar[AIV_MM_REAL_ID]			= 	ID_Gargoyle;
	level							=	20;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	400;
	attribute	[ATR_DEXTERITY]		=	400;
	attribute	[ATR_HITPOINTS_MAX]	=	800;
	attribute	[ATR_HITPOINTS]		=	800;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	100000;
	protection	[PROT_EDGE]			=	100000;
	protection	[PROT_POINT]		=	100000;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	50;

	start_aistate	= ZS_MM_Rtn_XWArena;
};

INSTANCE Schattenwark_XW_05	(Mst_Default_StonePuma)
{
	B_SetVisuals_Schattenwark();
	Npc_SetToFistMode(self);

	CreateInvItems	(self, ItFo_MuttonRaw, 2);

	//----- Monster ----
	name							=	"Schattenwarg";
	guild							=	GIL_Gargoyle;
	aivar[AIV_MM_REAL_ID]			= 	ID_Gargoyle;
	level							=	20;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	400;
	attribute	[ATR_DEXTERITY]		=	400;
	attribute	[ATR_HITPOINTS_MAX]	=	800;
	attribute	[ATR_HITPOINTS]		=	800;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	100000;
	protection	[PROT_EDGE]			=	100000;
	protection	[PROT_POINT]		=	100000;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	50;

	start_aistate	= ZS_MM_Rtn_XWArena;
};

INSTANCE Schattenwark_XW_06	(Mst_Default_StonePuma)
{
	B_SetVisuals_Schattenwark();
	Npc_SetToFistMode(self);

	CreateInvItems	(self, ItFo_MuttonRaw, 2);

	//----- Monster ----
	name							=	"Schattenwarg";
	guild							=	GIL_Gargoyle;
	aivar[AIV_MM_REAL_ID]			= 	ID_Gargoyle;
	level							=	20;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	400;
	attribute	[ATR_DEXTERITY]		=	400;
	attribute	[ATR_HITPOINTS_MAX]	=	800;
	attribute	[ATR_HITPOINTS]		=	800;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	100000;
	protection	[PROT_EDGE]			=	100000;
	protection	[PROT_POINT]		=	100000;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	50;

	start_aistate	= ZS_MM_Rtn_XWArena;
};

INSTANCE Schattenwark_XW_07	(Mst_Default_StonePuma)
{
	B_SetVisuals_Schattenwark();
	Npc_SetToFistMode(self);

	CreateInvItems	(self, ItFo_MuttonRaw, 2);

	//----- Monster ----
	name							=	"Schattenwarg";
	guild							=	GIL_Gargoyle;
	aivar[AIV_MM_REAL_ID]			= 	ID_Gargoyle;
	level							=	20;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	400;
	attribute	[ATR_DEXTERITY]		=	400;
	attribute	[ATR_HITPOINTS_MAX]	=	800;
	attribute	[ATR_HITPOINTS]		=	800;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	100000;
	protection	[PROT_EDGE]			=	100000;
	protection	[PROT_POINT]		=	100000;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	50;

	start_aistate	= ZS_MM_Rtn_XWArena;
};

INSTANCE Schattenwark_XW_08	(Mst_Default_StonePuma)
{
	B_SetVisuals_Schattenwark();
	Npc_SetToFistMode(self);

	CreateInvItems	(self, ItFo_MuttonRaw, 2);

	//----- Monster ----
	name							=	"Schattenwarg";
	guild							=	GIL_Gargoyle;
	aivar[AIV_MM_REAL_ID]			= 	ID_Gargoyle;
	level							=	20;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	400;
	attribute	[ATR_DEXTERITY]		=	400;
	attribute	[ATR_HITPOINTS_MAX]	=	800;
	attribute	[ATR_HITPOINTS]		=	800;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	100000;
	protection	[PROT_EDGE]			=	100000;
	protection	[PROT_POINT]		=	100000;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	50;

	start_aistate	= ZS_MM_Rtn_XWArena;
};

INSTANCE Schattenwark_XW_09	(Mst_Default_StonePuma)
{
	B_SetVisuals_Schattenwark();
	Npc_SetToFistMode(self);

	CreateInvItems	(self, ItFo_MuttonRaw, 2);

	//----- Monster ----
	name							=	"Schattenwarg";
	guild							=	GIL_Gargoyle;
	aivar[AIV_MM_REAL_ID]			= 	ID_Gargoyle;
	level							=	20;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	400;
	attribute	[ATR_DEXTERITY]		=	400;
	attribute	[ATR_HITPOINTS_MAX]	=	800;
	attribute	[ATR_HITPOINTS]		=	800;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	100000;
	protection	[PROT_EDGE]			=	100000;
	protection	[PROT_POINT]		=	100000;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	50;

	start_aistate	= ZS_MM_Rtn_XWArena;
};

INSTANCE Schattenwark_XW_10	(Mst_Default_StonePuma)
{
	B_SetVisuals_Schattenwark();
	Npc_SetToFistMode(self);

	CreateInvItems	(self, ItFo_MuttonRaw, 2);

	//----- Monster ----
	name							=	"Schattenwarg";
	guild							=	GIL_Gargoyle;
	aivar[AIV_MM_REAL_ID]			= 	ID_Gargoyle;
	level							=	20;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	400;
	attribute	[ATR_DEXTERITY]		=	400;
	attribute	[ATR_HITPOINTS_MAX]	=	800;
	attribute	[ATR_HITPOINTS]		=	800;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	100000;
	protection	[PROT_EDGE]			=	100000;
	protection	[PROT_POINT]		=	100000;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	50;

	start_aistate	= ZS_MM_Rtn_XWArena;
};

INSTANCE Schattenwark_XW_11	(Mst_Default_StonePuma)
{
	B_SetVisuals_Schattenwark();
	Npc_SetToFistMode(self);

	CreateInvItems	(self, ItFo_MuttonRaw, 2);

	//----- Monster ----
	name							=	"Schattenwarg";
	guild							=	GIL_Gargoyle;
	aivar[AIV_MM_REAL_ID]			= 	ID_Gargoyle;
	level							=	20;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	400;
	attribute	[ATR_DEXTERITY]		=	400;
	attribute	[ATR_HITPOINTS_MAX]	=	800;
	attribute	[ATR_HITPOINTS]		=	800;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	100000;
	protection	[PROT_EDGE]			=	100000;
	protection	[PROT_POINT]		=	100000;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	50;

	start_aistate	= ZS_MM_Rtn_XWArena;
};

INSTANCE Schattenwark_XW_12	(Mst_Default_StonePuma)
{
	B_SetVisuals_Schattenwark();
	Npc_SetToFistMode(self);

	CreateInvItems	(self, ItFo_MuttonRaw, 2);

	//----- Monster ----
	name							=	"Schattenwarg";
	guild							=	GIL_Gargoyle;
	aivar[AIV_MM_REAL_ID]			= 	ID_Gargoyle;
	level							=	20;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	400;
	attribute	[ATR_DEXTERITY]		=	400;
	attribute	[ATR_HITPOINTS_MAX]	=	800;
	attribute	[ATR_HITPOINTS]		=	800;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protections ----
	protection	[PROT_BLUNT]		=	100000;
	protection	[PROT_EDGE]			=	100000;
	protection	[PROT_POINT]		=	100000;
	protection	[PROT_FIRE]			=	75;
	protection	[PROT_FLY]			=	0;
	protection	[PROT_MAGIC]		=	50;

	start_aistate	= ZS_MM_Rtn_XWArena;
};


//***********
//	Hauertroll 
//***********

func void B_SetVisuals_Hauertroll()
{
	Mdl_SetVisual			(self,	"Troll.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Hauertroll_body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

//***********
//	Troll    
//***********
INSTANCE Hauertroll	(Mst_Default_Troll)
{
	name							=	"Hauertroll";
	guild							=	GIL_TROLL;
	aivar[AIV_MM_REAL_ID]			= 	ID_TROLL;
	level							=	50; //30
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	350;	//FlyDamage
	attribute	[ATR_DEXTERITY]		=	300;
	attribute	[ATR_HITPOINTS_MAX]	=	1000;
	attribute	[ATR_HITPOINTS]		=	1000;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	180000;
	protection	[PROT_EDGE]			=	180000;
	protection	[PROT_POINT]		=	IMMUNE;	
	protection	[PROT_FIRE]			=	125;
	protection	[PROT_FLY]			=	IMMUNE;
	protection	[PROT_MAGIC]		=	125;




	Mdl_SetModelScale(self, 1.1, 1.1, 1.1);

	B_SetVisuals_Hauertroll();
	Npc_SetToFistMode(self);
};

INSTANCE Hauertroll_XW_01	(Mst_Default_Troll)
{
	name							=	"Hauertroll";
	guild							=	GIL_TROLL;
	aivar[AIV_MM_REAL_ID]			= 	ID_TROLL;
	level							=	50; //30
	flags = 2;
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	350;	//FlyDamage
	attribute	[ATR_DEXTERITY]		=	300;
	attribute	[ATR_HITPOINTS_MAX]	=	1000;
	attribute	[ATR_HITPOINTS]		=	1000;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	180000;
	protection	[PROT_EDGE]			=	180000;
	protection	[PROT_POINT]		=	IMMUNE;	
	protection	[PROT_FIRE]			=	125;
	protection	[PROT_FLY]			=	IMMUNE;
	protection	[PROT_MAGIC]		=	125;

	Mdl_SetModelScale(self, 1.1, 1.1, 1.1);

	B_SetVisuals_Hauertroll();
	Npc_SetToFistMode(self);
};

INSTANCE Hauertroll_XW_02	(Mst_Default_Troll)
{
	name							=	"Hauertroll";
	guild							=	GIL_TROLL;
	aivar[AIV_MM_REAL_ID]			= 	ID_TROLL;
	level							=	50; //30
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	350;	//FlyDamage
	attribute	[ATR_DEXTERITY]		=	300;
	attribute	[ATR_HITPOINTS_MAX]	=	1000;
	attribute	[ATR_HITPOINTS]		=	1000;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	180000;
	protection	[PROT_EDGE]			=	180000;
	protection	[PROT_POINT]		=	IMMUNE;	
	protection	[PROT_FIRE]			=	125;
	protection	[PROT_FLY]			=	IMMUNE;
	protection	[PROT_MAGIC]		=	125;

	Mdl_SetModelScale(self, 1.1, 1.1, 1.1);

	B_SetVisuals_Hauertroll();
	Npc_SetToFistMode(self);

	start_aistate	= ZS_MM_Rtn_XWArena;
};

INSTANCE Hauertroll_XW_03	(Mst_Default_Troll)
{
	name							=	"Hauertroll";
	guild							=	GIL_TROLL;
	aivar[AIV_MM_REAL_ID]			= 	ID_TROLL;
	level							=	50; //30
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	350;	//FlyDamage
	attribute	[ATR_DEXTERITY]		=	300;
	attribute	[ATR_HITPOINTS_MAX]	=	1000;
	attribute	[ATR_HITPOINTS]		=	1000;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	180000;
	protection	[PROT_EDGE]			=	180000;
	protection	[PROT_POINT]		=	IMMUNE;	
	protection	[PROT_FIRE]			=	125;
	protection	[PROT_FLY]			=	IMMUNE;
	protection	[PROT_MAGIC]		=	125;

	Mdl_SetModelScale(self, 1.1, 1.1, 1.1);

	B_SetVisuals_Hauertroll();
	Npc_SetToFistMode(self);

	start_aistate	= ZS_MM_Rtn_XWArena;
};

INSTANCE Hauertroll_XW_04	(Mst_Default_Troll)
{
	name							=	"Hauertroll";
	guild							=	GIL_TROLL;
	aivar[AIV_MM_REAL_ID]			= 	ID_TROLL;
	level							=	50; //30
	
	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	350;	//FlyDamage
	attribute	[ATR_DEXTERITY]		=	300;
	attribute	[ATR_HITPOINTS_MAX]	=	1000;
	attribute	[ATR_HITPOINTS]		=	1000;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;
	
	//----- Protections ----	
	protection	[PROT_BLUNT]		=	180000;
	protection	[PROT_EDGE]			=	180000;
	protection	[PROT_POINT]		=	IMMUNE;	
	protection	[PROT_FIRE]			=	125;
	protection	[PROT_FLY]			=	IMMUNE;
	protection	[PROT_MAGIC]		=	125;

	Mdl_SetModelScale(self, 1.1, 1.1, 1.1);

	B_SetVisuals_Hauertroll();
	Npc_SetToFistMode(self);

	start_aistate	= ZS_MM_Rtn_XWArena;
};