instance Mod_7650_OUT_Botschek_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Botschek";
	guild 		= GIL_OUT;
	id 			= 7650;
	voice 		= 16;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------														
	//EquipItem			(self, ItMw_1h_Bau_Mace);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------															
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_OldBald_Jeremiah, BodyTex_N, ITAR_BARKEEPER);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 70); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7650;
};

FUNC VOID Rtn_Start_7650 ()
{
	TA_Stand_Guarding	(04,35,19,00,"REL_MOOR_146");
	TA_Cook_Stove		(19,00,21,05,"REL_MOOR_146");
	TA_Stand_Drinking	(21,05,02,30,"REL_MOOR_146");
	TA_Cook_Stove		(02,30,04,35,"REL_MOOR_146");
};