instance Mod_1536_WKR_Roka_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Roka";	
	guild 		= GIL_nov;
	id 			= 1536;
	voice 		= 11;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self,2);																	
	aivar[AIV_ToughGuy]		= TRUE;	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_strong;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Adanosschwert);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self,ItKe_City_Tower_03,1);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_N_NormalBart03, BodyTex_N, ITAR_WKR_H);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1536;
};

FUNC VOID Rtn_Start_1536 ()
{	
	TA_Stand_Drinking		(07,00,20,00,"AMBOSS");
    TA_Stand_Eating			(20,00,07,00,"AMBOSS");
};

FUNC VOID Rtn_Gefangen_1536 ()
{
	TA_Sit_Campfire	(08,00,23,00,"NW_TROLLAREA_PORTAL_KDWWAIT_04");
	TA_Sit_Campfire	(23,00,08,00,"NW_TROLLAREA_PORTAL_KDWWAIT_04");
};

FUNC VOID Rtn_Sammeln_1536 ()
{
	TA_Stand_WP	(08,00,23,00,"TAVERNE");
    TA_Stand_WP	(23,00,08,00,"TAVERNE");
};

FUNC VOID Rtn_Balrog_1536 ()
{
	TA_RunToWP	(08,00,23,00,"WP_ADANOS_BALROG");
    TA_RunToWP	(23,00,08,00,"WP_ADANOS_BALROG");
};

FUNC VOID Rtn_Gigant_1536 ()
{
	TA_RunToWP	(08,00,23,00,"NW_TO_PASS_01");
    TA_RunToWP	(23,00,08,00,"NW_TO_PASS_01");
};