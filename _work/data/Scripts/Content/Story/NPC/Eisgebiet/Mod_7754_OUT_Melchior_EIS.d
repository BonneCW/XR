instance Mod_7754_OUT_Melchior_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Melchior";	
	guild 		= GIL_OUT;  
	id 			= 7754;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fatbald", Face_N_Ricelord, BodyTex_N, ITAR_Eisgebiet_Miliz);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7754;
};

FUNC VOID Rtn_Start_7754()
{	
	TA_Waermen	 	(08,00,22,00,"MELCHIORSLAGER_01");
	TA_Sleep		(22,00,08,00,"MELCHIORSLAGER_02");
};

FUNC VOID Rtn_Fisk_7754()
{	
	TA_Stand_Guarding 	(08,00,22,00,"NW_FARM3_OUT_01");
	TA_Stand_Guarding	(22,00,08,00,"NW_FARM3_OUT_01");
};