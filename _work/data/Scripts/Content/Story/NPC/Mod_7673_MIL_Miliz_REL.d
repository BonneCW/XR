instance Mod_7673_MIL_Miliz_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bote";	
	guild 		= GIL_OUT;
	id 			= 7673;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal04, BodyTex_N, ITAR_MIL_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7673;
};

FUNC VOID Rtn_Start_7673()
{	
	TA_Smalltalk_Plaudern	(08,00,23,00,"REL_MOOR_141");
	TA_Smalltalk_Plaudern	(23,00,08,00,"REL_MOOR_141");
};

FUNC VOID Rtn_Tot_7673 ()
{
	TA_Stand_Eating	(08,00,23,00,"TOT");
	TA_Stand_Eating	(23,00,08,00,"TOT");	
};
