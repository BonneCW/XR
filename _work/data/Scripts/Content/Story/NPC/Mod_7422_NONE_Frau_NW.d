instance Mod_7422_NONE_Frau_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Frau";
	guild 		= GIL_DMT;
	id 			= 7422;
	voice		= 0;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------						FaceBabe_N_HairAndCloth																
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe1", FaceBabe_N_WhiteCloth, BodyTex_N, ITAR_VlkBabe_L_5);	
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 35); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7422;
};

FUNC VOID Rtn_Start_7422 ()
{	
	TA_Smalltalk_Plaudern	(08,00,22,00,"NW_FARM1_BANDITS_CAVE_02");
	TA_Smalltalk_Plaudern	(22,00,08,00,"NW_FARM1_BANDITS_CAVE_02");
};

FUNC VOID Rtn_Tot_7422 ()
{	
	TA_Smalltalk_Plaudern	(08,00,22,00,"TOT");
	TA_Smalltalk_Plaudern	(22,00,08,00,"TOT");
};