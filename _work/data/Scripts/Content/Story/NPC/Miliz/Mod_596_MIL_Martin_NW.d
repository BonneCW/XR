instance Mod_596_MIL_Martin_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Martin";	
	guild 		= GIL_PAL;//wegen Rangermeeting
	id 			= 596;
	voice 		= 7;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	aivar[AIV_ToughGuy]		= TRUE;
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Milizschwert);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_P_OldMan_Gravo, BodyTex_P, ITAR_MIL_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_596; 
};

FUNC VOID Rtn_Start_596()
{	
	TA_Study_WP	(04,00,23,00,"NW_CITY_PALCAMP_15");
    TA_Study_WP (23,00,04,00,"NW_CITY_PALCAMP_15");	
};

FUNC VOID Rtn_Rasend_596()
{	
	TA_Stand_ArmsCrossed	(04,00,23,00,"NW_CITY_WAY_TO_SHIP_21");
    	TA_Stand_ArmsCrossed	(23,00,04,00,"NW_CITY_WAY_TO_SHIP_21");	
};

FUNC VOID Rtn_Dieb_596 ()
{	
	TA_Stand_ArmsCrossed		(09,00,21,00,"NW_CITY_KANAL_25");
   	TA_Stand_ArmsCrossed		(21,00,09,00,"NW_CITY_KANAL_25");
};

FUNC VOID Rtn_Dieb2_596 ()
{	
	TA_RunToWP		(09,00,21,00,"NW_CITY_KANAL_ROOM_05_01");
   	TA_RunToWP		(21,00,09,00,"NW_CITY_KANAL_ROOM_05_01");
};