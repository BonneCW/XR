instance Mod_7503_KDS_Hinax_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Schwarzmagier"; 
	guild 		= GIL_KDF;
	id 			= 7503;
	voice 		= 11;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																								
	EquipItem	(self, ItMW_BeliarStab);
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_NormalBart22, BodyTex_N,  SCHWARZMAGIERROBE);
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 45); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7503;
};

FUNC VOID Rtn_Start_7503()
{
	TA_Practice_Magic	(08,00,23,00,"PALTOBURGRECHTSOBEN_21");
	TA_Sleep		(23,00,07,00,"PALTOBURGRECHTSOBEN_10");	
};
