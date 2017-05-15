//****************************
// 	Dieses Script ist zum Testen.



var int EVT_SPINNENBAU_01_OneTime;

FUNC VOID ENTER_EVT_SPINNENBAUL_ERDBEBEN ()
{
	if (EVT_SPINNENBAU_01_OneTime == FALSE)
	{
		Wld_PlayEffect("FX_EarthQuake",  hero, hero, 0, 0, 0, FALSE );
		Snd_Play 	("Ravens_Earthquake4" );

		//****************************
		// 	Spinnen im Spinnenbau
		// 

		Wld_InsertNpc (XR_Kristallgolem, "FP_ROAM_KRISTALLGOLEM_01");
		Wld_InsertNpc (StoneGolemerz, "FP_ROAM_STONEGOLEMEZ_01");
		Wld_InsertNpc (Apfelbaum, "FP_ROAM_STONEGOLEMEZ_02");

		Wld_InsertNpc (Kristallcrawler,"FP_ROAM_KRISTALLCRAWLER_01");
		Wld_InsertNpc (Kristallcrawler,"FP_ROAM_KRISTALLCRAWLER_02");
		Wld_InsertNpc (Kristallcrawler,"FP_ROAM_KRISTALLCRAWLER_03");
		Wld_InsertNpc (Kristallcrawler,"FP_ROAM_KRISTALLCRAWLER_04");
		Wld_InsertNpc (Kristallcrawler,"FP_ROAM_KRISTALLCRAWLER_05");
		Wld_InsertNpc (Kristallcrawler,"FP_ROAM_KRISTALLCRAWLER_2");

		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_01");
		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_02");
		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_03");
		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_04");
		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_05");
		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_06");
		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_07");
		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_08");
		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_09");
		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_010");

 		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_011");
		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_012");
		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_013");
		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_014");
		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_015");
		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_016");
		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_017");
		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_018");
		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_019");
		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_020");

 		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_021");
		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_022");
		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_023");
		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_024");
		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_025");
		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_026");
		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_027");
		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_028");
		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_029");
		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_030");


		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_031");
		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_032");
		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_033");
		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_034");
		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_035");

		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_036");
		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_037");
		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_039");
		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_040");
		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_041");

		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_043");
		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_044");
		Wld_InsertNpc (Spider_01, "FP_ROAM_MINECRAWLERSPINNENBAU_045");

		Wld_InsertNpc (Spider_Queen, "FP_ROAM_MINECRAWLERSPINNEN_05");

		EVT_SPINNENBAU_01_OneTime = TRUE;
	};	
};



