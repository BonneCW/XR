INSTANCE Mod_7466_PIR_Bones_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bones";
	guild 		= GIL_OUT;
	id 			= 7466;
	voice		= 0;
	flags       = 0;															
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_BOnesAxt);
	
	// ------ Inventory ------
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_NormalBart10, BodyTex_N, ITAR_PIR_M_Addon);	  
	Mdl_SetModelFatness	(self, 1.3);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7466;
};

FUNC VOID Rtn_Start_7466 ()
{	
	TA_Smalltalk	(08,00,20,00,"SHIP_CREW_03");
	TA_Smalltalk 	(20,00,08,00,"SHIP_CREW_03");
};

FUNC VOID Rtn_Tot_7466 ()
{
	TA_Stand_ArmsCrossed 	(08,00,20,00,"TOT");
	TA_Stand_ArmsCrossed 	(20,00,08,00,"TOT");
};
