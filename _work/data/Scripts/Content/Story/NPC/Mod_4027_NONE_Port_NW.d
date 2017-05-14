INSTANCE Mod_4027_NONE_Port_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Johannes Port";
	guild 		= GIL_OUT;
	id 			= 4027;
	voice		= 0;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	

	aivar[AIV_FollowDist] = 500;
	
	// ------ Equippte Waffen ------																	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
			
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_P_NormalBart_Cronos, BodyTex_P, ITAR_Maler);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_4027;
};

FUNC VOID Rtn_Start_4027 ()
{	
	TA_Sit_Campfire	(08,00,23,00,"WAYTOPORT_12");
   	TA_Sit_Campfire	(23,00,08,00,"WAYTOPORT_12");
};

FUNC VOID Rtn_ToBrahim_4027 ()
{	
	TA_Follow_Player	(08,00,23,00,"NW_CITY_HABOUR_HUT_01_FRONT");
   	TA_Follow_Player	(23,00,08,00,"NW_CITY_HABOUR_HUT_01_FRONT");
};

FUNC VOID Rtn_AtBrahim_4027 ()
{	
	TA_Sleep	(08,00,23,00,"NW_CITY_BED_BRAHIM");
   	TA_Sleep	(23,00,08,00,"NW_CITY_BED_BRAHIM");
};