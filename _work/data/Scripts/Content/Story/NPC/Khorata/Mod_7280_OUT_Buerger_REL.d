INSTANCE Mod_7280_OUT_Buerger_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bürger";
	guild 		= GIL_OUT;
	id 			= 7280;
	voice 		= 8;
	npctype		= NPCTYPE_REL_BUERGER;
	
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
	daily_routine 		= Rtn_Start_7280;
};

FUNC VOID Rtn_Start_7280 ()
{	
	TA_Sit_Throne		(05,00,00,00,"REL_CITY_167");
	TA_Sleep 				(00,00,05,00,"REL_CITY_169");
};