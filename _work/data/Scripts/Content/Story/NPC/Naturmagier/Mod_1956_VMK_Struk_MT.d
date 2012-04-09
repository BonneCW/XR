instance Mod_1956_VMK_Struk_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Struk";	
	guild 		= GIL_out;
	id 			= 1956;
	voice 		= 13;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);	

	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_2H_Eminem_Goldschwert_01);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", 239, BodyTex_B, ITAR_Verwandlungskrieger);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 65); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1956;
};

FUNC VOID Rtn_Start_1956 ()
{	
	TA_Practice_Sword	(08,00,20,00,"OW_PATH_176");
	TA_Practice_Sword	(20,00,08,00,"OW_PATH_176");
};

FUNC VOID Rtn_ATGATE_1956 ()
{	
	TA_Smalltalk	(08,00,20,00,"OW_PATH_175_GATE2");
	TA_Smalltalk	(20,00,08,00,"OW_PATH_175_GATE2");
};

FUNC VOID Rtn_FollowPlayer_1956 ()
{	
	TA_Follow_Player	(08,00,20,00,"OW_PATH_176_TEMPELFOCUS4");
	TA_Follow_Player	(20,00,08,00,"OW_PATH_176_TEMPELFOCUS4");
};

FUNC VOID Rtn_TOT_1956 ()
{	
	TA_Smalltalk	(08,00,20,00,"TOT");
	TA_Smalltalk	(20,00,08,00,"TOT");
};