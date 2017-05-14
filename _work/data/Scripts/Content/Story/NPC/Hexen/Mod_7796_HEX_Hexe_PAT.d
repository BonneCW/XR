instance Mod_7796_HEX_Hexe_PAT (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_hexe;	
	guild 		= GIL_OUT;
	id 			= 7796;
	voice		= 0;
	flags       = 2;																	
	npctype		= NPCTYPE_pat_hexe;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe1", FaceBabe_N_Anne, BodyTex_N, ITAR_Hexe);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7796;
};

FUNC VOID Rtn_Start_7796 ()
{	
	TA_Stand_Guarding 	(08,00,10,00,"WP_PAT_FOKUS_05_04");
	TA_Stand_Guarding	(10,00,08,00,"WP_PAT_FOKUS_05_04");    
};