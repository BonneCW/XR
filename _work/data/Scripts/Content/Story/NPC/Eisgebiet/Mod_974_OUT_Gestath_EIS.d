INSTANCE Mod_974_OUT_Gestath_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Gestath";
	guild 		= GIL_OUT;
	id 			= 974;
	voice		= 0;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self, ItMw_1H_quantarie_Fantasyschwert_01); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Psionic", Face_B_Thorus, BodyTex_B, ITAR_DJG_Crawler);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 80); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_974;
};

FUNC VOID Rtn_Start_974 ()
{	
	TA_Stand_Guarding	(07,00,23,00,"EIS_GESTATH_005");
	TA_Sleep		(23,00,07,00,"EIS_GESTATH_006");		
};