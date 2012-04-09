INSTANCE Schattenlord_999_Urnol	(Npc_Default)
{
	//----- Monster ----
	name							=	"Schattenlord Urnol";
	guild							=	GIL_DMT;
	id			= 	999;
	voice			=	14;
	level							=	100;
	npctype		= NPCTYPE_MAIN;
	flags       = 0;

	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	105; //+ 105 Waffe
	attribute	[ATR_DEXTERITY]		=	100;
	attribute	[ATR_HITPOINTS_MAX]	=	1000;
	attribute	[ATR_HITPOINTS]		=	1000;
	attribute	[ATR_MANA_MAX] 		=	200;
	attribute	[ATR_MANA] 			=	200;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	100; //hat RS!
	protection	[PROT_EDGE]			=	100;
	protection	[PROT_POINT]		=	100; 
	protection	[PROT_FIRE]			=	100;
	protection	[PROT_FLY]			=	100;
	protection	[PROT_MAGIC]		=	0;	//so lassen!
		
	//----- Damage Types ----
	damagetype 						=	DAM_EDGE;

//	damage		[DAM_INDEX_BLUNT]	=	0;
//	damage		[DAM_INDEX_EDGE]	=	0;
//	damage		[DAM_INDEX_POINT]	=	0;
//	damage		[DAM_INDEX_FIRE]	=	0;
//	damage		[DAM_INDEX_FLY]		=	0;
//	damage		[DAM_INDEX_MAGIC]	=	0;

	//----- Kampf-Taktik ----
	fight_tactic	=	FAI_HUMAN_STRONG;	
	
	EquipItem	(self,ItMw_Zweihaender2);

	Mdl_SetVisual		(self,	"HumanS.mds");
	//Mdl_ApplyOverlayMds 	(self,	"humans_skeleton.mds"); //FIXME s.Skeleton.
	//									Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	B_SetNpcVisual 		(self, MALE, "Ske_Head", 0, 0, ITAR_PAL_SKEL);

	CreateInvItems	(self, ItAt_SoulStone_Urnol, 1);
															
	B_SetFightSkills (self, 100); 

	daily_routine	=	Rtn_Start_999;
};

FUNC VOID Rtn_Start_999()
{
	TA_Sit_Throne	(08,00,20,00,"OCC_BARONS_GREATHALL_THRONE");
	TA_Sit_Throne	(20,00,08,00,"OCC_BARONS_GREATHALL_THRONE");
};

FUNC VOID Rtn_Tot_999()
{
	TA_Stand_ArmsCrossed	(08,00,20,00,"TOT");
	TA_Stand_ArmsCrossed	(20,00,08,00,"TOT");
};