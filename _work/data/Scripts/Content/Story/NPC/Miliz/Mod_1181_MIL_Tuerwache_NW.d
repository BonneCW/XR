instance Mod_1181_MIL_Tuerwache_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Richterhaus-Wache"; 	
	guild 		= GIL_pal;
	id 			= 1181;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_nw_miliz;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem			(self, ItMw_Milizschwert);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_L_ToughBald01, BodyTex_L, ITAR_MIL_M);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1181;
};

FUNC VOID Rtn_Start_1181 ()
{	
	TA_Stand_Guarding	(08,00,18,45,"NW_CITY_JUDGE_GUARD_01");
	TA_Stand_Guarding	(18,45,22,00,"NW_CITY_UPTOWN_JUDGE_01");
	TA_Stand_Guarding	(22,00,08,00,"NW_CITY_JUDGE_GUARD_01");
};

FUNC VOID Rtn_Richter_1181()
{	
	TA_Smalltalk_YussufWache 	(07,20,01,20,"NW_CITY_UPTOWN_PATH_19");
	TA_Smalltalk_YussufWache	(01,20,07,20,"NW_CITY_UPTOWN_PATH_19");
};
