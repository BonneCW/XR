instance Mod_588_WNOV_Joe_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Joe"; 
	guild 		= GIL_NOV;
	id 			= 588;
	voice		= 7;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ AIVARS ------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_AdanosKurzschwert); 
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_ToughBald, BodyTex_P,ITAR_Wassernovize1);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 35); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_588;
};

FUNC VOID Rtn_Start_588()
{	
	TA_Stand_ArmsCrossed	(08,00,23,00,"NW_CITY_MERCHANT_PATH_15");
    TA_Pray_Innos	(23,00,08,00,"NW_CITY_MERCHANT_TEMPLE_IN");
};

FUNC VOID Rtn_Diego_588()
{	
	TA_Stand_Guarding   (08,00,20,00,"NW_CITY_HABOUR_02_B");
	TA_Stand_Guarding	(20,00,08,00,"NW_CITY_HABOUR_02_B");
};

FUNC VOID Rtn_Sammeln_588 ()
{
	TA_Stand_WP	(08,00,23,00,"TAVERNE");
    TA_Stand_WP	(23,00,08,00,"TAVERNE");
};

FUNC VOID Rtn_Balrog_588 ()
{
	TA_RunToWP	(08,00,23,00,"WP_ADANOS_BALROG");
    TA_RunToWP	(23,00,08,00,"WP_ADANOS_BALROG");
};

FUNC VOID Rtn_Gigant_588 ()
{
	TA_RunToWP	(08,00,23,00,"NW_TO_PASS_01");
    TA_RunToWP	(23,00,08,00,"NW_TO_PASS_01");
};

FUNC VOID Rtn_Snapper_588 ()
{
	TA_RunToWP	(08,00,23,00,"NW_TROLLAREA_PATH_76");
	TA_RunToWP	(23,00,08,00,"NW_TROLLAREA_PATH_76");
};

FUNC VOID Rtn_Guide_588 ()
{
	TA_Guide_Player	(08,00,23,00,"NW_TROLLAREA_PLANE_02");
	TA_Guide_Player	(23,00,08,00,"NW_TROLLAREA_PLANE_02");
};