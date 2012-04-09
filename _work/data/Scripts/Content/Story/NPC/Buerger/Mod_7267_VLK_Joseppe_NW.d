instance Mod_7267_VLK_Joseppe_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Joseppe"; 
	guild 		= GIL_PAL;
	id 			= 7267;
	voice 		= 8;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_NormalBart06, BodyTex_N,ITAR_Vlk_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7267;
};

FUNC VOID Rtn_Start_7267()
{	
	TA_Stand_ArmsCrossed	(05,20,20,20,"NW_CITY_MERCHANT_PATH_15");
	TA_Stand_ArmsCrossed	(20,20,05,20,"NW_CITY_MERCHANT_TEMPLE_IN");
};
