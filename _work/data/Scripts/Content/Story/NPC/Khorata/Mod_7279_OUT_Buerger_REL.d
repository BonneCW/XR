INSTANCE Mod_7279_OUT_Buerger_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bürger";
	guild 		= GIL_OUT;
	id 			= 7279;
	voice 		= 6;
	flags       = 0;																	
	npctype		= NPCTYPE_REL_BUERGER;
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1H_quantarie_Schwert_01);
	CreateInvItems (self, ItPo_Health_01, 3);									
	
	// ------ Inventory ------
	// Händler
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_Tough_Okyl, BodyTex_N, ITAR_VLK_L);
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 70); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_7279;
};

FUNC VOID Rtn_PreStart_7279 ()
{	
	TA_Sit_Chair	(08,00,22,00,"REL_CITY_174");
    	TA_Sleep	(22,00,08,00,"REL_CITY_172");
};