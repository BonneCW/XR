instance Mod_7535_OUT_Schneider_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Schneider"; 
	guild 		= GIL_OUT;
	id 			= 7535;
	voice 		= 31;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																		
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_Asghan, BodyTex_N, ITAR_Vlk_L);	
	Mdl_SetModelFatness	(self,1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7535;
};

FUNC VOID Rtn_Start_7535()
{	
	TA_Sit_Campfire		(06,05,20,15,"SCHNEIDERZITZ2");
	TA_Sleep		(20,15,06,05,"REL_CITY_236"); 
};

FUNC VOID Rtn_Abgelenkt_7535()
{	
	TA_Smalltalk_Ramirez	(06,05,20,15,"REL_CITY_233");
	TA_Smalltalk_Ramirez	(20,15,06,05,"REL_CITY_233"); 
};