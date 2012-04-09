instance Mod_7575_OUT_Baeckerfrau_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Frau des Bäckers";	
	guild 		= GIL_OUT;
	id 			= 7575;
	voice 		= 16;
	flags       = 0;																
	npctype		= NPCTYPE_AMBIENT;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	EquipItem (self, ItMw_1H_quantarie_Schwert_01);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_BabeHair", 226, BodyTex_N, ITAR_VlkBabe_L);	
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 15); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7575;
};

FUNC VOID Rtn_Start_7575 ()
{	
	TA_Stand_ArmsCrossed	(08,00,12,00,"REL_CITY_389");
	TA_Stand_Sweeping	(12,00,16,00,"BACKER_02");
	TA_Sweep_FP		(16,00,18,00,"BACKER_02");
	TA_Sit_Throne	 	(18,00,21,00,"BACKER_03");
	TA_Sleep	 	(21,00,05,00,"BACKER_04");
};