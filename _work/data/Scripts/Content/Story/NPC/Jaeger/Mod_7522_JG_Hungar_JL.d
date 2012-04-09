instance Mod_7522_JG_Hungar_JL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Hungar"; 
	guild 		= GIL_OUT;
	id 			= 7522;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Lefty, BodyTex_N,ITAR_Leather_L);
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7522;
};

FUNC VOID Rtn_Start_7522()
{	
	TA_Stand_ArmsCrossed	(06,10,20,00,"JL_44");
	TA_Sit_Bench		(20,00,22,10,"JL_19");
	TA_Sleep		(22,10,06,10,"JL_40");
};