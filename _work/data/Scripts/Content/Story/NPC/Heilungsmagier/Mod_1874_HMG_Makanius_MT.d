instance Mod_1874_HMG_Makanius_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Makanius";	
	guild 		= GIL_OUT;
	id 			= 1874;
	voice 		= 7;
	flags       = 2;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------			

	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	EquipItem	(self, ItMw_Heilmagierstab);
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", 189, BodyTex_N, ITAR_HEILROBE_BIG);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 65); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1874;
};

FUNC VOID Rtn_Start_1874 ()
{	
	TA_Stand_WP	(08,00,22,00,"OCC_MERCS_RIGHT_ROOM_BACK");
    TA_Stand_WP	(22,00,08,00,"OCC_MERCS_RIGHT_ROOM_BACK");
};

FUNC VOID Rtn_GuideToThorus_1874 ()
{	
	TA_Guide_Player	(08,00,22,00,"WP_MT_FALLE_04");
    TA_Guide_Player	(22,00,08,00,"WP_MT_FALLE_04");
};

FUNC VOID Rtn_AltesLager_1874 ()
{
	TA_Sit_Campfire	(19,05,06,55,"OCC_CHAPEL_MAGE_02");
	TA_Read_Bookstand		(06,55,19,05,"OCC_CHAPEL_UPSTAIRS_RIGHT");
};

FUNC VOID Rtn_Treffen_1874 ()
{
	TA_Read_Bookstand	(19,05,06,55,"OCC_CHAPEL_UPSTAIRS_RIGHT");
	TA_Read_Bookstand		(06,55,19,05,"OCC_CHAPEL_UPSTAIRS_RIGHT");
};

FUNC VOID Rtn_InPsicamp_1874 ()
{
	TA_Stand_WP			(02,10,07,40,"PSI_TEMPLE_IN_05");
	TA_Stand_WP		(07,40,21,05,"PSI_TEMPLE_IN_05");
	TA_Stand_WP		(21,05,02,10,"PSI_TEMPLE_IN_05");
};

FUNC VOID Rtn_WaitForPlayer_1874 ()
{	
	TA_Stand_WP	(08,00,22,00,"OCC_BARONS_ENTRANCE_DOWNSTAIRS");
    TA_Stand_WP	(22,00,08,00,"OCC_BARONS_ENTRANCE_DOWNSTAIRS");
};

FUNC VOID Rtn_FollowToKerker_1874 ()
{
    TA_Follow_Player	(06,00,18,00,"WP_MT_OC_BARTHOLO_KERKER");	
    TA_Follow_Player	(18,00,06,00,"WP_MT_OC_BARTHOLO_KERKER");	
};

FUNC VOID Rtn_Outdoor_1874()
{
	TA_RunToWP		(08,00,20,00,"SPAWN_SIT_OW");
	TA_RunToWP		(20,00,08,00,"SPAWN_SIT_OW");
};
