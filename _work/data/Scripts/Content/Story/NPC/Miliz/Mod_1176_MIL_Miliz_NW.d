instance Mod_1176_MIL_Miliz_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_Miliz;	
	guild 		= GIL_PAL;
	id 			= 1176;
	voice 		= 7;
	flags       = 0;																
	npctype		= NPCTYPE_nw_miliz;
	
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

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1176;
};

FUNC VOID Rtn_Start_1176()
{	
	TA_Practice_Sword		(07,00,21,01,"NW_CITY_HABOUR_KASERN_CENTRE_03");
   	TA_Smalltalk			(21,01,00,00,"NW_CITY_KASERN_BARRACK02_02");
   	TA_Sleep				(00,00,07,00,"NW_CITY_BARRACK01_BED_06");
};

FUNC VOID Rtn_Kampf_1176()
{	
	TA_Stand_WP		(07,00,21,01,"NW_CITY_KASERN_BARRACK02_02");
   	TA_Smalltalk			(21,01,00,00,"NW_CITY_KASERN_BARRACK02_02");
   	TA_Sleep				(00,00,07,00,"NW_CITY_BARRACK01_BED_06");
};

FUNC VOID Rtn_Daemonisch_1176 ()
{
	TA_Stand_Eating	(08,00,23,00,"NW_CITY_TAVERN_IN_04");
	TA_Stand_Eating	(23,00,08,00,"NW_CITY_TAVERN_IN_04");	
};
