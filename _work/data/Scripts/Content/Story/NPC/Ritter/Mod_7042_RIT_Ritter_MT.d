instance Mod_7042_RIT_Ritter_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Ritter;
	guild 		= GIL_PAL;
	id 			= 7042;
	voice 		= 4;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_P_Tough_Torrez, BodyTex_P, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 80); 
		
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7042;
};

	
FUNC VOID Rtn_Start_7042 ()
{
	TA_Practice_Sword	(08,00,23,00,"OW_SAWHUT_MOLERAT_MOVEMENT6");
    TA_Practice_Sword	(23,00,08,00,"OW_SAWHUT_MOLERAT_MOVEMENT6");	
};

FUNC VOID Rtn_ToVM_7042 ()
{	
	TA_Follow_Player		(08,00,21,00,"OW_PATH_1_16");
	TA_Follow_Player		(21,00,08,00,"OW_PATH_1_16");
};

FUNC VOID Rtn_AtVM_7042 ()
{	
	TA_Stand_ArmsCrossed		(08,00,21,00,"OW_PATH_1_16");
	TA_Stand_ArmsCrossed		(21,00,08,00,"OW_PATH_1_16");
};
