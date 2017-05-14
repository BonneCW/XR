instance Mod_7184_BDT_Esteban_OC (Npc_Default)
{
	// ------ NSC ------
	name 		= "Esteban";
	guild 		= GIL_OUT;
	id 			= 7184;
	voice		= 0;
	flags      	= 2;
	npctype		= NPCTYPE_MAIN;
	
	//------- AIVAR -------
	
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;
	
	// ------ Equippte Waffen ------																
	EquipItem (self, ItMw_Bastardschwert);																	
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_L_ToughBart_Quentin, BodyTex_L, ITAR_BDT_H_01);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_7184;
};
FUNC VOID Rtn_Start_7184 ()
{	
	TA_Follow_Player	(08,00,20,00,"WP_OCC_258");
	TA_Follow_Player	(20,00,08,00,"WP_OCC_258");
};

FUNC VOID Rtn_Tot_7184()
{
	TA_Stand_WP	(08,00,20,00,"TOT");
	TA_Stand_WP	(20,00,08,00,"TOT");
};