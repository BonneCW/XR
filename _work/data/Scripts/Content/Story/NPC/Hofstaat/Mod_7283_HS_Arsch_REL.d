instance Mod_7283_HS_Arsch_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Königlicher Arsch";	
	guild 		= GIL_OUT;
	id 			= 7283;
	voice 		= 16;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe8", FaceBabe_N_Hure, BodyTex_N, ITAR_VlkBabe_H);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7283;
};

FUNC VOID Rtn_Start_7283 ()
{	
	TA_Stand_ArmsCrossed	(08,00,23,00,"REL_279");
  	TA_Stand_ArmsCrossed	(23,00,08,00,"REL_279");
};

FUNC VOID Rtn_AtKing_7283 ()
{	
	TA_Stand_ArmsCrossed	(08,00,23,00,"REL_285");
  	TA_Stand_ArmsCrossed	(23,00,08,00,"REL_285");
};
