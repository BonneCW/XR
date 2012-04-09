instance Mod_7183_BDT_Miguel_OC (Npc_Default)
{
	// ------ NSC ------
	name 		= "Miguel";
	guild 		= GIL_OUT;
	id 			= 7183;
	voice 		= 11;
	flags      	= 0;
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_Banditenschwert); 																
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	CreateInvItems (self, Itpo_health_01, 20);
	CreateInvItems (self, Itpo_health_02, 8);
	CreateInvItems (self, Itpo_health_03, 5);
	CreateInvItems (self, Itpo_mana_01, 7);
		
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_P_OldMan_Gravo, BodyTex_P, ITAR_BDT_M_01);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_7183;
};
FUNC VOID Rtn_Start_7183()
{
	TA_Follow_Player	(06,00,18,00,"WP_OCC_258");
	TA_Follow_Player	(18,00,06,00,"WP_OCC_258");
};

FUNC VOID Rtn_Tot_7183()
{
	TA_Stand_Guarding	(08,00,20,00,"TOT");
	TA_Stand_Guarding	(20,00,08,00,"TOT");
};