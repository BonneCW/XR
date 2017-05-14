INSTANCE Mod_7418_OUT_Ruprecht_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Ruprecht"; 
	guild 		= GIL_OUT;
	id 			= 7418;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Normal_Sharky, BodyTex_B,ITAR_Vlk_M);	
	Mdl_SetModelFatness	(self,0);
	//Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds");
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7418;
};

FUNC VOID Rtn_Start_7418()
{	
	TA_Sit_Chair 		(07,20,01,20,"REL_CITY_304");
	TA_Sit_Chair		(01,20,07,20,"REL_CITY_304");
};

FUNC VOID Rtn_Judith_7418()
{	
	TA_Smalltalk_Plaudern 		(07,20,01,20,"PARK_5");
	TA_Smalltalk_Plaudern		(01,20,07,20,"PARK_5");
};