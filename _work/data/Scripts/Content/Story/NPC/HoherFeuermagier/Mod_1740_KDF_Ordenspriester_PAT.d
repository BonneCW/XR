instance Mod_1740_KDF_Ordenspriester_PAT (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_ordenspriester;	
	guild 		= GIL_vlk;
	id 			= 1740;
	voice 		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_pat_ordenspriester;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																			
	EquipItem	(self, ItMW_Addon_Stab01);
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_L_Tough01, BodyTex_L, ITAR_KDF_H);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 65); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1740;
};

FUNC VOID Rtn_Start_1740()
{	
	TA_Potion_Alchemy	(01,00,13,00,"WP_PAT_WEG_91");
	TA_Potion_Alchemy	(13,00,01,00,"WP_PAT_WEG_91");
};