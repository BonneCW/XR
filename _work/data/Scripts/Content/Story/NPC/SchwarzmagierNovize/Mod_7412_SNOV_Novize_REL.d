INSTANCE Mod_7412_SNOV_Novize_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_Novize;
	guild 		= GIL_OUT;
	id 			= 7412;
	voice 		= 11;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_1h_sNov_Mace); 

	CreateInvItems	(self, ItSc_SumRabbit, 3);
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal06, BodyTex_N, ITAR_NOV_DMB_01);		
	Mdl_SetModelFatness	(self, -1);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 25); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7412;
};

FUNC VOID Rtn_Start_7412 ()
{	
	TA_Practice_Magic	(08,00,23,00,"REL_SURFACE_110");
	TA_Practice_Magic	(23,00,08,00,"REL_SURFACE_110");
};

FUNC VOID Rtn_Tot_7412 ()
{	
	TA_RunToWP	(08,00,23,00,"TOT");
	TA_RunToWP	(23,00,08,00,"TOT");
};