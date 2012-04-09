instance Mod_1932_FH_Kimon_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Kimon";
	guild 		= GIL_OUT;
	id 			= 1932;
	voice 		= 4;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1H_Neok_Zeusschwert_01);
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Normal06, BodyTex_N, ITAR_VLK_H);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 80); 
		
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1932;
};

FUNC VOID Rtn_Start_1932 ()
{
	TA_Sit_Campfire	(08,00,23,00,"NW_MONASTERY_SHRINE_01");
	TA_Sit_Campfire	(23,00,08,00,"NW_MONASTERY_SHRINE_01");	
};

FUNC VOID Rtn_Weg_1932 ()
{
	TA_Stand_ArmsCrossed	(12,00,24,00,"TOT");
	TA_Sit_Chair		(00,00,12,00,"NW_CITY_TAVERN_IN_05");	
};

