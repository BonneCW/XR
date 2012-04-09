instance Mod_7566_OUT_Pilar_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Pilar"; 
	guild 		= GIL_OUT;
	id 			= 7566;
	voice 		= 1;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem (self, ItRw_Bow_L_02);	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_OldMan_Gravo, BodyTex_P, ITAR_Eisgebiet_01);	
	Mdl_SetModelFatness	(self,0);
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7566;
};

FUNC VOID Rtn_Start_7566()
{	
	TA_Sleep	(00,15,07,15,"EIS_164");
	TA_Sit_Chair	(07,15,00,15,"EIS_135");
};

FUNC VOID Rtn_Friedhof_7566()
{	
	TA_Sit_Chair	(00,15,07,15,"EIS_410");
	TA_Sit_Chair	(07,15,00,15,"EIS_410");
};

FUNC VOID Rtn_GobboZelt_7566()
{	
	TA_Follow_Player	(00,15,07,15,"EIS_410");
	TA_Follow_Player	(07,15,00,15,"EIS_410");
};

FUNC VOID Rtn_ToCity_7566()
{	
	TA_RunToWp	(00,15,07,15,"EIS_164");
	TA_RunToWp	(07,15,00,15,"EIS_135");
};