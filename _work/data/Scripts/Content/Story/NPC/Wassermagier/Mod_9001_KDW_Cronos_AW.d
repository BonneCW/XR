INSTANCE Mod_9001_KDW_Cronos_AW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Cronos";
	guild 		= GIL_NOV;
	id 			= 9001;
	voice		= 0; 
	flags       = NPC_FLAG_IMMORTAL;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ aivars ------
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------															
	EquipItem	(self, ItMW_Addon_Stab03);																	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
			
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_P_NormalBart_Cronos, BodyTex_P, ITAR_KDW_L_ADDON);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 55); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_9001;
};

FUNC VOID Rtn_Start_9001 ()
{	
	TA_Study_WP	(06,35,07,35,"ADW_ENTRANCE_PLATEAU_13A");
	TA_Study_WP	(07,35,08,35,"ADW_ENTRANCE_PLATEAU_04A");
	TA_Study_WP	(08,35,09,35,"ADW_ENTRANCE_PLATEAU_05A");
	TA_Study_WP	(09,35,10,10,"ADW_ENTRANCE_PLATEAU_13A");
	TA_Study_WP	(10,10,11,15,"ADW_ENTRANCE_PLATEAU_05A");
	TA_Study_WP	(11,15,12,35,"ADW_ENTRANCE_PLATEAU_04A");

	TA_Study_WP	(12,35,13,35,"ADW_ENTRANCE_PLATEAU_13A");
	TA_Study_WP	(13,35,14,35,"ADW_ENTRANCE_PLATEAU_04A");
	TA_Study_WP	(14,35,15,35,"ADW_ENTRANCE_PLATEAU_05A");
	TA_Study_WP	(15,35,16,10,"ADW_ENTRANCE_PLATEAU_13A");
	TA_Study_WP	(16,10,17,15,"ADW_ENTRANCE_PLATEAU_04A");
	TA_Study_WP	(17,15,18,35,"ADW_ENTRANCE_PLATEAU_05A");

	TA_Study_WP	(18,35,19,35,"ADW_ENTRANCE_PLATEAU_13A");
	TA_Study_WP	(19,35,20,35,"ADW_ENTRANCE_PLATEAU_05A");
	TA_Study_WP	(20,35,21,35,"ADW_ENTRANCE_PLATEAU_04A");
	TA_Study_WP	(21,35,22,00,"ADW_ENTRANCE_PLATEAU_13A");

	TA_Sit_Chair 	(22,00,06,35,"ADW_ENTRANCE_BUILDING2_03");
};

FUNC VOID Rtn_Plagegeister_9001 ()
{
	TA_Sit_Chair 	(06,00,22,00,"ADW_ENTRANCE_BUILDING2_03");
	TA_Sit_Chair 	(22,00,06,00,"ADW_ENTRANCE_BUILDING2_03");
};