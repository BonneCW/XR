// Spitzhacke

INSTANCE ItMw_2H_Axe_L_01 (C_Item) 
{	
	name 				=	"Spitzhacke";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_METAL;

	value 				=	50;

	damageTotal			= 	30;
	damagetype			=	DAM_EDGE;
	range    			=  	60;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	10;
	visual 				=	"ItMw_020_2h_Pickaxe_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_Stahlhacke(C_Item) 
{	
	name 				=	"Stahlhacke";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_METAL;

	value 				=	50;

	damageTotal			= 	30;
	damagetype			=	DAM_EDGE;
	range    			=  	60;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	10;
	visual 				=	"ItMw_020_2h_Pickaxe_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_Zwergenhacke (C_Item) 
{	
	name 				=	"Spitzhacke der Minenzwerge";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE | ITEM_NSPLIT;
	material 			=	MAT_METAL;

	value 				=	50;

	damageTotal			= 	30;
	damagetype			=	DAM_EDGE;
	range    			=  	60;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	10;
	visual 				=	"ItMw_020_2h_Pickaxe_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// Vergoldetes Schwert

INSTANCE ItMw_2H_Eminem_Goldschwert_01 (C_Item)
{
	name 				=	"Vergoldetes Schwert";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;
	material 			=	MAT_METAL;

	value 				=	700;

	damageTotal			= 	95;
	damagetype			=	DAM_EDGE;
	range    			=  	110;
	
	on_equip			=	Equip_2H_02;
	on_unequip			=	UnEquip_2H_02;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	90;

	visual 				=	"ItMw_2H_Eminem_Goldschwert_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_02;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_2H_Eminem_Goldschwert_01_Geschaerft (C_Item)
{
	name 				=	"Vergoldetes Schwert (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;
	material 			=	MAT_METAL;

	value 				=	700;

	damageTotal			= 	105;
	damagetype			=	DAM_EDGE;
	range    			=  	110;
	
	on_equip			=	Equip_2H_02;
	on_unequip			=	UnEquip_2H_02;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	90;

	visual 				=	"ItMw_2H_Eminem_Goldschwert_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_02;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Eminem_Goldschwert_01_Erol (C_Item)
{
	name 				=	"Erols vergoldetes Schwert";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;
	material 			=	MAT_METAL;

	value 				=	700;

	damageTotal			= 	95;
	damagetype			=	DAM_EDGE;
	range    			=  	110;
	
	on_equip			=	Equip_2H_02;
	on_unequip			=	UnEquip_2H_02;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	90;

	visual 				=	"ItMw_2H_Eminem_Goldschwert_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_02;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// Sense

INSTANCE ItMW_Sense_01 (C_Item)
{	
	name 				=	"Sense";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	500;

	damageTotal  		= 	50;
	damagetype 			=	DAM_EDGE;
	range    			=  	130;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	45;	
	
	visual 				=	"ItroX_2H_Scythe.3DS";

	description			= 	name;

	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3]				= NAME_Str_Needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMW_Sense_01_Geschaerft (C_Item)
{	
	name 				=	"Sense (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	500;

	damageTotal  		= 	55;
	damagetype 			=	DAM_EDGE;
	range    			=  	130;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	45;		
	
	visual 				=	"ItroX_2H_Scythe.3DS";

	description			= 	name;

	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3]				= NAME_Str_Needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// Zweihänder

INSTANCE ItMw_Zweihaender (C_Item)
{
	name 				=	"Zweihänder";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;
	material 			=	MAT_METAL;

	value 				=	900;

	damageTotal			= 	80;
	damagetype			=	DAM_EDGE;
	range    			=  	100;
	
	on_equip			=	Equip_2H_03;
	on_unequip			=	UnEquip_2H_03;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	80;

	visual 				=	"DB_ItMw_2H_Sword_Light_Smith_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_03;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Zweihaender_Geschaerft (C_Item)
{
	name 				=	"Zweihänder (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;
	material 			=	MAT_METAL;

	value 				=	900;

	damageTotal			= 	85;
	damagetype			=	DAM_EDGE;
	range    			=  	100;
	
	on_equip			=	Equip_2H_03;
	on_unequip			=	UnEquip_2H_03;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	80;

	visual 				=	"DB_ItMw_2H_Sword_Light_Smith_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_03;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// Sturmbringer

INSTANCE ItMw_Sturmbringer (C_Item)
{	
	name 				=	"Sturmbringer";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	1000;

	damageTotal			= 	95;
	damagetype 			= 	DAM_EDGE;
	range    			=  	110;	
	
	on_equip			=	Equip_2H_05;
	on_unequip			=	UnEquip_2H_05;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	95;
	visual 				=	"DB_ItMw_2H_Sword_Smith_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_05;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Sturmbringer_Geschaerft (C_Item)
{	
	name 				=	"Sturmbringer (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	1000;

	damageTotal			= 	100;
	damagetype 			= 	DAM_EDGE;
	range    			=  	110;
	
	on_equip			=	Equip_2H_05;
	on_unequip			=	UnEquip_2H_05;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	95;
	visual 				=	"DB_ItMw_2H_Sword_Smith_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_05;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// Todbringer

INSTANCE ItMw_Todbringer (C_Item)
{	
	name 				=	"Todbringer";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	1100;

	damageTotal			= 	110;
	damagetype 			= 	DAM_EDGE;
	range    			=  	110;	
	
	on_equip			=	Equip_2H_05;
	on_unequip			=	UnEquip_2H_05;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	112;
	visual 				=	"DB_ItMw_2H_Sword_Smith_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_05;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Todbringer_Geschaerft (C_Item)
{	
	name 				=	"Todbringer (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	1100;

	damageTotal			= 	115;
	damagetype 			= 	DAM_EDGE;
	range    			=  	110;
	
	on_equip			=	Equip_2H_05;
	on_unequip			=	UnEquip_2H_05;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	112;
	visual 				=	"DB_ItMw_2H_Sword_Smith_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_05;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// Schlachtklinge

INSTANCE ItMw_Schlachtklinge (C_Item)
{	
	name 				=	"Schlachtklinge";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	1250;

	damageTotal			= 	125;
	damagetype 			= 	DAM_EDGE;
	range    			=  	120;	
	
	on_equip			=	Equip_2H_06;
	on_unequip			=	UnEquip_2H_06;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	130;
	visual 				=	"DB_ItMw_2H_Sword_Heavy_Smith_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_06;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Schlachtklinge_Geschaerft (C_Item)
{	
	name 				=	"Schlachtklinge (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	1250;

	damageTotal			= 	130;
	damagetype 			= 	DAM_EDGE;
	range    			=  	120;
	
	on_equip			=	Equip_2H_06;
	on_unequip			=	UnEquip_2H_06;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	130;
	visual 				=	"DB_ItMw_2H_Sword_Heavy_Smith_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_06;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// Schwerer Zweihänder

INSTANCE ItMw_HeavyZweihaender (C_Item)
{	
	name 				=	"Schwerer Zweihänder";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	1500;

	damageTotal			= 	145;
	damagetype 			= 	DAM_EDGE;
	range    			=  	120;	
	
	on_equip			=	Equip_2H_06;
	on_unequip			=	UnEquip_2H_06;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	155;
	visual 				=	"DB_ItMw_2H_Sword_Heavy_Smith_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_06;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_HeavyZweihaender_Geschaerft (C_Item)
{	
	name 				=	"Schwerer Zweihänder (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	1500;

	damageTotal			= 	150;
	damagetype 			= 	DAM_EDGE;
	range    			=  	120;	
	
	on_equip			=	Equip_2H_06;
	on_unequip			=	UnEquip_2H_06;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	155;
	visual 				=	"DB_ItMw_2H_Sword_Heavy_Smith_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_06;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};