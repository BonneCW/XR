INSTANCE Mod_6011_KDF_Serpentes_GDG (Npc_Default)
{
	// ------ NSC ------
	name 		= "Serpentes";
	guild 		= GIL_OUT;
	id 		= 6011;
	voice		= 3;
	flags           = 0;
	npctype		= NPCTYPE_MAIN;

	// ------ Aivars ------
	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;																
	EquipItem	(self, ItMW_Addon_Stab01);

	// ------ Attribute ------
	B_SetAttributesToChapter (self, 5);

	// ------ Kampf-Taktik ------
	fight_tactic		= FAI_HUMAN_STRONG;

	// ------ Equippte Waffen ------


	// ------ Inventory ------
	B_CreateAmbientInv 	(self);

	aivar[AIV_MagicUser] = MAGIC_ALWAYS;

	// ------ visuals ------
	B_SetNpcVisual 		(self, MALE, "Hum_Head_PSIONIC",Face_N_ImportantGrey , BodyTex_N, ITAR_KDF_H);
	Mdl_SetModelFatness	(self, -2);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds");

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);

	// ------ Kampf-Talente ------
	B_SetFightSkills (self, 65);

	// ------ TA anmelden ------
	daily_routine 		= Rtn_Start_6011;
};

FUNC VOID Rtn_Start_6011 ()
{
	TA_Study_WP	(08,00,23,00,"WP_GDG_SERPENTES_STUDY");
    TA_Study_WP	(23,00,08,00,"WP_GDG_SERPENTES_STUDY");
};