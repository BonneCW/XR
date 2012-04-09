instance Mod_7365_OUT_Margarethe_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Margarethe";
	guild 		= GIL_OUT;
	id 			= 7365;
	voice 		= 17;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;
	
	// ------ Equippte Waffen ------																	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	EquipItem (self, ItMw_1h_Bau_Mace);
	
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe1", FaceBabe_N_GreyCloth, BodyTex_N, ITAR_VlkBabe_M);	
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 15); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_7365;
};

FUNC VOID Rtn_PreStart_7365 ()
{	
	TA_Sit_Chair		(08,00,20,00,"REL_CITY_177");
	TA_Sit_Chair 		(20,00,08,00,"REL_CITY_177");
};

FUNC VOID Rtn_Start_7365 ()
{	
	TA_Stand_Sweeping	(07,00,11,00,"REL_CITY_163");
	TA_Cook_Stove 		(11,00,18,00,"REL_CITY_164");
	TA_Stand_Sweeping	 	(18,00,22,00,"REL_CITY_163");
	TA_Sleep	 	(22,00,07,00,"REL_CITY_162");
};