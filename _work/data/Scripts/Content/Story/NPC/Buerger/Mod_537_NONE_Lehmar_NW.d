instance Mod_537_NONE_Lehmar_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Lehmar"; 
	guild 		= GIL_pal;
	id 			= 537;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_Eminem_AchillesSchwert_01); 
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self, ItKe_Lehmar, 1);
	CreateInvItems (self, ItMi_LostInnosStatue_Daron, 1);

	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Whistler, BodyTex_N,ITAR_Vlk_M);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_537;
};

FUNC VOID Rtn_Start_537()
{	
	TA_Sit_Throne		(06,30,00,30,"NW_CITY_HABOUR_HUT_08_IN_C");
	TA_Sleep		(00,30,06,30,"NW_CITY_HABOUR_HUT_08_BED_02");
};