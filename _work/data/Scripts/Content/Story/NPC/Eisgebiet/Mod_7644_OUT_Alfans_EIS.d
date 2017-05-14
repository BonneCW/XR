INSTANCE Mod_7644_OUT_Alfans_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Alfans";
	guild 		= GIL_OUT;
	id 			= 7644;
	voice		= 0;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_Markus_Kark, BodyTex_N, ITAR_Eisgebiet_01);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7644;
};

FUNC VOID Rtn_Start_7644 ()
{	
	TA_Stand_ArmsCrossed	(09,05,18,05,"MARKTHALLE_HANDEL_2");
	TA_Stand_Drinking	(18,05,23,05,"EIS_136");
	TA_Sleep 		(23,05,09,05,"EIS_ALFANS_HAUS_09");
};