INSTANCE Mod_1515_SNOV_Novize_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_Novize;
	guild 		= GIL_kdf;
	id 			= 1515;
	voice		= 0;
	flags       = 0;																	
	npctype		= NPCTYPE_nw_schwarzernovize;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_1h_sNov_Mace); 
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal06, BodyTex_N, ITAR_NOV_DMB_01);		
	Mdl_SetModelFatness	(self, -1);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 25); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1515;
};

FUNC VOID Rtn_Start_1515 ()
{	
	TA_Smalltalk		(08,00,23,00,"PALTOBURGLINKSOBEN_37");
	TA_Smalltalk		(23,00,08,00,"PALTOBURGLINKSOBEN_37");
};