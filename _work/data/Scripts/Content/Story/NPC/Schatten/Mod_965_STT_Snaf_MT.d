instance Mod_965_STT_Snaf_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Snaf";
	guild 		= GIL_OUT;
	id 			= 965;
	voice		= 0;
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
	CreateInvItems (self, ItFo_Addon_LousHammer, 1);
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Snaf, BodyTex_N, ITAR_SMITH);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 65); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_965;
};

FUNC VOID Rtn_Start_965 ()
{
	TA_Wash_FP		(08,00,08,30,"OCR_OUTSIDE_HUT_13_B");
	TA_Cook_Cauldron	(08,00,12,00,"OCR_CAULDRON_2");
	TA_Sit_Chair		(12,00,14,00,"OCR_HUT_14");
	TA_Cook_Cauldron	(14,00,20,00,"OCR_CAULDRON_2");
	TA_Smoke_Joint		(20,00,22,00,"OCR_CAULDRON_2");
	TA_Sleep		(22,00,08,00,"OCR_HUT_14");
};