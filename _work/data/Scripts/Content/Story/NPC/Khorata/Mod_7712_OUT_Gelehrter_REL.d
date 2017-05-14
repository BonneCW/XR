INSTANCE Mod_7712_OUT_Gelehrter_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Gelehrter";	
	guild 		= GIL_OUT;
	id 			= 7712;
	voice		= 0;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem (self, itmw_1h_bau_mace);
	
	// ------ Inventory ------
	// Händler
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic.", Face_N_OldBald_Jeremiah, BodyTex_N, ITAR_VLK_M);	
	Mdl_SetModelFatness	(self, 0);
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 35); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7712;
};

FUNC VOID Rtn_Start_7712 ()
{	
	TA_Study_WP		(12,00,14,00,"REL_CITY_149");
	TA_Sit_Chair		(14,00,22,00,"REL_CITY_023");
	TA_Sleep		(22,00,08,00,"REL_CITY_023");
	TA_Sit_Chair		(08,00,12,00,"REL_CITY_023");
};