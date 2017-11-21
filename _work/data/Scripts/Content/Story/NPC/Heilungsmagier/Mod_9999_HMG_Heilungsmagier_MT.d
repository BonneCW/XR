instance Mod_9999_HMG_Heilungsmagier_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Heilungsmagier";
	guild 		= GIL_OUT;
	id 			= 9999;
	voice 		= 7;
	flags       = 2;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------			

	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	EquipItem	(self, ItMw_Heilmagierstab);
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", 189, BodyTex_N, ITAR_HEILROBE_BIG);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 65); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_9999;
};

FUNC VOID Rtn_Start_9999 ()
{	
	TA_Follow_Player	(08,00,22,00,"PSI_TEMPLE_STAIRS_1");
    TA_Follow_Player	(22,00,08,00,"PSI_TEMPLE_STAIRS_1");
};

FUNC VOID Rtn_OC_9999 ()
{
	TA_Read_Bookstand	(19,05,06,55,"OCC_CHAPEL_UPSTAIRS_RIGHT");
	TA_Read_Bookstand		(06,55,19,05,"OCC_CHAPEL_UPSTAIRS_RIGHT");
};
