//*****************************************************************************
//			Scrolls
//*****************************************************************************

// Paladin Scrolls
const 	string Name_PaladinScroll		=	"Paladin Zauber"; 	
const	int	Value_Sc_PalLight			=	50;
const	int	Value_Sc_PalLightHeal		=	100;
const	int	Value_Sc_PalHolyBolt		=	200;
const	int	Value_Sc_PalMediumHeal		=	400;
const	int	Value_Sc_PalRepelEvil		=	600;
const	int	Value_Sc_PalFullHeal		=	800;
const	int	Value_Sc_PalDestroyEvil		=	1000;

// Magier Scrolls
const int 	Value_Sc_Light				=  	10;
const int 	Value_Sc_Sprint				=  	10;			
const int 	Value_Sc_Firebolt			=	25;
const int 	Value_Sc_Charm				=   100;
const int 	Value_Sc_Icebolt			=	25;	
const int 	Value_Sc_LightHeal			=	25;
const int 	Value_Sc_SumGobSkel			=  	75;
const int 	Value_Sc_InstantFireball	=	50;
	
const int 	Value_Sc_Zap				=	60;
const int 	Value_Sc_SumWolf			=	75;
const int 	Value_Sc_Windfist			=	60;
const int 	Value_Sc_Sleep				=	100;
const int 	Value_Sc_MediumHeal			=	60;
const int 	Value_Sc_LightningFlash		=	125;
const int 	Value_Sc_ChargeFireball		=	60;
const int 	Value_Sc_SumSkel			=	75;
const int 	Value_Sc_Fear				=	75;
const int 	Value_Sc_IceCube			=	100;

const int 	Value_Sc_ThunderBall		=	75;
const int 	Value_Sc_SumGol				=	150;
const int 	Value_Sc_HarmUndead			=	75;
const int 	Value_Sc_Pyrokinesis		=	150;

const int 	Value_Sc_Firestorm			=	100;
const int 	Value_Sc_IceWave			=	200;
const int 	Value_Sc_SumDemon			=	200;
const int 	Value_Sc_FullHeal			=	200;

const int 	Value_Sc_Firerain			=	250;
const int 	Value_Sc_BreathOfDeath		=	250;
const int 	Value_Sc_MassDeath			=	250;
const int 	Value_Sc_ArmyOfDarkness		=	250;
const int 	Value_Sc_Shrink				=	250;
const int 	Value_Sc_HolyWave				=	250;
const int 	Value_Sc_HolyRain				=	250;
const int 	Value_Sc_FireWave				=	250;

const int 	Value_Sc_TrfAll		=	500;

/*******************************************************************************************/
// 			Paladin Scrolls 
/*******************************************************************************************/
INSTANCE ItSc_PalLight (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_PalLight;

	visual				=	"ItSc_PalLight.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_PalLight;
	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_PalLight;
	
	TEXT	[0]			=	Name_PaladinScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Duration;		
	COUNT	[2]			=	SPL_Duration_PalLIGHT;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};

