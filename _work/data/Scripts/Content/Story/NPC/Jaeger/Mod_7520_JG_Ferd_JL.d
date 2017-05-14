instance Mod_7520_JG_Ferd_JL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Ferd"; 
	guild 		= GIL_OUT;
	id 			= 7520;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_main;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_NormalBart22, BodyTex_N,ITAR_Leather_L);	
	Mdl_SetModelFatness	(self,2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7520;
};

FUNC VOID Rtn_Start_7520()
{	
	TA_Sit_Bench	(07,00,09,00,"JL_21");
	TA_Smalltalk 	(09,00,12,00,"JL_35");
	TA_Smalltalk 	(12,00,16,00,"JL_05");        
	TA_Sit_Bench 	(16,00,21,00,"JL_21");
	TA_Sleep 	(21,00,07,00,"JL_39");
};