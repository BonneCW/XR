INSTANCE Mod_7593_OUT_Handlanger_TUG (Npc_Default)
{
	// ------ NSC ------
	name 		= "Handlanger";
	guild 		= GIL_OUT;
	id 			= 7593;
	voice 		= 1;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	aivar[AIV_NPCIsRanger] = TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1H_quantarie_Schwert_01);
	
	// ------ Inventory ------
	// Händler
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_Markus_Kark, BodyTex_N, ITAR_Leather_L);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7593;
};

FUNC VOID Rtn_Start_7593 ()
{	
	TA_Stand_ArmsCrossed	(08,00,22,00,"TUG_87");
	TA_Stand_ArmsCrossed	(22,00,08,00,"TUG_87");
};