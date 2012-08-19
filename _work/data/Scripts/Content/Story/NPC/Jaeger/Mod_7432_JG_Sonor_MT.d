instance Mod_7432_JG_Sonor_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Sonor"; 
	guild 		= GIL_OUT;
	id 			= 7432;
	voice 		= 6;
	flags       = 2;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------
	EquipItem (self, ItRw_Bow_L_03);
	EquipItem (self, ItMw_1H_Sword_L_03);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_Asghan, BodyTex_N, ITAR_Leather_L);	
	Mdl_SetModelFatness	(self,1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7432;
};

FUNC VOID Rtn_Start_7432()
{	
	TA_Sit_Campfire		(06,05,20,15,"WP_MT_JAEGERLAGER_04");
	TA_Sit_Campfire		(20,15,06,05,"WP_MT_JAEGERLAGER_04"); 
};

FUNC VOID Rtn_Mine_7432()
{	
	TA_Follow_Player		(06,05,20,15,"WP_MT_JAEGERLAGER_04");
	TA_Follow_Player		(20,15,06,05,"WP_MT_JAEGERLAGER_04"); 
};