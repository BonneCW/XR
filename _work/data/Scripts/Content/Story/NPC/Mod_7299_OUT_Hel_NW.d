INSTANCE Mod_7299_OUT_Hel_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Hel";
	guild 		= GIL_DMT;
	id 			= 7299;
	voice 		= 26;
	flags       = 2;				
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;
	
	// ------ Equippte Waffen ------		
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------				
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe", FaceBabe_N_Blondie, BodyTexBabe_N, Erzrüstung);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 80); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7299;
};

FUNC VOID Rtn_Start_7299()
{
	TA_Stand_Guarding	(20,00,08,00,"NW_CRYPT_01");
	TA_Stand_Guarding	(08,00,20,00,"NW_CRYPT_01");
};

FUNC VOID Rtn_Flucht_7299()
{
	TA_Stand_Guarding	(20,00,08,00,"NW_CRYPT_IN_02");
	TA_Stand_Guarding	(08,00,20,00,"NW_CRYPT_IN_02");
};

FUNC VOID Rtn_Krypta_7299()
{
	TA_Stand_Guarding	(20,00,08,00,"NW_CRYPT_IN_11");
	TA_Stand_Guarding	(08,00,20,00,"NW_CRYPT_IN_11");
};