instance Mod_591_NONE_Larius_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Larius";
	guild 		= GIL_OUT;
	id 			= 591;
	voice 		= 1;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_Weak_Cipher_alt, BodyTex_N, ITAR_Governor);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	CreateInvItems	(self, ItWr_ErfinderKolamsBrief, 1);

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_591;
};

FUNC VOID Rtn_Start_591 ()
{	
	TA_Sit_Throne		(08,00,12,00,"NW_CITY_LARIUS");
	TA_Read_Bookstand	(12,00,15,00,"NW_CITY_LARIUS");
	TA_Sit_Throne		(15,00,19,00,"NW_CITY_LARIUS");
	TA_Sit_Throne		(19,00,22,00,"NW_CITYHALL_PRIVATE_THRONE");
	TA_Sleep		(22,00,08,00,"NW_CITY_LARIUS_BED");
};

FUNC VOID Rtn_Larius_591()
{	
	TA_Smalltalk	(08,00,20,00,"NW_CITYHALL_OFFICE_03");
    TA_Smalltalk		(20,00,08,00,"NW_CITYHALL_OFFICE_03");
};

FUNC VOID Rtn_Plaudern_591()
{	
	TA_Smalltalk_Plaudern	(08,00,20,00,"NW_CITYHALL_OFFICE_03");
    TA_Smalltalk_Plaudern		(20,00,08,00,"NW_CITYHALL_OFFICE_03");
};

FUNC VOID Rtn_Treffen_591 ()
{	
	TA_Sit_Throne		(08,00,12,00,"NW_CITY_LARIUS");
	TA_Read_Bookstand	(12,00,15,00,"NW_CITY_LARIUS");
	TA_Sit_Throne		(15,00,19,00,"NW_CITY_LARIUS");
	TA_Sit_Throne		(19,00,23,00,"NW_CITYHALL_PRIVATE_THRONE");
	TA_Stand_WP_Larius	(23,00,01,00,"NW_CITY_CITYHALL_06");
	TA_Sleep		(01,00,08,00,"NW_CITY_LARIUS_BED");
};