INSTANCE ItMw_Geisterschwert (C_Item) 
{	
	name 				=	"Geisterschwert";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	2000;

	damageTotal			= 	0;
	damagetype			=	DAM_EDGE;
	range    			=  	120;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	0;
	visual 				=	"Geisterschwert.3DS";

	description			= name;
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_BloodySword (C_Item)
{	
	name 				=	"Blutiges Schwert";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	700;

	damageTotal			= 	70;
	damagetype 			= 	DAM_EDGE;
	range    			=  	95;	
	
	on_equip			=	Equip_1H_02;
	on_unequip			=	UnEquip_1H_02;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	50;
	visual 				=	"DB_ItMw_1H_Sword_Broad_Smith_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_02;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};