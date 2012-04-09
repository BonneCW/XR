// Einhand

INSTANCE ItMw_quantarie_XR_06 (C_Item)
{
	name 				=	"Schwert 06";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	500;

	damageTotal			= 	95;
	damagetype			=	DAM_EDGE;
	range    			=  	100;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	75;

	visual 				=	"ItMw_quantarie_XR_06.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_quantarie_XR_06_Geschaerft (C_Item)
{
	name 				=	"Schwert 06 (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	500;

	damageTotal			= 	105;
	damagetype			=	DAM_EDGE;
	range    			=  	100;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	75;

	visual 				=	"ItMw_quantarie_XR_06.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_quantarie_XR_07 (C_Item)
{
	name 				=	"Schwert 07";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	500;

	damageTotal			= 	100;
	damagetype			=	DAM_EDGE;
	range    			=  	100;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	85;

	visual 				=	"ItMw_quantarie_XR_07.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_quantarie_XR_07_Geschaerft (C_Item)
{
	name 				=	"Schwert 07 (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	500;

	damageTotal			= 	110;
	damagetype			=	DAM_EDGE;
	range    			=  	100;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	85;

	visual 				=	"ItMw_quantarie_XR_07.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// Zweihand

INSTANCE ItMw_quantarie_XR_08 (C_Item)
{
	name 				=	"Schwert 08";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;
	material 			=	MAT_METAL;

	value 				=	500;

	damageTotal			= 	145;
	damagetype			=	DAM_EDGE;
	range    			=  	150;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	145;

	visual 				=	"ItMw_quantarie_XR_08.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_quantarie_XR_08_Geschaerft (C_Item)
{
	name 				=	"Schwert 08 (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;
	material 			=	MAT_METAL;

	value 				=	500;

	damageTotal			= 	155;
	damagetype			=	DAM_EDGE;
	range    			=  	150;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	145;

	visual 				=	"ItMw_quantarie_XR_09.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

// Dämonenjägerschwert

INSTANCE ItMw_Daemonenjaegerschwert (C_Item)
{
	name 				=	"Dämonenjägerschwert";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;
	material 			=	MAT_METAL;

	value 				=	1000;

	damageTotal			= 	125;
	damagetype			=	DAM_EDGE;
	range    			=  	120;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	115;

	on_equip		= Equip_Daemonenjaegerschwert;
	on_unequip		= UnEquip_Daemonenjaegerschwert;

	visual 				=	"XR_Damonenjager.3DS";

	description			= name;
	TEXT[1]				= NAME_Bonus_Mana;
	COUNT[1]			= 10;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_Daemonenjaegerschwert_Geschaerft (C_Item)
{
	name 				=	"Dämonenjägerschwert (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;
	material 			=	MAT_METAL;

	value 				=	1000;

	damageTotal			= 	135;
	damagetype			=	DAM_EDGE;
	range    			=  	120;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	115;

	on_equip		= Equip_Daemonenjaegerschwert;
	on_unequip		= UnEquip_Daemonenjaegerschwert;

	visual 				=	"XR_Damonenjager.3DS";

	description			= name;
	TEXT[1]				= NAME_Bonus_Mana;
	COUNT[1]			= 10;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

FUNC VOID Equip_Daemonenjaegerschwert()
{
	hero.attribute[ATR_MANA_MAX] += 10;
	hero.attribute[ATR_MANA] += 10;
};

FUNC VOID UnEquip_Daemonenjaegerschwert()
{
	hero.attribute[ATR_MANA_MAX] -= 10;
	hero.attribute[ATR_MANA] -= 10;
};

// Opferschwert

INSTANCE ItMw_Opferschwert (C_Item)
{
	name 				=	"Opferschwert";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;
	material 			=	MAT_METAL;

	value 				=	1000;

	damageTotal			= 	135;
	damagetype			=	DAM_EDGE;
	range    			=  	120;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	125;

	on_equip		= Equip_Opferschwert;
	on_unequip		= UnEquip_Opferschwert;

	visual 				=	"XR_Opferschwert.3DS";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;
	COUNT[1]			= 10;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_Opferschwert_Geschaerft (C_Item)
{
	name 				=	"Opferschwert (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;
	material 			=	MAT_METAL;

	value 				=	1000;

	damageTotal			= 	145;
	damagetype			=	DAM_EDGE;
	range    			=  	120;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	125;

	on_equip		= Equip_Opferschwert;
	on_unequip		= UnEquip_Opferschwert;

	visual 				=	"XR_Opferschwert.3DS";

	description			= name;
	TEXT[1]				= NAME_Bonus_HP;
	COUNT[1]			= 10;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

FUNC VOID Equip_Opferschwert()
{
	hero.attribute[ATR_HITPOINTS_MAX] += 10;
	hero.attribute[ATR_HITPOINTS] += 10;
};

FUNC VOID UnEquip_Opferschwert()
{
	hero.attribute[ATR_HITPOINTS_MAX] -= 10;
	hero.attribute[ATR_HITPOINTS] -= 10;
};

// Zweiklinge

INSTANCE ItMw_Zweiklinge (C_Item)
{
	name 				=	"Zweiklinge";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;
	material 			=	MAT_METAL;

	value 				=	300;

	damageTotal			= 	65;
	damagetype			=	DAM_EDGE;
	range    			=  	100;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	65;

	visual 				=	"XR_Waldlauferbogen_Messerding.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_Zweiklinge_Geschaerft (C_Item)
{
	name 				=	"Zweiklinge (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;
	material 			=	MAT_METAL;

	value 				=	300;

	damageTotal			= 	75;
	damagetype			=	DAM_EDGE;
	range    			=  	100;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	65;

	visual 				=	"XR_Waldlauferbogen_Messerding.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};