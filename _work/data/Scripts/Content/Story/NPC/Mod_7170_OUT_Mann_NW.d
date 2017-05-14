instance Mod_7170_OUT_Mann_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Mann"; 
	guild 		= GIL_OUT;
	id 			= 7170;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//--------Aivars-----------
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem (self, ItMw_1h_Bau_Mace);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NORMAL19, BodyTex_N,ITAR_Leather_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self,30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7170;
};

FUNC VOID Rtn_Start_7170()
{	
	TA_Sit_Chair		(20,00,08,00,"NW_FARM2_HOUSE_IN_06");
	TA_Sit_Chair		(08,00,20,00,"NW_FARM2_HOUSE_IN_06");
};

FUNC VOID Rtn_AtDemon_7170 ()
{	
	TA_Sit_Campfire		(08,00,22,00,"NW_CASTLEMINE_TOWER_CAMPFIRE_04");
  	TA_Sit_Campfire		(22,00,08,00,"NW_CASTLEMINE_TOWER_CAMPFIRE_04");
};

FUNC VOID Rtn_AtBengar_7170 ()
{	
	TA_Smalltalk		(08,00,22,00,"NW_FARM3_BENGAR");
  	TA_Sit_Throne		(22,00,08,00,"NW_FARM3_HOUSE_IN_NAVI_2");
};

FUNC VOID Rtn_AtTaverne_7170()
{	
	TA_Sit_Chair		(20,00,08,00,"NW_TAVERNE_IN_RANGERMEETING");
	TA_Sit_Chair		(08,00,20,00,"NW_TAVERNE_IN_RANGERMEETING");
};