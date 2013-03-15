instance Mod_7269_HS_Barde_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Barde"; 
	guild 		= GIL_OUT;
	id 			= 7269;
	voice 		= 31;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 40); 
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1H_quantarie_Schwert_01);
	
	
	// ------ Inventory ------
	//Händler

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald.", Face_N_Normal_Blade, BodyTex_N, ITAR_Hofstaatler);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7269;
};

FUNC VOID Rtn_Start_7269 ()
{	
	TA_Play_Lute	(08,00,22,00,"REL_254");
	TA_Play_Lute	(22,00,08,00,"REL_254");
};