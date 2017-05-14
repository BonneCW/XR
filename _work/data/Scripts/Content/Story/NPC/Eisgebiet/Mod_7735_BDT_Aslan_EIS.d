instance Mod_7735_BDT_Aslan_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Aslan"; 
	guild 		= GIL_STRF;
	id 			= 7735;
	voice		= 0;
	flags       = 0;								
	npctype		= NPCTYPE_MAIN;
	
	//--------Aivars-----------
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_1H_quantarie_Fantasyschwert_01);

	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	CreateInvItems (self, ItRi_Garunh, 1);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_N_NormalBart_Dexter, BodyTex_N, ITAR_BDT_H_01);	
	Mdl_SetModelFatness	(self, -1);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
		// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 100); 

	daily_routine = Rtn_Start_7735;
};	 
	// ------ TA ------
FUNC VOID RTn_Start_7735()
{
	TA_Sit_Throne		(07,00,21,00,"NORDOSTENLOCH_1");
	TA_Sleep		(21,00,07,00,"NORDOSTENLOCH_1");
};