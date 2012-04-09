instance Mod_7378_OUT_Daniel_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Daniel"; 
	guild 		= GIL_OUT;
	id 			= 7378;
	voice 		= 11;
	flags       = 0;						
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
	
	//--------Aivars-----------------------
	aivar[AIV_EnemyOverride] = TRUE;  
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Zweihaender);


	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_B_Tough_Silas, BodyTex_B, KhorataHaendler_01);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 25); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7378;
};

FUNC VOID Rtn_Start_7378 ()
{	
	TA_Stand_ArmsCrossed	(08,00,22,00,"REL_CITY_347");
	TA_Sleep		(22,00,08,00,"REL_CITY_125");
};