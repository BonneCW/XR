instance Mod_1537_WKR_Vanas_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Vanas";	
	guild 		= GIL_nov;
	id 			= 1537;
	voice 		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Adanosschwert);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_L_Tough01, BodyTex_L, ITAR_WKR_H);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1537;
};

FUNC VOID Rtn_Start_1537()
{	
	TA_Smalltalk	(01,00,03,00,"WP_SMALLTALK_WASSERKRIEGER");
	TA_Smalltalk	(03,00,05,00,"WP_SMALLTALK_WASSERKRIEGER");
};

FUNC VOID Rtn_Gefangen_1537 ()
{
	TA_Sit_Campfire	(08,00,23,00,"NW_TROLLAREA_PORTAL_KDWWAIT_04");
	TA_Sit_Campfire	(23,00,08,00,"NW_TROLLAREA_PORTAL_KDWWAIT_04");
};

FUNC VOID Rtn_Sammeln_1537 ()
{
	TA_Stand_WP	(08,00,23,00,"TAVERNE");
    TA_Stand_WP	(23,00,08,00,"TAVERNE");
};

FUNC VOID Rtn_Balrog_1537 ()
{
	TA_RunToWP	(08,00,23,00,"WP_ADANOS_BALROG");
    TA_RunToWP	(23,00,08,00,"WP_ADANOS_BALROG");
};

FUNC VOID Rtn_Gigant_1537 ()
{
	TA_RunToWP	(08,00,23,00,"NW_TO_PASS_01");
    TA_RunToWP	(23,00,08,00,"NW_TO_PASS_01");
};
