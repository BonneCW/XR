INSTANCE Mod_7022_BDT_Oschust_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Oschust";
	guild 		= GIL_OUT;
	id 			= 7022;
	voice		= 0;
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

	CreateInvItems	(self, ItMi_Sulfur, 3);
	CreateInvItems	(self, ItMi_Alchemy_Alcohol_01, 2);
	CreateInvItems	(self, ItMi_SilverRing, 1);
	CreateInvItems	(self, ItMi_GoldRing, 2);
	CreateInvItems	(self, ItMi_GoldNugget_Addon, 5);
	CreateInvItems	(self, ItMw_2H_Axe_L_01, 1);
		
	// ------ visuals ------																			
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_N_Weak_BaalNetbek, BodyTex_N, ITAR_BDT_M_01);

	Mdl_SetModelFatness	(self, 1);
	//Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7022;
};

FUNC VOID Rtn_Start_7022 ()
{	
	TA_Potion_Alchemy	(07,00,09,00,"HOEHLE_34");
	TA_Smith_Fire		(09,00,10,00,"HOEHLE_33");
	TA_Smith_Anvil		(10,00,11,00,"HOEHLE_33"); 
	TA_Smith_Cool		(11,00,12,00,"HOEHLE_33");
	TA_Smith_Sharp		(12,00,13,00,"HOEHLE_33");
	TA_Potion_Alchemy	(13,00,15,00,"HOEHLE_34");
	TA_Smith_Fire		(15,00,16,00,"HOEHLE_33");
	TA_Smith_Anvil		(16,00,17,00,"HOEHLE_33"); 
	TA_Smith_Cool		(17,00,18,00,"HOEHLE_33");
	TA_Smith_Sharp		(18,00,19,00,"HOEHLE_33");
	TA_Potion_Alchemy	(19,00,21,00,"HOEHLE_34");
	TA_Sleep		(21,00,07,00,"HOEHLE_24");
};

FUNC VOID Rtn_Tot_7022 ()
{
	TA_Drained	(08,00,20,00,"TOT");
	TA_Drained	(20,00,08,00,"TOT");
};