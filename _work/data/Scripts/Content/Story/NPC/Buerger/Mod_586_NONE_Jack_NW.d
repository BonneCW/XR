instance Mod_586_NONE_Jack_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Jack";
	guild 		= GIL_NONE;
	id 			= 586;
	voice		= 0;
	flags       = 2;	//Sterblich, optionaler Captain im Kapitel 5!
	npctype		= NPCTYPE_MAIN;

	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);

	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;

	// ------ Equippte Waffen ------
	EquipItem			(self, ItMw_Degen_Jack);
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);


	// ------ visuals ------
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_ImportantOld, BodyTex_N,ITAR_Vlk_L);
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds");

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);

	// ------ Kampf-Talente ------
	B_SetFightSkills (self, 30);

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_586;
};

FUNC VOID Rtn_Start_586()
{
	TA_Sit_Throne	(08,00,20,00,"NW_LIGHTHOUSE_IN_03");
    TA_Sleep		(20,00,08,00,"NW_LIGHTHOUSE_IN_03");
};

FUNC VOID Rtn_Schiff_586()
{
	TA_Stand_Guarding	(08,00,20,00,"SHIP_CREW_CAPTAIN");
	TA_Stand_Guarding	(20,00,08,00,"SHIP_CREW_CAPTAIN");
};

FUNC VOID Rtn_Assis_586()
{
	TA_Sleep		(08,00,20,00,"NW_BIGFARM_STABLE_SLEEP_03");
	TA_Sleep		(20,00,08,00,"NW_BIGFARM_STABLE_SLEEP_03");
};

FUNC VOID Rtn_AtCity_586()
{
	TA_Sit_Bench		(08,00,20,00,"NW_CITY_HABOUR_06_C");
	TA_Stand_Drinking	(20,00,08,00,"NW_CITY_HABOUR_TAVERN01_01");
};