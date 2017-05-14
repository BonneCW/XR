instance Mod_1538_WKR_Wasserkrieger_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Wasserkrieger; 	
	guild 		= GIL_nov;
	id 			= 1538;
	voice		= 0;																
	npctype		= NPCTYPE_nw_wasserkrieger;
	
	// ------ Aivars ------
	aivar[AIV_NewsOverride] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Adanosschwert);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_L_Jackal, BodyTex_L, ITAR_WKR_H);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 60); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1538;
};

FUNC VOID Rtn_Start_1538 ()
{	
	TA_Smalltalk		(08,00,22,00,"WP_SMALLTALK_WASSERKRIEGER");
    TA_Smalltalk		(22,00,08,00,"WP_SMALLTALK_WASSERKRIEGER");
};

FUNC VOID Rtn_Gefangen_1538 ()
{
	TA_Sit_Campfire	(08,00,23,00,"NW_TROLLAREA_PORTAL_KDWWAIT_04");
	TA_Sit_Campfire	(23,00,08,00,"NW_TROLLAREA_PORTAL_KDWWAIT_04");
};

FUNC VOID Rtn_Sammeln_1538 ()
{
	TA_Stand_WP	(08,00,23,00,"TAVERNE");
    TA_Stand_WP	(23,00,08,00,"TAVERNE");
};

FUNC VOID Rtn_Balrog_1538 ()
{
	TA_RunToWP	(08,00,23,00,"WP_ADANOS_BALROG");
    TA_RunToWP	(23,00,08,00,"WP_ADANOS_BALROG");
};

FUNC VOID Rtn_Gigant_1538 ()
{
	TA_RunToWP	(08,00,23,00,"NW_TO_PASS_01");
    TA_RunToWP	(23,00,08,00,"NW_TO_PASS_01");
};