/******************************************************************************************/
/******Kristallgolem
/******************************************************************************************/
func void B_SetVisuals_Kristallgolem()
{
	Mdl_SetVisual			(self,	"Golem.mds");
	Mdl_ApplyOverlayMds 	(self,	"Golem_Icegolem.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Kristallgolem_body",	DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

INSTANCE XR_Kristallgolem	(Mst_Default_IceGolem)
{

	name					=	"Kristallgolem";
	guild					=	GIL_STONEGOLEM;
	aivar[AIV_MM_REAL_ID]			= 	ID_STONEGOLEM;
	level					=	55;
	
	//----- Attribute ----
	attribute	[ATR_STRENGTH]		=	225;
	attribute	[ATR_DEXTERITY]		=	25;
	attribute	[ATR_HITPOINTS_MAX]	=	450;
	attribute	[ATR_HITPOINTS]		=	450;
	attribute	[ATR_MANA_MAX] 		=	100;
	attribute	[ATR_MANA] 			=	100;
	
	//----- Protections ----
	protection	[PROT_BLUNT]		=	50000;
	protection	[PROT_EDGE]			=	160000;
	protection	[PROT_POINT]		=	210000;
	protection	[PROT_FIRE]			=	-1;
	protection	[PROT_FLY]			=	-1;
	protection	[PROT_MAGIC]		=	-1;

	B_SetVisuals_Kristallgolem();
	Npc_SetToFistMode(self);

	CreateInvItems	(self, ItMi_RockCrystal, 6);

	effect					=	"spellFX_GOLEMAUGE";
};




//##################################################
//##
//##	Steinerzgolem Golem   	
//##
//##################################################

//-------------------------------------------------------------
func void B_SetVisuals_StoneGolemerz()
{
	Mdl_SetVisual			(self,	"Golem.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Steinerzgolem_body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

INSTANCE StoneGolemerz	(Mst_Default_StoneGolem)
{
	name		=	"Kupfererzgolem";

	CreateInvItems	(self, ItMi_Metallblock, 16);

	B_SetVisuals_StoneGolemerz ();
	Npc_SetToFistMode	(self);
};



//**************************************************************
//	Apfelbaum
//**************************************************************


func void B_SetVisuals_Apfelbaum()
{
	Mdl_SetVisual			(self,"StoneGuardian.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"Apfelbaum_body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

INSTANCE Apfelbaum	(Mst_Addon_Stoneguardian)
{
	name							= "Apfelbaum";
	guild							= GIL_SUMMONEDGuardian;
	aivar[AIV_MM_REAL_ID]			= ID_SUMMONEDGuardian;
	level							=	0;	//30

	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	200;
	attribute	[ATR_DEXTERITY]		=	150;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	125000;
	protection	[PROT_EDGE]			=	75000;
	protection	[PROT_POINT]		=	125000; 
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	125;
		
	
	B_SetAttitude (self, ATT_FRIENDLY);	
	
	B_SetVisuals_Apfelbaum ();

	CreateInvItems	(self, ItFo_Apple, Hlp_Random(3)+1);
};

INSTANCE WilderApfelbaum	(Mst_Addon_Stoneguardian)
{
	name							= "Wilder Apfelbaum";
	guild							= GIL_STONEGuardian;
	aivar[AIV_MM_REAL_ID]			= ID_APFELBAUM;
	level							=	25;	//30

	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	200;
	attribute	[ATR_DEXTERITY]		=	150;
	attribute	[ATR_HITPOINTS_MAX]	=	250;
	attribute	[ATR_HITPOINTS]		=	250;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	125000;
	protection	[PROT_EDGE]			=	75000;
	protection	[PROT_POINT]		=	125000; 
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	125;	
	
	B_SetVisuals_Apfelbaum ();

	CreateInvItems	(self, ItFo_Apple, Hlp_Random(3)+1);
};

INSTANCE Apfelbaum_Botschek_01	(Mst_Addon_Stoneguardian)
{
	name							= "Apfelbaum";
	guild							= GIL_StoneGuardian;
	aivar[AIV_MM_REAL_ID]			= ID_APFELBAUM;
	level							=	20;	//30

	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	150;
	attribute	[ATR_DEXTERITY]		=	150;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	125000;
	protection	[PROT_EDGE]			=	75000;
	protection	[PROT_POINT]		=	125000; 
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	125;
		
	
	B_SetAttitude (self, ATT_FRIENDLY);	
	
	B_SetVisuals_Apfelbaum ();

	CreateInvItems	(self, ItFo_Apple, 8);
};

INSTANCE Apfelbaum_Botschek_02	(Mst_Addon_Stoneguardian)
{
	name							= "Apfelbaum";
	guild							= GIL_StoneGuardian;
	aivar[AIV_MM_REAL_ID]			= ID_APFELBAUM;
	level							=	20;	//30

	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	150;
	attribute	[ATR_DEXTERITY]		=	150;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	125000;
	protection	[PROT_EDGE]			=	75000;
	protection	[PROT_POINT]		=	125000; 
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	125;
		
	
	B_SetAttitude (self, ATT_FRIENDLY);	
	
	B_SetVisuals_Apfelbaum ();

	CreateInvItems	(self, ItFo_Apple, 7);
};

INSTANCE Apfelbaum_Botschek_03	(Mst_Addon_Stoneguardian)
{
	name							= "Apfelbaum";
	guild							= GIL_StoneGuardian;
	aivar[AIV_MM_REAL_ID]			= ID_APFELBAUM;
	level							=	20;	//30

	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	150;
	attribute	[ATR_DEXTERITY]		=	150;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	125000;
	protection	[PROT_EDGE]			=	75000;
	protection	[PROT_POINT]		=	125000; 
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	125;
		
	
	B_SetAttitude (self, ATT_FRIENDLY);	
	
	B_SetVisuals_Apfelbaum ();

	CreateInvItems	(self, ItFo_Apple, 6);
};

var int Mod_ItPl_AlterPilz_Right;
var int Mod_ItPl_AlterPilz_Anzahl;

/******************************************************************************************/
/************Besondere Pilze im Spnnenbau***************/
/******************************************************************************************/
INSTANCE ItPl_AlterPilz (C_Item)
{	
	name 				=	"Alter Steinpilz";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;	

	value 				=	Value_Mushroom_02;

	visual 				=	"AlterPilz.3DS";
	material 			=	MAT_LEATHER;
	on_state[0]			=	Use_Mushroom_02;
	scemeName			=	"FOOD";

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		
	COUNT[1]			= 	HP_Mushroom_02;
	
	TEXT[5]				= 	NAME_Value;		
	COUNT[5]			=	Value_Mushroom_02;
};

	func void Use_AlterPilz ()
	{			
		Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Mushroom_02);

		B_HealGift (0, HP_Mushroom_02*2);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS_MAX];

		B_SetEsspunkte	(25);

		if (Mod_ItPl_AlterPilz_Right == 0)
		&& (Npc_IsPlayer(self))
		{
			Mod_ItPl_AlterPilz_Right = 1;

			Mod_ItPl_AlterPilz_Anzahl = Npc_HasItems(hero, ItPl_AlterPilz);
			Npc_RemoveInvItems (hero, ItPl_AlterPilz, Mod_ItPl_AlterPilz_Anzahl);
			CreateInvItems	(hero, ItPl_AlterPilz, Mod_ItPl_AlterPilz_Anzahl);
		};
	};







