// Banditenschwert

INSTANCE ItMw_Banditenschwert (C_Item)
{	
	name 				=	"Banditenschwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	500;

	damageTotal  		= 	70;
	damagetype 			=	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	50;
	visual 				=	"DB_ItMw_1h_Sword_Rep_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_OneHanded;			
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Banditenschwert_Geschaerft (C_Item)
{	
	name 				=	"Banditenschwert (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	500;

	damageTotal  		= 	80;
	damagetype 			=	DAM_EDGE;
	range    			=  	100;	

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	50;
	visual 				=	"DB_ItMw_1h_Sword_Rep_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_OneHanded;			
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_Banditenschwert_Andre (C_Item)
{	
	name 				=	"Banditenschwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_SHOW;	
	material 			=	MAT_METAL;

	value 				=	500;

	damageTotal  		= 	60;
	damagetype 			=	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	50;
	visual 				=	"DB_ItMw_1h_Sword_Rep_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_OneHanded;			
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};