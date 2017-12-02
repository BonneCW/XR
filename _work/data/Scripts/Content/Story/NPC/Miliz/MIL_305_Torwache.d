instance Mil_305_Torwache (Npc_Default)
{
	// ------ NSC ------
	name 		= "Engor"; 	
	guild 		= GIL_PAL;
	id 			= 305;
	voice		= 9;
	flags       = NPC_FLAG_IMMORTAL;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	aivar[AIV_NewsOverride] 	= TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Milizschwert);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_L_Jackal, BodyTex_L, ITAR_MIL_L);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 60); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_305;
};

FUNC VOID Rtn_Start_305 ()
{	
	TA_Guard_Passage		(08,00,22,00,"NW_CITY_UPTOWN_GUARD_02");
    TA_Guard_Passage		(22,00,08,00,"NW_CITY_UPTOWN_GUARD_02");
};
