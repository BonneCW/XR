instance Mod_7180_BDT_Skinner_OC (Npc_Default)
{
	// ------ NSC ------
	name 		= "Skinner";
	guild 		= GIL_OUT;
	id 			= 7180;
	voice 		= 8;
	flags      	= 0;
	npctype		= NPCTYPE_MAIN;
	
	
	//Aivars
	aivar[AIV_StoryBandit] = TRUE;
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_Banditenschwert); 															
	
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_L_Tough01, BodyTex_L, ITAR_BDT_M_01);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_7180;
};
FUNC VOID Rtn_Start_7180 ()
{
	TA_Follow_Player (09,00,21,00,"WP_OCC_258");
	TA_Follow_Player  (21,00,09,00,"WP_OCC_258");		
};

FUNC VOID Rtn_Tot_7180()
{
	TA_Stand_Guarding	(08,00,20,00,"TOT");
	TA_Stand_Guarding	(20,00,08,00,"TOT");
};