instance Mod_7016_HS_Bauer_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bauer"; 
	guild 		= GIL_OUT;
	id 			= 7016;
	voice 		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//--------Aivars-----------
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 0);
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem (self, ItMw_1h_Bau_Mace);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NORMAL19, BodyTex_N,ITAR_Hofstaatler);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self,30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7016;
};

FUNC VOID Rtn_Start_7016()
{	
	TA_Rake_FP		(04,30,20,30,"REL_269");
	TA_Sleep			(20,30,04,30,"REL_269");
};