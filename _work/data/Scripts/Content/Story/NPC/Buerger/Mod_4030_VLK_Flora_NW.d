instance Mod_4030_VLK_Flora_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Flora";	
	guild 		= GIL_PAL;
	id 			= 4030;
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
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe4", FaceBabe_N_VlkBlonde, BodyTex_N, ITAR_VlkBabe_L_5);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_4030;
};

FUNC VOID Rtn_Start_4030 ()
{	
	TA_Stand_ArmsCrossed	(05,10,20,17,"NW_CITY_UPTOWN_PATH_23");
	TA_Sleep		(20,17,05,10,"NW_CITY_GERBRANDT_BED_02");
};