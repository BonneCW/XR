instance Mod_7460_RIT_Cedric_IR (Npc_Default)
{
	// ------ NSC ------
	name 		= "Cedric";
	guild 		= GIL_OUT;
	id 			= 7460;
	voice 		= 12;
	flags       = 0;																	
	npctype		= NPCTYPE_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);	
	aivar[AIV_Partymember] 		= TRUE;																
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem			(self, ItMw_Schwert_02);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter", Face_N_NormalBart10, BodyTex_N, ITAR_PAL_M);	
	Mdl_SetModelFatness	(self, 2);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 55); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7460;
};

FUNC VOID Rtn_Start_7460 ()
{
	TA_Stand_Guarding	(08,00,20,00,"SHIP_CREW_CAPTAIN");
	TA_Stand_Guarding	(20,00,08,00,"SHIP_CREW_CAPTAIN");
};

FUNC VOID Rtn_Waiting_7460 ()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"DI_SHIP_03");
	TA_Stand_ArmsCrossed	(20,00,08,00,"DI_SHIP_03");
};