instance Mod_1893_MIL_Miliz_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_Miliz;	
	guild 		= GIL_PAL;
	id 			= 1893;
	voice 		= 7;
	flags       = 0;																
	npctype		= NPCTYPE_main;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Milizschwert);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Mordrag, BodyTex_N, ITAR_MIL_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 40); 

	CreateInvItems	(self, ItKe_ThiefGuildKey_MIS, 1);

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1893;
};

FUNC VOID Rtn_Start_1893()
{	
	TA_Stand_WP		(07,00,21,01,"NW_CITY_KANAL_16");
   	TA_Stand_WP			(21,01,07,00,"NW_CITY_KANAL_16");
};
