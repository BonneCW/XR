INSTANCE ItRwOrcstaff (C_Item)
{
	name 				=	"Grachtnakk";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	0;

	damageTotal			=	0;
	damagetype			=	DAM_BLUNT;
	visual 				=	"ItRw_2H_Orcstaff_01.3DS";

	description			= name;
	//TEXT[0]			= "";					COUNT[0]	= ;
	//TEXT[1]			= "";					COUNT[1]	= ;
	//TEXT[2]			= NAME_Damage;			COUNT[2]	= damageTotal;
	//TEXT[3] 			= NAME_Dex_needed;		COUNT[3]	= cond_value[2];
	//TEXT[4]			= ""; 					COUNT[4]	= ;
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
};


/********************************************************************************/
// Untoter Orc-Priester (wird im Magiemodus zur Visulaisierung benutzt)
INSTANCE ItRwUdOrcstaff (C_Item)
{
	name 				=	"ShaBaNakk";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	0;

	damageTotal			=	0;
	damagetype			=	DAM_BLUNT;
	visual 				=	"ItRw_2H_Orcstaff_01.3DS";

	description			= name;
	//TEXT[0]			= "";					COUNT[0]	= ;
	//TEXT[1]			= "";					COUNT[1]	= ;
	//TEXT[2]			= NAME_Damage;			COUNT[2]	= damageTotal;
	//TEXT[3] 			= NAME_Dex_needed;		COUNT[3]	= cond_value[2];
	//TEXT[4]			= ""; 					COUNT[4]	= ;
	TEXT[5]				= NAME_Value;			COUNT[5]	= value;
};