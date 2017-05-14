INSTANCE Xeres_02	(Npc_Default)
{
	//----- Monster ----
	name							=	"Xeres";
	guild							=	GIL_DMT;
	id			= 	1560;
	level							=	10000;
	voice		= 0;
	npctype		= NPCTYPE_MAIN;
	flags       = 0;

	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	250; //+ 105 Waffe
	attribute	[ATR_DEXTERITY]		=	100;
	attribute	[ATR_HITPOINTS_MAX]	=	20000;
	attribute	[ATR_HITPOINTS]		=	20000;
	attribute	[ATR_MANA_MAX] 		=	200;
	attribute	[ATR_MANA] 			=	200;

	//----- Protection ----
	protection	[PROT_BLUNT]		=	0; //hat RS!
	protection	[PROT_EDGE]			=	0;
	protection	[PROT_POINT]		=	0; 
	protection	[PROT_FIRE]			=	0;
	protection	[PROT_FLY]			=	0;
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
	fight_tactic	=	FAI_HUMAN_MASTER;	
	
	EquipItem	(self,Xeres_Schwert);

	Mdl_SetVisual		(self,	"HumanS.mds");
	//Mdl_ApplyOverlayMds 	(self,	"humans_skeleton.mds"); //FIXME s.Skeleton.
	//									Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", 179, 0, ITAR_Xeres);

	daily_routine	=	Rtn_Start_1560;
};

FUNC VOID Rtn_Start_1560()
{
	TA_Smalltalk_Plaudern	(08,00,20,00,"ARENA_03");
	TA_Smalltalk_Plaudern	(20,00,08,00,"ARENA_03");
};

FUNC VOID Rtn_Tot_1560()
{
	TA_Stand_ArmsCrossed	(08,00,20,00,"TOT");
	TA_Stand_ArmsCrossed	(20,00,08,00,"TOT");
};