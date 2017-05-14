instance Mod_7461_RIT_Marcos_IR  (Npc_Default)
{
	// ------ NSC ------
	name 		= "Marcos";
	guild 		= GIL_OUT;
	id 			= 7461;
	voice		= 0;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);
	aivar[AIV_Partymember] 		= TRUE;													
		
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Schwert_02);
	EquipItem			(self, ItRw_Mil_Crossbow_Schmetter);
	
	// ------ Inventory ------
	
	CreateInvItems (self, ItPo_Health_03,5);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_Tough_Rodriguez, BodyTex_P, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 75); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7461;
};

FUNC VOID Rtn_Start_7461 ()
{	
	TA_Practice_Sword		(08,00,23,00,"SHIP_DECK_07");
    TA_Practice_Sword		(23,00,08,00,"SHIP_DECK_07");
};

FUNC VOID Rtn_Follow_7461 ()
{	
	TA_Follow_Player	(08,00,20,00,"SHIP_CREW_19");
	TA_Follow_Player	(20,00,08,00,"SHIP_CREW_19");
};

FUNC VOID Rtn_Waiting_7461 ()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"DI_DRACONIANAREA_17");
	TA_Stand_ArmsCrossed	(20,00,08,00,"DI_DRACONIANAREA_17");
};