instance Mod_7458_NONE_Jack_IR (Npc_Default)
{
	// ------ NSC ------
	name 		= "Jack"; 
	guild 		= GIL_OUT;
	id 			= 7458;
	voice		= 0;
	flags       = 0;	//Sterblich, optionaler Captain im Kapitel 5!																
	npctype		= NPCTYPE_MAIN;
	
	//-----------AIVARS----------------
	aivar[AIV_ToughGuy] = TRUE; 
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 2);	
	aivar[AIV_Partymember] 		= TRUE;														
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_COWARD;	
	
	// ------ Equippte Waffen ------																
	EquipItem			(self, ItMw_1H_quantarie_Schwert_01);
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_N_ImportantOld, BodyTex_N,ITAR_Vlk_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Tired.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7458;
};

FUNC VOID Rtn_Start_7458()
{
	TA_Stand_Guarding	(08,00,20,00,"SHIP_CREW_CAPTAIN");
	TA_Stand_Guarding	(20,00,08,00,"SHIP_CREW_CAPTAIN");
};

FUNC VOID Rtn_Waiting_7458 ()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"DI_SHIP_03");
	TA_Stand_ArmsCrossed	(20,00,08,00,"DI_SHIP_03");
};

FUNC VOID Rtn_Lagerraum_7458 ()
{	
	TA_Pick_FP	(08,00,20,00,"SHIP_IN_27");
	TA_Pick_FP	(20,00,08,00,"SHIP_IN_27");
};

FUNC VOID Rtn_Argez_7458 ()
{	
	TA_Guide_Player	(08,00,20,00,"DI_SHIP_03");
	TA_Guide_Player	(20,00,08,00,"DI_SHIP_03");
};