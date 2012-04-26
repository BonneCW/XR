instance Mod_1739_KDF_Ordenspriester_PAT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Ordensalchemist";	
	guild 		= GIL_vlk;
	id 			= 1739;
	voice 		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_main;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																				
	EquipItem	(self, ItMW_Addon_Stab01);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Drax, BodyTex_N, ITAR_KDF_H);	
	Mdl_SetModelFatness	(self,-1);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 65); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1739;
};

FUNC VOID Rtn_Start_1739()
{	
	TA_Potion_Alchemy	(05,00,20,15,"WP_PAT_WEG_95");
	TA_Potion_Alchemy	(20,15,05,00,"WP_PAT_WEG_95");
};