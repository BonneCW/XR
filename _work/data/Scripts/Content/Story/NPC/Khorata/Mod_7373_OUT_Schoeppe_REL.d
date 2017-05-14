instance Mod_7373_OUT_Schoeppe_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Schöppe"; 
	guild 		= GIL_DMT;
	id 			= 7373;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//--------Aivars-----------
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NORMAL19, BodyTex_N,KhorataMagier_01);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self,10); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7373;
};

FUNC VOID Rtn_Start_7373()
{	
	TA_Sit_Throne	(08,00,20,00,"REL_CITY_343");
	TA_Sit_Throne	(20,00,08,00,"REL_CITY_343");
};