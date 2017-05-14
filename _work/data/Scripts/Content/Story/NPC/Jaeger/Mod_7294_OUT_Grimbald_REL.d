INSTANCE Mod_7294_OUT_Grimbald_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Grimbald";
	guild 		= GIL_OUT;
	id 			= 7294;
	voice		= 0;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
	EquipItem	(self, ItRw_Sld_Bow);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

	aivar[AIV_Partymember] = TRUE;
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_B_Normal_Kirgo, BodyTex_B, ITAR_Leather_L);		
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 70); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7294;
};

FUNC VOID Rtn_Start_7294 ()
{	
	TA_Stand_Guarding 	(08,00,23,00,"REL_006"); 
	TA_Stand_Guarding	(23,00,08,00,"REL_006");
};

FUNC VOID Rtn_Guide_7294 ()
{	
	TA_Guide_Player 	(08,00,23,00,"REL_154"); 
	TA_Guide_Player		(23,00,08,00,"REL_154");
};

FUNC VOID Rtn_Tot_7294 ()
{	
	TA_Stand_Guarding 	(08,00,23,00,"TOT"); 
	TA_Stand_Guarding	(23,00,08,00,"TOT");
};