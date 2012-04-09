// Ritterschwert

INSTANCE ItMw_Schwert_02 (C_Item)
{
	name 				=	"Ritterschwert";

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

	visual 				=	"Schwert_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_07;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Schwert_02_Geschaerft (C_Item)
{
	name 				=	"Ritterschwert (geschärft)";

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

	visual 				=	"Schwert_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_07;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// Schweres Ritterschwert

INSTANCE ItMw_Schwert_03 (C_Item)
{
	name 				=	"Schweres Ritterschwert";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;
	material 			=	MAT_METAL;

	value 				=	2600;

	damageTotal			= 	150;
	damagetype			=	DAM_EDGE;
	range    			=  	110;
	
	on_equip			=	Equip_2H_07;
	on_unequip			=	UnEquip_2H_07;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	135;

	visual 				=	"DB_ItMw_2H_Sword_Light_Smith_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_07;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Schwert_03_Geschaerft (C_Item)
{
	name 				=	"Schweres Ritterschwert (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;
	material 			=	MAT_METAL;

	value 				=	2600;

	damageTotal			= 	155;
	damagetype			=	DAM_EDGE;
	range    			=  	110;
	
	on_equip			=	Equip_2H_07;
	on_unequip			=	UnEquip_2H_07;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	135;

	visual 				=	"DB_ItMw_2H_Sword_Light_Smith_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_07;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};