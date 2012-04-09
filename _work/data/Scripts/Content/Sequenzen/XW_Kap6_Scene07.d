var int Mod_XW_Kap6_Scene07_Counter;

FUNC VOID XW_Kap6_Scene07()
{
	if (Mod_XW_Kap6_Scene07_Counter == 1)
	{
		Wld_SendTrigger	("KAP6SCENE3");

		CutsceneAn = TRUE;

		Mdl_RemoveOverlayMds	(hero, "HUMANS_FLEE.MDS");
	};

	if (Mod_XW_Kap6_Scene07_Counter == 3)
	{
		Wld_PlayEffect	("spellFX_Control_TARGET", Mod_7765_SLD_Gorn_XW, Mod_7765_SLD_Gorn_XW, 0, 0, 0, FALSE);
	};

	if (Mod_XW_Kap6_Scene07_Counter == 4)
	{
		Mod_7765_SLD_Gorn_XW.aivar[AIV_Partymember] = FALSE;
		Mod_7765_SLD_Gorn_XW.guild = GIL_STRF;
		Npc_SetTrueGuild (Mod_7765_SLD_Gorn_XW, GIL_STRF);
		Mod_7765_SLD_Gorn_XW.flags = 0;
	};

	if (Mod_XW_Kap6_Scene07_Counter == 5)
	{
		Mod_XW_Kap6 = 11;

		Mod_Xeres_Kampfphase = 3;

		Wld_SendUnTrigger	("KAP6SCENE3");

		B_Attack	(Xeres_02, hero, AR_NONE, 0);

		CutsceneAn = FALSE;
	};

	Mod_XW_Kap6_Scene07_Counter += 1;
};