INSTANCE Mod_540_PAL_Andre_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Lord Andre";	
	guild 		= GIL_DMT;
	id 			= 540;
	voice		= 0;
	flags       = NPC_FLAG_IMMORTAL;	//Joly: NPC_FLAG_IMMORTAL																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ AIVARS ------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Paladinschwert);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak12, BodyTex_N, ITAR_PAL_H);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 80); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_PrePreStart_540;
};

FUNC VOID Rtn_PrePreStart_540 ()
{
	TA_Stand_Guarding 	(00,00,12,00,"NW_CITY_MAINSTREET_01_01"); 
	TA_Stand_Guarding 	(12,00,00,00,"NW_CITY_MAINSTREET_01_01");
};

FUNC VOID Rtn_AtGarond_540 ()
{
	TA_Follow_Player 	(00,00,12,00,"NW_CITY_MAINSTREET_01"); 
	TA_Follow_Player 	(12,00,00,00,"NW_CITY_MAINSTREET_01");
};

FUNC VOID Rtn_PreStart_540 ()
{
	TA_Guide_Player 	(00,00,12,00,"NW_CITY_HABOUR_KASERN_MAIN_ENTRY"); 
	TA_Guide_Player 	(12,00,00,00,"NW_CITY_HABOUR_KASERN_MAIN_ENTRY");
};

FUNC VOID Rtn_Start_540 ()
{
	TA_Read_Bookstand 	(05,00,23,00,"NW_CITY_ANDRE"); 
	TA_Read_Bookstand 	(23,00,05,00,"NW_CITY_KASERN_BARRACK02_04");
};

FUNC VOID Rtn_Rat_540()
{
	TA_Stand_Guarding		(08,00,20,00,"WP_KLOSTER_KELLER_RAT_PYROKAR");
	TA_Stand_Guarding		(20,00,08,00,"WP_KLOSTER_KELLER_RAT_PYROKAR");
};

FUNC VOID Rtn_Knast_540()
{
	TA_Stand_Guarding		(08,00,20,00,"NW_CITY_HABOUR_KASERN_PRISON_02");
	TA_Stand_Guarding		(20,00,08,00,"NW_CITY_HABOUR_KASERN_PRISON_02");
};

FUNC VOID Rtn_Kodex_540 ()
{
	TA_Teach_Andre 	(00,00,12,00,"NW_CITY_HABOUR_KASERN_MAIN_ENTRY"); 
	TA_Teach_Andre 	(12,00,00,00,"NW_CITY_HABOUR_KASERN_MAIN_ENTRY");
};

FUNC VOID Rtn_Tot_540()
{
	TA_Stand_WP		(08,00,20,00,"TOT");
	TA_Stand_WP		(20,00,08,00,"TOT");
};