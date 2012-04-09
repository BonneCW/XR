// Schwerer Ast

INSTANCE ItMw_1h_Bau_Mace (C_Item)
{	
	name 				=	"Schwerer Ast";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	10;

	damageTotal  		= 	10;
	damagetype 			=	DAM_BLUNT;
	range    			=  	70;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	10;
	visual 				=	"ItMw_010_1h_Club_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// Oberschenkelknochen

INSTANCE ItMw_Matronenkeule (C_Item)
{	
	name 				=	"Oberschenkelknochen";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	50;

	damageTotal  		= 	50;
	damagetype 			=	DAM_BLUNT;
	range    			=  	90;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	35;
	visual 				=	"Oberschenkelknochen_schaedelbandage.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// Schwert

INSTANCE ItMw_1H_quantarie_Schwert_01 (C_Item)
{	
	name 				=	"Schwert";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	450;

	damageTotal			= 	40;
	damagetype 			= 	DAM_EDGE;
	range    			=  	90;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	visual 				=	"Schwert_Neu.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_1H_quantarie_Schwert_01_Geschaerft (C_Item)
{	
	name 				=	"Schwert (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	450;

	damageTotal			= 	45;
	damagetype 			= 	DAM_EDGE;
	range    			=  	90;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	visual 				=	"Schwert_Neu.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// Edles Kurzschwert

INSTANCE ItMw_1H_Eminem_AchillesSchwert_01 (C_Item)
{
	name 				=	"Edles Kurzschwert";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	550;

	damageTotal			= 	55;
	damagetype			=	DAM_EDGE;
	range    			=  	95;
	
	on_equip			=	Equip_1H_02;
	on_unequip			=	UnEquip_1H_02;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	45;

	visual 				=	"Achilles_Schwert.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_02;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_1H_Eminem_AchillesSchwert_01_Geschaerft (C_Item)
{
	name 				=	"Edles Kurzschwert (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	550;

	damageTotal			= 	60;
	damagetype			=	DAM_EDGE;
	range    			=  	95;
	
	on_equip			=	Equip_1H_02;
	on_unequip			=	UnEquip_1H_02;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	45;

	visual 				=	"Achilles_Schwert.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_02;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// Bastardschwert

INSTANCE ItMw_Bastardschwert (C_Item)
{
	name 				=	"Bastardschwert";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	720;

	damageTotal			= 	70;
	damagetype			=	DAM_EDGE;
	range    			=  	100;
	
	on_equip			=	Equip_1H_03;
	on_unequip			=	UnEquip_1H_03;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	65;

	visual 				=	"DB_ItMw_1H_Sword_Bastard_Smith_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_03;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Bastardschwert_Geschaerft (C_Item)
{
	name 				=	"Bastardschwert (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	720;

	damageTotal			= 	75;
	damagetype			=	DAM_EDGE;
	range    			=  	100;
	
	on_equip			=	Equip_1H_03;
	on_unequip			=	UnEquip_1H_03;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	65;

	visual 				=	"DB_ItMw_1H_Sword_Bastard_Smith_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_03;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// Edles Schwert

INSTANCE ItMw_1H_quantarie_Fantasyschwert_01 (C_Item)
{	
	name 				=	"Edles Schwert";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	900;

	damageTotal			= 	80;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;	
	
	on_equip			=	Equip_1H_05;
	on_unequip			=	UnEquip_1H_05;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	70;
	visual 				=	"Fantasyschwert.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_05;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_1H_quantarie_Fantasyschwert_01_Geschaerft (C_Item)
{	
	name 				=	"Edles Schwert (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	900;

	damageTotal			= 	85;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;
	
	on_equip			=	Equip_1H_05;
	on_unequip			=	UnEquip_1H_05;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	70;
	visual 				=	"Fantasyschwert.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_05;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// Scharfes Schwert

INSTANCE ItMw_SharpSchwert (C_Item)
{	
	name 				=	"Scharfes Schwert";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	1000;

	damageTotal			= 	95;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;	
	
	on_equip			=	Equip_1H_05;
	on_unequip			=	UnEquip_1H_05;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	85;
	visual 				=	"DB_ItMw_1H_Sword_Smith_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_05;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_SharpSchwert_Geschaerft (C_Item)
{	
	name 				=	"Scharfes Schwert (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	1000;

	damageTotal			= 	100;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;
	
	on_equip			=	Equip_1H_05;
	on_unequip			=	UnEquip_1H_05;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	85;
	visual 				=	"DB_ItMw_1H_Sword_Smith_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_05;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// Langschwert

INSTANCE ItMw_Langschwert (C_Item)
{	
	name 				=	"Langschwert";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	1100;

	damageTotal			= 	110;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;	
	
	on_equip			=	Equip_1H_06;
	on_unequip			=	UnEquip_1H_06;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	103;
	visual 				=	"DB_ItMw_1H_Sword_Long_Smith_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_06;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Langschwert_Geschaerft (C_Item)
{	
	name 				=	"Langschwert (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	1100;

	damageTotal			= 	120;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;
	
	on_equip			=	Equip_1H_06;
	on_unequip			=	UnEquip_1H_06;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	103;
	visual 				=	"DB_ItMw_1H_Sword_Long_Smith_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_06;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// Edles Langschwert

INSTANCE ItMw_Light (C_Item)
{	
	name 				=	"Edles Langschwert";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	1200;

	damageTotal			= 	120;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;	
	
	on_equip			=	Equip_1H_06;
	on_unequip			=	UnEquip_1H_06;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	115;
	visual 				=	"LightSword.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_06;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Light_Geschaerft (C_Item)
{	
	name 				=	"Edles Langschwert (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	1200;

	damageTotal			= 	125;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;	
	
	on_equip			=	Equip_1H_06;
	on_unequip			=	UnEquip_1H_06;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	115;
	visual 				=	"LightSword.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_06;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};