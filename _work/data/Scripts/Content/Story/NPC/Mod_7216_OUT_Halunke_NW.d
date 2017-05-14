instance Mod_7216_OUT_Halunke_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Halunke"; 
	guild 		= GIL_OUT;
	id 			= 7216;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_Nagelkeule); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Lefty, BodyTex_N,ITAR_BDT_M_01);
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7216;
};

FUNC VOID Rtn_Start_7216()
{	
	TA_Stand_ArmsCrossed	(06,05,20,15,"NW_TROLLAREA_RUINS_01");
	TA_Stand_ArmsCrossed	(20,15,06,05,"NW_TROLLAREA_RUINS_01"); 
};
