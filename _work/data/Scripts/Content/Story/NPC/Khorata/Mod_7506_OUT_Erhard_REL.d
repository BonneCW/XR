instance Mod_7506_OUT_Erhard_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Erhard"; 
	guild 		= GIL_OUT;
	id 			= 7506;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																		
	EquipItem (self, ItRw_Bow_L_03); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_Asghan, BodyTex_N, ITAR_Bau_M);	
	Mdl_SetModelFatness	(self,1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7506;
};

FUNC VOID Rtn_Start_7506()
{	
	TA_Stand_ArmsCrossed	(06,05,20,15,"REL_SURFACE_041");
	TA_Sit_Chair		(20,15,22,15,"REL_SCHEUNESCHLAFEN4");
	TA_Sleep		(22,15,06,05,"REL_SCHEUNESCHLAFEN4"); 
};