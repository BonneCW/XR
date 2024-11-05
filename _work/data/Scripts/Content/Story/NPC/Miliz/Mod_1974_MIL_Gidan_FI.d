instance Mod_1974_MIL_Gidan_FI (Npc_Default)
{
	// ------ NSC ------
	name 		= "Gidan";
	guild 		= GIL_DMT;
	id 			= 1974;
	voice		= 0;
	flags      	= 2;
	npctype		= NPCTYPE_MAIN;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 3);

	aivar[AIV_IGNORE_MURDER] = 1;
	aivar[AIV_IGNORE_THEFT] = 1;
	aivar[AIV_IGNORE_SHEEPKILLER] = 1;
	aivar[AIV_TOUGHGUY] = 1;
	aivar[AIV_ENEMYOVERRIDE] = 1;

	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;

	// ------ Equippte Waffen ------
	EquipItem (self, ItMw_Milizschwert);

	// ------ Inventory ------
	B_CreateAmbientInv (self);

	// ------ visuals ------
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Thief", Face_L_NormalBart01, BodyTex_L, ITAR_GURUFANATIKER);
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds");

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);

	// ------ Kampf-Talente ------
	B_SetFightSkills (self, 60);

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_1974;
};

FUNC VOID Rtn_Start_1974()
{
	TA_Stand_ArmsCrossed 	(02,00,10,00,"FI_50");
	TA_Stand_ArmsCrossed 	(10,00,02,00,"FI_50");
};

FUNC VOID Rtn_WatchFight_1974()
{
	TA_Stand_ArmsCrossed 	(02,00,10,00,"FI_51");
	TA_Stand_ArmsCrossed 	(10,00,02,00,"FI_51");
};

FUNC VOID Rtn_Rede_1974()
{
	TA_Smalltalk_Plaudern 	(02,00,10,00,"FI_58");
	TA_Smalltalk_Plaudern 	(10,00,02,00,"FI_58");
};

FUNC VOID Rtn_Tot_1974 ()
{
	TA_Stand_ArmsCrossed	(02,00,08,00,"TOT");
	TA_Stand_ArmsCrossed	(08,00,02,00,"TOT");
};