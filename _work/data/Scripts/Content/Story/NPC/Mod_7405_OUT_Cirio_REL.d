INSTANCE Mod_7405_OUT_Cirio_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Cirio";
	guild 		= GIL_DMT;
	id 			= 7405;
	voice		= 0;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1H_quantarie_Schwert_01);
	
	
	// ------ Inventory ------
	// Händler
	

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Gomez , BodyTex_N, ITAR_Leather_L);
	Mdl_SetModelFatness	(self, 1.8);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 35); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7405;
};

FUNC VOID Rtn_Start_7405 ()
{	
	TA_Stand_ArmsCrossed	(08,00,22,00,"REL_SURFACE_070");
   	TA_Stand_ArmsCrossed	(22,00,08,00,"REL_SURFACE_070");
};

FUNC VOID Rtn_Guide_7405 ()
{	
	TA_Guide_Player	(08,00,22,00,"REL_SURFACE_085");
   	TA_Guide_Player	(22,00,08,00,"REL_SURFACE_085");
};

FUNC VOID Rtn_Wait_7405 ()
{	
	TA_Stand_ArmsCrossed	(08,00,22,00,"REL_121");
   	TA_Stand_ArmsCrossed	(22,00,08,00,"REL_121");
};

FUNC VOID Rtn_Transform_7405 ()
{	
	TA_Transform_Ratte	(08,00,22,00,"REL_121");
   	TA_Transform_Ratte	(22,00,08,00,"REL_121");
};

FUNC VOID Rtn_Tot_7405 ()
{	
	TA_Stand_ArmsCrossed	(08,00,22,00,"TOT");
   	TA_Stand_ArmsCrossed	(22,00,08,00,"TOT");
};