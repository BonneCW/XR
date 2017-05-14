instance Mod_1954_EIS_Thys_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Thys";	
	guild 		= GIL_OUT;
	id 			= 1954;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------			

	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	EquipItem	(self, ItMw_Heilmagierstab);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Snaf, BodyTex_N, ITAR_EISSCHAMANE);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1954;
};

FUNC VOID Rtn_Start_1954 ()
{	
	TA_Read_Bookstand	(06,00,07,00,"EIS_91");
	TA_Sit_Throne	(07,00,10,00,"EIS_92");
	TA_Potion_Alchemy	(10,00,13,00,"EIS_79");
	TA_Sit_Throne	(13,00,15,00,"EIS_83");
	TA_Study_WP	(15,00,17,00,"EIS_98");
	TA_Read_Bookstand	(17,00,19,00,"EIS_91");
	TA_Sit_Throne	(19,00,23,00,"EIS_92");
	TA_Sleep	(23,00,06,00,"EIS_89");
};

FUNC VOID Rtn_AtThys_1954 ()
{	
	TA_Smalltalk	(08,00,22,00,"EIS_76");
	TA_Sleep	(22,00,08,00,"EIS_89");
};

FUNC VOID Rtn_Alvar_1954 ()
{	
	TA_Stand_Guarding	(08,00,22,00,"EIS_76");
	TA_Stand_Guarding	(22,00,08,00,"EIS_76");
};

FUNC VOID Rtn_KO_1954 ()
{	
	TA_Drained	(08,00,22,00,"EIS_76");
	TA_Drained	(22,00,08,00,"EIS_76");
};