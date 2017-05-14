INSTANCE Mod_7382_OUT_Theodorus_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Theodorus"; 
	guild 		= GIL_OUT;
	id 			= 7382;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_FRIEND; //plündert nicht!!! (und ein Freischlag)
	
	// ------ AIVARs ------
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																
	EquipItem(self, ItMw_Nagelknueppel);
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self); //NICHT, Alrik soll nicht mehr Gold haben!
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Bloodwyn, BodyTex_N, ITAR_Vlk_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self,10);
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7382;
};

FUNC VOID Rtn_Start_7382()
{	
	TA_Sit_Campfire		(08,00,22,00,"REL_200");
	TA_Sit_Campfire		(22,00,08,00,"REL_200");
};

FUNC VOID Rtn_FollowInCity_7382()
{	
	TA_Follow_Player	(08,00,22,00,"RATHAUSUNENTBURGERMEISTER");
	TA_Follow_Player	(22,00,08,00,"RATHAUSUNENTBURGERMEISTER");
};

FUNC VOID Rtn_Stadthalter_7382()
{	
	TA_Sit_Throne	(08,00,23,00,"RATHAUSUNENTBURGERMEISTER");
	TA_Pick_FP	(23,00,02,00,"REL_CITY_255");
	TA_Sit_Chair	(02,00,08,00,"REL_CITY_026");
};

FUNC VOID Rtn_AtMine_7382()
{	
	TA_RunToWP	(08,00,22,00,"REL_002");
	TA_RunToWP	(22,00,08,00,"REL_002");
};

FUNC VOID Rtn_Theodorus_7382()
{	
	TA_Smalltalk_Plaudern	(08,00,22,00,"REL_CITY_002");
	TA_Smalltalk_Plaudern	(22,00,08,00,"REL_CITY_002");
};

FUNC VOID Rtn_Andre_7382 ()
{
	TA_Sit_Chair	(08,00,23,00,"REL_CITY_026");
	TA_Sit_Chair	(23,00,08,00,"REL_CITY_026");
};