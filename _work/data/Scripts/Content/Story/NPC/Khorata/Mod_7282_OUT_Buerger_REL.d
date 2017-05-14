INSTANCE Mod_7282_OUT_Buerger_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bürger";	
	guild 		= GIL_OUT;
	id 			= 7282;
	voice		= 0;
	flags       = 0;																	
	npctype		= NPCTYPE_REL_BUERGER;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem (self, itmw_1h_bau_mace);
	
	// ------ Inventory ------
	// Händler
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_P_Normal02, BodyTex_P, ITAR_SMITH);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 35); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7282;
};

FUNC VOID Rtn_Start_7282 ()
{	
	TA_Potion_Alchemy	(08,00,18,00,"REL_CITY_185");
	TA_Sit_Throne		(18,00,22,00,"REL_CITY_185");
	TA_Sleep		(22,00,08,00,"REL_CITY_185");
};