instance Mod_7502_KDS_Alax_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Alax"; 
	guild 		= GIL_KDF;
	id 			= 7502;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_Asghan, BodyTex_N, SCHWARZMAGIERROBE);
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 45); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7502;
};

FUNC VOID Rtn_Start_7502()
{
	TA_Potion_Alchemy	(08,00,23,00,"PALTOBURGRECHTS_9_1");
	TA_Sleep		(23,00,07,00,"PALTOBURGLINKSOBEN_44");	
};