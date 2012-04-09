instance Mod_7570_OUT_Bandit_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Fremder"; 
	guild 		= GIL_STRF;
	id 			= 7570;
	voice 		= 8;
	flags       = 0;																
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_NormalBart06, BodyTex_N,ITAR_Vlk_L);	
	Mdl_SetModelFatness	(self,0);
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_7570;
};

FUNC VOID Rtn_PreStart_7570()
{	
	TA_Stand_WP		(08,00,20,00,"EIS_341");
	TA_Stand_WP		(20,00,08,00,"EIS_341");
};