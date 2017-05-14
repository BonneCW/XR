instance Mod_1240_RIT_Paladin_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Ritter;
	guild 		= GIL_PAL;
	id 			= 1240;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_nw_paladin;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																

	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem			(self, ItMw_Schwert_03);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_P_Normal_Fletcher, BodyTex_P, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 55); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1240;
};

FUNC VOID Rtn_Start_1240 ()
{
	TA_Practice_Sword	(07,10,19,02,"NW_CITY_TRAIN_02");
	TA_Smalltalk		(19,02,22,00,"NW_CITY_UPTOWN_HUT_03_01_B");
    TA_Sleep			(22,00,07,10,"NW_CITY_LEOMAR_BED_04");	
};
