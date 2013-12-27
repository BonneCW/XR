instance Mod_7704_OUT_Jesper_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Jesper"; 
	guild 		= GIL_OUT;
	id 			= 7704;
	voice 		= 36;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	
	//----------AIVARS--------------
	aivar[AIV_DropDeadAndKill] = TRUE;
	aivar[AIV_EnemyOverride] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1h_Vlk_Sword); 
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self, ItKe_Hotel, 1);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_Normal07, BodyTex_N,ITAR_Vlk_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7704;
};

FUNC VOID Rtn_Start_7704()
{	
	TA_Stand_Guarding	(08,00,22,00,"REL_CITY_302");
	TA_Stand_Guarding	(22,00,08,00,"REL_CITY_302");
};

FUNC VOID Rtn_Taverne_7704 ()
{	
	TA_RunToWP	(08,00,22,00,"REL_CITY_305");
	TA_RunToWP	(22,00,08,00,"REL_CITY_305");
};

FUNC VOID Rtn_Taverne2_7704 ()
{	
	TA_Sit_Chair	(08,00,22,00,"REL_CITY_305");
	TA_Sit_Chair	(22,00,08,00,"REL_CITY_305");
};

FUNC VOID Rtn_InHaus_7704()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"REL_CITY_057");
	TA_Stand_ArmsCrossed 	(20,00,08,00,"REL_CITY_057");
};

FUNC VOID Rtn_AtBib_7704()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"REL_CITY_148");
	TA_Stand_ArmsCrossed 	(20,00,08,00,"REL_CITY_148");
};

FUNC VOID Rtn_Hacken_7704()
{	
	TA_Pick_Ore		(08,00,20,00,"REL_CITY_060");
	TA_Pick_Ore	 	(20,00,08,00,"REL_CITY_060");
};

FUNC VOID Rtn_Schatzkammer_7704()
{	
	TA_Follow_Player	(08,00,20,00,"REL_CITY_060");
	TA_Follow_Player 	(20,00,08,00,"REL_CITY_060");
};

FUNC VOID Rtn_InSchatzkammer_7704()
{	
	TA_Pick_FP		(08,00,20,00,"REL_CITY_KANAL_027");
	TA_Pick_FP	 	(20,00,08,00,"REL_CITY_KANAL_027");
};

FUNC VOID Rtn_Gelehrter_7704()
{	
	TA_Pick_FP		(08,00,20,00,"REL_CITY_023");
	TA_Pick_FP	 	(20,00,08,00,"REL_CITY_023");
};

FUNC VOID Rtn_Tot_7704 ()
{	
	TA_RunToWP	(08,00,22,00,"TOT");
	TA_RunToWP	(22,00,08,00,"TOT");
};