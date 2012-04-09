INSTANCE Mod_559_PAL_Albrecht_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Albrecht";
	guild 		= GIL_PAL;
	id 			= 559;
	voice 		= 3;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	

	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Paladinschwert);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_P_Tough_Rodriguez, BodyTex_P, ITAR_PAL_H);	
	Mdl_SetModelFatness	(self, 1.5);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 80); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_559;
};

FUNC VOID Rtn_Start_559 ()
{
	TA_Read_Bookstand		(08,00,23,00,"NW_CITY_ALBRECHT");
    TA_Read_Bookstand		(23,00,08,00,"NW_CITY_ALBRECHT");	
};

FUNC VOID Rtn_HagenKO_559 ()
{	
	TA_Smalltalk_Plaudern	(08,00,23,00,"NW_CITY_CITYHALL_WARROOM_05");
	TA_Smalltalk_Plaudern	(23,00,08,00,"NW_CITY_CITYHALL_WARROOM_05");
};