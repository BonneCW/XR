INSTANCE Mod_7033_OUT_Allievo_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Allievo"; 
	guild 		= GIL_OUT;
	id 			= 7033;
	voice 		= 13;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Mordrag, BodyTex_N,ITAR_Vlk_H);	
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 60); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7033;
};
FUNC VOID Rtn_Start_7033 ()
{	
	TA_Stand_ArmsCrossed	(05,30,20,30,"WAY_PASS_MILL_06");
	TA_Stand_ArmsCrossed	(20,30,05,30,"WAY_PASS_MILL_06");
};