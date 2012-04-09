INSTANCE Monster_11044_Schrat_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Dämonenschrat";	
	guild 		= GIL_OUT;
	id 			= 11044;
	voice 		= 20;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	level = 40;
	
	// ------ Attribute ------
	attribute[ATR_HITPOINTS_MAX] = 500;
	attribute[ATR_HITPOINTS] = 500;
	attribute[ATR_STRENGTH] = 250;		

	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];														
		
	// ------ Kampf-Taktik ------	
	
	
	// ------ Equippte Waffen ------																
	fight_tactic	=	FAI_HUMAN_MASTER;

	aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL;

	senses			=	SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range	=	PERC_DIST_MONSTER_ACTIVE_MAX;

	aivar[AIV_MM_FollowTime]	= FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	aivar[AIV_MM_Packhunter] 	= FALSE;

	Npc_SetToFistMode(self);
	
	// ------ Inventory ------
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic.", 219, 26, NO_ARMOR);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------	

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_11044;
};

FUNC VOID Rtn_Start_11044 ()
{	
	TA_Stand_ArmsCrossed		(08,00,22,00,"EIS_257");
	TA_Stand_ArmsCrossed		(22,00,08,00,"EIS_257");
};

FUNC VOID Rtn_Angriff_11044 ()
{	
	TA_RunToWP		(08,00,22,00,"EIS_258");
	TA_RunToWP		(22,00,08,00,"EIS_258");
};

FUNC VOID Rtn_Tot_11044 ()
{	
	TA_Stand_ArmsCrossed		(08,00,22,00,"TOT");
	TA_Stand_ArmsCrossed		(22,00,08,00,"TOT");
};