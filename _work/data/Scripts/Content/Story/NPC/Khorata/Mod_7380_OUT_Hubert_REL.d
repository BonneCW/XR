instance Mod_7380_OUT_Hubert_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Hubert"; 
	guild 		= GIL_OUT;
	id 			= 7380;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------			
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_Asghan, BodyTex_N,ITAR_Vlk_H);	
	Mdl_SetModelFatness	(self,1);
	Mdl_ApplyOverlayMds	(self, "Humans_Drunken.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7380;
};

FUNC VOID Rtn_Start_7380()
{	
	TA_Stand_Drinking	(08,00,20,00,"REL_CITY_362"); 
	TA_Stand_Drinking	(20,00,08,00,"REL_CITY_362"); 
};

FUNC VOID Rtn_Rathaus_7380()
{	
	TA_Guide_Player	(08,00,20,00,"RATHAUS_01"); 
	TA_Guide_Player	(20,00,08,00,"RATHAUS_01"); 
};

FUNC VOID Rtn_Markt_7380()
{	
	TA_Guide_Player	(08,00,20,00,"REL_CITY_089"); 
	TA_Guide_Player	(20,00,08,00,"REL_CITY_089"); 
};

FUNC VOID Rtn_Nordost_7380()
{	
	TA_Guide_Player	(08,00,20,00,"REL_CITY_095"); 
	TA_Guide_Player	(20,00,08,00,"REL_CITY_095"); 
};

FUNC VOID Rtn_Magier_7380()
{	
	TA_Guide_Player	(08,00,20,00,"REL_CITY_260"); 
	TA_Guide_Player	(20,00,08,00,"REL_CITY_260"); 
};

FUNC VOID Rtn_Gericht_7380()
{	
	TA_Guide_Player	(08,00,20,00,"REL_CITY_293"); 
	TA_Guide_Player	(20,00,08,00,"REL_CITY_293"); 
};

FUNC VOID Rtn_Gasthaus_7380()
{	
	TA_Stand_Drinking	(08,00,20,00,"REL_CITY_305"); 
	TA_Stand_Drinking	(20,00,08,00,"REL_CITY_305"); 
};

FUNC VOID Rtn_Streuner_7380()
{	
	TA_Sit_Bench		(06,00,10,00,"REL_CITY_351");
	TA_Stand_Drinking	(10,00,14,00,"REL_CITY_355"); 
	TA_Sit_Bench		(14,00,18,00,"REL_CITY_299");
	TA_Stand_Drinking	(18,00,22,00,"REL_CITY_219"); 
	TA_Sit_Bench		(22,00,02,00,"REL_CITY_157");
	TA_Stand_Drinking	(02,00,06,00,"REL_CITY_349"); 
};
