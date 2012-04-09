instance Mod_573_NONE_Elvrich_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Elvrich"; 
	guild 		= GIL_PAL;
	id 			= 573;
	voice 		= 24;
	flags       = 0;
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
	
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	aivar[AIV_IgnoresArmor] 		= TRUE;
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1h_Bau_Mace); 
		
	// ------ Inventory ------
	// 

	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_B_Normal01, BodyTex_B, ITAR_Bau_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_573;
};

FUNC VOID Rtn_Start_573 ()
{	
	TA_Repair_Hut	(06,05,00,05,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	TA_Sit_Bench 	(00,05,06,05,"NW_CITY_MERCHANT_HUT_01_FRONT");
};

FUNC VOID Rtn_Kurgan_573 ()
{	
	TA_Repair_Hut		(01,00,23,00,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	TA_Smalltalk_Plaudern 	(23,00,01,00,"NW_CITY_HABOUR_SMALLTALK_02");
};

FUNC VOID Rtn_TOT_573()
{
	TA_Sleep	(08,00,22,00,"TOT");
	TA_Sleep	(22,00,08,00,"TOT");
};