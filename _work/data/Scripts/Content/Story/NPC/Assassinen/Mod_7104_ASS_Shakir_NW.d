INSTANCE Mod_7104_ASS_Shakir_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Shakir"; 
	guild 		= GIL_OUT;
	id 			= 7104;
	voice 		= 31;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1h_Vlk_Sword);														
	EquipItem	(self, ItRw_Assassinenbogen);
	
	// ------ Inventory ------
	CreateInvItems (self, ItMi_Gold, 250);
	CreateInvItems (self, ItFo_Apple, 2);
	CreateInvItems (self, ItFo_Bacon, 1);
	CreateInvItems (self, ItRw_Arrow, 20);
	CreateInvItems (self, ItFo_Milk, 2);
	CreateInvItems (self, ItFo_Mutton, 5);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Normal_Sharky, BodyTex_B,ITAR_Assassine_01);	
	Mdl_SetModelFatness	(self,0);
	//Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds");
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7104;
};

FUNC VOID Rtn_Start_7104()
{	
	TA_Sit_Chair 	(08,00,22,00,"WP_ASSASSINE_18");
	TA_Sleep	(22,00,08,00,"WP_ASSASSINE_18");
};

FUNC VOID Rtn_Schlacht_7104()
{	
	TA_Stand_Guarding 	(07,20,01,20,"WP_ASSASSINE_12");
	TA_Stand_Guarding	(01,20,07,20,"WP_ASSASSINE_12");
};

FUNC VOID Rtn_Tot_7104()
{	
	TA_Stand_Guarding 	(07,20,01,20,"TOT");
	TA_Stand_Guarding	(01,20,07,20,"TOT");
};

FUNC VOID Rtn_AtGritta_7104 ()
{
	TA_RunToWP	(08,00,20,00,"NW_CITY_SMFOREST_BANDIT_03");
	TA_RunToWP	(20,00,08,00,"NW_CITY_SMFOREST_BANDIT_03");
};