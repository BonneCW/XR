INSTANCE Mod_553_KDF_Ulthar_NW (Npc_Default)
{
	// ------ NSC ------
	name 		= "Ulthar";
	guild 		= GIL_VLK;
	id 			= 553;
	voice		= 0;
	flags       = 0;
	npctype		= NPCTYPE_MAIN;

	// ------ Aivars ------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 6);
	
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;

	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;

	// ------ Equippte Waffen ------
																
	EquipItem	(self, ItMW_Addon_Stab01);

	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

	aivar[AIV_MagicUser] = MAGIC_ALWAYS;

	// ------ visuals ------
	B_SetNpcVisual 		(self, MALE, "Hum_Head_FatBald",Face_L_NormalBart01 , BodyTex_L, ITAR_KDF_H);
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds");

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);

	// ------ Kampf-Talente ------
	B_SetFightSkills (self, 65);

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_553;
};

FUNC VOID Rtn_Start_553 ()
{
	TA_Sit_Throne	(08,00,23,00,"NW_MONASTERY_THRONE_03");
	TA_Sit_Throne	(23,00,08,00,"NW_MONASTERY_THRONE_03");
};

FUNC VOID Rtn_Tot_553 ()
{
	TA_Stand_WP	(08,00,23,00,"TOT");
	TA_Stand_WP	(23,00,08,00,"TOT");
};

FUNC VOID Rtn_AtBett_553()
{
	TA_Stand_WP		(08,00,20,00,"NW_MONASTERY_NOVICE01_01");
	TA_Stand_WP		(20,00,08,00,"NW_MONASTERY_NOVICE01_01");
};