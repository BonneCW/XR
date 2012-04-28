// Runen
// Paladin Runen 	

//********************************************************************************************
//Joly: Macht die Runen nicht zu teuer, es sind Produktionsitems -> EXPLOID!!!!!!!!!!!
//********************************************************************************************

const 	string 	Name_PaladinSpell		=	"Paladin Zauber"; 	
const	int	Value_Ru_PalLight			=	500;	
const	int	Value_Ru_PalLightHeal		=	500;
const	int	Value_Ru_PalHolyBolt		=	500;
const	int	Value_Ru_PalMediumHeal		=	2000;
const	int	Value_Ru_PalRepelEvil		=	2000;
const	int	Value_Ru_PalFullHeal		=	3000;
const	int	Value_Ru_PalDestroyEvil		=	3000;

//********************************************************************************************
//Joly: Macht die Runen nicht zu teuer, es sind Produktionsitems -> EXPLOID!!!!!!!!!!!
//********************************************************************************************

// Kreis 1
const	int	Value_Ru_Light				=	500;// Lehrer Parlan
const	int	Value_Ru_Firebolt			=	500;// Lehrer Hyglas 
const	int	Value_Ru_Zap				=	500;// Lehrer Marduk
const	int	Value_Ru_LightHeal			=	500;// Lehrer Parlan
const	int	Value_Ru_SumGobSkel			=	500;// Lehrer Karras
// Kreis 2	
const	int	Value_Ru_InstantFireball	=	1000;// Lehrer Hyglas
const	int	Value_Ru_Icebolt			=	1000;// Lehrer Marduk
const	int	Value_Ru_SumWolf			=	1000;// Lehrer Karras
const	int	Value_Ru_Windfist			=	1000;
const	int	Value_Ru_Sleep				=	1000;
// Kreis 3
const	int	Value_Ru_MediumHeal			=	1500;// Lehrer Parlan
const	int	Value_Ru_SumSkel			=	1500;// Lehrer Karras
const	int	Value_Ru_Fear				=	1500;
const	int	Value_Ru_IceCube			=	1500;// Lehrer Marduk
const	int	Value_Ru_ThunderBall		=	1500;// Lehrer Marduk
const	int	Value_Ru_Firestorm			=	1500;// Lehrer Hyglas
// Kreis 4
const	int	Value_Ru_SumGol				=	2000;// Lehrer Karras
const	int	Value_Ru_HarmUndead			=	2000;
const	int	Value_Ru_LightningFlash		=	2000;// Lehrer Marduk
const	int	Value_Ru_ChargeFireball		=	2000;// Lehrer Hyglas 
// Kreis 5
const	int	Value_Ru_IceWave			=	2500;// Lehrer Marduk
const	int	Value_Ru_SumDemon			=	2500;// Lehrer Karras
const	int	Value_Ru_FullHeal			=	2500;// Lehrer Parlan
const	int	Value_Ru_Pyrokinesis		=	2500;// Lehrer Hyglas
// Kreis 6 		
const	int	Value_Ru_Firerain			=	3000;// Lehrer Hyglas
const	int	Value_Ru_BreathOfDeath		=	3000;
const	int	Value_Ru_MassDeath			=	3000;
const	int	Value_Ru_Deathwave			=	3000;
const	int	Value_Ru_MasterOfDisaster	=	3000;
const	int	Value_Ru_ArmyOfDarkness		=	3000;// Lehrer Karras
const	int	Value_Ru_Shrink				=	3000;

//TeleportRunen
const int	Value_Ru_PalTeleportSecret		=	500;
const int	Value_Ru_TeleportSeaport		=	500;
const int	Value_Ru_TeleportMonastery		=	500;
const int	Value_Ru_TeleportFarm			=	500;
const int	Value_Ru_TeleportXardas			=	500;
const int	Value_Ru_TeleportPassNW			=	500;
const int	Value_Ru_TeleportPassOW			=	500;
const int	Value_Ru_TeleportOC				=	500;
const int	Value_Ru_TeleportOWDemonTower	=	500;
const int	Value_Ru_TeleportTaverne		=	500;
const int	Value_Ru_Teleport_3				=	500;

const int Value_Ru_Blutopfer = 1500;
const int Value_Ru_Seelenraub = 1500;
const int Value_Ru_Wahnsinn = 2500;
/*******************************************************************************************/
INSTANCE ItRu_PalLight (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_PalLight;

	visual				=	"ItRu_PalLight.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_PalLight;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_PalLight;
	
	TEXT	[0]			=	Name_PaladinSpell	;
	
	TEXT	[1]			=	NAME_Manakosten;		
	COUNT	[1]			=	SPL_Cost_PalLight;
	
	TEXT	[2]			=	NAME_Duration;		
	COUNT	[2]			=	SPL_Duration_PalLIGHT;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
}; 

INSTANCE ItRu_KristallPrisma (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_PalLight;

	visual				=	"IT_INNOSCRYSTAL_01.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_AuraFlammen;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Kristall des Feuers";
		
	TEXT	[0]			=	"Der Prismen-Kristall scheint sich verändert zu haben";
		
	TEXT	[1]			=	NAME_Manakosten;		
	COUNT	[1]			=	SPL_Cost_AuraFlammen;
	
	TEXT	[2]			=	NAME_Sec_Duration;		
	COUNT	[2]			=	15;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
}; 

INSTANCE ItMi_AbsorbKristall (C_Item)
{
	name 				=	"Kristall der Absorption";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	1000;

	visual				=	"ItRu_PalLight.3ds";
	material			=	MAT_STONE;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	name;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};

