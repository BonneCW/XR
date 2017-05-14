INSTANCE Mod_7424_OUT_Narkomane_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Narkomane";
	guild 		= GIL_OUT;
	id 			= 7424;
	voice		= 0;
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem			(self, ItMw_1H_quantarie_Schwert_01);
	
	// ------ Inventory ------
	// Händler

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal20, BodyTex_N,ITAR_VLK_L );	
	
	Mdl_SetModelFatness	(self, 0.8);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 35); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7424;
};

FUNC VOID Rtn_Start_7424 ()
{	
	TA_Sit_Campfire		(05,00,00,00,"REL_CITY_361");
	TA_Sit_Campfire		(00,00,05,00,"REL_CITY_361");
};