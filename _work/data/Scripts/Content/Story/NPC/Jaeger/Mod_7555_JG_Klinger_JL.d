INSTANCE Mod_7555_JG_Klinger_JL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Klinger";
	guild 		= GIL_OUT;
	id 			= 7555;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic 		= FAI_HUMAN_COWARD;
	
	// ------ Equippte Waffen ------																
	EquipItem (self, ItMw_1H_quantarie_Schwert_01);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal04, BodyTex_N, ITAR_Schattenläufer);	
	Mdl_SetModelFatness	(self,1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7555;
};

FUNC VOID Rtn_Start_7555()
{	
	TA_Sit_Bench		(06,00,09,00,"JL_19");
	TA_Practice_Sword	(09,00,13,05,"JL_46");
	TA_Stand_Eating		(13,05,14,00,"JL_17");
	TA_Saw			(14,00,20,00,"JL_46");
	TA_Sit_Bench		(20,00,23,00,"JL_19"); 
	TA_Sleep 		(23,00,06,00,"JL_39");
};