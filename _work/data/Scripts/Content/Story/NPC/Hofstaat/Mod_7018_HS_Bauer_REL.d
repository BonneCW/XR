instance Mod_7018_HS_Bauer_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bauer"; 
	guild 		= GIL_OUT;
	id 			= 7018;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1h_Bau_Mace); 
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);	
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Lefty, BodyTex_N,ITAR_Hofstaatler);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7018;
};

FUNC VOID Rtn_Start_7018()
{	
	TA_Rake_FP	(04,50,20,00,"REL_268");
    TA_Sleep	(20,00,04,50,"REL_268");
};