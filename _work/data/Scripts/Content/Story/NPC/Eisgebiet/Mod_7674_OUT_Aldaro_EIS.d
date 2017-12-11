instance Mod_7674_OUT_Aldaro_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Aldaro"; 
	guild 		= GIL_OUT;
	id 			= 7674;
	voice		= 16;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	
	//----------AIVARS--------------
	aivar[AIV_DropDeadAndKill] = TRUE;
	aivar[AIV_EnemyOverride] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1h_Vlk_Sword); 
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_Normal07, BodyTex_N,ITAR_Eisgebiet_02);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7674;
};

FUNC VOID Rtn_Start_7674()
{	
	TA_Sit_Chair		(10,00,18,00,"EIS_DORF_037");
	TA_Sleep 		(18,00,10,00,"EIS_165");
};

FUNC VOID Rtn_Erholung_7674()
{	
	TA_Sleep		(10,00,18,00,"EIS_165");
	TA_Sleep 		(18,00,10,00,"EIS_165");
};

FUNC VOID Rtn_Fit_7674()
{	
	TA_Angeln		(08,00,11,00,"EIS_DORF_046");
	TA_Sit_Chair		(11,00,13,00,"EIS_135");
	TA_Angeln		(13,00,16,00,"EIS_DORF_046");
	TA_Smalltalk		(16,00,18,00,"EIS_105");
	TA_Sit_Chair		(18,00,20,00,"EIS_DORF_037");
	TA_Sleep 		(20,00,08,00,"EIS_165");
};