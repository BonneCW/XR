instance Mod_1891_NONE_Bandenchef_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bandenchef";	
	guild 		= GIL_OUT;
	id 			= 1891;
	voice 		= 7;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
	aivar[AIV_ToughGuy]		= TRUE;		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Meisterdegen);
	CreateInvItems (self,ItRi_Bandenchef,1);
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", 184, BodyTex_N, ITAR_VLK_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 40); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1891;
};

FUNC VOID Rtn_Start_1891()
{	
	TA_Smoke_Joint	(04,00,22,00,"TOT");
    TA_Smoke_Joint	(22,00,04,00,"WP_NW_CITY_BANDENCHEF");
};