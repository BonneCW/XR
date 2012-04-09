instance Mod_7640_RDW_Cavalorn_AW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Cavalorn";
	guild 		= GIL_NOV;
	id 			= 7640;
	voice 		= 8;
	flags       = 0;	
	npctype		= NPCTYPE_FRIEND;
	
	// ------ Attribute ------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;

	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_AdanosKurzschwert);
	
	// ------ Inventory ------
	// Händler
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_B_Cavalorn, BodyTex_B, ITAR_RANGER_ADDON);	 
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7640;
};

FUNC VOID Rtn_Start_7640()
{
	TA_Follow_Player	(05,00,20,00,"ADW_ENTRANCE");
	TA_Follow_Player	(20,00,05,00,"ADW_ENTRANCE");
};

FUNC VOID Rtn_Tot_7640()
{
	TA_Stand_Guarding 	(05,00,20,00,"TOT");
	TA_Stand_Guarding	(20,00,05,00,"TOT");
};