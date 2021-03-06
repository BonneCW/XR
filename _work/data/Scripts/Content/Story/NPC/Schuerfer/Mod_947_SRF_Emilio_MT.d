instance Mod_947_SRF_Emilio_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Emilio";
	guild 		= GIL_NONE;
	id 			= 947;
	voice		= 0;
	flags      	= 0;
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_2h_Axe_L_01);
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_P_NormalBart01, BodyTex_P, ITAR_Prisoner);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_947;
};
FUNC VOID Rtn_Start_947()
{
	TA_Sit_Bench 	 (02,00,11,00,"BL_INN_01_BENCH");
	TA_Sit_Bench 	 (11,00,02,00,"BL_INN_01_BENCH");
};