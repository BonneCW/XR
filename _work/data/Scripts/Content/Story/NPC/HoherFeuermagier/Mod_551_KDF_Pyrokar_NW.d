INSTANCE Mod_551_KDF_Pyrokar_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Pyrokar";
	guild 		= GIL_DMT;
	id 		= 551;
	voice		= 0;
	flags           = 0;
	npctype		= NPCTYPE_MAIN;

	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;

	B_SetAttributesToChapter (self, 6);
	fight_tactic		= FAI_HUMAN_STRONG;

	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_N_ImportantOld , BodyTex_N, ITAR_KDF_VERYHIGH);
	Mdl_SetModelFatness	(self, 3);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds");

	aivar[AIV_MagicUser] = MAGIC_ALWAYS;																
	EquipItem	(self, ItMW_Addon_Stab01);

	B_GiveNpcTalents (self);
	B_SetFightSkills (self, 100);

	daily_routine 		= Rtn_Start_551;
};

FUNC VOID Rtn_Start_551 ()
{
	TA_Sit_Throne	(08,00,23,00,"NW_MONASTERY_THRONE_01");
    	TA_Sit_Throne	(23,00,08,00,"NW_MONASTERY_THRONE_01");
};

FUNC VOID Rtn_Rat_551()
{
	TA_Sit_Throne		(08,00,20,00,"WP_KLOSTER_KELLER_RAT_PYROKAR");
	TA_Sit_Throne		(20,00,08,00,"WP_KLOSTER_KELLER_RAT_PYROKAR");
};

FUNC VOID Rtn_Tot_551()
{
	TA_Stand_WP		(08,00,20,00,"TOT");
	TA_Stand_WP		(20,00,08,00,"TOT");
};

FUNC VOID Rtn_AtBett_551()
{
	TA_Stand_WP		(08,00,20,00,"NW_MONASTERY_NOVICE01_01");
	TA_Stand_WP		(20,00,08,00,"NW_MONASTERY_NOVICE01_01");
};