INSTANCE Xeres_01	(Npc_Default)
{
	//----- Monster ----
	name							=	"Xeres";
	guild							=	GIL_DMT;
	id			= 	1234;
	voice		= 0;
	level							=	40;
	npctype		= NPCTYPE_FRIEND;
	flags       = 2;

	//----- Attribute ----	
	attribute	[ATR_STRENGTH]		=	100; //+ 105 Waffe
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
	fight_tactic	=	FAI_HUMAN_MASTER;	
	
	EquipItem	(self, Xeres_Schwert);

	B_SetFightSkills	(self, 60);

	Mdl_SetVisual		(self,	"HumanS.mds");
	//Mdl_ApplyOverlayMds 	(self,	"humans_skeleton.mds"); //FIXME s.Skeleton.
	//									Body-Mesh		Body-Tex	Skin-Color	Head-MMS	Head-Tex	Teeth-Tex	ARMOR
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", 179, 0, ITAR_Xeres);

	daily_routine	=	Rtn_Start_1234;
};

FUNC VOID Rtn_Start_1234()
{
	TA_Sit_Throne	(08,00,20,00,"WP_ORC_XERES_SIT_THRONE");
	TA_Sit_Throne	(20,00,08,00,"WP_ORC_XERES_SIT_THRONE");
};

FUNC VOID Rtn_Flieht_1234()
{
	TA_Stand_ArmsCrossed	(08,00,20,00,"TOT");
	TA_Stand_ArmsCrossed	(20,00,08,00,"TOT");
};