instance PC_Friend_AW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Argez"; 
	guild 		= GIL_OUT;
	id 			= 1606;
	voice		= 0;
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
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", 178, BodyTex_N, ITAR_Vlk_L);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 100); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_1606;
};

FUNC VOID Rtn_Start_1606()
{	
	TA_Stand_Eating		(06,55,22,50,"ADW_ENTRANCE_BUILDING1_02");
	TA_Sleep		(22,50,06,55,"ADW_ENTRANCE_RUIN3_02");
};

FUNC VOID Rtn_AtEchsen_1606()
{	
	TA_Stand_ArmsCrossed	(10,55,18,50,"ADW_PATH_TO_BL_10");
	TA_Stand_ArmsCrossed	(18,50,10,55,"ADW_PATH_TO_BL_10");
};

FUNC VOID Rtn_Tempel_1606()
{	
	TA_Stand_ArmsCrossed	(10,55,18,50,"ADW_ADANOSTEMPEL_RAVEN_11");
	TA_Stand_ArmsCrossed	(18,50,10,55,"ADW_ADANOSTEMPEL_RAVEN_11");
};

FUNC VOID Rtn_Back_1606()
{	
	TA_Stand_ArmsCrossed	(10,55,18,50,"BACKFROMXW");
	TA_Stand_ArmsCrossed	(18,50,10,55,"BACKFROMXW");
};

FUNC VOID Rtn_Tot_1606()
{	
	TA_Stand_ArmsCrossed	(10,55,18,50,"TOT");
	TA_Stand_ArmsCrossed	(18,50,10,55,"TOT");
};
