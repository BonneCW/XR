instance Mod_1029_SMK_Fahim_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Fahim";	
	guild 		= GIL_KDF;  
	id 			= 1029;
	voice 		= 10;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ AIVARs ------
	aivar[AIV_ToughGuy]		= TRUE;	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_BeliarsRache);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fatbald", Face_N_Ricelord, BodyTex_N, ITAR_SMK_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1029;
};

FUNC VOID Rtn_Start_1029()
{	
	TA_Smalltalk 	(08,00,22,00,"PALTOBURGRECHTSOBEN_39");
	TA_Sleep	(22,00,08,00,"PALTOBURGLINKSOBEN_48");
};

FUNC VOID Rtn_Aufstellung_1029 ()
{
	TA_Stand_ArmsCrossed 	(08,00,22,00,"OW_PATH_3001_MOVE5");
	TA_Stand_ArmsCrossed	(22,00,08,00,"OW_PATH_3001_MOVE5");		
};

FUNC VOID Rtn_Angriff_1029 ()
{
	TA_RunToWP 	(08,00,22,00,"OW_PATH_3001_05");
	TA_RunToWP	(22,00,08,00,"OW_PATH_3001_05");		
};