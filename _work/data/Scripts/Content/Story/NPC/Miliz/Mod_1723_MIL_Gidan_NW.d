instance Mod_1723_MIL_Gidan_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Gidan";
	guild 		= GIL_PAL;
	id 			= 1723;
	voice		= 0;
	flags      	= 0;
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);
	aivar[AIV_ToughGuy] 			= TRUE;

	attribute[ATR_STRENGTH] = 25;
	attribute[ATR_HITPOINTS_MAX] = 160;
	attribute[ATR_HITPOINTS] = 160;
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_ShortSword2);
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 	
	
	// ------ visuals ------	
	if (Kapitel < 2)
	{																	
		B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_L_NormalBart01, BodyTex_L, ITAR_Leather_L);	
	}
	else
	{			
		B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_L_NormalBart01, BodyTex_L, ITAR_Mil_L);
	};
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 20); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_1723;
};
FUNC VOID Rtn_Start_1723()
{
	TA_Stand_WP 	(02,00,10,00,"NW_CITY_HABOUR_KASERN_AROMRY_ENTRY");
	TA_Stand_WP 	(10,00,02,00,"NW_CITY_HABOUR_KASERN_AROMRY_ENTRY");
};

FUNC VOID Rtn_Turnier_1723()
{
	TA_RunToWP		(08,00,22,00,"NW_CITY_HABOUR_KASERN_CENTRE_03");
	TA_RunToWP		(22,00,08,00,"NW_CITY_HABOUR_KASERN_CENTRE_03");
};

FUNC VOID Rtn_Sauer_1723()
{
	TA_Stand_Drinking		(08,00,22,00,"NW_CITY_TAVERN_IN_04");
	TA_Stand_Drinking		(22,00,08,00,"NW_CITY_TAVERN_IN_04");
};

FUNC VOID Rtn_Andre_1723()
{
	TA_Stand_WP		(08,00,22,00,"NW_CITY_HABOUR_KASERN_MAIN_01");
	TA_Stand_WP		(22,00,08,00,"NW_CITY_HABOUR_KASERN_MAIN_01");
};

FUNC VOID Rtn_Away_1723()
{
	TA_Stand_WP		(08,00,22,00,"TOT");
	TA_Stand_WP		(22,00,08,00,"TOT");
};

FUNC VOID Rtn_Golem_1723()
{
	TA_Stand_WP		(08,00,22,00,"NW_TAVERN_TO_FOREST_05");
	TA_Stand_WP		(22,00,08,00,"NW_TAVERN_TO_FOREST_05");
};

FUNC VOID Rtn_Unterwegs_1723()
{
	TA_Stand_WP		(08,00,22,00,"NW_CITY_TO_LIGHTHOUSE_16");
	TA_Stand_WP		(22,00,08,00,"NW_CITY_TO_LIGHTHOUSE_16");
};

FUNC VOID Rtn_Guru_1723()
{
	TA_Smalltalk_Plaudern		(08,00,22,00,"NW_CITY_TO_LIGHTHOUSE_16");
	TA_Smalltalk_Plaudern		(22,00,08,00,"NW_CITY_TO_LIGHTHOUSE_16");
};

FUNC VOID Rtn_Teleport_1723()
{
	TA_Stand_WP		(08,00,22,00,"NW_LIGHTHOUSE_IN_01A");
	TA_Stand_WP		(22,00,08,00,"NW_LIGHTHOUSE_IN_01A");
};

FUNC VOID Rtn_Tot_1723()
{
	TA_Stand_WP		(08,00,22,00,"TOT");
	TA_Stand_WP		(22,00,08,00,"TOT");
};

FUNC VOID Rtn_Shadowbeast_1723()
{
	TA_Stand_WP		(08,00,22,00,"NW_FARM1_CITYWALL_FOREST_04_B");
	TA_Stand_WP		(22,00,08,00,"NW_FARM1_CITYWALL_FOREST_04_B");
};