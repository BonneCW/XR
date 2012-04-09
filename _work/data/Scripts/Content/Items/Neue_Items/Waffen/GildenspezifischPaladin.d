// Paladinschwert

INSTANCE ItMw_Paladinschwert (C_Item)
{	
	name 				=	"Paladinschwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	2700;

	damageTotal  		= 	155;
	damagetype 			=	DAM_EDGE;
	range    			=  	100;	
	
	on_equip			=	Equip_1H_10;
	on_unequip			=	UnEquip_1H_10;	

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	140;
	visual 				=	"DB_Itmw_1H_Sword_Long_Mission.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Paladinschwert_Geschaerft (C_Item)
{	
	name 				=	"Paladinschwert (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	2700;

	damageTotal  		= 	160;
	damagetype 			=	DAM_EDGE;
	range    			=  	100;	
	
	on_equip			=	Equip_1H_10;
	on_unequip			=	UnEquip_1H_10;	

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	140;
	visual 				=	"DB_Itmw_1H_Sword_Long_Mission.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};