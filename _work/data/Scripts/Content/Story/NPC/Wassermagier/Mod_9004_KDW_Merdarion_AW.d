INSTANCE Mod_9004_KDW_Merdarion_AW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Merdarion";
	guild 		= GIL_NOV; 
	id 			= 9004;
	voice 		= 6;
	flags       = NPC_FLAG_IMMORTAL;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ aivars ------
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[AIV_IgnoresFakeGuild] = TRUE;
	aivar[AIV_IgnoresArmor] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);															
	EquipItem	(self, ItMW_Addon_Stab03);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
			
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_P_NormalBart_Nefarius, BodyTex_P, ITAR_KDW_L_ADDON);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 55); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_9004;
};

FUNC VOID Rtn_PreStart_9004 ()
{	
	TA_Study_WP	(06,05,07,15,"ADW_ENTRANCE_01");
	TA_Study_WP	(07,15,08,25,"ADW_ENTRANCE_02");
	TA_Study_WP	(08,25,09,35,"ADW_ENTRANCE_01");
	TA_Study_WP	(09,35,10,45,"ADW_ENTRANCE_02");
	TA_Study_WP	(10,45,11,55,"ADW_ENTRANCE_01");
	TA_Study_WP	(11,55,12,05,"ADW_ENTRANCE_02");

	TA_Study_WP	(12,05,13,15,"ADW_ENTRANCE_01");
	TA_Study_WP	(13,15,14,25,"ADW_ENTRANCE_02");
	TA_Study_WP	(14,25,15,35,"ADW_ENTRANCE_01");
	TA_Study_WP	(15,35,16,45,"ADW_ENTRANCE_02");
	TA_Study_WP	(16,45,17,55,"ADW_ENTRANCE_01");
	TA_Study_WP	(17,55,18,05,"ADW_ENTRANCE_02");

	TA_Study_WP	(18,05,19,15,"ADW_ENTRANCE_01");
	TA_Study_WP	(19,15,20,25,"ADW_ENTRANCE_02");
	TA_Study_WP	(20,25,21,35,"ADW_ENTRANCE_01");
	TA_Study_WP	(21,35,22,45,"ADW_ENTRANCE_02");

	TA_Stand_ArmsCrossed 	(22,45,06,05,"ADW_ENTRANCE_BUILDING2_05");
};

FUNC VOID Rtn_Start_9004 ()
{	
	TA_Study_WP	(06,05,07,15,"ADW_ENTRANCE_01");
	TA_Study_WP	(07,15,08,25,"ADW_ENTRANCE_02");
	TA_Study_WP	(08,25,09,35,"ADW_ENTRANCE_01");
	TA_Study_WP	(09,35,10,45,"ADW_ENTRANCE_02");
	TA_Study_WP	(10,45,11,55,"ADW_ENTRANCE_01");
	TA_Study_WP	(11,55,12,05,"ADW_ENTRANCE_02");

	TA_Study_WP	(12,05,13,15,"ADW_ENTRANCE_01");
	TA_Study_WP	(13,15,14,25,"ADW_ENTRANCE_02");
	TA_Study_WP	(14,25,15,35,"ADW_ENTRANCE_01");
	TA_Study_WP	(15,35,16,45,"ADW_ENTRANCE_02");
	TA_Study_WP	(16,45,17,55,"ADW_ENTRANCE_01");
	TA_Study_WP	(17,55,18,05,"ADW_ENTRANCE_02");

	TA_Study_WP	(18,05,19,15,"ADW_ENTRANCE_01");
	TA_Study_WP	(19,15,20,25,"ADW_ENTRANCE_02");
	TA_Study_WP	(20,25,21,35,"ADW_ENTRANCE_01");
	TA_Study_WP	(21,35,22,45,"ADW_ENTRANCE_02");

	TA_Sleep 	(22,45,06,05,"ADW_ENTRANCE_BUILDING2_05");
};

FUNC VOID Rtn_Plagegeister_9004 ()
{	
	TA_Sleep 	(06,05,22,45,"ADW_ENTRANCE_BUILDING2_05");
	TA_Sleep 	(22,45,06,05,"ADW_ENTRANCE_BUILDING2_05");
};