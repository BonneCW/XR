// *************************
// unbenutzte Item - Visuals
// *************************

//ItMw_2H_Sword_Sleeper_01	// Uriziel ungeladen
//ItMw_2H_Sword_Sleeper_02	// Uriziel geladen

//ItMw_2H_Axe_Old_03		// alter Richter
//ItMw_2H_Axe_Old_01		// alte Streitaxt

//ItMw_1H_Sword_Broad_01 	// Breitschwert 1h
//ItMw_1H_Sword_Long_03		// Hassbringer
//ItMw_1H_Sword_05			// Kriegsschwert
//ItMw_1H_Sword_04			// Kampfschwert
//ItMw_1H_Sword_02			// Richtschwert
//ItMw_2H_Staff_02			// Richtstab
//ItMw_2H_Staff_01			// Kampfstab
//ItMw_1H_Scythe_01			// Schnitter
//ItMw_1H_Sword_Short_02	// Bauernwehr
//ItMw_1H_Sword_Short_01	// Kurzschwert

//ItMw_1H_Poker_01			// Schürhaken

// *****************************************************
// Waffen in der Welt (ab Kapitel 1)
// ---------------------------------
// Hier alle Waffen, die bei mortal-NSCs 
// oder in die Welt objektiert zu finden sind
// Alle haben sehr geringen Wert
// Alle können (theoretisch) in Kapitel 1 erlangt werden
// *****************************************************
INSTANCE ItMw_1H_Mace_02 (C_Item)
{	
	name 				=	"Stachelkeule";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	65*10;

	damageTotal			=   50;
	damagetype			=	DAM_BLUNT;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	35;
	visual 				=	"ItMw_1H_Mace_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_Brot (C_Item)
{	
	name 				=	"Verzaubertes Brot";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_WOOD;

	value 				=	65*10;

	damageTotal			=   30;
	damagetype			=	DAM_BLUNT;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	10;
	visual 				=	"ItMw_Bread.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_EchsenKriegerDolch (C_Item)
{	
	name 				=	"Kriegerdolch";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	104*10;

	damageTotal			= 	64;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	55;
	visual 				=	"ItMw_Kriegerdolch.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Sword_03 (C_Item)
{	
	name 				=	"Gardeschwert";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	104*10;

	damageTotal			= 	64;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	55;
	visual 				=	"ItMw_1H_Sword_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_1H_Sword_03_Geschaerft (C_Item)
{	
	name 				=	"Gardeschwert (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	104*10;

	damageTotal			= 	64 + DAMAGE_BONUS_SHARPENED;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	55;
	visual 				=	"ItMw_1H_Sword_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Sword_Long_04 (C_Item)
{	
	name 				=	"Siegbringer";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	860*10;//430;//214

	damageTotal			= 	150;
	damagetype 			= 	DAM_EDGE;
	range    			=  	120;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	130;
	visual 				=	"ItMw_1H_Sword_Long_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_1H_Sword_Long_04_Geschaerft (C_Item)
{	
	name 				=	"Siegbringer (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	860*10;//430;//214

	damageTotal			= 	150 + DAMAGE_BONUS_SHARPENED;
	damagetype 			= 	DAM_EDGE;
	range    			=  	120;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	130;
	visual 				=	"ItMw_1H_Sword_Long_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Sword_Long_05 (C_Item)
{	
	name 				=	"Todbringer";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	920*10;//460;//232

	damageTotal			= 	160;
	damagetype 			= 	DAM_EDGE;
	range    			=  	120;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	140;
	visual 				=	"ItMw_1H_Sword_Long_05.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_1H_Sword_Long_05_Geschaerft (C_Item)
{	
	name 				=	"Todbringer (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	920*10;//460;//232

	damageTotal			= 	160 + DAMAGE_BONUS_SHARPENED;
	damagetype 			= 	DAM_EDGE;
	range    			=  	120;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	140;
	visual 				=	"ItMw_1H_Sword_Long_05.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Sword_Broad_04 (C_Item) 
{	
	name 				=	"Gardistenhand";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	1400*4;//700;//349

	damageTotal			= 	167;
	damagetype 			= 	DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	149;
	visual 				=	"ItMw_1H_Sword_Broad_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_1H_Sword_Broad_04_Geschaerft (C_Item) 
{	
	name 				=	"Gardistenhand (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	1400*4;//700;//349

	damageTotal			= 	167 + DAMAGE_BONUS_SHARPENED;
	damagetype 			= 	DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	149;
	visual 				=	"ItMw_1H_Sword_Broad_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Sword_Bastard_03 (C_Item) 
{	
	name 				=	"Vollstrecker";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	1720*5;//860;//430

	damageTotal			= 	170;
	damagetype 			= 	DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	154;
	visual 				=	"ItMw_1H_Sword_Bastard_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_1H_Sword_Bastard_03_Geschaerft (C_Item) 
{	
	name 				=	"Vollstrecker (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	1720*5;//860;//430

	damageTotal			= 	170 + DAMAGE_BONUS_SHARPENED;
	damagetype 			= 	DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	154;
	visual 				=	"ItMw_1H_Sword_Bastard_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Axe_Old_02 (C_Item)
{	
	name 				=	"Bluternter";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_WOOD;

	value 				=	1840*4;//920;//466
	
	damageTotal			= 	167;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	165;
	visual 				=	"ItMw_2H_Axe_Old_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_2H_Axe_Old_02_Geschaerft (C_Item)
{	
	name 				=	"Bluternter (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_WOOD;

	value 				=	1840*4;//920;//466
	
	damageTotal			= 	167 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	165;
	visual 				=	"ItMw_2H_Axe_Old_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Sword_Light_02 (C_Item) 
{	
	name 				=	"Templerklinge";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	1950;

	damageTotal			= 	142;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	130;
	visual 				=	"ItMw_2H_Sword_Light_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_2H_Sword_Light_02_Geschaerft (C_Item) 
{	
	name 				=	"Templerklinge (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	1950;

	damageTotal			= 	142 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	150;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	130;
	visual 				=	"ItMw_2H_Sword_Light_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_AlteHueterklinge_1H (C_Item) 
{	
	name 				=	"Alte Hüterklinge";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	1050;

	damageTotal			= 	80;
	damagetype			=	DAM_EDGE;
	range    			=  	120;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	70;
	visual 				=	"ItMw_2H_Sword_Light_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_AlteHueterklinge_1H_Geschaerft (C_Item) 
{	
	name 				=	"Alte Hüterklinge (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	1050;

	damageTotal			= 	90 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	120;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	70;
	visual 				=	"ItMw_2H_Sword_Light_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_AlteHueterklinge_2H (C_Item) 
{	
	name 				=	"Alte Hüterklinge";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	1050;

	damageTotal			= 	100;
	damagetype			=	DAM_EDGE;
	range    			=  	120;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	90;
	visual 				=	"ItMw_2H_Sword_Light_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_AlteHueterklinge_2H_Geschaerft (C_Item) 
{	
	name 				=	"Alte Hüterklinge (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	1050;

	damageTotal			= 	110 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	120;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	90;
	visual 				=	"ItMw_2H_Sword_Light_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_FalscheHueterklinge_1H (C_Item) 
{	
	name 				=	"Falsche Hüterklinge";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	1550;

	damageTotal			= 	110;
	damagetype			=	DAM_EDGE;
	range    			=  	120;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	100;
	visual 				=	"ItMw_2H_Sword_Light_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_FalscheHueterklinge_1H_Geschaerft (C_Item) 
{	
	name 				=	"Falsche Hüterklinge (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	1550;

	damageTotal			= 	120 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	120;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	100;
	visual 				=	"ItMw_2H_Sword_Light_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_FalscheHueterklinge_2H (C_Item) 
{	
	name 				=	"Falsche Hüterklinge";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	1550;

	damageTotal			= 	130;
	damagetype			=	DAM_EDGE;
	range    			=  	120;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	130;
	visual 				=	"ItMw_2H_Sword_Light_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_FalscheHueterklinge_2H_Geschaerft (C_Item) 
{	
	name 				=	"Falsche Hüterklinge (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	1550;

	damageTotal			= 	140 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	120;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	130;
	visual 				=	"ItMw_2H_Sword_Light_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_Hueterklinge_1H (C_Item) 
{	
	name 				=	"Hüterklinge";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	1950;

	damageTotal			= 	140;
	damagetype			=	DAM_EDGE;
	range    			=  	120;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	130;
	visual 				=	"ItMw_2H_Sword_Light_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Hueterklinge_1H_Geschaerft (C_Item) 
{	
	name 				=	"Hüterklinge (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	1950;

	damageTotal			= 	150 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	120;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	130;
	visual 				=	"ItMw_2H_Sword_Light_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_Hueterklinge_2H (C_Item) 
{	
	name 				=	"Hüterklinge";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	1950;

	damageTotal			= 	160;
	damagetype			=	DAM_EDGE;
	range    			=  	120;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	150;
	visual 				=	"ItMw_2H_Sword_Light_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Hueterklinge_2H_Geschaerft (C_Item) 
{	
	name 				=	"Hüterklinge (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	1950;

	damageTotal			= 	170 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	120;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	150;
	visual 				=	"ItMw_2H_Sword_Light_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE Delirium_Dolch (C_Item)
{	
	name 				=	"Deliriumdolch";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	6000;

	damageTotal  		= 	50;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_VLKDolch;		
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_VLKDolch;
	visual 				=	"Itmw_005_1h_dagger_01.3DS";

	description			= name;
	
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_Andramo (C_Item)
{	
	name 				=	"Andramo";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	600;

	damageTotal  		= 	75;
	damagetype 			=	DAM_EDGE;
	range    			=  	95;		
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	58;
	visual 				=	"Andramo.3DS";

	description			= name;
	
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1H_Mace_L_01 (C_Item)
{	
	name 				=	"Schürhaken";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Schuerhaken;

	damageTotal  		= 	Damage_Schuerhaken;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Schuerhaken;		
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schuerhaken;
	visual 				=	"Itmw_005_1h_poker_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_1H_Mace_L_01_Geschaerft (C_Item)
{	
	name 				=	"Schürhaken (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Schuerhaken;

	damageTotal  		= 	Damage_Schuerhaken + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Schuerhaken;		
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schuerhaken;
	visual 				=	"Itmw_005_1h_poker_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1h_Bau_Axe (C_Item)
{	
	name 				=	"Sichel";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_BauAxe;

	damageTotal  		= 	Damage_BauAxe;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_BauAxe;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_BauAxe;
	visual 				=	"Itmw_007_1h_sickle_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_1h_Bau_Axe_Geschaerft (C_Item)
{	
	name 				=	"Sichel (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_BauAxe;

	damageTotal  		= 	Damage_BauAxe + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_BauAxe;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_BauAxe;
	visual 				=	"Itmw_007_1h_sickle_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1h_Vlk_Mace (C_Item)
{	
	name 				=	"Gehstock";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_VLKMace;

	damageTotal  		= 	Damage_VLKMace;
	damagetype 			=	DAM_BLUNT;
	range    			=  	RANGE_VLKMace;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_VLKMace;
	visual 				=	"Itmw_008_1h_pole_01.3ds";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_Schlagstock (C_Item)
{	
	name 				=	"Schlagstock";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	1;

	damageTotal  		= 	5;
	damagetype 			=	DAM_BLUNT;
	range    			=  	RANGE_VLKMace;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_VLKMace;
	visual 				=	"Itmw_008_1h_pole_01.3ds";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1H_Mace_L_03 (C_Item)
{	
	name 				=	"Belegnagel";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Belegnagel;

	damageTotal  		= 	Damage_Belegnagel;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Belegnagel;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Belegnagel;
	visual 				=	"ItMw_008_1h_mace_light_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1h_Vlk_Axe (C_Item)
{	
	name 				=	"Beil";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_VLKAxe;

	damageTotal  		= 	Damage_VLKAxe;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_VLKAxe;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_VLKAxe;
	visual 				=	"Itmw_010_1h_vlk_hatchet_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_1h_Vlk_Axe_Geschaerft (C_Item)
{	
	name 				=	"Beil (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_VLKAxe;

	damageTotal  		= 	Damage_VLKAxe + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_VLKAxe;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_VLKAxe;
	visual 				=	"Itmw_010_1h_vlk_hatchet_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1H_Mace_L_04 (C_Item)
{	
	name 				=	"Schmiedehammer";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Schmiedehammer;

	damageTotal  		= 	Damage_Schmiedehammer;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Schmiedehammer;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schmiedehammer;
	visual 				=	"ItMw_010_1h_sledgehammer_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_FeurigerHammer (C_Item)
{	
	name 				=	"Feuriger Hammer";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE | ITEM_SHOW;	
	material 			=	MAT_METAL;

	value 				=	Value_Schmiedehammer;

	damageTotal  		= 	Damage_Schmiedehammer;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Schmiedehammer;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schmiedehammer;
	visual 				=	"ItMw_010_1h_sledgehammer_01.3DS";

	description			= name;
	TEXT[1]				= "Feuerschaden";				COUNT[1]	= 3;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_Stadthammer (C_Item)
{	
	name 				=	"Stadthammer";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Schmiedehammer;

	damageTotal  		= 	Damage_Schmiedehammer;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Schmiedehammer;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schmiedehammer;
	visual 				=	"ItMw_010_1h_sledgehammer_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_ShortSword1 (C_Item)
{	
	name 				=	"Kurzschwert der Miliz";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_ShortSword1;

	damageTotal  		= 	Damage_ShortSword1;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_ShortSword1;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_ShortSword1;
	visual 				=	"ItMw_010_1h_Sword_short_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_ShortSword1_Geschaerft (C_Item)
{	
	name 				=	"Kurzschwert der Miliz (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_ShortSword1;

	damageTotal  		= 	Damage_ShortSword1 + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_ShortSword1;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_ShortSword1;
	visual 				=	"ItMw_010_1h_Sword_short_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_EchsenSchwertStr (C_Item)
{	
	name 				=	"Echsenschwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_ShortSword1;

	damageTotal  		= 	50;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_ShortSword1;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	30;
	visual 				=	"ItMw_010_1h_Sword_short_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_Nagelknueppel (C_Item)
{	
	name 				=	"Nagelknüppel";  //für Banditen

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Nagelknueppel;

	damageTotal  		= 	Damage_Nagelknueppel;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Nagelknueppel;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Nagelknueppel;
	visual 				=	"ItMw_012_1h_Nailmace_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1H_Sword_L_03 (C_Item)
{	
	name 				=	"Wolfsklinge";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Wolfsklinge;

	damageTotal  		= 	Damage_Wolfsklinge;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Wolfsklinge;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Wolfsklinge;
	visual 				=	"ItMw_012_1h_Knife_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_1H_Sword_L_03_Geschaerft (C_Item)
{	
	name 				=	"Wolfsklinge (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Wolfsklinge;

	damageTotal  		= 	Damage_Wolfsklinge + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Wolfsklinge;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Wolfsklinge;
	visual 				=	"ItMw_012_1h_Knife_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_ShortSword2 (C_Item)
{	
	name 				=	"Grobes Kurzschwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_ShortSword2;

	damageTotal  		= 	Damage_ShortSword2;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_ShortSword2;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_ShortSword2;
	visual 				=	"ItMw_012_1h_Sword_short_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_ShortSword2_Geschaerft (C_Item)
{	
	name 				=	"Grobes Kurzschwert (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_ShortSword2;

	damageTotal  		= 	Damage_ShortSword2 + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_ShortSword2;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_ShortSword2;
	visual 				=	"ItMw_012_1h_Sword_short_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_FurtsSchwert (C_Item)
{	
	name 				=	"Furts Schwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_ShortSword2;

	damageTotal  		= 	Damage_ShortSword2;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_ShortSword2;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_ShortSword2;
	visual 				=	"ItMw_012_1h_Sword_short_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_Sense (C_Item)
{	
	name 				=	"Kleine Sense";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Sense;

	damageTotal  		= 	Damage_Sense;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Sense;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Sense;
	visual 				=	"ItMw_012_1h_Scythe_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Sense_Geschaerft (C_Item)
{	
	name 				=	"Kleine Sense (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Sense;

	damageTotal  		= 	Damage_Sense + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Sense;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Sense;
	visual 				=	"ItMw_012_1h_Scythe_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1h_Nov_Mace (C_Item)
{	
	name 				=	"Kampfstab der Feuer Novizen";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	Value_NovMace;

	damagetype 			=	DAM_BLUNT|DAM_MAGIC;
	damage[DAM_INDEX_BLUNT]	=	  60;						
	damage[DAM_INDEX_MAGIC]	=	 5;
	range    			=  	RANGE_NovMace;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	30;
	visual 				=	"ItMw_020_2h_Nov_Staff_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= 60;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1h_SNov_Mace (C_Item)
{	
	name 				=	"Kampfstab der Schwarzen Novizen";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	Value_NovMace;

	damagetype 			=	DAM_BLUNT|DAM_MAGIC;
	damage[DAM_INDEX_BLUNT]	=	  60;						
	damage[DAM_INDEX_MAGIC]	=	 5;
	range    			=  	RANGE_NovMace;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	30;
	visual 				=	"ItMw_020_2h_Nov_Staff_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= 60;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_2h_Bau_Axe (C_Item)
{	
	name 				=	"Holzfälleraxt";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Bau2hAxt;

	damageTotal  		= 	Damage_Bau2hAxt;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Bau2hAxt;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Bau2hAxt;
	visual 				=	"ItMw_020_2h_Axe_Lumberjack_01.3ds";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_2h_Bau_Axe_Geschaerft (C_Item)
{	
	name 				=	"Holzfälleraxt (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Bau2hAxt;

	damageTotal  		= 	Damage_Bau2hAxt + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Bau2hAxt;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Bau2hAxt;
	visual 				=	"ItMw_020_2h_Axe_Lumberjack_01.3ds";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
// *****************************************************
// *****************************************************
INSTANCE ItMw_1h_Misc_Axe (C_Item)
{	
	name 				=	"Rostige Axt";  //STANDARDOBJEKTIERUNG

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_MiscAxe;

	damageTotal  		= 	Damage_MiscAxe;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_MiscAxe;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_MiscAxe;
	visual 				=	"ItMw_025_2h_Misc_Axe_old_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_1h_Misc_Axe_Geschaerft (C_Item)
{	
	name 				=	"Rostige Axt (geschärft)";  //STANDARDOBJEKTIERUNG

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_MiscAxe;

	damageTotal  		= 	Damage_MiscAxe + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_MiscAxe;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_MiscAxe;
	visual 				=	"ItMw_025_2h_Misc_Axe_old_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************

// *****************************************************
INSTANCE ItMw_1h_Mil_Sword (C_Item)
{	
	name 				=	"Grobes Breitschwert";  //NUR MILIZ

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_MilSchwert;

	damageTotal  		= 	Damage_MilSchwert;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_MilSchwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_MilSchwert;
	visual 				=	"Itmw_025_1h_Mil_Sword_broad_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_1h_Mil_Sword_Geschaerft (C_Item)
{	
	name 				=	"Grobes Breitschwert (geschärft)";  //NUR MILIZ

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_MilSchwert;

	damageTotal  		= 	Damage_MilSchwert + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_MilSchwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_MilSchwert;
	visual 				=	"Itmw_025_1h_Mil_Sword_broad_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1h_Sld_Axe (C_Item)
{	
	name 				=	"Grobes Kriegsbeil";  //SÖLDNER

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Sld1hAxt;

	damageTotal  		= 	Damage_Sld1hAxt;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Sld1hAxt;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Sld1hAxt;
	visual 				=	"ItMw_025_1h_sld_axe_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_1h_Sld_Axe_Geschaerft (C_Item)
{	
	name 				=	"Grobes Kriegsbeil (geschärft)";  //SÖLDNER

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Sld1hAxt;

	damageTotal  		= 	Damage_Sld1hAxt + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Sld1hAxt;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Sld1hAxt;
	visual 				=	"ItMw_025_1h_sld_axe_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1h_Sld_Sword (C_Item)
{	
	name 				=	"Grobes Schwert";  //SÖLDNER

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Sld1hSchwert;

	damageTotal  		= 	Damage_Sld1hSchwert;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Sld1hSchwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Sld1hSchwert;
	visual 				=	"ItMw_025_1h_sld_sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_1h_Sld_Sword_Geschaerft (C_Item)
{	
	name 				=	"Grobes Schwert (geschärft)";  //SÖLDNER

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Sld1hSchwert;

	damageTotal  		= 	Damage_Sld1hSchwert + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Sld1hSchwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Sld1hSchwert;
	visual 				=	"ItMw_025_1h_sld_sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_EchsenZweihaender (C_Item)
{	
	name 				=	"Echsenzweihänder";  //SÖLDNER

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Sld1hSchwert;

	damageTotal  		= 	65;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Sld2hSchwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	40;
	visual 				=	"ItMw_035_2h_sld_sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
// ****** folgende Waffen sind eigentlich zu gut für Kapitel 1, NSCs sind aber noch VIEL zu stark ******
INSTANCE ItMw_2h_Sld_Axe (C_Item)
{	
	name 				=	"Grobe Kriegsaxt";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Sld2hAxe;

	damageTotal  		= 	Damage_Sld2hAxe;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Sld2hAxe;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Sld2hAxe;
	visual 				=	"ItMw_035_2h_sld_axe_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_2h_Sld_Axe_Geschaerft (C_Item)
{	
	name 				=	"Grobe Kriegsaxt (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Sld2hAxe;

	damageTotal  		= 	Damage_Sld2hAxe + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Sld2hAxe;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Sld2hAxe;
	visual 				=	"ItMw_035_2h_sld_axe_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_2h_Sld_Sword (C_Item)
{	
	name 				=	"Grober Zweihänder";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;
	material 			=	MAT_METAL;

	value 				=	Value_Sld2hSchwert;

	damageTotal  		= 	Damage_Sld2hSchwert;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Sld2hSchwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Sld2hSchwert;
	visual 				=	"ItMw_035_2h_sld_sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_2h_Sld_Sword_Geschaerft (C_Item)
{	
	name 				=	"Grober Zweihänder (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;
	material 			=	MAT_METAL;

	value 				=	Value_Sld2hSchwert;

	damageTotal  		= 	Damage_Sld2hSchwert + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Sld2hSchwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Sld2hSchwert;
	visual 				=	"ItMw_035_2h_sld_sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_1h_Pal_Sword (C_Item)
{	
	name 				=	"Paladinschwert";  //NUR PALADIN 

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_PalSchwert;

	damageTotal  		= 	Damage_PalSchwert;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_PalSchwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_PalSchwert;
	visual 				=	"ItMw_030_1h_PAL_Sword_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_1h_Pal_Sword_Geschaerft (C_Item)
{	
	name 				=	"Paladinschwert (geschärft)";  //NUR PALADIN 

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_PalSchwert;

	damageTotal  		= 	Damage_PalSchwert + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_PalSchwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_PalSchwert;
	visual 				=	"ItMw_030_1h_PAL_Sword_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
INSTANCE ItMw_2h_Pal_Sword (C_Item)
{	
	name 				=	"Paladin-Zweihänder";  //NUR PALADIN 

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_PalZweihaender;

	damageTotal  		= 	Damage_PalZweihaender;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_PalZweihaender;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_PalZweihaender;
	visual 				=	"ItMw_040_2h_PAL_Sword_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_2h_Pal_Sword_Geschaerft (C_Item)
{	
	name 				=	"Paladin-Zweihänder (geschärft)";  //NUR PALADIN 

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_PalZweihaender;

	damageTotal  		= 	Damage_PalZweihaender + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_PalZweihaender;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_PalZweihaender;
	visual 				=	"ItMw_040_2h_PAL_Sword_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
// *****************************************************
// ************************************
// Ork- und Echsenmenschenwaffen
// -----------------------------
// ACHTUNG: Orkwaffen können auch schon 
// in Kapitel 1 erlangt werden!
// ************************************
INSTANCE ItMw_2H_OrcAxe_01 (C_Item)
{	
	name 				=	"Krush Pach";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Orkaxt_01;

	damageTotal			= 	Damage_Orkaxt_01;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Orkaxt_01;		

	cond_atr[2]   		=   ATR_STRENGTH;
	cond_value[2]  		=   Condition_Orkaxt_01;
	visual 				=	"ItMw_2H_OrcAxe_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_2H_OrcAxe_01_Geschaerft (C_Item)
{	
	name 				=	"Krush Pach (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Orkaxt_01;

	damageTotal			= 	Damage_Orkaxt_01 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Orkaxt_01;		

	cond_atr[2]   		=   ATR_STRENGTH;
	cond_value[2]  		=   Condition_Orkaxt_01;
	visual 				=	"ItMw_2H_OrcAxe_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_2H_OrcAxe_02 (C_Item)
{	
	name 				=	"Krush UrRok";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Orkaxt_02;

	damageTotal			= 	Damage_Orkaxt_02;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Orkaxt_02;		

	cond_atr[2]   		=  	ATR_STRENGTH;
	cond_value[2]  		=  	Condition_Orkaxt_02;
	visual 				=	"ItMw_2H_OrcAxe_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_2H_OrcAxe_02_Geschaerft (C_Item)
{	
	name 				=	"Krush UrRok (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Orkaxt_02;

	damageTotal			= 	Damage_Orkaxt_02 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Orkaxt_02;		

	cond_atr[2]   		=  	ATR_STRENGTH;
	cond_value[2]  		=  	Condition_Orkaxt_02;
	visual 				=	"ItMw_2H_OrcAxe_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_2H_OrcAxe_03 (C_Item)
{	
	name 				=	"Krush Agash";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Orkaxt_03;

	damageTotal			= 	Damage_Orkaxt_03;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Orkaxt_03;		

	cond_atr[2]   		=   ATR_STRENGTH;
	cond_value[2]  		=   Condition_Orkaxt_03;
	visual 				= "ItMw_2H_OrcAxe_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_2H_OrcAxe_03_Geschaerft (C_Item)
{	
	name 				=	"Krush Agash (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Orkaxt_03;

	damageTotal			= 	Damage_Orkaxt_03 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Orkaxt_03;		

	cond_atr[2]   		=   ATR_STRENGTH;
	cond_value[2]  		=   Condition_Orkaxt_03;
	visual 				= "ItMw_2H_OrcAxe_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_2H_OrcAxe_04 (C_Item)
{	
	name 				=	"Krush BrokDar";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Orkaxt_04;

	damageTotal			= 	Damage_Orkaxt_04;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Orkaxt_04;		

	cond_atr[2]   		=   ATR_STRENGTH;
	cond_value[2]  		=   Condition_Orkaxt_04;
	visual 				=	"ItMw_2H_OrcAxe_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_2H_OrcAxe_04_Geschaerft (C_Item)
{	
	name 				=	"Krush BrokDar (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Orkaxt_04;

	damageTotal			= 	Damage_Orkaxt_04 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Orkaxt_04;		

	cond_atr[2]   		=   ATR_STRENGTH;
	cond_value[2]  		=   Condition_Orkaxt_04;
	visual 				=	"ItMw_2H_OrcAxe_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_2H_OrcSword_01 (C_Item) // *** für Drakonier!!! ***
{	
	name 				=	"Krush Varrok"; 

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Orkschwert;

	damageTotal			= 	Damage_Orkschwert;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Orkschwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Orkschwert;
	visual 				=	"ItMw_2H_OrcSword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_2H_OrcSword_01_Geschaerft (C_Item) // *** für Drakonier!!! ***
{	
	name 				=	"Krush Varrok (geschärft)"; 

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Orkschwert;

	damageTotal			= 	Damage_Orkschwert + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Orkschwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Orkschwert;
	visual 				=	"ItMw_2H_OrcSword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_2H_OrcSword_02 (C_Item) // *** für Orcritter!!! ***
{	
	name 				=	"Orkisches Kriegschwert"; 

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Orkschwert_01;

	damageTotal			= 	Damage_Orkschwert_01;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Orkschwert_01;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Orkschwert_01;
	visual 				=	"ItMw_2H_OrcSword_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_2H_OrcSword_02_Geschaerft (C_Item) // *** für Orcritter!!! ***
{	
	name 				=	"Orkisches Kriegschwert (geschärft)"; 

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Orkschwert_01;

	damageTotal			= 	Damage_Orkschwert_01 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Orkschwert_01;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Orkschwert_01;
	visual 				=	"ItMw_2H_OrcSword_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/

// *******************
// Kapitel 1 - Händler
// *******************
INSTANCE ItMw_ShortSword3 (C_Item)
{	
	name 				=	"Kurzschwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_ShortSword3;

	damageTotal  		= 	Damage_ShortSword3;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_ShortSword3;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_ShortSword3;
	visual 				=	"ItMw_016_1h_Sword_short_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_ShortSword3_Geschaerft (C_Item)
{	
	name 				=	"Kurzschwert (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_ShortSword3;

	damageTotal  		= 	Damage_ShortSword3 + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_ShortSword3;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_ShortSword3;
	visual 				=	"ItMw_016_1h_Sword_short_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Nagelkeule (C_Item)
{	
	name 				=	"Nagelkeule";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Nagelkeule;

	damageTotal  		= 	Damage_Nagelkeule;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Nagelkeule;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Nagelkeule;
	visual 				=	"ItMw_018_1h_Mace_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_ShortSword4 (C_Item)
{	
	name 				=	"Wolfszahn";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_ShortSword4;

	damageTotal  		= 	Damage_ShortSword4;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_ShortSword4;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_ShortSword4;
	visual 				=	"ItMw_020_1h_Sword_short_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_ShortSword4_Geschaerft (C_Item)
{	
	name 				=	"Wolfszahn (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_ShortSword4;

	damageTotal  		= 	Damage_ShortSword4 + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_ShortSword4;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_ShortSword4;
	visual 				=	"ItMw_020_1h_Sword_short_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Kriegskeule (C_Item)
{	
	name 				=	"Kriegskeule";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Kriegskeule;

	damageTotal  		= 	Damage_Kriegskeule;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Kriegskeule;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Kriegskeule;
	visual 				=	"ItMw_022_1h_mace_war_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Richtstab (C_Item)
{	
	name 				=	"Richtstab";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	Value_Richtstab;

	damageTotal  		= 	Damage_Richtstab;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Richtstab;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Richtstab;
	visual 				=	"ItMw_025_2h_Staff_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Richtstab_Geschaerft (C_Item)
{	
	name 				=	"Richtstab (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	Value_Richtstab;

	damageTotal  		= 	Damage_Richtstab + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Richtstab;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Richtstab;
	visual 				=	"ItMw_025_2h_Staff_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_ShortSword5 (C_Item)
{	
	name 				=	"edles Kurzschwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_ShortSword5;

	damageTotal  		= 	Damage_ShortSword5;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_ShortSword5;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_ShortSword5;
	visual 				=	"ItMw_025_1h_Sword_short_05.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_ShortSword5_Geschaerft (C_Item)
{	
	name 				=	"edles Kurzschwert (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_ShortSword5;

	damageTotal  		= 	Damage_ShortSword5 + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_ShortSword5;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_ShortSword5;
	visual 				=	"ItMw_025_1h_Sword_short_05.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Kriegshammer1 (C_Item) 
{	
	name 				=	"Kriegshammer";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Kriegshammer1;

	damageTotal			= 	Damage_Kriegshammer1;
	damagetype			=	DAM_BLUNT;
	range    			=  	Range_Kriegshammer1;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Kriegshammer1;
	visual 				=	"ItMw_028_1h_warhammer_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Hellebarde (C_Item) 
{	
	name 				=	"Hellebarde";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Hellebarde;

	damageTotal			= 	Damage_Hellebarde;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Hellebarde;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Hellebarde;
	visual 				=	"itmw_028_2h_halberd_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Hellebarde_Geschaerft (C_Item) 
{	
	name 				=	"Hellebarde (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Hellebarde;

	damageTotal			= 	Damage_Hellebarde + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Hellebarde;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Hellebarde;
	visual 				=	"itmw_028_2h_halberd_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Nagelkeule2 (C_Item)
{	
	name 				=	"Schwere Nagelkeule";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Nagelkeule2;

	damageTotal  		= 	Damage_Nagelkeule2;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Nagelkeule2;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Nagelkeule2;
	visual 				=	"ItMw_018_1h_Mace_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Schiffsaxt (C_Item)
{	
	name 				=	"Schiffsaxt";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Schiffsaxt;

	damageTotal  		= 	Damage_Schiffsaxt;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Schiffsaxt;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schiffsaxt;
	visual 				=	"ItMw_030_1h_axe_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Schiffsaxt_Geschaerft (C_Item)
{	
	name 				=	"Schiffsaxt (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Schiffsaxt;

	damageTotal  		= 	Damage_Schiffsaxt + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Schiffsaxt;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schiffsaxt;
	visual 				=	"ItMw_030_1h_axe_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Piratensaebel (C_Item)
{	
	name 				=	"Piratensäbel";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Piratensaebel;

	damageTotal  		= 	Damage_Piratensaebel;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Piratensaebel;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Piratensaebel;
	visual 				=	"ItMw_030_1h_sword_03.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Piratensaebel_Geschaerft (C_Item)
{	
	name 				=	"Piratensäbel (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Piratensaebel;

	damageTotal  		= 	Damage_Piratensaebel + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Piratensaebel;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Piratensaebel;
	visual 				=	"ItMw_030_1h_sword_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_Piratensaebel_Greg (C_Item)
{	
	name 				=	"Gregs alter Piratensäbel";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD | ITEM_SHOW;	
	material 			=	MAT_METAL;

	value 				=	Value_Piratensaebel / 2;

	damageTotal  		= 	Damage_Piratensaebel / 2;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Piratensaebel - 40;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Piratensaebel - 10;
	visual 				=	"ItMw_030_1h_sword_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_Piratensaebel_Greg_Gut (C_Item)
{	
	name 				=	"Gregs Piratensäbel";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Piratensaebel;

	damageTotal  		= 	Damage_Piratensaebel;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Piratensaebel;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Piratensaebel;
	visual 				=	"ItMw_030_1h_sword_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Schwert (C_Item)
{	
	name 				=	"Grobes Langschwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert;

	damageTotal  		= 	Damage_Schwert;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Schwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert;
	visual 				=	"ItMw_030_1h_sword_long_01.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Schwert_Geschaerft (C_Item)
{	
	name 				=	"Grobes Langschwert (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert;

	damageTotal  		= 	Damage_Schwert + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Schwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert;
	visual 				=	"ItMw_030_1h_sword_long_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_HakonSchwert_01 (C_Item)
{	
	name 				=	"Grobes Langschwert von Hakon";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD | ITEM_SHOW;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert;

	damageTotal  		= 	Damage_Schwert;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Schwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert;
	visual 				=	"ItMw_030_1h_sword_long_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_HakonSchwert_02 (C_Item)
{	
	name 				=	"Grobes Langschwert von Hakon";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert;

	damageTotal  		= 	180;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Schwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert;
	visual 				=	"ItMw_030_1h_sword_long_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// ****************************
// Schmieden Kapitel 1 (Common)
// ****************************
INSTANCE ItMw_1H_Common_01 (C_Item) 
{	
	name 				=	NAME_ItMw_1H_Common_01;

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Common1;

	damageTotal			= 	Damage_Common1;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Common1;	

	on_equip			=	Equip_1H_05;
	on_unequip			=	UnEquip_1H_05;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Common1;
	visual 				=	"ItMw_030_1h_Common_Sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_05;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_1H_Common_01_Geschaerft (C_Item) 
{	
	name 				=	"Schwert (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Common1;

	damageTotal			= 	Damage_Common1 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Common1;	

	on_equip			=	Equip_1H_05;
	on_unequip			=	UnEquip_1H_05;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Common1;
	visual 				=	"ItMw_030_1h_Common_Sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_05;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_1H_Common_01_Stark (C_Item) 
{	
	name 				=	NAME_ItMw_1H_Common_01;

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Common1;

	damageTotal			= 	(Damage_Common1 * 3) / 2;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Common1;	

	on_equip			=	Equip_1H_05;
	on_unequip			=	UnEquip_1H_05;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Common1;
	visual 				=	"ItMw_030_1h_Common_Sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_05;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_1H_Common_01_Stark_Geschaerft (C_Item) 
{	
	name 				=	"Schwert (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Common1;

	damageTotal			= 	((Damage_Common1 * 3) / 2) + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Common1;	

	on_equip			=	Equip_1H_05;
	on_unequip			=	UnEquip_1H_05;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Common1;
	visual 				=	"ItMw_030_1h_Common_Sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_05;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_1H_Common_01_Bonus (C_Item) 
{	
	name 				=	NAME_ItMw_1H_Common_01;

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Common1;

	damageTotal			= 	Damage_Common1;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Common1;	

	on_equip			=	Equip_1H_10;
	on_unequip			=	UnEquip_1H_10;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Common1;
	visual 				=	"ItMw_030_1h_Common_Sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_1H_Common_01_Bonus_Geschaerft (C_Item) 
{	
	name 				=	"Schwert (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Common1;

	damageTotal			= 	Damage_Common1 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Common1;	

	on_equip			=	Equip_1H_10;
	on_unequip			=	UnEquip_1H_10;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Common1;
	visual 				=	"ItMw_030_1h_Common_Sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_1H_Common_01_BonusMeisterschmied (C_Item) 
{	
	name 				=	NAME_ItMw_1H_Common_01;

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Common1;

	damageTotal			= 	Damage_Common1 + 20;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Common1;	

	on_equip			=	Equip_1H_10;
	on_unequip			=	UnEquip_1H_10;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Common1;
	visual 				=	"ItMw_030_1h_Common_Sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_1H_Common_01_BonusMeisterschmied_Geschaerft (C_Item) 
{	
	name 				=	"Schwert (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Common1;

	damageTotal			= 	Damage_Common1 + 20 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Common1;	

	on_equip			=	Equip_1H_10;
	on_unequip			=	UnEquip_1H_10;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Common1;
	visual 				=	"ItMw_030_1h_Common_Sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_1H_Common_01_Meisterschmied (C_Item) 
{	
	name 				=	NAME_ItMw_1H_Common_01;

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Common1;

	damageTotal			= 	Damage_Common1 + 20;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Common1;	

	on_equip			=	Equip_1H_05;
	on_unequip			=	UnEquip_1H_05;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Common1;
	visual 				=	"ItMw_030_1h_Common_Sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_05;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_1H_Common_01_Meisterschmied_Geschaerft (C_Item) 
{	
	name 				=	"Schwert (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Common1;

	damageTotal			= 	Damage_Common1 + 20 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Common1;	

	on_equip			=	Equip_1H_05;
	on_unequip			=	UnEquip_1H_05;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Common1;
	visual 				=	"ItMw_030_1h_Common_Sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_05;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_1H_Common_01_StarkBonus (C_Item) 
{	
	name 				=	NAME_ItMw_1H_Common_01;

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Common1;

	damageTotal			= 	(Damage_Common1 * 3) / 2;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Common1;	

	on_equip			=	Equip_1H_10;
	on_unequip			=	UnEquip_1H_10;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Common1;
	visual 				=	"ItMw_030_1h_Common_Sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_1H_Common_01_StarkBonus_Geschaerft (C_Item) 
{	
	name 				=	"Schwert (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Common1;

	damageTotal			= 	((Damage_Common1 * 3) / 2) + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Common1;	

	on_equip			=	Equip_1H_10;
	on_unequip			=	UnEquip_1H_10;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Common1;
	visual 				=	"ItMw_030_1h_Common_Sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_1H_Common_01_StarkBonusMeisterschmied (C_Item) 
{	
	name 				=	NAME_ItMw_1H_Common_01;

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Common1;

	damageTotal			= 	((Damage_Common1 + 20) * 3) / 2;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Common1;	

	on_equip			=	Equip_1H_10;
	on_unequip			=	UnEquip_1H_10;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Common1;
	visual 				=	"ItMw_030_1h_Common_Sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_1H_Common_01_StarkBonusMeisterschmied_Geschaerft (C_Item) 
{	
	name 				=	"Schwert (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Common1;

	damageTotal			= 	(((Damage_Common1 + 20) * 3) / 2) + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Common1;	

	on_equip			=	Equip_1H_10;
	on_unequip			=	UnEquip_1H_10;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Common1;
	visual 				=	"ItMw_030_1h_Common_Sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_1H_Common_01_StarkMeisterschmied (C_Item) 
{	
	name 				=	NAME_ItMw_1H_Common_01;

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Common1;

	damageTotal			= 	((Damage_Common1 + 20) * 3) / 2;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Common1;	

	on_equip			=	Equip_1H_05;
	on_unequip			=	UnEquip_1H_05;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Common1;
	visual 				=	"ItMw_030_1h_Common_Sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_05;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_1H_Common_01_StarkMeisterschmied_Geschaerft (C_Item) 
{	
	name 				=	"Schwert (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Common1;

	damageTotal			= 	(((Damage_Common1 + 20) * 3) / 2) + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Common1;	

	on_equip			=	Equip_1H_05;
	on_unequip			=	UnEquip_1H_05;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Common1;
	visual 				=	"ItMw_030_1h_Common_Sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_05;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_HaradSchwert (C_Item) 
{	
	name 				=	"Harads Schwert";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD|ITEM_SHOW;	
	material 			=	MAT_METAL;

	value 				=	0;

	damageTotal			= 	25;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Common1;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	15;
	visual 				=	"ItMw_030_1h_Common_Sword_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// *******************
// Kapitel 2 - Händler
// *******************
INSTANCE ItMw_Stabkeule (C_Item) 
{	
	name 				=	"Stabkeule";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Stabkeule;

	damageTotal			= 	Damage_Stabkeule;
	damagetype			=	DAM_BLUNT;
	range    			=  	Range_Stabkeule;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Stabkeule;
	visual 				=	"ItMw_032_2h_staff_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Zweihaender1 (C_Item) 
{	
	name 				=	"Leichter Zweihänder";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Zweihaender1;

	damageTotal			= 	Damage_Zweihaender1;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Zweihaender1;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Zweihaender1;
	visual 				=	"ItMw_032_2h_sword_light_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Zweihaender1_Geschaerft (C_Item) 
{	
	name 				=	"Leichter Zweihänder (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Zweihaender1;

	damageTotal			= 	Damage_Zweihaender1 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Zweihaender1;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Zweihaender1;
	visual 				=	"ItMw_032_2h_sword_light_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_2H_Sword_Light_01 (C_Item) 
{	
	name 				=	"Leichter Zweihänder";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Zweihaender1;

	damageTotal			= 	Damage_Zweihaender1;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Zweihaender1;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Zweihaender1;
	visual 				=	"ItMw_032_2h_sword_light_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_2H_Sword_Light_01_Geschaerft (C_Item) 
{	
	name 				=	"Leichter Zweihänder (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Zweihaender1;

	damageTotal			= 	Damage_Zweihaender1 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Zweihaender1;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Zweihaender1;
	visual 				=	"ItMw_032_2h_sword_light_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Steinbrecher (C_Item)
{	
	name 				=	"Steinbrecher";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Steinbrecher;

	damageTotal  		= 	Damage_Steinbrecher;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Steinbrecher;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Steinbrecher;
	visual 				=	"ItMw_035_1h_mace_war_02.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Spicker (C_Item)
{	
	name 				=	"Schädelspicker";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Spicker;

	damageTotal  		= 	Damage_Spicker;
	damagetype 			=	DAM_BLUNT;	//Point Schaden führt direkt zum Tod!!
	range    			=  	Range_Spicker;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Spicker;
	visual 				=	"ItMw_035_1h_mace_03.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Streitaxt1 (C_Item) 
{	
	name 				=	"Leichte Streitaxt";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Streitaxt1;

	damageTotal			= 	Damage_Streitaxt1;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Streitaxt1;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Streitaxt1;
	visual 				=	"ItMw_035_2h_Axe_light_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Streitaxt1_Geschaerft (C_Item) 
{	
	name 				=	"Leichte Streitaxt (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Streitaxt1;

	damageTotal			= 	Damage_Streitaxt1 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Streitaxt1;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Streitaxt1;
	visual 				=	"ItMw_035_2h_Axe_light_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Schwert1 (C_Item)
{	
	name 				=	"Edles Schwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert1;

	damageTotal  		= 	Damage_Schwert1;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Schwert1;		

	on_equip			=	Equip_1H_05;
	on_unequip			=	UnEquip_1H_05;
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert1;
	visual 				=	"ItMw_035_1h_Sword_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_05;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Schwert1_Geschaerft (C_Item)
{	
	name 				=	"Edles Schwert (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert1;

	damageTotal  		= 	Damage_Schwert1 + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Schwert1;		

	on_equip			=	Equip_1H_05;
	on_unequip			=	UnEquip_1H_05;
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert1;
	visual 				=	"ItMw_035_1h_Sword_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_05;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Schwert1_Stark (C_Item)
{	
	name 				=	"Edles Schwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert1;

	damageTotal  		= 	(Damage_Schwert1 * 3) / 2;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Schwert1;		

	on_equip			=	Equip_1H_05;
	on_unequip			=	UnEquip_1H_05;
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert1;
	visual 				=	"ItMw_035_1h_Sword_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_05;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Schwert1_Stark_Geschaerft (C_Item)
{	
	name 				=	"Edles Schwert (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert1;

	damageTotal  		= 	((Damage_Schwert1 * 3) / 2) + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Schwert1;		

	on_equip			=	Equip_1H_05;
	on_unequip			=	UnEquip_1H_05;
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert1;
	visual 				=	"ItMw_035_1h_Sword_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_05;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Schwert1_Bonus (C_Item)
{	
	name 				=	"Edles Schwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert1;

	damageTotal  		= 	Damage_Schwert1;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Schwert1;		

	on_equip			=	Equip_1H_10;
	on_unequip			=	UnEquip_1H_10;
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert1;
	visual 				=	"ItMw_035_1h_Sword_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Schwert1_Bonus_Geschaerft (C_Item)
{	
	name 				=	"Edles Schwert (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert1;

	damageTotal  		= 	Damage_Schwert1 + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Schwert1;		

	on_equip			=	Equip_1H_10;
	on_unequip			=	UnEquip_1H_10;
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert1;
	visual 				=	"ItMw_035_1h_Sword_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Schwert1_BonusMeisterschmied (C_Item)
{	
	name 				=	"Edles Schwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert1;

	damageTotal  		= 	Damage_Schwert1 + 20;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Schwert1;		

	on_equip			=	Equip_1H_10;
	on_unequip			=	UnEquip_1H_10;
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert1;
	visual 				=	"ItMw_035_1h_Sword_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Schwert1_BonusMeisterschmied_Geschaerft (C_Item)
{	
	name 				=	"Edles Schwert (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert1;

	damageTotal  		= 	Damage_Schwert1 + 20 + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Schwert1;		

	on_equip			=	Equip_1H_10;
	on_unequip			=	UnEquip_1H_10;
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert1;
	visual 				=	"ItMw_035_1h_Sword_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Schwert1_Meisterschmied (C_Item)
{	
	name 				=	"Edles Schwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert1;

	damageTotal  		= 	Damage_Schwert1 + 20;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Schwert1;		

	on_equip			=	Equip_1H_05;
	on_unequip			=	UnEquip_1H_05;
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert1;
	visual 				=	"ItMw_035_1h_Sword_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_05;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Schwert1_Meisterschmied_Geschaerft (C_Item)
{	
	name 				=	"Edles Schwert (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert1;

	damageTotal  		= 	Damage_Schwert1 + 20 + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Schwert1;		

	on_equip			=	Equip_1H_05;
	on_unequip			=	UnEquip_1H_05;
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert1;
	visual 				=	"ItMw_035_1h_Sword_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_05;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Schwert1_StarkBonus (C_Item)
{	
	name 				=	"Edles Schwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert1;

	damageTotal  		= 	Damage_Schwert1 + 20;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Schwert1;		

	on_equip			=	Equip_1H_10;
	on_unequip			=	UnEquip_1H_10;
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert1;
	visual 				=	"ItMw_035_1h_Sword_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Schwert1_StarkBonus_Geschaerft (C_Item)
{	
	name 				=	"Edles Schwert (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert1;

	damageTotal  		= 	Damage_Schwert1 + 20 + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Schwert1;		

	on_equip			=	Equip_1H_10;
	on_unequip			=	UnEquip_1H_10;
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert1;
	visual 				=	"ItMw_035_1h_Sword_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Schwert1_StarkMeisterschmied (C_Item)
{	
	name 				=	"Edles Schwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert1;

	damageTotal  		= 	((Damage_Schwert1 + 20) * 3) / 2;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Schwert1;		

	on_equip			=	Equip_1H_05;
	on_unequip			=	UnEquip_1H_05;
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert1;
	visual 				=	"ItMw_035_1h_Sword_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_05;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Schwert1_StarkMeisterschmied_Geschaerft (C_Item)
{	
	name 				=	"Edles Schwert (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert1;

	damageTotal  		= 	(((Damage_Schwert1 + 20) * 3) / 2) + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Schwert1;		

	on_equip			=	Equip_1H_05;
	on_unequip			=	UnEquip_1H_05;
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert1;
	visual 				=	"ItMw_035_1h_Sword_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_05;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Schwert1_StarkBonusMeisterschmied (C_Item)
{	
	name 				=	"Edles Schwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert1;

	damageTotal  		= 	((Damage_Schwert1 + 20) * 3) / 2;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Schwert1;		

	on_equip			=	Equip_1H_10;
	on_unequip			=	UnEquip_1H_10;
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert1;
	visual 				=	"ItMw_035_1h_Sword_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Schwert1_StarkBonusMeisterschmied_Geschaerft (C_Item)
{	
	name 				=	"Edles Schwert (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert1;

	damageTotal  		= 	(((Damage_Schwert1 + 20) * 3) / 2) + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Schwert1;		

	on_equip			=	Equip_1H_10;
	on_unequip			=	UnEquip_1H_10;
	
	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert1;
	visual 				=	"ItMw_035_1h_Sword_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Schwert2 (C_Item)
{	
	name 				=	"Langschwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert2;

	damageTotal  		= 	Damage_Schwert2;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Schwert2;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert2;
	visual 				=	"ItMw_037_1h_sword_long_02.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Schwert2_Geschaerft (C_Item)
{	
	name 				=	"Langschwert (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert2;

	damageTotal  		= 	Damage_Schwert2 + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Schwert2;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert2;
	visual 				=	"ItMw_037_1h_sword_long_02.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Doppelaxt (C_Item) 
{	
	name 				=	"Doppelaxt";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Doppelaxt;

	damageTotal			= 	Damage_Doppelaxt;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Doppelaxt;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Doppelaxt;
	visual 				=	"ItMw_040_1h_Axe_02.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Doppelaxt_Geschaerft (C_Item) 
{	
	name 				=	"Doppelaxt (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Doppelaxt;

	damageTotal			= 	Damage_Doppelaxt + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Doppelaxt;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Doppelaxt;
	visual 				=	"ItMw_040_1h_Axe_02.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Bartaxt (C_Item) 
{	
	name 				=	"Bartaxt";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Bartaxt;

	damageTotal			= 	Damage_Bartaxt;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Bartaxt;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Bartaxt;
	visual 				=	"ItMw_040_1h_axe_03.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Bartaxt_Geschaerft (C_Item) 
{	
	name 				=	"Bartaxt (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Bartaxt;

	damageTotal			= 	Damage_Bartaxt + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Bartaxt;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Bartaxt;
	visual 				=	"ItMw_040_1h_axe_03.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Morgenstern (C_Item)
{	
	name 				=	"Morgenstern";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_WOOD;

	value 				=	Value_Morgenstern;

	damageTotal  		= 	Damage_Morgenstern;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Morgenstern;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Morgenstern;
	visual 				=	"ItMW_045_1h_mace_04.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Schwert3 (C_Item)
{	
	name 				=	"Grobes Bastardschwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert3;

	damageTotal  		= 	Damage_Schwert3;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Schwert3;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert3;
	visual 				=	"ItMw_045_1h_Sword_Bastard_01.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Schwert3_Geschaerft (C_Item)
{	
	name 				=	"Grobes Bastardschwert (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert3;

	damageTotal  		= 	Damage_Schwert3 + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Schwert3;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert3;
	visual 				=	"ItMw_045_1h_Sword_Bastard_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Schwert4 (C_Item)
{	
	name 				=	"Edles Langschwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert4;

	damageTotal  		= 	Damage_Schwert4;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Schwert4;		

	on_equip			=	Equip_1H_06;
	on_unequip			=	UnEquip_1H_06;

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert4;
	visual 				=	"ItMw_045_1h_Sword_long_04.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_06;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Schwert4_Geschaerft (C_Item)
{	
	name 				=	"Edles Langschwert (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert4;

	damageTotal  		= 	Damage_Schwert4 + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Schwert4;		

	on_equip			=	Equip_1H_06;
	on_unequip			=	UnEquip_1H_06;

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert4;
	visual 				=	"ItMw_045_1h_Sword_long_04.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_06;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Schwert4_Stark (C_Item)
{	
	name 				=	"Edles Langschwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert4;

	damageTotal  		= 	(Damage_Schwert4 * 3) / 2;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Schwert4;		

	on_equip			=	Equip_1H_06;
	on_unequip			=	UnEquip_1H_06;

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert4;
	visual 				=	"ItMw_045_1h_Sword_long_04.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_06;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Schwert4_Stark_Geschaerft (C_Item)
{	
	name 				=	"Edles Langschwert (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert4;

	damageTotal  		= 	((Damage_Schwert4 * 3) / 2) + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Schwert4;		

	on_equip			=	Equip_1H_06;
	on_unequip			=	UnEquip_1H_06;

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert4;
	visual 				=	"ItMw_045_1h_Sword_long_04.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_06;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Schwert4_Bonus (C_Item)
{	
	name 				=	"Edles Langschwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert4;

	damageTotal  		= 	Damage_Schwert4;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Schwert4;		

	on_equip			=	Equip_1H_11;
	on_unequip			=	UnEquip_1H_11;

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert4;
	visual 				=	"ItMw_045_1h_Sword_long_04.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_11;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Schwert4_Bonus_Geschaerft (C_Item)
{	
	name 				=	"Edles Langschwert (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert4;

	damageTotal  		= 	Damage_Schwert4 + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Schwert4;		

	on_equip			=	Equip_1H_11;
	on_unequip			=	UnEquip_1H_11;

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert4;
	visual 				=	"ItMw_045_1h_Sword_long_04.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_11;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Schwert4_BonusMeisterschmied (C_Item)
{	
	name 				=	"Edles Langschwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert4;

	damageTotal  		= 	Damage_Schwert4 + 20;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Schwert4;		

	on_equip			=	Equip_1H_11;
	on_unequip			=	UnEquip_1H_11;

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert4;
	visual 				=	"ItMw_045_1h_Sword_long_04.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_11;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Schwert4_BonusMeisterschmied_Geschaerft (C_Item)
{	
	name 				=	"Edles Langschwert (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert4;

	damageTotal  		= 	Damage_Schwert4 + 20 + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Schwert4;		

	on_equip			=	Equip_1H_11;
	on_unequip			=	UnEquip_1H_11;

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert4;
	visual 				=	"ItMw_045_1h_Sword_long_04.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_11;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Schwert4_Meisterschmied (C_Item)
{	
	name 				=	"Edles Langschwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert4;

	damageTotal  		= 	Damage_Schwert4 + 20;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Schwert4;		

	on_equip			=	Equip_1H_06;
	on_unequip			=	UnEquip_1H_06;

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert4;
	visual 				=	"ItMw_045_1h_Sword_long_04.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_06;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Schwert4_Meisterschmied_Geschaerft (C_Item)
{	
	name 				=	"Edles Langschwert (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert4;

	damageTotal  		= 	Damage_Schwert4 + 20 + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Schwert4;		

	on_equip			=	Equip_1H_06;
	on_unequip			=	UnEquip_1H_06;

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert4;
	visual 				=	"ItMw_045_1h_Sword_long_04.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_06;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Schwert4_StarkBonus (C_Item)
{	
	name 				=	"Edles Langschwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert4;

	damageTotal  		= 	(Damage_Schwert4 * 3) / 2;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Schwert4;		

	on_equip			=	Equip_1H_11;
	on_unequip			=	UnEquip_1H_11;

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert4;
	visual 				=	"ItMw_045_1h_Sword_long_04.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_11;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Schwert4_StarkBonus_Geschaerft (C_Item)
{	
	name 				=	"Edles Langschwert (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert4;

	damageTotal  		= 	((Damage_Schwert4 * 3) / 2) + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Schwert4;		

	on_equip			=	Equip_1H_11;
	on_unequip			=	UnEquip_1H_11;

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert4;
	visual 				=	"ItMw_045_1h_Sword_long_04.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_11;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Schwert4_StarkMeisterschmied (C_Item)
{	
	name 				=	"Edles Langschwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert4;

	damageTotal  		= 	((Damage_Schwert4 + 20) * 3) / 2;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Schwert4;		

	on_equip			=	Equip_1H_06;
	on_unequip			=	UnEquip_1H_06;

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert4;
	visual 				=	"ItMw_045_1h_Sword_long_04.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_06;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Schwert4_StarkMeisterschmied_Geschaerft (C_Item)
{	
	name 				=	"Edles Langschwert (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert4;

	damageTotal  		= 	(((Damage_Schwert4 + 20) * 3) / 2) + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Schwert4;		

	on_equip			=	Equip_1H_06;
	on_unequip			=	UnEquip_1H_06;

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert4;
	visual 				=	"ItMw_045_1h_Sword_long_04.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_06;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Schwert4_StarkBonusMeisterschmied (C_Item)
{	
	name 				=	"Edles Langschwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert4;

	damageTotal  		= 	((Damage_Schwert4 + 20) * 3) / 2;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Schwert4;		

	on_equip			=	Equip_1H_11;
	on_unequip			=	UnEquip_1H_11;

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert4;
	visual 				=	"ItMw_045_1h_Sword_long_04.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_11;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Schwert4_StarkBonusMeisterschmied_Geschaerft (C_Item)
{	
	name 				=	"Edles Langschwert (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert4;

	damageTotal  		= 	(((Damage_Schwert4 + 20) * 3) / 2) + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	RANGE_Schwert4;		

	on_equip			=	Equip_1H_11;
	on_unequip			=	UnEquip_1H_11;

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert4;
	visual 				=	"ItMw_045_1h_Sword_long_04.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_11;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// *******************
// Schmieden Kapitel 2
// *******************
INSTANCE ItMw_1H_Special_01 (C_Item) 
{	
	name 				=	NAME_ItMw_1H_Special_01;

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Special_1H_1;
	
	damageTotal			= 	Damage_Special_1H_1;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Special_1H_1;	
	
	on_equip			=	Equip_1H_10;
	on_unequip			=	UnEquip_1H_10;
	
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Special_1H_1;
	visual 				=	"ItMw_045_1h_Sword_smith_02.3DS";

	description			= name;
	
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_1H_Special_01_Geschaerft (C_Item) 
{	
	name 				=	"Erz-Langschwert (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Special_1H_1;
	
	damageTotal			= 	Damage_Special_1H_1 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Special_1H_1;	
	
	on_equip			=	Equip_1H_10;
	on_unequip			=	UnEquip_1H_10;
	
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Special_1H_1;
	visual 				=	"ItMw_045_1h_Sword_smith_02.3DS";

	description			= name;
	
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};



/********************************************************************************/
INSTANCE ItMw_2H_Special_01 (C_Item) 
{	
	name 				=	NAME_ItMw_2H_Special_01;

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Special_2H_1;

	damageTotal			= 	Damage_Special_2H_1;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Special_2H_1;	
	
	on_equip			=	Equip_2H_10;
	on_unequip			=	UnEquip_2H_10;
	
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Special_2H_1;
	visual 				=	"ItMw_050_2h_Sword_smith_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_2H_Special_01_Geschaerft (C_Item) 
{	
	name 				=	"Erz-Zweihänder (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Special_2H_1;

	damageTotal			= 	Damage_Special_2H_1 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Special_2H_1;	
	
	on_equip			=	Equip_2H_10;
	on_unequip			=	UnEquip_2H_10;
	
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Special_2H_1;
	visual 				=	"ItMw_050_2h_Sword_smith_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// *******************
// Kapitel 3 - Händler
// *******************
INSTANCE ItMw_Rapier (C_Item) 
{	
	name 				=	"Rapier";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Rapier;

	damageTotal			= 	Damage_Rapier;
	damagetype			=	DAM_EDGE;		
	range    			=  	Range_Rapier;	

	on_equip			=	Equip_1H_08;
	on_unequip			=	UnEquip_1H_08;
	
	cond_atr[2]   		= 	ATR_DEXTERITY;  //!!!
	cond_value[2]  		= 	Condition_Rapier;
	visual 				=	"ItMw_050_1h_Sword_Rapier_01.3ds";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_08;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Rapier_Geschaerft (C_Item) 
{	
	name 				=	"Rapier (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Rapier;

	damageTotal			= 	Damage_Rapier + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;		
	range    			=  	Range_Rapier;	

	on_equip			=	Equip_1H_08;
	on_unequip			=	UnEquip_1H_08;
	
	cond_atr[2]   		= 	ATR_DEXTERITY;  //!!!
	cond_value[2]  		= 	Condition_Rapier;
	visual 				=	"ItMw_050_1h_Sword_Rapier_01.3ds";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Dex_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_08;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Rubinklinge (C_Item) 
{	
	name 				=	"Rubinklinge";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Rubinklinge;

	damageTotal			= 	Damage_Rubinklinge;
	damagetype			=	DAM_EDGE;		
	range    			=  	Range_Rubinklinge;	

	on_equip			=	Equip_1H_07;
	on_unequip			=	UnEquip_1H_07;

	cond_atr[2]   		= 	ATR_STRENGTH;  
	cond_value[2]  		= 	Condition_Rubinklinge;
	visual 				=	"ItMw_050_1h_sword_05.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_07;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Rubinklinge_Geschaerft (C_Item) 
{	
	name 				=	"Rubinklinge (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Rubinklinge;

	damageTotal			= 	Damage_Rubinklinge + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;		
	range    			=  	Range_Rubinklinge;	

	on_equip			=	Equip_1H_07;
	on_unequip			=	UnEquip_1H_07;

	cond_atr[2]   		= 	ATR_STRENGTH;  
	cond_value[2]  		= 	Condition_Rubinklinge;
	visual 				=	"ItMw_050_1h_sword_05.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_07;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Rubinklinge_Stark (C_Item) 
{	
	name 				=	"Rubinklinge";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Rubinklinge;

	damageTotal			= 	(Damage_Rubinklinge * 3) / 2;
	damagetype			=	DAM_EDGE;		
	range    			=  	Range_Rubinklinge;	

	on_equip			=	Equip_1H_07;
	on_unequip			=	UnEquip_1H_07;

	cond_atr[2]   		= 	ATR_STRENGTH;  
	cond_value[2]  		= 	Condition_Rubinklinge;
	visual 				=	"ItMw_050_1h_sword_05.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_07;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Rubinklinge_Stark_Geschaerft (C_Item) 
{	
	name 				=	"Rubinklinge (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Rubinklinge;

	damageTotal			= 	((Damage_Rubinklinge * 3) / 2) + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;		
	range    			=  	Range_Rubinklinge;	

	on_equip			=	Equip_1H_07;
	on_unequip			=	UnEquip_1H_07;

	cond_atr[2]   		= 	ATR_STRENGTH;  
	cond_value[2]  		= 	Condition_Rubinklinge;
	visual 				=	"ItMw_050_1h_sword_05.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_07;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Rubinklinge_Bonus (C_Item) 
{	
	name 				=	"Rubinklinge";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Rubinklinge;

	damageTotal			= 	Damage_Rubinklinge;
	damagetype			=	DAM_EDGE;		
	range    			=  	Range_Rubinklinge;	

	on_equip			=	Equip_1H_12;
	on_unequip			=	UnEquip_1H_12;

	cond_atr[2]   		= 	ATR_STRENGTH;  
	cond_value[2]  		= 	Condition_Rubinklinge;
	visual 				=	"ItMw_050_1h_sword_05.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_12;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Rubinklinge_Bonus_Geschaerft (C_Item) 
{	
	name 				=	"Rubinklinge (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Rubinklinge;

	damageTotal			= 	Damage_Rubinklinge + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;		
	range    			=  	Range_Rubinklinge;	

	on_equip			=	Equip_1H_12;
	on_unequip			=	UnEquip_1H_12;

	cond_atr[2]   		= 	ATR_STRENGTH;  
	cond_value[2]  		= 	Condition_Rubinklinge;
	visual 				=	"ItMw_050_1h_sword_05.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_12;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Rubinklinge_BonusMeisterschmied (C_Item) 
{	
	name 				=	"Rubinklinge";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Rubinklinge;

	damageTotal			= 	Damage_Rubinklinge + 20;
	damagetype			=	DAM_EDGE;		
	range    			=  	Range_Rubinklinge;	

	on_equip			=	Equip_1H_12;
	on_unequip			=	UnEquip_1H_12;

	cond_atr[2]   		= 	ATR_STRENGTH;  
	cond_value[2]  		= 	Condition_Rubinklinge;
	visual 				=	"ItMw_050_1h_sword_05.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_12;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Rubinklinge_BonusMeisterschmied_Geschaerft (C_Item) 
{	
	name 				=	"Rubinklinge (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Rubinklinge;

	damageTotal			= 	Damage_Rubinklinge + 20 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;		
	range    			=  	Range_Rubinklinge;	

	on_equip			=	Equip_1H_12;
	on_unequip			=	UnEquip_1H_12;

	cond_atr[2]   		= 	ATR_STRENGTH;  
	cond_value[2]  		= 	Condition_Rubinklinge;
	visual 				=	"ItMw_050_1h_sword_05.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_12;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Rubinklinge_Meisterschmied (C_Item) 
{	
	name 				=	"Rubinklinge";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Rubinklinge;

	damageTotal			= 	Damage_Rubinklinge + 20;
	damagetype			=	DAM_EDGE;		
	range    			=  	Range_Rubinklinge;	

	on_equip			=	Equip_1H_07;
	on_unequip			=	UnEquip_1H_07;

	cond_atr[2]   		= 	ATR_STRENGTH;  
	cond_value[2]  		= 	Condition_Rubinklinge;
	visual 				=	"ItMw_050_1h_sword_05.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_07;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Rubinklinge_Meisterschmied_Geschaerft (C_Item) 
{	
	name 				=	"Rubinklinge (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Rubinklinge;

	damageTotal			= 	Damage_Rubinklinge + 20 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;		
	range    			=  	Range_Rubinklinge;	

	on_equip			=	Equip_1H_07;
	on_unequip			=	UnEquip_1H_07;

	cond_atr[2]   		= 	ATR_STRENGTH;  
	cond_value[2]  		= 	Condition_Rubinklinge;
	visual 				=	"ItMw_050_1h_sword_05.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_07;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Rubinklinge_StarkBonus (C_Item) 
{	
	name 				=	"Rubinklinge";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Rubinklinge;

	damageTotal			= 	(Damage_Rubinklinge * 3) / 2;
	damagetype			=	DAM_EDGE;		
	range    			=  	Range_Rubinklinge;	

	on_equip			=	Equip_1H_12;
	on_unequip			=	UnEquip_1H_12;

	cond_atr[2]   		= 	ATR_STRENGTH;  
	cond_value[2]  		= 	Condition_Rubinklinge;
	visual 				=	"ItMw_050_1h_sword_05.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_12;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Rubinklinge_StarkBonus_Geschaerft (C_Item) 
{	
	name 				=	"Rubinklinge (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Rubinklinge;

	damageTotal			= 	((Damage_Rubinklinge * 3) / 2) + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;		
	range    			=  	Range_Rubinklinge;	

	on_equip			=	Equip_1H_12;
	on_unequip			=	UnEquip_1H_12;

	cond_atr[2]   		= 	ATR_STRENGTH;  
	cond_value[2]  		= 	Condition_Rubinklinge;
	visual 				=	"ItMw_050_1h_sword_05.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_12;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Rubinklinge_StarkMeisterschmied (C_Item) 
{	
	name 				=	"Rubinklinge";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Rubinklinge;

	damageTotal			= 	((Damage_Rubinklinge + 20) * 3) / 2;
	damagetype			=	DAM_EDGE;		
	range    			=  	Range_Rubinklinge;	

	on_equip			=	Equip_1H_07;
	on_unequip			=	UnEquip_1H_07;

	cond_atr[2]   		= 	ATR_STRENGTH;  
	cond_value[2]  		= 	Condition_Rubinklinge;
	visual 				=	"ItMw_050_1h_sword_05.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_07;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Rubinklinge_StarkMeisterschmied_Geschaerft (C_Item) 
{	
	name 				=	"Rubinklinge (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Rubinklinge;

	damageTotal			= 	(((Damage_Rubinklinge + 20) * 3) / 2) + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;		
	range    			=  	Range_Rubinklinge;	

	on_equip			=	Equip_1H_07;
	on_unequip			=	UnEquip_1H_07;

	cond_atr[2]   		= 	ATR_STRENGTH;  
	cond_value[2]  		= 	Condition_Rubinklinge;
	visual 				=	"ItMw_050_1h_sword_05.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_07;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Rubinklinge_StarkBonusMeisterschmied (C_Item) 
{	
	name 				=	"Rubinklinge";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Rubinklinge;

	damageTotal			= 	((Damage_Rubinklinge + 20) * 3) / 2;
	damagetype			=	DAM_EDGE;		
	range    			=  	Range_Rubinklinge;	

	on_equip			=	Equip_1H_12;
	on_unequip			=	UnEquip_1H_12;

	cond_atr[2]   		= 	ATR_STRENGTH;  
	cond_value[2]  		= 	Condition_Rubinklinge;
	visual 				=	"ItMw_050_1h_sword_05.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_12;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Rubinklinge_StarkBonusMeisterschmied_Geschaerft (C_Item) 
{	
	name 				=	"Rubinklinge (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Rubinklinge;

	damageTotal			= 	(((Damage_Rubinklinge + 20) * 3) / 2) + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;		
	range    			=  	Range_Rubinklinge;	

	on_equip			=	Equip_1H_12;
	on_unequip			=	UnEquip_1H_12;

	cond_atr[2]   		= 	ATR_STRENGTH;  
	cond_value[2]  		= 	Condition_Rubinklinge;
	visual 				=	"ItMw_050_1h_sword_05.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_12;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Prunkschwert (C_Item) 
{	
	name 				=	"Prunkschwert";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Rubinklinge;

	damageTotal			= 	Damage_Rubinklinge;
	damagetype			=	DAM_EDGE;		
	range    			=  	Range_Rubinklinge;	

	on_equip			=	Equip_1H_07;
	on_unequip			=	UnEquip_1H_07;

	cond_atr[2]   		= 	ATR_STRENGTH;  
	cond_value[2]  		= 	Condition_Rubinklinge;
	visual 				=	"ItMw_050_1h_sword_05.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_07;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Streitkolben (C_Item)
{	
	name 				=	"Streitkolben";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Streitkolben;

	damageTotal  		= 	Damage_Streitkolben;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Streitkolben;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Streitkolben;
	visual 				=	"ItMw_050_1h_mace_war_03.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Zweihaender2 (C_Item) 
{	
	name 				=	"Zweihänder";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Zweihaender2;

	damageTotal			= 	Damage_Zweihaender2;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Zweihaender2;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Zweihaender2;
	visual 				=	"ItMw_055_2h_sword_light_05.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Zweihaender2_Geschaerft (C_Item) 
{	
	name 				=	"Zweihänder (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Zweihaender2;

	damageTotal			= 	Damage_Zweihaender2 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Zweihaender2;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Zweihaender2;
	visual 				=	"ItMw_055_2h_sword_light_05.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Runenschwert (C_Item)
{	
	name 				=	"Runenschwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Runenschwert;

	damageTotal  		= 	Damage_Runenschwert;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Runenschwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Runenschwert;
	visual 				=	"ItMw_055_1h_sword_long_05.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Runenschwert_Geschaerft (C_Item)
{	
	name 				=	"Runenschwert (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Runenschwert;

	damageTotal  		= 	Damage_Runenschwert + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Runenschwert;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Runenschwert;
	visual 				=	"ItMw_055_1h_sword_long_05.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Rabenschnabel (C_Item)
{	
	name 				=	"Rabenschnabel";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Rabenschnabel;

	damageTotal  		= 	Damage_Rabenschnabel;
	damagetype 			=	DAM_BLUNT;
	range    			=  	Range_Rabenschnabel;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Rabenschnabel;
	visual 				=	"ItMw_058_1h_warhammer_02.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Schwert5 (C_Item)
{	
	name 				=	"Edles Bastardschwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert5;

	damageTotal  		= 	Damage_Schwert5;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Schwert5;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert5;
	visual 				=	"ItMw_058_1h_Sword_Bastard_02.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Schwert5_Geschaerft (C_Item)
{	
	name 				=	"Edles Bastardschwert (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Schwert5;

	damageTotal  		= 	Damage_Schwert5 + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Schwert5;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schwert5;
	visual 				=	"ItMw_058_1h_Sword_Bastard_02.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Inquisitor (C_Item)
{	
	name 				=	"Inquisitor";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Inquisitor;

	damageTotal  		= 	Damage_Inquisitor;
	damagetype 			=	DAM_EDGE;	//!!!
	range    			=  	Range_Inquisitor;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Inquisitor;
	visual 				=	"ItMw_060_1h_mace_war_04.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Streitaxt2 (C_Item)
{	
	name 				=	"Streitaxt";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Streitaxt2;

	damageTotal  		= 	Damage_Streitaxt2;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Streitaxt2;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Streitaxt2;
	visual 				=	"ItMw_060_2h_axe_heavy_01.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Streitaxt2_Geschaerft (C_Item)
{	
	name 				=	"Streitaxt (gschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Streitaxt2;

	damageTotal  		= 	Damage_Streitaxt2 + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Streitaxt2;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Streitaxt2;
	visual 				=	"ItMw_060_2h_axe_heavy_01.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Zweihaender3 (C_Item)
{	
	name 				=	"Runenmacht";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Zweihaender3;

	damageTotal  		= 	Damage_Zweihaender3;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Zweihaender3;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Zweihaender3;
	visual 				=	"ItMw_060_2h_sword_01.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Zweihaender3_Geschaerft (C_Item)
{	
	name 				=	"Runenmacht (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Zweihaender3;

	damageTotal  		= 	Damage_Zweihaender3 + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Zweihaender3;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Zweihaender3;
	visual 				=	"ItMw_060_2h_sword_01.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// *******************
// Schmieden Kapitel 3
// *******************
INSTANCE ItMw_1H_Special_02 (C_Item) 
{	
	name 				=	NAME_ItMw_1H_Special_02;

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Special_1H_2;

	damageTotal			= 	Damage_Special_1H_2;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Special_1H_2;	
	
	on_equip			=	Equip_1H_10;
	on_unequip			=	UnEquip_1H_10;
		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Special_1H_2;
	visual 				=	"ItMw_060_1h_Sword_smith_03.3DS";

	description			= name;
	
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_1H_Special_02_Geschaerft (C_Item) 
{	
	name 				=	"Erz-Bastardschwert (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Special_1H_2;

	damageTotal			= 	Damage_Special_1H_2 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Special_1H_2;	
	
	on_equip			=	Equip_1H_10;
	on_unequip			=	UnEquip_1H_10;
		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Special_1H_2;
	visual 				=	"ItMw_060_1h_Sword_smith_03.3DS";

	description			= name;
	
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_10;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_2H_Special_02 (C_Item) 
{	
	name 				=	NAME_ItMw_2H_Special_02;

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Special_2H_2;

	damageTotal			= 	Damage_Special_2H_2;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Special_2H_2;	
	
	on_equip			=	Equip_2H_10;
	on_unequip			=	UnEquip_2H_10;
	
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Special_2H_2;
	visual 				=	"ItMw_070_2h_Sword_smith_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_10;	
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_2H_Special_02_Geschaerft (C_Item) 
{	
	name 				=	"Schwerer Erz-Zweihänder (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Special_2H_2;

	damageTotal			= 	Damage_Special_2H_2 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Special_2H_2;	
	
	on_equip			=	Equip_2H_10;
	on_unequip			=	UnEquip_2H_10;
	
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Special_2H_2;
	visual 				=	"ItMw_070_2h_Sword_smith_03.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_2H;			COUNT[4]	= Waffenbonus_10;	
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// *******************
// Kapitel 4 - Händler
// *******************
INSTANCE ItMw_ElBastardo (C_Item)
{	
	name 				=	"El Bastardo";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_ElBastardo;

	damageTotal  		= 	Damage_ElBastardo;
	damagetype 			=	DAM_EDGE;	
	range    			=  	Range_ElBastardo;		
	
	on_equip			=	Equip_1H_08;
	on_unequip			=	UnEquip_1H_08;

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_ElBastardo;
	visual 				=	"ItMw_065_1h_sword_bastard_03.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_08;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_ElBastardo_Geschaerft (C_Item)
{	
	name 				=	"El Bastardo (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_ElBastardo;

	damageTotal  		= 	Damage_ElBastardo + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;	
	range    			=  	Range_ElBastardo;		
	
	on_equip			=	Equip_1H_08;
	on_unequip			=	UnEquip_1H_08;

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_ElBastardo;
	visual 				=	"ItMw_065_1h_sword_bastard_03.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_08;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_ElBastardo_Stark (C_Item)
{	
	name 				=	"El Bastardo";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_ElBastardo;

	damageTotal  		= 	(Damage_ElBastardo * 3) / 2;
	damagetype 			=	DAM_EDGE;	
	range    			=  	Range_ElBastardo;		
	
	on_equip			=	Equip_1H_08;
	on_unequip			=	UnEquip_1H_08;

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_ElBastardo;
	visual 				=	"ItMw_065_1h_sword_bastard_03.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_08;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_ElBastardo_Stark_Geschaerft (C_Item)
{	
	name 				=	"El Bastardo (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_ElBastardo;

	damageTotal  		= 	((Damage_ElBastardo * 3) / 2) + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;	
	range    			=  	Range_ElBastardo;		
	
	on_equip			=	Equip_1H_08;
	on_unequip			=	UnEquip_1H_08;

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_ElBastardo;
	visual 				=	"ItMw_065_1h_sword_bastard_03.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_08;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_ElBastardo_Bonus (C_Item)
{	
	name 				=	"El Bastardo";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_ElBastardo;

	damageTotal  		= 	Damage_ElBastardo;
	damagetype 			=	DAM_EDGE;	
	range    			=  	Range_ElBastardo;		
	
	on_equip			=	Equip_1H_13;
	on_unequip			=	UnEquip_1H_13;

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_ElBastardo;
	visual 				=	"ItMw_065_1h_sword_bastard_03.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_13;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_ElBastardo_Bonus_Geschaerft (C_Item)
{	
	name 				=	"El Bastardo (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_ElBastardo;

	damageTotal  		= 	Damage_ElBastardo + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;	
	range    			=  	Range_ElBastardo;		
	
	on_equip			=	Equip_1H_13;
	on_unequip			=	UnEquip_1H_13;

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_ElBastardo;
	visual 				=	"ItMw_065_1h_sword_bastard_03.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_13;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_ElBastardo_BonusMeisterschmied (C_Item)
{	
	name 				=	"El Bastardo";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_ElBastardo;

	damageTotal  		= 	Damage_ElBastardo + 20;
	damagetype 			=	DAM_EDGE;	
	range    			=  	Range_ElBastardo;		
	
	on_equip			=	Equip_1H_13;
	on_unequip			=	UnEquip_1H_13;

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_ElBastardo;
	visual 				=	"ItMw_065_1h_sword_bastard_03.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_13;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_ElBastardo_BonusMeisterschmied_Geschaerft (C_Item)
{	
	name 				=	"El Bastardo (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_ElBastardo;

	damageTotal  		= 	Damage_ElBastardo + 20 + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;	
	range    			=  	Range_ElBastardo;		
	
	on_equip			=	Equip_1H_13;
	on_unequip			=	UnEquip_1H_13;

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_ElBastardo;
	visual 				=	"ItMw_065_1h_sword_bastard_03.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_13;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_ElBastardo_StarkBonus (C_Item)
{	
	name 				=	"El Bastardo";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_ElBastardo;

	damageTotal  		= 	(Damage_ElBastardo * 3) / 2;
	damagetype 			=	DAM_EDGE;	
	range    			=  	Range_ElBastardo;		
	
	on_equip			=	Equip_1H_13;
	on_unequip			=	UnEquip_1H_13;

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_ElBastardo;
	visual 				=	"ItMw_065_1h_sword_bastard_03.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_13;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_ElBastardo_StarkBonus_Geschaerft (C_Item)
{	
	name 				=	"El Bastardo (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_ElBastardo;

	damageTotal  		= 	((Damage_ElBastardo * 3) / 2) + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;	
	range    			=  	Range_ElBastardo;		
	
	on_equip			=	Equip_1H_13;
	on_unequip			=	UnEquip_1H_13;

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_ElBastardo;
	visual 				=	"ItMw_065_1h_sword_bastard_03.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_13;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_ElBastardo_StarkMeisterschmied (C_Item)
{	
	name 				=	"El Bastardo";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_ElBastardo;

	damageTotal  		= 	((Damage_ElBastardo + 20) * 3) / 2;
	damagetype 			=	DAM_EDGE;	
	range    			=  	Range_ElBastardo;		
	
	on_equip			=	Equip_1H_08;
	on_unequip			=	UnEquip_1H_08;

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_ElBastardo;
	visual 				=	"ItMw_065_1h_sword_bastard_03.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_08;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_ElBastardo_StarkMeisterschmied_Geschaerft (C_Item)
{	
	name 				=	"El Bastardo (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_ElBastardo;

	damageTotal  		= 	(((Damage_ElBastardo + 20) * 3) / 2) + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;	
	range    			=  	Range_ElBastardo;		
	
	on_equip			=	Equip_1H_08;
	on_unequip			=	UnEquip_1H_08;

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_ElBastardo;
	visual 				=	"ItMw_065_1h_sword_bastard_03.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_08;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_ElBastardo_StarkBonusMeisterschmied (C_Item)
{	
	name 				=	"El Bastardo";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_ElBastardo;

	damageTotal  		= 	((Damage_ElBastardo + 20) * 3) / 2;
	damagetype 			=	DAM_EDGE;	
	range    			=  	Range_ElBastardo;		
	
	on_equip			=	Equip_1H_13;
	on_unequip			=	UnEquip_1H_13;

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_ElBastardo;
	visual 				=	"ItMw_065_1h_sword_bastard_03.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_13;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_ElBastardo_StarkBonusMeisterschmied_Geschaerft (C_Item)
{	
	name 				=	"El Bastardo (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_ElBastardo;

	damageTotal  		= 	(((Damage_ElBastardo + 20) * 3) / 2) + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;	
	range    			=  	Range_ElBastardo;		
	
	on_equip			=	Equip_1H_13;
	on_unequip			=	UnEquip_1H_13;

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_ElBastardo;
	visual 				=	"ItMw_065_1h_sword_bastard_03.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_13;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_ElBastardo_Meisterschmied (C_Item)
{	
	name 				=	"El Bastardo";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_ElBastardo;

	damageTotal  		= 	Damage_ElBastardo + 20;
	damagetype 			=	DAM_EDGE;	
	range    			=  	Range_ElBastardo;		
	
	on_equip			=	Equip_1H_08;
	on_unequip			=	UnEquip_1H_08;

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_ElBastardo;
	visual 				=	"ItMw_065_1h_sword_bastard_03.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_08;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_ElBastardo_Meisterschmied_Geschaerft (C_Item)
{	
	name 				=	"El Bastardo (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_ElBastardo;

	damageTotal  		= 	Damage_ElBastardo + 20 + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;	
	range    			=  	Range_ElBastardo;		
	
	on_equip			=	Equip_1H_08;
	on_unequip			=	UnEquip_1H_08;

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_ElBastardo;
	visual 				=	"ItMw_065_1h_sword_bastard_03.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4]				= NAME_ADDON_BONUS_1H;			COUNT[4]	= Waffenbonus_08;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Kriegshammer2 (C_Item)
{	
	name 				=	"Schwerer Kriegshammer";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Kriegshammer2;

	damageTotal  		= 	Damage_Kriegshammer2;
	damagetype 			=	DAM_BLUNT;	
	range    			=  	Range_Kriegshammer2;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Kriegshammer2;
	visual 				=	"ItMw_065_1h_warhammer_03.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Folteraxt (C_Item)
{	
	name 				=	"Folteraxt";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Folteraxt;

	damageTotal  		= 	Damage_Folteraxt;
	damagetype 			=	DAM_EDGE;	
	range    			=  	Range_Folteraxt;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Folteraxt;
	visual 				=	"ItMw_065_2h_greataxe_01.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Folteraxt_Geschaerft (C_Item)
{	
	name 				=	"Folteraxt (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Folteraxt;

	damageTotal  		= 	Damage_Folteraxt + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;	
	range    			=  	Range_Folteraxt;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Folteraxt;
	visual 				=	"ItMw_065_2h_greataxe_01.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Zweihaender4 (C_Item)
{	
	name 				=	"Schwerer Zweihänder";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Zweihaender4;

	damageTotal  		= 	Damage_Zweihaender4;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Zweihaender4;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Zweihaender4;
	visual 				=	"ItMw_068_2h_sword_02.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Zweihaender4_Geschaerft (C_Item)
{	
	name 				=	"Schwerer Zweihänder (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Zweihaender4;

	damageTotal  		= 	Damage_Zweihaender4 + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Zweihaender4;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Zweihaender4;
	visual 				=	"ItMw_068_2h_sword_02.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Schlachtaxt (C_Item)
{	
	name 				=	"Schlachtaxt";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Schlachtaxt;

	damageTotal  		= 	Damage_Schlachtaxt;
	damagetype 			=	DAM_EDGE;	
	range    			=  	Range_Schlachtaxt;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schlachtaxt;
	visual 				=	"ItMw_070_2h_axe_heavy_03.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Schlachtaxt_Geschaerft (C_Item)
{	
	name 				=	"Schlachtaxt (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Schlachtaxt;

	damageTotal  		= 	Damage_Schlachtaxt + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;	
	range    			=  	Range_Schlachtaxt;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Schlachtaxt;
	visual 				=	"ItMw_070_2h_axe_heavy_03.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Krummschwert (C_Item)
{	
	name 				=	"Krummschwert";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Scimitar;

	damageTotal  		= 	Damage_Scimitar;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Scimitar;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Scimitar;
	visual 				=	"ItMw_070_2h_sword_09.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Krummschwert_Geschaerft (C_Item)
{	
	name 				=	"Krummschwert (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Scimitar;

	damageTotal  		= 	Damage_Scimitar + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	Range_Scimitar;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Scimitar;
	visual 				=	"ItMw_070_2h_sword_09.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_Barbarenstreitaxt (C_Item)
{	
	name 				=	"Barbarenstreitaxt";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Barbarenstreitaxt;

	damageTotal  		= 	Damage_Barbarenstreitaxt;
	damagetype 			=	DAM_EDGE;	
	range    			=  	Range_Barbarenstreitaxt;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Barbarenstreitaxt;
	visual 				=	"ItMw_075_2h_axe_heavy_04.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Barbarenstreitaxt_Geschaerft (C_Item)
{	
	name 				=	"Barbarenstreitaxt (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Barbarenstreitaxt;

	damageTotal  		= 	Damage_Barbarenstreitaxt + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;	
	range    			=  	Range_Barbarenstreitaxt;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Barbarenstreitaxt;
	visual 				=	"ItMw_075_2h_axe_heavy_04.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/

/********************************************************************************/
// *******************
// Schmieden Kapitel 4
// *******************
/********************************************************************************/
// *******************
// Kapitel 5 - Händler
// *******************
INSTANCE ItMw_Berserkeraxt (C_Item)//Joly:Auf Dracheninsel beim Schwarzmagiernovizen
{	
	name 				=	"Berserkeraxt";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Berserkeraxt;

	damageTotal  		= 	Damage_Berserkeraxt;
	damagetype 			=	DAM_EDGE;	
	range    			=  	Range_Berserkeraxt;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Berserkeraxt;
	visual 				=	"ItMw_080_2h_axe_heavy_02.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Berserkeraxt_Geschaerft (C_Item)//Joly:Auf Dracheninsel beim Schwarzmagiernovizen
{	
	name 				=	"Berserkeraxt (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_METAL;

	value 				=	Value_Berserkeraxt;

	damageTotal  		= 	Damage_Berserkeraxt + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;	
	range    			=  	Range_Berserkeraxt;		

	cond_atr[2]   		=	ATR_STRENGTH;
	cond_value[2]  		=	Condition_Berserkeraxt;
	visual 				=	"ItMw_080_2h_axe_heavy_02.3DS";

	value 				=	damageTotal*20 + (damageTotal-cond_Value[2])*20;

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
// ************************
// Gesegnete Paladin-Waffen
// ************************
INSTANCE ItMw_1H_Blessed_01 (C_Item) 
{	
	name 				=	"Rohe Erzklinge";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD | ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	Value_Blessed_1H_1;

	damageTotal			= 	Damage_Blessed_1H_1;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Blessed_1H_1;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Blessed_1H_1;
	visual 				=	"itmw_030_1h_PAL_sword_bastard_RAW_01.3ds";

	description			= name;
	TEXT[1]				= "Bonus gegen Dämonen und Untote";		COUNT[1]	= 30;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_1H_Blessed_01_Geschaerft (C_Item) 
{	
	name 				=	"Rohe Erzklinge (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD | ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	Value_Blessed_1H_1;

	damageTotal			= 	Damage_Blessed_1H_1 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Blessed_1H_1;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Blessed_1H_1;
	visual 				=	"itmw_030_1h_PAL_sword_bastard_RAW_01.3ds";

	description			= name;
	TEXT[1]				= "Bonus gegen Dämonen und Untote";		COUNT[1]	= 30;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_1H_Blessed_02 (C_Item) 
{	
	name 				=	"Gesegnete Erzklinge";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD | ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	Value_Blessed_1H_2;

	damageTotal			= 	Damage_Blessed_1H_2;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Blessed_1H_2;	

	effect = "SPELLFX_MAGESTAFF2";

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Blessed_1H_2;
	visual 				=	"ItMw_030_1h_PAL_sword_bastard_RAW_01.3DS";

	description			= name;
	TEXT[1]				= "Bonus gegen Dämonen und Untote";		COUNT[1]	= 40;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_1H_Blessed_02_Geschaerft (C_Item) 
{	
	name 				=	"Gesegnete Erzklinge (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD | ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	Value_Blessed_1H_2;

	damageTotal			= 	Damage_Blessed_1H_2 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Blessed_1H_2;	

	effect = "SPELLFX_MAGESTAFF2";

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Blessed_1H_2;
	visual 				=	"ItMw_030_1h_PAL_sword_bastard_RAW_01.3DS";

	description			= name;
	TEXT[1]				= "Bonus gegen Dämonen und Untote";		COUNT[1]	= 40;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_1H_Blessed_03 (C_Item) 
{	
	name 				=	"Innos' Zorn";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD | ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	Value_Blessed_1H_3;

	damageTotal			= 	Damage_Blessed_1H_3;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Blessed_1H_3;	

	effect = "SPELLFX_MAGESTAFF1";

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Blessed_1H_3;
	visual 				=	"ItMw_030_1h_PAL_sword_bastard_RAW_01.3DS";

	description			= name;
	TEXT[1]				= "Bonus gegen Dämonen und Untote";		COUNT[1]	= 50;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_1H_Blessed_03_Geschaerft (C_Item) 
{	
	name 				=	"Innos' Zorn (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD | ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	Value_Blessed_1H_3;

	damageTotal			= 	Damage_Blessed_1H_3 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Blessed_1H_3;	

	effect = "SPELLFX_MAGESTAFF1";

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Blessed_1H_3;
	visual 				=	"ItMw_030_1h_PAL_sword_bastard_RAW_01.3DS";

	description			= name;
	TEXT[1]				= "Bonus gegen Dämonen und Untote";		COUNT[1]	= 50;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_2H_Blessed_01 (C_Item) 
{	
	name 				=	"Rohe Erzklinge";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Blessed_2H_1;

	damageTotal			= 	Damage_Blessed_2H_1;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Blessed_2H_1;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Blessed_2H_1;
	visual 				=	"ItMw_040_2h_PAL_sword_heavy_RAW_01.3DS";

	description			= name;
	TEXT[1]				= "Bonus gegen Dämonen und Untote";		COUNT[1]	= 30;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_2H_Blessed_01_Geschaerft (C_Item) 
{	
	name 				=	"Rohe Erzklinge (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Blessed_2H_1;

	damageTotal			= 	Damage_Blessed_2H_1 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Blessed_2H_1;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Blessed_2H_1;
	visual 				=	"ItMw_040_2h_PAL_sword_heavy_RAW_01.3DS";

	description			= name;
	TEXT[1]				= "Bonus gegen Dämonen und Untote";		COUNT[1]	= 30;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_2H_Blessed_02 (C_Item) 
{	
	name 				=	"Ordensschwert";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Blessed_2H_2;

	damageTotal			= 	Damage_Blessed_2H_2;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Blessed_2H_2;		

	effect = "SPELLFX_MAGESTAFF2";

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Blessed_2H_2;
	visual 				=	"ItMw_040_2h_PAL_sword_heavy_RAW_01.3DS";

	description			= name;
	TEXT[1]				= "Bonus gegen Dämonen und Untote";		COUNT[1]	= 40;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_2H_Blessed_02_Geschaerft (C_Item) 
{	
	name 				=	"Ordensschwert (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Blessed_2H_2;

	damageTotal			= 	Damage_Blessed_2H_2 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Blessed_2H_2;		

	effect = "SPELLFX_MAGESTAFF2";

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Blessed_2H_2;
	visual 				=	"ItMw_040_2h_PAL_sword_heavy_RAW_01.3DS";

	description			= name;
	TEXT[1]				= "Bonus gegen Dämonen und Untote";		COUNT[1]	= 40;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/
INSTANCE ItMw_2H_Blessed_03 (C_Item) 
{	
	name 				=	"Heiliger Vollstrecker";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Blessed_2H_3;

	damageTotal			= 	Damage_Blessed_2H_3;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Blessed_2H_3;		

	effect = "SPELLFX_MAGESTAFF1";

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Blessed_2H_3;
	visual 				=	"ItMw_040_2h_PAL_sword_heavy_RAW_01.3DS";

	description			= name;
	TEXT[1]				= "Bonus gegen Dämonen und Untote";		COUNT[1]	= 50;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_2H_Blessed_03_Geschaerft (C_Item) 
{	
	name 				=	"Heiliger Vollstrecker (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;	
	material 			=	MAT_METAL;

	value 				=	Value_Blessed_2H_3;

	damageTotal			= 	Damage_Blessed_2H_3 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	Range_Blessed_2H_3;		

	effect = "SPELLFX_MAGESTAFF1";

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	Condition_Blessed_2H_3;
	visual 				=	"ItMw_040_2h_PAL_sword_heavy_RAW_01.3DS";

	description			= name;
	TEXT[1]				= "Bonus gegen Dämonen und Untote";		COUNT[1]	= 50;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
/********************************************************************************/