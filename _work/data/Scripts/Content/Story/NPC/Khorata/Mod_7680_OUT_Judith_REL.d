instance Mod_7680_OUT_Judith_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Judith";	
	guild 		= GIL_OUT;
	id 			= 7680;
	voice 		= 16;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------
																		
		
	// ------ Inventory ------
	CreateInvItems (self, ItMi_Gold, 100);		//für die Matteo Mission
	//KEIN AmbientInv!!!
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe8", FaceBabe_N_YoungBlonde, BodyTex_N, ITAR_VlkBabe_M_6);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_7680;
};

FUNC VOID Rtn_PreStart_7680 ()
{	
	TA_Stand_ArmsCrossed		(08,00,12,00,"REL_CITY_175");
	TA_Cook_Stove			(12,00,14,00,"REL_CITY_227");
	TA_Stand_Sweeping		(14,00,18,00,"REL_CITY_226");
	TA_Cook_Stove			(18,00,20,00,"REL_CITY_227");
	TA_Sit_Throne	 		(20,00,23,00,"REL_CITY_151");
	TA_Stand_ArmsCrossed		(23,00,04,00,"PARK_BETEN");
	TA_Sleep			(04,00,08,00,"REL_CITY_229");
};

FUNC VOID Rtn_Start_7680 ()
{	
	TA_Stand_ArmsCrossed		(08,00,12,00,"REL_CITY_175");
	TA_Cook_Stove			(12,00,14,00,"REL_CITY_227");
	TA_Stand_Sweeping		(14,00,18,00,"REL_CITY_226");
	TA_Cook_Stove			(18,00,20,00,"REL_CITY_227");
	TA_Sit_Throne	 		(20,00,23,00,"REL_CITY_151");
	TA_Sleep			(23,00,08,00,"REL_CITY_229");
};

FUNC VOID Rtn_Ruprecht_7680()
{	
	TA_Smalltalk_Plaudern 		(07,20,01,20,"PARK_BETEN");
	TA_Smalltalk_Plaudern		(01,20,07,20,"PARK_BETEN");
};