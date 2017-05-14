INSTANCE Mod_7702_OUT_Moechtegern_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Möchtegern"; 
	guild 		= GIL_DMT;
	id 			= 7702;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
		
	// ------ Inventory ------
	// Händler

	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_B_Normal_Kirgo, BodyTex_B,ITAR_VLK_M);	
	Mdl_SetModelFatness	(self,0.5);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7702;
};

FUNC VOID Rtn_Start_7702()
{	
	TA_Smoke_Joint		(07,05,20,35,"NW_CITY_HABOUR_KASERN_05_01");
	TA_Smoke_Joint		(20,35,07,05,"NW_CITY_HABOUR_KASERN_05_01");
};