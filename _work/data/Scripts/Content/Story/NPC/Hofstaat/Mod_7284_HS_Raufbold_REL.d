INSTANCE Mod_7284_HS_Raufbold_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Königlicher Ritter von und zu Raufbold"; 
	guild 		= GIL_OUT;
	id 			= 7284;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Normal_Sharky, BodyTex_B,ITAR_Hofstaatler);	
	Mdl_SetModelFatness	(self,0);
	//Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds");
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7284;
};

FUNC VOID Rtn_Start_7284()
{	
	TA_Stand_Guarding 		(07,20,01,20,"REL_284");
	TA_Stand_Guarding		(01,20,07,20,"REL_284");
};

FUNC VOID Rtn_Freifluss_7284()
{	
	TA_Stand_Guarding 		(07,20,01,20,"REL_232");
	TA_Stand_Guarding		(01,20,07,20,"REL_232");
};

FUNC VOID Rtn_FlussFight_7285()
{	
	TA_Practice_Sword		(20,00,08,00,"REL_HS_006");
	TA_Practice_Sword		(08,00,20,00,"REL_HS_006");
};

FUNC VOID Rtn_Rennen_7284()
{	
	TA_RunToWP 		(07,20,01,20,"REL_284");
	TA_RunToWP		(01,20,07,20,"REL_284");
};