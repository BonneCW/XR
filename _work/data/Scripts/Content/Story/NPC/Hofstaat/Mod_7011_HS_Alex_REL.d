instance Mod_7011_HS_Alex_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Alex"; 
	guild 		= GIL_OUT;
	id 			= 7011;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Normal_Olli_Kahn, BodyTex_N,ITAR_Hofstaatler);	
	Mdl_SetModelFatness	(self,1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7011;
};

FUNC VOID Rtn_Start_7011()
{	
	TA_Rake_FP	(05,35,11,30,"REL_247");
	TA_Rake_FP 	(11,30,05,35,"REL_247");
};

FUNC VOID Rtn_Intro_7011()
{	
	TA_Smalltalk_Plaudern	(05,35,11,30,"REL_247");
	TA_Smalltalk_Plaudern 	(11,30,05,35,"REL_247");
};

FUNC VOID Rtn_Trunkenbold_7011()
{	
	TA_Stand_ArmsCrossed	(05,35,11,30,"REL_271");
	TA_Stand_ArmsCrossed 	(11,30,05,35,"REL_271");
};

FUNC VOID Rtn_Magier_7011()
{	
	TA_Stand_ArmsCrossed	(05,35,11,30,"REL_290");
	TA_Stand_ArmsCrossed 	(11,30,05,35,"REL_290");
};

FUNC VOID Rtn_VorTor_7011()
{	
	TA_Stand_ArmsCrossed	(05,35,11,30,"REL_246");
	TA_Stand_ArmsCrossed 	(11,30,05,35,"REL_246");
};

FUNC VOID Rtn_Loch_7011()
{	
	TA_Guide_Player		(05,35,11,30,"REL_236");
	TA_Guide_Player 	(11,30,05,35,"REL_236");
};

FUNC VOID Rtn_CrawlerLoch_7011()
{	
	TA_Stand_ArmsCrossed	(05,35,11,30,"REL_HS_007");
	TA_Stand_ArmsCrossed 	(11,30,05,35,"REL_HS_007");
};