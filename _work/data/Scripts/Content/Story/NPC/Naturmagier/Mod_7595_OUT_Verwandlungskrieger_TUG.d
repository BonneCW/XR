instance Mod_7595_OUT_Verwandlungskrieger_TUG (Npc_Default)
{
	// ------ NSC ------
	name 		= "Verwandlungskrieger"; 
	guild 		= GIL_OUT;
	id 			= 7595;
	voice 		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_Asghan, BodyTex_N, ITAR_Verwandlungskrieger);	
	Mdl_SetModelFatness	(self,1);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 45); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7595;
};

FUNC VOID Rtn_Start_7595()
{	
	TA_Stand_ArmsCrossed		(06,05,20,15,"TUG_89");
	TA_Stand_ArmsCrossed		(20,15,06,05,"TUG_89"); 
};