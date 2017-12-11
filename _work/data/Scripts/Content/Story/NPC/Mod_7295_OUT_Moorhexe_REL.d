INSTANCE Mod_7295_OUT_Moorhexe_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Moorhexe";
	guild 		= GIL_DMT;
	id 			= 7295;
	voice		= 19;
	flags       = 0;				
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;
	
	// ------ Equippte Waffen ------		
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------				
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe", 216, 24, NO_ARMOR);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 80); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7295;
};

FUNC VOID Rtn_Start_7295()
{
	TA_Sit_Campfire	(22,00,06,00,"REL_MOOR_130");
	TA_Wash_FP	(06,00,08,00,"REL_MOOR_131");
	TA_Pick_FP	(08,00,18,00,"REL_MOOR_131");
	TA_Wash_FP	(18,00,22,00,"REL_MOOR_131");
};