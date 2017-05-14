instance Mod_7560_OUT_Malfama_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Malfama";	
	guild 		= GIL_OUT;
	id 			= 7560;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
		
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	EquipItem (self, ItMw_1H_quantarie_Schwert_01);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_BabeHair", FaceBabe_N_HairAndCloth, BodyTex_N, ItAr_Eisgebiet_04);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7560;
};

FUNC VOID Rtn_Start_7560 ()
{	
	TA_Sit_Throne		(06,00,08,00,"EIS_DORF_009");
	TA_Smalltalk		(08,00,19,00,"EIS_DORF_001");
	TA_Read_Bookstand	(19,00,20,00,"EIS_DORF_011");
	TA_Sleep		(20,00,06,00,"EIS_DORF_008");
};

FUNC VOID Rtn_ToHome_7560 ()
{	
	TA_Guide_Player		(08,00,19,00,"EIS_DORF_003");
	TA_Guide_Player		(19,00,20,00,"EIS_DORF_003");
};

FUNC VOID Rtn_Alvar_7560 ()
{	
	TA_Stand_Guarding	(08,00,22,00,"EIS_76");
	TA_Stand_Guarding	(22,00,08,00,"EIS_76");
};

FUNC VOID Rtn_Hexenmagie_7560 ()
{	
	TA_Hexenmagie	(08,00,22,00,"EIS_76");
	TA_Hexenmagie	(22,00,08,00,"EIS_76");
};