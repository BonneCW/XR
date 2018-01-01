var C_ITEM CurrentWeapon;

//---------------------------------------------------------------------
//	Schläferschwert 1
//---------------------------------------------------------------------
INSTANCE Weltenspalter (C_Item) 
{	
	name 				=	"Weltenspalter";

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
	TEXT[0]				=	"Dies war das Schwert des untoten";
	TEXT[1]				=	"Ork-Priesters Varrag-Hashor.";
	TEXT[2]				=	"Die Waffe ist im Laufe der Jahre";
	TEXT[3]				=	"unbrauchbar geworden!";
	TEXT[4]				=	"Vielleicht ist das Schwert noch auf";
	TEXT[5]				=	"andere Art und Weise nützlich.";
};

//---------------------------------------------------------------------
//	Schläferschwert 2
//---------------------------------------------------------------------
INSTANCE Lichtbringer (C_Item) 
{	
	name 				=	"Lichtbringer";

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
	TEXT[0]				=	"Dies war das Schwert des untoten";
	TEXT[1]				=	"Ork-Priesters Varrag-Kasorg.";
	TEXT[2]				=	"Die Waffe ist im Laufe der Jahre";
	TEXT[3]				=	"unbrauchbar geworden!";
	TEXT[4]				=	"Vielleicht ist das Schwert noch auf";
	TEXT[5]				=	"andere Art und Weise nützlich.";
};

//---------------------------------------------------------------------
//	Schläferschwert 3
//---------------------------------------------------------------------
INSTANCE Zeitenklinge (C_Item) 
{	
	name 				=	"Zeitenklinge";

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
	TEXT[0]				=	"Dies war das Schwert des untoten";
	TEXT[1]				=	"Ork-Priesters Varrag-Unhilqt.";
	TEXT[2]				=	"Die Waffe ist im Laufe der Jahre";
	TEXT[3]				=	"unbrauchbar geworden!";
	TEXT[4]				=	"Vielleicht ist das Schwert noch auf";
	TEXT[5]				=	"andere Art und Weise nützlich.";
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
	name 				=	"Dämonenstreich";

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
	TEXT[0]				=	"Dies war das Schwert des untoten";
	TEXT[1]				=	"Ork-Priesters Varrag-Ruuushk.";
	TEXT[2]				=	"Die Waffe ist im Laufe der Jahre";
	TEXT[3]				=	"unbrauchbar geworden!";
	TEXT[4]				=	"Vielleicht ist das Schwert noch auf";
	TEXT[5]				=	"andere Art und Weise nützlich.";
};

//---------------------------------------------------------------------
//	Schläferschwert 5
//---------------------------------------------------------------------
INSTANCE Bannklinge (C_Item) 
{	
	name 				=	"Bannklinge";

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
	TEXT[0]				=	"Dies war das Schwert des untoten";
	TEXT[1]				=	"Ork-Hohepriesters Grash-Varrag-Arushat.";
	TEXT[2]				=	"Die Waffe ist im Laufe der Jahre";
	TEXT[3]				=	"unbrauchbar geworden!";
	TEXT[4]				=	"Vielleicht ist das Schwert noch auf";
	TEXT[5]				=	"andere Art und Weise nützlich.";
};

INSTANCE ItMw_Ritualdolch_Versengen (C_Item)
{
	name 				=	"Ritualdolch des Versengens";

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
	name 				=	"Ritualdolch des Frostes";

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
	name 				=	"Ritualdolch des Siechtums";

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
	name 				=	"Ritualdolch des Giftes";

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
	name 				=	"Ritualdolch des Blutes";

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
	name = "Feuerschwert";
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
	text[4] = "Eine magische Waffe";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_Feuerschwert_Geschaerft(C_Item)
{
	name = "Feuerschwert (geschärft)"; 
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 1500;
	damageTotal = 140+10;
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
	text[4] = "Eine magische Waffe";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_ICESWORD(C_Item)
{
	name = "Eisschwert";
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
	text[4] = "Eine magische Waffe";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITMW_ICESWORD_Geschaerft(C_Item)
{
	name = "Eisschwert (geschärft)";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = 1500;
	damageTotal = 140+10;
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
	text[4] = "Eine magische Waffe";
	text[5] = NAME_Value;
	count[5] = value;
};

INSTANCE ItMW_Sense_02 (C_Item)
{	
	name 				=	"Sense";  

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
	name 				=	"Sense (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	1000;

	damageTotal  		= 	100+10;
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
	name 				=	"Sense";  

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
	name 				=	"Sense (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	1000;

	damageTotal  		= 	100+10;
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
	name 				=	"Adanos Stab (Magieseite)";  

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
	name 				=	"Adanos Stab (Kampfseite)";  

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
	name 				=	"Adanos Stab (Bruchstück 1)";  

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
	name 				=	"Adanos Stab (Bruchstück 2)";  

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
	name 				=	"Xeres' Schwert";

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
	name 				=	"Xeres Schwert (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;
	material 			=	MAT_METAL;

	value 				=	500;

	damageTotal			= 	250+10;
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
	name 				=	"Zeusschwert";

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
	name 				=	"Zeusschwert (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	104*10;

	damageTotal			= 	115+10;
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
	name 				=	"Faustschwert";

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
	name 				=	"Lurkerklaue";

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
	name 				=	"Athos (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;	
	material 			=	MAT_METAL;

	value 				=	104*11;

	damageTotal			= 	135+10;
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
	name 				=	"Schmetteraxt";

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
	name 				=	"Schmetteraxt (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_WOOD;

	value 				=	150;//150;

	damageTotal			= 	80+10;
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
	name 				=	"Trümmeraxt";

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
	name 				=	"Trümmeraxt (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;	
	material 			=	MAT_WOOD;

	value 				=	150;//150;

	damageTotal			= 	160+10;
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
	name 				=	"Schädelbrecher";  

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
	name 				=	"Schädelbrecher (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	1000;

	damageTotal  		= 	120+10;
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
	name 				=	"Drachenaxt";  

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
	name 				=	"Drachenaxt (geschärft)";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	1000;

	damageTotal  		= 	150+10;
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
	name 				=	"Eisenklinge";

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
	name 				=	"Eisenklinge (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_SWD;
	material 			=	MAT_METAL;

	value 				=	500;

	damageTotal			= 	180+10;
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
	name 				=	"Gladius";

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
	name 				=	"Gladius (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	500;

	damageTotal			= 	50+10;
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
	name 				=	"Kurzschwert";

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
	name 				=	"Kurzschwert (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	500;

	damageTotal			= 	45+10;
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
	name 				=	"Klingendolch";

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
	name 				=	"Klingendolch (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	500;

	damageTotal			= 	50+10;
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
	name 				=	"Klauenschwert";

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
	name 				=	"Klauenschwert (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	4500;

	damageTotal			= 	150+10;
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
	name 				=	"Schütterschwert";

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
	name 				=	"Schütterschwert (geschärft)";

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_SWD;
	material 			=	MAT_METAL;

	value 				=	450;

	damageTotal			= 	92+10;
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
	name 				=	"Axt des Untergangs";  

	mainflag 			=	ITEM_KAT_NF;
	flags 				=	ITEM_2HD_AXE;
	material 			=	MAT_WOOD;

	value 				=	1000;

	damageTotal  		= 	(AxtDamage - 10) / 4 + 10;
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
	name 				=	"Bennets spezielles Schwert ";

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