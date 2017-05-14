instance Mod_7504_KDS_Torran_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Schwarzmagier"; 
	guild 		= GIL_KDF;
	id 			= 7504;
	voice		= 0;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_OldMan_Gravo, BodyTex_P, SCHWARZMAGIERROBE);
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 45); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7504;
};

FUNC VOID Rtn_Start_7504()
{
	TA_Stand_ArmsCrossed	(08,00,23,00,"PALTOBURGRECHTS_1_6");
	TA_Sleep		(23,00,07,00,"PALTOBURGRECHTSOBEN_10");	
};
