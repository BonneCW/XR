// Schwert Adanos'

INSTANCE ItMw_AdanosSchwert (C_Item)
{
	name 				=	"Schwert Adanos'";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	2000;

	damageTotal			= 	130;
	damagetype			=	DAM_EDGE;
	range    			=  	100;
	
	on_equip			=	Equip_1H_07;
	on_unequip			=	UnEquip_1H_07;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	120;

	visual 				=	"DB_ItMw_1H_Sword_Broad_Smith_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_07;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_AdanosSchwert_Geschaerft (C_Item)
{
	name 				=	"Schwert Adanos' (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	2000;

	damageTotal			= 	135;
	damagetype			=	DAM_EDGE;
	range    			=  	100;
	
	on_equip			=	Equip_1H_07;
	on_unequip			=	UnEquip_1H_07;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	120;

	visual 				=	"DB_ItMw_1H_Sword_Broad_Smith_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_07;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// Wasserkrieger - Zweihänder

INSTANCE ItMw_XRSchwert_01 (C_Item)
{	
	name 				=	"Klinge Adanos'";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	2600;

	damageTotal			= 	150;
	damagetype 			= 	DAM_EDGE;
	range    			=  	120;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	135;
	visual 				=	"XRSChwert_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_XRSChwert_01_Geschaerft (C_Item)
{	
	name 				=	"Klinge Adanos' (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	2600;

	damageTotal			= 	160;
	damagetype 			= 	DAM_EDGE;
	range    			=  	120;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	135;
	visual 				=	"XRSChwert_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};