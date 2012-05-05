// *********************************************************
// Rüstungs Kosten in Gold
// -----------------------
// Alles, was hier mit 0 angegeben ist  
// a) kann der Spieler NIE bekommen und
// b) braucht auch KEIN Visuaisierungs-Item (ItAr_TestDummy)
// *********************************************************

// ------ Stadt ------
const int VALUE_ITAR_Governor	= 1100;
const int VALUE_ITAR_Judge		= 0;
const int VALUE_ITAR_Smith		= 0;
const int VALUE_ITAR_Barkeeper	= 0;
const int VALUE_ITAR_Vlk_L		= 120;
const int VALUE_ITAR_Vlk_M		= 120;
const int VALUE_ITAR_Vlk_H		= 120;
const int VALUE_ITAR_VlkBabe_L	= 0;
const int VALUE_ITAR_VlkBabe_M	= 0;
const int VALUE_ITAR_VlkBabe_H	= 0;
const int VALUE_ITAR_MIL_L		= 600;
const int VALUE_ITAR_MIL_M		= 2500;
const int VALUE_ITAR_PAL_M		= 5000;
const int VALUE_ITAR_PAL_H		= 20000;

// ------ Bauern und Söldner ------
const int VALUE_ITAR_Bau_L		= 80;
const int VALUE_ITAR_Bau_M		= 100;
const int VALUE_ITAR_BauBabe_L	= 0;
const int VALUE_ITAR_BauBabe_M	= 0;
const int VALUE_ITAR_SLD_L		= 500;
const int VALUE_ITAR_SLD_M		= 1000;
const int VALUE_ITAR_DJG_Crawler= 1500;
const int VALUE_ITAR_SLD_H		= 2500;

// ------ Kloster ------
const int VALUE_ITAR_NOV_L		= 280;
const int VALUE_ITAR_KDF_L		= 500;
const int VALUE_ITAR_KDF_H		= 3000;

// ------ Banditen ------
const int VALUE_ITAR_Leather_L	= 250;
const int VALUE_ITAR_BDT_M		= 550;
const int VALUE_ITAR_BDT_H		= 2100;

// ------ Drachenjäger ------
const int VALUE_ITAR_DJG_L		= 3000;
const int VALUE_ITAR_DJG_M		= 12000;
const int VALUE_ITAR_DJG_H		= 20000;
const int VALUE_ITAR_DJG_Babe	= 0;

// ------ Besondere ------
const int VALUE_ITAR_XARDAS		= 15000;
const int VALUE_ITAR_LESTER		= 300;
const int VALUE_ITAR_DIEGO		= 450;
const int VALUE_ITAR_CorAngar	= 600;
const int VALUE_ITAR_Dementor	= 500;
const int VALUE_ITAR_KDW_H		= 450;
const int VALUE_ITAR_Prisoner	= 10;


// ******************
// 		Rüstungen
// ******************

