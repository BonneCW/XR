instance Mod_500_PAL_Garond_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Garond";
	guild 		= GIL_PAL;
	id 			= 500;
	voice 		= 4;
	flags       = 2;	//Joly: NPC_FLAG_IMMORTAL																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ AIVARS ------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	

	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Paladinschwert);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Raven, BodyTex_N, ITAR_PAL_H);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 70); 
		
	// ------ TA anmelden ------
	daily_routine 	= Rtn_PreStart_500;
};

FUNC VOID Rtn_PreStart_500 ()
{	
	TA_Stand_Guarding  (08,00,21,00,"NW_CITY_MAINSTREET_01_B");
	TA_Stand_Guarding  (21,00,08,00,"NW_CITY_MAINSTREET_01_B");
};

FUNC VOID Rtn_Ablenkung_500 ()
{	
	TA_RunToWP  (08,00,21,00,"FARM1");
	TA_RunToWP  (21,00,08,00,"FARM1");
};

FUNC VOID Rtn_Mario_500 ()
{	
	TA_Stand_Guarding  (08,00,21,00,"NW_CITY_UPTOWN_PATH_07");
	TA_Stand_Guarding  (21,00,08,00,"NW_CITY_UPTOWN_PATH_07");
};

FUNC VOID Rtn_Kampf_500 ()
{	
	TA_Stand_Guarding		(08,00,21,00,"NW_CITY_UPTOWNPARADE");
   	TA_Stand_Guarding		(21,00,08,00,"NW_CITY_UPTOWNPARADE");
};

FUNC VOID Rtn_Follow_500 ()
{	
	TA_Follow_Player	(08,00,21,00,"NW_CITY_UPTOWNPARADE");
   	TA_Follow_Player	(21,00,08,00,"NW_CITY_UPTOWNPARADE");
};