INSTANCE Mod_7329_HS_Raufbold_HAL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Königlicher Ritter von und zu Raufbold"; 
	guild 		= GIL_OUT;
	id 			= 7329;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_B_Normal_Sharky, BodyTex_B,ITAR_Hofstaatler);	
	Mdl_SetModelFatness	(self,0);
	//Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds");
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7329;
};

FUNC VOID Rtn_Start_7329()
{	
	TA_Stand_Guarding 		(07,20,01,20,"HALU_02");
	TA_Stand_Guarding		(01,20,07,20,"HALU_02");
};