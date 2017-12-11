instance Mod_7542_OUT_Raritaetenhaendler_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Finder";
	guild 		= GIL_OUT;
	id 			= 7542;
	voice		= 16;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

	CreateInvItems	(self, ItMi_BrokenRune03, 1);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Normal06, BodyTex_N, KhorataHaendler_01);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 80); 
		
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7542;
};

FUNC VOID Rtn_Start_7542 ()
{
	TA_Stand_ArmsCrossed	(08,00,23,00,"REL_CITY_390");
	TA_Stand_ArmsCrossed	(23,00,08,00,"REL_CITY_390");	
};

