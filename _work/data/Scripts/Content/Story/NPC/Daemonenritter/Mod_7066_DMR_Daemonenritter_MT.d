INSTANCE Mod_7066_DMR_Daemonenritter_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Dämonenritter";
	guild 		= GIL_OUT;
	id 			= 7066;
	voice		= 0;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_1h_Sld_Sword); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_B_Tough_Silas, BodyTex_B, ITAR_Raven_Addon);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7066;
};

FUNC VOID Rtn_Start_7066()
{	
	TA_Stand_Guarding	(08,00,23,00,"OCC_BARONS_LEFT_GUARD");
    TA_Stand_Guarding	(23,00,08,00,"OCC_BARONS_LEFT_GUARD");
};

FUNC VOID Rtn_Tot_7066()
{	
	TA_Stand_Guarding	(08,00,23,00,"TOT");
    TA_Stand_Guarding	(23,00,08,00,"TOT");
};