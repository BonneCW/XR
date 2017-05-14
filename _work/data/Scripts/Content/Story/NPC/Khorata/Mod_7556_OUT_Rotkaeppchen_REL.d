instance Mod_7556_OUT_Rotkaeppchen_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Rotkäppchen";
	guild 		= GIL_OUT;
	id 			= 7556;
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
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe1", 225, BodyTex_N, ITAR_VlkBabe_L_5);	
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 35); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7556;
};

FUNC VOID Rtn_Start_7556 ()
{
	TA_Pick_FP	(08,00,22,00,"REL_SURFACE_155");
	TA_Pick_FP	(22,00,08,00,"REL_SURFACE_155");
};

FUNC VOID Rtn_Hof_7556 ()
{
	TA_Cook_Stove		(08,00,11,15,"REL_SURFACE_219");
	TA_Stand_ArmsCrossed	(11,15,13,25,"REL_SURFACE_219");
	TA_Sit_Throne		(13,25,16,05,"REL_SURFACE_216");
	TA_Sit_Chair		(16,05,18,15,"REL_SURFACE_219");
	TA_Sit_Throne		(18,15,08,00,"REL_SURFACE_216");
};