instance Mod_757_NONE_Zuris_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Zuris";
	guild 		= GIL_PAL;
	id 			= 757;
	voice 		= 32;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------				
	
	// ------ Inventory ------
	// Händler
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_N_ImportantGrey, BodyTex_N, ITAR_VLK_01);	
	Mdl_SetModelFatness	(self, 0.9);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self,50); 

	attribute[ATR_HITPOINTS_MAX] = 15000;
	attribute[ATR_HITPOINTS] = 15000;

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_757;
};

FUNC VOID Rtn_Start_757 ()
{
	TA_Stand_ArmsCrossed	(05,30,06,25,"NW_CITY_BALTRAM");
	TA_Stand_Guarding		(06,25,06,30,"NW_CITY_ZURIS_REGAL");
	TA_Stand_ArmsCrossed	(06,30,20,00,"NW_CITY_BALTRAM");
	TA_Sit_Throne 			(20,00,00,30,"NW_CITY_CHAIR_ZURIS");
	TA_Sleep				(00,30,05,30,"NW_CITY_BED_ZURIS");
};

FUNC VOID Rtn_Ueberfall_757 ()
{
	TA_Stand_ArmsCrossed		(08,00,19,00,"NW_TAVERN_TO_FOREST_04");
	TA_Stand_ArmsCrossed		(19,00,08,00,"NW_TAVERN_TO_FOREST_04");
};