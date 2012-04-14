var int Mod_OTTeleportScene_Counter;

FUNC VOID OTTeleportScene()
{
	if (Mod_OTTeleportScene_Counter == 0)
	{
		AI_StandUP	(hero);

		CutsceneAn = TRUE;

		AI_Output(hero, NULL, "Info_Mod_OTTeleportScene_15_00"); //Na prima, als Untoter kann ich mich nicht teleportieren.
	};

	if (Mod_OTTeleportScene_Counter == 6)
	{
		AI_StandUP	(hero);

		AI_Output(hero, NULL, "Info_Mod_OTTeleportScene_15_01"); //Ich muss zuerst einen Weg zurück ins Leben finden.
	};

	if (Mod_OTTeleportScene_Counter == 12)
	{
		AI_StandUP	(hero);

		AI_Output(hero, NULL, "Info_Mod_OTTeleportScene_15_02"); //Aber wie? Ich habe schon alles mitgenommen, was der Tempel zu bieten hat, bevor ich dem Schläfer gegenübergetreten bin.
	};

	if (Mod_OTTeleportScene_Counter == 18)
	{
		AI_StandUP	(hero);

		AI_Output(hero, NULL, "Info_Mod_OTTeleportScene_15_03"); //(überlegt) Hmm, vielleicht kann ich durch die Erdbeben an Orte gelangen, die mir vorher verwehrt geblieben sind ...?
	};

	if (Mod_OTTeleportScene_Counter == 24)
	{
		TooLessMana = 2;

		B_LogEntry	(TOPIC_MOD_ANFANG, "Na prima, als Untoter kann ich mich nicht teleportieren. Ich muss zuerst einen Weg zurück ins Leben finden. Aber wie? Ich habe schon alles mitgenommen, was der Tempel zu bieten hat, bevor ich dem Schläfer gegenübergetreten bin. (überlegt) Hmm, vielleicht kann ich durch die Erdbeben an Orte gelangen, die mir vorher verwehrt geblieben sind...?");

		CutsceneAn = FALSE;
	};

	Mod_OTTeleportScene_Counter += 1;
};