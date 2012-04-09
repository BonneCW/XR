//****************************
// 	Dieses Script ist zum Testen.

var int EVT_KLOSTER_THOMAS_01_OneTime;

FUNC VOID ENTER_EVT_KLOSTER_THOMAS_ERDBEBEN ()
{
	if (EVT_KLOSTER_THOMAS_01_OneTime == FALSE)
	{
		Wld_InsertNpc 	(STANDY, 	"HUMANSTANDY");

		Wld_InsertNpc 	(Meatbug_KlosterTerrarium, 			"FP_ROAM_MEATBUGKLOSTER2");


		EVT_KLOSTER_THOMAS_01_OneTime = TRUE;
	};	
};


func void B_SetVisuals_STANDY()
{
	Mdl_SetVisual			(self,	"HumanS.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_1hST1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_2hST2.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_BowT1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_CBowT1.mds");
	Mdl_ApplyOverlayMds 	(self,	"humans_skeleton.mds");
	//								Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	Mdl_SetVisualBody		(self,	"HumanStandy_Body",		DEFAULT,	DEFAULT,	"",			DEFAULT,  	DEFAULT,	-1);
};

INSTANCE STANDY (Mst_Default_Skeleton)
{
	name							=	"Standy";
	guild							=	GIL_SUMMONED_SKELETON;
	aivar[AIV_MM_REAL_ID]			= 	ID_SUMMONED_SKELETON;
	level							=	0; //30

	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	100; //+50 Waffe
	attribute	[ATR_DEXTERITY]		=	150;
	attribute	[ATR_HITPOINTS_MAX]	=	150;
	attribute	[ATR_HITPOINTS]		=	150;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	125000;
	protection	[PROT_EDGE]			=	125000;
	protection	[PROT_POINT]		=	175000; 
	protection	[PROT_FIRE]			=	125;
	protection	[PROT_FLY]			=	125;
	
	fight_tactic	=	FAI_HUMAN_NORMAL;
	
	// ------ visual ------
	B_SetVisuals_STANDY();	

	B_SetAttitude (self, ATT_FRIENDLY); 

	start_aistate				= ZS_Stand_Sweeping;
};