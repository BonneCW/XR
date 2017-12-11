instance Mod_7241_OUT_Anselm_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Anselm";
	guild 		= GIL_OUT;	
	id 			= 7241;
	voice 		= 16;
	flags       = 2; //Joly: immortal Hauptstory																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_Weak_Ulf_Wohlers, BodyTex_P, ITAR_Governor);	
	Mdl_SetModelFatness	(self, 0.9);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7241;
};

FUNC VOID Rtn_Start_7241 ()
{	
	TA_Sit_Throne	(08,00,23,00,"RATHAUSUNENTBURGERMEISTER");
	TA_Sit_Chair	(23,00,08,00,"REL_CITY_026");
};

FUNC VOID Rtn_Tot_7241 ()
{	
	TA_Sit_Throne	(08,00,23,00,"TOT");
	TA_Sit_Chair	(23,00,08,00,"TOT");
};