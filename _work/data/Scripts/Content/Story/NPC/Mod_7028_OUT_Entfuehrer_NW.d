instance Mod_7028_OUT_Entfuehrer_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Entführer"; 
	guild 		= GIL_OUT;
	id 			= 7028;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Pony", Face_N_NormalBart06, BodyTex_N,ITAR_Vlk_M);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7028;
};

FUNC VOID Rtn_Start_7028()
{	
	TA_Smalltalk	(05,20,20,20,"NW_CITY_JAEGER_17");
	TA_Smalltalk	(20,20,05,20,"NW_CITY_JAEGER_17");
};
