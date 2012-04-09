INSTANCE Mod_4026_NONE_Kuno_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Kuno";
	guild 		= GIL_OUT;
	id 			= 4026;
	voice 		= 9;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_1h_Mil_Sword); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", 203, BodyTex_B, ITAR_Smith);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 80); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_4026;
};

FUNC VOID Rtn_Start_4026 ()
{	
	TA_Stand_Eating		(08,00,09,00,"WAY_PASS_MILL_07");
    	TA_Angeln		(09,00,11,30,"WAY_PASS_MILL_05");	
	TA_Stand_Eating		(11,30,12,00,"WAY_PASS_MILL_07");
	TA_Stand_Drinking	(12,00,12,30,"WAY_PASS_MILL_07");
    	TA_Angeln		(12,30,22,00,"WAY_PASS_MILL_05");			
	TA_Sleep		(22,00,08,00,"WAY_PASS_MILL_08");
};