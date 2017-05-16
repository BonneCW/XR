instance Mod_7537_KG_Minenwache_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= "Minenwache";	
	guild 		= GIL_OUT;
	id 			= 7537;
	voice		= 5;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Runenschwert);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Mordrag, BodyTex_N, SSLD_ARMOR);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7537;
};

FUNC VOID Rtn_Start_7537()
{	
	TA_Guard_Passage		(07,00,21,00,"OW_VM_ENTRANCE");
   	TA_Guard_Passage		(21,00,07,00,"OW_VM_ENTRANCE");
};
