instance Mod_571_NONE_Cornelius_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Cornelius";
	guild 		= GIL_NONE;		//Hoshi:Ich muss ihn umhauen können, ohne das mir die PALs auf den Sack gehen.
	id 			= 571;
	voice		= 0;
	flags       = 0; //Joly: immortal Hauptstory																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_Weak_Ulf_Wohlers, BodyTex_P, ITAR_Governor);	
	Mdl_SetModelFatness	(self, 0.9);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_571;
};

FUNC VOID Rtn_Start_571 ()
{	
	TA_Read_Bookstand	(08,00,23,00,"NW_CITY_CORNELIUS");
    TA_Read_Bookstand	(23,00,08,00,"NW_CITY_CORNELIUS");
};

FUNC VOID Rtn_Markt_571 ()
{	
	TA_Read_Bookstand	(03,00,23,00,"NW_CITY_CORNELIUS");
    TA_Stand_WP	(23,00,03,00,"NW_CITY_MERCHANT_PATH_29_B");
};

FUNC VOID Rtn_Knast_571()
{
	TA_Sit_Campfire	(08,00,20,00,"NW_CITY_HABOUR_KASERN_HALVOR");
	TA_Sit_Campfire	(20,00,08,00,"NW_CITY_HABOUR_KASERN_HALVOR");
};

FUNC VOID Rtn_Wirtschaft_571 ()
{	
	TA_Sit_Throne	(08,00,23,00,"NW_CITY_UPTOWN_JUDGE_THRONE_01");
	TA_Sit_Throne	(23,00,08,00,"NW_CITY_UPTOWN_JUDGE_THRONE_01");
};

FUNC VOID Rtn_Aufstand_571 ()
{	
	TA_Stand_Guarding	(08,00,23,00,"NW_CITY_CITYHALL_ENTRY");
	TA_Stand_Guarding	(23,00,08,00,"NW_CITY_CITYHALL_ENTRY");
};