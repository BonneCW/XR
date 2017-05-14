instance Mod_746_NONE_Ramirez_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Ramirez"; 
	guild 		= GIL_OUT;
	id 			= 746;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//----------AIVARS--------------
	aivar[AIV_DropDeadAndKill] = TRUE;
	aivar[AIV_EnemyOverride] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_Meisterdegen); 
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_Tough_Okyl, BodyTex_N,ITAR_VLK_M);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 60); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_746;
};

FUNC VOID Rtn_Start_746()
{	
	TA_Stand_ArmsCrossed	(07,00,23,00,"NW_CITY_KANAL_ROOM_04_01");
	TA_Sit_Throne		(23,00,07,00,"NW_CITY_KANAL_ROOM_05_02");
};

FUNC VOID Rtn_FollowToAndre_746()
{	
	TA_Follow_Player	(07,00,23,00,"NW_CITY_HABOUR_KASERN_MAIN_IN");
    TA_Follow_Player			(23,00,07,00,"NW_CITY_HABOUR_KASERN_MAIN_IN");
};

FUNC VOID Rtn_Knast_746()
{	
	TA_Stand_WP	(07,00,23,00,"NW_CITY_HABOUR_KASERN_NAGUR");
    TA_Stand_WP			(23,00,07,00,"NW_CITY_HABOUR_KASERN_NAGUR");
};

FUNC VOID Rtn_Flucht_746()
{	
	TA_Schleichen	(07,00,23,00,"NW_CITY_KANAL_ROOM_05_03");
    TA_Schleichen		(23,00,07,00,"NW_CITY_KANAL_ROOM_05_03");
};

FUNC VOID Rtn_Tot_746()
{	
	TA_Stand_ArmsCrossed	(07,00,23,00,"TOT");
	TA_Sit_Throne			(23,00,07,00,"TOT");
};

FUNC VOID Rtn_Dieb_746()
{	
	TA_Sit_Throne		(07,00,23,00,"NW_CITY_KANAL_ROOM_05_02");
	TA_Sit_Throne		(23,00,07,00,"NW_CITY_KANAL_ROOM_05_02");
};