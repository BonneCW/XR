instance Mod_7371_OUT_Richter_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Richter";
	guild 		= GIL_DMT;
	id 			= 7371;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Richter, BodyTex_N, KhorataMagier_01);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 10); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7371;
};

FUNC VOID Rtn_Start_7371 ()
{	
	TA_Sit_Throne		(08,00,20,00,"REL_CITY_342");
	TA_Sit_Throne		(20,00,08,00,"REL_CITY_342");
};

FUNC VOID Rtn_AnnaProzess_7371 ()
{	
	TA_Announce_Richter_Anna		(08,00,20,00,"REL_CITY_342");
	TA_Announce_Richter_Anna		(20,00,08,00,"REL_CITY_342");
};

FUNC VOID Rtn_AtBib_7371 ()
{	
	TA_Stand_ArmsCrossed		(08,00,20,00,"REL_CITY_148");
	TA_Stand_ArmsCrossed		(20,00,08,00,"REL_CITY_148");
};

FUNC VOID Rtn_Cassia_7371 ()
{	
	TA_Smalltalk_Cassia	(08,00,20,00,"REL_CITY_148");
	TA_Smalltalk_Cassia	(20,00,08,00,"REL_CITY_148");
};
