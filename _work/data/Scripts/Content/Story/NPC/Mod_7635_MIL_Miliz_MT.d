instance Mod_7635_MIL_Miliz_MT (Npc_Default)
{
	// ------ NSC ------
	name 		= Name_Miliz;	
	guild 		= GIL_OUT;
	id 			= 7635;
	voice 		= 6;
	flags       = 0;																
	npctype		= NPCTYPE_nw_miliz;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Milizschwert);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_Normal04, BodyTex_N, ITAR_MIL_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 40); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7635;
};

FUNC VOID Rtn_Start_7635()
{
	TA_Sit_Chair	(08,00,23,00,"CASTLE_27");
	TA_Sit_Chair	(23,00,08,00,"CASTLE_27");	
};

FUNC VOID Rtn_GuideToOrks_7635 ()
{
	TA_Guide_Player		(23,30,08,30,"CASTLE_36");
	TA_Guide_Player		(08,30,23,30,"CASTLE_36");	
};