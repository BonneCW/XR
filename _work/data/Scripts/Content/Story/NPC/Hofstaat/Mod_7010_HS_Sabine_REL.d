instance Mod_7010_HS_Sabine_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Sabine";	//Halvors Frau
	guild 		= GIL_OUT;
	id 			= 7010;
	voice		= 0;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 1);																
	
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_NORMAL;
	
	// ------ Equippte Waffen ------																	
	
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

	CreateInvItems	(self, ItMi_Freudenspender_Sabine, 1);

	EquipItem (self, ItMw_1h_Bau_Mace);
	
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, FEMALE, "Hum_Head_Babe1", FaceBabe_N_GreyCloth, BodyTex_N, ITAR_Hofstaatlerin);	
	Mdl_ApplyOverlayMds	(self, "Humans_Babe.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 15); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7010;
};

FUNC VOID Rtn_Start_7010 ()
{	
	TA_Stand_ArmsCrossed		(22,05,20,05,"REL_CITY_046");
	TA_Stand_ArmsCrossed 		(20,05,22,05,"REL_CITY_046");
};

FUNC VOID Rtn_Hofstaat_7010 ()
{	
	TA_Stand_ArmsCrossed		(06,00,22,00,"REL_259");
	TA_Sleep 			(22,00,06,00,"REL_259");
};

FUNC VOID Rtn_Tot_7010 ()
{	
	TA_Stand_WP		(04,55,20,05,"TOT");
	TA_Stand_WP 		(20,05,22,05,"TOT");
};