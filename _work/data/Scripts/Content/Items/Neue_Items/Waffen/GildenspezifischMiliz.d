// Kurzschwert der Miliz

INSTANCE ItMw_Milizschwert (C_Item)
{	
	name 				=	"Schwert der Miliz";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	700;

	damageTotal			= 	70;
	damagetype 			= 	DAM_EDGE;
	range    			=  	95;	
	
	on_equip			=	Equip_1H_03;
	on_unequip			=	UnEquip_1H_03;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	50;
	visual 				=	"DB_ItMw_1h_Sword_Broad_Rep_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_03;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Milizschwert_Geschaerft (C_Item)
{	
	name 				=	"Schwert der Miliz (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	700;

	damageTotal			= 	75;
	damagetype 			= 	DAM_EDGE;
	range    			=  	95;	
	
	on_equip			=	Equip_1H_03;
	on_unequip			=	UnEquip_1H_03;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	50;
	visual 				=	"DB_ItMw_1h_Sword_Broad_Rep_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_03;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};