INSTANCE Mod_533_SLD_Gorn_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Gorn";
	guild 		= GIL_OUT;
	id 			= 533;
	voice 		= 12;
	flags       = 2;																	
	npctype		= NPCTYPE_FRIEND;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);																
	
	aivar[AIV_IgnoresArmor] 	= TRUE;

	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_MASTER;	
	
	// ------ Equippte Waffen ------																	
	EquipItem	(self,	Gorns_Rache);
	
	// ------ Inventory ------
	B_CreateAmbientInv 	(self);
	
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Fighter",Face_B_Gorn, BodyTex_B, ITAR_SLD_H2);		
	Mdl_SetModelFatness	(self, 0);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 
	
	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 70); 

	// ------ TA anmelden ------
	daily_routine 		= Rtn_PreStart_533;
};

FUNC VOID Rtn_PreStart_533()
{
	TA_Stand_WP		(05,00,20,00,"NW_CASTLEMINE_PATH_13");	
	TA_Stand_WP		(20,00,05,00,"NW_CASTLEMINE_PATH_13");
};

FUNC VOID Rtn_Start_533 ()
{	
	TA_Stand_Eating		(07,00,07,30,"NW_BIGFARM_KITCHEN_OUT_02"); 
	TA_Stand_Drinking	(07,30,08,00,"NW_BIGFARM_KITCHEN_OUT_02"); 
	TA_Pee			(08,00,08,30,"NW_BIGFARM_TREE"); 
	TA_Stand_ArmsCrossed	(08,30,12,00,"NW_BIGFARM_KITCHEN_OUT_02"); 
	TA_Stand_Eating		(12,00,12,30,"NW_BIGFARM_KITCHEN_OUT_02"); 
	TA_Stand_Drinking	(12,30,13,00,"NW_BIGFARM_KITCHEN_OUT_02"); 
	TA_Pee			(13,00,13,30,"NW_BIGFARM_TREE"); 
	TA_Stand_ArmsCrossed	(13,30,18,00,"NW_BIGFARM_KITCHEN_OUT_02"); 
	TA_Stand_Eating		(18,00,18,30,"NW_BIGFARM_KITCHEN_OUT_02"); 
	TA_Stand_Drinking	(18,30,19,00,"NW_BIGFARM_KITCHEN_OUT_02"); 
	TA_Pee			(19,00,19,30,"NW_BIGFARM_TREE"); 
	TA_Sit_Chair		(19,30,22,00,"NW_BIGFARM_KITCHEN_BULLCO"); 
	TA_Sleep		(22,00,07,00,"NW_BIGFARM_HOUSE_UP2_02");
};

FUNC VOID Rtn_Treffen_533()
{
	TA_Stand_WP		(05,00,20,00,"NW_TAVERNE_IN_RANGERMEETING_LARES");	
	TA_Stand_WP		(20,00,05,00,"NW_TAVERNE_IN_RANGERMEETING_LARES");
};

FUNC VOID Rtn_Aufstellung_533()
{
	TA_Smalltalk_Plaudern		(08,00,20,00,"WP_AUFSTELLUNG_12");
	TA_Smalltalk_Plaudern		(20,00,08,00,"WP_AUFSTELLUNG_12");
};

FUNC VOID Rtn_Angriff_533()
{
	TA_RunToWP		(08,00,20,00,"NW_BIGMILL_05");
	TA_RunToWP		(20,00,08,00,"NW_BIGMILL_05");
};	

FUNC VOID Rtn_Hexen_533()
{
	TA_Stand_WP		(08,00,20,00,"NW_BIGFARM_CROSS");
	TA_Stand_WP		(20,00,08,00,"NW_BIGFARM_CROSS");
};

FUNC VOID Rtn_Dragon_533()
{
	TA_Stand_WP		(08,00,20,00,"NW_BIGFARM_CHAPEL_01");
	TA_Stand_WP		(20,00,08,00,"NW_BIGFARM_CHAPEL_01");
};

FUNC VOID Rtn_Diener_533()
{
	TA_RunToWP		(08,00,20,00,"NW_FARM4_WOOD_MONSTER_MORE_03");
	TA_RunToWP		(20,00,08,00,"NW_FARM4_WOOD_MONSTER_MORE_03");
};

FUNC VOID Rtn_Castlemine_533()
{
	TA_Guide_Player		(08,00,20,00,"NW_CASTLEMINE_HUT_10_B");
	TA_Guide_Player		(20,00,08,00,"NW_CASTLEMINE_HUT_10_B");
};

FUNC VOID Rtn_WaldTour_533()
{
	TA_Guide_Player		(08,00,20,00,"NW_CRYPT_MONSTER07");
	TA_Guide_Player		(20,00,08,00,"NW_CRYPT_MONSTER07");
};

FUNC VOID Rtn_VorKrypta_533()
{
	TA_Guide_Player		(08,00,20,00,"NW_CRYPT_MONSTER01");
	TA_Guide_Player		(20,00,08,00,"NW_CRYPT_MONSTER01");
};

FUNC VOID Rtn_BeiKrypta_533()
{
	TA_Guide_Player		(08,00,20,00,"NW_CRYPT_01");
	TA_Guide_Player		(20,00,08,00,"NW_CRYPT_01");
};

FUNC VOID Rtn_Krypta_533()
{
	TA_Follow_Player	(20,00,08,00,"NW_CRYPT_IN_11");
	TA_Follow_Player	(08,00,20,00,"NW_CRYPT_IN_11");
};

FUNC VOID Rtn_Schiff_533()
{
	TA_Stand_WP		(08,00,20,00,"SHIP_DECK_32");
	TA_Stand_WP		(20,00,08,00,"SHIP_DECK_32");
};

FUNC VOID Rtn_AtXardas_533()
{
	TA_Smalltalk_Plaudern		(08,00,20,00,"NW_XARDAS_TOWER_IN1_25");
	TA_Smalltalk_Plaudern		(20,00,08,00,"NW_XARDAS_TOWER_IN1_25");
};