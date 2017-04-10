FUNC VOID AUFSTELLUNG()
{
	if (Mod_AufstellungAktiviert == FALSE)
	&& (Npc_KnowsInfo(hero, Info_Mod_Alissandro_EigentlichBereit))
	{
		Mod_AufstellungAktiviert = 1;
	};
};

FUNC VOID BELIARGATETRIGGER() {
	if (Kapitel == 1) {
		AI_StandUp(hero);
		AI_GotoWp(hero, "PALTOBURG_3");
	};
};
