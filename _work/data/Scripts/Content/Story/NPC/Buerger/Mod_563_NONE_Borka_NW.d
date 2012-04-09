INSTANCE Mod_563_NONE_Borka_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Borka"; 
	guild 		= GIL_NONE;
	id 			= 563;
	voice 		= 11;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_Zweihaender); 
	
	
	// ------ Inventory ------
	CreateInvItems (self, ItMi_Joint, 20);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_L_Ian, BodyTex_L,ITAR_Vlk_L );	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_563;
};

FUNC VOID Rtn_Start_563()
{	
	TA_Stand_ArmsCrossed		(07,00,05,00,"NW_CITY_HABOUR_PUFF_ENTRANCE");
	TA_Sit_Chair		(05,00,07,00,"NW_CITY_HABOUR_TAVERN01_08");
};

FUNC VOID Rtn_Erpresser_563()
{	
	TA_Stand_ArmsCrossed		(01,00,23,00,"NW_CITY_HABOUR_PUFF_ENTRANCE");
    TA_Stand_ArmsCrossed		(23,00,01,00,"NW_CITY_PATH_HABOUR_16_01");
};

FUNC VOID Rtn_FleeToBordell_563()
{	
	TA_FleeToWP		(08,00,22,00,"NW_CITY_HABOUR_PUFF_ENTRANCE");
    TA_FleeToWP		(22,00,08,00,"NW_CITY_HABOUR_PUFF_ENTRANCE");
};