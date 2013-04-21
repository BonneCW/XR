instance Mod_526_SLD_Lares_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Lares"; 
	guild 		= GIL_DMT;
	id 			= 526;
	voice 		= 37;	
	flags = 2;																
	npctype		= NPCTYPE_FRIEND;
	
	// ------ AIVARS ------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);															
		
	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;	
	
	// ------ Equippte Waffen ------																
	EquipItem	(self, Lares_Axt); 
	
	
	// ------ Inventory ------
	CreateInvItems (self, Lares_Axt,1);//zur Sicherheit - bei Waffenverlust hat er 'ne neue M.F.
	CreateInvItems (self, ItMi_Gold, 100);	
	CreateInvItems (self, ItMi_OldCoin, 1);	//Joly: damit er gefunden wird, wenn er im Kampf stirbt
	CreateInvItems (self, ItPo_Health_02, 5);	//Mattes: damit er frisch bei Taverne ankommt.								
		
	// ------ visuals ------																			
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_N_Lares,BodyTex_N, ITAR_SLD_M);	
	Mdl_SetModelFatness	(self,0);
	Mdl_ApplyOverlayMds	(self, "Humans_Relaxed.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																	
	B_SetFightSkills (self, 50); 
	
	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_526;
};

FUNC VOID Rtn_Start_526()
{
	TA_Stand_ArmsCrossed	(08,00,22,00,"NW_BIGFARM_PATH_01");
	TA_Sleep		(22,00,08,00,"NW_BIGFARM_HOUSE_UP2_02");
};

FUNC VOID Rtn_Rat_526()
{
	TA_Stand_Guarding		(08,00,20,00,"NW_KDF_LIBRARY_16");
	TA_Stand_Guarding		(20,00,08,00,"NW_KDF_LIBRARY_16");
};

FUNC VOID Rtn_Tot_526()
{
	TA_Stand_WP		(08,00,20,00,"TOT");
	TA_Stand_WP		(20,00,08,00,"TOT");
};

FUNC VOID Rtn_Aufstellung_526()
{
	TA_Stand_WP		(08,00,20,00,"WP_AUFSTELLUNG_07");
	TA_Stand_WP		(20,00,08,00,"WP_AUFSTELLUNG_07");
};

FUNC VOID Rtn_Angriff_526()
{
	TA_RunToWP		(08,00,20,00,"NW_BIGMILL_05");
	TA_RunToWP		(20,00,08,00,"NW_BIGMILL_05");
};

FUNC VOID Rtn_Hexen_526()
{
	TA_Stand_WP		(08,00,20,00,"NW_BIGFARM_CROSS");
	TA_Stand_WP		(20,00,08,00,"NW_BIGFARM_CROSS");
};

FUNC VOID Rtn_Diener_526()
{
	TA_RunToWP		(08,00,20,00,"NW_FARM4_WOOD_MONSTER_MORE_03");
	TA_RunToWP		(20,00,08,00,"NW_FARM4_WOOD_MONSTER_MORE_03");
};

FUNC VOID Rtn_Knucker_526()
{
	TA_RunToWP		(08,00,20,00,"WP_DRAGON_KNUCKERUNDCO_SMALLTALK");
	TA_RunToWP		(20,00,08,00,"WP_DRAGON_KNUCKERUNDCO_SMALLTALK");
};