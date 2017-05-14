instance Mod_7182_BDT_Juan_OC (Npc_Default)
{
	// ------ NSC ------
	name 		= "Juan";
	guild 		= GIL_OUT;
	id 			= 7182;
	voice		= 0;
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
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_L_NormalBart01, BodyTex_L, ITAR_BDT_M_01);	
	Mdl_SetModelFatness	(self, - 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_7182;
};
FUNC VOID Rtn_Start_7182()
{
	TA_Follow_Player 	(02,00,10,00,"WP_OCC_258");
	TA_Follow_Player 	(10,00,02,00,"WP_OCC_258");
};

FUNC VOID Rtn_Tot_7182()
{
	TA_Stand_Guarding	(08,00,20,00,"TOT");
	TA_Stand_Guarding	(20,00,08,00,"TOT");
};