INSTANCE Mod_7740_BDT_Bandit_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bandit";
	guild 		= GIL_STRF;
	id 			= 7740;
	voice 		= 4;
	flags       = 2;																	
	npctype		= NPCTYPE_MAIN;

	level = 30;
	
	// ------ AIVARS ------
	aivar[AIV_ToughGuy] 			= TRUE;

	// ------ Attribute ------
	attribute[ATR_HITPOINTS_MAX] = 80;
	attribute[ATR_HITPOINTS] = 80;
	attribute[ATR_STRENGTH] = 20;																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Vlk_Dagger);
		
	// ------ Inventory ------
		
	// ------ visuals ------																			
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_N_Weak_BaalNetbek, BodyTex_N, ITAR_BDT_M_01);

	Mdl_SetModelFatness	(self, 1);
	//Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7740;
};

FUNC VOID Rtn_Start_7740 ()
{	
	TA_Smith_Fire		(09,00,10,00,"NORDOSTENLOCH_6");
	TA_Smith_Anvil		(10,00,11,00,"NORDOSTENLOCH_6"); 
	TA_Smith_Cool		(11,00,12,00,"NORDOSTENLOCH_6");
	TA_Smith_Sharp		(12,00,13,00,"NORDOSTENLOCH_6");
	TA_Potion_Alchemy	(13,00,15,00,"NORDOSTENLOCH_6");
	TA_Smith_Fire		(15,00,16,00,"NORDOSTENLOCH_6");
	TA_Smith_Anvil		(16,00,17,00,"NORDOSTENLOCH_6"); 
	TA_Smith_Cool		(17,00,18,00,"NORDOSTENLOCH_6");
	TA_Smith_Sharp		(18,00,19,00,"NORDOSTENLOCH_6");
	TA_Smith_Fire		(19,00,20,00,"NORDOSTENLOCH_6");
	TA_Smith_Anvil		(20,00,21,00,"NORDOSTENLOCH_6"); 
	TA_Smith_Cool		(21,00,22,00,"NORDOSTENLOCH_6");
	TA_Smith_Sharp		(22,00,23,00,"NORDOSTENLOCH_6");
	TA_Smith_Fire		(23,00,24,00,"NORDOSTENLOCH_6");
	TA_Smith_Anvil		(00,00,01,00,"NORDOSTENLOCH_6"); 
	TA_Smith_Cool		(01,00,02,00,"NORDOSTENLOCH_6");
	TA_Smith_Sharp		(02,00,03,00,"NORDOSTENLOCH_6");
	TA_Smith_Fire		(03,00,04,00,"NORDOSTENLOCH_6");
	TA_Smith_Anvil		(04,00,05,00,"NORDOSTENLOCH_6"); 
	TA_Smith_Cool		(05,00,06,00,"NORDOSTENLOCH_6");
	TA_Smith_Sharp		(06,00,07,00,"NORDOSTENLOCH_6");
	TA_Smith_Fire		(07,00,08,00,"NORDOSTENLOCH_6");
	TA_Smith_Anvil		(08,00,09,00,"NORDOSTENLOCH_6"); 
};