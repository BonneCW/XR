instance Mod_7515_OUT_Dalton_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Dalton"; 
	guild 		= GIL_OUT;
	id 			= 7515;
	voice 		= 4;
	flags       = 2;																
	npctype		= NPCTYPE_main;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_N_Normal_Erpresser, BodyTex_N,ITAR_Vlk_M);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7515;
};

FUNC VOID Rtn_Start_7515()
{	
	TA_Saw			(07,00,18,00,"REL_CITY_371");
	TA_Sit_Throne		(18,00,22,00,"REL_CITY_100");
	TA_Sleep 		(22,00,07,00,"REL_CITY_101");
};

FUNC VOID Rtn_AtMine_7515()
{	
	TA_RunToWP	(08,00,22,00,"REL_SURFACE_209");
	TA_RunToWP	(22,00,08,00,"REL_SURFACE_209");
};