INSTANCE ItSc_soulsplit (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	20;

	visual				=	"itmi_darkpearl.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_soulsplit;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_RED";

	description			=	NAME_SPL_Soulsplit;
	
	TEXT	[0]			=	"Spaltet den Körper von der Seele"	;
	
	TEXT	[1]			=	NAME_Manakosten;		
	COUNT	[1]			=	SPL_Cost_scroll;
	
	
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

INSTANCE ItSc_Poison (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	20;

	visual				=	"itmi_darkpearl.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_Poison;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_RED";

	description			=	"Vergiftung";
	
	TEXT	[1]			=	NAME_Manakosten;		
	COUNT	[1]			=	SPL_Cost_scroll;
	
	
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

INSTANCE ItSc_ZiegeZaehmen (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	20;

	visual				=	"itmi_darkpearl.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_ZiegeZaehmen;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_RED";

	description			=	"Ziege zähmen";
	
	TEXT	[1]			=	NAME_Manakosten;		
	COUNT	[1]			=	SPL_Cost_scroll;
	
	
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

INSTANCE ItSc_Telekinese (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	20;

	visual				=	"itmi_darkpearl.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_Telekinese;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_RED";

	description			=	"Telekinese";
	
	TEXT	[1]			=	NAME_Manakosten;		
	COUNT	[1]			=	SPL_Cost_scroll;
	
	
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

INSTANCE ItSc_engel (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	20;

	visual				=	"ItRu_PalFullHeal.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_engel;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_WHITE";

	description			=	NAME_SPL_engel;
	
	TEXT	[0]			=	"Ruft einen Engel";
	
	TEXT	[1]			=	NAME_Manakosten;		
	COUNT	[1]			=	SPL_Cost_scroll;
	
	
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_PalLightHeal (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_PalLightHeal;

	visual				=	"ItSc_PalLightHeal.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_PalLightHeal;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_PalLightHeal;
	
	TEXT	[0]			=	Name_PaladinScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_HealingPerCast;		
	COUNT	[2]			=	SPL_Heal_PalLightHeal;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_PalHolyBolt (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_PalHolyBolt;

	visual				=	"ItSc_PalHolyBolt.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_PalHolyBolt;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";


	description			=	NAME_SPL_PalHolyBolt;
	
	TEXT	[0]			=	Name_PaladinScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Dam_Magic;			
	COUNT	[2]			=	SPL_DAMAGE_PalHolyBolt;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};

INSTANCE ItSc_Geisterspell (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;


	visual				=	"ItSc_PalHolyBolt.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_Geisterspell;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	0;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";


	description			=	"Geister-Einfang-Spruch";
	
		
};

INSTANCE ItSc_Earthquake (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_PalHolyBolt;

	visual				=	"ItSc_PalHolyBolt.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_EarthquakeNew;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";


	description			=	NAME_SPL_EarthquakeNew;
	
	
	TEXT	[1]			=	NAME_Mana_needed;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Dam_Magic;			
	COUNT	[2]			=	SPL_Damage_EarthquakeNew;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_PalMediumHeal (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_PalMediumHeal;

	visual				=	"ItSc_PalMediumHeal.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_PalMediumHeal;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_PalMediumHeal;
	
	TEXT	[0]			=	Name_PaladinScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_HealingPerCast;		
	COUNT	[2]			=	SPL_Heal_PalMediumHeal;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_PalRepelEvil (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_PalRepelEvil;

	visual				=	"ItSc_PalRepelEvil.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_PalRepelEvil;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_PalRepelEvil;
	TEXT	[0]			=	Name_PaladinScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Dam_Magic;				
	COUNT	[2]			=	SPL_DAMAGE_PalRepelEvil;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_PalFullHeal (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_PalFullHeal;

	visual				=	"ItSc_PalFullHeal.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_PalFullHeal;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_PalFullHeal;		
	TEXT	[0]			=	Name_PaladinScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_HealingPerCast;		
	COUNT	[2]			=	SPL_Heal_PalFullHeal;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_PalDestroyEvil (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_PalDestroyEvil;

	visual				=	"ItSc_PalDestroyEvil.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_PalDestroyEvil;
	cond_atr[2]   			=	ATR_MANA_MAX;
	cond_value[2]  			=	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_PalDestroyEvil;
	TEXT	[0]			=	Name_PaladinScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Dam_Magic;				
	COUNT	[2]			=	SPL_DAMAGE_PalDestroyEvil;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

/*******************************************************************************************/
// 			Magier Scrolls 
/*******************************************************************************************/
instance ItSc_Light (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Light;

	visual				=	"ItSc_Light.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_LIGHT;
	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_LIGHT;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Duration;		
	COUNT	[2]			=	SPL_Duration_LIGHT;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};

instance ItSc_Nebel (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Light;

	visual				=	"ItSc_Nebel.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_NEBEL;
	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Nebel";
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};

instance ItSc_AuraBerserker (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Light;

	visual				=	"ItSc_Aura.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_AURABERSERKER;
	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Aura des Berserkers";
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Duration;		
	COUNT	[2]			=	SPL_Duration_LIGHT;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};

instance ItSc_AuraFrost (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Light;

	visual				=	"ItSc_Aura.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_AURAFROST;
	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Aura des Frostes";
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Sec_Duration;		
	COUNT	[2]			=	30;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};

instance ItSc_AuraFeuer (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Light;

	visual				=	"ItSc_Aura.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_AURAFEUER;
	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Aura des Verbrennens";
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Sec_Duration;		
	COUNT	[2]			=	30;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};

instance ItSc_AuraFlammen (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Light;

	visual				=	"ItSc_Aura.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_AURAFLAMMEN;
	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Aura der Flammen";
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Sec_Duration;		
	COUNT	[2]			=	30;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};

instance ItSc_AuraHeilung (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Light;

	visual				=	"ItSc_Aura.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_AURAHEILUNG;
	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Aura der Heilung";
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Sec_Duration;		
	COUNT	[2]			=	30;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};

instance ItSc_AuraDesStehlens (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Light;

	visual				=	"ItSc_Aura.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_AURADESSTEHLENS;
	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Aura des Stehlens";
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};

instance ItSc_Unsichtbarkeit (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Light;

	visual				=	"ItSc_Unsichtbarkeit.3DS";
	material			=	MAT_LEATHER;

	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	spell				= 	SPL_UNSICHTBARKEIT;
	
	description			=	NAME_SPL_UNSICHTBARKEIT;
	
	TEXT	[1]			=	NAME_Manakosten;		
	COUNT	[1]			=	SPL_COST_UNSICHTBARKEIT;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};

instance ItSc_Schwaechen (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Light;

	visual				=	"ItSc_Schwaechen.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_SCHWAECHEN;
	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_SCHWAECHEN;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};

instance ItSc_Sprint (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Sprint;

	visual				=	"ItSc_Fear.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_Sprint;
	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_Sprint;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Duration;		
	COUNT	[2]			=	SPL_Time_Sprint/60000;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};
instance ItSc_ManaEntzug (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Light;

	visual				=	"ItSc_Light.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_ManaEntzug;
	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_ManaEntzug;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_Firebolt (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Firebolt;

	visual				=	"ItSc_Firebolt.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_FIREBOLT;
	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_Firebolt;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Dam_Magic;			
	COUNT	[2]			=	SPL_DAMAGE_FIREBOLT;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_Fackel (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Firebolt;

	visual				=	"ItSc_Firebolt.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_FACKEL;
	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Fackeln an/aus";
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	"Entzündet und löscht Fackeln";		
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_Icebolt (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Icebolt;

	visual				=	"ItSc_Icebolt.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_Icebolt;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_BLUE";

	description			=	NAME_SPL_Icebolt;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Dam_Magic;				
	COUNT	[2]			=	SPL_DAMAGE_Icebolt;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_Icebolt_Fake (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Icebolt/2;

	visual				=	"ItSc_Icebolt.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_Icebolt;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_BLUE";

	description			=	NAME_SPL_Icebolt;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Dam_Magic;				
	COUNT	[2]			=	SPL_DAMAGE_Icebolt;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_LightHeal (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_LightHeal;

	visual				=	"ItSc_LightHeal.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_LightHeal;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_LightHeal;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_HealingPerCast;		
	COUNT	[2]			=	SPL_Heal_LightHeal;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

/*******************************************************************************************/
INSTANCE ItSc_SumGobSkel (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_SumGobSkel;

	visual				=	"ItSc_SumGobSkel.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_SummonGoblinSkeleton;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_SummonGoblinSkeleton / 2;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_SummonGoblinSkeleton;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_SummonGoblinSkeleton / 2;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

/*******************************************************************************************/
INSTANCE ItSc_SumCrawler (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_SumGobSkel;

	visual				=	"ItSc_SummonCrawler.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_SummonCrawler;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_SummonCrawler / 2;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Minecrawler rufen";
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_SummonCrawler / 2;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

/*******************************************************************************************/
INSTANCE ItSc_SumGobKrieger (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_SumGobSkel;

	visual				=	"ItSc_SumGobSkel.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_SummonGoblinKrieger;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_SummonGoblinKrieger / 2;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_SummonGoblinKrieger;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_SummonGoblinKrieger / 2;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

/*******************************************************************************************/
INSTANCE ItSc_SumGobEis (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_SumGobSkel;

	visual				=	"ItSc_SumGobSkel.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_SummonEisGoblin;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_SummonEisgoblin / 2;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_SummonEisGoblin;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_SummonEisgoblin / 2;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_InstantFireball (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_InstantFireball;

	visual				=	"ItSc_InstantFireball.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_InstantFireball;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_YELLOW";

	description			= 	NAME_SPL_InstantFireball;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;							
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Dam_Magic;	
	COUNT	[2]			=	SPL_DAMAGE_InstantFireball;
	
	TEXT	[5]			=	NAME_Value;									
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_InstantIceball (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_InstantFireball;

	visual				=	"ItSc_InstantFireball.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_InstantIceball;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_YELLOW";

	description			= 	NAME_SPL_InstantIceball;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;							
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Dam_Magic;	
	COUNT	[2]			=	SPL_DAMAGE_InstantIceball;
	
	TEXT	[5]			=	NAME_Value;									
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_Zap (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Zap;

	visual				=	"ItSc_Zap.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_Zap;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_Zap;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Dam_Magic;			
	COUNT	[2]			=	SPL_DAMAGE_ZAP;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_SumWolf (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_SumWolf;

	visual				=	"ItSc_SumWolf.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_SummonWolf;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_SummonWolf / 2;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_SummonWolf;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_SummonWolf / 2;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_SumRabbit (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_SumWolf;

	visual				=	"ItSc_SummonRabbit.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_SummonRabbit;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_SummonRabbit / 2;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_SummonRabbit;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_SummonRabbit / 2;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_SummonRats (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_SumWolf;

	visual				=	"ItSc_SummonRat.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_SummonRats;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_SummonRats / 2;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_SummonRats;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_SummonRats / 2;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_Windfist (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Windfist;

	visual				=	"ItSc_Windfist.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_WINDFIST;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	STEP_WINDFIST;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_WINDFIST;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_MinManakosten;							
	COUNT	[1]			=	STEP_WindFist;
	
	TEXT	[2]			=	NAME_ManakostenMax;							
	COUNT	[2]			=	SPL_COST_WINDFIST;
	
	TEXT	[3]			=	NAME_Addon_Damage_Min;
	count 	[3]			=   SPL_Damage_Windfist;
	
	TEXT	[4]			=	NAME_Damage_Max;
	COUNT	[4]			=	(SPL_Damage_Windfist*4);
	
	TEXT	[5]			=	NAME_Value;									
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_TeleportBergwelt (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Windfist;

	visual				=	"ItSc_Teleport.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_TELEPORTBERGWELT;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Teleport";
	
	TEXT	[0]			=	"Nur ein mächtiger Krieger sollte ihn benutzen";
	
	TEXT	[5]			=	NAME_Value;									
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_ArgezToSaturas (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Windfist;

	visual				=	"ItSc_Teleport.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_TELEPORTARGEZTOSATURAS;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Teleport";
	
	TEXT	[0]			=	"Bringt Argez und mich zu Saturas";
	
	TEXT	[5]			=	NAME_Value;									
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_TeleportGenn (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Windfist;

	visual				=	"ItSc_Teleport.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_TELEPORTGENN;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Teleport";
	
	TEXT	[0]			=	"zurück zu Genn";
	
	TEXT	[5]			=	NAME_Value;									
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_TeleportOrkfriedhof (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Windfist;

	visual				=	"ItSc_Teleport.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_TELEPORTORKFRIEDHOF;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Teleport zum Orkfriedhof";
	
	TEXT	[5]			=	NAME_Value;									
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_TeleportOldcamp (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Windfist;

	visual				=	"ItSc_Teleport.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_TELEPORTOLDCAMP;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Teleport ins alte Lager";
	
	TEXT	[5]			=	NAME_Value;									
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_TeleportTorgan (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Windfist;

	visual				=	"ItSc_Teleport.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_TELEPORTTORGAN;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Teleport";
	
	TEXT	[0]			=	"zu Torgan";
	
	TEXT	[5]			=	NAME_Value;									
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_TeleportBeliarOut (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Windfist;

	visual				=	"ItSc_Teleport.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_TELEPORTBELIAROUT;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Teleport";
	
	TEXT	[0]			=	"führt aus dem Tempel";
	
	TEXT	[5]			=	NAME_Value;									
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_TeleportOutOfOT (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Windfist;

	visual				=	"ItSc_Teleport.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_TELEPORTOT;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Teleport";
	
	TEXT	[0]			=	"Zu Xardas";
	
	TEXT	[5]			=	NAME_Value;									
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_TeleportEisSH (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Windfist;

	visual				=	"ItSc_Teleport.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_TELEPORTEISSH;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Teleport";
	
	TEXT	[0]			=	"Zum Stonehenge";
	
	TEXT	[5]			=	NAME_Value;									
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_Teleport_Eisgebiet (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Windfist;

	visual				=	"ItSc_Teleport.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_TELEPORT_Eisgebiet;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Teleport nach Gelato";
	
	TEXT	[0]			=	"";
	
	TEXT	[5]			=	NAME_Value;									
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_TeleportVorAL (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Windfist;

	visual				=	"ItSc_Teleport.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_TELEPORTBERGWELT;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Teleport";
	
	TEXT	[0]			=	"Vor das alte Lager";
	
	TEXT	[5]			=	NAME_Value;									
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_Verfluchen (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Sleep;

	visual				=	"ItSc_Sleep.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_Verfluchen;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Verfluchen";
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_Hagel (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Sleep;

	visual				=	"ItSc_Sleep.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_Hagel;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Hagel";
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_Beeinflussung (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Sleep;

	visual				=	"ItSc_Sleep.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_Beeinflussung;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Beeinflussung";
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_Sleep (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Sleep;

	visual				=	"ItSc_Sleep.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_SLEEP;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_Sleep;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Sec_Duration;			
	COUNT	[2]			=	SPL_TIME_Sleep;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_SumHagen (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Sleep;

	visual				=	"ItSc_Sleep.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_SUMHAGEN;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Spruchrolle von Lord Hagen";
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

/*******************************************************************************************/
INSTANCE ItSc_Charm(C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	Value_Sc_Charm;

	visual				=	"ItSc_Sleep.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_CHARM;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_Charm;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

/*******************************************************************************************/
INSTANCE ItSc_MediumHeal (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_MediumHeal;

	visual				=	"ItSc_MediumHeal.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_MediumHeal;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_MediumHeal;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_HealingPerCast;		
	COUNT	[2]			=	SPL_Heal_MediumHeal;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_LightningFlash (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_LightningFlash;

	visual				=	"ItSc_LightningFlash.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_LightningFlash;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_LightningFlash;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Dam_Magic;			
	COUNT	[2]			=	SPL_DAMAGE_LightningFlash;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_ChargeFireball (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_ChargeFireball;

	visual				=	"ItSc_ChargeFireball.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_ChargeFireball;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	STEP_CHARGEFIREBALL;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_YELLOW";

	description			= 	NAME_SPL_ChargeFireball;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_MinManakosten;							
	COUNT	[1]			=	STEP_ChargeFireball;
	
	TEXT	[2]			=	NAME_ManakostenMax;							
	COUNT	[2]			=	SPL_COST_ChargeFireball;
	
	TEXT	[3]			=	NAME_Addon_Damage_Min;
	count 	[3]			=   SPL_DAMAGE_ChargeFireball;
	
	TEXT	[4]			=	NAME_Damage_Max;
	COUNT	[4]			=	(SPL_DAMAGE_ChargeFireball*4);
	
	TEXT	[5]			=	NAME_Value;									
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_SumSkel (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_SumSkel;

	visual				=	"ItSc_SumSkel.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_SUMMONSKELETON;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_SummonSkeleton / 2;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_SummonSkeleton;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_SummonSkeleton / 2;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_Rueckverwandlung (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_SumSkel;

	visual				=	"ItSc_SumSkel.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_TRFSKELETON2;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";
	mag_circle			= 7;

	description			=	"Rückverwandlung";
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_TrfWoman;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_TrfSkeleton (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_SumSkel;

	visual				=	"ItSc_SumSkel.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_TRFSKELETON2;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_TrfSkeleton2;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_TrfWoman;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_Fear (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Fear;

	visual				=	"ItSc_Fear.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_FEAR;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_Fear;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Sec_Duration;				
	COUNT	[2]			=	SPL_TIME_Fear;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_IceCube (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_IceCube;

	visual				=	"ItSc_IceCube.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_ICECUBE;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_BLUE";

	description			=	NAME_SPL_IceCube;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Damage;				
	COUNT	[2]			=	60;
	
	TEXT	[3]			=	NAME_Sec_Duration;				
	COUNT	[3]			=	SPL_TIME_FREEZE;
	
	TEXT	[4]			=	NAME_DamagePerSec;				
	COUNT	[4]			=	SPL_FREEZE_DAMAGE;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_IceCube_Fake (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_IceCube/2;

	visual				=	"ItSc_IceCube.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_ICECUBE;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_BLUE";

	description			=	NAME_SPL_IceCube;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Damage;				
	COUNT	[2]			=	60;
	
	TEXT	[3]			=	NAME_Sec_Duration;				
	COUNT	[3]			=	SPL_TIME_FREEZE;
	
	TEXT	[4]			=	NAME_DamagePerSec;				
	COUNT	[4]			=	SPL_FREEZE_DAMAGE;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_ThunderBall (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_ThunderBall;

	visual				=	"ItSc_ThunderBall.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_ChargeZap;
	
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	STEP_CHARGEZAP;
	
	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_ChargeZap;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_MinManakosten;							
	COUNT	[1]			=	STEP_ChargeZap;
	
	TEXT	[2]			=	NAME_ManakostenMax;							
	COUNT	[2]			=	SPL_COST_ChargeZap;
	
	TEXT	[3]			=	NAME_Addon_Damage_Min;
	count 	[3]			=   SPL_DAMAGE_ChargeZap;
	
	TEXT	[4]			=	NAME_Damage_Max;
	COUNT	[4]			=	(SPL_DAMAGE_ChargeZap*4);
	
	TEXT	[5]			=	NAME_Value;									
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_SumGol (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SC_SumGol;

	visual				=	"ItSc_SumGol.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_SUMMONGOLEM;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_SummonGolem / 2;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_SummonGolem;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_SummonGolem / 2;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};

INSTANCE ItSc_SumFireGol (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SC_SumGol;

	visual				=	"ItSc_SumGol.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_SUMMONFireGOLEM;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_SummonFireGolem / 2;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_SummonFireGolem;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_SummonFireGolem / 2;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};

INSTANCE ItSc_SumSwampGolem (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SC_SumGol;

	visual				=	"ItSc_SumGol.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_SUMSWAMPGOLEM;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_SummonSwampGolem / 2;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Sumpfgolem beschwören";
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_SummonSwampGolem / 2;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};

INSTANCE ItSc_SumUDSwampshark (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SC_SumGol;

	visual				=	"ItSc_SummonUDS.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_SUMMONUDSwampshark;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_SummonUDSwampshark / 2;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_SummonUDSwampshark;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_SummonUDSwampshark / 2;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};

INSTANCE ItSc_SumKrautschaf (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SC_SumGol;

	visual				=	"ItSc_SummonUDS.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_SUMMONKRAUTSCHAF;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_SummonKrautschaf / 2;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Schaf für Troll beschwören";
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_SummonKrautschaf / 2;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};

INSTANCE ItSc_SumIceGol (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SC_SumGol;

	visual				=	"ItSc_SumGol.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_SUMMONICEGOLEM;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_SummonIceGolem / 2;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_SummonIceGolem;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_SummonIceGolem / 2;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_SumGol_Fake (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SC_SumGol;

	visual				=	"ItSc_SumGol.3DS";
	material			=	MAT_LEATHER;

	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_SummonGolem;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_HarmUndead (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_HarmUndead;

	visual				=	"ItSc_HarmUndead.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_DESTROYUNDEAD;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_DestroyUndead;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Dam_Magic;				
	COUNT	[2]			=	SPL_DAMAGE_DESTROYUNDEAD;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_Pyrokinesis (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Pyrokinesis;

	visual				=	"ItSc_Pyrokinesis.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_PYROKINESIS;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	STEP_Firestorm;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_YELLOW";

	description			=	NAME_SPL_Pyrokinesis;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_MinManakosten;							
	COUNT	[1]			=	STEP_Firestorm;
	
	TEXT	[2]			=	NAME_ManakostenMax;							
	COUNT	[2]			=	SPL_COST_Firestorm;
	
	TEXT	[3]			=	NAME_Addon_Damage_Min;
	count 	[3]			=   SPL_DAMAGE_Firestorm;
	
	TEXT	[4]			=	NAME_Damage_Max;
	COUNT	[4]			=	(SPL_DAMAGE_Firestorm*4);
	
	TEXT	[5]			=	NAME_Value;									
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_Pyrokinesis_g1 (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Pyrokinesis;

	visual				=	"ItSc_Pyrokinesis.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_PYROKINESIS_g1;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	STEP_Firestorm;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_YELLOW";

	description			=	"Pyrokinese";
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[5]			=	NAME_Value;									
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_Firestorm (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Firestorm;

	visual				=	"ItSc_Firestorm.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_FIRESTORM;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_YELLOW";

	description			= 	NAME_SPL_Firestorm;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;							
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Dam_Magic;	
	COUNT	[2]			=	SPL_DAMAGE_INSTANTFIRESTORM;
	
	TEXT	[5]			=	NAME_Value;									
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_IceWave (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SC_IceWave;

	visual				=	"ItSc_IceWave.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_ICEWAVE;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_BLUE";

	description			=	NAME_SPL_IceWave;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Damage;				
	COUNT	[2]			=	60;
	
	TEXT	[3]			=	NAME_Sec_Duration;				
	COUNT	[3]			=	SPL_TIME_FREEZE;
	
	TEXT	[4]			=	NAME_DamagePerSec;				
	COUNT	[4]			=	SPL_FREEZE_DAMAGE;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_IceWave_Fake (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SC_IceWave/2;

	visual				=	"ItSc_IceWave.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_ICEWAVE;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_BLUE";

	description			=	NAME_SPL_IceWave;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Damage;				
	COUNT	[2]			=	60;
	
	TEXT	[3]			=	NAME_Sec_Duration;				
	COUNT	[3]			=	SPL_TIME_FREEZE;
	
	TEXT	[4]			=	NAME_DamagePerSec;				
	COUNT	[4]			=	SPL_FREEZE_DAMAGE;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_SumDemon (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_SumDemon;

	visual				=	"ItSc_SumDemon.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_SUMMONDEMON;
	cond_atr[2]   			=	ATR_MANA_MAX;
	cond_value[2]  			=	SPL_Cost_SummonDemon / 2;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_SummonDemon;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_SummonDemon / 2;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/

INSTANCE ItSc_FullHeal (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_FullHeal;

	visual				=	"ItSc_FullHeal.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_FullHeal;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_FullHeal;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_HealingPerCast;		
	COUNT	[2]			=	SPL_Heal_FullHeal;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_Firerain (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Firerain;

	visual				=	"ItSc_Firerain.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_FIRERAIN;
	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_YELLOW";

	description			=	NAME_SPL_Firerain;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Dam_Fire;				
	COUNT	[2]			=	SPL_DAMAGE_FIRERAIN;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

INSTANCE ItSc_Icerain (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Firerain;

	visual				=	"ItSc_Firerain.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_IceRAIN;
	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_YELLOW";

	description			=	NAME_SPL_Icerain;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Dam_Magic;				
	COUNT	[2]			=	SPL_DAMAGE_IceRAIN;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

INSTANCE ItSc_HolyRain (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Firerain;

	visual				=	"ItSc_Firerain.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_HolyRain;
	cond_atr[2]   			= 	ATR_MANA_MAX;
	cond_value[2]  			= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_YELLOW";

	description			=	"Heiliger Regen";
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Dam_Fire;				
	COUNT	[2]			=	SPL_DAMAGE_HolyRain;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_BreathOfDeath (C_Item)//Joly:Auf Dracheninsel in Truhe der Schwarzmagiernovizen
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_BreathofDeath;

	visual				=	"ItSc_BreathOfDeath.3ds";
	material			=	MAT_LEATHER;

	spell				= 	SPL_BREATHOFDEATH;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_RED";

	description			=	NAME_SPL_BreathOfDeath;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Dam_Magic;				
	COUNT	[2]			=	SPL_DAMAGE_BREATHOFDEATH;

	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_MassDeath (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Massdeath;

	visual				=	"ItSc_MassDeath.3ds";
	material			=	MAT_LEATHER;

	spell				= 	SPL_MASSDEATH;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_RED";

	description			=	NAME_SPL_MassDeath;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Dam_Magic;				
	COUNT	[2]			=	SPL_DAMAGE_MASSDEATH;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_HolyWave (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_HolyWave;

	visual				=	"ItSc_MassDeath.3ds";
	material			=	MAT_LEATHER;

	spell				= 	SPL_HolyWave;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_RED";

	description			=	"Heilige Welle";
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Dam_Magic;				
	COUNT	[2]			=	SPL_DAMAGE_HolyWave;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_FireWave (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_FireWave;

	visual				=	"ItSc_MassDeath.3ds";
	material			=	MAT_LEATHER;

	spell				= 	SPL_FireWave;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_RED";

	description			=	"Feuerwelle";
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[2]			=	NAME_Dam_Magic;				
	COUNT	[2]			=	SPL_DAMAGE_FireWave;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_ArmyOfDarkness (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_ArmyofDarkness;

	visual				=	"ItSc_ArmyOfDarkness.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_ARMYOFDARKNESS;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_RED";

	description			=	NAME_SPL_ArmyOfDarkness;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/

INSTANCE ItSc_Shrink (C_Item)//Joly:Auf Dracheninsel in Truhe der Schwarzmagiernovizen
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_Shrink;

	visual				=	"ItSc_Shrink.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_SHRINK;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_Shrink;
	
	TEXT	[0]			=	Name_MageScroll	;
	
	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_TrfWoman (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_TrfAll;

	visual				=	"ItSc_TrfWoman.3DS";
	material			=	MAT_LEATHER;

	spell			    = 	SPL_TrfWoman;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Verwandlung Frau";

	TEXT	[0]			=	Name_MageScroll	;

	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_TrfWoman;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_TrfWomanBack (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_TrfAll;

	visual				=	"ItSc_TrfWomanBack.3DS";
	material			=	MAT_LEATHER;

	spell			    = 	SPL_TrfWomanBack;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Verwandlung Mann";

	TEXT	[0]			=	Name_MageScroll	;

	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_TrfWoman;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_TrfMeatbug (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_TrfAll;

	visual				=	"ItSc_TrfMeatbug.3DS";
	material			=	MAT_LEATHER;

	spell			    = 	SPL_TrfMeatbug;
	cond_atr[2]   		= 	ATR_MANA_MAX;
	cond_value[2]  		= 	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Verwandlung Fleischwanze";

	TEXT	[0]			=	Name_MageScroll	;

	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_TrfMeatbug;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_TrfHarpie (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_TrfAll;

	visual				=	"ItSc_TrfHarpie.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_TrfOrk;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Verwandlung Harpie";

	TEXT	[0]			=	Name_MageScroll	;

	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_TrfOrk;

	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_TrfShadowbeast (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_TrfAll;

	visual				=	"ItSc_TrfShadowbeast.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_TrfShadowbeast;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Verwandlung Schattenläufer";
	
	TEXT	[0]			=	Name_MageScroll	;

	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_TrfShadowbeast;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_TrfSnapper (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_TrfAll;

	visual				=	"ItSc_TrfSnapper.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_TrfSnapper;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Verwandlung Snapper";
	
	TEXT	[0]			=	Name_MageScroll	;

	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_TrfSnapper;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;

};
/*******************************************************************************************/
INSTANCE ItSc_TrfWarg (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_TrfAll;

	visual				=	"ItSc_TrfWarg.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_TrfWarg;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	"Verwandlung Warg";
	
	TEXT	[0]			=	Name_MageScroll	;

	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_TrfWarg;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_TrfBlackTroll (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_TrfAll;

	visual				=	"ItSc_TrfBlackTroll.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_TrfBlackTroll;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	"Verwandlung Schwarzer Troll";
	
	TEXT	[0]			=	Name_MageScroll	;

	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_TrfBlackTroll;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_TrfGolem (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_TrfAll;

	visual				=	"ItSc_TrfGolem.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_TrfGolem;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= "Verwandlung Steingolem";
	
	TEXT	[0]			=	Name_MageScroll	;

	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_TrfGolem;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_TrfBloodfly (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_TrfAll;

	visual				=	"ItSc_TrfBloodfly.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_TrfBloodfly;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Verwandlung Blutfliege";
	
	TEXT	[0]			=	Name_MageScroll	;

	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_TrfBloodfly;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_TrfBloodhound (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_TrfAll;

	visual				=	"ItSc_TrfBloodhound.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_TrfBloodhound;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=  "Verwandlung Bluthund";
	
	TEXT	[0]			=	Name_MageScroll	;

	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_TrfBloodhound;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_TrfKeiler (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_TrfAll;

	visual				=	"ItSc_TrfKeiler.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_TrfKeiler;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Verwandlung Keiler";
	
	TEXT	[0]			=	Name_MageScroll	;

	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_TrfKeiler;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_TrfSheep (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual				=	"ItSc_TrfSheep.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_TrfSheep;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Verwandlung Schaf";
	
	TEXT	[0]			=	Name_MageScroll	;

	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_TrfSheep;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItSc_TrfRabbit (C_Item)//Joly:Auf Dracheninsel in Truhe der Schwarzmagiernovizen
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sc_TrfAll;

	visual				=	"ItSc_TrfRabbit.3DS";
	material			=	MAT_LEATHER;

	spell				= 	SPL_TrfSkeleton;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	SPL_Cost_Scroll;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=  "Verwandlung Hase";
	
	TEXT	[0]			=	Name_MageScroll	;

	TEXT	[1]			=	NAME_Mana_needed;			
	COUNT	[1]			=	SPL_Cost_TrfMeatbug;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/

INSTANCE ItArScrollControl (C_Item)
{
	name 				=	NAME_Spruchrolle;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;

	value 				=	90;

	visual				=	"ItAr_Scroll_08.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_CONTROL;
	cond_atr[2]   		=	ATR_MANA_MAX;
	cond_value[2]  		=	30;

	description			=	"Kontrolle";
	//TEXT	[0]			=	NAME_Mag_Circle;			COUNT	[0]		=	mag_circle;
	//TEXT	[1]			=	NAME_Manakosten;			COUNT	[1]		=	;
	//TEXT	[2]			=	"";							COUNT	[2]		=	;
	//TEXT	[3] 		=	"";							COUNT	[3]		=	;
	//TEXT	[4]			=	"";							COUNT	[4]		=	;
	TEXT	[5]			=	NAME_Value;					COUNT	[5]		=	value;
};


