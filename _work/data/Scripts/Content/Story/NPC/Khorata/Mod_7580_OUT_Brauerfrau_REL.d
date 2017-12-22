instance Mod_7580_OUT_Brauerfrau_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Frau des Brauers";	//Frau vom 'Säger' 453
	guild 		= GIL_OUT;
	id 			= 7580;
	voice		= 43;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	//EquipItem (self, ItMw_1H_quantarie_Schwert_01);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe8", FaceBabe_N_Lilo, BodyTex_N, ITAR_VlkBabe_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7580;
};

FUNC VOID Rtn_Start_7580 ()
{	
	TA_Stand_Sweeping	(07,00,11,30,"BRAUERHOLZFASS");
	TA_Cook_Stove		(11,30,13,00,"BRAUERWOHNEN4");
	TA_Sit_Chair		(13,00,15,00,"BRAUERWOHNEN4");
	TA_Sweep_FP 		(15,00,18,00,"BRAUERWOHNEN4");
	TA_Cook_Stove		(18,00,21,00,"BRAUERWOHNEN4");
	TA_Sleep	 	(21,00,07,00,"BRAUERBETT02");
};