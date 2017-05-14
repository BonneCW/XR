instance Mod_755_MIL_Wambo_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Wambo";	
	guild 		= GIL_PAL;
	id 			= 755;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
	aivar[AIV_ToughGuy]		= TRUE;		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Milizschwert);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self,ItKe_City_Tower_04,1);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart16, BodyTex_N, ITAR_MIL_M);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_755;
};

FUNC VOID Rtn_Start_755 ()
{	
	TA_Stand_ArmsCrossed		(06,55,21,00,"NW_CITY_HABOUR_KASERN_CENTRE_01");
    TA_Sit_Throne 				(21,00,05,00,"NW_CITY_KASERN_BARRACK02_02");
   	TA_Practice_Sword 			(05,00,06,55,"NW_CITY_HABOUR_KASERN_CENTRE_01");
};

FUNC VOID Rtn_Kampf_755 ()
{	
	TA_Stand_ArmsCrossed		(06,55,21,00,"NW_CITY_BARRACK01_04");
    TA_Sit_Throne 				(21,00,05,00,"NW_CITY_KASERN_BARRACK02_02");
   	TA_Stand_WP 			(05,00,06,55,"NW_CITY_BARRACK01_04");
};

FUNC VOID Rtn_Dieb_755 ()
{	
	TA_Stand_ArmsCrossed		(09,00,21,00,"NW_CITY_KANAL_25");
   	TA_Stand_ArmsCrossed		(21,00,09,00,"NW_CITY_KANAL_25");
};

FUNC VOID Rtn_Dieb2_755 ()
{	
	TA_RunToWP		(09,00,21,00,"NW_CITY_KANAL_ROOM_05_01");
   	TA_RunToWP		(21,00,09,00,"NW_CITY_KANAL_ROOM_05_01");
};