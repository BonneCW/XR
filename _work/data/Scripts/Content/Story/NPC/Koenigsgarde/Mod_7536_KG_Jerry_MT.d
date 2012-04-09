INSTANCE Mod_7536_KG_Jerry_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Jerry"; 
	guild 		= GIL_OUT;
	id 			= 7536;
	voice 		= 4;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_ShortSword1); 
		
	// ------ Inventory ------
	// Händler

	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_B_Normal_Kirgo, BodyTex_B, ItAr_KG_01);	
	Mdl_SetModelFatness	(self,0.5);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7536;
};

FUNC VOID Rtn_Start_7536()
{	
	TA_Repair_Hut		(09,00,20,00,"MC_03");
	TA_Smalltalk		(20,00,21,00,"MC_02");
	TA_Sit_Campfire		(21,00,01,00,"MC_FP_3");
	TA_Sleep		(01,00,09,00,"MC_S_002");
};