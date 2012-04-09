INSTANCE Mod_6002_KDF_Pyrokar_GDG (Npc_Default)
{
	// ------ NSC ------
	name 		= "Pyrokar";
	guild 		= GIL_OUT;
	id 		= 6002;
	voice 		= 11;
	flags           = 0;
	npctype		= NPCTYPE_MAIN;

	B_SetAttributesToChapter (self, 6);
	fight_tactic		= FAI_HUMAN_STRONG;

	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald",Face_N_ImportantOld , BodyTex_N, ITAR_KDF_VERYHIGH);
	Mdl_SetModelFatness	(self, 3);
	Mdl_ApplyOverlayMds	(self, "Humans_Mage.mds");

	aivar[AIV_MagicUser] = MAGIC_ALWAYS;

	B_GiveNpcTalents (self);
	B_SetFightSkills (self, 100);																
	EquipItem	(self, ItMW_Addon_Stab01);

	daily_routine 		= Rtn_Start_6002;
};

FUNC VOID Rtn_Start_6002 ()
{
	TA_Sit_Throne	(08,00,23,00,"LGR_RATSHAUS_12");
    	TA_Sit_Throne	(23,00,08,00,"LGR_RATSHAUS_12");
};

FUNC VOID Rtn_WaitForRitual_6002 ()
{
	TA_Stand_WP		(08,00,20,00,"WP_GDG_RITUAL_PYROKAR");
	TA_Stand_WP		(20,00,08,00,"WP_GDG_RITUAL_PYROKAR");
};

FUNC VOID Rtn_Ritual_6002 ()
{
	TA_Ritual_Pyrokar		(08,00,20,00,"WP_GDG_RITUAL_SATURAS");
	TA_Ritual_Pyrokar		(20,00,08,00,"WP_GDG_RITUAL_SATURAS");
};