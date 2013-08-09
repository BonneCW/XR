// ************************************************************************************************
// Wert von Kram
// ************************************************************************************************

// Items für Objektbenutzung und Item-Interaktion...
// z.B. Krautstampfer, Hammer, Kochlöffel, Laborflasche, Roheisen (Schmiede)

const int	Value_SwordBlade		= 10;
const int	Value_SwordBladeHot		= 10;
const int	Value_SwordRawHot		= 10;
const int	Value_SwordRaw			= 10;

const int	Value_Brush				= 3;	
const int	Value_Flask				= 3;
const int	Value_Stomper			= 3;
const int 	Value_Pan				= 20;
const int 	Value_Saw				= 20;
const int	Value_Broom				= 10;
const int	Value_Rake				= 10;

const int	Value_Hammer			= 10;
const int	Value_Scoop				= 3;
const int	Value_Nugget			= 50;
const int	Value_Joint				= 30;
const int	Value_Alarmhorn			= 10;
const int	Value_Lute				= 10;
const int	Value_Gold				= 1;

const int	Value_RuneBlank			= 100;

const int	Value_Sulfur			= 20;
const int	Value_Quartz			= 20;
const int	Value_Pitch			= 10;
const int	Value_Rockcrystal		= 30;
const int	Value_Aquamarine		= 100;
const int	Value_HolyWater			= 20;
const int	Value_Coal				= 15;
const int	Value_DarkPearl			= 1000;

//Tabak
const int 	VALUE_ItMi_ApfelTabak	= 10;
const int 	VALUE_ItMi_PilzTabak	= 10;
const int 	VALUE_ItMi_SumpfTabak	= 10;
const int 	VALUE_ItMi_DoppelTabak	= 10;
const int 	VALUE_ItMi_HonigTabak	= 10;

//Schmuck Items 
const int	Value_SilverRing		 = 120; 
const int	Value_SilverNecklace	 = 200;
const int	Value_SilverCandleHolder =  50;
const int	Value_SilverPlate	 	 = 100; //muss durch 2 teilbar in B_Say Gold enthalten sein
const int	Value_SilverCup			 = 100; //muss durch 2 teilbar in B_Say Gold enthalten sein
const int	Value_SilverChalice		 = 250;

const int 	Value_GoldPlate			=  200;
const int	Value_GoldRing			=  250;
const int	Value_GoldNecklace		=  300;
const int	Value_GoldCandleHolder	=  120;
const int	Value_GoldCup			=  350;
const int	Value_BloodCup			=  200;
const int   Value_GoldChalice		=  500;
const int   Value_GoldChest			=  750;
const int	Value_JeweleryChest		= 1000;

const int   Value_InnosStatue		=  100;
const int	Value_Sextant			= 1500;


/*ursprüngliche Werte:
const int	Value_SilverRing		 = 200;
const int	Value_SilverNecklace	 = 100;
const int	Value_SilverCandleHolder = 30 ;
const int	Value_SilverPlate	 	 = 100;
const int	Value_SilverCup			 = 200;
const int	Value_SilverChalice		 = 100;
                                           
const int	Value_GoldRing			= 1150;
const int	Value_GoldNecklace		= 250 ;
const int	Value_GoldCandleHolder	= 300 ;
const int	Value_GoldCup			= 800 ;
const int   Value_GoldChalice		= 400 ;
const int   Value_GoldChest			= 1000;
const int	Value_JeweleryChest		= 50  ;
                                           
const int   Value_InnosStatue		= 100 ;
const int	Value_Sextant			= 30  ;
*/








/*******************************************************************************************
**	Items für Mobsi-Benutzung               					  		  				  **
*******************************************************************************************/
// Krautstampfen

INSTANCE ItMi_ScavengerEgg (C_Item)
{
	name 				=	"Scavengerei";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	Value_Stomper;

	visual 				=	"ItAt_ScavengerEgg.3DS";
	material 			=	MAT_WOOD ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5] 	= 	value;
};

INSTANCE ItAr_FakeArmor_Alvar (C_Item)
{
	name 				=	"Alvars Rüstung";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	Value_Stomper;

	visual 				=	"ItAr_Eisgebiet_02.3DS";
	material 			=	MAT_WOOD ;

	description			= 	name;
	TEXT[1]				=	"Das war die Rüstung von Alvar.";
	TEXT[2]				=	"Irgendetwas Hartes ist eingenäht.";
	TEXT[5]				= 	NAME_Value;	COUNT[5] 	= 	value;
};

INSTANCE ItMi_Stomper (C_Item)
{
	name 				=	"Krautstampfer";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	Value_Stomper;

	visual 				=	"ItMi_Stomper.3DS";
	material 			=	MAT_WOOD ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5] 	= 	value;
};

INSTANCE ItMi_Paddel (C_Item) 
{	
	name 				=	"Paddel";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MISSION;
	material 			=	MAT_WOOD;

	value 				=	200;

	damageTotal			= 	20;
	damagetype			=	DAM_BLUNT;
	range    			=  	140;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	15;
	visual 				=	"ItMw_Paddel.3DS";

	description			= 	name;

	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3]				= NAME_Str_Needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMi_UrizielKaputt (C_Item)
{
	name 				=	"Ein Bruchstück von Uriziel";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_SHOW;

	value 				=	100;

	visual 				=	"ItMi_UrizielKaputt.3DS";
	material 			=	MAT_WOOD ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5] 	= 	value;
};

INSTANCE ItMi_Kuschelfell (C_Item)
{
	name 				=	"Kuschelfell";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	250;

	visual 				=	"ItAt_WolfFur.3DS";
	material 			=	MAT_WOOD ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5] 	= 	value;
};

INSTANCE ItMi_Kornballen (C_Item)
{
	name 				=	"Kornsack";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	50;

	visual 				=	"OC_Sack_V03.3ds";
	material 			=	MAT_WOOD ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5] 	= 	value;
};

INSTANCE ItMi_Hopfensack (C_Item)
{
	name 				=	"Hopfensack";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	50;

	visual 				=	"OC_Sack_V03.3ds";
	material 			=	MAT_WOOD ;

	description			= 	name;
	TEXT[1]				=	"von Erhard für den Brauer";
	TEXT[5]				= 	NAME_Value;	COUNT[5] 	= 	value;
};

INSTANCE ItMi_Mehlsack_Bronko (C_Item)
{
	name 				=	"Mehlsack";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	0;

	visual 				=	"OC_Sack_V03.3ds";
	material 			=	MAT_WOOD ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5] 	= 	value;
};

INSTANCE ItMi_Trollholz (C_Item)
{
	name 				=	"Trollholz";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	25;

	visual 				=	"baumstamm1.3DS";
	material 			=	MAT_WOOD ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5] 	= 	value;
};

INSTANCE ItMi_EimerW (C_Item)
{
	name 				=	"Eimer voller Wasser";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	Value_Stomper;

	visual 				=	"Xeres_Eimer_1.3DS";
	material 			=	MAT_WOOD ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5] 	= 	value;
};

INSTANCE ItMi_Eimer (C_Item)
{
	name 				=	"leerer Eimer";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	Value_Stomper;

	visual 				=	"Xeres_Eimer_1.3DS";
	material 			=	MAT_WOOD ;
	scemeName			=	"VERTEILEN";
	on_state[0]			=	Use_Eimer;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5] 	= 	value;
};

FUNC VOID Use_Eimer()
{
	if (Npc_GetDistToWP(hero, "WP_WASSERHOLEN") < 500)
	|| (Npc_GetDistToWP(hero, "WP_WASSERHOLEN2") < 500)
	|| (Npc_GetDistToWP(hero, "WP_WASSERHOLEN3") < 500)
	|| (Npc_GetDistToWP(hero, "WP_WASSERHOLEN4") < 500)
	|| (Npc_GetDistToWP(hero, "WP_WASSERHOLEN5") < 500)
	|| (Npc_GetDistToWP(hero, "WP_WASSERHOLEN6") < 500)
	|| (Npc_GetDistToWP(hero, "WP_WASSERHOLEN7") < 500)
	|| (Npc_GetDistToWP(hero, "WP_WASSERHOLEN8") < 500)
	|| (Npc_GetDistToWP(hero, "WP_WASSERHOLEN9") < 500)
	{
		CreateInvItems	(hero, ItMi_EimerW, 1);

		AI_PlayAni	(hero, "T_PLUNDER");
	}
	else
	{
		Print ("Das geht hier nicht!");

		CreateInvItems	(hero, ItMi_Eimer, 1);
	};
};

INSTANCE ItMi_Wolfsfelle (C_Item)
{
	name 				=	"Wolfsfelle";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	100;

	visual 				=	"ItMi_Wolfsfelle.3DS";
	material 			=	MAT_WOOD ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5] 	= 	value;
};

/******************************************************************************************/
INSTANCE ItMi_MerkwuerdigesDing (C_Item)
{
	name 				=	"Merkwürdiges Ding";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual 				=	"ItAt_SwampGolemHeart.3DS";
	material 			=	MAT_STONE;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_MerkwuerdigeDinger (C_Item)
{
	name 				=	"Merkwürdiges kleines Ding";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	10;

	visual 				=	"ItAt_SwampGolemHeart.3DS";
	material 			=	MAT_STONE;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_HerzFragment (C_Item)
{
	name 				=	"Golemherzfragment";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	10;

	visual 				=	"ItAt_SwampGolemHeart.3DS";
	material 			=	MAT_STONE;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_Pinsel (C_Item)
{
	name 				=	"Pinsel";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	Value_Stomper;

	visual 				=	"ItMi_Pinsel.3DS";
	material 			=	MAT_WOOD ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5] 	= 	value;
};

INSTANCE ItMi_Kerze (C_Item)
{
	name 				=	"Kerze";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	Value_Stomper;

	visual 				=	"nw_city_candle_01.3DS";
	material 			=	MAT_WOOD ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5] 	= 	value;
};

INSTANCE ItMi_LurkerEgg (C_Item)
{
	name 				=	"Lurkerei";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	Value_Stomper;

	visual 				=	"ItAt_LurkerEgg.3DS";
	material 			=	MAT_WOOD ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5] 	= 	value;
};

