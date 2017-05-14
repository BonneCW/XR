INSTANCE Mod_7564_OUT_Knatus_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Knatus"; 	
	guild 		= GIL_OUT;
	id 			= 7564;
	voice		= 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------			
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_L_Jackal, BodyTex_L, ITAR_EISGEBIET_02);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 60); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7564;
};

FUNC VOID Rtn_Start_7564 ()
{	
	TA_Stand_ArmsCrossed	(08,00,22,00,"EIS_DORF_034");
	TA_Stand_ArmsCrossed	(22,00,08,00,"EIS_DORF_034");
};

FUNC VOID Rtn_Alvar_7564 ()
{	
	TA_Stand_Guarding	(08,00,22,00,"EIS_76");
	TA_Stand_Guarding	(22,00,08,00,"EIS_76");
};

FUNC VOID Rtn_Thys_7564 ()
{	
	TA_Stand_Guarding	(08,00,22,00,"EIS_75");
	TA_Stand_Guarding	(22,00,08,00,"EIS_75");
};