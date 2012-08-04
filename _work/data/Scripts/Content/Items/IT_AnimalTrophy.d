// ************************************************************************************************
// Wert von Tiertrophäen
// ************************************************************************************************

//Addon
const int	Value_BCKopf				=   50;

const int	Value_Meatbugflesh			=	10;
const int	Value_SheepFur				=	10;
const int	Value_SheepFur_Rein			=	13;
const int	Value_SheepFur_Feuer			=	3;
const int	Value_WolfFur				=	10;
const int	Value_WolfFur_Rein			=	13;
const int	Value_WolfFur_Feuer			=	3;
const int	Value_BugMandibles			=	15;	
const int	Value_Claw					=	15;
const int	Value_LurkerClaw			=	15;	
const int	Value_Teeth					=	15;
const int	Value_ErzdemonTooth					=	500;
const int	Value_CrawlerMandibles		=	15;	
const int	Value_Wing					=	20;
const int	Value_Sting					=	25;
const int	Value_ReptileSkin			=	25;
const int 	Value_WargFur				=	25;
const int 	Value_WargFur_Rein			=	33;
const int 	Value_WargFur_Feuer			=	8;
const int	Value_DrgSnapperHorn		=	100;
const int	Value_CrawlerPlate			=	50;
const int	Value_ShadowFur				=	250;
const int	Value_ShadowFur_Rein			=	330;
const int	Value_ShadowFur_Feuer			=	80;
const int	Value_SharkSkin				=	200;
const int	Value_TrollFur				=	300;
const int	Value_TrollFur_Rein			=	400;
const int	Value_TrollFur_Feuer			=	100;
const int	Value_WaranFiretongue		=	300;
const int	Value_ShadowHorn			=	300;
const int	Value_SharkTeeth			=	300;
const int	Value_TrollTooth			=	300;
const int	Value_TrollBlackFur			=	350;
const int	Value_TrollBlackFur_Rein		=	466;
const int	Value_TrollBlackFur_Feuer		=	116;

const int	Value_GoblinBone			=	10;
const int	Value_SkeletonBone			=	10;
const int	Value_DemonHeart			=	300;
const int	Value_StoneGolemHeart		=	300;
const int	Value_FireGolemHeart		=	300;
const int	Value_IceGolemHeart			=	300;

const int	Value_UndeadDragonSoulStone	=	400;
const int	Value_IcedragonHeart		=	400;
const int	Value_FiredragonHeart		=	400;
const int	Value_SwampdragonHeart		=	400;
const int	Value_RockdragonHeart		=	400;

const int	Value_DragonBlood			=	200;
const int	Value_DragonScale			=	200;

const int	Value_Keilerfur				= 	 15;	
const int	Value_Keilerfur_Rein			= 	 20;
const int	Value_Keilerfur_Feuer			= 	 5;

const int	Value_Pumafur				= 	 100;	
const int	Value_Pumafur_Rein			= 	 130;
const int	Value_Pumafur_Feuer			= 	 30;
/*****************ADDON*************************************************************************/
INSTANCE ItAt_Addon_BCKopf (C_Item)
{
	name 				=	"Kopf";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_BCKopf;

	visual 				=	"ItAt_Blattcrawler_01.3DS"; 
	material 			=	MAT_LEATHER;
	

	description			= 	"Kopf der Fangheuschrecke";
	TEXT[0]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_Meatbugflesh (C_Item)
{
	name 				=	"Wanzenfleisch";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Meatbugflesh;

	visual 				=	"ItAt_Meatbugflesh.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOODHUGE";
	on_state[0]			=	Use_Meatbugflesh;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	NAME_Bonus_HP; COUNT[1] = 10;
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

	FUNC VOID Use_Meatbugflesh()
	{
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS, 10);

		self.aivar[AIV_Damage] += 10;

		if (self.aivar[AIV_Damage] > self.attribute[ATR_HITPOINTS_MAX])
		{
			self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];
		};
	};

