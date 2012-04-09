instance Mod_7731_OUT_Wache_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Wache";	
	guild 		= GIL_OUT;	
	id 			= 7731;
	voice 		= 10;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Important_Arto, BodyTex_N, ITAR_Eisgebiet_Miliz);	
	Mdl_SetModelFatness	(self,2);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7731;
};

FUNC VOID Rtn_Start_7731()
{
	TA_Stand_Guarding 	(08,00,22,00,"NORTDGEBIET_88");
	TA_Stand_Guarding	(22,00,08,00,"NORTDGEBIET_88");
};