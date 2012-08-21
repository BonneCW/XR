instance Mod_7773_BDT_Bandit_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Räuber";
	guild 		= GIL_STRF;
	id 			= 7773;
	voice 		= 10;
	flags      	= 0;
	npctype		= NPCTYPE_MAIN;
	
	//aivars
	aivar[AIV_NewsOverride] = TRUE;
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Banditenschwert);
	EquipItem (self, ItRw_Bow_M_02);
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_N_Cipher_neu, BodyTex_N, ITAR_BDT_M_01);	
	Mdl_SetModelFatness	(self, - 0.5);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 70); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_7773;
};
FUNC VOID Rtn_Start_7773 ()
{
	TA_Sit_Campfire	(12,30,18,00,"NW_XARDAS_TOWER_LESTER"); 
	TA_Sit_Campfire	(18,00,12,30,"NW_XARDAS_TOWER_LESTER");			
};