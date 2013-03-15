INSTANCE Mod_923_NOV_Opolos_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Opolos";
	guild 		= GIL_VLK;
	id 			= 923;
	voice 		= 31;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_1h_Nov_Mace); 
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_B_Tough_Silas, BodyTex_B, ITAR_NOV_M);		
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 25); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_923;
};

FUNC VOID Rtn_Start_923()
{	
	TA_Stand_Guarding	(08,00,23,00,"NW_MONASTERY_SHEEP_05");
    TA_Stand_Guarding	(23,00,08,00,"NW_MONASTERY_SHEEP_05");
};

FUNC VOID Rtn_Drachen_923()
{	
	TA_Sit_Chair	(08,00,23,00,"NW_TAVERNE_IN_RANGERMEETING_LARES");
    TA_Sit_Chair	(23,00,08,00,"NW_TAVERNE_IN_RANGERMEETING_LARES");
};