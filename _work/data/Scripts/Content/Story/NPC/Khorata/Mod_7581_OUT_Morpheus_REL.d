instance Mod_7581_OUT_Morpheus_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Morpheus";
	guild 		= GIL_OUT;
	id 			= 7581;
	voice 		= 4;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Normal06, BodyTex_N, KhorataHaendler_01);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 80); 
		
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7581;
};

FUNC VOID Rtn_Start_7581 ()
{
	TA_Stand_ArmsCrossed	(08,00,21,00,"RELENDELCITY_03");
	TA_Stand_ArmsCrossed	(21,00,08,00,"ALTEFESTUNG_08");	
};

