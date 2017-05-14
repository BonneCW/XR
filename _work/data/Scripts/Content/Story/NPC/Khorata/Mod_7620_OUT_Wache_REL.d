instance Mod_7620_OUT_Wache_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Wache";	
	guild 		= GIL_OUT;
	id 			= 7620;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1h_Bau_Mace);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Mordrag, BodyTex_N, KhorataWache_01);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7620;
};

FUNC VOID Rtn_Start_7620()
{	
	TA_Stand_Guarding		(07,00,21,00,"REL_CITY_397");
   	TA_Stand_Guarding		(21,00,07,00,"REL_CITY_397");
};

FUNC VOID Rtn_Theodorus_7620()
{	
	TA_Smalltalk_Plaudern	(07,00,21,00,"REL_CITY_002");
   	TA_Smalltalk_Plaudern	(21,00,07,00,"REL_CITY_002");
};