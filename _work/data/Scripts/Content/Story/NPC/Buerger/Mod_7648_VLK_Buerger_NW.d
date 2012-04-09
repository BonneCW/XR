instance Mod_7648_VLK_Buerger_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Buerger; 
	guild 		= GIL_PAL;
	id 			= 7648;
	voice 		= 1;
	flags       = 0;																
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self,ItMw_1H_quantarie_Schwert_01); 
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald.", Face_N_NormalBart_Graham, BodyTex_N, ITAR_VLK_H);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 35); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7648;
};

FUNC VOID Rtn_Start_7648 ()
{	
	TA_Sit_Campfire		(08,00,21,00,"NW_CITY_HABOUR_KASERN_PRISON_02");
   	TA_Sit_Campfire		(21,00,08,00,"NW_CITY_HABOUR_KASERN_PRISON_02");
};

FUNC VOID Rtn_Flucht_7648 ()
{	
	TA_RunToWP		(08,00,21,00,"NW_CITY_ENTRANCE_BACK");
   	TA_RunToWP		(21,00,08,00,"NW_CITY_ENTRANCE_BACK");
};

FUNC VOID Rtn_Tot_7648 ()
{	
	TA_RunToWP		(08,00,21,00,"TOT");
   	TA_RunToWP		(21,00,08,00,"TOT");
};