INSTANCE Goetterschwert (C_Item) //Legendäres Schwert aus der Zeit bevor dem Götterstreit 
{
	name 				=	"Drei Götterklinge";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;
	material 			=	MAT_METAL;

	value 				=	5000;

	damageTotal			= 	300;
	damagetype			=	DAM_FIRE;
	range    			=  	160;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	70;

	visual 				=	"ItMw_3Goetterschwert.3ds";

	description			= name;
      TEXT[1]                   ="Legendäres Schwert der drei Götter";
      TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};