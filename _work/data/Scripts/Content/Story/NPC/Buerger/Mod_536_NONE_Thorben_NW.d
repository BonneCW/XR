INSTANCE Mod_536_NONE_Thorben_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Thorben";
	guild 		= GIL_PAL;
	id 			= 536;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic 		= FAI_HUMAN_COWARD;
	
	// ------ Equippte Waffen ------																
	EquipItem (self, ItMw_1h_Bau_Mace);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems	(self, itke_lockpick, 30);
	CreateInvItems	(self, ItMi_Ast, 100);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal04, BodyTex_N,ITAR_Vlk_L);	
	Mdl_SetModelFatness	(self,1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_536;
};

FUNC VOID Rtn_Start_536()
{	
	TA_Saw			(06,00,09,00,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	TA_Saw			(09,00,13,05,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	TA_Smalltalk		(13,05,14,00,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	TA_Saw			(14,00,16,00,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	TA_Saw			(16,00,17,05,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	TA_Smalltalk		(17,05,18,00,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	TA_Saw			(18,00,19,00,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	TA_Stand_Drinking	(19,00,24,00,"NW_CITY_TAVERN_IN_04");
	TA_Sleep 		(00,00,06,00,"NW_CITY_BED_BOSPER");
};

FUNC VOID Rtn_TagPause_536()
{	
	TA_Saw			(12,00,13,05,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	TA_Smalltalk		(13,05,14,00,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	TA_Saw			(14,00,16,00,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	TA_Saw			(16,00,17,05,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	TA_Smalltalk		(17,05,18,00,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	TA_Saw			(18,00,19,00,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	TA_Stand_Drinking	(19,00,24,00,"NW_CITY_TAVERN_IN_04");
	TA_Sleep 		(00,00,12,00,"NW_CITY_BED_BOSPER");
};

FUNC VOID Rtn_Regen_536()
{	
	TA_FleeRain		(06,00,00,00,"NW_CITY_CHAIR_BOSPER"); 
	TA_Sleep 		(00,00,06,00,"NW_CITY_BED_BOSPER");
};

FUNC VOID Rtn_KO_536()
{	
	TA_Sleep_Deep		(06,00,00,00,"NW_CITY_BED_BOSPER"); 
	TA_Sleep_Deep 		(00,00,06,00,"NW_CITY_BED_BOSPER");
};

FUNC VOID Rtn_Groggy_536()
{	
	TA_Sleep		(06,00,00,00,"NW_CITY_BED_BOSPER"); 
	TA_Sleep 		(00,00,06,00,"NW_CITY_BED_BOSPER");
};