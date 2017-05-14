instance Mod_7500_DMB_Olof_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Dämonenbeschwörer"; 
	guild 		= GIL_KDF;
	id 			= 7500;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																								
	EquipItem	(self, ItMW_BeliarStab);
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Lefty, BodyTex_N, ITAR_Xardas);
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 65); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7500;
};

FUNC VOID Rtn_Start_7500()
{
	TA_Sit_Chair	(08,00,23,00,"PALTOBURGRECHTS_1_2");
	TA_Sleep	(23,00,08,00,"PALTOBURGRECHTSOBEN_9");	
};
