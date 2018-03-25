INSTANCE Erzrüstung(C_Item)
{
	name 					=	"Magische Erzrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	= 	80000;
	protection [PROT_BLUNT] = 	80000;
	protection [PROT_POINT] = 	80000;
	protection [PROT_FIRE] 	= 	80;
	protection [PROT_MAGIC] = 	80;

	value 					=	10000;	// weil einzigartig

	wear 					=	WEAR_TORSO;

	visual 					=	"magie.3ds";
	visual_change 			=	"Hum_MAGIE_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;

	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;


};

INSTANCE ORG_ARMOR_H(C_Item)
{
	name 					=	"Kettenrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40000;
	protection [PROT_BLUNT] = 	40000;
	protection [PROT_POINT] = 	5000;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	0;

	value 					=	1200;

	wear 					=	WEAR_TORSO;

	visual 					=	"orgh.3ds";
	visual_change 			=	"Hum_ORGS_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE ItAr_Leather_F (C_Item)
{
	name 					=	"Lederrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40000;
	protection [PROT_BLUNT] = 	40000;
	protection [PROT_POINT] = 	5000;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	0;

	value 					=	1200;

	wear 					=	WEAR_TORSO;

	visual 					=	"orgh.3ds";
	visual_change 			=	"Bab_Armor_Leather.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE ItAr_Echsi_01 (C_Item)
{
	name 					=	"Echsenrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40000;
	protection [PROT_BLUNT] = 	40000;
	protection [PROT_POINT] = 	5000;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	0;

	value 					=	500;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Echsenruestung_01.3ds";
	visual_change 			=	"Armor_Echsenruestung_01.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE ItAr_Echsi_02 (C_Item)
{
	name 					=	"Echsenrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	60000;
	protection [PROT_BLUNT] = 	60000;
	protection [PROT_POINT] = 	10000;
	protection [PROT_FIRE] 	= 	30;
	protection [PROT_MAGIC] = 	10;

	value 					=	1000;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Echsenruestung_02.3ds";
	visual_change 			=	"Armor_Echsenruestung_02.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE ItAr_BDT_XL (C_Item)
{
	name 					=	"robuste Banditenrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	55000;
	protection [PROT_BLUNT] = 	55000;
	protection [PROT_POINT] = 	55000;
	protection [PROT_FIRE] 	= 	50;
	protection [PROT_MAGIC] = 	40;

	value 					=	1200;

	wear 					=	WEAR_TORSO;

	visual 					=	"orgh.3ds";
	visual_change 			=	"Armor_Hum_Dht_Armor_V0.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE ItAr_Hum_Dht2S_Armor (C_Item)
{
	name 					=	"Abenteurerrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40000;
	protection [PROT_BLUNT] = 	40000;
	protection [PROT_POINT] = 	5000;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	0;

	value 					=	1200;

	wear 					=	WEAR_TORSO;

	visual 					=	"orgh.3ds";
	visual_change 			=	"Armor_Hum_Dht2S_Armor.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE ItAr_Gangster (C_Item)
{
	name 					=	"Kostüm";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40000;
	protection [PROT_BLUNT] = 	40000;
	protection [PROT_POINT] = 	5000;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	0;

	value 					=	1200;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Gangster.3ds";
	visual_change 			=	"Armor_Gangster.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	on_equip	= Equip_Gangster;
	on_unequip	= UnEquip_Gangster;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

FUNC VOID Equip_Gangster ()
{
	Mod_PAL_GangsterArmor = 1;
};

FUNC VOID UnEquip_Gangster ()
{
	Mod_PAL_GangsterArmor = 0;
};

INSTANCE Itar_Maxim(C_Item)
{
	name 					=	"Geisterrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	130000;
	protection [PROT_BLUNT] = 	130000;
	protection [PROT_POINT] = 	130000;
	protection [PROT_FIRE] 	= 	170;
	protection [PROT_MAGIC] = 	170;

	value 					=	1200;

	wear 					=	WEAR_TORSO;

	visual 					=	"orgh.3ds";
	visual_change 			=	"Ruestung_Maxim.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	on_equip		=	Equip_ItAr_Maxim;
	on_unequip		=	UnEquip_ItAr_Maxim;

	description				=	name;
	TEXT[0]					=	"Diese Rüstung strahlt eine unheimliche Aura aus";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

FUNC VOID Equip_ItAr_Maxim()
{	
	Npc_ChangeAttribute(self, ATR_MANA_MAX, 30);
};

FUNC VOID UnEquip_ItAr_Maxim()
{	
	Npc_ChangeAttribute(self, ATR_MANA_MAX, -30);
};

INSTANCE Itar_Maxim_Fake (C_Item)
{
	name 					=	"Geisterrüstung";

	mainflag 				=	ITEM_KAT_NONE;
	flags 					=	ITEM_SHOW|ITEM_MISSION;

	protection [PROT_EDGE]	=	130000;
	protection [PROT_BLUNT] = 	130000;
	protection [PROT_POINT] = 	130000;
	protection [PROT_FIRE] 	= 	170;
	protection [PROT_MAGIC] = 	170;

	value 					=	1200;

	wear 					=	WEAR_TORSO;

	visual 					=	"orgh.3ds";
	visual_change 			=	"Ruestung_Maxim.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	TEXT[0]					=	"Diese Rüstung strahlt eine unheimliche Aura aus";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE Itar_Zuben (C_Item)
{
	name 					=	"Zuben's Robe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40000;
	protection [PROT_BLUNT] = 	40000;
	protection [PROT_POINT] = 	5000;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	0;

	value 					=	1200;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Zuben.3ds";
	visual_change 			=	"Armor_Zuben.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE Itar_MaximMaske(C_Item)
{
	name 					=	"Maxims Maske";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40000;
	protection [PROT_BLUNT] = 	40000;
	protection [PROT_POINT] = 	5000;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	0;

	value 					=	1200;

	wear 					=	WEAR_HEAD;

	visual 					=	"schurkenmaske_maxim.3ds";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE ItAr_KingHofstaat(C_Item)
{
	name 					=	"Wams des Königs";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40000;
	protection [PROT_BLUNT] = 	40000;
	protection [PROT_POINT] = 	5000;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	0;

	value 					=	1200;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_KingHofstaat.3ds";
	visual_change 			=	"Armor_KingHofstaat.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE ItAr_GardeInnos(C_Item)
{
	name 					=	"Rüstung der Garde Innos'";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	150000;
	protection [PROT_BLUNT] = 	150000;
	protection [PROT_POINT] = 	150000;
	protection [PROT_FIRE] 	= 	100;
	protection [PROT_MAGIC] = 	100;

	value 					=	1200;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_GardeInnos.3ds";
	visual_change 			=	"Armor_GardeInnos.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE ItAr_Eisgebiet_Miliz(C_Item)
{
	name 					=	"Rüstung der Stadtwache";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	80000;
	protection [PROT_BLUNT] = 	80000;
	protection [PROT_POINT] = 	20000;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	10;

	value 					=	1200;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_SLD_M.3ds";
	visual_change 			=	"Armor_Eisgebiet_Miliz.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE ItAr_Eisgebiet_01(C_Item)
{
	name 					=	"Fellrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	80000;
	protection [PROT_BLUNT] = 	80000;
	protection [PROT_POINT] = 	20000;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	0;

	value 					=	1200;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Eisgebiet_01.3ds";
	visual_change 			=	"Armor_Eisgebiet_01.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE ItAr_Eisgebiet_02(C_Item)
{
	name 					=	"Fellrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	80000;
	protection [PROT_BLUNT] = 	80000;
	protection [PROT_POINT] = 	20000;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	0;

	value 					=	1200;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Eisgebiet_02.3ds";
	visual_change 			=	"Armor_Eisgebiet_02.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE ItAr_Eisgebiet_03(C_Item)
{
	name 					=	"Fellrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	80000;
	protection [PROT_BLUNT] = 	80000;
	protection [PROT_POINT] = 	20000;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	0;

	value 					=	1200;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Eisgebiet_03.3ds";
	visual_change 			=	"Armor_Eisgebiet_03.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE ItAr_Eisgebiet_04(C_Item)
{
	name 					=	"Fellrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	80000;
	protection [PROT_BLUNT] = 	80000;
	protection [PROT_POINT] = 	20000;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	0;

	value 					=	1200;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Eisgebiet_04.3ds";
	visual_change 			=	"Armor_Eisgebiet_04.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE ItAr_UntoterMagier(C_Item)
{
	name 					=	"Verwitterte Feuerrobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	60000;
	protection [PROT_BLUNT] = 	60000;
	protection [PROT_POINT] = 	60000;
	protection [PROT_FIRE] 	= 	30;
	protection [PROT_MAGIC] = 	80;

	value 					=	1200;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_UntoterMagier.3ds";
	visual_change 			=	"Armor_UntoterMagier.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE ItAr_UntoterNovize(C_Item)
{
	name 					=	"Alte Novizenrobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	45000;
	protection [PROT_BLUNT] = 	45000;
	protection [PROT_POINT] = 	45000;
	protection [PROT_FIRE] 	= 	15;
	protection [PROT_MAGIC] = 	60;

	value 					=	1200;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_UntoterNovize.3ds";
	visual_change 			=	"Armor_UntoterNovize.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE ItAr_UntoterKrieger(C_Item)
{
	name 					=	"Alte Kriegerkleidung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	70000;
	protection [PROT_BLUNT] = 	70000;
	protection [PROT_POINT] = 	70000;
	protection [PROT_FIRE] 	= 	40;
	protection [PROT_MAGIC] = 	70;

	value 					=	1200;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_UntoterKrieger.3ds";
	visual_change 			=	"Armor_UntoterKrieger.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE ItAr_Gauner(C_Item)
{
	name 					=	"Gaunerrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	50000;
	protection [PROT_BLUNT] = 	50000;
	protection [PROT_POINT] = 	50000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	10;

	value 					=	1200;

	wear 					=	WEAR_TORSO;

	visual 					=	"DB_Ako_Armor_L.3ds";
	visual_change 			=	"DB_Ako_Armor_M.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE ItAr_Assassine_01(C_Item)
{
	name 					=	"Assassinenrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	100000;
	protection [PROT_BLUNT] = 	100000;
	protection [PROT_POINT] = 	100000;
	protection [PROT_FIRE] 	= 	30;
	protection [PROT_MAGIC] = 	20;

	value 					=	1200;

	wear 					=	WEAR_TORSO;

	visual 					=	"DB_Ako_Armor_L.3ds";
	visual_change 			=	"DB_Ako_Armor_M.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE ItAr_Assassine_02(C_Item)
{
	name 					=	"Assassinenumhang";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	70000;
	protection [PROT_BLUNT] = 	70000;
	protection [PROT_POINT] = 	70000;
	protection [PROT_FIRE] 	= 	30;
	protection [PROT_MAGIC] = 	45;

	value 					=	1200;

	wear 					=	WEAR_TORSO;

	visual 					=	"DB_Ako_Armor_L.3ds";
	visual_change 			=	"DB_Pri_Armor_M.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE ItAr_Eisschamane(C_Item)
{
	name 					=	"Schamanenrobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40000;
	protection [PROT_BLUNT] = 	40000;
	protection [PROT_POINT] = 	5000;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	0;

	value 					=	1200;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Eisschamane.3ds";
	visual_change 			=	"Armor_Eisschamane.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE ITAR_Verwandlungskrieger (C_Item)
{
	name 					=	"Rüstung der Beschützer";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	55000;
	protection [PROT_BLUNT] = 	55000;
	protection [PROT_POINT] = 	55000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	20;

	value 					=	1200;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Verwandlungskrieger.3ds";
	visual_change 			=	"Armor_Verwandlungskrieger.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE KhorataWache_01 (C_Item)
{
	name 					=	"Rüstung der Wachen von Khorata";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40000;
	protection [PROT_BLUNT] = 	40000;
	protection [PROT_POINT] = 	5000;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	0;

	value 					=	1200;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_KhorataWache_01.3ds";
	visual_change 			=	"Armor_KhorataWache_01.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE KhorataWache_02 (C_Item)
{
	name 					=	"Rüstung der Wachen von Khorata";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40000;
	protection [PROT_BLUNT] = 	40000;
	protection [PROT_POINT] = 	5000;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	0;

	value 					=	1200;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_KhorataWache_02.3ds";
	visual_change 			=	"Armor_KhorataWache_02.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE KhorataWache_03 (C_Item)
{
	name 					=	"Rüstung der Wachen von Khorata";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40000;
	protection [PROT_BLUNT] = 	40000;
	protection [PROT_POINT] = 	5000;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	0;

	value 					=	1200;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_KhorataWache_03.3ds";
	visual_change 			=	"Armor_KhorataWache_03.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE KhorataHaendler_01 (C_Item)
{
	name 					=	"Rüstung der Händler von Khorata";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40000;
	protection [PROT_BLUNT] = 	40000;
	protection [PROT_POINT] = 	5000;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	0;

	value 					=	1200;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_KhorataHaendler01.3ds";
	visual_change 			=	"Armor_KhorataHaendler01.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE KhorataMagier_01 (C_Item)
{
	name 					=	"Robe der Gelehrten von Khorata";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	20000;
	protection [PROT_BLUNT] = 	20000;
	protection [PROT_POINT] = 	5000;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	0;

	value 					=	1200;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_KhorataMagier_01.3ds";
	visual_change 			=	"Armor_KhorataMagier01.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE Ritual_Krieger (C_Item)
{
	name 					=	"Blutrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	100000;
	protection [PROT_BLUNT] = 	100000;
	protection [PROT_POINT] = 	150000;
	protection [PROT_FIRE] 	= 	80;
	protection [PROT_MAGIC] = 	60;

	value 					=	1200;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Ritualkrieger.3ds";
	visual_change 			=	"Armor_Ritualkrieger.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE Ritual_Magier (C_Item)
{
	name 					=	"Blutkult-Kutte";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	80000;
	protection [PROT_BLUNT] = 	80000;
	protection [PROT_POINT] = 	100000;
	protection [PROT_FIRE] 	= 	40;
	protection [PROT_MAGIC] = 	80;

	value 					=	1200;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Ritualmagier.3ds";
	visual_change 			=	"Armor_Ritualmagier.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE SLD_ARMOR_L(C_Item)
{
	name 					=	"sehr leichte Söldnerrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	20000;
	protection [PROT_BLUNT]	= 	20000;
	protection [PROT_POINT] = 	20000;
	protection [PROT_FIRE] 	=	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	100;

	wear 					=	WEAR_TORSO;

	visual 					=	"sldl.3ds";
	visual_change 			=	"Hum_SLDL_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE ITAR_FAKE_NOV_L (C_Item)
{
	name 					=	"Gefälschte Feuer Novizenrobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10000;
	protection [PROT_BLUNT] = 	10000;
	protection [PROT_POINT] = 	5000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;
	protection [PROT_BARRIER] =	9999999;

	value 					=	0;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Nov_L.3ds";
	visual_change 			=	"Armor_Nov_L.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	
	on_equip	=	Equip_FAKE_Nov_L;
	on_unequip	=	UnEquip_FAKE_Nov_L;

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

FUNC VOID Equip_FAKE_NOV_L()
{
	Mod_TraegtFeuerkleidung = 1;
};

FUNC VOID UnEquip_FAKE_NOV_L()
{
	Mod_TraegtFeuerkleidung = 0;
};

INSTANCE ITAR_BDT_M_01 (C_Item)
{
	name 					=	"Mittlere Banditenrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	35000;
	protection [PROT_BLUNT]	= 	35000;
	protection [PROT_POINT] = 	35000;
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

INSTANCE ITAR_BDT_L_01 (C_Item)
{
	name 					=	"Mittlere Banditenrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	15000;
	protection [PROT_BLUNT]	= 	15000;
	protection [PROT_POINT] = 	15000;
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
INSTANCE ITAR_BDT_H_01 (C_Item)
{
	name 					=	"Schwere Banditenrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	90000;
	protection [PROT_BLUNT] = 	90000;
	protection [PROT_POINT] = 	90000;
	protection [PROT_FIRE] 	= 	40;
	protection [PROT_MAGIC] = 	10;

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

INSTANCE ITAR_KDF_L_Feuer (C_Item)
{
	name 					=	"Verbesserte Feuerrobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	80000;
	protection [PROT_BLUNT] = 	80000;
	protection [PROT_POINT] = 	80000;
	protection [PROT_FIRE] 	= 	80;
	protection [PROT_MAGIC] = 	80;

	value 					=	VALUE_ITAR_KDF_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"ITAR_KDF_L_FEUER.3ds";
	visual_change 			=	"Armor_Kdf_L_Feuer.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	
	on_equip	=	Equip_KDF_L_Feuer;
	on_unequip	=	UnEquip_KDF_L_Feuer;

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

FUNC VOID Equip_KDF_L_Feuer()
{
	Mod_TraegtFeuerkleidung = 1;
};

FUNC VOID UnEquip_KDF_L_Feuer()
{
	Mod_TraegtFeuerkleidung = 0;
};

INSTANCE ITAR_NOV_DMB_01 (C_Item)
{
	name 					=	"Schwarze Novizenrobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	25000;
	protection [PROT_BLUNT] = 	25000;
	protection [PROT_POINT] = 	25000;
	protection [PROT_FIRE] 	= 	10;
	protection [PROT_MAGIC] = 	10;

	value 					=	VALUE_ITAR_NOV_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"HUM_DMBNOV_02.3ds";
	visual_change 			=	"Armor_DMBNOV_01.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	
	on_equip				=	Equip_ITAR_SNOV_L;
	on_unequip				=	UnEquip_ITAR_SNOV_L;
	
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

FUNC VOID Equip_ITAR_SNOV_L()
{
	if Npc_IsPlayer (self)
	{
		SNOVArmor_Equipped = TRUE;
		
		if (SNOV01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	+= BA_Bonus01;
			self.protection[PROT_BLUNT] += BA_Bonus01;
			self.protection[PROT_POINT] += BA_Bonus01;
			self.protection[PROT_MAGIC] += BA_Bonus01;
			self.protection[PROT_FIRE] 	+= BA_Bonus01;
		};
	};
};
FUNC VOID UnEquip_ITAR_SNOV_L()
{
	if Npc_IsPlayer (self)
	{
		SNOVArmor_Equipped = FALSE;
	
		if (SNOV01_Equipped == TRUE)
		{
			self.protection[PROT_EDGE] 	-= BA_Bonus01;
			self.protection[PROT_BLUNT] -= BA_Bonus01;
			self.protection[PROT_POINT] -= BA_Bonus01;
			self.protection[PROT_MAGIC] -= BA_Bonus01;
			self.protection[PROT_FIRE] 	-= BA_Bonus01;
		};
	};
	
};

INSTANCE ITAR_SNOV_S (C_Item)
{
	name 					=	"Verbesserte schwarze Novizenrobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	55000;
	protection [PROT_BLUNT] = 	55000;
	protection [PROT_POINT] = 	55000;
	protection [PROT_FIRE] 	= 	30;
	protection [PROT_MAGIC] = 	40;

	value 					=	VALUE_ITAR_NOV_L;

	wear 					=	WEAR_TORSO;

	visual 					=	"Itar_SchwarzerNovize_Besser.3ds";
	visual_change 			=	"Armor_SchwarzerNovize_Besser.asc";
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

INSTANCE ITAR_MIL_s2 (C_Item)
{
	name 					=	"Verbesserte Milizrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	85000;
	protection [PROT_BLUNT] = 	85000;
	protection [PROT_POINT] = 	85000;
	protection [PROT_FIRE] 	= 	35;
	protection [PROT_MAGIC] = 	15;

	value 					=	500;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_MIL_S2.3DS";
	visual_change 			=	"Armor_MIL_s2.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;
	
	on_equip				=	Equip_ITAR_MIL_S2;
	on_unequip				=	UnEquip_ITAR_MIL_S2;
		
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
FUNC VOID Equip_ITAR_MIL_S2()
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
FUNC VOID UnEquip_ITAR_MIL_S2()
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

INSTANCE ITAR_Schattenläufer (C_Item)
{
	name 					=	"Schattenläuferfellrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	25000;
	protection [PROT_BLUNT] = 	25000;
	protection [PROT_POINT] = 	20000;
	protection [PROT_FIRE] 	= 	 5;
	protection [PROT_MAGIC] = 	 0;

	value 					=	1000;

	wear 					=	WEAR_TORSO;

	visual 					=	"ITAR_Leather_Shadowbeast.3ds";
	visual_change 			=	"Armor_Shadowbeast.asc";
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

INSTANCE ITAR_Sumpfkraut (C_Item)
{
	name 					=	"Sumpfkrautrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	35000;
	protection [PROT_BLUNT] = 	35000;
	protection [PROT_POINT] = 	35000;
	protection [PROT_FIRE] 	= 	 5;
	protection [PROT_MAGIC] = 	 10;

	value 					=	1000;

	wear 					=	WEAR_TORSO;

	visual 					=	"ITAR_Sumpfkrautruestung.3ds";
	visual_change 			=	"Armor_Sumpfkrautruestung.asc";
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

INSTANCE ITAR_Schaf (C_Item)
{
	name 					=	"Schaffellrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	25000;
	protection [PROT_BLUNT] = 	25000;
	protection [PROT_POINT] = 	20000;
	protection [PROT_FIRE] 	= 	 5;
	protection [PROT_MAGIC] = 	 0;

	value 					=	1000;

	wear 					=	WEAR_TORSO;

	visual 					=	"ITAR_Leather_Sheep.3ds";
	visual_change 			=	"Armor_Schaf.asc";
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

INSTANCE ITAR_SNOV_L (C_Item)
{
	name 					=	"Schwarze Novizenrobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	25000;
	protection [PROT_BLUNT] = 	25000;
	protection [PROT_POINT] = 	25000;
	protection [PROT_FIRE] 	= 	10;
	protection [PROT_MAGIC] = 	10;

	value 					=	100;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Nov_L.3ds";
	visual_change 			=	"Armor_SMN.asc";
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

INSTANCE ITAR_KDF_VeryHigh (C_Item)
{
	name 					=	"Hohe Ordenspriesterrobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	150000;
	protection [PROT_BLUNT] = 	150000;
	protection [PROT_POINT] = 	150000;
	protection [PROT_FIRE] 	= 	150;
	protection [PROT_MAGIC] = 	150;

	value 					=	5000;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_KDF_VeryHigh.3ds";
	visual_change 			=	"Armor_KDF_VeryHigh.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	on_equip	=	Equip_KDF_VH;
	on_unequip	=	UnEquip_KDF_VH;

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

FUNC VOID Equip_KDF_VH()
{
	Mod_TraegtFeuerkleidung = 1;
};

FUNC VOID UnEquip_KDF_VH()
{
	Mod_TraegtFeuerkleidung = 0;
};

INSTANCE ITAR_DruideWaldmagier (C_Item)
{
	name 					=	"Druidenrobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	100000;
	protection [PROT_BLUNT] = 	100000;
	protection [PROT_POINT] = 	100000;
	protection [PROT_FIRE] 	= 	250;
	protection [PROT_MAGIC] = 	250;

	value 					=	10;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_DruideWaldmagier.3ds";
	visual_change 			=	"Armor_DruideWaldmagier.asc";
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

INSTANCE ITAR_Naturmagier2 (C_Item)
{
	name 					=	"Verwandlungsmagierrobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	45000;
	protection [PROT_BLUNT] = 	45000;
	protection [PROT_POINT] = 	45000;
	protection [PROT_FIRE] 	= 	20;
	protection [PROT_MAGIC] = 	30;

	value 					=	10;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Naturmagier2.3ds";
	visual_change 			=	"Armor_Naturmagier2.asc";
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

INSTANCE ITAR_Waldlaeufer_01 (C_Item)
{
	name 					=	"Waldläuferrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	90000;
	protection [PROT_BLUNT] = 	90000;
	protection [PROT_POINT] = 	90000;
	protection [PROT_FIRE] 	= 	40;
	protection [PROT_MAGIC] = 	35;

	value 					=	1000;

	wear 					=	WEAR_TORSO;

	visual 					=	"ITAR_Waldlaeufer2.3ds";
	visual_change 			=	"Armor_Waldlaeufer.asc";
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

INSTANCE ITAR_Lurker (C_Item)
{
	name 					=	"Rüstung aus gehärteter Lurkerhaut";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	150000;
	protection [PROT_BLUNT] = 	150000;
	protection [PROT_POINT] = 	150000;
	protection [PROT_FIRE] 	= 	75;
	protection [PROT_MAGIC] = 	50;

	value 					=	500;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Lurker.3ds";
	visual_change 			=	"Armor_Lurker.asc";
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

INSTANCE ITAR_Swampshark (C_Item)
{
	name 					=	"Rüstung aus gehärteter Sumpfhaihaut";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	150000;
	protection [PROT_BLUNT] = 	150000;
	protection [PROT_POINT] = 	150000;
	protection [PROT_FIRE] 	= 	75;
	protection [PROT_MAGIC] = 	50;

	value 					=	500;

	wear 					=	WEAR_TORSO;

	visual 					=	"ITAR_SUMPFHAI.3ds";
	visual_change 			=	"Armor_Sumpfhai.asc";
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

INSTANCE ITAR_Naturmagier (C_Item)
{
	name 					=	"Hohe Naturmagierrobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	100000;
	protection [PROT_BLUNT] = 	100000;
	protection [PROT_POINT] = 	100000;
	protection [PROT_FIRE] 	= 	250;
	protection [PROT_MAGIC] = 	250;

	value 					=	2000;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Naturmagier.3ds";
	visual_change 			=	"Armor_Naturmagier.asc";
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

INSTANCE SSLD_ARMOR(C_Item) // standart SOLDAT Uniform
{
	name 					=	"Königliche Garderüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	75000;
	protection [PROT_BLUNT] = 	75000;
	protection [PROT_POINT] = 	75000;
	protection [PROT_FIRE] 	= 	25;
	protection [PROT_MAGIC] = 	10;

	value 					=	1000;

	wear 					=	WEAR_TORSO;
	visual 					=	"grdi.3ds";
	visual_change 			=	"Hum_GRDI_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE ItAr_KG_01 (C_Item) // standart SOLDAT Uniform
{
	name 					=	"Leichte königliche Garderüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	55000;
	protection [PROT_BLUNT] = 	55000;
	protection [PROT_POINT] = 	5000;
	protection [PROT_FIRE] 	= 	5;
	protection [PROT_MAGIC] = 	5;

	value 					=	500;

	wear 					=	WEAR_TORSO;
	visual 					=	"grdi2.3ds";
	visual_change 			=	"Armor_GRDI2.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE NOV_ARMOR_H(C_Item)
{
	name 					=	"Sumpf-Novizenrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	15000;
	protection [PROT_BLUNT] = 	15000;
	protection [PROT_POINT] = 	15000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	250;

	wear 					=	WEAR_TORSO;

	visual 					=	"novh.3ds";
	visual_change 			=	"Hum_NOVS_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE NOV_ARMOR_M(C_Item)
{
	name 					=	"Leichte Sumpf-Novizenrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10000;
	protection [PROT_BLUNT] = 	10000;
	protection [PROT_POINT] = 	10000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;
	wear 					=	WEAR_TORSO;

	value 					=	150;

 
	visual 					=	"novm.3ds";
	visual_change 			=	"Hum_NOVM_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE NOV_ARMOR_L(C_Item)
{
	name 					=	"Sumpf-Novizenrock";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=  5000;
	protection [PROT_BLUNT] = 	5000;
	protection [PROT_POINT] = 	5000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	75;

	wear 					=	WEAR_TORSO;

	visual 					=	"novl.3ds";
	visual_change 			=	"Hum_NOVL_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE ItAr_ZombieNovize (C_Item)
{
	name 					=	"Sumpf-Novizenrock";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=   0;
	protection [PROT_BLUNT] = 	0;
	protection [PROT_POINT] = 	0;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	1000;

	wear 					=	WEAR_TORSO;

	visual 					=	"novl.3ds";
	visual_change 			=	"Armor_Zombienovize.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE TPL_ARMOR_L(C_Item)
{
	name 					=	"Leichte Templerrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	55000;
	protection [PROT_BLUNT] = 	55000;
	protection [PROT_POINT] = 	55000;
	protection [PROT_FIRE] 	= 	5;
	protection [PROT_MAGIC] = 	5;

	value 					=	1000;

	wear 					=	WEAR_TORSO;

	visual 					=	"tpll.3ds";
	visual_change 			=	"Hum_TPLL_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE Itar_ZombieTempler (C_Item)
{
	name 					=	"Leichte Templerrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	0;
	protection [PROT_BLUNT] = 	0;
	protection [PROT_POINT] = 	0;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	3000;

	wear 					=	WEAR_TORSO;

	visual 					=	"tpll.3ds";
	visual_change 			=	"Armor_Zombietempler.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE TPL_ARMOR_M(C_Item)
{
	name 					=	"Templerrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	80000;
	protection [PROT_BLUNT] = 	80000;
	protection [PROT_POINT] = 	55000;
	protection [PROT_FIRE] 	= 	10;
	protection [PROT_MAGIC] = 	25;

	value 					=	2000;

	wear 					=	WEAR_TORSO;

	visual 					=	"tplm.3ds";
	visual_change 			=	"Hum_TPLM_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE TPL_ARMOR_H(C_Item)
{
	name 					=	"Schwere Templerrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	100000;
	protection [PROT_BLUNT] = 	100000;
	protection [PROT_POINT] = 	100000;
	protection [PROT_FIRE] 	= 	45;
	protection [PROT_MAGIC] = 	20;

	value 					=	3000;

	wear 					=	WEAR_TORSO;

	visual 					=	"tplh.3ds";
	visual_change 			=	"Hum_TPLS_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItAr_Zombie_Templer (C_Item)
{
	name 					=	"Templerrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	40000;
	protection [PROT_BLUNT] = 	40000;
	protection [PROT_POINT] = 	40000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	4000;

	wear 					=	WEAR_TORSO;

	visual 					=	"tplm.3ds";
	visual_change 			=	"Armor_Zombie_Templer.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ITAR_TemplerFanatiker(C_Item)
{
	name 					=	"Templerfanatikerrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	75000;
	protection [PROT_BLUNT] = 	75000;
	protection [PROT_POINT] = 	75000;
	protection [PROT_FIRE] 	= 	25;
	protection [PROT_MAGIC] = 	10;

	value 					=	5000;

	wear 					=	WEAR_TORSO;

	visual 					=	"Itar_TemplerFanatiker.3ds";
	visual_change 			=	"Armor_TemplerFanatiker.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ITAR_NovizeFanatiker(C_Item)
{
	name 					=	"Novizenfanatikerrobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	75000;
	protection [PROT_BLUNT] = 	75000;
	protection [PROT_POINT] = 	75000;
	protection [PROT_FIRE] 	= 	25;
	protection [PROT_MAGIC] = 	10;

	value 					=	5000;

	wear 					=	WEAR_TORSO;

	visual 					=	"Itar_NovizeFanatiker.3ds";
	visual_change 			=	"Armor_NovizeFanatiker.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ITAR_GuruFanatiker(C_Item)
{
	name 					=	"Gurufanatikerrobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	75000;
	protection [PROT_BLUNT] = 	75000;
	protection [PROT_POINT] = 	75000;
	protection [PROT_FIRE] 	= 	25;
	protection [PROT_MAGIC] = 	10;

	value 					=	5000;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_GuruFanatiker.3ds";
	visual_change 			=	"Armor_GuruFanatiker.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ITAR_Kolam(C_Item)
{
	name 					=	"Kolams Robe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	75000;
	protection [PROT_BLUNT] = 	75000;
	protection [PROT_POINT] = 	75000;
	protection [PROT_FIRE] 	= 	25;
	protection [PROT_MAGIC] = 	10;

	value 					=	5000;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Kolam.3ds";
	visual_change 			=	"Armor_Kolam.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
// Gurus

INSTANCE GUR_ARMOR_M(C_Item)
{
	name 					=	"Gururobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	35000;
	protection [PROT_BLUNT] = 	35000;
	protection [PROT_POINT] = 	35000;
	protection [PROT_FIRE] 	= 	15;
	protection [PROT_MAGIC] = 	15;

	value 					=	2000;

	wear 					=	WEAR_TORSO;

	visual 					=	"gurm.3ds";
	visual_change 			=	"Hum_GURM_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE ItAr_LariusRobe(C_Item)
{
	name 					=	"Larius' Robe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	50000;
	protection [PROT_BLUNT] = 	50000;
	protection [PROT_POINT] = 	50000;
	protection [PROT_FIRE] 	= 	175;
	protection [PROT_MAGIC] = 	175;

	value 					=	5000;

	wear 					=	WEAR_TORSO;

	visual 					=	"gurm.3ds";
	visual_change 			=	"Hum_GURM_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE GUR_ARMOR_H(C_Item)
{
	name 					=	"Hohe Gururobe";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	70000;
	protection [PROT_BLUNT] = 	70000;
	protection [PROT_POINT] = 	70000;
	protection [PROT_FIRE] 	= 	70;
	protection [PROT_MAGIC] = 	70;
	wear 					=	WEAR_TORSO;

 	value 					=	3000;

	visual 					=	"gurh.3ds";
	visual_change 			=	"Hum_GURS_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

/******************************************************************************************/
INSTANCE ItAr_GewandDerMacht (C_Item)
{
	name 					=	"Gewand der Macht";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	ITEM_SHOW;

	protection [PROT_EDGE] 	=	70000;
	protection [PROT_BLUNT] = 	70000;
	protection [PROT_POINT] = 	70000;
	protection [PROT_FIRE] 	= 	70;
	protection [PROT_MAGIC] = 	70;
	wear 					=	WEAR_TORSO;

 	value 					=	3000;

	visual 					=	"ItAr_GewandDerMacht.3ds";
	visual_change 			=	"Armor_GewandDerMacht.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE VLK_ARMOR_L(C_Item)
{
	name 					=	"Leichte Buddlerhose";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10000;
	protection [PROT_BLUNT] = 	10000;
	protection [PROT_POINT] = 	0;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	100;

	wear 					=	WEAR_TORSO;
 
	visual 					=	"vlkl.3ds";
	visual_change 			=	"Hum_VLKL_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE VLK_ARMOR_M(C_Item)
{
	name 					=	"Buddlerhose";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	15000;
	protection [PROT_BLUNT] = 	15000;
	protection [PROT_POINT] =   5000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	200;

	wear 					=	WEAR_TORSO;

	visual 					=	"vlkm.3ds";
	visual_change 			=	"Hum_VLKM_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE STT_ARMOR_M(C_Item)
{
	name 					=	"Schattenkluft";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	30000;
	protection [PROT_BLUNT] = 	30000;
	protection [PROT_POINT] = 	15000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	value 					=	250;

	wear 					=	WEAR_TORSO;

	visual 					=	"sttm.3ds";
	visual_change 			=	"Hum_STTM_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE STT_ARMOR_H(C_Item)
{
	name 					=	"Schattenrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	50000;
	protection [PROT_BLUNT] = 	50000;
	protection [PROT_POINT] = 	25000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	5;

	value 					=	500;

	wear 					=	WEAR_TORSO;

	visual 					=	"stth.3ds";
	visual_change 			=	"Hum_STTS_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE ItAr_STT_Mordrag (C_Item)
{
	name 					=	"Schattenrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	50000;
	protection [PROT_BLUNT] = 	50000;
	protection [PROT_POINT] = 	25000;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	5;

	value 					=	750;

	wear 					=	WEAR_TORSO;

	visual 					=	"stth.3ds";
	visual_change 			=	"Hum_STTS_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
	on_equip = Equip_STT_Mordrag;
	on_unequip = UnEquip_STT_Mordrag;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

FUNC VOID Equip_STT_Mordrag ()
{
	Mod_SLD_STT_Mordrag = 1;
};

FUNC VOID UnEquip_STT_Mordrag ()
{
	Mod_SLD_STT_Mordrag = 0;
};

INSTANCE GRD_ARMOR_L(C_Item)
{
	name 					=	"Leichte Garderüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	55000;
	protection [PROT_BLUNT] = 	55000;
	protection [PROT_POINT] = 	55000;
	protection [PROT_FIRE] 	= 	5;
	protection [PROT_MAGIC] = 	5;

	value 					=	800;

	wear 					=	WEAR_TORSO;

	visual 					=	"grdl.3ds";
	visual_change 			=	"Hum_GRDL_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE ITAR_SMK_L(C_Item)
{
	name 					=	"Schwarze Kriegerrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	100000;
	protection [PROT_BLUNT] = 	100000;
	protection [PROT_POINT] = 	100000;
	protection [PROT_FIRE] 	= 	50;
	protection [PROT_MAGIC] = 	25;

	value 					=	1000;

	wear 					=	WEAR_TORSO;

	visual 					=	"Blackknight1.3ds";
	visual_change 			=	"Armor_BlackKnight1.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE ITAR_SKR_s(C_Item)
{
	name 					=	"Verbesserte schwarze Kriegerrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	120000;
	protection [PROT_BLUNT] = 	120000;
	protection [PROT_POINT] = 	120000;
	protection [PROT_FIRE] 	= 	75;
	protection [PROT_MAGIC] = 	35;

	value 					=	3000;

	wear 					=	WEAR_TORSO;

	visual 					=	"Itar_SchwarzerKrieger_Besser.3ds";
	visual_change 			=	"Armor_SchwarzerKrieger_Besser.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE GRD_ARMOR_M(C_Item)
{
	name 					=	"Garderüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	65000;
	protection [PROT_BLUNT] = 	65000;
	protection [PROT_POINT] = 	65000;
	protection [PROT_FIRE] 	= 	10;
	protection [PROT_MAGIC] = 	10;

	value 					=	1000;

	wear 					=	WEAR_TORSO;

	visual 					=	"grdm.3ds";
	visual_change 			=	"Hum_GRDM_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE GRD_ARMOR_H(C_Item)
{
	name 					=	"Schwere Garderüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE] 	=	100000;
	protection [PROT_BLUNT] = 	100000;
	protection [PROT_POINT] = 	70000;
	protection [PROT_FIRE] 	= 	5;
	protection [PROT_MAGIC] = 	20;

	value 					=	2000;

	wear 					=	WEAR_TORSO;
 
	visual 					=	"grdh.3ds";
	visual_change 			=	"Hum_GRDS_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE EBR_ARMOR_M(C_Item)
{
	name 					=	"Prunkgewand";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	110000;
	protection [PROT_BLUNT] = 	110000;
	protection [PROT_POINT] = 	75000;
	protection [PROT_FIRE] 	= 	10;
	protection [PROT_MAGIC] = 	20;

	value 					=	protection [PROT_EDGE] * 20;

	wear 					=	WEAR_TORSO;

	visual 					=	"ebrm.3ds";
	visual_change 			=	"Hum_EBRM_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE EBR_ARMOR_H2(C_Item)
{
	name 					=	"Schwere Erzbaronrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	110000;
	protection [PROT_BLUNT] = 	110000;
	protection [PROT_POINT] = 	100000;
	protection [PROT_FIRE] 	= 	70;
	protection [PROT_MAGIC] = 	30;

	value 					=	2500;

	wear 					=	WEAR_TORSO;

	visual 					=	"ebrh2.3ds";
	visual_change 			=	"Hum_EBRS_ARMOR2.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE ItAr_Nordmann(C_Item)
{
	name 					=	"Nordmannrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	80000;
	protection [PROT_BLUNT] = 	80000;
	protection [PROT_POINT] = 	80000;
	protection [PROT_FIRE] 	= 	40;
	protection [PROT_MAGIC] = 	3;

	value 					=	1000;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_NordmannRuestung.3ds";
	visual_change 			=	"Armor_NordmannRuestung.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE ItAr_Nordmann02(C_Item)
{
	name 					=	"Nordmannrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	80000;
	protection [PROT_BLUNT] = 	80000;
	protection [PROT_POINT] = 	80000;
	protection [PROT_FIRE] 	= 	40;
	protection [PROT_MAGIC] = 	3;

	value 					=	1000;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_Nordmann.3ds";
	visual_change 			=	"Armor_Nordmann.asc";
	visual_skin 			=	0;
	material 				=	MAT_METAL;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

instance SFB_ARMOR_L(C_Item)
{
	name 					=	"Schürferklamotten";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	10000;
	protection [PROT_BLUNT] = 	10000;
	protection [PROT_POINT] = 	0;
	protection [PROT_FIRE] 	= 	5;
	protection [PROT_MAGIC] = 	0;

	value 					=	75;

	wear 					=	WEAR_TORSO;

	visual 					=	"sfbl.3ds";
	visual_change 			=	"Hum_SFBL_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;

	description				=	name;
	//TEXT[0]				=	"";
	TEXT[1]					=	NAME_Prot_Edge;			COUNT[1]	= protection	[PROT_EDGE]/1000;
	TEXT[2]					=	NAME_Prot_Point;		COUNT[2]	= protection	[PROT_POINT]/1000;
	TEXT[3] 				=	NAME_Prot_Fire;			COUNT[3]	= protection	[PROT_FIRE];
	TEXT[4]					=	NAME_Prot_Magic;		COUNT[4]	= protection	[PROT_MAGIC];
	TEXT[5]					=	NAME_Value;				COUNT[5]	= value;
};

INSTANCE ITAR_Erzbaron_Blau (C_Item)
{
	name 					=	"Königliche Erzfürstenrüstung";

	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;

	protection [PROT_EDGE]	=	100000;
	protection [PROT_BLUNT] = 	100000;
	protection [PROT_POINT] = 	100000;
	protection [PROT_FIRE] 	= 	50;
	protection [PROT_MAGIC] = 	40;

	value 					=	1500;

	wear 					=	WEAR_TORSO;

	visual 					=	"ItAr_CHAOS_Blau.3ds";
	visual_change 			=	"Armor_CHAOS_Blau.asc";
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

/*******************************************************************************************
**	Nackte Babes
*******************************************************************************************/
INSTANCE BAB_ARMOR_NUDE (C_Item)
{
	name 					=	"Nacktes Babe";
	mainflag 				=	ITEM_KAT_ARMOR;
	flags 					=	0;
	value 					=	1;

	protection [PROT_EDGE] 	= 	0;
	protection [PROT_BLUNT] = 	0;
	protection [PROT_POINT] = 	0;
	protection [PROT_FIRE] 	= 	0;
	protection [PROT_MAGIC] = 	0;

	wear 					=	WEAR_TORSO;

	visual 					=	"vobbox.3ds";
	visual_change 			=	"Bab_ARMOR.asc";
	visual_skin 			=	0;
	material 				=	MAT_LEATHER;
};