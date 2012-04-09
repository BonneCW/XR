// Degen

INSTANCE ItMw_1h_Vlk_Sword (C_Item)
{	
	name 				=	"Degen";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	500;

	damageTotal  		= 	40;
	damagetype 			=	DAM_EDGE;
	range    			=  	70;		

	on_equip			=	Equip_1H_05;
	on_unequip			=	UnEquip_1H_05;	

	cond_atr[2]   		=	ATR_DEXTERITY;
	cond_value[2]  		=	20;
	visual 				=	"ItMw_018_1h_SwordCane_01.3ds";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_05;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_1h_Vlk_Sword_Geschaerft (C_Item)
{	
	name 				=	"Degen (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	500;

	damageTotal  		= 	50;
	damagetype 			=	DAM_EDGE;
	range    			=  	70;		

	on_equip			=	Equip_1H_05;
	on_unequip			=	UnEquip_1H_05;	

	cond_atr[2]   		=	ATR_DEXTERITY;
	cond_value[2]  		=	20;
	visual 				=	"ItMw_018_1h_SwordCane_01.3ds";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_05;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_Degen_Jack (C_Item)
{	
	name 				=	"Jacks Degen";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	500;

	damageTotal  		= 	40;
	damagetype 			=	DAM_EDGE;
	range    			=  	70;		

	on_equip			=	Equip_1H_05;
	on_unequip			=	UnEquip_1H_05;	

	cond_atr[2]   		=	ATR_DEXTERITY;
	cond_value[2]  		=	20;
	visual 				=	"ItMw_018_1h_SwordCane_01.3ds";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_05;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// Meisterdegen

INSTANCE ItMw_Meisterdegen (C_Item)
{	
	name 				=	"Meisterdegen";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	2400;

	damageTotal  		= 	120;
	damagetype 			=	DAM_EDGE;
	range    			=  	100;
	
	on_equip			=	Equip_1H_10;
	on_unequip			=	UnEquip_1H_10;

	cond_atr[2]   		=	ATR_DEXTERITY;
	cond_value[2]  		=	60;
	visual 				=	"ItMw_065_1h_SwordCane_02.3ds";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Meisterdegen_Geschaerft (C_Item)
{	
	name 				=	"Meisterdegen (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	2400;

	damageTotal  		= 	130;
	damagetype 			=	DAM_EDGE;
	range    			=  	100;
	
	on_equip			=	Equip_1H_10;
	on_unequip			=	UnEquip_1H_10;

	cond_atr[2]   		=	ATR_DEXTERITY;
	cond_value[2]  		=	60;
	visual 				=	"ItMw_065_1h_SwordCane_02.3ds";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_EchsenSchwertDex (C_Item)
{	
	name 				=	"Echsendegen";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	500;

	damageTotal  		= 	50;
	damagetype 			=	DAM_EDGE;
	range    			=  	70;		

	cond_atr[2]   		=	ATR_DEXTERITY;
	cond_value[2]  		=	30;
	visual 				=	"ItMw_018_1h_SwordCane_01.3ds";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};