INSTANCE ItMi_LurkerEgg_MIS (C_Item)
{
	name 				=	"Lurkerei";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	Value_Stomper;

	visual 				=	"ItAt_LurkerEgg.3DS";
	material 			=	MAT_WOOD ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5] 	= 	value;
};

INSTANCE ItMi_EchsenEgg (C_Item)
{
	name 				=	"Echsenei";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI|ITEM_SHOW;

	value 				=	Value_Stomper;

	visual 				=	"ItAt_LurkerEgg.3DS";
	material 			=	MAT_WOOD ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5] 	= 	value;
};

INSTANCE ItMi_Palette (C_Item)
{
	name 				=	"Palette";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	Value_Stomper;

	visual 				=	"ItMi_Palette.3DS";
	material 			=	MAT_WOOD ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5] 	= 	value;
};

INSTANCE ItMi_Feder (C_Item)
{
	name 				=	"Feder zum Schreiben";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	1;

	visual 				=	"Feder1.3ds";
	material 			=	MAT_METAL;

	
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_Feldraeubereier (C_Item)
{
	name 				=	"Eimer mit Feldräubereiern";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	30;

	on_state[0]	=	Use_Feldraeubereier;
	scemename			=	"EIMER";

	visual 				=	"Xeres_Ani_Eimer.3DS";
	material 			=	MAT_WOOD ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5] 	= 	value;
};

func void Use_Feldraeubereier()
{
	if (Npc_GetDistToWP(hero, "NW_BIGFARM_FELDREUBER4") < 500)
	{
		AI_PlayAni	(hero, "T_PLUNDER");

		Mod_EimerAusgeleert = TRUE;
		Npc_RemoveInvItems	(hero, ItMi_Feldraeubereier, 1);

		B_LogEntry	(TOPIC_MOD_JG_BUGS, "Der Eimer ist leer. Jetzt zurück zu Dragomir.");
	}
	else
	{
		CreateInvItems	(hero, ItMi_Feldraeubereier, 1);

		Print ("Geht nicht!");
	};
};
/******************************************************************************************/
// Runen Bauen
INSTANCE ItMi_RuneBlank (C_Item)
{
	name 				=	"Runenstein";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	Value_RuneBlank;

	visual 				=	"ItMi_RuneBlank.3DS";
	material 			=	MAT_STONE;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5] 			= 	value;
};

INSTANCE ItMi_RuneBlank_Greg (C_Item)
{
	name 				=	"Gregs Runenstein";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	Value_RuneBlank;

	visual 				=	"ItMi_RuneBlank.3DS";
	material 			=	MAT_STONE;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5] 			= 	value;
};

INSTANCE ItMi_BrokenRune01 (C_Item)
{
	name 				=	"Hälfte einer Rune";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	Value_RuneBlank;

	visual 				=	"Zerbrochenderune.3DS";
	material 			=	MAT_STONE;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5] 			= 	value;
};

INSTANCE ItMi_BrokenRune02 (C_Item)
{
	name 				=	"Hälfte einer Rune";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	Value_RuneBlank;

	visual 				=	"Zerbrochenderune.3DS";
	material 			=	MAT_STONE;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5] 			= 	value;
};

INSTANCE ItMi_BrokenRune03 (C_Item)
{
	name 				=	"Hälfte einer Rune";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	999999999;

	visual 				=	"Zerbrochenderune.3DS";
	material 			=	MAT_STONE;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5] 			= 	value;
};

INSTANCE ItMi_SpezielleRune (C_Item)
{
	name 				=	"Rune";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI|ITEM_SHOW|ITEM_MISSION;

	value 				=	Value_RuneBlank;

	visual 				=	"ItMi_RuneBlank.3DS";
	material 			=	MAT_STONE;

	description			= 	name;
	TEXT[1]				=	"hatte ein Feuer Novize bei sich";
	TEXT[5]				= 	NAME_Value;	
	COUNT[5] 			= 	value;
};

INSTANCE ItMi_SumpfhaiStein (C_Item)
{
	name 				=	"Magischer Stein";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	Value_RuneBlank;

	visual 				=	"Sammelrune.3DS";
	material 			=	MAT_STONE;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5] 			= 	value;
};

INSTANCE ItMi_KristallPrisma (C_Item)
{
	name 				=	"Kristall der Prismen";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	Value_RuneBlank;

	visual 				=	"Sammelrune.3DS";
	material 			=	MAT_STONE;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5] 			= 	value;
};

INSTANCE ItMi_TeleportStein (C_Item)
{
	name 				=	"Teleportstein";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	0;

	visual 				=	"Sammelrune.3DS";
	material 			=	MAT_STONE;

	on_state[0]	=	Use_TeleportStein;
	scemename			=	"MAPSEALED";

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5] 			= 	value;
};

func void Use_TeleportStein()
{
	AI_Teleport	(self, "WP_PAT_WEG_58");
};

INSTANCE ItMi_Geisterrune (C_Item)
{
	name 				=	"Geisterrune";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;


	visual 				=	"ItMi_RuneBlank.3DS";
	material 			=	MAT_STONE;

	description			= 	name;	
};

INSTANCE ItMi_Geisterrune_Voll (C_Item)
{
	name 				=	"Geisterrune (Voll)";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;


	visual 				=	"ItMi_RuneBlank.3DS";
	material 			=	MAT_STONE;

	description			= 	name;	
};

