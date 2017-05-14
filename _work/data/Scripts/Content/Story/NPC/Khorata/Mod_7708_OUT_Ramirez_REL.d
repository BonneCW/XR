instance Mod_7708_OUT_Ramirez_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Ramirez"; 
	guild 		= GIL_OUT;
	id 			= 7708;
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
	daily_routine 		= Rtn_Start_7708;
};

FUNC VOID Rtn_Start_7708()
{
	TA_Sit_Throne		(07,00,23,00,"REL_CITY_314");
	TA_Sit_Throne		(23,00,07,00,"REL_CITY_314");
};

FUNC VOID Rtn_InHaus_7708()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"REL_CITY_057");
	TA_Stand_ArmsCrossed 	(20,00,08,00,"REL_CITY_057");
};

FUNC VOID Rtn_ToSchneider_7708()
{	
	TA_Guide_Player		(08,00,20,00,"REL_CITY_233");
	TA_Guide_Player 	(20,00,08,00,"REL_CITY_233");
};

FUNC VOID Rtn_Schneider_7708()
{	
	TA_Smalltalk_Ramirez	(08,00,20,00,"REL_CITY_236");
	TA_Smalltalk_Ramirez 	(20,00,08,00,"REL_CITY_236");
};

FUNC VOID Rtn_Tot_7708()
{	
	TA_Stand_ArmsCrossed		(07,00,23,00,"TOT");
	TA_Sit_Throne			(23,00,07,00,"TOT");
};

FUNC VOID Rtn_DokumenteLesen_7708()
{	
	TA_Study_WP	(08,00,20,00,"REL_CITY_057");
	TA_Study_WP	(20,00,08,00,"REL_CITY_057");
};

FUNC VOID Rtn_Hacken_7708()
{	
	TA_Pick_Ore		(08,00,20,00,"REL_CITY_060");
	TA_Pick_Ore	 	(20,00,08,00,"REL_CITY_060");
};

FUNC VOID Rtn_Schatzkammer_7708()
{	
	TA_Follow_Player	(08,00,20,00,"REL_CITY_060");
	TA_Follow_Player 	(20,00,08,00,"REL_CITY_060");
};

FUNC VOID Rtn_InSchatzkammer_7708()
{	
	TA_Pick_FP		(08,00,20,00,"REL_CITY_KANAL_027");
	TA_Pick_FP	 	(20,00,08,00,"REL_CITY_KANAL_027");
};