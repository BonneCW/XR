instance Mod_7017_HS_Bauer_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bauer"; 
	guild 		= GIL_OUT;
	id 			= 7017;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1h_Bau_Mace); 
	B_CreateAmbientInv 	(self);
	
	// ------ Inventory ------
	// Händler
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart11, BodyTex_N,ITAR_Hofstaatler);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7017;
};
FUNC VOID Rtn_Start_7017()
{	
	
	TA_Rake_FP		(05,00,20,00,"REL_266"); 
    TA_Sleep					(20,00,05,00,"REL_266");
};