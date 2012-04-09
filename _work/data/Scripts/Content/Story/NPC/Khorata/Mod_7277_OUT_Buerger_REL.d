instance Mod_7277_OUT_Buerger_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Bürger"; 
	guild 		= GIL_OUT;
	id 			= 7277;
	voice 		= 8;
	flags       = 0;																
	npctype		= NPCTYPE_REL_BUERGER;
	
	//-----------AIVARS----------------
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_Eminem_AchillesSchwert_01); 
		
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_NormalBart04, BodyTex_N,ITAR_Vlk_M);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7277;
};

FUNC VOID Rtn_Start_7277()
{	
	TA_Sit_Throne		(06,30,00,30,"REL_CITY_131");
	TA_Sleep		(00,30,06,30,"REL_CITY_134");
};