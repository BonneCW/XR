instance Mod_7524_JG_Elsbeth_JL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Elsbeth";
	guild 		= GIL_OUT;
	id 			= 7524;
	voice		= 19;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	EquipItem (self, ItMw_1H_quantarie_Schwert_01);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe8", FaceBabe_N_Lilo, BodyTex_N, ITAR_VlkBabe_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7524;
};

FUNC VOID Rtn_Start_7524 ()
{	
	TA_Stand_Sweeping	(07,00,08,30,"ZELT_01");
	TA_Sit_Bench		(08,30,10,00,"JL_19");
	TA_Cook_Stove		(10,00,12,00,"JL_33");
	TA_Smalltalk 		(12,00,16,00,"JL_05");
	TA_Stand_Sweeping	(16,00,18,00,"JL_39");
	TA_Sit_Bench		(18,00,20,00,"JL_19");
	TA_Sleep	 	(20,00,07,00,"JL_40");
};