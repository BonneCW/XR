instance Mod_7571_OUT_Bandit_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Fremder"; 
	guild 		= GIL_STRF;
	id 			= 7571;
	voice 		= 6;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_Herek, BodyTex_N, ITAR_Vlk_M);	
	Mdl_SetModelFatness	(self,0);
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_7571;
};

FUNC VOID Rtn_PreStart_7571()
{	
	TA_Stand_WP	(08,00,23,00,"EIS_337");
	TA_Stand_WP	(23,00,08,00,"EIS_337");	
};
