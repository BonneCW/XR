instance Mod_7727_OUT_Wache_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Wache";	
	guild 		= GIL_OUT;
	id 			= 7727;
	voice 		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------				
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal04, BodyTex_N, ITAR_Eisgebiet_Miliz);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7727;
};

FUNC VOID Rtn_Start_7727()
{	
	TA_Stand_Guarding	(07,02,21,02,"EISFESTUNG_2");
	TA_Stand_Guarding 	(21,02,07,02,"EISFESTUNG_2");
};