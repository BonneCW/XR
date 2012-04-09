instance Mod_7400_OUT_Jorgen_OM (Npc_Default)
{
	// ------ NSC ------
	name 		= "Jorgen";
	guild 		= GIL_OUT;
	id 			= 7400;
	voice 		= 7;
	flags       = NPC_FLAG_IMMORTAL;	//Joly: Immortal Kapitän fürs Schiff im Kapitel 5! Mortal, Optionale Kapitäne: Torlof und Jack!!!!!!!!!						
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);													
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------														
	EquipItem			(self, ItMw_1h_Bau_Axe);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_N_Tough_Skip, BodyTex_N, ITAR_VLK_L);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 70); //Grenzen für Talent-Level liegen bei 30 und 60

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7400;
};

FUNC VOID Rtn_Start_7400 ()
{
	TA_Stand_ArmsCrossed 			(08,00,20,00,"OM_073");
	TA_Stand_ArmsCrossed 			(20,00,08,00,"OM_073");		
};