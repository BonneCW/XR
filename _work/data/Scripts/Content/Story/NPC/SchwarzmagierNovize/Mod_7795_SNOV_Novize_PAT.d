instance Mod_7795_SNOV_Novize_PAT (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_Novize;	
	guild 		= GIL_OUT;
	id 			= 7795;
	voice 		= 11;
	flags       = 2;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_Beliarschwert);																
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Mordrag, BodyTex_N, ITAR_NOV_DMB_01);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7795;
};

FUNC VOID Rtn_Start_7795()
{	
	TA_Stand_Guarding	(07,00,21,01,"WP_PAT_FOKUS_02_06");
   	TA_Stand_Guarding	(21,01,00,00,"WP_PAT_FOKUS_02_06");
};