instance Mod_501_RIT_Gerold_NW  (Npc_Default)
{
	// ------ NSC ------
	name 		= "Gerold";
	guild 		= GIL_PAL;
	id 			= 501;
	voice 		= 12;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Schwert_03);
	EquipItem			(self, ItRw_Mil_Crossbow);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Normal_Blade, BodyTex_N, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 70); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_501;
};

FUNC VOID Rtn_Start_501 ()
{	
	TA_Practice_Sword		(08,00,22,00,"NW_CITY_TRAIN_01");
	TA_Practice_Sword		(22,00,08,00,"NW_CITY_TRAIN_01");
};

FUNC VOID Rtn_Schiff_501 ()
{	
	TA_Practice_Sword		(08,00,22,00,"SHIP_DECK_10");
	TA_Practice_Sword		(22,00,08,00,"SHIP_DECK_10");
};

FUNC VOID Rtn_Pruegel_501 ()
{
	TA_Smalltalk_Plaudern	(07,00,19,00,"WP_RITTERSCENE_02");
	TA_Smalltalk_Plaudern	(19,00,07,00,"WP_RITTERSCENE_02");	
};