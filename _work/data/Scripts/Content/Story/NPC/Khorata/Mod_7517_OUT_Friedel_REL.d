instance Mod_7517_OUT_Friedel_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Friedel"; 
	guild 		= GIL_OUT;
	id 			= 7517;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ AIVARs ------
	aivar[AIV_ToughGuy] 			= TRUE;	
	aivar[AIV_ToughGuyNewsOverride] = TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_Herek, BodyTex_N,ITAR_Vlk_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7517;
};

FUNC VOID Rtn_Start_7517()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"REL_CITY_367");
	TA_Sleep		(20,00,08,00,"REL_CITY_016");
};

FUNC VOID Rtn_FollowToMine_7517()
{	
	TA_Follow_Player	(08,00,20,00,"REL_002");
	TA_Follow_Player	(20,00,08,00,"REL_002");
};