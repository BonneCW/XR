INSTANCE Mod_7034_OUT_Bruno_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bruno"; 
	guild 		= GIL_OUT;
	id 			= 7034;
	voice 		= 4;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
		
	// ------ Inventory ------
	// Händler

	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_B_Normal_Kirgo, BodyTex_B,ITAR_VLK_M);	
	Mdl_SetModelFatness	(self,0.5);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7034;
};
FUNC VOID Rtn_Start_7034()
{	
	TA_Stand_WP		(07,05,20,35,"WAY_PASS_MILL_04");
	TA_Stand_WP		(20,35,07,05,"WAY_PASS_MILL_04");
};