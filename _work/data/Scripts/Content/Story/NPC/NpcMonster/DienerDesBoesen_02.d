INSTANCE DienerDesBoesen_02	(Npc_Default)
{
	//----- Monster ----
	name							=	"Diener des Bösen";
	guild							=	GIL_DEMON;
	id			= 	7197;
	voice		= 0;
	level							=	100;
	npctype		= NPCTYPE_MAIN;

	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	120; //+ 105 Waffe
	attribute	[ATR_DEXTERITY]		=	120;
	attribute	[ATR_HITPOINTS_MAX]	=	500;
	attribute	[ATR_HITPOINTS]		=	500;
	attribute	[ATR_MANA_MAX] 		=	200;
	attribute	[ATR_MANA] 			=	200;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

	//----- Protection ----
	protection	[PROT_BLUNT]		=	100000; //hat RS!
	protection	[PROT_EDGE]			=	100000;
	protection	[PROT_POINT]		=	150000; 
	protection	[PROT_FIRE]			=	100;
	protection	[PROT_FLY]			=	100;
	protection	[PROT_MAGIC]		=	100;	//so lassen!
		
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
	Mdl_SetVisualBody (self,	"Hum_Body_Naked0", 	19,	0,			"Hum_Head_Bald", 	208,  	0,			NO_ARMOR);

	Mdl_SetModelScale(self, 1.5, 1.5, 1.5);

	daily_routine	=	Rtn_Start_7197;
};

FUNC VOID Rtn_Start_7197()
{
	TA_Stand_ArmsCrossed	(08,00,20,00,"NW_FARM2_TAVERNCAVE1_02");
	TA_Stand_ArmsCrossed	(20,00,08,00,"NW_FARM2_TAVERNCAVE1_02");
};