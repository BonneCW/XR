instance Mod_506_VLK_Spielleiter_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Spielleiter"; 
	guild 		= GIL_OUT;
	id 			= 506;
	voice 		= 1;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self,ItMw_1H_quantarie_Schwert_01); 
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald.", Face_N_NormalBart_Graham, BodyTex_N, ITAR_VLK_H);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 35); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_506;
};

FUNC VOID Rtn_Start_506 ()
{	
	TA_Sit_Chair 		(07,00,19,00,"TAVERN02_B");
	TA_Sit_Chair		(19,00,07,00,"TAVERN02_B");
};
