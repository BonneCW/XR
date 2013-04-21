instance Mod_7482_OUT_Juliana_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Juliana";	
	guild 		= GIL_OUT;
	id 			= 7482;
	voice 		= 35;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	EquipItem (self, ItMw_1H_quantarie_Schwert_01);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe4", FaceBabe_N_VlkBlonde, BodyTex_N, ITAR_VlkBabe_L);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7482;
};

FUNC VOID Rtn_Start_7482 ()
{	
	TA_Stand_ArmsCrossed	(06,00,10,00,"REL_CITY_352");
	TA_Stand_ArmsCrossed	(10,00,14,00,"REL_CITY_349");
	TA_Stand_ArmsCrossed	(14,00,18,00,"REL_CITY_093");
	TA_Stand_ArmsCrossed	(18,00,22,00,"REL_CITY_201");
	TA_Stand_ArmsCrossed	(22,00,02,00,"REL_CITY_204");
	TA_Stand_ArmsCrossed	(02,00,06,00,"REL_CITY_209");
};

FUNC VOID Rtn_Haus_7482()
{	
	TA_Stand_ArmsCrossed		(07,00,21,00,"REL_CITY_081");
	TA_Sleep 		(21,00,07,00,"REL_CITY_075");
};