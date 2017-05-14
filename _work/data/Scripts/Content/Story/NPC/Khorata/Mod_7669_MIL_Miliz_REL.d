instance Mod_7669_MIL_Miliz_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Miliz";	
	guild 		= GIL_OUT;
	id 			= 7669;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_nw_miliz;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Milizschwert);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_NormalBart16, BodyTex_N, ITAR_MIL_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7669;
};

FUNC VOID Rtn_Start_7669()
{	
	TA_Sit_Bench	(01,00,03,00,"REL_MOOR_209");
	TA_Sit_Bench	(03,00,01,00,"REL_MOOR_209");
};

FUNC VOID Rtn_Siedlung_7669 ()
{	
	TA_Stand_Guarding	(08,00,21,00,"REL_MOOR_010");
	TA_Stand_Guarding	(21,00,08,00,"REL_MOOR_010");
};
