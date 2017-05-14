INSTANCE Mod_7293_OUT_Brody_AW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Brody";
	guild 		= GIL_OUT;
	id 			= 7293;
	voice		= 0;
	flags       = FALSE;															
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	
	EquipItem (self, ItMw_Addon_PIR1hSword);  
	
	// ------ Inventory ------
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_ToughBart01, BodyTex_N, ITAR_PIR_L_Addon);	  
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_7293;
};

FUNC VOID Rtn_PreStart_7293 ()
{	
	TA_Sit_Campfire		(20,00,08,00,"ADW_CANYON_PATH_TO_MINE2_13");
	TA_Sit_Campfire		(08,00,20,00,"ADW_CANYON_PATH_TO_MINE2_13");
};

FUNC VOID Rtn_Follow_7293 ()
{	
	TA_Follow_Player	(20,00,08,00,"ADW_CANYON_PATH_TO_MINE2_13");
	TA_Follow_Player	(08,00,20,00,"ADW_CANYON_PATH_TO_MINE2_13");
};

FUNC VOID Rtn_Safe_7293 ()
{	
	TA_Sit_Campfire		(20,00,08,00,"ADW_CANYON_TELEPORT_PATH_01A");
	TA_Sit_Campfire		(08,00,20,00,"ADW_CANYON_TELEPORT_PATH_01A");
};

FUNC VOID Rtn_Tot_7293 ()
{	
	TA_Sit_Campfire		(20,00,08,00,"TOT");
	TA_Sit_Campfire		(08,00,20,00,"TOT");
};