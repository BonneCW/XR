INSTANCE Mod_530_NONE_Regis_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Regis"; 
	guild 		= GIL_NONE;
	id 			= 530;
	voice 		= 13;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Mordrag, BodyTex_N,ITAR_BuergerNew_01);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_530;
};
FUNC VOID Rtn_Start_530 ()
{	
	TA_Sit_Bench	(05,30,20,30,"NW_CITY_REGIS");
	TA_Smalltalk	(20,30,00,30,"NW_CITY_MERCHANT_PATH_14_A");
	TA_Sit_Chair	(00,30,05,30,"NW_CITY_TAVERN_IN_04");
};