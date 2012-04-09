INSTANCE Mod_9000_KDW_Saturas_AW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Saturas";
	guild 		= GIL_NOV; 
	id 			= 9000;
	voice 		= 14;
	flags       = NPC_FLAG_IMMORTAL;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ aivars ------
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;	
	
	// ------ AIVARS ------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	aivar[AIV_IgnoresArmor] 		= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMW_Addon_Stab03);																	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
			
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Saturas, BodyTex_B, ITAR_KDW_M);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	 
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 100); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_9000;
};

FUNC VOID Rtn_PreStart_9000 ()
{	
	TA_Study_WP	(08,25,09,35,"ADW_ENTRANCE_BUILDING2_01A");
	TA_Study_WP	(09,35,10,45,"ADW_ENTRANCE_BUILDING2_04");
	TA_Study_WP	(10,45,11,55,"ADW_ENTRANCE_PLATEAU_21");
	TA_Study_WP	(11,55,12,05,"ADW_ENTRANCE_BUILDING2_01A");

	TA_Study_WP	(12,05,13,15,"ADW_ENTRANCE_BUILDING2_04");
	TA_Study_WP	(13,15,14,25,"ADW_ENTRANCE_PLATEAU_21");
	TA_Study_WP	(14,25,15,35,"ADW_ENTRANCE_BUILDING2_01A");
	TA_Study_WP	(15,35,16,45,"ADW_ENTRANCE_BUILDING2_04");
	TA_Study_WP	(16,45,17,55,"ADW_ENTRANCE_PLATEAU_21");
	TA_Study_WP	(17,55,18,05,"ADW_ENTRANCE_BUILDING2_01A");


	TA_Sit_Bench (18,05,19,15,"ADW_ENTRANCE_BUILDING2_02A");
	TA_Study_WP	 (19,15,20,25,"ADW_ENTRANCE_BUILDING2_04");
	TA_Sit_Bench (20,25,21,35,"ADW_ENTRANCE_BUILDING2_02A");
	TA_Study_WP	 (21,35,22,45,"ADW_ENTRANCE_BUILDING2_04");
	TA_Sit_Bench (22,45,01,15,"ADW_ENTRANCE_BUILDING2_02A");
	TA_Study_WP	 (01,15,03,25,"ADW_ENTRANCE_BUILDING2_04");
	TA_Sit_Bench (03,25,05,35,"ADW_ENTRANCE_BUILDING2_02A");
	TA_Study_WP	 (05,35,07,45,"ADW_ENTRANCE_BUILDING2_04");
	TA_Sit_Bench (07,45,08,25,"ADW_ENTRANCE_BUILDING2_02A");
};

FUNC VOID Rtn_GUIDETOFOKUS_9000()
{
	TA_Guide_Player	(08,00,22,00,"ADW_PORTALTEMPEL_TELEPORTSTATION");
	TA_Guide_Player	(22,00,08,00,"ADW_PORTALTEMPEL_TELEPORTSTATION");
};

FUNC VOID Rtn_TOT_9000()
{
	TA_Stand_WP	(08,00,22,00,"TOT");
	TA_Stand_WP	(22,00,08,00,"TOT");
};

FUNC VOID Rtn_Dieb_9000()
{
	TA_Stand_ArmsCrossed	(08,00,22,00,"ADW_SATURAS_START");
	TA_Stand_ArmsCrossed	(22,00,08,00,"ADW_SATURAS_START");
};