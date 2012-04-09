INSTANCE Schattenlord_542_Urnol	(Npc_Default)
{
	//----- Monster ----
	name							=	"Schattenlord Urnol";
	guild							=	GIL_NONE;
	id			= 	542;
	voice			=	14;
	level							=	40;
	npctype		= NPCTYPE_MAIN;
	flags       = 2;

	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	105; //+ 105 Waffe
	attribute	[ATR_DEXTERITY]		=	100;
	attribute	[ATR_HITPOINTS_MAX]	=	400;
	attribute	[ATR_HITPOINTS]		=	400;
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
															
	B_SetFightSkills (self, 100); 

	daily_routine	=	Rtn_Start_542;
};

FUNC VOID Rtn_Start_542()
{
	TA_Stand_ArmsCrossed	(08,00,20,00,"NW_XARDAS_TOWER_PATH_01_B");
	TA_Stand_ArmsCrossed	(20,00,08,00,"NW_XARDAS_TOWER_PATH_01_B");
};

FUNC VOID Rtn_TOT_542 ()
{	
	TA_Sleep		(08,00,20,00,"TOT");  
	TA_Sleep		(20,00,08,00,"TOT");

};