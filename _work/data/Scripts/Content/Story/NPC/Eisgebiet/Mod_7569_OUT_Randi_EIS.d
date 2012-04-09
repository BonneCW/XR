instance Mod_7569_OUT_Randi_EIS (Npc_Default)
{
	// ------ NSC ------
	name 		= "Randi"; 
	guild 		= GIL_OUT;
	id 			= 7569;
	voice 		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_AMBIENT;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1H_quantarie_Schwert_01); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

	CreateInvItems	(self, ItKe_Keith, 1);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Weak_Asghan, BodyTex_N, ITAR_Eisgebiet_02);	
	Mdl_SetModelFatness	(self,1);
	Mdl_ApplyOverlayMds	(self, "Humans_Arrogance.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7569;
};

FUNC VOID Rtn_Start_7569()
{	
	TA_Stand_Drinking 	(08,00,22,00,"EIS_338"); 
	TA_Stand_Drinking	(22,00,08,00,"EIS_338");
};
