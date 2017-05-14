INSTANCE Mod_7476_OUT_Arzt_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Heiler";	
	guild 		= GIL_OUT;
	id 			= 7476;
	voice		= 0;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem (self, itmw_1h_bau_mace);
	
	// ------ Inventory ------
	// Händler
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic.", Face_N_OldBald_Jeremiah, BodyTex_N, ITAR_SMITH);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 35); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7476;
};

FUNC VOID Rtn_Start_7476 ()
{	
	TA_Sit_Chair	(08,00,22,00,"REL_CITY_242");
	TA_Sit_Chair	(22,00,08,00,"REL_CITY_242");
};

FUNC VOID Rtn_Tot_7476 ()
{	
	TA_Sit_Chair	(08,00,22,00,"TOT");
	TA_Sit_Chair	(22,00,08,00,"TOT");
};