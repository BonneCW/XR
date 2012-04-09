INSTANCE Mod_7529_OUT_AlterMann_REL (Npc_Default)
{
	// ------ NSC ------
	name 		= "Alter Mann des Waldes";
	guild 		= GIL_DMT;
	id 		= 7529;
	voice 		= 11;
	flags           = 0;
	npctype		= NPCTYPE_MAIN;

	aivar[AIV_ToughGuy] 			= TRUE;
	aivar[AIV_ToughGuyNewsOverride] = TRUE;
	aivar[AIV_IGNORE_Murder]		= TRUE;
	aivar[AIV_IGNORE_Theft] 		= TRUE;
	aivar[AIV_IGNORE_Sheepkiller] 	= TRUE;

	B_SetAttributesToChapter (self, 6);
	fight_tactic		= FAI_HUMAN_STRONG;

	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_N_ImportantOld , BodyTex_N, ITAR_DRUIDEWALDMAGIER);
	Mdl_SetModelFatness	(self, 3);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds");

	aivar[AIV_MagicUser] = MAGIC_ALWAYS;																
	EquipItem	(self, ItMW_Addon_Stab01);

	B_GiveNpcTalents (self);
	B_SetFightSkills (self, 100);

	daily_routine 		= Rtn_Start_7529;
};

FUNC VOID Rtn_Start_7529 ()
{
	TA_Smalltalk_Plaudern	(08,00,23,00,"REL_SURFACE_130");
    	TA_Smalltalk_Plaudern	(23,00,08,00,"REL_SURFACE_130");
};

FUNC VOID Rtn_Mine_7529()
{
	TA_Stand_Guarding		(08,00,20,00,"REL_SURFACE_146");
	TA_Stand_Guarding		(20,00,08,00,"REL_SURFACE_146");
};

FUNC VOID Rtn_Tot_7529()
{
	TA_Stand_WP		(08,00,20,00,"TOT");
	TA_Stand_WP		(20,00,08,00,"TOT");
};