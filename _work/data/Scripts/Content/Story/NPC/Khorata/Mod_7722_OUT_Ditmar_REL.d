instance Mod_7722_OUT_Ditmar_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Ditmar"; 
	guild 		= GIL_OUT;
	id 			= 7722;
	voice 		= 26;
	flags       = 2;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 40); 
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------					
	
	
	// ------ Inventory ------
	//Händler

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald.", Face_N_Normal_Blade, BodyTex_N, ITAR_SMITH);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7722;
};

FUNC VOID Rtn_Start_7722 ()
{	
	TA_Stand_ArmsCrossed	(08,00,22,00,"ALTEFESTUNG_013");
	TA_Stand_ArmsCrossed	(22,00,08,00,"ALTEFESTUNG_013");
};