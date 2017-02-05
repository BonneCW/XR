instance Mod_7567_OUT_Luis_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Luis"; 
	guild 		= GIL_OUT;
	id 			= 7567;
	voice 		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_main;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItRw_Bow_M_01); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_NormalBart22, BodyTex_N, ITAR_Eisgebiet_02);	
	Mdl_SetModelFatness	(self,2);
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 55); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7567;
};

FUNC VOID Rtn_Start_7567()
{	
	TA_Sleep	(00,15,07,15,"EIS_165");
	TA_Sit_Chair	(07,15,00,15,"EIS_151");
};

FUNC VOID Rtn_Friedhof_7567()
{	
	TA_Guide_Player		(00,15,07,15,"FRIEDHOFF_3");
	TA_Guide_Player		(07,15,00,15,"FRIEDHOFF_3");
};

FUNC VOID Rtn_Friedhof2_7567()
{	
	TA_Guide_Player		(00,15,07,15,"FRIEDHOFF_6");
	TA_Guide_Player		(07,15,00,15,"FRIEDHOFF_6");
};

FUNC VOID Rtn_PilarsBruder_7567()
{	
	TA_Guide_Player		(00,15,07,15,"EIS_410");
	TA_Guide_Player		(07,15,00,15,"EIS_410");
};

FUNC VOID Rtn_AtTurm_7567()
{	
	TA_Guide_Player		(00,15,07,15,"NORTDGEBIET_88");
	TA_Guide_Player		(07,15,00,15,"NORTDGEBIET_88");
};
