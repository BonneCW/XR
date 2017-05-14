instance Mod_4017_EIS_Rico_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Rico";
	guild 		= GIL_OUT;
	id 			= 4017;
	voice		= 0;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1H_Mace_02);
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
	aivar[AIV_TOUGHGUY] = TRUE;
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_Normal06, BodyTex_N, ITAR_Eisgebiet_02);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 60); 
		
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_4017;
};

FUNC VOID Rtn_Start_4017 ()
{
	TA_Stand_Guarding	(08,00,23,00,"EIS_08");
    TA_Stand_Guarding	(23,00,08,00,"EIS_08");	
};

FUNC VOID Rtn_Guide_4017 ()
{
	TA_Guide_Player	(08,00,23,00,"EIS_132");
    TA_Guide_Player	(23,00,08,00,"EIS_132");	
};

