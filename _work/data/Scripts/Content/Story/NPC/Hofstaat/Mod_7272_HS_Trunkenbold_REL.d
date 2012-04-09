instance Mod_7272_HS_Trunkenbold_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Trunkenbold"; 
	guild 		= GIL_OUT;
	id 			= 7272;
	voice 		= 4;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);															
		
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
	B_SetFightSkills (self, 100); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7272;
};

FUNC VOID Rtn_Start_7272()
{	
	TA_Sit_Bench	(04,50,20,00,"REL_272");
	TA_Sit_Bench	(20,00,04,50,"REL_272");
};