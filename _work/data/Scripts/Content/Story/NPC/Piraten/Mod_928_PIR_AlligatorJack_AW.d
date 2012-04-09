INSTANCE Mod_928_PIR_AlligatorJack_AW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Alligator Jack";
	guild 		= GIL_OUT;
	id 			= 928;
	voice 		= 12;
	flags       = 0;																
	npctype		= NPCTYPE_MAIN;
	
	// ------ Aivars ------
	aivar[AIV_FollowDist] = 300;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);																	
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;
	
	// ------ Equippte Waffen ------																	
	EquipItem (self, ItMw_Piratensaebel);																
	EquipItem (self, ItRw_Crossbow_M_01);
		
	// ------ Inventory ------
	CreateInvItems (self, itpo_Health_02, 4);
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald", Face_B_CorAngar, BodyTex_B, ITAR_PIR_M_Addon);	  
	Mdl_SetModelFatness	(self, 1.5);		
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self,90); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_928;
};

FUNC VOID Rtn_Start_928 ()
{	
	TA_Sleep		(23,00,06,00,"ADW_PIRATECAMP_AJ_04");
	TA_Cook_Pan		(06,00,08,30,"AD_PIRATECAMP_AJ_03");
	TA_Sit_Campfire		(08,30,12,00,"AD_PIRATECAMP_AJ_03");
	TA_Stand_ArmsCrossed	(12,30,19,00,"ADW_PIRATECAMP_WAY_07");	
	TA_Cook_Pan		(19,00,20,30,"AD_PIRATECAMP_AJ_03");
	TA_Sit_Campfire		(20,30,23,00,"AD_PIRATECAMP_AJ_03");
};

FUNC VOID Rtn_PreStart_928 ()
{
	TA_Stand_ArmsCrossed	(08,00,20,00,"ADW_PIRATECAMP_WAY_07");
	TA_Stand_ArmsCrossed	(20,00,08,00,"ADW_PIRATECAMP_WAY_07");
};

FUNC VOID Rtn_ToCanyon_928 ()
{	
	TA_Follow_Player		(08,00,20,00,"ADW_CANYON_MINE2_10");
	TA_Follow_Player		(20,00,08,00,"ADW_CANYON_MINE2_10");
};

FUNC VOID Rtn_Gekillt_928 ()
{
	TA_Stand_ArmsCrossed	(08,00,20,00,"WP_UNDEAD_04");
	TA_Stand_ArmsCrossed	(20,00,08,00,"WP_UNDEAD_04");
};

FUNC VOID Rtn_Malcom_928 ()
{	
	TA_Stand_ArmsCrossed		(08,00,20,00,"ADW_PIRATECAMP_WAY_07");
	TA_Stand_ArmsCrossed		(20,00,08,00,"ADW_PIRATECAMP_WAY_07");
};

FUNC VOID Rtn_Beerdigung_928 ()
{
	TA_Stand_ArmsCrossed	(08,00,20,00,"ADW_PIRATECAMP_TRAIN_01");
	TA_Stand_ArmsCrossed	(20,00,08,00,"ADW_PIRATECAMP_TRAIN_01");
};

FUNC VOID Rtn_Alligatoren_928 ()
{
	TA_Follow_Player	(08,00,20,00,"ADW_PIRATECAMP_TRAIN_01");
	TA_Follow_Player	(20,00,08,00,"ADW_PIRATECAMP_TRAIN_01");
};

FUNC VOID Rtn_Follow_928 ()
{
	TA_Follow_Player	(08,00,20,00,"STRAND");
	TA_Follow_Player	(20,00,08,00,"STRAND");
};

FUNC VOID Rtn_Tot_928 ()
{	
	TA_Stand_Guarding 	(05,00,20,00,"TOT");
	TA_Stand_Guarding	(20,00,05,00,"TOT");
};