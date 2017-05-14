instance Mod_7677_RIT_Ritter_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Ritter;
	guild 		= GIL_OUT;
	id 			= 7677;
	voice		= 0;
	flags       = 2;																	
	npctype		= NPCTYPE_nw_paladin;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Schwert_03);
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_NormalBart22, BodyTex_N, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 80); 
		
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7677;
};

FUNC VOID Rtn_Start_7677 ()
{
	TA_Stand_Guarding	(08,00,23,00,"NW_PASS_ORKS_12");
	TA_Stand_Guarding	(23,00,08,00,"NW_PASS_ORKS_12");	
};