/******************************************************************************************/
INSTANCE ItAt_SheepFur (C_Item)
{
	name 				=	"Schafsfell";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SheepFur;

	visual 				=	"ItAt_SheepFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItAt_SheepFur_Rein (C_Item)
{
	name 				=	"unbeschädigtes Schafsfell";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SheepFur_Rein;

	visual 				=	"ItAt_SheepFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItAt_SheepFur_Feuer (C_Item)
{
	name 				=	"versengtes Schafsfell";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SheepFur_Feuer;

	visual 				=	"ItAt_SheepFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_WolfFur (C_Item)
{
	name 				=	"Wolfsfell";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_WolfFur;

	visual 				=	"ItAt_WolfFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_WolfFur_Rein (C_Item)
{
	name 				=	"unbeschädigtes Wolfsfell";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_WolfFur_Rein;

	visual 				=	"ItAt_WolfFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_WolfFur_Feuer (C_Item)
{
	name 				=	"versengtes Wolfsfell";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_WolfFur_Feuer;

	visual 				=	"ItAt_WolfFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItAt_TigerFur (C_Item)
{
	name 				=	"weißes Tigerfell";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	1000;

	visual 				=	"ItAt_TigerFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItAt_TigerFur_Rein (C_Item)
{
	name 				=	"unbeschädigtes weißes Tigerfell";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	1000;

	visual 				=	"ItAt_TigerFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItAt_TigerFur_Feuer (C_Item)
{
	name 				=	"versengtes weißes Tigerfell";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	1000;

	visual 				=	"ItAt_TigerFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItAt_StonePumaFur (C_Item)
{
	name 				=	"Steinpumafell";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_PumaFur;

	visual 				=	"ItAt_StonePumaFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItAt_StonePumaFur_Rein (C_Item)
{
	name 				=	"unbeschädigtes Steinpumafell";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_PumaFur_Rein;

	visual 				=	"ItAt_StonePumaFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItAt_StonePumaFur_Feuer (C_Item)
{
	name 				=	"versengtes Steinpumafell";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_PumaFur_Feuer;

	visual 				=	"ItAt_StonePumaFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItAt_PumaFur (C_Item)
{
	name 				=	"Pumafell";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_PumaFur;

	visual 				=	"ItAt_PumaFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItAt_PumaFur_Rein (C_Item)
{
	name 				=	"unbeschädigtes Pumafell";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_PumaFur_Rein;

	visual 				=	"ItAt_PumaFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItAt_PumaFur_Feuer (C_Item)
{
	name 				=	"versengtes Pumafell";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_PumaFur_Feuer;

	visual 				=	"ItAt_PumaFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_BugMandibles (C_Item)
{
	name 				=	"Feldräuberzangen";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_BugMandibles;

	visual 				=	"ItAt_BugMandibles.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_Claw (C_Item)
{
	name 				=	"Krallen";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Claw;

	visual 				=	"ItAt_Claw.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItAt_AlligatorClaw (C_Item)
{
	name 				=	"Alligatorenkrallen";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Claw;

	visual 				=	"ItAt_Claw.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItAt_DragonClaw (C_Item)
{
	name 				=	"Drachenkrallen";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Claw;

	visual 				=	"ItAt_Claw.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItAt_DragonSehne (C_Item)
{
	name 				=	"Drachensehne";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Claw;

	visual 				=	"DB_ItMi_Sehnen.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItAt_DrachensnapperSehne (C_Item)
{
	name 				=	"Drachensnappersehne";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Claw;

	visual 				=	"DB_ItMi_Sehnen.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItMi_Moleratstreifen (C_Item)
{
	name 				=	"Moleratstreifen";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Claw;

	visual 				=	"DB_ItMi_Sehnen.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItAt_Wirbelsaeule (C_Item)
{
	name 				=	"Wirbelsäule eines Sumpfcrawlers";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Claw;

	visual 				=	"ItAt_Wirbelsaeule.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_LurkerClaw (C_Item)
{
	name 				=	"Lurker Klaue";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_LurkerClaw;

	visual 				=	"ItAt_LurkerClaw.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_Teeth (C_Item)
{
	name 				=	"Zähne";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Teeth;

	visual 				=	"ItAt_Teeth.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_Teeth_Wolf (C_Item)
{
	name 				=	"Zähne eines Wolfes, der seine eigene Mutter gerissen hat";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_SHOW;

	value 				=	Value_Teeth;

	visual 				=	"ItAt_Teeth.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_ErzdemonTooth (C_Item)
{
	name 				=	"Zähne eines Erzdämons";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_ErzdemonTooth;

	visual 				=	"ItAt_Teeth.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_CrawlerMandibles (C_Item)
{
	name 				=	"Minecrawlerzangen";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_CrawlerMandibles;

	visual 				=	"ItAt_CrawlerMandibles.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"FOOD";
	on_state[0]			=	Use_Mandibles;
	
	description			= 	name;
	
	TEXT[0]				= 	"Die Zangen können aufgebrochen, ";
	TEXT[1]				= 	"und das Sekret darin geschlürft werden.";
	TEXT[2]				= 	"Es regeniert die magische Kraft.";
	TEXT[3]				= 	"Verliert mit der Zeit seine Wirkung.";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
FUNC VOID Use_Mandibles()
{
	if (Mandibles_Bonus <= 9)
	{
		Npc_ChangeAttribute	(self,	ATR_MANA, self.attribute[ATR_MANA_MAX] );
		
		Mandibles_Bonus = (Mandibles_Bonus +1);
	}
	else
	{
		PrintScreen		(PRINT_Mandibles, -1, YPOS_LEVELUP, FONT_ScreenSmall, 2);
	};
};
/******************************************************************************************/
INSTANCE ItAt_SpiderMandibles (C_Item)
{
	name 				=	"Spinnenzangen";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_CrawlerMandibles;

	visual 				=	"ItAt_CrawlerMandibles.3DS";
	material 			=	MAT_LEATHER;
	
	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_DalmaZange (C_Item)
{
	name 				=	"Zange der Dalma";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_CrawlerMandibles*20;

	visual 				=	"ItAt_CrawlerMandibles.3DS";
	material 			=	MAT_LEATHER;
	
	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItAt_Wing (C_Item)
{
	name 				=	"Flügel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Wing;
	
	visual 				=	"ItAt_Wing.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItAt_FleischflyWing (C_Item)
{
	name 				=	"Flügel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Wing;
	
	visual 				=	"ItAt_FleischflyWing.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_Sting (C_Item)
{
	name 				=	"Stachel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sting;
	scemeName			=	"FOOD";
	
	on_state[0]			=	Use_Sting;
	
	visual 				=	"ItAt_Sting.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"Der Stachel";
	TEXT[2]				= 	"enthält ein giftiges Sekret";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
FUNC VOID Use_Sting()
{
	if (Knows_Bloodfly == TRUE)
	{
		if (Bloodfly_Bonus <= 10)
		{
			Npc_ChangeAttribute (self, ATR_HITPOINTS, self.attribute[ATR_HITPOINTS_MAX]);

			self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

			Print (PRINT_FullyHealed);
			
			Bloodfly_Bonus = (Bloodfly_Bonus+1);
		}
		else
		{
			Print (PRINT_Mandibles);
		};
	}
	else
	{
		Print (PRINT_Bloodfly);
		
		if (self.attribute[ATR_HITPOINTS] > 1) 
		{
			self.attribute[ATR_HITPOINTS] =  (self.attribute[ATR_HITPOINTS] -1);

			self.aivar[AIV_Damage] -= 1;
		};
	};
};

INSTANCE ItAt_FleischflySting (C_Item)
{
	name 				=	"Stachel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_Sting;
		
	visual 				=	"ItAt_FleischflySting.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE itat_LurkerSkin (C_Item) //REPTILE Skin
{
	name 				=	"Reptilienhaut";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_ReptileSkin;

	visual 				=	"ItAt_LurkerSkin.3DS";
	material 			=	MAT_LEATHER;

	description			= 	"Die Haut eines Reptils";
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
INSTANCE itat_LurkerSkin_Young (C_Item) //REPTILE Skin
{
	name 				=	"Haut eines jungen Lurkers";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_ReptileSkin;

	visual 				=	"ItAt_LurkerSkin.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE itat_Feuersnapperhaut (C_Item) //REPTILE Skin
{
	name 				=	"Feuersnapperhaut";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_ReptileSkin;

	visual 				=	"ItAt_LurkerSkin.3DS";
	material 			=	MAT_LEATHER;

	description			= 	"Die Haut eines Feuersnappers";
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE itat_Wassersnapperhaut (C_Item) //REPTILE Skin
{
	name 				=	"Wassersnapperhaut";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_ReptileSkin;

	visual 				=	"ItAt_LurkerSkin.3DS";
	material 			=	MAT_LEATHER;

	description			= 	"Die Haut eines Wassersnappers";
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE itat_Schattensnapperhaut (C_Item) //REPTILE Skin
{
	name 				=	"Schattensnapperhaut";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_ReptileSkin;

	visual 				=	"ItAt_LurkerSkin.3DS";
	material 			=	MAT_LEATHER;

	description			= 	"Die Haut eines Schattensnappers";
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE itat_LindwurmHaut (C_Item) //REPTILE Skin
{
	name 				=	"Lindwurmhaut";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SharkSkin*10;

	visual 				=	"ItAt_LindwurmSkin.3DS";
	material 			=	MAT_LEATHER;

	description			= 	"Die Haut eines Lindwurms";
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_UndeadSharkSkin (C_Item)
{
	name 				=	"Haut eines untoten Sumpfhais";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SharkSkin;

	visual 				=	"ItAt_UndeadSharkSkin.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_WargFur (C_Item)
{
	name 				=	"Wargfell";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_WargFur;

	visual 				=	"ItAt_WargFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_WargFur_Rein (C_Item)
{
	name 				=	"unbeschädigtes Wargfell";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_WargFur_Rein;

	visual 				=	"ItAt_WargFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_WargFur_Feuer (C_Item)
{
	name 				=	"versengtes Wargfell";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_WargFur_Feuer;

	visual 				=	"ItAt_WargFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_WargFur_Urs (C_Item)
{
	name 				=	"Wargfell";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_WargFur;

	visual 				=	"ItAt_WargFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItAt_WaterorcFur (C_Item)
{
	name 				=	"Wasserorkfell";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_WargFur;

	visual 				=	"ItAt_WargFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItAt_OrcdogFur (C_Item)
{
	name 				=	"Orkhundfell";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_WargFur;

	visual 				=	"ItAt_OrcdogFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItAt_OrcdogFur_Rein (C_Item)
{
	name 				=	"unbeschädigtes Orkhundfell";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_WargFur_Rein;

	visual 				=	"ItAt_OrcdogFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItAt_OrcdogFur_Feuer (C_Item)
{
	name 				=	"versengtes Orkhundfell";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_WargFur_Feuer;

	visual 				=	"ItAt_OrcdogFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItAt_BigOrcdogFur (C_Item)
{
	name 				=	"Großes Orkhundfell";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_WargFur;

	visual 				=	"ItAt_OrcdogFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_Addon_KeilerFur (C_Item)
{
	name 				=	"Keilerfell";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_KeilerFur;

	visual 				=	"ItAt_WargFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_Addon_KeilerFur_Rein (C_Item)
{
	name 				=	"unbeschädigtes Keilerfell";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_KeilerFur_Rein;

	visual 				=	"ItAt_WargFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_Addon_KeilerFur_Feuer (C_Item)
{
	name 				=	"versengtes Keilerfell";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_KeilerFur_Feuer;

	visual 				=	"ItAt_WargFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};	
/******************************************************************************************/
INSTANCE ItAt_KeilerHauer (C_Item)
{
	name 				=	"Keilerhauer";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_KeilerFur;

	visual 				=	"ItAt_KeilerHauer.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_Addon_KeilerFur01 (C_Item)
{
	name 				=	"Keilerfell";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_KeilerFur;

	visual 				=	"ItAt_KeilerFur01.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_Addon_KeilerFur01_Rein (C_Item)
{
	name 				=	"unbeschädigtes Keilerfell";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_KeilerFur_Rein;

	visual 				=	"ItAt_KeilerFur01.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_Addon_KeilerFur01_Feuer (C_Item)
{
	name 				=	"versengtes Keilerfell";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_KeilerFur_Feuer;

	visual 				=	"ItAt_KeilerFur01.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_DrgSnapperHorn (C_Item)
{
	name 				=	"Horn eines Drachensnappers";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_DrgSnapperHorn;

	visual 				=	"ItAt_DrgSnapperHorn.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_CrawlerPlate (C_Item)
{
	name 				=	"Minecrawler Panzerplatten";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_CrawlerPlate;

	visual 				=	"ItAt_CrawlerPlate.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_ShadowFur (C_Item)
{
	name 				=	"Fell eines Schattenläufers";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_ShadowFur;

	visual 				=	"ItAt_ShadowFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_ShadowFur_Rein (C_Item)
{
	name 				=	"unbeschädigtes Fell eines Schattenläufers";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_ShadowFur_Rein;

	visual 				=	"ItAt_ShadowFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_ShadowFur_Feuer (C_Item)
{
	name 				=	"versengtes Fell eines Schattenläufers";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_ShadowFur_Feuer;

	visual 				=	"ItAt_ShadowFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_ShadowFurNew (C_Item)
{
	name 				=	"Fell eines Schattenläufers";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_ShadowFur;

	visual 				=	"ItAt_ShadowFurNew.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_ShadowFurNew_Rein (C_Item)
{
	name 				=	"unbeschädigtes Fell eines Schattenläufers";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_ShadowFur_Rein;

	visual 				=	"ItAt_ShadowFurNew.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_ShadowFurNew_Feuer (C_Item)
{
	name 				=	"versengtes Fell eines Schattenläufers";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_ShadowFur_Feuer;

	visual 				=	"ItAt_ShadowFurNew.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItAt_FireShadowFur (C_Item)
{
	name 				=	"Fell eines Feuerläufers";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	500;

	visual 				=	"ItAt_FireShadowFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItAt_WaterShadowFur (C_Item)
{
	name 				=	"Fell eines Wasserläufers";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	500;

	visual 				=	"ItAt_WaterShadowFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItAt_NightmareFur (C_Item)
{
	name 				=	"Fell eines Nachtmahrs";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	500;

	visual 				=	"ItAt_NightmareFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_SharkSkin (C_Item)
{
	name 				=	"Haut eines Sumpfhais";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SharkSkin;

	visual 				=	"ItAt_SharkSkin.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_TrollFur (C_Item)
{
	name 				=	"Trollfell";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_TrollFur;

	visual 				=	"ItAt_TrollFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_TrollFur_Rein (C_Item)
{
	name 				=	"unbeschädigtes Trollfell";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_TrollFur_Rein;

	visual 				=	"ItAt_TrollFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_TrollFur_Feuer (C_Item)
{
	name 				=	"versengtes Trollfell";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_TrollFur_Feuer;

	visual 				=	"ItAt_TrollFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItAt_TrollHöhleFur (C_Item)
{
	name 				=	"Höhlentrollfell";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_TrollFur;

	visual 				=	"ItAt_TrollHoehleFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItAt_TrollHöhleFur_Rein (C_Item)
{
	name 				=	"unbeschädigtesHöhlentrollfell";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_TrollFur_Rein;

	visual 				=	"ItAt_TrollHoehleFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItAt_TrollHöhleFur_Feuer (C_Item)
{
	name 				=	"versengtes Höhlentrollfell";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_TrollFur_Feuer;

	visual 				=	"ItAt_TrollHoehleFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_TrollBlackFur (C_Item)
{
	name 				=	"Fell eines schwarzen Trolls";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_TrollBlackFur;

	visual 				=	"ItAt_TrollBlackFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_TrollBlackFur_Rein (C_Item)
{
	name 				=	"unbeschädigtes Fell eines schwarzen Trolls";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_TrollBlackFur_Rein;

	visual 				=	"ItAt_TrollBlackFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_TrollBlackFur_Feuer (C_Item)
{
	name 				=	"versengtes Fell eines schwarzen Trolls";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_TrollBlackFur_Feuer;

	visual 				=	"ItAt_TrollBlackFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItAt_TrollSilberFur (C_Item)
{
	name 				=	"Fell eines silbernen Trolls";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	1000;

	visual 				=	"ItAt_TrollSilberFur.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_WaranFiretongue (C_Item)
{
	name 				=	"Flammenzunge";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_WaranFiretongue;

	visual 				=	"ItAt_WaranFiretongue.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_ShadowHorn (C_Item)
{
	name 				=	"Horn eines Schattenläufers";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_ShadowHorn;

	visual 				=	"ItAt_ShadowHorn.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItAt_FireShadowHorn (C_Item)
{
	name 				=	"Horn eines Feuerläufers";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	500;

	visual 				=	"ItAt_FireShadowHorn.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItAt_WaterShadowHorn (C_Item)
{
	name 				=	"Horn eines Wasserläufers";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	500;

	visual 				=	"ItAt_WaterShadowHorn.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItAt_NightmareHorn (C_Item)
{
	name 				=	"Horn eines Nachtmahrs";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	500;

	visual 				=	"ItAt_NightmareHorn.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItAt_ShadowHorn2 (C_Item)
{
	name 				=	"Horn eines Schattenläufers";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual 				=	"ItAt_ShadowHorn.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_SharkTeeth (C_Item)
{
	name 				=	"Zähne eines Sumpfhais";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SharkTeeth;

	visual 				=	"ItAt_SharkTeeth.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_LindwurmTeeth (C_Item)
{
	name 				=	"Zähne eines Lindwurms";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SharkTeeth*10;

	visual 				=	"ItAt_LindwurmTeeth.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_UndeadSharkTeeth (C_Item)
{
	name 				=	"Zähne eines untoten Sumpfhais";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SharkTeeth;

	visual 				=	"ItAt_UndeadSharkTeeth.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_TrollTooth (C_Item)
{
	name 				=	"Trollhauer";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_TrollTooth;

	visual 				=	"ItAt_TrollTooth.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
	
	INV_ZBIAS				= INVCAM_ENTF_RING_STANDARD;
	
};
/******************************************************************************************/
INSTANCE ItAt_StoneGolemHeart (C_Item)
{
	name 				=	"Herz eines Steingolems";

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	spell				= 	SPL_GOLEMWINDFIST;

	value 				=	Value_StoneGolemHeart;

	visual 				=	"ItAt_StoneGolemHeart.3DS";
	material 			=	MAT_STONE;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	""; 
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItAt_FireGolemHeart (C_Item)
{
	name 				=	"Herz eines Feuergolems";

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	spell				= 	SPL_GolemChargeFIREBALL;

	value 				=	Value_FireGolemHeart;

	visual 				=	"ItAt_FireGolemHeart.3DS";
	material 			=	MAT_STONE;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	""; 
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItAt_BalrogHeart (C_Item)
{
	name 				=	"Herz des Balrogs";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_SHOW;

	value 				=	Value_FireGolemHeart;

	visual 				=	"ItAt_FireGolemHeart.3DS";
	material 			=	MAT_STONE;
	scemeName			=	"FOOD";
	on_state[0]		=	Use_BalrogHeart;

	description			= 	name;
	TEXT[0]				= 	"Ich habe das Gefühl, als sollte ich es essen.";
	TEXT[1]				= 	"";
	TEXT[2]				= 	""; 
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID Use_BalrogHeart()
{
	hero.attribute[ATR_HITPOINTS_MAX] += 20;
	hero.attribute[ATR_HITPOINTS] += 20;

	hero.aivar[AIV_Damage] = hero.attribute[ATR_HITPOINTS];

	hero.attribute[ATR_STRENGTH] += 3;
	hero.attribute[ATR_DEXTERITY] += 3;

	hero.protection[PROT_EDGE] += 5000;
	hero.protection[PROT_BLUNT] += 5000;

	PrintScreen ("+20 HP, +3 Stärke, +3 Geschick, +5 Schutz vor Waffen", -1, -1, FONT_SCREEN, 2);

	Mod_BalrogHeart = TRUE;
};

/******************************************************************************************/
INSTANCE ItAt_GigantHeart (C_Item)
{
	name 				=	"Giftige Eingeweide des Gigants der Vorzeit";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_SHOW;

	value 				=	Value_FireGolemHeart;

	visual 				=	"ItAt_SwampGolemHeart.3DS";
	material 			=	MAT_STONE;

	description			= 	name;
	TEXT[0]				= 	"Diese Eingeweide stinken und triefen vor Gift.";
	TEXT[1]				= 	"";
	TEXT[2]				= 	""; 
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItAt_IceGolemHeart (C_Item)
{
	name 				=	"Herz eines Eisgolems";

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	0;
	spell				= 	SPL_GolemICECUBE;

	value 				=	Value_IceGolemHeart;

	visual 				=	"ItAt_IceGolemHeart.3DS";
	material 			=	MAT_STONE;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItAt_SwampGolemHeart (C_Item)
{
	name 				=	"Herz eines Sumpfgolems";

	mainflag 			=	ITEM_KAT_RUNE;
	flags 				=	ITEM_MULTI;
	spell				= 	SPL_GolemGeyser;

	value 				=	Value_IceGolemHeart;

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
INSTANCE ItAt_GoblinBone (C_Item)
{
	name 				=	"Knochen eines Goblins";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_GoblinBone;

	visual 				=	"ItAt_GoblinBone.3DS";
	material 			=	MAT_WOOD;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_SkeletonBone (C_Item)
{
	name 				=	"Knochen eines Skeletts";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SkeletonBone;

	visual 				=	"ItAt_SkeletonBone.3DS";
	material 			=	MAT_WOOD;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_SkeletonBone_Herrscher (C_Item)
{
	name 				=	"Knochen eines alten Herrschers, der über tausend Jahre herrschte";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_SHOW;

	value 				=	Value_SkeletonBone;

	visual 				=	"ItAt_SkeletonBone.3DS";
	material 			=	MAT_WOOD;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_SkeletonHead (C_Item)
{
	name 				=	"Totenschädel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_SkeletonBone;

	visual 				=	"DT_SKELETON_V01_HEAD.3DS";
	material 			=	MAT_WOOD;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_DemonHeart (C_Item)
{
	name 				=	"Herz eines Dämonen";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_DemonHeart;

	visual 				=	"ItAt_DemonHeart.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

//**************************************************************************
//					Drachentrophäen		
//**************************************************************************
INSTANCE ItAt_SoulStone (C_Item)
{
	name 				=	"Seelenstein";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION|ITEM_SHOW;

	value 				=	Value_UndeadDragonSoulStone;

	visual 				=	"ItAt_UndeadDragonSoulStone.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC_STANDARD;
	
};
INSTANCE ItAt_SoulStone_Urnol (C_Item)
{
	name 				=	"Seelenstein von Urnol";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION|ITEM_SHOW;

	value 				=	Value_UndeadDragonSoulStone;

	visual 				=	"ItAt_UndeadDragonSoulStone.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC_STANDARD;
	
};
INSTANCE ItAt_SoulStone_Formwandler (C_Item)
{
	name 				=	"Seelenstein vom Formwandler";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION|ITEM_SHOW;

	value 				=	Value_UndeadDragonSoulStone;

	visual 				=	"ItAt_UndeadDragonSoulStone.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
	
	INV_ZBIAS				= INVCAM_ENTF_MISC_STANDARD;
	
};
INSTANCE ItAt_SoulStone_UD (C_Item)
{
	name 				=	"Seelenstein vom untoten Drachen";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION|ITEM_SHOW;

	value 				=	Value_UndeadDragonSoulStone;

	visual 				=	"ItAt_UndeadDragonSoulStone.3DS";
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
INSTANCE ItAt_IcedragonHeart (C_Item)
{
	name 				=	"Herz eines Eisdrachen";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	Value_IcedragonHeart;

	visual 				=	"ItAt_IcedragonHeart.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_RockdragonHeart (C_Item)
{
	name 				=	"Herz eines Felsdrachen";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	Value_RockdragonHeart;

	visual 				=	"ItAt_RockdragonHeart.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_SwampdragonHeart (C_Item)
{
	name 				=	"Herz eines Sumpfdrachens";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION; 

	value 				=	Value_SwampdragonHeart;

	visual 				=	"ItAt_SwampdragonHeart.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_FiredragonHeart (C_Item)
{
	name 				=	"Herz eines Feuerdrachen";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	Value_FiredragonHeart;

	visual 				=	"ItAt_FiredragonHeart.3DS";
	material 			=	MAT_LEATHER;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_DragonBlood (C_Item)
{
	name 				=	"Drachenblut";

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
INSTANCE ItAt_DragonElixier (C_Item)
{
	name 				=	"Flammenelixier";

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
INSTANCE ItAt_Menschenblut (C_Item)
{
	name 				=	"Menschenblut";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	50;

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
INSTANCE ItAt_Hexenblut (C_Item)
{
	name 				=	"Hexenblut";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_MISSION;

	value 				=	50;

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

INSTANCE ItMi_DeliriumEnergie (C_Item)
{
	name 				=	"Fläschchen mit Energie";

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
INSTANCE ItAt_DragonScale (C_Item)
{
	name 				=	"Drachenschuppen";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_DragonScale;

	visual 				=	"ItAt_DragonScale.3DS";
	material 			=	MAT_STONE ;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/
INSTANCE ItAt_Seeungeheuerschuppen (C_Item)
{
	name 				=	"Seeungeheuerschuppen";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI|ITEM_SHOW;

	value 				=	Value_DragonScale;

	visual 				=	"ItAt_DragonScale.3DS";
	material 			=	MAT_STONE ;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItAt_Wyverschuppen (C_Item)
{
	name 				=	"Wyverschuppen";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	Value_DragonScale;

	visual 				=	"ItAt_DragonScale.3DS";
	material 			=	MAT_STONE ;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItAt_CrawlerKristall (C_Item)
{
	name 				=	"Kristall eines Kristallcrawlers";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	50;

	visual 				=	"ItMi_Rockcrystal.3ds";
	material 			=	MAT_STONE ;

	description			= 	name;
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"";
	TEXT[3]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};
/******************************************************************************************/



