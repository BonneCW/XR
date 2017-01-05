instance PC_Friend_XW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Argez"; 
	guild 		= GIL_OUT;
	id 			= 1607;
	voice 		= 1;
	flags       = 2;																
	npctype		= NPCTYPE_FRIEND;
	
	// ------ AIVARs ------
	aivar[AIV_ToughGuy] 			= TRUE;	
	aivar[AIV_ToughGuyNewsOverride] = TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, ItMw_1h_VLK_Sword); 
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", 178, BodyTex_N,ITAR_Vlk_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 100); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1607;
};

FUNC VOID Rtn_Start_1607()
{	
	TA_Stand_ArmsCrossed	(10,55,18,50,"KNAST_01");
	TA_Stand_ArmsCrossed	(18,50,10,55,"KNAST_01");
};

FUNC VOID Rtn_Arena_1607()
{	
	TA_Stand_ArmsCrossed	(10,55,18,50,"ARENA_04");
	TA_Stand_ArmsCrossed	(18,50,10,55,"ARENA_04");
};

FUNC VOID Rtn_Ritual_1607()
{	
	TA_Circle	(10,55,18,50,"ARENA_04");
	TA_Circle	(18,50,10,55,"ARENA_04");
};

FUNC VOID Rtn_Flucht_1607()
{	
	TA_Guide_Player	(10,55,18,50,"PORTALGANG_050");
	TA_Guide_Player	(18,50,10,55,"PORTALGANG_050");
};