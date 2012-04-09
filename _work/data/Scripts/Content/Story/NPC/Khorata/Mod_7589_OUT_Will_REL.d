instance Mod_7589_OUT_Will_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Will";	
	guild 		= GIL_Out;
	id 			= 7589;
	voice 		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);	

	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------					
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", 192, BodyTex_B, ITAR_VLK_H);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 65); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7589;
};

FUNC VOID Rtn_Start_7589 ()
{	
	TA_Stand_Guarding	(08,00,20,00,"RELENDELCITY_07");
	TA_Stand_Guarding	(20,00,08,00,"RELENDELCITY_07");
};