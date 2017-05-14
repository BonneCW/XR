instance Mod_1535_WKR_Wasserkrieger_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_Wasserkrieger;	
	guild 		= GIL_nov;
	id 			= 1535;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_nw_wasserkrieger;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Adanosschwert);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart10, BodyTex_N, ITAR_WKR_H);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1535;
};

FUNC VOID Rtn_Start_1535()
{	
	TA_Practice_Sword	(07,00,20,58,"NW_TROLLAREA_RUINS_06");
    TA_Practice_Sword		(20,58,07,00,"NW_TROLLAREA_RUINS_06");
};

FUNC VOID Rtn_Sammeln_1535 ()
{
	TA_Stand_WP	(08,00,23,00,"TAVERNE");
    TA_Stand_WP	(23,00,08,00,"TAVERNE");
};

FUNC VOID Rtn_Balrog_1535 ()
{
	TA_RunToWP	(08,00,23,00,"WP_ADANOS_BALROG");
    TA_RunToWP	(23,00,08,00,"WP_ADANOS_BALROG");
};

FUNC VOID Rtn_Gigant_1535 ()
{
	TA_RunToWP	(08,00,23,00,"NW_TO_PASS_01");
    TA_RunToWP	(23,00,08,00,"NW_TO_PASS_01");
};
