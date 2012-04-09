FUNC VOID FokusEinsetzen()
{
	FokiEingesetzt = FokiEingesetzt + 1;

	if (FokiEingesetzt	==	1)
	{
		Wld_PlayEffect("FX_EarthQuake",  hero, hero, 0, 0, 0, FALSE );

		Wld_InsertNpc	(Mod_678_DMB_Xardas_AW,		"ADW_ENTRANCE");

		B_LogEntry	(TOPIC_MOD_FOKUSSUCHE, "Ich habe alle 5 Foki eingesetzt. Beim Einsetzen des letzten Foki gab es ein Erdbeben. Ich sollte mal zu den Wassermagiern gehen.");

		B_GivePlayerXP	(300);

		B_SetTopicStatus	(TOPIC_MOD_FOKUSSUCHE, LOG_SUCCESS);

		//B_Kapitelwechsel (3, ADDONWORLD_ZEN);
	};
};