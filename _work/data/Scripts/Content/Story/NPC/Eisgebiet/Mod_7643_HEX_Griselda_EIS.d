instance Mod_7643_HEX_Griselda_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Griselda";
	guild 		= GIL_DMT;
	id 			= 7643;
	voice 		= 43;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;
	
	// ------ Equippte Waffen ------																	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	//EquipItem (self, ItMw_1h_Vlk_Dagger);
	
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe1", 180, BodyTex_N, ITAR_hexenqueen);	
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 15); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7643;
};

FUNC VOID Rtn_Start_7643 ()
{	
	TA_Sit_Throne	(04,55,22,05,"HEXE_22");
	TA_Sit_Throne	(22,05,04,55,"HEXE_22");
};

FUNC VOID Rtn_Arena_7643 ()
{	
	TA_Stand_ArmsCrossed	(04,55,22,05,"HEXE_ARENA_AUSKUCK");
	TA_Stand_ArmsCrossed	(22,05,04,55,"HEXE_ARENA_AUSKUCK");
};

FUNC VOID Rtn_Transform_7643 ()
{	
	TA_Turn_Harpie	(04,55,22,05,"HEXE_ARENA_AUSKUCK");
	TA_Turn_Harpie	(22,05,04,55,"HEXE_ARENA_AUSKUCK");
};

FUNC VOID Rtn_Tot_7643 ()
{	
	TA_Stand_ArmsCrossed	(04,55,22,05,"TOT");
	TA_Stand_ArmsCrossed	(22,05,04,55,"TOT");
};