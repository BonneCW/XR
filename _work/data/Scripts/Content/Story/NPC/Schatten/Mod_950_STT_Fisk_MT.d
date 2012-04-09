instance Mod_950_STT_Fisk_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Fisk";
	guild 		= GIL_OUT;
	id 			= 950;
	voice 		= 12;
	flags      	= 0;
	npctype		= NPCTYPE_main;
	
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Sld_Sword);
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Cavalorn, BodyTex_B, STT_ARMOR_H);	
	Mdl_SetModelFatness	(self, -1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 65); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_PreStart_950;
};

FUNC VOID Rtn_PreStart_950 ()
{
	TA_Sleep	(22,30,07,30,"OCR_HUT_49");
	TA_Sit_Bench	(07,30,12,00,"OCR_OUTSIDE_HUT_49");
	TA_Stand_Eating	(12,00,14,00,"OCR_MARKETPLACE_HANGAROUND");
	TA_Sit_Bench	(14,00,18,00,"OCR_OUTSIDE_HUT_49");
	TA_Sit_Bench	(18,00,22,30,"OCR_MARKETPLACE_HANGAROUND");
};

FUNC VOID Rtn_Tot_950 ()
{
	TA_Cook_Cauldron		(08,00,18,00,"TOT");
	TA_Cook_Cauldron		(18,00,08,00,"TOT");
};