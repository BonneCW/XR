instance Mod_569_RIT_Cedric_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Cedric";
	guild 		= GIL_PAL;
	id 			= 569;
	voice 		= 12;
	flags       = 2;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Schwert_02);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_NormalBart10, BodyTex_N, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 55); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_569;
};

FUNC VOID Rtn_Start_569 ()
{
	TA_Practice_Sword	(07,00,19,00,"NW_CITY_TRAIN_01");
	TA_Sleep		(19,00,07,00,"NW_CITY_LEOMAR_BED_03");	
};

FUNC VOID Rtn_Schiff_569()
{
	TA_Stand_Guarding	(08,00,20,00,"SHIP_CREW_CAPTAIN");
	TA_Stand_Guarding	(20,00,08,00,"SHIP_CREW_CAPTAIN");
};

FUNC VOID Rtn_Pruegel_569 ()
{
	TA_Smalltalk_Plaudern	(07,00,19,00,"WP_RITTERSCENE_01");
	TA_Smalltalk_Plaudern	(19,00,07,00,"WP_RITTERSCENE_01");	
};