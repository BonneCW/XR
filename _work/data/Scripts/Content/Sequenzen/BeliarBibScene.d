var int Mod_BeliarBibScene_Counter;

FUNC VOID BeliarBibScene()
{
	if (Mod_BeliarBibScene_Counter == 1)
	{
		Wld_SendTrigger	("BELIARBIBSCENECAM");

		CutsceneAn = TRUE;
	};

	if (Mod_BeliarBibScene_Counter == 3)
	{
		AI_Output(Mod_473_DMB_Andokai_MT, NULL, "Info_Mod_Hero_BeliarBibScene_12_00"); //Wie konnte das passieren? Wer ist für diesen Unfug verantwortlich?
	};

	if (Mod_BeliarBibScene_Counter == 9)
	{
		AI_Output(Mod_7755_KDS_SchwarzerMagier_MT, NULL, "Info_Mod_Hero_BeliarBibScene_03_01"); //(außer Atem) Es war Bruder Mors, Meister.
	};

	if (Mod_BeliarBibScene_Counter == 15)
	{
		AI_Output(Mod_473_DMB_Andokai_MT, NULL, "Info_Mod_Hero_BeliarBibScene_12_02"); //Was hat dieser dämliche Trottel angestellt?
	};

	if (Mod_BeliarBibScene_Counter == 21)
	{
		AI_Output(Mod_7755_KDS_SchwarzerMagier_MT, NULL, "Info_Mod_Hero_BeliarBibScene_03_03"); //Er hat eines der Bücher geöffnet, die mit schweren Ketten verschlossen sind.
	};

	if (Mod_BeliarBibScene_Counter == 27)
	{
		AI_Output(Mod_7755_KDS_SchwarzerMagier_MT, NULL, "Info_Mod_Hero_BeliarBibScene_03_04"); //Er hat die Versiegelung mit einem Zauber gesprengt, obwohl wir ihm davon abgeraten haben.
	};

	if (Mod_BeliarBibScene_Counter == 33)
	{
		AI_Output(Mod_7755_KDS_SchwarzerMagier_MT, NULL, "Info_Mod_Hero_BeliarBibScene_03_05"); //In dem Moment, da sich die Ketten lösten, gab es eine Explosion und Mors wurde in einem hohen Bogen durch die Bibliothek geschleudert.
	};

	if (Mod_BeliarBibScene_Counter == 39)
	{
		AI_Output(Mod_7755_KDS_SchwarzerMagier_MT, NULL, "Info_Mod_Hero_BeliarBibScene_03_06"); //Dann krochen ... Dinge aus dem Buch hervor. Wir haben nur noch unsere Beine in die Hand genommen.
	};

	if (Mod_BeliarBibScene_Counter == 45)
	{
		AI_Output(hero, NULL, "Info_Mod_Hero_BeliarBibScene_15_07"); //Ein verfluchtes Buch?
	};

	if (Mod_BeliarBibScene_Counter == 51)
	{
		AI_Output(Mod_473_DMB_Andokai_MT, NULL, "Info_Mod_Hero_BeliarBibScene_12_08"); //Bei solchen alten Schinken weiß man nie. Und deswegen lässt man auch die Finger davon, wenn man nur ein kleiner Novize ist und keine Ahnung hat!
	};

	if (Mod_BeliarBibScene_Counter == 57)
	{
		AI_Output(hero, NULL, "Info_Mod_Hero_BeliarBibScene_15_09"); //Sollte nicht lieber jemand in der Bibliothek nach dem Rechten sehen?
	};

	if (Mod_BeliarBibScene_Counter == 63)
	{
		AI_Output(Mod_7756_KDS_SchwarzerMagier_MT, NULL, "Info_Mod_Hero_BeliarBibScene_03_10"); //Ich will nicht zurück. Dort sind sicher alle tot!
	};

	if (Mod_BeliarBibScene_Counter == 69)
	{
		AI_Output(Mod_473_DMB_Andokai_MT, NULL, "Info_Mod_Hero_BeliarBibScene_12_11"); //Einen ersten Freiwilligen hätten wir also bereits.
	};

	if (Mod_BeliarBibScene_Counter == 75)
	{
		AI_Output(Mod_7756_KDS_SchwarzerMagier_MT, NULL, "Info_Mod_Hero_BeliarBibScene_03_12"); //(entsetzt) Das könnt Ihr nicht tun!
	};

	if (Mod_BeliarBibScene_Counter == 81)
	{
		Mod_BeliarBibScene = 2;

		Wld_SendUnTrigger	("BELIARBIBSCENECAM");

		CutsceneAn = FALSE;
	};

	Mod_BeliarBibScene_Counter += 1;
};