INSTANCE ItMi_Pliers (C_Item)
{
	name 				=	"Zange";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	Value_RuneBlank;

	visual 				=	"ItMi_Pliers.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5] 			= 	value;
};
/******************************************************************************************/
// Labor Wasserflasche
INSTANCE ItMi_Flask (C_Item)
{
	name 				=	"Laborwasserflasche";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	Value_Flask;

	visual 				=	"ItMi_Flask.3ds";
	material 			=	MAT_GLAS;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5] 			= 	value;
};
INSTANCE ItMi_Rueckverwandlungstinktur (C_Item)
{
	name 				=	"Rückverwandlungstinktur";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	Value_Flask;

	visual 				=	"ItMi_Flask.3ds";
	material 			=	MAT_GLAS;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5] 			= 	value;
};
INSTANCE ItMi_Flask_Brauen (C_Item)
{
	name 				=	"Laborwasserflasche";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	Value_Flask;

	visual 				=	"ItMi_Flask.3ds";
	material 			=	MAT_GLAS;
	scemeName	=	"BRAUEN";

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5] 			= 	value;
};
/******************************************************************************************/
// Labor Wasserflasche
INSTANCE ItMi_Sprengstoff (C_Item)
{
	name 				=	"Sprengstoff";

	mainflag 			=	ITEM_KAT_NONE;
	flags				=	ITEM_MULTI;

	value 				=	Value_Flask;

	visual 				=	"ItMi_Flask.3ds";
	material 			=	MAT_GLAS;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5] 			= 	value;
};
/******************************************************************************************/
// Reparieren
INSTANCE ItMi_Hammer (C_Item)
{
	name 				=	"Hammer";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Hammer;

	visual 				=	"ItMi_Hammer.3DS";
	material 			=	MAT_WOOD;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

INSTANCE ItMi_Hammer_Kaputt (C_Item)
{
	name 				=	"Hammer";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Hammer;

	visual 				=	"ItMi_Hammer.3DS";
	material 			=	MAT_WOOD;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
// im Topf rühren
INSTANCE ItMi_Scoop (C_Item)
{
	name 				=	"Kochlöffel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Scoop;

	visual 				=	"ItMi_Scoop.3DS";
	material 			=	MAT_WOOD;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
// im Topf rühren
INSTANCE ItMi_Scoop_Glenn (C_Item)
{
	name 				=	"Glenn's Kochlöffel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_SHOW;

	value 				=	Value_Scoop;

	visual 				=	"ItMi_Scoop.3DS";
	material 			=	MAT_WOOD;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
//	Pfanne zum Braten (für  Lagerfeuer)

INSTANCE ItMi_Pan (C_Item)
{
	name 				=	"Pfanne";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Pan;

	visual 				=	"ItMi_Pan.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

//Pfann für Herd

INSTANCE ItMi_PanFull (C_Item)
{
	name 				=	"Pfanne";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Pan;

	visual 				=	"ItMi_PanFull.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

INSTANCE ItMi_MagischePfanne (C_Item)
{
	name 				=	"Pfanne";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Pan;

	visual 				=	"ItMi_Pan.3DS";
	material 			=	MAT_METAL;

	scemeName			=	"PAN";
	on_state[0]			=	Use_MagischePfanne;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

FUNC VOID Use_MagischePfanne()
{
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		B_SetAivar(self, AIV_INVINCIBLE, TRUE);
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_Herd;
		Ai_ProcessInfos (her);
	};
};
/******************************************************************************************/
//	Säge für Baumstamm

INSTANCE ItMi_Saw (C_Item)
{
	name 				=	"Säge";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Saw;

	visual 				=	"ItMi_Saw.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};	   	   

/******************************************************************************************/
//	Items für Schmiede	    					 								 		  **

INSTANCE ItMiSwordraw (C_Item)
{
	name 				=	"Rohstahl";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SwordRaw;

	visual 				=	"ItMiSwordraw.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				=	NAME_Value;	
	COUNT[5]			= 	value;
};

INSTANCE ItMi_ReinerErzrohling_Small (C_Item)
{
	name 				=	"Kleiner reiner Erzrohling";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SwordRaw;

	visual 				=	"ItMiSwordraw.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				=	NAME_Value;	
	COUNT[5]			= 	value;
};

INSTANCE ItMi_ReinerErzrohling_Big (C_Item)
{
	name 				=	"Großer reiner Erzrohling";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SwordRaw;

	visual 				=	"ItMiSwordraw.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				=	NAME_Value;	
	COUNT[5]			= 	value;
};

INSTANCE ItMi_Metallblock (C_Item)
{
	name 				=	"Metallblock";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SwordRaw/2;

	visual 				=	"Metallblock.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				=	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMiSwordrawhot (C_Item)
{
	name 				=	"Glühender Stahl";

	mainflag 			=	ITEM_KAT_NONE; 
	flags 				=	ITEM_MULTI;

	value 				=	Value_SwordRawHot;

	visual 				=	"ItMiSwordrawhot.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

/******************************************************************************************/
INSTANCE ItMiSwordbladehot (C_Item)
{
	name 				=	"Glühende Klinge";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SwordBladehot;

	visual 				=	"ItMiSwordbladehot.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

/******************************************************************************************/
INSTANCE ItMiSwordblade	(C_Item)
{
	name 				=	"Klinge";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SwordBlade;

	visual 				=	"ItMiSwordblade.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};


/******************************************************************************************/


/*******************************************************************************************
**	Items für Item-Interaktionen (ohne Mobsi benutzbar)               		 		  	  **
*******************************************************************************************/

/******************************************************************************************/
// Besen zum Fegen
INSTANCE ItMi_Broom (C_Item)
{
	name 				=	"Besen";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Broom;

	visual 				=	"ItMi_Broom.3DS";
	material 			=	MAT_WOOD;

	scemeName			=	"BROOM";
	on_state[0]			= 	Use_Broom;
	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
func void Use_Broom()
{
	if (Npc_IsPlayer(self))
	&& (Wld_GetPlayerPortalGuild() == GIL_NOV)
	&& (MIS_ParlanFegen == LOG_RUNNING)
	{
		B_Say (self, self, "$NOSWEEPING");
		Print (PRINT_NoSweeping);
	};
};

INSTANCE ItMi_Sense (C_Item)
{
	name 				=	"Sense";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Broom;

	visual 				=	"ItMi_Arbeitssense.3DS";
	material 			=	MAT_WOOD;

	scemeName			=	"BROOM";
	on_state[0]			= 	Use_Broom;
	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
// zum Rumklimpern
INSTANCE ItMi_Lute (C_Item)
{
	name 				=	"Laute";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Lute;

	visual 				=	"ItMi_Lute.3DS";
	material 			=	MAT_WOOD;

	scemeName			=	"LUTE";
	on_state[0]			= 	Use_Lute;
	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
func void Use_Lute()
{
	if (Mod_KuenstlerLaute == FALSE)
	&& (Mod_KuenstlerRing == TRUE)
	{
		Mod_KuenstlerLaute = TRUE;

		B_GivePlayerXP (500);

		PrintScreen	("Lautenspiel Künstlerbonus: 500", -1, YPOS_XPGained+5, FONT_ScreenSmall, 2);
	};
};

INSTANCE ItMi_Lute_Zeki (C_Item)
{
	name 				=	"Zeki's Laute";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Lute;

	visual 				=	"ItMi_Lute.3DS";
	material 			=	MAT_WOOD;

	scemeName			=	"LUTE";
	on_state[0]			= 	Use_Lute;
	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

INSTANCE ItMi_Kamm(C_Item)
{
	name 				=	"Kamm";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Brush;

	visual				=	"kamm.3ds";
	material 			=	MAT_WOOD;
	
	description			= 	name;
	
	TEXT[1]				=	"Einfacher Kamm, der mit etwas Erz überzogen ist";
	TEXT[2]				=	"Kann in einem einfachen Schmiedefeuer zerstört werden";
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

INSTANCE ItMi_MagicKamm(C_Item)
{
	name 				=	"verzauberter Kamm";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Brush;

	visual				=	"kamm2.3ds";
	material 			=	MAT_WOOD;
	
	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};


/******************************************************************************************/
// Für Babe-Putzen
INSTANCE ItMi_Brush(C_Item)
{
	name 				=	"Bürste";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Brush;

	visual				=	"ItMi_Brush.3ds";
	material 			=	MAT_WOOD;
	scemeName			=	"BRUSH";
	on_state[0]			= 	Use_Brush;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

func void Use_Brush()
{
	
};


/******************************************************************************************/
INSTANCE ItMi_Joint(C_Item)
{
	name 				=	"Ein Stängel Sumpfkraut";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Joint;

	visual 				=	"ItMi_Joint_US.3ds";
	material 			=	MAT_LEATHER;

	scemeName			=	"JOINT";
	on_state[0]			= 	Use_Joint;
	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	
};
func void Use_Joint()
{
	if (Npc_IsPlayer (self))
	{
		//Wld_PlayEffect ("SLOW_TIME", self, self, 0, 0, 0, FALSE);

		Mod_JointCounter += 1;
	};
};

var int Traumruf_FirstTime;

INSTANCE ItMi_Traumruf(C_Item)
{
	name 				=	"Ein Stängel Traumruf";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual 				=	"ItMi_Joint_US.3ds";
	material 			=	MAT_LEATHER;

	scemeName			=	"JOINT";
	on_state[0]			= 	Use_Traumruf;
	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	
};
func void Use_Traumruf()
{
	if (Npc_IsPlayer (self))
	{
		if (Traumruf_FirstTime == FALSE)
		{
			Traumruf_FirstTime = TRUE;

			B_RaiseAttribute_Rest (self,	ATR_MANA_MAX, 5);
		};
		//Wld_PlayEffect ("SLOW_TIME", self, self, 0, 0, 0, FALSE);

		Mod_JointCounter += 1;
	};
};

INSTANCE ItMi_Joint_Herkules(C_Item)
{
	name 				=	"Herkulesstängel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Joint;

	visual 				=	"ItMi_Joint_US.3ds";
	material 			=	MAT_LEATHER;

	scemeName			=	"JOINT";
	on_state[0]			= 	Use_Joint_Herkules;
	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	
};
func void Use_Joint_Herkules()
{
	if (Npc_IsPlayer (self))
	&& (Mod_HasHerkulesIntus == 0)
	{
		Wld_PlayEffect ("SLOW_TIME", self, self, 0, 0, 0, FALSE);

		hero.attribute[ATR_HITPOINTS] -= hero.attribute[ATR_HITPOINTS_MAX] / 5;

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		Mdl_ApplyOverlayMDS	(hero, "HUMANS_SPRINT.MDS");

		hero.attribute[ATR_STRENGTH] += 20;

		Mod_HasHerkulesIntus = 180;
	};

	Mod_JointCounter += 1;
};
/******************************************************************************************/
INSTANCE ItMi_StrandBild(C_Item)
{
	name 				=	"Bild";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItMi_StrandBild.3ds";
	scemename			=	"MAP";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseStrandBild;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID UseStrandBild()
{
	var int Document;
	Document =	Doc_CreateMap		();
		Doc_SetPages		(Document, 1);
		Doc_SetPage 		(Document, 0, "StrandBild.tga", TRUE);  // TRUE = scale to fullscreen
		Doc_Show			(Document);
};

//*******************************
//Päckchen
//*******************************
INSTANCE ItMi_Packet(C_Item)
{
	name 				=	"Päckchen";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_LEATHER;
	//on_state[0]			=   UsePacket;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_PortsKoffer(C_Item)
{
	name 				=	"Koffer";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"Koffer.3ds";
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[0]		= "Enthält Bilder und Malerutensilien";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_Kleiderkoffer (C_Item)
{
	name 				=	"Kleiderkoffer";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[0]		= "Enthält Kleider von Elvira";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_Nagelpaket (C_Item)
{
	name 				=	"Nagelpaket";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_SHOW;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_NagurPaket (C_Item)
{
	name 				=	"Paket";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_SHOW;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[1]				=	"Paket mit Schmuggelware von Nagur";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_SekobSagitta (C_Item)
{
	name 				=	"Paket für Sagitta";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_SHOW;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_ErzpaketDarrion (C_Item)
{
	name 				=	"Paket mit gesegnetem Stahl";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_SHOW;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_PfeilpaketZelar (C_Item)
{
	name 				=	"Paket mit magischen Pfeilen";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_SHOW;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_FreudenspenderPaket (C_Item)
{
	name 				=	"Paket Freudenspender";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_SHOW;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_JanaBeutel (C_Item)
{
	name 				=	"Janas Einkaufsbeutel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_SHOW;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_ArgezBruchstuecke (C_Item)
{
	name 				=	"Beutel mit Bruchstücken";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_SHOW;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_CronosBeutel (C_Item)
{
	name 				=	"Beutel für Cronos";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_SHOW;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_GrogPaket_Matteo (C_Item)
{
	name 				=	"Paket Grog";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_SHOW;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_Heu (C_Item)
{
	name 				=	"Heu";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_SHOW;

	value 				=	0;

	visual 				=	"nw_misc_straw_02.3DS";
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_Kissen (C_Item)
{
	name 				=	"Kissen";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_SHOW;

	value 				=	0;

	visual 				=	"ItMi_Kissen.3ds";
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_SeraPaket (C_Item)
{
	name 				=	"Paket von Serra";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_SHOW;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_LesterPaket(C_Item)
{
	name 				=	"Paket";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_PaketFalin (C_Item)
{
	name 				=	"Paket von Falin";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_ErzPaketFrazer (C_Item)
{
	name 				=	"Erzpaket von Frazer";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_SHOW;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_ErzPaketAndre (C_Item)
{
	name 				=	"Erzbrocken für Lord Andre";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_SHOW;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_CoragonDaemonisch(C_Item)
{
	name 				=	"Baltram's Paket";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	//on_state[0]			=   UsePacket;
	description			= 	name;
	Text[1] 				= 	"Enthält Pökelfleisch für Coragon";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_CoragonDaemonisch2 (C_Item)
{
	name 				=	"Baltram's Paket";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	//on_state[0]			=   UsePacket;
	description			= 	name;
	Text[1] 				= 	"Enthält Pökelfleisch für Coragon";
	Text[2] 				= 	"Heilt von Besessenheit";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_PaketFuerLester(C_Item)
{
	name 				=	"Paket";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	//on_state[0]			=   UsePacket;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_Erzkiste(C_Item)
{
	name 				=	"Kiste";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	//on_state[0]			=   UsePacket;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_OrlansSchnaps(C_Item)
{
	name 				=	"Paket mit Orlan's Schnaps";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	//on_state[0]			=   UsePacket;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_Hefe (C_Item)
{
	name 				=	"Paket voller Hefe";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	scemeName			=	"MAPSEALED";
	on_state[0]			=	Use_Hefe;
	description			= 	name;
	TEXT[1]				= 	"Ich sollte einfach mal probieren";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID Use_Hefe()
{
	B_Say	(hero, NULL, "$SCHMECKTNORMAL");
};

INSTANCE ItMi_Hopfen (C_Item)
{
	name 				=	"Paket voller Hopfen";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	scemeName			=	"MAPSEALED";
	on_state[0]			=	Use_Hopfen;
	description			= 	name;
	TEXT[1]				= 	"Ich sollte einfach mal probieren";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID Use_Hopfen()
{
	B_Say	(hero, NULL, "$SCHMECKTNORMAL");
};

INSTANCE ItMi_Gerste (C_Item)
{
	name 				=	"Paket voller Gerste";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	scemeName			=	"MAPSEALED";
	on_state[0]			=	Use_Gerste;
	description			= 	name;
	TEXT[1]				= 	"Ich sollte einfach mal probieren";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID Use_Gerste()
{
	B_Say	(hero, NULL, "$SCHMECKTECKLIG");

	B_LogEntry	(TOPIC_MOD_KHORATA_BIERHEXEN, "Wenn mich nicht alles täuscht, hat jemand auf die Gerste uriniert.");

	Mod_Bierhexen = 1;
};

INSTANCE ItMi_MagicPaket(C_Item)
{
	name 				=	"Magie-Paket";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	scemeName			=	"MAPSEALED";
	on_state[0]			=	Use_MagicPaket;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID Use_MagicPaket()
{
	if (Mod_Gilde > 0)
	&& (hero.guild != GIL_MIL)
	{
		CreateInvItems	(hero, ItMi_Runeblank, 1);
		CreateInvItems	(hero, ItPo_Health_02, 2);
		CreateInvItems	(hero, ItPo_Health_01, 4);
		CreateInvItems	(hero, ItPo_Mana_02, 3);
		CreateInvItems	(hero, ItPo_Mana_01, 6);
	}
	else
	{
		CreateInvItems	(hero, ItMi_MagicPaket, 1);
	};
};

INSTANCE ItMi_VanasPaket(C_Item)
{
	name 				=	"Paket von Vanas";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	//on_state[0]			=   UsePacket;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_EsspaketWasili(C_Item)
{
	name 				=	"Paket";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	//on_state[0]			=   UsePacket;
	description			= 	name;
	TEXT[1]	= "für Wasili";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_Weinlieferung(C_Item)
{
	name 				=	"Weinlieferung von Akahasch";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	//on_state[0]			=   UsePacket;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_DuengerPaket(C_Item)
{
	name 				=	"Paket";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	//on_state[0]			=   UsePacket;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_FreudenspenderSporen(C_Item)
{
	name 				=	"Paket mit Pilzsporen";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	//on_state[0]			=   UsePacket;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_FakeFreudenspenderSporen(C_Item)
{
	name 				=	"Paket mit parasitären Insekten";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	//on_state[0]			=   UsePacket;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_EstebanPaket_01 (C_Item)
{
	name 				=	"Paket mit Sumpfkraut";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	500;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	//on_state[0]			=   UsePacket;
	description			= 	name;
	TEXT[1]				= 	"Trägt die Initialien 'EB'";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_EstebanPaket_02 (C_Item)
{
	name 				=	"Paket mit Erz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	500;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	//on_state[0]			=   UsePacket;
	description			= 	name;
	TEXT[1]				= 	"Trägt die Initialien 'EB'";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

//in dieser Funktio steht der inhalt, die use Funkt dann bitte einkommentiren.
FUNC VOID UsePacket ()
{
	
};

INSTANCE ItMi_Pocket_Old(C_Item)
{
	name 				=	"Lederbeutel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	10;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   UsePocketOld;
	description			= 	name;
	TEXT[2]				=	"Der Beutel sieht alt(!) aus";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID UsePocketOld ()
{
		CreateInvItems (hero, ItMi_OldCoin ,10);
		Snd_Play ("Geldbeutel");
};

INSTANCE ItMi_Pocket(C_Item)//steht drin, weil auch in Welt verteilt!!
{
	name 				=	"Lederbeutel";

	mainflag 			=	ITEM_KAT_NONE|ITEM_MULTI;
	flags 				=	0;

	value 				=	10;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   UsePocket;
	description			= 	name;
	TEXT[2]				= 	"Ein schmaler Beutel,";
	TEXT[3]				=   "wiegt nicht viel";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

//in dieser Funktio steht der inhalt, die use Funkt dann bitte einkommentiren.
FUNC VOID UsePocket ()
{
		CreateInvItems (hero, ItMi_Gold ,10);
		Print 	(PRINT_FoundGold10);
		Snd_Play ("Geldbeutel");
};


INSTANCE ItMi_MattsGoldsack(C_Item)//steht drin, weil auch in Welt verteilt!!
{
	name 				=	"Matts Lederbeutel";

	mainflag 			=	ITEM_KAT_NONE|ITEM_MULTI|ITEM_SHOW;
	flags 				=	0;

	value 				=	10;

	visual 				=	"ItMi_Pocket.3ds";	
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_Federbeutel (C_Item)//steht drin, weil auch in Welt verteilt!!
{
	name 				=	"Beutel mit Vengerfedern";

	mainflag 			=	ITEM_KAT_NONE|ITEM_MULTI;
	flags 				=	0;

	value 				=	10;

	visual 				=	"ItMi_Pocket.3ds";	
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_Fresssack (C_Item)//steht drin, weil auch in Welt verteilt!!
{
	name 				=	"prall gefüllter Sack mit Essen";

	mainflag 			=	ITEM_KAT_NONE|ITEM_MULTI|ITEM_SHOW;
	flags 				=	0;

	value 				=	10;

	visual 				=	"ItMi_Pocket.3ds";	
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_Sumpfkraeuter (C_Item)//steht drin, weil auch in Welt verteilt!!
{
	name 				=	"Beutel mit Sumpfkräutern";

	mainflag 			=	ITEM_KAT_NONE|ITEM_MULTI;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";	
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_Sumpfkraeuter_Molerat (C_Item)//steht drin, weil auch in Welt verteilt!!
{
	name 				=	"Beutel mit Sumpfkräuter überzogen mit Moleratfett";

	mainflag 			=	ITEM_KAT_NONE|ITEM_MULTI;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";	
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_Fungizid (C_Item)
{
	name 				=	"Fungizide";

	mainflag 			=	ITEM_KAT_NONE|ITEM_MULTI|ITEM_SHOW;
	flags 				=	0;

	value 				=	80;

	visual 				=	"ItMi_Pocket.3ds";	
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[5]				= 	NAME_Value;		COUNT[5]	=	value;
};

INSTANCE ItMi_JackalTabak (C_Item)
{
	name 				=	"Varant-Tabak";

	mainflag 			=	ITEM_KAT_NONE|ITEM_MULTI|ITEM_SHOW;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";	
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[1]				= 	"exotischer Tabak";
	TEXT[5]				= 	ConcatStrings(NAME_Value, "kein Wert");
};

INSTANCE ItMi_JackalTabak_01 (C_Item)//steht drin, weil auch in Welt verteilt!!
{
	name 				=	"Varant-Tabak";

	mainflag 			=	ITEM_KAT_NONE|ITEM_MULTI|ITEM_SHOW;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";	
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[1]				= 	"exotischer Tabak";
	TEXT[5]				= 	ConcatStrings(NAME_Value, "kein Wert");
};

INSTANCE ItMi_JackalTabak_02 (C_Item)//steht drin, weil auch in Welt verteilt!!
{
	name 				=	"Varant-Tabak";

	mainflag 			=	ITEM_KAT_NONE|ITEM_MULTI|ITEM_SHOW;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";	
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[1]				= 	"exotischer Tabak";
	TEXT[5]				= 	ConcatStrings(NAME_Value, "kein Wert");
};

INSTANCE ItMi_JackalTabak_03 (C_Item)//steht drin, weil auch in Welt verteilt!!
{
	name 				=	"Varant-Tabak";

	mainflag 			=	ITEM_KAT_NONE|ITEM_MULTI|ITEM_SHOW;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";	
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[1]				= 	"exotischer Tabak";
	TEXT[5]				= 	ConcatStrings(NAME_Value, "kein Wert");
};

INSTANCE ItMi_JackalTabak_04 (C_Item)//steht drin, weil auch in Welt verteilt!!
{
	name 				=	"Varant-Tabak";

	mainflag 			=	ITEM_KAT_NONE|ITEM_MULTI|ITEM_SHOW;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";	
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[1]				= 	"exotischer Tabak";
	TEXT[5]				= 	ConcatStrings(NAME_Value, "kein Wert");
};

INSTANCE ItMi_JackalTabak_05 (C_Item)//steht drin, weil auch in Welt verteilt!!
{
	name 				=	"Varant-Tabak";

	mainflag 			=	ITEM_KAT_NONE|ITEM_MULTI|ITEM_SHOW;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";	
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[1]				= 	"exotischer Tabak";
	TEXT[5]				= 	ConcatStrings(NAME_Value, "kein Wert");
};

INSTANCE ItMi_JackalTabak_06 (C_Item)//steht drin, weil auch in Welt verteilt!!
{
	name 				=	"Varant-Tabak";

	mainflag 			=	ITEM_KAT_NONE|ITEM_MULTI|ITEM_SHOW;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";	
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[1]				= 	"exotischer Tabak";
	TEXT[5]				= 	ConcatStrings(NAME_Value, "kein Wert");
};

INSTANCE ItMi_JackalTabak_07 (C_Item)//steht drin, weil auch in Welt verteilt!!
{
	name 				=	"Varant-Tabak";

	mainflag 			=	ITEM_KAT_NONE|ITEM_MULTI|ITEM_SHOW;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";	
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[1]				= 	"exotischer Tabak";
	TEXT[5]				= 	ConcatStrings(NAME_Value, "kein Wert");
};

INSTANCE ItMi_JackalTabak_08 (C_Item)//steht drin, weil auch in Welt verteilt!!
{
	name 				=	"Varant-Tabak";

	mainflag 			=	ITEM_KAT_NONE|ITEM_MULTI|ITEM_SHOW;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";	
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[1]				= 	"exotischer Tabak";
	TEXT[5]				= 	ConcatStrings(NAME_Value, "kein Wert");
};

INSTANCE ItMi_JackalTabak_09 (C_Item)//steht drin, weil auch in Welt verteilt!!
{
	name 				=	"Varant-Tabak";

	mainflag 			=	ITEM_KAT_NONE|ITEM_MULTI|ITEM_SHOW;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";	
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[1]				= 	"exotischer Tabak";
	TEXT[5]				= 	ConcatStrings(NAME_Value, "kein Wert");
};

INSTANCE ItMi_JackalTabak_10 (C_Item)//steht drin, weil auch in Welt verteilt!!
{
	name 				=	"Varant-Tabak";

	mainflag 			=	ITEM_KAT_NONE|ITEM_MULTI|ITEM_SHOW;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";	
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[1]				= 	"exotischer Tabak";
	TEXT[5]				= 	ConcatStrings(NAME_Value, "kein Wert");
};

INSTANCE ItMi_JackalTabak_11 (C_Item)//steht drin, weil auch in Welt verteilt!!
{
	name 				=	"Varant-Tabak";

	mainflag 			=	ITEM_KAT_NONE|ITEM_MULTI|ITEM_SHOW;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";	
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[1]				= 	"exotischer Tabak";
	TEXT[5]				= 	ConcatStrings(NAME_Value, "kein Wert");
};

INSTANCE ItMi_JackalTabak_12 (C_Item)//steht drin, weil auch in Welt verteilt!!
{
	name 				=	"Varant-Tabak";

	mainflag 			=	ITEM_KAT_NONE|ITEM_MULTI|ITEM_SHOW;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";	
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[1]				= 	"exotischer Tabak";
	TEXT[5]				= 	ConcatStrings(NAME_Value, "kein Wert");
};

INSTANCE ItMi_JackalTabak_13 (C_Item)//steht drin, weil auch in Welt verteilt!!
{
	name 				=	"Varant-Tabak";

	mainflag 			=	ITEM_KAT_NONE|ITEM_MULTI|ITEM_SHOW;
	flags 				=	0;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";	
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[1]				= 	"exotischer Tabak";
	TEXT[5]				= 	ConcatStrings(NAME_Value, "kein Wert");
};

//******************************************************************************************
//	Wertvolle Gegenstände
//******************************************************************************************
INSTANCE ItMi_Nugget(C_Item)
{
	name 				=	"Erzbrocken";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Nugget;

	visual 				=	"ItMi_Nugget.3ds";
	material 			=	MAT_STONE;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_MANAPOTION";

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			=	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC2_STANDARD;
	
};
//******************************************************************************************
INSTANCE ItMi_Nugget_Urs(C_Item)
{
	name 				=	"Erzbrocken";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Nugget;

	visual 				=	"ItMi_Nugget.3ds";
	material 			=	MAT_STONE;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_MANAPOTION";

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			=	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC2_STANDARD;
	
};

INSTANCE ItMi_SalzNugget(C_Item)
{
	name 				=	"Salzbrocken";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Nugget;

	visual 				=	"ItMi_Salzbrocken.3ds";
	material 			=	MAT_STONE;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_MANAPOTION";

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			=	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC2_STANDARD;
	
};

INSTANCE ItMi_GreenNugget(C_Item)
{
	name 				=	"grüner Erzbrocken";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Nugget;

	visual 				=	"ItMi_Gruenbrocken.3ds";
	material 			=	MAT_STONE;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_MANAPOTION";

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			=	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC2_STANDARD;
	
};

INSTANCE ItMi_Nugget_Big(C_Item)
{
	name 				=	"Verdichter Erzbrocken";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Nugget*100;

	visual 				=	"ItMi_Nugget.3ds";
	material 			=	MAT_STONE;

	wear				= 	WEAR_EFFECT;
	effect				=	"SPELLFX_MANAPOTION";

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			=	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC2_STANDARD;
	
};



/******************************************************************************************/
INSTANCE ItMi_Gold (C_Item)
{
	name 				=	"Gold";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Gold;

	visual 				=	"ItMi_Gold.3DS";
	material 			=	MAT_STONE;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC2_STANDARD;
};

/******************************************************************************************/
INSTANCE ItMi_OldCoin (C_Item)
{
	name 				=	"Alte Münze";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_OldCoin.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC2_STANDARD;

};

/******************************************************************************************/
INSTANCE ItMi_Bluetenblatt (C_Item)
{
	name 				=	"rotes Blütenblatt";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	0;

	visual 				=	"XR_rotes_Blumenblatt.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC2_STANDARD;

};

/******************************************************************************************/
INSTANCE ItMi_GoldCandleHolder (C_Item)
{
	name 				=	"Goldener Kerzenständer";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_GoldCandleHolder;

	visual 				=	"ItMi_GoldCandleHolder.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};



/******************************************************************************************/
INSTANCE ItMi_GoldNecklace (C_Item)
{
	name 				=	"Goldene Halskette";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI | ITEM_AMULET;

	value 				=	Value_GoldNecklace;

	visual 				=	"ItMi_GoldNecklace.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;

};



/******************************************************************************************/
INSTANCE ItMi_AngarHalskette (C_Item)
{
	name 				=	"Wunderschöne Halskette";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_AMULET|ITEM_SHOW;

	value 				=	Value_GoldNecklace;

	visual 				=	"ItMi_GoldNecklace.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;

};


/******************************************************************************************/

INSTANCE ItMi_SilverRing (C_Item)
{
	name 				=	"Silberner Ring";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_RING;

	value 				=	Value_SilverRing;

	visual 				=	"ItMi_SilverRing.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
};

/******************************************************************************************/
INSTANCE ItMi_SilverCup (C_Item)
{
	name 				=	"Silberkelch";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SilverCup;

	visual 				=	"ItMi_SilverCup.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_SilverPlate (C_Item)
{
	name 				=	"Silberteller";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SilverPlate;

	visual 				=	"ItMi_SilverPlate.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
instance ItMi_GoldPlate (C_Item)
{
	name 				=	"Goldener Teller";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_GoldPlate;

	visual 				=	"ItMi_GoldPlate.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_GoldCup (C_Item)
{
	name 				=	"Goldener Kelch";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_GoldCup;

	visual 				=	"ItMi_GoldCup.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_TurnierPokal (C_Item)
{
	name 				=	"Pokal";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_SHOW;

	value 				=	Value_GoldCup;

	visual 				=	"ItMi_GoldCup.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[1]				= 	"für den Sieger des Miliz-Turniers";	
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_BloodCup_MIS (C_Item)
{
	name 				=	"Blutkelch";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI | ITEM_MISSION;

	value 				=	Value_BloodCup;

	visual 				=	"ItMi_GoldCup.3DS";
	material 			=	MAT_METAL;

	description			= 	"Ein Blutkelch";
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_BloodCup_Richter (C_Item)
{
	name 				=	"Blutkelch";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI | ITEM_MISSION;

	value 				=	Value_BloodCup;

	visual 				=	"ItMi_GoldCup.3DS";
	material 			=	MAT_METAL;

	description			= 	"Ein Blutkelch";
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_BloodCup_Canyon (C_Item)
{
	name 				=	"Blutkelch";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI | ITEM_MISSION;

	value 				=	Value_BloodCup;

	visual 				=	"ItMi_GoldCup.3DS";
	material 			=	MAT_METAL;

	description			= 	"Ein Blutkelch";
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_GoldRing (C_Item)
{
	name 				=	"Goldener Ring";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_RING;

	value 				=	Value_GoldRing;

	visual 				=	"ItMi_GoldRing.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
		
};
/******************************************************************************************/
INSTANCE ItMi_Hochzeitsring (C_Item)
{
	name 				=	"Hochzeitsring";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_RING;

	value 				=	250;

	visual 				=	"ItMi_GoldRing.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ				= INVCAM_Z_RING_STANDARD;
	INV_ROTX				= INVCAM_X_RING_STANDARD;
		
};
/******************************************************************************************/
INSTANCE ItMi_SilverChalice (C_Item)
{
	name 				=	"Silberne Schale";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SilverChalice;

	visual 				=	"ItMi_SilverChalice.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_JeweleryChest (C_Item)
{
	name 				=	"Juwelenschatulle";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_JeweleryChest;

	visual 				=	"ItMi_JeweleryChest.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
INSTANCE ItMi_JeweleryChest_Greg (C_Item)
{
	name 				=	"Gregs Juwelenschatulle";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_JeweleryChest;

	visual 				=	"ItMi_JeweleryChest.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_BDTKiste_01 (C_Item)
{
	name 				=	"Schatzkiste";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_JeweleryChest;

	visual 				=	"ItMi_JeweleryChest.3DS";
	material 			=	MAT_METAL;
	scemename			=	"MAPSEALED";	
	on_state[0]			=   BDTKiste_01_Open;

	description			= 	name;
	TEXT[1]				= 	"Nur sehr geschickte Personen oder Schlosser";	
	TEXT[2]				= 	"können die Kiste öffnen";	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

FUNC VOID BDTKiste_01_Open ()
{
	if ((hero.attribute[ATR_DEXTERITY] >= 120)
	&& (Npc_GetTalentSkill (hero, NPC_TALENT_PICKLOCK) == 1)
	&& (Npc_HasItems(hero, ItKe_Lockpick) >= 1)	
	&& (Mod_Banditenueberfall_Esteban >= 10))
	|| (Npc_KnowsInfo(hero, Info_Mod_Thorben_BDTSchatzkisten_Open))
	{
		B_ShowGivenThings	("Diverse Items erhalten");

		CreateInvItems	(hero, ItMi_Gold, 1132);
		CreateInvItems	(hero, ItMi_Nugget, 65);
		CreateInvItems	(hero, ItMi_GoldNugget_Addon, 48);
		CreateInvItems	(hero, ItMi_GoldRing, 12);
		CreateInvItems	(hero, ItMi_SilverRing, 7);
		CreateInvItems	(hero, ItMi_SilverCup, 5);
		CreateInvItems	(hero, ItMi_GoldPlate, 2);
	}
	else
	{
		CreateInvItems	(hero, ItMi_BDTKiste_01, 1);
	};
};
/******************************************************************************************/
INSTANCE ItMi_BDTKiste_02 (C_Item)
{
	name 				=	"Schatzkiste";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_JeweleryChest;

	visual 				=	"ItMi_JeweleryChest.3DS";
	material 			=	MAT_METAL;
	scemename			=	"MAPSEALED";	
	on_state[0]			=   BDTKiste_02_Open;

	description			= 	name;
	TEXT[1]				= 	"Nur sehr geschickte Personen oder Schlosser";	
	TEXT[2]				= 	"können die Kiste öffnen";
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

FUNC VOID BDTKiste_02_Open ()
{
	if ((hero.attribute[ATR_DEXTERITY] >= 120)
	&& (Npc_GetTalentSkill (hero, NPC_TALENT_PICKLOCK) == 1)
	&& (Npc_HasItems(hero, ItKe_Lockpick) >= 1)	
	&& (Mod_Banditenueberfall_Esteban >= 10))
	|| (Npc_KnowsInfo(hero, Info_Mod_Thorben_BDTSchatzkisten_Open))
	{
		B_ShowGivenThings	("Diverse Items erhalten");

		CreateInvItems	(hero, ItAt_ShadowFur, 3);
		CreateInvItems	(hero, ItAt_ShadowHorn, 4);
		CreateInvItems	(hero, ItAt_TrollFur, 2);
		CreateInvItems	(hero, ItAt_Crawlerqueen, 5);
	}
	else
	{
		CreateInvItems	(hero, ItMi_BDTKiste_02, 1);
	};
};
/******************************************************************************************/
INSTANCE ItMi_Riesenschatz (C_Item)
{
	name 				=	"Schatzkiste";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_JeweleryChest;

	visual 				=	"ItMi_JeweleryChest.3DS";
	material 			=	MAT_METAL;
	scemename			=	"MAPSEALED";	
	on_state[0]			=   Riesenschatzkiste;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

FUNC VOID Riesenschatzkiste ()
{
	B_ShowGivenThings	("Diverse Items erhalten");

	CreateInvItems	(hero, ItMi_Gold, 2000);
	CreateInvItems	(hero, ItMi_Nugget, 7);
	CreateInvItems	(hero, ItMi_GoldNugget_Addon, 20);
	CreateInvItems	(hero, ItMi_GoldCup, 6);
};
/******************************************************************************************/
INSTANCE ItMi_GoldChalice (C_Item)
{
	name 				=	"Goldene Schale";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_GoldChalice;

	visual 				=	"ItMi_GoldChalice.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_GoldChest (C_Item)
{
	name 				=	"Schatulle";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_GoldChest;

	visual 				=	"ItMi_GoldChest.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_InnosStatue (C_Item)
{
	name 				=	"Innosstatue";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_InnosStatue;

	visual 				=	"ItMi_InnosStatue.3DS";
	material 			=	MAT_METAL ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_InnosStatue_REL (C_Item)
{
	name 				=	"wertvolle Innosstatue";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_InnosStatue;

	visual 				=	"ItMi_InnosStatue.3DS";
	material 			=	MAT_METAL ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_Statue_Genn (C_Item)
{
	name 				=	"Büste";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_InnosStatue;

	visual 				=	"ItMi_InnosStatue.3DS";
	material 			=	MAT_METAL ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_AdanosStatue (C_Item)
{
	name 				=	"Adanosstatue";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_SHOW;

	value 				=	Value_InnosStatue;

	visual 				=	"ItMi_Adanosaltar.3DS";
	material 			=	MAT_METAL ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_Talisman_Piraten (C_Item)
{
	name 				=	"Talisman";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_SHOW;

	value 				=	Value_InnosStatue;

	visual 				=	"ItMi_Adanosaltar.3DS";
	material 			=	MAT_METAL ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_InnosStatue_Edda (C_Item)
{
	name 				=	"Innosstatue";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_InnosStatue;

	visual 				=	"ItMi_InnosStatue.3DS";
	material 			=	MAT_METAL ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_BeliarStatue (C_Item)
{
	name 				=	"Beliarstatue";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_InnosStatue;

	visual 				=	"BeliarStatue_Item.3DS";
	material 			=	MAT_METAL ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_Brett (C_Item)
{
	name 				=	"Brett";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	5;

	visual 				=	"addon_misc_bohlen_01.3DS";
	material 			=	MAT_METAL ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_Brett_Saege (C_Item)
{
	name 				=	"zurechtgesägtes Brett";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	5;

	visual 				=	"addon_misc_bohlen_01.3DS";
	material 			=	MAT_METAL ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_CoragonStuhl (C_Item)
{
	name 				=	"Stuhl";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	50;

	visual 				=	"luxurioeser_stuhl.3DS";
	material 			=	MAT_METAL ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_MatteoFesttisch (C_Item)
{
	name 				=	"Tisch";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	60;

	visual 				=	"nw_city_table_rich_01.3DS";
	material 			=	MAT_METAL ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_Schmuckkasten_Roh (C_Item)
{
	name 				=	"Rohfassung des Schmuckkästchen";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	60;

	visual 				=	"ItMi_JeweleryChest.3DS";
	material 			=	MAT_METAL ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_Schmuckkasten (C_Item)
{
	name 				=	"Schmuckkästchen";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	60;

	visual 				=	"ItMi_JeweleryChest.3DS";
	material 			=	MAT_METAL ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_Bierkrug_Roh (C_Item)
{
	name 				=	"Rohfassung des Bierkrugs";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	60;

	visual 				=	"XR_BIERKRUG_LEER.3DS";
	material 			=	MAT_METAL ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_Bierkrug (C_Item)
{
	name 				=	"Bierkrug";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	60;

	visual 				=	"XR_BIERKRUG_LEER.3DS";
	material 			=	MAT_METAL ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_Karte_Roh (C_Item)
{
	name 				=	"Rohfassung der Karte";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	60;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_METAL ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_Karte (C_Item)
{
	name 				=	"Karte";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	60;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_METAL ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_Sextant (C_Item)
{
	name 				=	"Sextant";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sextant;

	visual 				=	"ItMi_Sextant.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
INSTANCE ItMi_Sextant_Greg (C_Item)
{
	name 				=	"Gregs Sextant";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sextant;

	visual 				=	"ItMi_Sextant.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_Kompass (C_Item)
{
	name 				=	"Kompass";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sextant;

	visual 				=	"ITMI_COMPASS_01.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_GoldKompass (C_Item)
{
	name 				=	"Goldener Kompass";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_SHOW;

	value 				=	Value_Sextant;

	visual 				=	"ITMI_COMPASS_01.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_SilverCandleHolder (C_Item)
{
	name 				=	"Silberner Kerzenständer";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SilverCandleHolder;

	visual 				=	"ItMi_SilverCandleHolder.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
/******************************************************************************************/
INSTANCE ItMi_SilverNecklace (C_Item)
{
	name 				=	"Silberkette";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI| ITEM_AMULET;

	value 				=	Value_SilverNecklace;

	visual 				=	"ItMi_SilverNecklace.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};
//*****************************************************************************************
//	Alchemy Ingredienzien
//*****************************************************************************************
INSTANCE ItMi_Sulfur (C_Item)
{
	name 				=	"Schwefel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sulfur;

	visual 				=	"ItMi_Sulfur.3DS";
	material 			=	MAT_WOOD;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC2_STANDARD;
};

INSTANCE ItMi_Salpeter (C_Item)
{
	name 				=	"Salpeter";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	20;

	visual 				=	"ItMi_Sulfur.3DS";
	material 			=	MAT_WOOD;

	description			= 	name;

	TEXT[2]				= 	"Entsteht in heißen und trockenen Gegenden";

	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC2_STANDARD;
};


INSTANCE ItMi_Quartz (C_Item)
{
	name 				=	"Gletscher-Quartz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Quartz;

	visual 				=	"ItMi_Quartz.3ds";
	material 			=	MAT_STONE ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
};

INSTANCE ItMi_Pitch (C_Item)
{
	name 				=	"Pech";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Pitch;

	visual 				=	"ItMi_Pitch.3DS";
	material 			=	MAT_GLAS ;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

INSTANCE Mod_PaladinKristall (C_Item)
{
	name 				=	"Kristall des Feuers";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	250;

	visual 				=	"IT_INNOSCRYSTAL_01.3ds";
	material 			=	MAT_STONE;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

INSTANCE ItMi_AlvarKristall (C_Item)
{
	name 				=	"Kristall";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	250;

	visual 				=	"IT_INNOSCRYSTAL_01.3ds";
	material 			=	MAT_STONE;

	description			= 	name;
	TEXT[1]				=	"Dieser Kristall war in Alvars Rüstung";
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

INSTANCE ItMi_TraenenKristall (C_Item)
{
	name 				=	"Tränenkristall";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	250;

	visual 				=	"IT_INNOSCRYSTAL_01.3ds";
	material 			=	MAT_STONE;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

INSTANCE Mod_Feuerball (C_Item)
{
	name 				=	"Feuerball";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	250;

	visual 				=	"ItMi_Rockcrystal.3ds";
	material 			=	MAT_STONE;

	wear				=	WEAR_EFFECT;
	effect				=	"SPELLFX_FIREBOW";

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

INSTANCE ItMi_Rockcrystal (C_Item)
{
	name 				=	"Bergkristall";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Rockcrystal;

	visual 				=	"ItMi_Rockcrystal.3ds";
	material 			=	MAT_STONE;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};


INSTANCE ItMi_Aquamarine (C_Item)
{
	name 				=	"Aquamarin";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Aquamarine;

	visual 				=	"ItMi_Aquamarine.3ds";
	material 			=	MAT_STONE;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC_STANDARD;
	
};


INSTANCE ItMi_Wasserperle (C_Item)
{
	name 				=	"Wasserperle";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_SHOW;

	value 				=	Value_Aquamarine;

	visual 				=	"ItMi_Aquamarine.3ds";
	material 			=	MAT_STONE;
	scemename			=	"VERTEILEN";	
	on_state[0]			=   Use_Wasserperle;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC_STANDARD;
	
};

FUNC VOID Use_Wasserperle()
{
	if (Npc_GetDistToWP(hero, "WP_BODEN_01") < 600)
	&& (WM_Boden_01 == FALSE)
	{
		Wld_InsertItem	(ItMi_Wasserperle, "FP_ITEM_BODEN_PERLE_01");
	}
	else if (Npc_GetDistToWP(hero, "WP_BODEN_02") < 600)
	&& (WM_Boden_02 == FALSE)
	{
		Wld_InsertItem	(ItMi_Wasserperle, "FP_ITEM_BODEN_PERLE_02");
	}
	else if (Npc_GetDistToWP(hero, "WP_BODEN_03") < 600)
	&& (WM_Boden_03 == FALSE)
	{
		Wld_InsertItem	(ItMi_Wasserperle, "FP_ITEM_BODEN_PERLE_03");
	}
	else if (Npc_GetDistToWP(hero, "WP_BODEN_04") < 600)
	&& (WM_Boden_04 == FALSE)
	{
		Wld_InsertItem	(ItMi_Wasserperle, "FP_ITEM_BODEN_PERLE_04");
	}
	else if (Npc_GetDistToWP(hero, "WP_BODEN_05") < 600)
	&& (WM_Boden_05 == FALSE)
	{
		Wld_InsertItem	(ItMi_Wasserperle, "FP_ITEM_BODEN_PERLE_05");
	}
	else if (Npc_GetDistToWP(hero, "WP_BODEN_06") < 600)
	&& (WM_Boden_06 == FALSE)
	{
		Wld_InsertItem	(ItMi_Wasserperle, "FP_ITEM_BODEN_PERLE_06");
	}
	else if (Npc_GetDistToWP(hero, "WP_BODEN_07") < 600)
	&& (WM_Boden_07 == FALSE)
	{
		Wld_InsertItem	(ItMi_Wasserperle, "FP_ITEM_BODEN_PERLE_07");
	}
	else if (Npc_GetDistToWP(hero, "WP_BODEN_08") < 600)
	&& (WM_Boden_08 == FALSE)
	{
		Wld_InsertItem	(ItMi_Wasserperle, "FP_ITEM_BODEN_PERLE_08");
	}
	else if (Npc_GetDistToWP(hero, "WP_BODEN_09") < 600)
	&& (WM_Boden_09 == FALSE)
	{
		Wld_InsertItem	(ItMi_Wasserperle, "FP_ITEM_BODEN_PERLE_09");
	}
	else
	{
		Print ("Geht nicht!");

		CreateInvItems	(hero, Itmi_Wasserperle, 1);
	};
};

INSTANCE ItMi_Orakelpille (C_Item)
{
	name 				=	"Orakelpille";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	0;

	value 				=	Value_Aquamarine;

	visual 				=	"ItMi_Aquamarine.3ds";
	material 			=	MAT_STONE;
	scemename			=	"MAPSEALED";	
	on_state[0]			=   Use_Orakelpille;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC_STANDARD;
	
};

FUNC VOID Use_Orakelpille()
{
	if (CurrentLevel == RELENDEL_ZEN)
	{
		AI_Teleport	(hero, "GOTOHALLU");
	}
	else
	{
		Print ("Geht hier nicht!");

		CreateInvItems	(hero, ItMi_Orakelpille, 1);
	};
};

INSTANCE ItMi_Zauberwasser (C_Item)
{
	name 				=	"Zauberwasser";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	500;

	visual 				=	"ItMi_HolyWater.3ds";
	material 			=	MAT_GLAS;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

INSTANCE ItMi_WaterOfLife (C_Item)
{
	name 				=	"Wasser des Lebens";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	500;

	visual 				=	"ItMi_HolyWater.3ds";
	material 			=	MAT_GLAS;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

INSTANCE ItMi_Zauberwasser_MIS (C_Item)
{
	name 				=	"Zauberwasser";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	500;

	visual 				=	"ItMi_HolyWater.3ds";
	material 			=	MAT_GLAS;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};


INSTANCE ItMi_HolyWater (C_Item)
{
	name 				=	"Geweihtes Wasser";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_HolyWater;

	visual 				=	"ItMi_HolyWater.3ds";
	material 			=	MAT_GLAS;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};

INSTANCE ItMi_HolyWater2 (C_Item)
{
	name 				=	"Heiliges Wasser";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_HolyWater;

	visual 				=	"ItMi_HolyWater.3ds";
	material 			=	MAT_GLAS;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
};


INSTANCE ItMi_Coal (C_Item)
{
	name 				=	"Kohle";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Coal;

	visual 				=	"ItMi_Coal.3ds";
	material 			=	MAT_STONE;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC_STANDARD;
	
};


INSTANCE ItMi_DarkPearl (C_Item)
{
	name 				=	"Schwarze Perle";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_DarkPearl;

	visual 				=	"ItMi_DarkPearl.3ds";
	material 			=	MAT_STONE;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC_STANDARD;
	
};

INSTANCE ItMi_DarkPearl_Greg (C_Item)
{
	name 				=	"Gregs schwarze Perle";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_SHOW;

	value 				=	Value_DarkPearl;

	visual 				=	"ItMi_DarkPearl.3ds";
	material 			=	MAT_STONE;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC_STANDARD;
	
};


INSTANCE ItMi_Seide (C_Item)
{
	name 				=	"Seide";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	300;

	visual 				=	"Spindel.3ds";
	material 			=	MAT_STONE;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC_STANDARD;
	
};


INSTANCE ItMi_Beliarstein_Unloaded (C_Item)
{
	name 				=	"Stein aus schwarzem Erz (unaufgeladen)";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_SHOW;

	value 				=	Value_DarkPearl;

	visual 				=	"ItMi_DarkPearl.3ds";
	material 			=	MAT_STONE;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC_STANDARD;
	
};


INSTANCE ItMi_Beliarstein (C_Item)
{
	name 				=	"Stein aus schwarzem Erz";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_SHOW;

	value 				=	Value_DarkPearl;

	visual 				=	"ItMi_DarkPearl.3ds";
	material 			=	MAT_STONE;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC_STANDARD;
	
};


INSTANCE ItMi_TugettsoStein (C_Item)
{
	name 				=	"Aufladestein";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_SHOW;

	value 				=	10;

	visual 				=	"ItMi_DarkPearl.3ds";
	material 			=	MAT_STONE;

	description			= 	name;
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC_STANDARD;
	
};
//-------------------------------------------------------------
//					Tabak Sorten 
//		 Apfeltabak (Basis für alle anderen)
//-------------------------------------------------------------
INSTANCE ItMi_ApfelTabak(C_Item)
{
	name 				=	"Apfeltabak";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	VALUE_ItMi_ApfelTabak; 

	visual 				=	"ItMi_Pocket.3ds";
	
	material 			=	MAT_LEATHER ;
	
	description			= 	name;
	
	TEXT[2]				=  "Ein Beutel voll Apfeltabak";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
INSTANCE ItMi_StarkerTabak(C_Item)
{
	name 				=	"Starker Tabak";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	50; 

	visual 				=	"ItMi_Pocket.3ds";
	
	material 			=	MAT_LEATHER ;
	
	description			= 	name;
	
	TEXT[2]				=  "Ein Beutel voll starkem Tabak";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//-------------------------------------------------------------
//			Pilztabak
//-------------------------------------------------------------
INSTANCE ItMi_PilzTabak(C_Item)
{
	name 				=	"Pilztabak";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	VALUE_ItMi_PilzTabak;

	visual 				=	"ItMi_Pocket.3ds";
	
	material 			=	MAT_LEATHER;
	
	description			= 	name;
	
	TEXT[2]				=  "Dunkler Apfel - Pilz Tabak";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//-------------------------------------------------------------
//			Doppel Apfel 
//-------------------------------------------------------------
INSTANCE ItMi_DoppelTabak(C_Item)
{
	name 				=	"Doppelter Apfel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	VALUE_ItMi_DoppelTabak;

	visual 				=	"ItMi_Pocket.3ds";
	
	material 			=	MAT_LEATHER;
	
	description			= 	name;
	
	TEXT[2]				=  "Schmeckt stark nach Apfel...";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//-------------------------------------------------------------
//			Honigtabak
//-------------------------------------------------------------
INSTANCE ItMi_Honigtabak(C_Item)
{
	name 				=	"Honigtabak";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	VALUE_ItMi_Honigtabak;

	visual 				=	"ItMi_Pocket.3ds";
	
	material 			=	MAT_LEATHER;
	
	description			= 	name;
	
	TEXT[2]				=  "Süßer Apfel Tabak";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
//-------------------------------------------------------------
//		SumpfKraut Tabak
//-------------------------------------------------------------
INSTANCE ItMi_SumpfTabak(C_Item)
{
	name 				=	"Krauttabak";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	VALUE_ItMi_SumpfTabak;

	visual 				=	"ItMi_Pocket.3ds";
	
	material 			=	MAT_LEATHER;
	
	description			= 	name;
	
	TEXT[2]				=  "Sumpfkraut Mischung";
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItMi_Stuff_Pipe_01 (C_Item)
{
	name 				=	"Pfeife";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	10;

	visual 				=	"ItMi_Stuff_Pipe_01.3DS";
	material 			=	MAT_WOOD;

	scemeName			=	"JOINT";
	on_state[0]			= 	Use_Pfeife;

	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};
INSTANCE ItMi_LeePipe (C_Item)
{
	name 				=	"Lees Pfeife";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_SHOW;

	value 				=	10;

	visual 				=	"ItMi_Stuff_Pipe_01.3DS";
	material 			=	MAT_WOOD;

	
	description			= name;
	TEXT[4]				= NAME_Value;					COUNT[4]	= value;
};

FUNC VOID Use_Pfeife()
{
	var C_NPC her; her = Hlp_GetNpc(PC_Hero);

	if (Hlp_GetInstanceID(self)==Hlp_GetInstanceID(her))//Wenn der Benutzer der held ist...
	{ 
		B_SetAivar(self, AIV_INVINCIBLE, TRUE); //Gegner greifen nicht an, solange der Held im Auswahlmodus ist

		PLAYER_MOBSI_PRODUCTION = MOBSI_Pfeife; //Der Mobsi BOw ist aktiv
		AI_ProcessInfos (her); //Dialog wird gestartet
	};
};

INSTANCE Info_Mod_Hero_Pfeife_EXIT (C_INFO)
{
	npc		= PC_Hero;
	nr		= 999;
	condition	= Info_Mod_Hero_Pfeife_EXIT_Condition;
	information	= Info_Mod_Hero_Pfeife_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= "ENDE";
};

FUNC INT Info_Mod_Hero_Pfeife_EXIT_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_Pfeife)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hero_Pfeife_EXIT_Info()
{
	B_ENDPRODUCTIONDIALOG();
};
/******************************************************************************************/
INSTANCE ItMi_Freudenspender (C_Item)
{
	name 				=	"Freudenspender";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	Value_DragonBlood;

	visual 				=	"ItAt_DragonBlood.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC_STANDARD;
};
/******************************************************************************************/
INSTANCE ItMi_Freudenspender_Sabine (C_Item)
{
	name 				=	"Sabines privates Freudenspender-Fläschchen";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION|ITEM_SHOW;

	value 				=	Value_DragonBlood;

	visual 				=	"ItAt_DragonBlood.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC_STANDARD;
};
instance ItMi_MagicSamen (C_ITEM)
{	
	name 					=	"Magischer Samen";

	mainflag 				=	ITEM_KAT_FOOD;
	flags 					=	ITEM_MULTI|ITEM_SHOW;	

	value 					=	5;

	visual 					=	"ItFo_Plants_Bloodwood_01.3ds";
	material 				=	MAT_WOOD;

	description			= name;
	TEXT[5]				= NAME_Value;					COUNT[5]	= 5;                          	
};

instance ItMi_Schafsmagen (C_ITEM)
{	
	name 					=	"Schafsmagen";

	mainflag 				=	ITEM_KAT_FOOD;
	flags 					=	ITEM_MULTI|ITEM_SHOW;	

	value 					=	5;

	visual 					=	"Schafsmagen.3ds";
	material 				=	MAT_WOOD;

	description			= name;
	TEXT[5]				= NAME_Value;					COUNT[5]	= 5;                          	
};
instance ItMi_Trollhaufen (C_ITEM)
{	
	name 					=	"Trollhaufen";

	mainflag 				=	ITEM_KAT_FOOD;
	flags 					=	ITEM_MULTI|ITEM_SHOW;	

	value 					=	5;

	visual 					=	"Trollhaufen.3ds";
	material 				=	MAT_WOOD;

	description			= name;
	TEXT[5]				= NAME_Value;					COUNT[5]	= 5;                          	
};


/******************************************************************************************/
INSTANCE ItMi_EffektMarker(C_Item)
{
	name 				=	"";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Joint;

	visual 				=	"ItMi_Joint_US.3ds";
	material 			=	MAT_LEATHER;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	
};


/******************************************************************************************/
INSTANCE ItMi_EffektMarker2(C_Item)
{
	name 				=	"";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Joint;

	visual 				=	"ItMi_Joint_US.3ds";
	material 			=	MAT_LEATHER;
	effect			=	"SPELLFX_BLUELIGHT"; 

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	
};


/******************************************************************************************/
INSTANCE ItMi_Sumpfhaiprobe(C_Item)
{
	name 				=	"Sumpfhaiprobe";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_SHOW;

	value 				=	Value_Joint;

	visual 				=	"ItFoMuttonRaw.3ds";
	material 			=	MAT_LEATHER;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	
};


/******************************************************************************************/
INSTANCE ItMi_Kiste(C_Item)
{
	name 				=	"Kiste";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_SHOW;

	value 				=	0;

	visual 				=	"aw_crate_01.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	
};


/******************************************************************************************/
INSTANCE ItMi_Orkstatuette(C_Item)
{
	name 				=	"Orkstatuette";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	0;

	visual 				=	"KleineOrkstatur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	
};


/******************************************************************************************/
INSTANCE ItMi_Orkstatuette_Stonehenge (C_Item)
{
	name 				=	"Orkstatuette aus Stein des Stonehenges";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_SHOW;

	value 				=	0;

	visual 				=	"KleineOrkstatur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	
};


/******************************************************************************************/
INSTANCE ItMi_Magieprisma_Fake(C_Item)
{
	name 				=	"Magieprisma";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_SHOW;

	value 				=	0;

	visual 				=	"Schwarzesprisma.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	
};


/******************************************************************************************/
INSTANCE ItMi_Enterhaken (C_Item)
{
	name 				=	"Enterhaken";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_SHOW;

	value 				=	0;

	visual 				=	"Enterhacken.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	
};


/******************************************************************************************/
INSTANCE ItMi_Waffenbuendel (C_Item)
{
	name 				=	"Waffenbündel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_SHOW;

	value 				=	0;

	visual 				=	"nw_city_weapon_bag_01.3DS";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	
};


/******************************************************************************************/
INSTANCE ItMi_ZeichenDerBruderschaft (C_Item)
{
	name 				=	"Zeichen der Bruderschaft";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_SHOW;

	value 				=	0;

	visual 				=	"ItMi_Amulet_Psi_01.3ds";
	material 			=	MAT_METAL;

	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	
	COUNT[5]			= 	value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	
};