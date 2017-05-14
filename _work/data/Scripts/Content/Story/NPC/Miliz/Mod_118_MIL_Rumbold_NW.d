instance Mod_118_MIL_Rumbold_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Rumbold";	
	guild 		= GIL_PAL;	
	id 			= 118;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ AIVARs ------
	aivar[AIV_ToughGuy]		= TRUE;	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Milizschwert);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Important_Arto, BodyTex_N, ITAR_MIL_L);	
	Mdl_SetModelFatness	(self,2);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 
	
	level	= 6;

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_118;
};

FUNC VOID Rtn_Start_118()
{	
	TA_Stand_Guarding 	(08,00,22,00,"NW_CITY_MERCHANT_PATH_02");
	TA_Stand_Guarding	(22,00,08,00,"NW_CITY_MERCHANT_PATH_02");
};

FUNC VOID Rtn_Fisk_118()
{	
	TA_Stand_Guarding 	(08,00,22,00,"NW_FARM3_OUT_01");
	TA_Stand_Guarding	(22,00,08,00,"NW_FARM3_OUT_01");
};