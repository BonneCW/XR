INSTANCE Mod_7761_SNOV_Novize_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_Novize;
	guild 		= GIL_OUT;
	id 			= 7761;
	voice		= 0;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_1h_sNov_Mace);

	CreateInvItems	(self, ItMi_Joint, 5);
	CreateInvItems	(self, ItFo_KWine, 12);															
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal04, BodyTex_N, ITAR_NOV_DMB_01);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 25); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7761;
};

FUNC VOID Rtn_Start_7761 ()
{	
	TA_Sit_Campfire		(23,00,07,00,"NW_PATH_TO_MONASTERY_01_02");
	TA_Sit_Campfire		(07,00,23,00,"NW_PATH_TO_MONASTERY_01_02");
};

FUNC VOID Rtn_Flucht_7761 ()
{	
	TA_FleeToWP		(23,00,07,00,"NW_RITUALFOREST_CAVE_09");
	TA_FleeToWP		(07,00,23,00,"NW_RITUALFOREST_CAVE_09");
};

FUNC VOID Rtn_Tot_7761 ()
{	
	TA_RunToWP		(23,00,07,00,"TOT");
	TA_RunToWP		(07,00,23,00,"TOT");
};