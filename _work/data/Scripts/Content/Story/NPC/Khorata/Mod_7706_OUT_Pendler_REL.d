instance Mod_7706_OUT_Pendler_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Pendler"; 
	guild 		= GIL_OUT;
	id 			= 7706;
	voice		= 3;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem (self, ItMw_1H_quantarie_Schwert_01);	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_OldMan_Gravo, BodyTex_P,ITAR_Vlk_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7706;
};

FUNC VOID Rtn_Start_7706()
{
	TA_Pray_Innos		(07,00,07,30,"REL_129");
	TA_Smalltalk		(07,30,08,00,"REL_116");
	TA_Smalltalk		(08,00,18,00,"REL_SURFACE_207");
	TA_Smalltalk		(18,00,18,30,"REL_116");
	TA_Pee			(18,30,19,00,"REL_129");
	TA_Stand_Drinking	(19,00,23,55,"ALTEFESTUNG_014");
	TA_Sleep		(23,55,07,00,"REL_CITY_321");
};