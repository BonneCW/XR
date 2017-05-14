INSTANCE Mod_7563_OUT_Brutus_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Brutus"; 	
	guild 		= GIL_OUT;
	id 			= 7563;
	voice		= 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------			
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_P_ToughBald, BodyTex_P, ITAR_Eisgebiet_01);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); // Tired / Militia / Mage / Arrogance / Relaxed
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 60); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7563;
};

FUNC VOID Rtn_Start_7563 ()
{	
	TA_Sit_Chair		(08,00,22,00,"EIS_DORF_026");
	TA_Sleep		(22,00,08,00,"EIS_DORF_027");
};

FUNC VOID Rtn_Alvar_7563 ()
{	
	TA_Stand_Guarding	(08,00,22,00,"EIS_76");
	TA_Stand_Guarding	(22,00,08,00,"EIS_76");
};

FUNC VOID Rtn_Cave_7563 ()
{	
	TA_Stand_Guarding	(08,00,22,00,Npc_GetNearestWP(hero));
	TA_Stand_Guarding	(22,00,08,00,Npc_GetNearestWP(hero));
};
