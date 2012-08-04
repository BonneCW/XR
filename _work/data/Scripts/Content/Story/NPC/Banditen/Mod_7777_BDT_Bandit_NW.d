instance Mod_7777_BDT_Bandit_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bandit";
	guild 		= GIL_STRF;
	id 			= 7777;
	voice 		= 8;
	flags      	= 0;
	npctype		= NPCTYPE_MAIN;
	
	
	//Aivars
	aivar[AIV_StoryBandit] = TRUE;
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Banditenschwert);

	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	CreateInvItems (self, ITKE_ADDON_SKINNER,1);
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_L_Tough01, BodyTex_L, ITAR_BDT_M_01);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 65); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_7777;
};

FUNC VOID Rtn_Start_7777 ()
{
	TA_Smalltalk	(08,00,20,00,"NW_XARDAS_TOWER_SECRET_CAVE_01");
	TA_Smalltalk	(20,00,08,00,"NW_XARDAS_TOWER_SECRET_CAVE_01");
};