INSTANCE ItMi_AbsorbKristall2 (C_Item)
{
	name 				=	"Kristall der Absorption";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	1000;

	visual				=	"ItRu_PalLight.3ds";
	material			=	MAT_STONE;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	name;

	TEXT	[1]	=	"pulsiert vor Energie";
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};

INSTANCE ItRu_soulsplit (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	20;

	visual				=	"itmi_darkpearl.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_soulsplit;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_RED";

	description			=	NAME_SPL_Soulsplit;
	
	TEXT	[0]			=	"Spaltet den Körper von der Seele"	;
	
	TEXT	[1]			=	NAME_Manakosten;		
	COUNT	[1]			=	SPL_Cost_soulsplit;
	
	
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

INSTANCE ItRu_Giftteppich (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	20;

	visual				=	"itmi_darkpearl.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_GIFTTEPPICH;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_RED";

	description			=	NAME_SPL_Soulsplit;
	
	TEXT	[0]			=	"Spaltet den Körper von der Seele"	;
	
	TEXT	[1]			=	NAME_Manakosten;		
	COUNT	[1]			=	SPL_Cost_Giftteppich;
	
	
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

INSTANCE ItRu_SummonGeist (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	20;

	visual				=	"itmi_darkpearl.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_SummonGeist;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_RED";

	description			=	NAME_SPL_Soulsplit;
	
	TEXT	[0]			=	"Spaltet den Körper von der Seele"	;
	
	TEXT	[1]			=	NAME_Manakosten;		
	COUNT	[1]			=	SPL_Cost_soulsplit;
	
	
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

INSTANCE ItRu_engel (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	20;

	visual				=	"ItRu_PalFullHeal.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_engel;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_WHITE";

	description			=	NAME_SPL_engel;
	
	TEXT	[0]			=	"Ruft einen Engel";
	
	TEXT	[1]			=	NAME_Manakosten;		
	COUNT	[1]			=	SPL_Cost_engel;
	
	
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

INSTANCE ItRu_Verwandlungsfell (C_Item)
{
	name 				=	"Verwandlungsfell";

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	20;

	visual				=	"ItAt_WargFur.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_TRFWARG;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_WHITE";

	description			=	"Verwandlung Warg";
	
	TEXT	[1]			=	NAME_Manakosten;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

INSTANCE ItRu_TrfRabbit (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	20;

	visual				=	"ItRu_TrfRabbit.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_TRFSKELETON;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_WHITE";

	description			=	"Verwandlung Hase";
	
	TEXT	[1]			=	NAME_Manakosten;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

INSTANCE ItRu_TrfMolerat (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	20;

	visual				=	"ItRu_TrfMolerat.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_TRFSKELETON;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_WHITE";

	description			=	"Verwandlung Molerat";
	
	TEXT	[1]			=	NAME_Manakosten;		
	COUNT	[1]			=	SPL_Cost_Scroll;
	
	
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

INSTANCE ItRu_BeliarCity (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_PalLight;

	visual				=	"ItRu_PalLight.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_BeliarCity;
	mag_circle			=	1;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_BeliarCity;
	
	TEXT	[1]			=	NAME_Manakosten;		
	COUNT	[1]			=	SPL_Cost_BeliarCity;
	
	TEXT	[2]			=	NAME_Duration;		
	COUNT	[2]			=	SPL_Duration_BeliarCity;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
}; 
/*******************************************************************************************/
INSTANCE ItRu_PalLightHeal (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_PalLightHeal;

	visual				=	"ItRu_PalLightHeal.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_PalLightHeal;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_PalLightHeal;
	
	TEXT	[0]			=	Name_PaladinSpell	;
	
	TEXT	[1]			=	NAME_Manakosten;		
	COUNT	[1]			=	SPL_Cost_PalLightHeal;
	
	TEXT	[2]			=	NAME_HealingPerCast;		
	COUNT	[2]			=	SPL_Heal_PalLightHeal;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_PalMediumHeal (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_PalMediumHeal;

	visual				=	"ItRu_PalMediumHeal.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_PalMediumHeal;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_PalMediumHeal;
	
	TEXT	[0]			=	Name_PaladinSpell	;
	
	TEXT	[1]			=	NAME_Manakosten;		
	COUNT	[1]			=	SPL_Cost_PalMediumHeal;
	
	TEXT	[2]			=	NAME_HealingPerCast;		
	COUNT	[2]			=	SPL_Heal_PalMediumHeal;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_PalFullHeal (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_PalFullHeal;

	visual				=	"ItRu_PalFullHeal.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_PalFullHeal;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_PalFullHeal;
	
	TEXT	[0]			=	Name_PaladinSpell	;
	
	TEXT	[1]			=	NAME_Manakosten;		
	COUNT	[1]			=	SPL_Cost_PalFullHeal;
	
	TEXT	[2]			=	NAME_HealingPerCast;		
	COUNT	[2]			=	SPL_Heal_PalFullHeal;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_PalHolyBolt (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_PalHolyBolt;

	visual				=	"ItRu_PalHolyBolt.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_PalHolyBolt;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_PalHolyBolt;
	
	TEXT	[0]			=	Name_PaladinSpell	;
	
	TEXT	[1]			=	NAME_Manakosten;		
	COUNT	[1]			=	SPL_Cost_PalHolyBolt;
	
	TEXT	[2]			=	NAME_Dam_Magic;			
	COUNT	[2]			=	SPL_TEXT_Damage_PalHolyBolt;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};
/*******************************************************************************************/

INSTANCE ItRu_PalRepelEvil (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_PalRepelEvil;

	visual				=	"ItRu_PalRepelEvil.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_PalRepelEvil;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_PalRepelEvil;

	TEXT	[0]			=	Name_PaladinSpell	;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_Cost_PalRepelEvil;
	
	TEXT	[2]			=	NAME_Dam_Magic;				
	COUNT	[2]			=	SPL_TEXT_Damage_PalRepelEvil;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_PalDestroyEvil (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_PalDestroyEvil;

	visual				=	"ItRu_PalDestroyEvil.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_PalDestroyEvil;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_PalDestroyEvil;
	
	TEXT	[0]			=	Name_PaladinSpell	;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_Cost_PalDestroyEvil;
	
	TEXT	[2]			=	NAME_Dam_Magic;				
	COUNT	[2]			=	SPL_TEXT_Damage_PalDestroyEvil;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_PalTeleportSecret (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value				=	Value_Ru_PalTeleportSecret;
	
	visual				=	"ItRu_PalTeleportSecret.3DS";	
	material			=	MAT_STONE;

	spell				= 	SPL_PalTeleportSecret;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_PalTeleportSecret;
	
	TEXT	[0]			=	Name_PaladinSpell	;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_TeleportUW (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value				=	Value_Ru_PalTeleportSecret;
	
	visual				=	"ItRu_PalTeleportSecret.3DS";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportUW;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	"Teleport zu Xeres";
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_BrokenRune (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value				=	Value_Ru_PalTeleportSecret;
	
	visual				=	"ItRu_PalTeleportSecret.3DS";	
	material			=	MAT_STONE;

	spell				= 	SPL_PalTeleportSecret;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	"Teleport";
	
	TEXT	[0]			=	"Die unbekannte Teleportrune";
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_TeleportObelisk (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value				=	Value_Ru_PalTeleportSecret;
	
	visual				=	"ItRu_PalTeleportSecret.3DS";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportObelisk;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_TeleportObelisk;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_TeleportSeaport (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	Value_Ru_TeleportSeaport;
	
	visual				=	"ItRu_TeleportSeaport.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportSeaport;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_TeleportSeaport;
	
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_TeleportMonastery (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	Value_Ru_TeleportMonastery;

	
	visual				=	"ItRu_TeleportMonastery.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportMonastery;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_TeleportMonastery;
	
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_TeleportPatBack (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	Value_Ru_TeleportMonastery;

	
	visual				=	"ItRu_TeleportMonastery.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportPatBack;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_TeleportPatBack;
	
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_Teleport_Pat (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	Value_Ru_TeleportMonastery;

	
	visual				=	"ItRu_TeleportMonastery.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_Teleport_Pat;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_Teleport_Pat;
	
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_Teleport_Pat_01 (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	Value_Ru_TeleportMonastery;

	
	visual				=	"ItRu_TeleportMonastery.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_Teleport_Pat_01;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_Teleport_Pat_01;
	
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_Teleport_Pat_02 (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	Value_Ru_TeleportMonastery;

	
	visual				=	"ItRu_TeleportMonastery.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_Teleport_Pat_02;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_Teleport_Pat_02;
	
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_TeleportFarm (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	Value_Ru_TeleportFarm;
	
	visual				=	"ItRu_TeleportFarm.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportFarm;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_TeleportFarm;
	
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_TeleportKhorata (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	Value_Ru_TeleportFarm;
	
	visual				=	"ItRu_TeleportFarm.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportKhorata;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_TeleportKhorata;
	
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_TeleportRELBauernhof (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	Value_Ru_TeleportFarm;
	
	visual				=	"ItRu_TeleportFarm.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportRELBauernhof;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_TeleportRELBauernhof;
	
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_TeleportRELPass (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	Value_Ru_TeleportFarm;
	
	visual				=	"ItRu_TeleportFarm.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportRELPass;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_TeleportRELPass;
	
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_TeleportRELMoor (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	Value_Ru_TeleportFarm;
	
	visual				=	"ItRu_TeleportFarm.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportRELMoor;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_TeleportRELMoor;
	
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_TeleportRELRaeuber (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	Value_Ru_TeleportFarm;
	
	visual				=	"ItRu_TeleportFarm.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportRELRaeuber;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_TeleportRELRaeuber;
	
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_TeleportBanditenlager (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	Value_Ru_TeleportFarm;
	
	visual				=	"ItRu_TeleportFarm.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportBanditenlager;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_TeleportBanditenlager;
	
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_TeleportGelato (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	Value_Ru_TeleportFarm;
	
	visual				=	"ItRu_TeleportFarm.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportGelato;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_TeleportGelato;
	
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_TeleportRELSee (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	Value_Ru_TeleportFarm;
	
	visual				=	"ItRu_TeleportRELSee.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportRELSee;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_TeleportRELSee;
	
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_TeleportXardas (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	Value_Ru_TeleportXardas;
	
	visual				=	"ItRu_TeleportXardas.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportXardas;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_TeleportXardas;
	

	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_TeleportPassNW (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	Value_Ru_TeleportPassNW;
	
	visual				=	"ItRu_TeleportPassNW.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportPassNW;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_TeleportPassNW;
	
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_TeleportWaldis (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	Value_Ru_TeleportPassNW;
	
	visual				=	"ItRu_TeleportPassNW.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportWaldis;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	"Teleport zum Waldläuferlager";
	
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_TeleportWaldiPlattform (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	Value_Ru_TeleportPassNW;
	
	visual				=	"ItRu_TeleportPassNW.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportWaldiPlattform;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	"Teleport";
	
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_TeleportBergfestung (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	Value_Ru_TeleportPassNW;
	
	visual				=	"ItRu_TeleportPassNW.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportBergfestung;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_TeleportBergfestung;
	
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_TeleportKlosterruine (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	Value_Ru_TeleportPassNW;
	
	visual				=	"ItRu_TeleportPassNW.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportKlosterruine;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_TeleportKlosterruine;
	
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_TeleportSonnenkreis (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	Value_Ru_TeleportPassNW;
	
	visual				=	"ItRu_TeleportPassNW.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportSonnenkreis;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_TeleportSonnenkreis;
	
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_TeleportPassOW (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	Value_Ru_TeleportPassOW;
	
	visual				=	"ItRu_TeleportPassOW.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportPassOW;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_TeleportPassOW;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_TeleportOC (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	Value_Ru_TeleportOC;
	
	visual				=	"ItRu_TeleportOC.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportOC;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_TeleportOC;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

/*******************************************************************************************/

INSTANCE ItRu_TeleportOWDemonTower (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value				=	Value_Ru_TeleportOWDemonTower;
	
	visual				=	"ItRu_Teleport_2.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportOWDemonTower;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_TeleportOWDemonTower;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

INSTANCE ItRu_TeleportTaverne (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value				=	Value_Ru_TeleportTaverne;
	
	visual				=	"ItRu_Teleport_2.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportTaverne;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_TeleportTaverne;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

INSTANCE ItRu_TeleportRELHofstaat (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value				=	Value_Ru_TeleportTaverne;
	
	visual				=	"ItRu_Teleport_2.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportRELHofstaat;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_TeleportRELHofstaat;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

INSTANCE ItRu_TeleportDemonTower (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value				=	Value_Ru_TeleportTaverne;
	
	visual				=	"ItRu_Teleport_2.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportDemonTower;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_TeleportDemonTower;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

INSTANCE ItRu_TeleportPsicamp (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value				=	Value_Ru_TeleportTaverne;
	
	visual				=	"ItRu_Teleport_2.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportPsicamp;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_TeleportPsicamp;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

INSTANCE ItRu_TeleportOldcamp (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value				=	Value_Ru_TeleportTaverne;
	
	visual				=	"ItRu_Teleport_2.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportOldcamp;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_TeleportOldcamp;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

INSTANCE ItRu_TeleportNewcamp (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value				=	Value_Ru_TeleportTaverne;
	
	visual				=	"ItRu_Teleport_2.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_TeleportNewcamp;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_TeleportNewcamp;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_Teleport_3 (C_Item) 
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	
	value 				=	Value_Ru_Teleport_3;
	
	visual				=	"ItRu_Teleport_3.3ds";	
	material			=	MAT_STONE;

	spell				= 	SPL_Teleport_3;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			= 	NAME_SPL_Teleport_3;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_TELEPORT;
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
// Kreis 1
INSTANCE ItRu_Light (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Light;

	visual				=	"ItRu_Light.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_LIGHT;
	mag_circle			=	1;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_LIGHT;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;		
	
	TEXT	[1]			=	NAME_Manakosten;		
	COUNT	[1]			=	SPL_COST_LIGHT;
	
	TEXT	[2]			=	NAME_Duration;		
	COUNT	[2]			=	SPL_Duration_LIGHT;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
}; 
INSTANCE ItRu_Unsichtbarkeit (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	1000;

	visual				=	"ItRu_Light.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_UNSICHTBARKEIT;
	mag_circle			=	0;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_UNSICHTBARKEIT;
	
	TEXT	[1]			=	NAME_Manakosten;		
	COUNT	[1]			=	SPL_COST_UNSICHTBARKEIT;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
}; 
INSTANCE ItRu_ManaEntzug (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Light;

	visual				=	"ItRu_Light.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_ManaEntzug;
	mag_circle			=	1;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_ManaEntzug;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;		
	
	TEXT	[1]			=	NAME_Manakosten;		
	COUNT	[1]			=	SPL_COST_ManaEntzug;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
}; 
/*******************************************************************************************/
INSTANCE ItRu_FireBolt (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Firebolt;

	visual				=	"ItRu_FireBolt.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_FIREBOLT;
	mag_circle			=	1;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_YELLOW";

	description			=	NAME_SPL_Firebolt;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
			
	TEXT	[1]			=	NAME_Manakosten;		
	COUNT	[1]			=	SPL_COST_FIREBOLT;
	
	TEXT	[2]			=	NAME_Dam_Magic;			
	COUNT	[2]			=	SPL_TEXT_DAMAGE_FIREBOLT;
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_Fackel (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Firebolt;

	visual				=	"ItRu_FireBolt.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_FACKEL;
	mag_circle			=	0;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_YELLOW";

	description			=	"Fackel an/aus";
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
			
	TEXT	[1]			=	NAME_Manakosten;		
	COUNT	[1]			=	SPL_COST_FIREBOLT;
	
	TEXT	[2]			=	"Entzündet und löscht Fackeln";
	
	TEXT	[5]			=	NAME_Value;				
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_Zap (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Zap;

	visual				=	"ItRu_Zap.3DS";
	material			=	MAT_STONE;
	
	mag_circle			=	1;
	spell				= 	SPL_Zap;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_Zap;
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_Cost_Zap;
	
	TEXT	[2]			=	NAME_Dam_Magic;			
	COUNT	[2]			=	SPL_TEXT_DAMAGE_ZAP;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_LightHeal (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_LightHeal;

	visual				=	"ItRu_LightHeal.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_LightHeal;
	mag_circle			= 	1;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_LightHeal;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;		
	
	TEXT	[1]			=	NAME_Manakosten;		
	COUNT	[1]			=	SPL_Cost_LightHeal;
	
	TEXT	[2]			=	NAME_HealingPerCast;		
	COUNT	[2]			=	SPL_Heal_LightHeal;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_SumGobSkel (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_SumGobSkel;

	visual				=	"ItRu_SumGobSkel.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_SummonGoblinSkeleton;
	mag_circle			= 	2;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_SummonGoblinSkeleton;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_Cost_SummonGoblinSkeleton;
	
	TEXT 	[2]			=   "Die wandernden Knochen";
	TEXT 	[3]			=   "der toten Goblins";
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_SumGobKrieger (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_SumGobSkel;

	visual				=	"ItRu_SumGobSkel.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_SummonGoblinKrieger;
	mag_circle			= 	2;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_SummonGoblinKrieger;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_Cost_SummonGoblinKrieger;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_SumGobEis (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_SumGobSkel;

	visual				=	"ItRu_SumGobSkel.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_SummonEisGoblin;
	mag_circle			= 	2;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_SummonEisGoblin;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_Cost_SummonEisGoblin;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
// Kreis 2	
INSTANCE ItRu_InstantFireball (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_InstantFireball;

	visual				=	"ItRu_InstantFireball.3DS";
	material			=	MAT_STONE;
	
	mag_circle			= 	2;
	spell				= 	SPL_InstantFireball;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_YELLOW";

	description			= 	NAME_SPL_InstantFireball;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;		
	
	TEXT	[1]			=	NAME_Manakosten;							
	COUNT	[1]			=	SPL_COST_InstantFireball;
	
	TEXT	[2]			=	NAME_Dam_Magic;	
	COUNT	[2]			=	SPL_TEXT_DAMAGE_InstantFireball;
	
	TEXT	[5]			=	NAME_Value;									
	COUNT	[5]			=	value;
};
INSTANCE ItRu_InstantIceball (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_InstantFireball;

	visual				=	"ItRu_InstantIceball.3DS";
	material			=	MAT_STONE;
	
	mag_circle			= 	2;
	spell				= 	SPL_InstantIceball;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_YELLOW";

	description			= 	NAME_SPL_InstantIceball;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;		
	
	TEXT	[1]			=	NAME_Manakosten;							
	COUNT	[1]			=	SPL_COST_InstantIceball;
	
	TEXT	[2]			=	NAME_Dam_Magic;	
	COUNT	[2]			=	SPL_TEXT_DAMAGE_InstantIceball;
	
	TEXT	[5]			=	NAME_Value;									
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_Icebolt (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Icebolt;

	visual				=	"ItRu_Icebolt.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_Icebolt;
	mag_circle 			=	1;


	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_BLUE";

	description			=	NAME_SPL_Icebolt;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_Icebolt;
	
	TEXT	[2]			=	NAME_Dam_Magic;				
	COUNT	[2]			=	SPL_TEXT_DAMAGE_Icebolt;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

/*******************************************************************************************/
INSTANCE ItRu_SumWolf (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_SumWolf;

	visual				=	"ItRu_SumWolf.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_SummonWolf;
	mag_circle			= 	1;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_SummonWolf;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;		
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_Cost_SummonWolf;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

INSTANCE ItRu_Zaehmen (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_SumWolf;

	visual				=	"ItRu_SumWolf.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_Zaehmen;
	mag_circle			= 	0;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_Zaehmen;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;		
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_Cost_Zaehmen;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_Windfist (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Windfist;

	visual				=	"ItRu_Windfist.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_WINDFIST;
	mag_circle 			=	2;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_WINDFIST;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;						
	
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
INSTANCE ItRu_Sleep (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Sleep;

	visual				=	"ItRu_Sleep.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_SLEEP;
	mag_circle 			=	2;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_Sleep;
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_SLEEP;
	
	TEXT	[2]			=	NAME_SEC_Duration;			
	COUNT	[2]			=	SPL_TIME_Sleep;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

/*******************************************************************************************/
INSTANCE ItRu_Charm (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Sleep;

	visual				=	"ItRu_Sleep.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_CHARM;
	mag_circle 			=	1;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_Charm;
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_CHARM;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

/*******************************************************************************************/
INSTANCE ItRu_Eisklinge (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Sleep;

	visual				=	"ItRu_Sleep.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_EISKLINGE;
	mag_circle 			=	1;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_EISKLINGE;
	//TEXT	[0]			=	NAME_Mag_Circle;			
	//COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_EISKLINGE;
	
	TEXT	[2]			=	NAME_Duration;			
	COUNT	[2]			=	SPL_TIME_EISKLINGE;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

/*******************************************************************************************/
INSTANCE ItRu_Kontrolle (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Sleep;

	visual				=	"ItRu_Sleep.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_CONTROL;
	mag_circle 			=	1;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Kontrolle";
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_CONTROL;
	
	TEXT	[2]			=	NAME_Duration;			
	COUNT	[2]			=	SPL_TIME_CONTROL;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

/*******************************************************************************************/
INSTANCE ItRu_Kontrolle_01 (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	Value_Ru_Sleep;

	visual				=	"ItRu_Sleep.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_CONTROL;
	mag_circle 			=	1;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Kontrolle";
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_CONTROL;
	
	TEXT	[2]			=	NAME_Duration;			
	COUNT	[2]			=	SPL_TIME_CONTROL;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

INSTANCE ItRu_Berserk (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Sleep;

	visual				=	"ItRu_Sleep.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_BERSERK;
	mag_circle 			=	5;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Berserk";
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_Berserk;
	
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
// Kreis 3
INSTANCE ItRu_MediumHeal (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_MediumHeal;

	visual				=	"ItRu_MediumHeal.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_MediumHeal;
	mag_circle			=	3;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_MediumHeal;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;		
	COUNT	[1]			=	SPL_Cost_MediumHeal;
	
	TEXT	[2]			=	NAME_HealingPerCast;		
	COUNT	[2]			=	SPL_Heal_MediumHeal;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_LightningFlash (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_LightningFlash;

	visual				=	"ItRu_LightningFlash.3DS";
	material			=	MAT_STONE;
	
	mag_circle			=	4;
	spell				= 	SPL_LightningFlash;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";
	
	description			=	NAME_SPL_LightningFlash;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;		
	COUNT	[1]			=	SPL_Cost_LightningFlash;
	
	TEXT	[2]			=	NAME_Dam_Magic;			
	COUNT	[2]			=	SPL_TEXT_Damage_LightningFlash;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/	
INSTANCE ItRu_ChargeFireball (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_ChargeFireball;

	visual				=	"ItRu_ChargeFireball.3DS";
	material			=	MAT_STONE;
	
	mag_circle			= 	4;
	
	spell				= 	SPL_ChargeFireball;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_YELLOW";
	
	description			= 	NAME_SPL_ChargeFireball;
	
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;						
	
	TEXT	[1]			=	NAME_MinManakosten;							
	COUNT	[1]			=	STEP_ChargeFireball;
	
	TEXT	[2]			=	NAME_ManakostenMax;							
	COUNT	[2]			=	SPL_COST_ChargeFireball;
	
	TEXT	[3]			=	NAME_Addon_Damage_Min;
	count 	[3]			=   SPL_TEXT_Damage_ChargeFireball;
	
	TEXT	[4]			=	NAME_Damage_Max;
	COUNT	[4]			=	(SPL_TEXT_Damage_ChargeFireball*4);
	
	TEXT	[5]			=	NAME_Value;									
	COUNT	[5]			=	value;
};
/*******************************************************************************************/	
INSTANCE ItRu_SumSkel (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_SumSkel;

	visual				=	"ItRu_SumSkel.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_SUMMONSKELETON;
	mag_circle			= 	3;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_SummonSkeleton;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_SUMMONSKELETON;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/	
INSTANCE ItRu_Fear (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Fear;

	visual				=	"ItRu_Fear.3DS";
	material			=	MAT_STONE;
	mag_circle			= 	3;
	
	spell				= 	SPL_FEAR;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";
	
	description			=	NAME_SPL_Fear;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_FEAR;
	
	TEXT	[2]			=	NAME_Sec_Duration;				
	COUNT	[2]			=	SPL_TIME_Fear;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/	
INSTANCE ItRu_IceCube (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_IceCube;

	visual				=	"ItRu_IceCube.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_ICECUBE;
	mag_circle 			=	3;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_BLUE";

	description			=	NAME_SPL_IceCube;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_ICECUBE;
	
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
// Kreis 4
INSTANCE ItRu_ThunderBall (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_ThunderBall;

	visual				=	"ItRu_ThunderBall.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_ChargeZap;
	mag_circle 			=	3;		

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_ChargeZap;
	
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;						
	
	TEXT	[1]			=	NAME_MinManakosten;							
	COUNT	[1]			=	STEP_ChargeZap;
	
	TEXT	[2]			=	NAME_ManakostenMax;							
	COUNT	[2]			=	SPL_COST_ChargeZap;
	
	TEXT	[3]			=	NAME_Addon_Damage_Min;
	count 	[3]			=   SPL_TEXT_Damage_ChargeZap;
	
	TEXT	[4]			=	NAME_Damage_Max;
	COUNT	[4]			=	(SPL_TEXT_Damage_ChargeZap*4);
	
	TEXT	[5]			=	NAME_Value;									
	COUNT	[5]			=	value;
};

/*******************************************************************************************/	
INSTANCE ItRu_SumGol (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_SumGol;

	visual				=	"ItRu_SumGol.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_SummonGolem;
	mag_circle			= 	4;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_SummonGolem;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_Cost_SummonGolem;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

INSTANCE ItRu_SumFireGol (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_SumGol;

	visual				=	"ItRu_SumGol.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_SummonFireGolem;
	mag_circle			= 	4;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_SummonFireGolem;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_Cost_SummonFireGolem;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

INSTANCE ItRu_SumUDSwampshark (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_SumGol;

	visual				=	"ItRu_SumGol.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_SummonUDSwampshark;
	mag_circle			= 	2;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_SummonUDSwampshark;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_Cost_SummonUDSwampshark;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

INSTANCE ItRu_SumIceGol (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_SumGol;

	visual				=	"ItRu_SumGol.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_SummonIceGolem;
	mag_circle			= 	4;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_SummonIceGolem;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_Cost_SummonIceGolem;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/	
INSTANCE ItRu_SumGol_Fake (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	Value_Ru_SumGol;

	visual				=	"ItRu_SumGol.3DS";
	material			=	MAT_STONE;

	mag_circle			= 	4;
	

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_SummonGolem;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_Cost_SummonGolem;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_HarmUndead (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_HarmUndead;

	visual				=	"ItRu_HarmUndead.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_DESTROYUNDEAD;
	mag_circle			= 	4;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_DestroyUndead;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_DESTROYUNDEAD;
	
	TEXT	[2]			=	NAME_Dam_Magic;				
	COUNT	[2]			=	SPL_DAMAGE_DESTROYUNDEAD;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_Pyrokinesis (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Pyrokinesis;

	visual				=	"ItRu_Pyrokinesis.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_PYROKINESIS;
	mag_circle 			=	5;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_YELLOW";

	description			=	NAME_SPL_Pyrokinesis;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;						
	
	TEXT	[1]			=	NAME_MinManakosten;							
	COUNT	[1]			=	STEP_Firestorm;
	
	TEXT	[2]			=	NAME_ManakostenMax;							
	COUNT	[2]			=	SPL_COST_Firestorm;
	
	TEXT	[3]			=	NAME_Addon_Damage_Min;
	count 	[3]			=   SPL_TEXT_Damage_Firestorm;
	
	TEXT	[4]			=	NAME_Damage_Max;
	COUNT	[4]			=	(SPL_TEXT_Damage_Firestorm*4);
	
	TEXT	[5]			=	NAME_Value;									
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_Pyrokinesis_g1 (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Pyrokinesis;

	visual				=	"ItRu_Pyrokinesis.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_PYROKINESIS_g1;
	mag_circle 			=	5;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_YELLOW";

	description			=	"Pyrokinese";
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;		
	
	TEXT	[5]			=	NAME_Value;									
	COUNT	[5]			=	value;
};

/*******************************************************************************************/
// Kreis 5
INSTANCE ItRu_Firestorm (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Firestorm;

	visual				=	"ItRu_Firestorm.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_FIRESTORM;
	mag_circle 			=	3;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_YELLOW";

	description			= 	NAME_SPL_Firestorm;
	
	TEXT	[0]			=	NAME_Mag_Circle;							
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;							
	COUNT	[1]			=	SPL_COST_INSTANTFIRESTORM;
	
	TEXT	[2]			=	NAME_Dam_Magic;	
	COUNT	[2]			=	SPL_TEXT_DAMAGE_INSTANTFIRESTORM;
	
	TEXT	[5]			=	NAME_Value;									
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_IceWave (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_IceWave;

	visual				=	"ItRu_IceWave.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_ICEWAVE;
	mag_circle 			=	5;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_BLUE";

	description			=	NAME_SPL_IceWave;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_Cost_IceWave;
	
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
INSTANCE ItRu_SumDemon (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_SumDemon;

	visual				=	"ItRu_SumDemon.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_SUMMONDEMON;
	mag_circle			=	5;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_SummonDemon;
	
	TEXT	[0]			=	NAME_Mag_Circle;
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_SUMMONDEMON;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_SumDragon (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_SumDemon;

	visual				=	"ItRu_SumDemon.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_SUMMONDragon;
	mag_circle			=	6;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_SummonDragon;
	
	TEXT	[0]			=	NAME_Mag_Circle;
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_SUMMONDragon;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_FullHeal (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_FullHeal;

	visual				=	"ItRu_FullHeal.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_FullHeal;
	mag_circle			=	5;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_FullHeal;
	
	TEXT	[0]			=	NAME_Mag_Circle;
	COUNT	[0]			=	mag_circle;	
	
	TEXT	[1]			=	NAME_Manakosten;		
	COUNT	[1]			=	SPL_Cost_FullHeal;
	
	TEXT	[2]			=	NAME_HealingPerCast;		
	COUNT	[2]			=	SPL_Heal_FullHeal;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
// Kreis 6
INSTANCE ItRu_Firerain (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Firerain;

	visual				=	"ItRu_Firerain.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_FIRERAIN;
	mag_circle 			= 	6;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_YELLOW";

	description			=	NAME_SPL_Firerain;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_FIRERAIN;
	
	TEXT	[2]			=	NAME_Dam_Magic;				
	COUNT	[2]			=	SPL_TEXT_DAMAGE_FIRERAIN;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

INSTANCE ItRu_Icerain (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Firerain;

	visual				=	"ItRu_Icerain.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_ICERAIN;
	mag_circle 			= 	6;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_YELLOW";

	description			=	NAME_SPL_Icerain;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_ICERAIN;
	
	TEXT	[2]			=	NAME_Dam_Magic;				
	COUNT	[2]			=	SPL_TEXT_DAMAGE_ICERAIN;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_BreathOfDeath (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_BreathOfDeath;

	visual				=	"ItRu_BreathOfDeath.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_BREATHOFDEATH;
	mag_circle 			=	5;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_RED";

	description			=	NAME_SPL_BreathOfDeath;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_BREATHOFDEATH;
	
	TEXT	[2]			=	NAME_Dam_Magic;				
	COUNT	[2]			=	SPL_TEXT_DAMAGE_BREATHOFDEATH;
		
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_ArgezVision (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_BreathOfDeath;

	visual				=	"ItRu_BreathOfDeath.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_ArgezVision;
	mag_circle 			=	5;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_RED";

	description			=	NAME_SPL_BreathOfDeath;
	
	TEXT	[0]			=	NAME_Mag_Circle;			
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_BREATHOFDEATH;
	
	TEXT	[2]			=	NAME_Dam_Magic;				
	COUNT	[2]			=	SPL_TEXT_DAMAGE_BREATHOFDEATH;
		
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/

INSTANCE ItRu_MassDeath (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Ru_MassDeath;

	visual				=	"ItAr_Rune_14.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_MASSDEATH;
	mag_circle 			=	6;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_RED";

	description			=	NAME_SPL_MassDeath;
	
	TEXT	[0]			=	NAME_Mag_Circle;
	COUNT	[0]			=	mag_circle;

	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_MASSDEATH;
	
	TEXT	[2]			=	NAME_Dam_Magic;				
	COUNT	[2]			=	SPL_TEXT_DAMAGE_MASSDEATH;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/

INSTANCE ItRu_Deathwave (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MISSION;

	value 				=	Value_Ru_Deathwave;

	visual				=	"ItAr_Rune_14.3ds";
	material			=	MAT_STONE;

	spell				= 	SPL_Deathwave;
	mag_circle 			=	6;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_RED";

	description			=	NAME_SPL_Deathwave;
	
	TEXT	[0]			=	NAME_Mag_Circle;
	COUNT	[0]			=	mag_circle;

	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_Deathwave;
	
	TEXT	[2]			=	NAME_Dam_Magic;				
	COUNT	[2]			=	SPL_DAMAGE_Deathwave;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/

INSTANCE ItRu_MasterOfDisaster	(C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_MasterOfDisaster;

	visual				=	"ItRu_MasterOfDesaster.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_MasterOfDisaster;
	mag_circle 			=	6;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_RED";

	description			=	NAME_SPL_MasterOfDisaster;
	
	TEXT	[0]			=	NAME_Mag_Circle;
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_MasterOfDisaster;
	
	TEXT	[2]			=	NAME_Dam_Magic;				
	COUNT	[2]			=	SPL_TEXT_DAMAGE_MasterOfDisaster;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_ArmyOfDarkness (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_ArmyofDarkness;

	visual				=	"ItRu_ArmyOfDarkness.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_ARMYOFDARKNESS;
	mag_circle			=	6;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_RED";

	description			=	NAME_SPL_ArmyOfDarkness;
	TEXT	[0]			=	NAME_Mag_Circle;		
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_ARMYOFDARKNESS;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
INSTANCE ItRu_SummonZombieArmy (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_ArmyofDarkness;

	visual				=	"ItRu_ArmyOfDarkness.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_SummonZombieArmy;
	mag_circle			=	6;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER_RED";

	description			=	name;
	TEXT	[0]			=	NAME_Mag_Circle;		
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_SummonZombieArmy;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/
INSTANCE ItRu_Shrink (C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Shrink;

	visual				=	"ItRu_Shrink.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_SHRINK;
	mag_circle			=	6;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	NAME_SPL_Shrink;
	
	TEXT	[0]			=	NAME_Mag_Circle;		
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_SHRINK;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};
/*******************************************************************************************/

//#########################
//NPC Spell
//#########################

INSTANCE ItRu_Deathbolt	(C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	0;

	visual				=	"ItRu_PalRepelEvil.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_Deathbolt;
	mag_circle 			=	6;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Deathbolt";
	
	TEXT	[0]			=	NAME_Mag_Circle;
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_Deathbolt;
	
	TEXT	[2]			=	NAME_Dam_Magic;				
	COUNT	[2]			=	SPL_DAMAGE_Deathbolt;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

INSTANCE ItRu_Deathball	(C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	0;

	visual				=	"ItRu_PalRepelEvil.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_Deathball;
	mag_circle 			=	6;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Deathball";
	
	TEXT	[0]			=	NAME_Mag_Circle;
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_Deathball;
	
	TEXT	[2]			=	NAME_Dam_Magic;				
	COUNT	[2]			=	SPL_DAMAGE_Deathball;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

INSTANCE ItRu_Concussionbolt	(C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	0;

	visual				=	"ItRu_PalRepelEvil.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_Concussionbolt;
	mag_circle 			=	6;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Concussionbolt";
	
	TEXT	[0]			=	NAME_Mag_Circle;
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_Concussionbolt;
	
	TEXT	[2]			=	NAME_Dam_Magic;				
	COUNT	[2]			=	SPL_DAMAGE_Concussionbolt;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

//Für Hexen
INSTANCE ItRu_Blutopfer	(C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Blutopfer;

	visual				=	"ItRu_PalRepelEvil.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_Blutopfer;
	mag_circle 			=	4;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Blutopfer";
	
	TEXT	[0]			=	NAME_Mag_Circle;
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_Blutopfer;
	
	TEXT	[2]			=	NAME_Dam_Magic;				
	COUNT	[2]			=	SPL_DAMAGE_Blutopfer;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

//Für Gurus
INSTANCE ItRu_Seelenraub	(C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Seelenraub;

	visual				=	"ItRu_Sleep.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_Seelenraub;
	mag_circle 			=	3;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Seelenraub";
	
	TEXT	[0]			=	NAME_Mag_Circle;
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_Seelenraub;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};

//Mal sehen
INSTANCE ItRu_Wahnsinn	(C_Item)
{
	name 				=	NAME_Rune;

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;

	value 				=	Value_Ru_Wahnsinn;

	visual				=	"ItRu_Sleep.3DS";
	material			=	MAT_STONE;

	spell				= 	SPL_Wahnsinn;
	mag_circle 			=	3;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_WEAKGLIMMER";

	description			=	"Wahnsinn";
	
	TEXT	[0]			=	NAME_Mag_Circle;
	COUNT	[0]			=	mag_circle;
	
	TEXT	[1]			=	NAME_Manakosten;			
	COUNT	[1]			=	SPL_COST_Wahnsinn;
	
	TEXT	[5]			=	NAME_Value;					
	COUNT	[5]			=	value;
};



























