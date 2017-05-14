INSTANCE Mod_7464_PIR_Bones_IR (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bones";
	guild 		= GIL_OUT;
	id 			= 7464;
	voice		= 0;
	flags       = 0;															
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	aivar[AIV_Partymember] 		= TRUE;
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
	daily_routine 		= Rtn_Start_7464;
};

FUNC VOID Rtn_Start_7464 ()
{	
	TA_Smalltalk	(08,00,20,00,"SHIP_CREW_03");
	TA_Smalltalk 	(20,00,08,00,"SHIP_CREW_03");
};