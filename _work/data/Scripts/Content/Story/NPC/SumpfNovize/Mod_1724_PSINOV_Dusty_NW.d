instance Mod_1724_PSINOV_Dusty_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Dusty"; 
	guild 		= GIL_OUT;
	id 			= 1724;
	voice 		= 14;
	flags       = 2; // #594													
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem			(self, ItMw_1h_VLK_Sword);
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart_Dusty, BodyTex_N, Nov_Armor_M);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1724;
};

FUNC VOID Rtn_Start_1724()
{	
	TA_Stand_WP		(08,00,20,00,"WP_NW_DUSTY");
	TA_Smoke_Waterpipe	(20,00,08,00,"NW_CITY_RAUCH_02"); 
};