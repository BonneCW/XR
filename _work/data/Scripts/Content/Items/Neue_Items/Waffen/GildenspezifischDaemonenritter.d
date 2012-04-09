// Beliars' Vollstrecker

INSTANCE ItMw_XRSchwert_04 (C_Item)
{	
	name 				=	"Beliars' Vollstrecker";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	5000;

	damageTotal			= 	190;
	damagetype 			= 	DAM_EDGE;
	range    			=  	120;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	160;
	visual 				=	"XRSChwert_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_XRSChwert_04_Geschaerft (C_Item)
{	
	name 				=	"Beliars' Vollstrecker (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	5000;

	damageTotal			= 	200;
	damagetype 			= 	DAM_EDGE;
	range    			=  	120;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	160;
	visual 				=	"XRSChwert_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};