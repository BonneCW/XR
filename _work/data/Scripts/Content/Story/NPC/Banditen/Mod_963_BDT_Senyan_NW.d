instance Mod_963_BDT_Senyan_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Senyan";
	guild 		= GIL_OUT;
	id 			= 963;
	voice 		= 12;
	flags      	= 0;
	npctype		= NPCTYPE_MAIN;
	
	//aivars 
	aivar[AIV_NewsOverride]	   = TRUE;
	aivar[AIV_StoryBandit]	   = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Banditenschwert);

	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Tough_Pacho, BodyTex_B, ITAR_BDT_M_01);	
	Mdl_SetModelFatness	(self, 0.75);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_963;
};

FUNC VOID Rtn_Start_963 ()
{
	TA_Sit_Campfire    (10,00,12,00,"NW_FARM4_WOOD_RANGERBANDITS_03");
	TA_Sit_Campfire    (12,00,10,00,"NW_FARM4_WOOD_RANGERBANDITS_03");
};

FUNC VOID Rtn_Hoehle_963 ()
{
	TA_Stand_Drinking    (10,00,12,00,"NW_TELEPORTSTATION_CITY");
	TA_Stand_Drinking    (12,00,10,00,"NW_TELEPORTSTATION_CITY");
};