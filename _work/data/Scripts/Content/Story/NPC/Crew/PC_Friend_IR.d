instance PC_Friend_IR (Npc_Default)
{
	// ------ NSC ------
	name 		= "Argez"; 
	guild 		= GIL_OUT;
	id 			= 7534;
	voice 		= 1;
	flags       = 2;																
	npctype		= NPCTYPE_FRIEND;
	
	// ------ AIVARs ------
	aivar[AIV_ToughGuy] 			= TRUE;	
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_Partymember] 		= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1h_VLK_Sword); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", 178, BodyTex_N, ITAR_Vlk_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 100); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_7534;
};

FUNC VOID Rtn_Start_7534()
{	
	TA_Stand_ArmsCrossed	(10,55,18,50,"SHIP_CREW_CAPTAIN");
	TA_Stand_ArmsCrossed	(18,50,10,55,"SHIP_CREW_CAPTAIN");
};

FUNC VOID Rtn_Drained_7534()
{	
	TA_Drained	(10,55,18,50,"SHIP_CREW_CAPTAIN");
	TA_Drained	(18,50,10,55,"SHIP_CREW_CAPTAIN");
};

FUNC VOID Rtn_Waiting_7534 ()
{	
	TA_Stand_ArmsCrossed	(08,00,20,00,"DI_DRACONIANAREA_17");
	TA_Stand_ArmsCrossed	(20,00,08,00,"DI_DRACONIANAREA_17");
};
