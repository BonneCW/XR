instance Mod_7577_OUT_Metzgerlehrling_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Metzgerlehrling"; 
	guild 		= GIL_OUT;
	id 			= 7577;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	//EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_Asghan, BodyTex_N,ITAR_Vlk_L);	
	Mdl_SetModelFatness	(self,1);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7577;
};

FUNC VOID Rtn_Start_7577()
{	
	TA_Stand_Sweeping	(06,55,13,00,"FLEISCHER_03");
	TA_Smalltalk 		(13,00,15,00,"REL_SURFACE_159");	// Mit Bäckerlehrling
	TA_Sweep_FP		(15,00,18,00,"FLEISCHER_03");
	TA_Sit_Throne		(18,00,22,00,"FLEISCHERFUER");
	TA_Sit_Chair		(22,00,06,55,"ALTEFESTUNG_07"); 
};