instance Mod_7044_RIT_Ritter_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Ritter;
	guild 		= GIL_PAL;
	id 			= 7044;
	voice 		= 9;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Schwert_02);
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_NormalBart03, BodyTex_N, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 80); 
		
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7044;
};

	
FUNC VOID Rtn_Start_7044 ()
{
	TA_Sit_Bench	(08,00,23,00,"OW_SAWHUT_MOLERAT_MOVEMENT6");
    TA_Sit_Bench	(23,00,08,00,"OW_SAWHUT_MOLERAT_MOVEMENT6");	
};

FUNC VOID Rtn_ToVM_7044 ()
{	
	TA_Follow_Player		(08,00,21,00,"OW_PATH_1_16");
	TA_Follow_Player		(21,00,08,00,"OW_PATH_1_16");
};

FUNC VOID Rtn_AtVM_7044 ()
{	
	TA_Stand_ArmsCrossed		(08,00,21,00,"OW_PATH_1_16");
	TA_Stand_ArmsCrossed		(21,00,08,00,"OW_PATH_1_16");
};
