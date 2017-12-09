INSTANCE Mod_7281_OUT_Felicita_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Felicita"; 
	guild 		= GIL_OUT;
	id 			= 7281;
	voice		= 19;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	// ------ visuals ------						FaceBabe_N_HairAndCloth																
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe", FaceBabe_B_RedLocks, BodyTexBabe_B, ITAR_VlkBabe_L);	
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7281;
};

FUNC VOID Rtn_Start_7281 ()
{	
	TA_Sit_Chair	(05,30,20,30,"REL_CITY_196");
	TA_Sleep	(20,30,00,30,"REL_CITY_198");
	TA_Sit_Chair	(00,30,05,30,"REL_CITY_197");
};

FUNC VOID Rtn_Schneider_7281 ()
{	
	TA_Stand_ArmsCrossed	(05,30,20,30,"REL_CITY_231");
	TA_Stand_ArmsCrossed	(00,30,05,30,"REL_CITY_231");
};