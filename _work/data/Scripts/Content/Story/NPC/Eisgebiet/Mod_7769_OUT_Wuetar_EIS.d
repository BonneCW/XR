instance Mod_7769_OUT_Wuetar_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Wütar"; 
	guild 		= GIL_OUT;
	id 			= 7769;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_Schwert3); 
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems	(self, ItAt_Drachensnappersehne, 2);
	
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Lefty, BodyTex_N, ITAR_Eisgebiet_02);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_7769;
};

FUNC VOID Rtn_PreStart_7769()
{	
	TA_Stand_ArmsCrossed	(08,00,22,00,"EIS_DORF_003");
	TA_Stand_ArmsCrossed	(22,00,08,00,"EIS_DORF_003");
};

FUNC VOID Rtn_Start_7769()
{	
	TA_Read_Bookstand	(08,00,22,00,"EIS_DORF_011");
	TA_Sleep		(22,00,08,00,"EIS_DORF_008");
};