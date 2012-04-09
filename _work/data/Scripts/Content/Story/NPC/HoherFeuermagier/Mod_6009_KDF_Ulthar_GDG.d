INSTANCE Mod_6009_KDF_Ulthar_GDG (Npc_Default)
{
	// ------ NSC ------
	name 		= "Ulthar";
	guild 		= GIL_OUT;
	id 			= 6009;
	voice 		= 5;
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

	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;																
	EquipItem	(self, ItMW_Addon_Stab01);

	// ------ Equippte Waffen ------


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
	daily_routine 		= Rtn_Start_6009;
};

FUNC VOID Rtn_Start_6009 ()
{
	TA_Study_WP	(08,00,23,00,"WP_GDG_ULTHAR_STUDY");
    TA_Study_WP	(23,00,08,00,"WP_GDG_ULTHAR_STUDY");
};