instance Mod_945_SRF_Crimson_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Crimson";
	guild 		= GIL_NONE;
	id 			= 945;
	voice		= 0;
	flags      	= 0;
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Sense);

	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_N_NormalBart10, BodyTex_N, ITAR_SMITH);	
	Mdl_SetModelFatness	(self, -2);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 75); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_945;
};
FUNC VOID Rtn_Start_945 ()
{
    TA_Smith_Fire    (11,00,14,00,"ADW_MINE_HOEHLE_03");		
	TA_Smith_Fire    (14,00,11,00,"ADW_MINE_HOEHLE_03");		
};