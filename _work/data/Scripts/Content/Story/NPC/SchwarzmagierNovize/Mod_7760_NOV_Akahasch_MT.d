INSTANCE Mod_7760_NOV_Akahasch_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Akahasch";
	guild 		= GIL_KDF;
	id 			= 7760;
	voice 		= 24;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_1h_Nov_Mace); 
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;																	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_NormalBart_Riordian, BodyTex_P, ITAR_NOV_DMB_01);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 25); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7760;
};

FUNC VOID Rtn_Start_7760 ()
{	
	TA_Sit_Bench	(08,00,20,00,"PALTOBURGRECHTS_11");
	TA_Sit_Bench	(20,00,08,00,"PALTOBURGRECHTS_11");
};