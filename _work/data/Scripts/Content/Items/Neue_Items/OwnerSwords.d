INSTANCE Scars_Schwert (C_Item)
{
	name 				=	"Scars Schwert";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	460;

	damageTotal 		= 	170;
	damagetype 			= 	DAM_EDGE;
	range    			=  	130;

	owner		= Mod_518_SMK_Scar_MT;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	140;

	visual 				=	"ItMw_1H_Sword_Bastard_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
	COUNT[5]			= value;
};

INSTANCE Lees_Axt (C_Item)
{
	name 				=	"Lees Axt";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_METAL;

	value 				=	1120;

	damageTotal			= 	185;
	damagetype			=	DAM_EDGE;
	range    			=  	130;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	170;

	visual 				=	"ItMw_2H_Axe_Heavy_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE Thorus_Schwert (C_Item)
{
	name 				=	"Thorus Schwert";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;
	material 			=	MAT_METAL;

	value 				=	500;

	damageTotal			= 	180;
	damagetype			=	DAM_EDGE;
	range    			=  	150;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	150;

	visual 				=	"ItMw_2H_Sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE Artos_Schwert (C_Item)
{
	name 				=	"Artos Schwert";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	360;

	damageTotal 		= 	130;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	100;

	visual 				=	"ItMw_1H_Sword_Long_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//RAVEN
//-----------------------------------------------------------
INSTANCE Rabenrecht (C_Item)
{
	name 				=	"Rabenrecht";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	400;

	damageTotal			= 	140;
	damagetype 			= 	DAM_EDGE;
	range    			=  	130;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	110;

	visual 				=	"ItMw_1H_Sword_Broad_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//BARTHOLO
//-----------------------------------------------------------
INSTANCE Prankenhieb (C_Item)
{
	name 				=	"Prankenhieb";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	300;

	damageTotal			= 	110;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	80;

	visual 				=	"ItMw_1H_Sword_Long_05.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//DIEGO
//-----------------------------------------------------------


//-----------------------------------------------------------
//Whistler (Bei Fisk)
//-----------------------------------------------------------
INSTANCE Whistlers_Schwert (C_Item)
{
	name 				=	"Whistlers Schwert";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	110;

	damageTotal			= 	40;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;

	visual 				=	"ItMw_1H_Sword_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};


/***********************************************************/
//BRUDERSCHAFT
/***********************************************************/
//-----------------------------------------------------------
//Y'BERION
//-----------------------------------------------------------
INSTANCE Stab_des_Lichts (C_Item)
{
	name 				=	"Stab des Lichts";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	350;

	damageTotal			= 	130;
	damagetype 			=	DAM_BLUNT;
	range    			=  	160;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	90;

	visual 				=	"ItMw_2H_Staff_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//COR KALOM
//-----------------------------------------------------------
INSTANCE Kaloms_Schwert (C_Item)
{
	name 				=	"Kaloms Schwert";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	400;

	damageTotal			= 	140;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	110;

	visual 				=	"ItMw_1H_Sword_05.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//LESTER
//-----------------------------------------------------------
INSTANCE Streitschlichter (C_Item)
{
	name 				=	"Lesters Streitschlichter ";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;
	material 			=	MAT_METAL;

	value 				=	340;

	damageTotal			=   120;
	damagetype			=	DAM_BLUNT;
	range    			=  	90;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	80;

	visual 				=	"ItMw_1H_Mace_War_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//COR ANGAR
//-----------------------------------------------------------
INSTANCE Roter_Wind (C_Item)
{
	name 				=	"Roter Wind";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;
	material 			=	MAT_METAL;

	value 				=	570;

	damageTotal			= 	185;
	damagetype			=	DAM_EDGE;
	range    			=  	140;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	160;

	visual 				=	"ItMw_2H_Sword_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//BAAL NAMIB
//-----------------------------------------------------------
INSTANCE Namibs_Keule (C_Item)
{
	name 				=	"Namibs Keule";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;
	material 			=	MAT_METAL;

	value 				=	300;

	damageTotal			=   110;
	damagetype			=	DAM_BLUNT;
	range    			=  	90;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	80;

	visual 				=	"ItMw_1H_Mace_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//BAAL ORUN
//-----------------------------------------------------------
INSTANCE Oruns_Keule (C_Item)
{
	name 				=	"Oruns Keule";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;
	material 			=	MAT_METAL;

	value 				=	330;

	damageTotal  		=   120;
	damagetype			=	DAM_BLUNT;
	range    			=  	90;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	100;

	visual 				=	"ItMw_1H_Mace_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//FORTUNO
//-----------------------------------------------------------
INSTANCE Fortunos_Keule (C_Item)
{
	name 				=	"Fortunos Keule";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;
	material 			=	MAT_METAL;

	value 				=	110;

	damageTotal			=   40;
	damagetype			=	DAM_BLUNT;
	range    			=  	90;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;

	visual 				=	"ItMw_1H_Mace_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE Oriks_Axt (C_Item)
{
	name 				=	"Oriks Axt";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_METAL;

	value 				=	540;

	damageTotal			= 	190;
	damagetype			=	DAM_EDGE;
	range    			=  	130;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	170;

	visual 				=	"ItMw_2H_Axe_Heavy_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//TORLOF
//-----------------------------------------------------------
INSTANCE Torlofs_Axt (C_Item)
{
	name 				=	"Torlofs Axt";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_METAL;

	value 				=	550;

	damageTotal			= 	198;
	damagetype			=	DAM_EDGE;
	range    			=  	130;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	170;

	visual 				=	"ItMw_2H_Axe_Heavy_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//CORD
//-----------------------------------------------------------
INSTANCE Cords_Spalter (C_Item)
{
	name 				=	"Cords Spalter";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;
	material 			=	MAT_METAL;

	value 				=	310;

	damageTotal			=   120;
	damagetype			=	DAM_EDGE;
	range    			=  	100;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	100;

	visual 				=	"ItMw_1H_Axe_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//GORN
//-----------------------------------------------------------
INSTANCE Gorns_Rache (C_Item)
{
	name 				=	"Gorns Rache";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_METAL;

	value 				=	560;

	damageTotal			= 	185;
	damagetype			=	DAM_EDGE;
	range    			=  	130;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	160;

	visual 				=	"ItMw_2H_Axe_Heavy_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//LARES
//-----------------------------------------------------------
INSTANCE Lares_Axt (C_Item)
{
	name 				=	"Lares Axt";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;
	material 			=	MAT_METAL;

	value 				=	340;

	damageTotal			=   130;
	damagetype			=	DAM_EDGE;
	range    			=  	100;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	90;

	visual 				=	"ItMw_1H_Axe_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//WOLF
//-----------------------------------------------------------
//-----------------------------------------------------------
//SILAS
//-----------------------------------------------------------
INSTANCE Silas_Axt (C_Item)
{
	name 				=	"Silas Axt";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;
	material 			=	MAT_METAL;

	value 				=	290;

	damageTotal			=   110;
	damagetype			=	DAM_EDGE;
	range    			=  	100;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	80;

	visual 				=	"ItMw_1H_Axe_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

//-----------------------------------------------------------
//RICELORD
//-----------------------------------------------------------
INSTANCE Heerscherstab (C_Item)
{
	name 				=	"Herrscherstab";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	150;

	damageTotal			= 	52;
	damagetype 			=	DAM_EDGE;
	range    			=  	150;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	40;

	visual 				=	"ItMw_2H_Staff_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};