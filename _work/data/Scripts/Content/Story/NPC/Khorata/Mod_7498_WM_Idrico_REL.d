instance Mod_7498_WM_Idrico_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Idrico";
	guild 		= GIL_OUT;
	id 			= 7498;
	voice 		= 8;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																			
	EquipItem	(self, ItMW_Addon_Stab03);
	
	// ------ Inventory ------
	// Händler
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal02, BodyTex_N, ITAR_Prisoner);	
	Mdl_SetModelFatness	(self, 1.5);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 50); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7498;
};

FUNC VOID Rtn_Start_7498 ()
{
	TA_Preach_Idrico	(05,15,20,04,"REL_CITY_180");
	TA_Preach_Idrico 	(20,04,05,15,"REL_CITY_180");
};