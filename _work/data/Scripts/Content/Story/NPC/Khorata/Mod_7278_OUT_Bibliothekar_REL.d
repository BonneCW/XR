INSTANCE Mod_7278_OUT_Bibliothekar_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bibliothekar";
	guild 		= GIL_OUT;
	id 			= 7278;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic 		= FAI_HUMAN_COWARD;
	
	// ------ Equippte Waffen ------																
	EquipItem (self, ItMw_1h_Bau_Mace);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_P_NormalBald, BodyTex_P,ITAR_Vlk_L);	
	Mdl_SetModelFatness	(self,1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7278;
};

FUNC VOID Rtn_Start_7278()
{	
	TA_Study_WP		(06,00,12,00,"REL_CITY_150"); 
	TA_Sit_Throne		(12,00,14,00,"REL_CITY_151"); 
	TA_Study_WP		(14,00,22,00,"REL_CITY_150"); 
	TA_Sleep 		(22,00,06,00,"REL_CITY_146");
};