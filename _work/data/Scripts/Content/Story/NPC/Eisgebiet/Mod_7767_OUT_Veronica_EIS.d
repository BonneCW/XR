instance Mod_7767_OUT_Veronica_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Veronica"; 
	guild 		= GIL_OUT;
	id 			= 7767;
	voice		= 43;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//----------AIVARS--------------
	aivar[AIV_DropDeadAndKill] = TRUE;
	aivar[AIV_EnemyOverride] = TRUE;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_Meisterdegen); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe", FaceBabe_N_BlackHair, BodyTexBabe_N, ItAr_Eisgebiet_03);		
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 90); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_7767;
};

FUNC VOID Rtn_PreStart_7767()
{	
	TA_Bathing_Babe 	(07,00,23,00,"EIS_DORF_027");
	TA_Bathing_Babe		(23,00,07,00,"EIS_DORF_027");
};

FUNC VOID Rtn_Start_7767()
{	
	TA_Sit_Throne	(08,00,20,00,"EIS_DORF_031");
	TA_Sleep 	(20,00,08,00,"EIS_DORF_027");
};