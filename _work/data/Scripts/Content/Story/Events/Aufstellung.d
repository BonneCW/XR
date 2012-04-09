FUNC VOID AUFSTELLUNG()
{
	if (Mod_AufstellungAktiviert == FALSE)
	&& (Npc_KnowsInfo(hero, Info_Mod_Alissandro_EigentlichBereit))
	{
		Mod_AufstellungAktiviert = 1;
	};
};