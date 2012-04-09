instance Mod_952_BDT_Franco_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Franco";
	guild 		= GIL_OUT;
	id 			= 952;
	voice 		= 25;
	flags      	= 0;
	npctype		= NPCTYPE_MAIN;
	
	// ------- AIVAR -----
	AIVAR[AIV_StoryBandit] 	= TRUE;
	aivar[AIV_NewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Banditenschwert);

	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	//CreateInvItems (self, ItAm_Addon_Franco,1); siehe oben
	CreateInvItems (self, ItMi_GoldNugget_Addon,7);
	CreateInvItems (self, ItAm_Addon_Franco,1);
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_L_Tough01, BodyTex_L, ITAR_BDT_M_01);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_PreStart_952;
};

FUNC VOID Rtn_PreStart_952 ()
{
   TA_Sit_Campfire   (06,00,20,00,"NW_FARM2_TO_TAVERN_03");
   TA_Sit_Campfire   (20,00,06,00,"NW_FARM2_TO_TAVERN_03");
};

FUNC VOID Rtn_Start_952 ()
{
   TA_Sit_Campfire   (06,00,20,00,"NW_FARM2_TO_TAVERN_RANGERBANDITS_02");
   TA_Sit_Campfire   (20,00,06,00,"NW_FARM2_TO_TAVERN_RANGERBANDITS_02");
};

FUNC VOID Rtn_BeiFranco_952 ()
{
   TA_Sit_Campfire   (06,00,20,00,"NW_BIGMILL_FARM3_RANGERBANDITS_02");
   TA_Sit_Campfire   (20,00,06,00,"NW_BIGMILL_FARM3_RANGERBANDITS_02");
};
FUNC VOID Rtn_Malak_952 () //RUINE
{
     TA_Guide_Player 		(09,00,12,00,"NW_FARM3_MALAK"); 
     TA_Guide_Player	    (12,00,09,00,"NW_FARM3_MALAK");			
};
FUNC VOID Rtn_Pass_952 () //RUINE
{
     TA_Guide_Player 		(09,00,12,00,"NW_FARM3_MOUNTAINLAKE_05"); 
     TA_Guide_Player	    (12,00,09,00,"NW_FARM3_MOUNTAINLAKE_05");			
};

FUNC VOID Rtn_Senyan_952 ()
{
	TA_Sit_Campfire    (10,00,12,00,"NW_FARM4_WOOD_RANGERBANDITS_03");
	TA_Sit_Campfire    (12,00,10,00,"NW_FARM4_WOOD_RANGERBANDITS_03");
};