var C_ITEM CurrentWeapon;

//---------------------------------------------------------------------
//	Schläferschwert 1
//---------------------------------------------------------------------
INSTANCE Weltenspalter (C_Item) 
{	
	name 				=	"tasak";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MISSION;
	material 			=	MAT_METAL;

	value 				=	1800;

	damageTotal			= 	90;
	damagetype			=	DAM_EDGE;
	range    			=  	140;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	visual 				=	"ItMi_SleeperKey_01.3DS";
	description			= 	name;
	TEXT[0]				=	"Byl to miecz nieumarlych";
	TEXT[1]				=	"Orc-Priest Varrag Hashor.";
	TEXT[2]				=	"Bron ta byla uzywana przez lata.";
	TEXT[3]				=	"Stan sie bezuzyteczny!";
	TEXT[4]				=	"Byc moze miecz jest nadal otwarty.";
	TEXT[5]				=	"w inny sposób.";
};

//---------------------------------------------------------------------
//	Schläferschwert 2
//---------------------------------------------------------------------
INSTANCE Lichtbringer (C_Item) 
{	
	name 				=	"miotacz";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	1800;

	damageTotal			= 	90;
	damagetype			=	DAM_EDGE;
	range    			=  	140;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	visual 				=	"ItMi_SleeperKey_01.3DS";
	description			= 	name;
	TEXT[0]				=	"Byl to miecz nieumarlych";
	TEXT[1]				=	"Orc-Priest Varrag-Kasorg.";
	TEXT[2]				=	"Bron ta byla uzywana przez lata.";
	TEXT[3]				=	"Stan sie bezuzyteczny!";
	TEXT[4]				=	"Byc moze miecz jest nadal otwarty.";
	TEXT[5]				=	"w inny sposób.";
};

//---------------------------------------------------------------------
//	Schläferschwert 3
//---------------------------------------------------------------------
INSTANCE Zeitenklinge (C_Item) 
{	
	name 				=	"ostrze czasowe";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	1800;

	damageTotal			= 	90;
	damagetype			=	DAM_EDGE;
	range    			=  	140;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;

	on_equip	=	Equip_Zeitenklinge;
	on_unequip	=	UnEquip_Zeitenklinge;	

	visual 				=	"ItMi_SleeperKey_01.3DS";
	description			= 	name;
	TEXT[0]				=	"Byl to miecz nieumarlych";
	TEXT[1]				=	"Orc-Priest Varrag-Unhilqt.";
	TEXT[2]				=	"Bron ta byla uzywana przez lata.";
	TEXT[3]				=	"Stan sie bezuzyteczny!";
	TEXT[4]				=	"Byc moze miecz jest nadal otwarty.";
	TEXT[5]				=	"w inny sposób.";
};

func void Equip_Zeitenklinge()
{
	Wld_StopEffect ("SLOW_MOTION");
	Wld_PlayEffect ("SLOW_MOTION", self, self, 0, 0, 0, FALSE);
};

func void UnEquip_Zeitenklinge()
{
	Wld_StopEffect ("SLOW_MOTION");
};

//---------------------------------------------------------------------
//	Schläferschwert 4
//---------------------------------------------------------------------
INSTANCE Daemonenstreich (C_Item) 
{	
	name 				=	"dowcip";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	1800;

	damageTotal			= 	90;
	damagetype			=	DAM_EDGE;
	range    			=  	140;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	visual 				=	"ItMi_SleeperKey_01.3DS";
	description			= 	name;
	TEXT[0]				=	"Byl to miecz nieumarlych";
	TEXT[1]				=	"Orc-Priest Varrag-Ruuushk.";
	TEXT[2]				=	"Bron ta byla uzywana przez lata.";
	TEXT[3]				=	"Stan sie bezuzyteczny!";
	TEXT[4]				=	"Byc moze miecz jest nadal otwarty.";
	TEXT[5]				=	"w inny sposób.";
};

