instance Mod_580_NONE_Gritta_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Gritta";	
	guild 		= GIL_NONE;
	id 			= 580;
	voice		= 43;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	attribute[ATR_STRENGTH] 		= 10;
	attribute[ATR_DEXTERITY] 		= 10;
	attribute[ATR_MANA_MAX] 		= 0;
	attribute[ATR_MANA] 			= 0;
	attribute[ATR_HITPOINTS_MAX]	= 5;
	attribute[ATR_HITPOINTS] 		= 5;																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------
																		
		
	// ------ Inventory ------
	CreateInvItems (self,ItMi_Gold, 100);		//f�r die Matteo Mission
	//KEIN AmbientInv!!!
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe8", FaceBabe_N_YoungBlonde, BodyTex_N, ITAR_VlkBabe_M_6);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_580;
};

FUNC VOID Rtn_Start_580 ()
{	
	TA_Stand_Sweeping		(08,00,12,00,"NW_CITY_MERCHANT_HUT_01_IN");
	TA_Cook_Stove			(12,00,14,00,"NW_CITY_BED_BOSPER_B");
	TA_Stand_Sweeping		(14,00,18,00,"NW_CITY_MERCHANT_HUT_01_IN");
	TA_Cook_Stove			(18,00,20,00,"NW_CITY_BED_BOSPER_B");
	TA_Read_Bookstand 		(20,00,23,00,"NW_CITY_MERCHANT_HUT_01_IN");
	TA_Sleep				(23,00,08,00,"NW_CITY_BED_BOSPER_B");
};

FUNC VOID Rtn_FollowToShakir_580 ()
{
	TA_Follow_Player	(08,00,20,00,"NW_CITY_SMFOREST_BANDIT_04");
	TA_Follow_Player	(20,00,08,00,"NW_CITY_SMFOREST_BANDIT_04");
};

FUNC VOID Rtn_AtShakir_580 ()
{
	TA_Stand_ArmsCrossed	(08,00,20,00,"NW_CITY_SMFOREST_BANDIT_04");
	TA_Stand_ArmsCrossed	(20,00,08,00,"NW_CITY_SMFOREST_BANDIT_04");
};