instance Mod_7514_OUT_Ivan_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Ivan"; 
	guild 		= GIL_OUT;
	id 			= 7514;
	voice		= 9;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	//EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart_Huno, BodyTex_N,ITAR_Vlk_L);	
	Mdl_SetModelFatness	(self,2);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7514;
};

FUNC VOID Rtn_Start_7514()
{	
	TA_Sit_Chair 		(07,00,18,00,"REL_CITY_100");
	TA_Sit_Throne		(18,00,22,00,"REL_CITY_100");
	TA_Sleep 		(22,00,07,00,"REL_CITY_101");
};

FUNC VOID Rtn_Follow_7514()
{	
	TA_Follow_Player 		(07,00,22,00,"REL_SURFACE_126");
	TA_Follow_Player 		(22,00,07,00,"REL_SURFACE_126");
};

FUNC VOID Rtn_Wait_7514()
{	
	TA_Stand_ArmsCrossed 		(07,00,22,00,Npc_GetNearestWP(self));
	TA_Stand_ArmsCrossed 		(22,00,07,00,Npc_GetNearestWP(self));
};

FUNC VOID Rtn_Flucht_7514()
{	
	TA_FleeToWP 		(07,00,22,00,"REL_SURFACE_114");
	TA_FleeToWP 		(22,00,07,00,"REL_SURFACE_114");
};

FUNC VOID Rtn_Erhard_7514()
{	
	TA_Sit_Campfire 		(07,00,22,00,"REL_SURFACE_129");
	TA_Sit_Campfire 		(22,00,07,00,"REL_SURFACE_129");
};

FUNC VOID Rtn_Bekifft_7514()
{	
	TA_Sleep 		(07,00,22,00,"REL_CITY_101");
	TA_Sleep		(22,00,07,00,"REL_CITY_101");
};
