instance Mod_7273_HS_Haendler_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Königlicher Händler"; 
	guild 		= GIL_OUT;
	id 			= 7273;
	voice 		= 1;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem (self, ItMw_1H_quantarie_Schwert_01);	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_OldMan_Gravo, BodyTex_P,ITAR_Hofstaatler);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7273;
};

FUNC VOID Rtn_Start_7273()
{	
	TA_Stand_ArmsCrossed	(05,15,20,15,"REL_273");
	TA_Smoke_Waterpipe	(20,15,01,15,"REL_273");
	TA_Sit_Chair		(01,15,05,15,"REL_273");
};