//---------------------------------------------------------------------
//	Schläferschwert 5
//---------------------------------------------------------------------
INSTANCE Bannklinge (C_Item) 
{	
	name 				=	"brzeszczot";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD|ITEM_MISSION;	
	material 			=	MAT_METAL;

	value 				=	1800;

	damageTotal			= 	90;
	damagetype			=	DAM_EDGE;
	range    			=  	140;		
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;
	visual 				=	"ItMi_SleeperKey_01.3DS";
	description			= 	name;
	TEXT[0]				=	"Byl to miecz nieumarlych";
	TEXT[1]				=	"Ork Wysoki Ksiadz Kaplan Grash Varrag Arushat.";
	TEXT[2]				=	"Bron ta byla uzywana przez lata.";
	TEXT[3]				=	"Stan sie bezuzyteczny!";
	TEXT[4]				=	"Byc moze miecz jest nadal otwarty.";
	TEXT[5]				=	"w inny sposób.";
};

INSTANCE ItMw_Ritualdolch_Versengen (C_Item)
{
	name 				=	"Rytualny sztylet wypalajacy";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	800;

	damageTotal			= 	70;
	damagetype			=	DAM_EDGE;
	range    			=  	90;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;

	visual 				=	"Dolch_Neu.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_Ritualdolch_Frost (C_Item)
{
	name 				=	"Sztylet rytualny sztylet mrozu";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	800;

	damageTotal			= 	70;
	damagetype			=	DAM_EDGE;
	range    			=  	90;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;

	visual 				=	"Dolch_Neu.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_Ritualdolch_Seuche (C_Item)
{
	name 				=	"Sztylet rytualny slabosci";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	800;

	damageTotal			= 	70;
	damagetype			=	DAM_EDGE;
	range    			=  	90;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;

	visual 				=	"Dolch_Neu.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_Ritualdolch_Gift (C_Item)
{
	name 				=	"Sztylet rytualny trucizny";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	800;

	damageTotal			= 	70;
	damagetype			=	DAM_EDGE;
	range    			=  	90;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;

	visual 				=	"Dolch_Neu.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_Ritualdolch_Blut (C_Item)
{
	name 				=	"Sztylet rytualny krwi";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	800;

	damageTotal			= 	70;
	damagetype			=	DAM_EDGE;
	range    			=  	90;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;

	visual 				=	"Dolch_Neu.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

instance ITMW_FEUERSCHWERT(C_Item)
{
	name = "miecz pozarowy";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 1500;
	damageTotal = 140;
	damagetype = DAM_FIRE;
	range = 85;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 95;
	visual = "ItMw_055_2H_Sword_Light_05.3ds";
	effect = "SPELLFX_FIRESWORD";
	description = "Feuerschwert";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = "Czarna bron";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_Feuerschwert_Geschaerft(C_Item)
{
	name = "Miecz pozarowy (wyostrzony)"; 
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 1500;
	damageTotal = 140 + DAMAGE_BONUS_SHARPENED;
	damagetype = DAM_FIRE;
	range = 85;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 95;
	visual = "ItMw_055_2H_Sword_Light_05.3ds";
	effect = "SPELLFX_FIRESWORD";
	description = "Feuerschwert";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = "Czarna bron";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_ICESWORD(C_Item)
{
	name = "miecz lodowy";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 1500;
	damageTotal = 140;
	damagetype = DAM_MAGIC;
	range = 85;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 95;
	visual = "ItMw_055_2H_Sword_Light_05.3ds";
	effect = "SPELLFX_ICESWORD";
	description = "Eisschwert";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = "Czarna bron";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_ICESWORD_Geschaerft(C_Item)
{
	name = "Miecz lodu (wyostrzony)";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 1500;
	damageTotal = 140 + DAMAGE_BONUS_SHARPENED;
	damagetype = DAM_MAGIC;
	range = 85;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 95;
	visual = "ItMw_055_2H_Sword_Light_05.3ds";
	effect = "SPELLFX_ICESWORD";
	description = "Eisschwert";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Str_needed;
	count[3] = cond_value[2];
	text[4] = "Czarna bron";
	text[5] = NAME_Value;
	count[5] = value;
};

INSTANCE ItMW_Sense_02 (C_Item)
{	
	name 				=	"kosa";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	1000;

	damageTotal  		= 	100;
	damagetype 			=	DAM_EDGE;
	range    			=  	200;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	100;	
	
	visual 				=	"ItroX_2H_Scythe_Old.3DS";

	description			= 	name;

	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3]				= NAME_Str_Needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMW_Sense_02_Geschaerft (C_Item)
{	
	name 				=	"kosa (naostrzona)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	1000;

	damageTotal  		= 	100 + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	200;	

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	100;	
	
	visual 				=	"ItroX_2H_Scythe_Old.3DS";

	description			= 	name;

	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3]				= NAME_Str_Needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMW_Sense_03 (C_Item)
{	
	name 				=	"kosa";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	1000;

	damageTotal  		= 	100;
	damagetype 			=	DAM_EDGE;
	range    			=  	200;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	100;		
	
	visual 				=	"ItroX_2H_Scythe_War.3DS";

	description			= 	name;

	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3]				= NAME_Str_Needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMW_Sense_03_Geschaerft (C_Item)
{	
	name 				=	"kosa (naostrzona)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	1000;

	damageTotal  		= 	100 + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	200;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	100;		
	
	visual 				=	"ItroX_2H_Scythe_War.3DS";

	description			= 	name;

	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3]				= NAME_Str_Needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMW_Adanos_Stab_Magieteil (C_Item)
{	
	name 				=	"Adanos Personel (strona magiczna)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE|ITEM_SHOW;
	material 			=	MAT_WOOD;

	value 				=	1000;

	damageTotal  		= 	100;
	damagetype 			=	DAM_MAGIC;
	range    			=  	200;		
	
	visual 				=	"ItMW_Adanosstab_Magie.3DS"; 
	effect				=	"SPELLFX_MAGESTAFF3";
	
	on_equip			=	Equip_2H_Max;
	on_unequip			=	UnEquip_2H_Max;

	description			= 	name;

	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMW_Adanos_Stab_Kampfteil (C_Item)
{	
	name 				=	"Sztab Adano (po stronie walczacej)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE|ITEM_SHOW;
	material 			=	MAT_WOOD;

	value 				=	1000;

	damageTotal  		= 	100;
	damagetype 			=	DAM_MAGIC;
	range    			=  	200;		
	
	visual 				=	"ItMW_Adanosstab_Waffe.3DS"; 
	effect				=	"SPELLFX_MAGESTAFF3";
	
	on_equip			=	Equip_2H_Max;
	on_unequip			=	UnEquip_2H_Max;

	description			= 	name;

	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMW_Adanos_Stab_Teil1 (C_Item)
{	
	name 				=	"Pracownicy firmy Adanos (przerwa 1)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE|ITEM_SHOW;
	material 			=	MAT_WOOD;

	value 				=	1000;

	damageTotal  		= 	100;
	damagetype 			=	DAM_MAGIC;
	range    			=  	200;		
	
	visual 				=	"ItMi_Adanosstab_TeilOne.3DS"; 
	effect				=	"SPELLFX_MAGESTAFF3";

	description			= 	name;

	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	//TEXT[3] 			= NAME_Str_needed;				//COUNT[3]	= cond_value[2];
	//TEXT[4]				= NAME_ADDON_BONUS_2H;			//COUNT[4]	= Waffenbonus_04;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMW_Adanos_Stab_Teil2 (C_Item)
{	
	name 				=	"Pracownicy firmy Adanos (przerwa 2)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE|ITEM_SHOW;
	material 			=	MAT_WOOD;

	value 				=	1000;

	damageTotal  		= 	100;
	damagetype 			=	DAM_MAGIC;
	range    			=  	200;		
	
	visual 				=	"ItMi_Adanosstab_TeilTwo.3DS"; 
	effect				=	"SPELLFX_MAGESTAFF3";

	description			= 	name;

	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	//TEXT[3] 			= NAME_Str_needed;				//COUNT[3]	= cond_value[2];
	//TEXT[4]				= NAME_ADDON_BONUS_2H;			//COUNT[4]	= Waffenbonus_04;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE Xeres_Schwert (C_Item)
{
	name 				=	"Miecz Xe";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;
	material 			=	MAT_METAL;

	value 				=	500;

	damageTotal			= 	250;
	damagetype			=	DAM_EDGE;
	range    			=  	150;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	100;

	visual 				=	"Xeres_Schwert.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE Xeres_Schwert_Geschaerft (C_Item)
{
	name 				=	"Miecz Xeres (wyostrzony)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;
	material 			=	MAT_METAL;

	value 				=	500;

	damageTotal			= 	250 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	150;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	150;

	visual 				=	"Xeres_Schwert.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Neok_Zeusschwert_01 (C_Item)
{	
	name 				=	"zerowy miecz";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	104*10;

	damageTotal			= 	115;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	115;
	visual 				=	"ZEUS.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_1H_Neok_Zeusschwert_01_Geschaerft (C_Item)
{	
	name 				=	"Miecz zeusowy (ostrozony)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	104*10;

	damageTotal			= 	115 + DAMAGE_BONUS_SHARPENED;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	115;
	visual 				=	"ZEUS.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_Faustklaue (C_Item)
{	
	name 				=	"piesc miecza";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	104*10;

	damageTotal			= 	115;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	10;
	visual 				=	"ITROX_FAUSTSCHWERT.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_Lurkerklaue (C_Item)
{	
	name 				=	"pazur purkera";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	104*10;

	damageTotal			= 	115;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	10;
	visual 				=	"ITROX_LURKERKRALLE.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Neok_Athos_01 (C_Item)
{	
	name 				=	"Athos";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	104*11;

	damageTotal			= 	135;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	135;
	visual 				=	"ATHOS.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_1H_Neok_Athos_01_Geschaerft (C_Item)
{	
	name 				=	"Athos (utwardzony)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	104*11;

	damageTotal			= 	135 + DAMAGE_BONUS_SHARPENED;
	damagetype 			= 	DAM_EDGE;
	range    			=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	135;
	visual 				=	"ATHOS.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw2hOrcMace01 (C_Item)
{	
	name 				=	"Krush Karrok";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_WOOD;

	value 				=	50;//150;

	damageTotal			= 	75;
	damagetype			=	DAM_BLUNT;
	range    			=  	150;		

	cond_atr[2]   		=   ATR_STRENGTH;
	cond_value[2]  		=   50;
	visual 				=	"ItMw_2H_OrcMace_01.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_Schmetteraxt (C_Item)
{	
	name 				=	"siekiera motylkowa";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_WOOD;

	value 				=	150;//150;

	damageTotal			= 	80;
	damagetype			=	DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		=   ATR_STRENGTH;
	cond_value[2]  		=   100;
	visual 				=	"Schmetteraxt.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Schmetteraxt_Geschaerft (C_Item)
{	
	name 				=	"Osie motylkowe (ostrzone)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_WOOD;

	value 				=	150;//150;

	damageTotal			= 	80 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	130;		

	cond_atr[2]   		=   ATR_STRENGTH;
	cond_value[2]  		=   100;
	visual 				=	"Schmetteraxt.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_Truemmeraxt (C_Item)
{	
	name 				=	"topór szczatkowy";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_WOOD;

	value 				=	150;//150;

	damageTotal			= 	160;
	damagetype			=	DAM_BLUNT;
	range    			=  	120;		

	cond_atr[2]   		=   ATR_STRENGTH;
	cond_value[2]  		=   160;
	visual 				=	"Truemmeraxt.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Truemmeraxt_Geschaerft (C_Item)
{	
	name 				=	"Osad gruzowy (osloniety)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_WOOD;

	value 				=	150;//150;

	damageTotal			= 	160 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_BLUNT;
	range    			=  	120;		

	cond_atr[2]   		=   ATR_STRENGTH;
	cond_value[2]  		=   160;
	visual 				=	"Truemmeraxt.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMW_Schaedelbrecher (C_Item)
{	
	name 				=	"kruszarki czaszek";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	1000;

	damageTotal  		= 	120;
	damagetype 			=	DAM_EDGE;
	range    			=  	200;		
	
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	120;


	visual 				=	"Schaedelbrecher.3DS"; 
	
	description			= 	name;

	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMW_Schaedelbrecher_Geschaerft (C_Item)
{	
	name 				=	"Kruszarka do czaszki (naostrzona)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	1000;

	damageTotal  		= 	120 + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	200;		
	
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	120;


	visual 				=	"Schaedelbrecher.3DS"; 
	
	description			= 	name;

	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMW_Drachenaxt (C_Item)
{	
	name 				=	"topór smoczy";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	1000;

	damageTotal  		= 	150;
	damagetype 			=	DAM_EDGE;
	range    			=  	125;		
	
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	145;

	visual 				=	"Drachenaxt.3DS"; 
	
	description			= 	name;

	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMW_Drachenaxt_Geschaerft (C_Item)
{	
	name 				=	"Dragon Axe (ostrzony)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	1000;

	damageTotal  		= 	150 + DAMAGE_BONUS_SHARPENED;
	damagetype 			=	DAM_EDGE;
	range    			=  	125;		
	
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	145;

	visual 				=	"Drachenaxt.3DS"; 
	
	description			= 	name;

	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_1H_Eminem_Eisenklinge_02 (C_Item)
{
	name 				=	"ostrze zelazka";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;
	material 			=	MAT_METAL;

	value 				=	500;

	damageTotal			= 	180;
	damagetype			=	DAM_EDGE;
	range    			=  	150;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	150;

	visual 				=	"ItMw_1H_Eminem_Eisenklinge_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_1H_Eminem_Eisenklinge_02_Geschaerft (C_Item)
{
	name 				=	"Brzeszczot zelazowy (wyostrzony)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;
	material 			=	MAT_METAL;

	value 				=	500;

	damageTotal			= 	180 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	150;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	150;

	visual 				=	"ItMw_1H_Eminem_Eisenklinge_02.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_TwoHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_Gladius (C_Item)
{
	name 				=	"gladius";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	500;

	damageTotal			= 	50;
	damagetype			=	DAM_EDGE;
	range    			=  	90;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;

	visual 				=	"Gladius.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Gladius_Geschaerft (C_Item)
{
	name 				=	"Gladiusz (wyostrzony)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	500;

	damageTotal			= 	50 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	90;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;

	visual 				=	"Gladius.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_Kurzschwert (C_Item)
{
	name 				=	"krótki miecz";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	500;

	damageTotal			= 	45;
	damagetype			=	DAM_EDGE;
	range    			=  	90;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	28;

	visual 				=	"Kurzschwert.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Kurzschwert_Geschaerft (C_Item)
{
	name 				=	"Krótki miecz (wyostrzony)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	500;

	damageTotal			= 	45 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	90;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	28;

	visual 				=	"Kurzschwert.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_Klingendolch (C_Item)
{
	name 				=	"sztylet";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	500;

	damageTotal			= 	50;
	damagetype			=	DAM_EDGE;
	range    			=  	90;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;

	visual 				=	"Klingendolch.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Klingendolch_Geschaerft (C_Item)
{
	name 				=	"Sztylet ostrzony";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	500;

	damageTotal			= 	50 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	90;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	30;

	visual 				=	"Klingendolch.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_Klauenschwert (C_Item)
{
	name 				=	"kopyto miecz";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	4500;

	damageTotal			= 	150;
	damagetype			=	DAM_EDGE;
	range    			=  	100;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	130;

	visual 				=	"Klauenschwert.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Klauenschwert_Geschaerft (C_Item)
{
	name 				=	"Miecz ostrzony (ostry)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	4500;

	damageTotal			= 	150 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	100;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	130;

	visual 				=	"Klauenschwert.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_Schuetterschwert (C_Item)
{
	name 				=	"";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	450;

	damageTotal			= 	92;
	damagetype			=	DAM_EDGE;
	range    			=  	100;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	85;

	visual 				=	"Schuetterschwert.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};
INSTANCE ItMw_Schuetterschwert_Geschaerft (C_Item)
{
	name 				=	"Przegroda grodziowa (zaostrzona)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	450;

	damageTotal			= 	92 + DAMAGE_BONUS_SHARPENED;
	damagetype			=	DAM_EDGE;
	range    			=  	100;

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	85;

	visual 				=	"Schuetterschwert.3DS";

	description			= name;
	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 			= NAME_OneHanded;
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMW_AxtDesUntergangs (C_Item)
{	
	name 				=	"Os zguba";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	1000;

	damageTotal  		= 	(AxtDamage - 10) / 16 + 10;
	damagetype 			=	DAM_EDGE;
	range    			=  	125;		
	
	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	10;

	visual 				=	"Drachenaxt.3DS"; 
	
	description			= 	name;

	TEXT[2]				= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 			= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[5]				= NAME_Value;					COUNT[5]	= value;
};

INSTANCE ItMw_BennetGreg (C_Item)
{	
	name 				=	"Specjalny miecz Benneta ";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD | ITEM_SHOW;	
	material 			=	MAT_METAL;

	value 				=	5000;

	damageTotal			= 	140;
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
