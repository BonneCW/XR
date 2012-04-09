INSTANCE Mod_7409_OUT_Richard_EIS (Npc_Default) //Metzger
{
	// ------ NSC ------
	name 		= "Richard";	
	guild 		= GIL_DMT;
	id 			= 7409;
	voice 		= 12;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_1h_Bau_Mace);
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_P_NormalBart_Riordian, BodyTex_P, ITAR_Eisgebiet_02);
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7409;
};

FUNC VOID Rtn_Start_7409()
{	
	TA_Stand_ArmsCrossed 	(08,00,22,00,"EIS_EINSAMEBUDE_4");
	TA_Stand_ArmsCrossed	(22,00,08,00,"EIS_EINSAMEBUDE_4");
};

FUNC VOID Rtn_Transform_7409()
{	
	TA_Transform_Ratte 	(08,00,22,00,"EIS_EINSAMEBUDE_4");
	TA_Transform_Ratte	(22,00,08,00,"EIS_EINSAMEBUDE_4");
};

FUNC VOID Rtn_Tot_7409()
{	
	TA_Stand_WP 	(08,00,22,00,"TOT");
	TA_Stand_WP	(22,00,08,00,"TOT");
};