INSTANCE ITAR_AmPro_Test (C_Item)
{
	name 					=	"Wams des Statthalters";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40000;
	protection [PROT_BLUNT]	= 	40000;
	protection [PROT_POINT] = 	40000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_Governor;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Governor.3ds";
	visual_change 			=	"Armor_AmPro_Test.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

INSTANCE ITAR_BattleMage (C_Item)
{
	name 					=	"Wams des Statthalters";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40000;
	protection [PROT_BLUNT]	= 	40000;
	protection [PROT_POINT] = 	40000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_Governor;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Governor.3ds";
	visual_change 			=	"Armor_BattleMage.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

INSTANCE ITAR_VlkBabe_Nude (C_Item)
{
	name 					=	"Wams des Statthalters";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40000;
	protection [PROT_BLUNT]	= 	40000;
	protection [PROT_POINT] = 	40000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_Governor;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Governor.3ds";
	visual_change 			=	"Armor_VlkBabe_Nude.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

INSTANCE ITAR_Wendel (C_Item)
{
	name 					=	"Wendels Kleidung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40000;
	protection [PROT_BLUNT]	= 	40000;
	protection [PROT_POINT] = 	40000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_Governor;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Governor.3ds";
	visual_change 			=	"Armor_Wendel.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

INSTANCE ITAR_Monteur (C_Item)
{
	name 					=	"Kleidung vom Monteur";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40000;
	protection [PROT_BLUNT]	= 	40000;
	protection [PROT_POINT] = 	40000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_Governor;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Governor.3ds";
	visual_change 			=	"Armor_Monteur.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

INSTANCE ITAR_Jaeger (C_Item)
{
	name 					=	"Wams des Statthalters";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40000;
	protection [PROT_BLUNT]	= 	40000;
	protection [PROT_POINT] = 	40000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_Governor;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Governor.3ds";
	visual_change 			=	"Armor_Jaeger.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

INSTANCE ITAR_Governor (C_Item)
{
	name 					=	"Wams des Statthalters";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40000;
	protection [PROT_BLUNT]	= 	40000;
	protection [PROT_POINT] = 	40000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_Governor;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Governor.3ds";
	visual_change 			=	"Armor_Governor.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

INSTANCE ITAR_Nrd_M (C_Item)
{
	name 					=	"Wams des Statthalters";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40000;
	protection [PROT_BLUNT]	= 	40000;
	protection [PROT_POINT] = 	40000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_Governor;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Governor.3ds";
	visual_change 			=	"Hum_NrdM_Armor.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

INSTANCE ITAR_GelehrterNeu (C_Item)
{
	name 					=	"Kleidung des Gelehrten";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40000;
	protection [PROT_BLUNT]	= 	40000;
	protection [PROT_POINT] = 	40000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_Governor;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Governor.3ds";
	visual_change 			=	"Hum_NrdM_Armor.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;
	
	on_equip				=	Equip_ITAR_Dieb;
	on_unequip				=	UnEquip_ITAR_Dieb;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

FUNC VOID Equip_ItAr_Dieb()
{
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PC_Hero))
	{
		Mod_Dieb_Verkleidung += 1;
	};
};

FUNC VOID UnEquip_ItAr_Dieb()
{
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PC_Hero))
	{
		Mod_Dieb_Verkleidung -= 1;
	};
};

INSTANCE ITAR_Hofstaatler (C_Item)
{
	name 					=	"Wams der Hofstaatler";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40000;
	protection [PROT_BLUNT]	= 	40000;
	protection [PROT_POINT] = 	40000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_Governor;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Hofstaatler.3ds";
	visual_change 			=	"Armor_Hofstaatler.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

INSTANCE ITAR_Hofstaatlerin (C_Item)
{
	name 					=	"Wams der Hofstaatler";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40000;
	protection [PROT_BLUNT]	= 	40000;
	protection [PROT_POINT] = 	40000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_Governor;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Hofstaatler.3ds";
	visual_change 			=	"Armor_Hofstaatlerin.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

INSTANCE ITAR_WKR_H (C_Item)
{
	name 					=	"Wasserkriegerrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	100000;
	protection [PROT_BLUNT]	= 	100000;
	protection [PROT_POINT] = 	100000;
	protection [PROT_FIRE] 	= 	50;
	protection [PROT_MAGIC] = 	25;

	value 					=	VALUE_ITAR_Governor;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Wasserkrieger.3ds";
	visual_change 			=	"Armor_Wasserkrieger.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

INSTANCE ITAR_WKR_S (C_Item)
{
	name 					=	"Verbesserte Wasserkriegerrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	120000;
	protection [PROT_BLUNT]	= 	120000;
	protection [PROT_POINT] = 	120000;
	protection [PROT_FIRE] 	= 	75;
	protection [PROT_MAGIC] = 	35;

	value 					=	VALUE_ITAR_Governor;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Wasserkrieger_Besser.3ds";
	visual_change 			=	"Armor_Wasserkrieger_Besser.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

INSTANCE ITAR_Hueter (C_Item)
{
	name 					=	"Hüterrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	150000;
	protection [PROT_BLUNT]	= 	150000;
	protection [PROT_POINT] = 	150000;
	protection [PROT_FIRE] 	= 	100000;
	protection [PROT_MAGIC] = 	50;

	value 					=	2000;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Hueterruestung.3ds";
	visual_change 			=	"Armor_Hueterruestung.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

INSTANCE ITAR_Hueter_S (C_Item)
{
	name 					=	"Blaue Wächterrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	200000;
	protection [PROT_BLUNT]	= 	200000;
	protection [PROT_POINT] = 	200000;
	protection [PROT_FIRE] 	= 	120;
	protection [PROT_MAGIC] = 	100;

	value 					=	VALUE_ITAR_Governor;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Hueterruestung_Besser.3ds";
	visual_change 			=	"Armor_Hueterruestung_Besser.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
// ******************************************************
INSTANCE ITAR_JUDGE (C_Item)
{
	name 					=	"Richterrobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10000;
	protection [PROT_BLUNT] = 	10000;
	protection [PROT_POINT] = 	10000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_JUDGE;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Governor.3DS";
	visual_change 			=	"Armor_Judge.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
// ******************************************************
INSTANCE ITAR_SMITH (C_Item)
{
	name 					=	"Schmiedkleidung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	15000;
	protection [PROT_BLUNT] = 	15000;
	protection [PROT_POINT] = 	15000;
	protection [PROT_FIRE] 	= 	5;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_SMITH;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Smith.3DS";
	visual_change 			=	"Armor_Smith.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
// ******************************************************
INSTANCE ITAR_Metzger (C_Item)
{
	name 					=	"Metzgerkleidung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	15000;
	protection [PROT_BLUNT] = 	15000;
	protection [PROT_POINT] = 	15000;
	protection [PROT_FIRE] 	= 	5;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_SMITH;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Smith.3DS";
	visual_change 			=	"Armor_Metzger.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
// ******************************************************
INSTANCE ITAR_Baecker (C_Item)
{
	name 					=	"Bäckerkleidung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	15000;
	protection [PROT_BLUNT] = 	15000;
	protection [PROT_POINT] = 	15000;
	protection [PROT_FIRE] 	= 	5;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_SMITH;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Smith.3DS";
	visual_change 			=	"Armor_Baecker.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
INSTANCE ITAR_Maler (C_Item)
{
	name 					=	"Malerkleidung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	15000;
	protection [PROT_BLUNT] = 	15000;
	protection [PROT_POINT] = 	15000;
	protection [PROT_FIRE] 	= 	5;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_SMITH;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Maler.3DS";
	visual_change 			=	"Armor_Maler.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
// ******************************************************
INSTANCE ITAR_BARKEEPER (C_Item)
{
	name 					=	"Wirtskleidung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10000;
	protection [PROT_BLUNT] = 	10000;
	protection [PROT_POINT] = 	10000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_BARKEEPER;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Wirt.3DS";
	visual_change 			=	"Armor_Barkeeper.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
// ******************************************************
INSTANCE ITAR_VLK_L (C_Item)
{
	name 					=	"Bürgerkleidung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10000;
	protection [PROT_BLUNT] = 	10000;
	protection [PROT_POINT] = 	10000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_VLK_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_VLK_L.3DS";
	visual_change 			=	"Armor_Vlk_L.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;		
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;	
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
// ******************************************************
INSTANCE ITAR_VLK_M (C_Item)
{
	name 					=	"Bürgerkleidung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10000;
	protection [PROT_BLUNT] = 	10000;
	protection [PROT_POINT] = 	10000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_VLK_M;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_VLK_M.3DS";
	visual_change 			=	"Armor_Vlk_M.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
// ******************************************************
INSTANCE ITAR_VLK_H (C_Item)
{
	name 					=	"Bürgerkleidung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10000;
	protection [PROT_BLUNT] = 	10000;
	protection [PROT_POINT] = 	10000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_VLK_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_VLK_H.3DS";
	visual_change 			=	"Armor_Vlk_H.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
INSTANCE ITAR_VLK_01 (C_Item)
{
	name 					=	"Bürger Kleidung 01";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10000;
	protection [PROT_BLUNT] = 	10000;
	protection [PROT_POINT] = 	10000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_VLK_M;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_VLK_01.3DS";
	visual_change 			=	"Armor_Vlk_01.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
INSTANCE ITAR_VLK_02 (C_Item)
{
	name 					=	"Bürger Kleidung 01";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10000;
	protection [PROT_BLUNT] = 	10000;
	protection [PROT_POINT] = 	10000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_VLK_M;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_VLK_02.3DS";
	visual_change 			=	"Armor_Vlk_02.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
INSTANCE ITAR_VLK_04 (C_Item)
{
	name 					=	"Bürger Kleidung 01";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10000;
	protection [PROT_BLUNT] = 	10000;
	protection [PROT_POINT] = 	10000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_VLK_M;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_VLK_04.3DS";
	visual_change 			=	"Armor_Vlk_04.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
INSTANCE ITAR_VLK_09 (C_Item)
{
	name 					=	"Bürger Kleidung 01";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10000;
	protection [PROT_BLUNT] = 	10000;
	protection [PROT_POINT] = 	10000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_VLK_M;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_VLK_09.3DS";
	visual_change 			=	"Armor_Vlk_09.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
INSTANCE ITAR_VLK_10 (C_Item)
{
	name 					=	"Bürger Kleidung 01";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10000;
	protection [PROT_BLUNT] = 	10000;
	protection [PROT_POINT] = 	10000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_VLK_M;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_VLK_10.3DS";
	visual_change 			=	"Armor_Vlk_10.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
// ******************************************************
INSTANCE ITAR_BuergerNew_01 (C_Item)
{
	name 					=	"Bürgerkleidung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10000;
	protection [PROT_BLUNT] = 	10000;
	protection [PROT_POINT] = 	10000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_VLK_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"BuergerNew_01.3DS";
	visual_change 			=	"Armor_BuergerNew_01.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
// ******************************************************
INSTANCE ITAR_BuergerNew_02 (C_Item)
{
	name 					=	"Bürgerkleidung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10000;
	protection [PROT_BLUNT] = 	10000;
	protection [PROT_POINT] = 	10000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_VLK_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"BuergerNew_02.3DS";
	visual_change 			=	"Armor_BuergerNew_02.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
// ******************************************************
INSTANCE ITAR_BuergerinNew_01 (C_Item)
{
	name 					=	"Bürgerinkleidung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10000;
	protection [PROT_BLUNT] = 	10000;
	protection [PROT_POINT] = 	10000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_VLK_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"BuergerinNew_01.3DS";
	visual_change 			=	"Armor_BuergerinNew_01.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
// ******************************************************
instance ITAR_VlkBabe_L (C_Item)
{
	name 					=	"Bürgerin Kleidung 1";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10000;
	protection [PROT_BLUNT] = 	10000;
	protection [PROT_POINT] = 	10000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_VlkBabe_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_VLKBabe.3DS";
	visual_change 			=	"Armor_VlkBabe_L.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;		
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;	
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

instance ITAR_VlkBabe_L_5 (C_Item)
{
	name 					=	"Bürgerin Kleidung 5";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10000;
	protection [PROT_BLUNT] = 	10000;
	protection [PROT_POINT] = 	10000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_VlkBabe_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"Buergerinkleid5.3DS";
	visual_change 			=	"Armor_VlkBabe_L_5.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;		
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;	
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

instance ITAR_VlkBabe_L_7 (C_Item)
{
	name 					=	"Bürgerin Kleidung 7";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10000;
	protection [PROT_BLUNT] = 	10000;
	protection [PROT_POINT] = 	10000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_VlkBabe_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"Buergerinkleid7.3DS";
	visual_change 			=	"Armor_VlkBabe_L_7.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;		
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;	
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

instance ITAR_GrittasKleid (C_Item)
{
	name 					=	"Kleid für Gritta";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	ITEM_SHOW;

	protection [PROT_EDGE]	=	10000;
	protection [PROT_BLUNT] = 	10000;
	protection [PROT_POINT] = 	10000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_VlkBabe_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"Buergerinkleid5.3DS";
	visual_change 			=	"Armor_Gritta.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;		
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;	
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

instance ITAR_Hexe (C_Item)
{
	name 					=	"Hexenrobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40000;
	protection [PROT_BLUNT] = 	40000;
	protection [PROT_POINT] = 	40000;
	protection [PROT_FIRE] 	= 	40;
	protection [PROT_MAGIC] = 	40;

	value 					=	VALUE_ITAR_VlkBabe_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Hexe.3DS";
	visual_change 			=	"Armor_Hexe.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;		
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;	
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

instance ITAR_Hexenqueen (C_Item)
{
	name 					=	"Hexenköniginrobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40000;
	protection [PROT_BLUNT] = 	40000;
	protection [PROT_POINT] = 	40000;
	protection [PROT_FIRE] 	= 	40;
	protection [PROT_MAGIC] = 	40;

	value 					=	VALUE_ITAR_VlkBabe_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Hexenqueen.3DS";
	visual_change 			=	"Armor_Hexenqueen.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;		
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;	
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
// ******************************************************
INSTANCE ITAR_VlkBabe_M (C_Item)
{
	name 					=	"Bürgerin Kleidung 2";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10000;
	protection [PROT_BLUNT] = 	10000;
	protection [PROT_POINT] = 	10000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_VlkBabe_M;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_VLKBabe.3DS";
	visual_change 			=	"Armor_VlkBabe_M.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

INSTANCE ITAR_VlkBabe_M_6 (C_Item)
{
	name 					=	"Bürgerin Kleidung 6";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10000;
	protection [PROT_BLUNT] = 	10000;
	protection [PROT_POINT] = 	10000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_VlkBabe_M;

	wear 					=	WEAR_TORSO;

	visual 					=	"Buergerinkleid6.3DS";
	visual_change 			=	"Armor_VlkBabe_L_6.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
// ******************************************************
INSTANCE ITAR_VlkBabe_H (C_Item)
{
	name 					=	"Bürgerin Kleidung 3";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10000;
	protection [PROT_BLUNT] = 	10000;
	protection [PROT_POINT] = 	10000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_VlkBabe_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_VLKBabe.3DS";
	visual_change 			=	"Armor_VlkBabe_H.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
INSTANCE ITAR_Buergerinkleid8(C_Item)
{
	name 					=	"Bürgerin Kleidung 8";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10000;
	protection [PROT_BLUNT] = 	10000;
	protection [PROT_POINT] = 	10000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_VlkBabe_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"Buergerinkleid8.3DS";
	visual_change 			=	"Armor_Buergerinkleid8.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
// ******************************************************
INSTANCE ITAR_MIL_L (C_Item)
{
	name 					=	"Leichte Milizrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40000;
	protection [PROT_BLUNT] = 	40000;
	protection [PROT_POINT] = 	40000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_MIL_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_MIL_L.3DS";
	visual_change 			=	"Armor_Mil_L.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	
	on_equip				=	Equip_ITAR_MIL_L;
	on_unequip				=	UnEquip_ITAR_MIL_L;
	
	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;	
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
FUNC VOID Equip_ITAR_MIL_L()
{
	if Npc_IsPlayer (self)
	{
		MILArmor_Equipped = TRUE;
		
		if (MIL01_Equipped == TRUE)//Gürtel
		{
			self.protection[PROT_EDGE] 	+= BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] 	+= BA_Bonus01;
		};
	};
};
FUNC VOID UnEquip_ITAR_MIL_L()
{
	if Npc_IsPlayer (self)
	{
		MILArmor_Equipped = FALSE;
		
		if (MIL01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	-= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] 	-= BA_Bonus01;
		};
	};
};
// ******************************************************
INSTANCE ITAR_MIL_M (C_Item)
{
	name 					=	"Schwere Milizrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	70000;
	protection [PROT_BLUNT] = 	70000;
	protection [PROT_POINT] = 	70000;
	protection [PROT_FIRE] 	= 	10;
	protection [PROT_MAGIC] = 	10;

	value 					=	VALUE_ITAR_MIL_M;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_MIL_M.3DS";
	visual_change 			=	"Armor_MIL_M.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	
	on_equip				=	Equip_ITAR_MIL_M;
	on_unequip				=	UnEquip_ITAR_MIL_M;
	
	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
FUNC VOID Equip_ITAR_MIL_M()
{
	if Npc_IsPlayer (self)
	{
		MILArmor_Equipped = TRUE;
		
		if (MIL01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	+= BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] 	+= BA_Bonus01;
		};
	};
};
FUNC VOID UnEquip_ITAR_MIL_M()
{
	if Npc_IsPlayer (self)
	{
		MILArmor_Equipped = FALSE;
		
		if (MIL01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	-= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] 	-= BA_Bonus01;
		};
	};
};
INSTANCE ITAR_Besatzer (C_Item)
{
	name 					=	"???";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	70000;
	protection [PROT_BLUNT] = 	70000;
	protection [PROT_POINT] = 	70000;
	protection [PROT_FIRE] 	= 	10;
	protection [PROT_MAGIC] = 	10;

	value 					=	VALUE_ITAR_MIL_M;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Besatzer.3DS";
	visual_change 			=	"Armor_Besatzer.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	
	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
// ******************************************************
INSTANCE ITAR_PAL_M (C_Item)
{
	name 					=	"Ritterrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	100000;
	protection [PROT_BLUNT] = 	100000;
	protection [PROT_POINT] = 	100000;
	protection [PROT_FIRE] 	= 	50;
	protection [PROT_MAGIC] = 	25;
	
	value 					=	VALUE_ITAR_PAL_M;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Pal_M.3ds";
	visual_change 			=	"Armor_Pal_M.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

INSTANCE ITAR_PAL_Zombie (C_Item)
{
	name 					=	"Ritterrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	100000;
	protection [PROT_BLUNT] = 	100000;
	protection [PROT_POINT] = 	100000;
	protection [PROT_FIRE] 	= 	50;
	protection [PROT_MAGIC] = 	25;
	
	value 					=	VALUE_ITAR_PAL_M;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Pal_M.3ds";
	visual_change 			=	"Armor_Pal_Zombie.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

INSTANCE ITAR_RIT_S (C_Item)
{
	name 					=	"Verbesserte Ritterrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	120000;
	protection [PROT_BLUNT] = 	120000;
	protection [PROT_POINT] = 	120000;
	protection [PROT_FIRE] 	= 	75;
	protection [PROT_MAGIC] = 	35;
	
	value 					=	VALUE_ITAR_PAL_M;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_RitterBesser.3ds";
	visual_change 			=	"Armor_RitterBesser.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

INSTANCE ITAR_PAL_M_2 (C_Item)
{
	name 					=	"Ritterrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	120000;
	protection [PROT_BLUNT] = 	120000;
	protection [PROT_POINT] = 	120000;
	protection [PROT_FIRE] 	= 	75;
	protection [PROT_MAGIC] = 	35;
	
	value 					=	VALUE_ITAR_PAL_M;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_PalRit.3ds";
	visual_change 			=	"Armor_PalRit.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
// ******************************************************
INSTANCE ITAR_PAL_H (C_Item)
{
	name 					=	"Paladinrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	150000;
	protection [PROT_BLUNT] = 	150000;
	protection [PROT_POINT] = 	150000;
	protection [PROT_FIRE] 	= 	100;
	protection [PROT_MAGIC] = 	50;

	value 					=	VALUE_ITAR_PAL_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Pal_H.3ds";
	visual_change 			=	"Armor_Pal_H.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

INSTANCE ITAR_PAL_H_Visier (C_Item)
{
	name 					=	"Paladinrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	150000;
	protection [PROT_BLUNT] = 	150000;
	protection [PROT_POINT] = 	150000;
	protection [PROT_FIRE] 	= 	100;
	protection [PROT_MAGIC] = 	50;

	value 					=	VALUE_ITAR_PAL_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Pal_H.3ds";
	visual_change 			=	"Armor_Palavis.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

INSTANCE ITAR_PAL_Tiger (C_Item)
{
	name 					=	"Weiße Wächterrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	200000;
	protection [PROT_BLUNT] = 	200000;
	protection [PROT_POINT] = 	200000;
	protection [PROT_FIRE] 	= 	120;
	protection [PROT_MAGIC] = 	100;

	value 					=	VALUE_ITAR_PAL_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Pal_Tiger.3ds";
	visual_change 			=	"Armor_Pal_Tiger.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
// ******************************************************
INSTANCE ITAR_BAU_L (C_Item)
{
	name 					=	"Bauernkleidung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	15000;
	protection [PROT_BLUNT] = 	15000;
	protection [PROT_POINT] = 	15000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_BAU_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Bau_L.3DS";
	visual_change 			=	"Armor_Bau_L.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				=	 protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

INSTANCE ITAR_BAU_Reis (C_Item)
{
	name 					=	"Kleidung der Reisbauern";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	15000;
	protection [PROT_BLUNT] = 	15000;
	protection [PROT_POINT] = 	15000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_BAU_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Bau_L.3DS";
	visual_change 			=	"Armor_Bau_L.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				=	 protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
// ******************************************************
INSTANCE ITAR_BAU_M (C_Item)
{
	name 					=	"Bauernkluft";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	15000;
	protection [PROT_BLUNT] = 	15000;
	protection [PROT_POINT] = 	15000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_BAU_M;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Bau_M.3ds";
	visual_change 			=	"Armor_Bau_M.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
// ******************************************************
INSTANCE ITAR_BauBabe_L (C_Item)
{
	name 					=	"Bäuerin Tracht 1";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10000;
	protection [PROT_BLUNT] = 	10000;
	protection [PROT_POINT] = 	10000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_BauBabe_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_VLKBabe.3DS";
	visual_change 			=	"Armor_BauBabe_L.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
// ******************************************************
INSTANCE ITAR_BauBabe_M (C_Item)
{
	name 					=	"Bäuerin Tracht 2" ;

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10000;
	protection [PROT_BLUNT] = 	10000;
	protection [PROT_POINT] = 	10000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_BauBabe_M;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_VLKBabe.3DS";
	visual_change 			=	"Armor_BauBabe_M.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
// ******************************************************
INSTANCE ITAR_SLD_L (C_Item)
{
	name 					=	"Leichte Söldnerrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40000;
	protection [PROT_BLUNT] = 	40000;
	protection [PROT_POINT] = 	40000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_SLD_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Sld_L.3ds";
	visual_change 			=	"Armor_Sld_L.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	
	on_equip				=	Equip_ITAR_SLD_L;
	on_unequip				=	UnEquip_ITAR_SLD_L;
	
	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;		
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;	
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
FUNC VOID Equip_ITAR_SLD_L()
{
	if Npc_IsPlayer (self)
	{
		SLDArmor_Equipped = TRUE;
		
		if (SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	+= BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] 	+= BA_Bonus01;
		};
	};			
};
FUNC VOID UnEquip_ITAR_SLD_L()
{
	if Npc_IsPlayer (self)
	{
		SLDArmor_Equipped = FALSE;
		
		if (SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	-= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] 	-= BA_Bonus01;
		};
	};
};

// ******************************************************
INSTANCE ITAR_SLD_Logan (C_Item)
{
	name 					=	"Leichte Söldnerrüstung von Logan";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40000;
	protection [PROT_BLUNT] = 	40000;
	protection [PROT_POINT] = 	40000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_SLD_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Sld_L.3ds";
	visual_change 			=	"Armor_Sld_L.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	
	
	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;		
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;	
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
// ******************************************************
INSTANCE ITAR_SLD_M (C_Item)
{
	name 					=	"Schwere Söldnerrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	70000;
	protection [PROT_BLUNT] = 	70000;
	protection [PROT_POINT] = 	70000;
	protection [PROT_FIRE] 	= 	10;
	protection [PROT_MAGIC] = 	10;

	value 					=	2500;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Sld_M.3ds";
	visual_change 			=	"Armor_Sld_M.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;
	
	on_equip				=	Equip_ITAR_SLD_M;
	on_unequip				=	UnEquip_ITAR_SLD_M;
	
	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;

	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
FUNC VOID Equip_ITAR_SLD_M()
{
	if Npc_IsPlayer (self)
	{
		SLDArmor_Equipped = TRUE;
		
		if (SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	+= BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] 	+= BA_Bonus01;
		};
	};			
};
FUNC VOID UnEquip_ITAR_SLD_M()
{
	if Npc_IsPlayer (self)
	{
		SLDArmor_Equipped = FALSE;
		
		if (SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	-= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] 	-= BA_Bonus01;
		};
	};			
};
// ******************************************************
INSTANCE ITAR_SLD_H (C_Item)
{
	name 					=	"Orkjägerrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	100000;
	protection [PROT_BLUNT] = 	100000;
	protection [PROT_POINT] = 	100000;
	protection [PROT_FIRE] 	= 	50;
	protection [PROT_MAGIC] = 	25;

	value 					=	VALUE_ITAR_SLD_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_OJG_M.3ds";
	visual_change 			=	"Armor_OJG_M.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;
	
	
	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
FUNC VOID Equip_ITAR_SLD_H()
{
	if Npc_IsPlayer (self)
	{
		SLDArmor_Equipped = TRUE;
		
		if (SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	+= BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] 	+= BA_Bonus01;
		};
	};			
};
FUNC VOID UnEquip_ITAR_SLD_H()
{
	if Npc_IsPlayer (self)
	{
		SLDArmor_Equipped = FALSE;
		
		if (SLD01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	-= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] 	-= BA_Bonus01;
		};
	};			
};

INSTANCE ITAR_Zombie_Orkjaeger (C_Item)
{
	name 					=	"Orkjägerrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	100000;
	protection [PROT_BLUNT] = 	100000;
	protection [PROT_POINT] = 	100000;
	protection [PROT_FIRE] 	= 	50;
	protection [PROT_MAGIC] = 	25;

	value 					=	VALUE_ITAR_SLD_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_OJG_M.3ds";
	visual_change 			=	"Armor_OJG_Zombie.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;
	
	
	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

INSTANCE ITAR_SLD_S (C_Item)
{
	name 					=	"Verbesserte Söldnerrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	85000;
	protection [PROT_BLUNT] = 	85000;
	protection [PROT_POINT] = 	85000;
	protection [PROT_FIRE] 	= 	30;
	protection [PROT_MAGIC] = 	15;

	value 					=	VALUE_ITAR_SLD_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Sld_Besser.3ds";
	visual_change 			=	"Armor_Sld_Besser.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;
	
	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

INSTANCE ITAR_OJG_S (C_Item)
{
	name 					=	"Verbesserte Orkjägerrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	120000;
	protection [PROT_BLUNT] = 	120000;
	protection [PROT_POINT] = 	120000;
	protection [PROT_FIRE] 	= 	75;
	protection [PROT_MAGIC] = 	35;

	value 					=	VALUE_ITAR_SLD_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Soeldner_Besser.3ds";
	visual_change 			=	"Armor_Soeldner_Besser.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;
	
	
	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

INSTANCE ITAR_OJG_S2 (C_Item)
{
	name 					=	"Verbesserte Orkjägerrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	120000;
	protection [PROT_BLUNT] = 	120000;
	protection [PROT_POINT] = 	120000;
	protection [PROT_FIRE] 	= 	75;
	protection [PROT_MAGIC] = 	35;

	value 					=	VALUE_ITAR_SLD_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Orkjaeger_Besser.3ds";
	visual_change 			=	"Armor_Orkjaeger_Besser.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;
	
	
	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

INSTANCE ITAR_SLD_H2 (C_Item)
{
	name 					=	"Sehr schwere Söldnerrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	100000;
	protection [PROT_BLUNT] = 	100000;
	protection [PROT_POINT] = 	100000;
	protection [PROT_FIRE] 	= 	50;
	protection [PROT_MAGIC] = 	25;

	value 					=	VALUE_ITAR_SLD_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Sld_H.3ds";
	visual_change 			=	"Armor_Sld_H.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;
	
	
	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
// ******************************************************
INSTANCE ITAR_DJG_Crawler (C_Item)
{
	name 					=	"Rüstung aus Crawlerplatten";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	150000;
	protection [PROT_BLUNT] = 	150000;
	protection [PROT_POINT] = 	150000;
	protection [PROT_FIRE] 	= 	75;
	protection [PROT_MAGIC] = 	50;

	value 					=	VALUE_ITAR_DJG_Crawler;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Djg_Crawler.3ds";
	visual_change 			=	"Armor_Djg_Crawler.asc";
	material 				=	MAT_LEATHER;
	
	on_equip				=	Equip_ITAR_DJG_Crawler;
	on_unequip				=	UnEquip_ITAR_DJG_Crawler;
	
	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
FUNC VOID Equip_ITAR_DJG_Crawler()
{
	if Npc_IsPlayer (self)
	{
		MCArmor_Equipped = TRUE;
	
		if (MC_Equipped == TRUE)	
		{
			self.protection[PROT_EDGE] 	+= BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] 	+= BA_Bonus01;
		};
	};			
};
FUNC VOID UnEquip_ITAR_DJG_Crawler()
{
	if Npc_IsPlayer (self)
	{
		MCArmor_Equipped = FALSE;
		
		if (MC_Equipped == TRUE)	
		{
			self.protection[PROT_EDGE] 	-= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] 	-= BA_Bonus01;
		};
	};			
};
// ******************************************************
INSTANCE ITAR_DJG_L (C_Item)
{
	name 					=	"Leichte Drachenjägerrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	120000;
	protection [PROT_BLUNT] = 	120000;
	protection [PROT_POINT] = 	120000;
	protection [PROT_FIRE] 	= 	75;
	protection [PROT_MAGIC] = 	35;

	value 					=	VALUE_ITAR_DJG_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Djg_L.3ds";
	visual_change 			=	"Armor_Djg_L.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
// ******************************************************
INSTANCE ITAR_DJG_M (C_Item)
{
	name 					=	"Mittlere Drachenjägerrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	140000;
	protection [PROT_BLUNT]	= 	140000;
	protection [PROT_POINT] = 	140000;
	protection [PROT_FIRE] 	= 	95;
	protection [PROT_MAGIC] = 	45;

	value 					=	VALUE_ITAR_DJG_M;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Djg_M.3ds";
	visual_change 			=	"Armor_Djg_M.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;		
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
// ******************************************************
INSTANCE ITAR_DJG_H (C_Item)
{
	name 					=	"Schwere Drachenjägerrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	160000;
	protection [PROT_BLUNT] = 	160000;
	protection [PROT_POINT] = 	160000;
	protection [PROT_FIRE] 	= 	120;
	protection [PROT_MAGIC] = 	60;

	value 					=	VALUE_ITAR_DJG_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Djg_H.3ds";
	visual_change 			=	"Armor_Djg_H.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

INSTANCE ITAR_Drachentroll (C_Item)
{
	name 					=	"Drachentöterrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	200000;
	protection [PROT_BLUNT] = 	200000;
	protection [PROT_POINT] = 	200000;
	protection [PROT_FIRE] 	= 	150;
	protection [PROT_MAGIC] = 	100;

	value 					=	VALUE_ITAR_DJG_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Djg_Troll.3ds";
	visual_change 			=	"Armor_Drachentroll.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
// ******************************************************
INSTANCE ITAR_DJG_BABE (C_Item)
{
	name 					=	"Rüstung einer Drachenjägerin";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	60000;
	protection [PROT_BLUNT] = 	60000;
	protection [PROT_POINT] = 	60000;
	protection [PROT_FIRE] 	= 	30;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_DJG_BABE;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Djg_L.3DS";
	visual_change 			=	"Armor_Djg_Babe.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
// ******************************************************
INSTANCE ITAR_NOV_L (C_Item)
{
	name 					=	"Feuer Novizenrobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	25000;
	protection [PROT_BLUNT] = 	25000;
	protection [PROT_POINT] = 	25000;
	protection [PROT_FIRE] 	= 	10;
	protection [PROT_MAGIC] = 	10;

	value 					=	VALUE_ITAR_NOV_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Nov_L.3ds";
	visual_change 			=	"Armor_Nov_L.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	
	on_equip				=	Equip_ITAR_NOV_L;
	on_unequip				=	UnEquip_ITAR_NOV_L;
	
	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;		
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
FUNC VOID Equip_ITAR_NOV_L()
{
	if Npc_IsPlayer (self)
	{
		NOVArmor_Equipped = TRUE;
		
		if (NOV01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	+= BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] 	+= BA_Bonus01;
		};
	};
};
FUNC VOID UnEquip_ITAR_NOV_L()
{
	if Npc_IsPlayer (self)
	{
		NOVArmor_Equipped = FALSE;
	
		if (NOV01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	-= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] 	-= BA_Bonus01;
		};
	};
	
};

INSTANCE ITAR_Wassernovize1 (C_Item)
{
	name 					=	"Wasser-Novizenrobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	25000;
	protection [PROT_BLUNT] = 	25000;
	protection [PROT_POINT] = 	25000;
	protection [PROT_FIRE] 	= 	10;
	protection [PROT_MAGIC] = 	10;

	value 					=	VALUE_ITAR_NOV_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Wassernovize_Besser.3ds";
	visual_change 			=	"Armor_Wassernovize_Besser.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	
	on_equip				=	Equip_ITAR_WNOV_L;
	on_unequip				=	UnEquip_ITAR_WNOV_L;
	
	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;		
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

FUNC VOID Equip_ITAR_WNOV_L()
{
	if Npc_IsPlayer (self)
	{
		WNOVArmor_Equipped = TRUE;
		
		if (WNOV01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	+= BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] 	+= BA_Bonus01;
		};
	};
};
FUNC VOID UnEquip_ITAR_WNOV_L()
{
	if Npc_IsPlayer (self)
	{
		WNOVArmor_Equipped = FALSE;
	
		if (WNOV01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	-= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] 	-= BA_Bonus01;
		};
	};
	
};

INSTANCE ITAR_WNOV_S (C_Item)
{
	name 					=	"Verbesserte Wasser Novizenrobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	55000;
	protection [PROT_BLUNT] = 	55000;
	protection [PROT_POINT] = 	55000;
	protection [PROT_FIRE] 	= 	30;
	protection [PROT_MAGIC] = 	40;

	value 					=	VALUE_ITAR_NOV_L+500;

	wear 					=	WEAR_TORSO;

	visual 					=	"Wassernovize1.3ds";
	visual_change 			=	"Armor_Wassernovize1.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	
	
	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;		
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

INSTANCE ITAR_NOV_M (C_Item)
{
	name 					=	"Verbesserte Feuer Novizenrobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	55000;
	protection [PROT_BLUNT] = 	55000;
	protection [PROT_POINT] = 	55000;
	protection [PROT_FIRE] 	= 	30;
	protection [PROT_MAGIC] = 	40;

	value 					=	VALUE_ITAR_NOV_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Nov_M.3ds";
	visual_change 			=	"Armor_Nov_M.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	
	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;		
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
// ******************************************************
INSTANCE ITAR_KDF_F (C_Item)
{
	name 					=	"Feuerrobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	70000;
	protection [PROT_BLUNT] = 	70000;
	protection [PROT_POINT] = 	70000;
	protection [PROT_FIRE] 	= 	70;
	protection [PROT_MAGIC] = 	70;

	value 					=	VALUE_ITAR_KDF_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_KdF_L.3ds";
	visual_change 			=	"KDF_VEL.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	
	on_equip				=	Equip_ITAR_KDF_L;
	on_unequip				=	UnEquip_ITAR_KDF_L;
	
	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
// ******************************************************
INSTANCE ITAR_KDF_L (C_Item)
{
	name 					=	"Feuerrobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	70000;
	protection [PROT_BLUNT] = 	70000;
	protection [PROT_POINT] = 	70000;
	protection [PROT_FIRE] 	= 	70;
	protection [PROT_MAGIC] = 	70;

	value 					=	VALUE_ITAR_KDF_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_KdF_L.3ds";
	visual_change 			=	"Armor_Kdf_L.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	
	on_equip				=	Equip_ITAR_KDF_L;
	on_unequip				=	UnEquip_ITAR_KDF_L;
	
	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
FUNC VOID Equip_ITAR_KDF_L()
{
	Mod_TraegtFeuerkleidung = 1;

	if Npc_IsPlayer (self)
	{
		KDFArmor_Equipped = TRUE;
		
		if (KDF01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	+= BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] 	+= BA_Bonus01;
		};
	};
};
FUNC VOID UnEquip_ITAR_KDF_L()
{
	Mod_TraegtFeuerkleidung = 0;

	if Npc_IsPlayer (self)
	{
		KDFArmor_Equipped = FALSE;
	
		if (KDF01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	-= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] 	-= BA_Bonus01;
		};
	};
};

INSTANCE ITAR_Silberrobe (C_Item)
{
	name 					=	"Heilmagierrobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	50000;
	protection [PROT_BLUNT] = 	50000;
	protection [PROT_POINT] = 	50000;
	protection [PROT_FIRE] 	= 	175;
	protection [PROT_MAGIC] = 	175;

	value 					=	VALUE_ITAR_KDF_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Silberrobe.3ds";
	visual_change 			=	"Hum_Silberrobe.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	
	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

INSTANCE ITAR_Heilrobe_Big (C_Item)
{
	name 					=	"Hohe Heilmagierrobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	50000;
	protection [PROT_BLUNT] = 	50000;
	protection [PROT_POINT] = 	50000;
	protection [PROT_FIRE] 	= 	175;
	protection [PROT_MAGIC] = 	175;

	value 					=	VALUE_ITAR_KDF_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Heilmagier_VeryBig.3ds";
	//visual_change 			=	"Armor_Heilrobe_Big.asc";
	visual_change 			=	"Armor_Heilmagier_VeryBig.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	
	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
// ******************************************************
INSTANCE ITAR_MartiniKdfH_01 (C_Item)
{
	name 					=	"Martinis Feuerrobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	100000;
	protection [PROT_BLUNT] = 	100000;
	protection [PROT_POINT] = 	100000;
	protection [PROT_FIRE] 	= 	250;
	protection [PROT_MAGIC] = 	250;

	value 					=	VALUE_ITAR_KDF_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"MartiniKdfH01.3ds";
	visual_change 			=	"Hum_MartiniKdfH_01.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	
	
	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				=	 protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;

	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

INSTANCE ITAR_KDF_H (C_Item)
{
	name 					=	"Ordenspriesterrobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	100000;
	protection [PROT_BLUNT] = 	100000;
	protection [PROT_POINT] = 	100000;
	protection [PROT_FIRE] 	= 	100;
	protection [PROT_MAGIC] = 	100;

	value 					=	VALUE_ITAR_KDF_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_KdF_H.3ds";
	visual_change 			=	"Armor_Kdf_H.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	
	on_equip				=	Equip_ITAR_KDF_H;
	on_unequip				=	UnEquip_ITAR_KDF_H;
	
	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				=	 protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;

	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
FUNC VOID Equip_ITAR_KDF_H()
{
	Mod_TraegtFeuerkleidung = 1;

	if Npc_IsPlayer (self)
	{
		KDFArmor_Equipped = TRUE;
		
		if (KDF01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	+= BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] 	+= BA_Bonus01;
		};
	};
};
FUNC VOID UnEquip_ITAR_KDF_H()
{
	Mod_TraegtFeuerkleidung = 0;

	if Npc_IsPlayer (self)
	{
		KDFArmor_Equipped = FALSE;
		
		if (KDF01_Equipped == TRUE)
		{	
			self.protection[PROT_EDGE] 	-= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] 	-= BA_Bonus01;
		};
	};
};
// ******************************************************
INSTANCE ITAR_Leather_L (C_Item)
{
	name 					=	"Lederrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	25000;
	protection [PROT_BLUNT] = 	25000;
	protection [PROT_POINT] = 	20000;
	protection [PROT_FIRE] 	= 	 5;
	protection [PROT_MAGIC] = 	 0;

	value 					=	VALUE_ITAR_Leather_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Leather_L.3ds";
	visual_change 			=	"Armor_Leather_L.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	on_equip				=	Equip_ITAR_Leather_L;
	on_unequip				=	UnEquip_ITAR_Leather_L;
	
	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
FUNC VOID Equip_ITAR_Leather_L()
{
	if Npc_IsPlayer (self)
	{
		LeatherArmor_Equipped = TRUE;	
	
		if (Leather01_Equipped == TRUE) //Ledergürtel
		{
			self.protection[PROT_EDGE] 	+= BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] 	+= BA_Bonus01;
		};
	};
};
FUNC VOID UnEquip_ITAR_Leather_L()
{
	if Npc_IsPlayer (self)
	{
		LeatherArmor_Equipped = FALSE;	
	
		if (Leather01_Equipped == TRUE) //Ledergürtel
		{
			self.protection[PROT_EDGE] 	-= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] 	-= BA_Bonus01;
		};
	};
};

INSTANCE Snapperlederrüstung (C_Item)
{
	name 					=	"Rüstung aus Snapperleder";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	50000;
	protection [PROT_BLUNT] = 	50000;
	protection [PROT_POINT] = 	50000;
	protection [PROT_FIRE] 	= 	 50;
	protection [PROT_MAGIC] = 	 0;

	value 					=	VALUE_ITAR_Leather_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Leather_L.3ds";
	visual_change 			=	"Armor_Waldlaeufer_AmPro.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	
	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
// ******************************************************
INSTANCE ITAR_BDT_M (C_Item)
{
	name 					=	"Mittlere Banditenrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40000;
	protection [PROT_BLUNT]	= 	40000;
	protection [PROT_POINT] = 	40000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_BDT_M;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Bdt_M.3ds";
	visual_change 			=	"Armor_Bdt_M.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[0]					= 	PRINT_Addon_BDTArmor;
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;

	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;

	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];

	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
// ******************************************************
INSTANCE ITAR_BDT_H (C_Item)
{
	name 					=	"Schwere Banditenrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	100000;
	protection [PROT_BLUNT] = 	100000;
	protection [PROT_POINT] = 	100000;
	protection [PROT_FIRE] 	= 	45;
	protection [PROT_MAGIC] = 	15;

	value 					=	VALUE_ITAR_BDT_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Bdt_H.3ds";
	visual_change 			=	"Armor_Bdt_H.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;

	TEXT[0]					= 	PRINT_Addon_BDTArmor;
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
// ******************************************************
INSTANCE ITAR_XARDAS (C_Item)
{
	name 					=	"Dämonenbeschwörerrobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	100000;
	protection [PROT_BLUNT] = 	100000;
	protection [PROT_POINT] = 	100000;
	protection [PROT_FIRE] 	= 	100;
	protection [PROT_MAGIC] = 	100;

	value 					=	VALUE_ITAR_XARDAS;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Xardas.3ds";
	visual_change 			=	"Armor_Xardas.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

INSTANCE ITAR_DMB_S (C_Item)
{
	name 					=	"Verbesserte Dämonenbeschwörerrobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	150000;
	protection [PROT_BLUNT] = 	150000;
	protection [PROT_POINT] = 	150000;
	protection [PROT_FIRE] 	= 	150;
	protection [PROT_MAGIC] = 	150;

	value 					=	VALUE_ITAR_XARDAS;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Daemonenbeschwoerer_Besser.3ds";
	visual_change 			=	"Armor_Daemonenbeschwoerer_Besser.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
/******************************************************************************************/
INSTANCE ITAR_LESTER (C_Item)
{
	name 					=	"Lesters Robe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	25000;
	protection [PROT_BLUNT] = 	25000;
	protection [PROT_POINT] = 	25000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_LESTER;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Lester.3ds";
	visual_change 			=	"Armor_Lester.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
/******************************************************************************************/
INSTANCE ITAR_Diego (C_Item)
{
	name 					=	"Diegos Rüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	30000;
	protection [PROT_BLUNT] = 	30000;
	protection [PROT_POINT] = 	30000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_Diego;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Diego.3ds";
	visual_change 			=	"Armor_Diego.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
/******************************************************************************************/
INSTANCE ITAR_Diego2 (C_Item)
{
	name 					=	"Diegos Rüstung 2";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	30000;
	protection [PROT_BLUNT] = 	30000;
	protection [PROT_POINT] = 	30000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_Diego;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Diego2.3ds";
	visual_change 			=	"Armor_Diego2.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
/******************************************************************************************/
INSTANCE ITAR_CorAngar (C_Item)
{
	name 					=	"Cor Angars Rüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	100000;
	protection [PROT_BLUNT] = 	100000;
	protection [PROT_POINT] = 	100000;
	protection [PROT_FIRE] 	= 	50;
	protection [PROT_MAGIC] = 	25;

	value 					=	VALUE_ITAR_CorAngar;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_CorAngar.3ds";
	visual_change 			=	"Armor_CorAngar.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
// ******************************************************
INSTANCE ITAR_Dementor (C_Item)
{
	name 					=	"Dunkler Umhang";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	130000;
	protection [PROT_BLUNT] = 	130000;
	protection [PROT_POINT] = 	130000;
	protection [PROT_FIRE] 	= 	65;
	protection [PROT_MAGIC] = 	65;

	value 					=	VALUE_ITAR_Dementor;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Xardas.3ds";
	visual_change 			=	"Armor_Dementor.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

INSTANCE ITAR_Tarnung (C_Item)
{
	name 					=	"Mantel";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	0;
	protection [PROT_BLUNT] = 	0;
	protection [PROT_POINT] = 	0;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_Dementor;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Xardas.3ds";
	visual_change 			=	"Armor_Dementor.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

INSTANCE ITAR_Tarnung_White (C_Item)
{
	name 					=	"Mantel";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	0;
	protection [PROT_BLUNT] = 	0;
	protection [PROT_POINT] = 	0;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_Dementor;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Xardas.3ds";
	visual_change 			=	"Armor_Dementor_White.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

INSTANCE ITAR_WomanCape (C_Item)
{
	name 					=	"Mantel";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	0;
	protection [PROT_BLUNT] = 	0;
	protection [PROT_POINT] = 	0;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_Dementor;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Xardas.3ds";
	visual_change 			=	"Armor_Dementor.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

INSTANCE Schwarzmagierrobe (C_Item)
{
	name 					=	"Schwarzmagierrobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	70000;
	protection [PROT_BLUNT] = 	70000;
	protection [PROT_POINT] = 	70000;
	protection [PROT_FIRE] 	= 	70;
	protection [PROT_MAGIC] = 	70;

	value 					=	VALUE_ITAR_Dementor;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Schwarzmagierrobe.3ds";
	visual_change 			=	"Armor_Schwarzmagierrobe.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

INSTANCE ITAR_KDS_S (C_Item)
{
	name 					=	"Verbesserte Schwarzmagierrobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	80000;
	protection [PROT_BLUNT] = 	80000;
	protection [PROT_POINT] = 	80000;
	protection [PROT_FIRE] 	= 	80;
	protection [PROT_MAGIC] = 	80;

	value 					=	VALUE_ITAR_Dementor;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Schwarzmagier_Besser.3ds";
	visual_change 			=	"Armor_KDS_V.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
// ******************************************************
INSTANCE ITAR_KDW_H (C_Item)
{
	name 					=	"Richterrobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	100000;
	protection [PROT_BLUNT] = 	100000;
	protection [PROT_POINT] = 	100000;
	protection [PROT_FIRE] 	= 	100;
	protection [PROT_MAGIC] = 	100;

	value 					=	VALUE_ITAR_KDW_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"HUM_KDW_M.3ds";
	visual_change 			=	"Armor_KdW_M.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};

INSTANCE ITAR_KDW_M (C_Item)
{
	name 					=	"Verbesserte Richterrobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	150000;
	protection [PROT_BLUNT] = 	150000;
	protection [PROT_POINT] = 	150000;
	protection [PROT_FIRE] 	= 	150;
	protection [PROT_MAGIC] = 	150;

	value 					=	VALUE_ITAR_KDW_H;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Wassermagier_VeryBig.3ds";
	visual_change 			=	"Armor_Wassermagier_VeryBig.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
// ******************************************************
instance ITAR_Prisoner (C_Item)
{
	name 					=	"Sträflingskleidung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	3000;
	protection [PROT_BLUNT] = 	3000;
	protection [PROT_POINT] = 	0;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	VALUE_ITAR_Prisoner;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Prisoner.3ds";
	visual_change 			=	"Armor_Prisoner.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	
	/*TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];*/
	
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
// ******************************************************
INSTANCE ITAR_RyansPriester (C_Item)
{
	name 					=	"Dämonenbeschwörerrobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10000;
	protection [PROT_BLUNT] = 	10000;
	protection [PROT_POINT] = 	10000;
	protection [PROT_FIRE] 	= 	10;
	protection [PROT_MAGIC] = 	10;

	value 					=	VALUE_ITAR_XARDAS;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Xardas.3ds";
	visual_change 			=	"Armor_Xardas.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	
	TEXT[1]					=	NAME_Prot_Edge;			
	COUNT[1]				= 	protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		
	COUNT[2]				= 	protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			
	COUNT[3]				= 	protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		
	COUNT[4]				= 	protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;			
	COUNT[5]				= 	value;
};
