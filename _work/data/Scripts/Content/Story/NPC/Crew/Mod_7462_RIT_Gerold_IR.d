instance Mod_7462_RIT_Gerold_IR  (Npc_Default)
{
	// ------ NSC ------
	name 		= "Gerold";
	guild 		= GIL_OUT;
	id 			= 7462;
	voice 		= 12;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	aivar[AIV_Partymember] 		= TRUE;
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Schwert_03);
	EquipItem			(self, ItRw_Mil_Crossbow_Schmetter);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Normal_Blade, BodyTex_N, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 70); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7462;
};

FUNC VOID Rtn_Start_7462 ()
{	
	TA_Practice_Sword		(08,00,22,00,"SHIP_DECK_10");
	TA_Practice_Sword		(22,00,08,00,"SHIP_DECK_10");
};

FUNC VOID Rtn_Follow_7462 ()
{	
	TA_Follow_Player	(08,00,20,00,"SHIP_CREW_19");
	TA_Follow_Player	(20,00,08,00,"SHIP_CREW_19");
};

FUNC VOID Rtn_Waiting_7462 ()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"DI_DRACONIANAREA_17");
	TA_Stand_ArmsCrossed	(20,00,08,00,"DI_DRACONIANAREA_17");
};