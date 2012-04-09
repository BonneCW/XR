INSTANCE Mod_7035_OUT_Grima_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Grima";
	guild 		= GIL_OUT;
	id 			= 7035;
	voice 		= 11;
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem			(self, ItMw_1H_quantarie_Schwert_01);
	
	// ------ Inventory ------
	// Händler

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald.", Face_L_Tough_Santino, BodyTex_L,ITAR_VLK_M);	
	
	Mdl_SetModelFatness	(self, 0.8);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7035;
};

FUNC VOID Rtn_Start_7035 ()
{	
	TA_Stand_WP		(07,05,20,35,"WAY_PASS_MILL_04");
	TA_Stand_WP		(20,35,07,05,"WAY_PASS_MILL_04");
};