var int ENTER_FIRSTTIME_FAKE_HERO;

FUNC VOID EVT_FAKE_HERO_ADDON_FUNC()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Goetterschwerter))
	&& (ENTER_FIRSTTIME_FAKE_HERO == FALSE)
	{
		AI_GotoWP (hero, "ADW_VALLEY_PATH_134");

		AI_Output(hero, hero, "Info_Mod_Fake_15_00"); //Was ist denn das?
		AI_Output(hero, hero, "Info_Mod_Fake_15_01"); //Der sieht aus wie ich.

		ENTER_FIRSTTIME_FAKE_HERO = TRUE;

		Wld_SendTrigger	("FAKEHEROFLY");
	};
};
	