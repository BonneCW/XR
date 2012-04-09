INSTANCE Monster_11067_Talos_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Talos";	
	guild							=	GIL_STRF;
	id 			= 11067;
	voice 		= 6;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	level = 400;
	
	// ------ Attribute ------
	attribute	[ATR_STRENGTH]		=	200;
	attribute	[ATR_DEXTERITY]		=	5;
	attribute	[ATR_HITPOINTS_MAX]	=	1000;
	attribute	[ATR_HITPOINTS]		=	1000;
	attribute	[ATR_MANA_MAX] 		=	0;
	attribute	[ATR_MANA] 			=	0;

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

	//----- Protection ----
	protection	[PROT_BLUNT]		=	300000;
	protection	[PROT_EDGE]			=	300000;
	protection	[PROT_POINT]		=	300000;
	protection	[PROT_FIRE]			=	300;
	protection	[PROT_FLY]			=	300;
	protection	[PROT_MAGIC]		=	300;																
		
	// ------ Kampf-Taktik ------	
	
	damagetype 		=	DAM_EDGE;

	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem (self, itmw_1h_bau_mace);

	CreateInvItems	(self, ItBe_Bewaehrung, 1);
	
	// ------ Inventory ------
	// Händler
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic.", 217, BodyTex_N, NO_ARMOR);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 

	Mdl_SetModelScale(self, 3.0, 2.0, 3.0);

	aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL;
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 35); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_11067;
};

FUNC VOID Rtn_Start_11067 ()
{	
	TA_Stand_Guarding		(08,00,22,00,"EISWEIDE_8");
	TA_Stand_Guarding		(22,00,08,00,"EISWEIDE_8");
};