FUNC VOID Erfolge_Func ()
{
	// Erfolge auswerten

	if (Mod_SaveOther == 0)	// Nicht während Gesprächen
	{
		// Eifriger Büßer

		if (Erfolg_EifrigerBuesser == 0)
		&& (Mod_CountSpende >= 100000)
		{
			Erfolg_EifrigerBuesser = 1;

			CurrentErfolge += 1;

			ErfolgText = ConcatStrings(IntToString((CurrentErfolge*100)/MaxErfolge), "% aller Erfolge erreicht");

			Npc_RemoveInvItems	(hero, ItWr_Erfolge, 1);
			CreateInvItems	(hero, ItWr_Erfolge, 1);

			B_GivePlayerXP	(50);

			B_PrintErfolg ("Eifriger Büßer");

			MEM_SetGothOpt ("XERES", "acheb", "1");
			MEM_SetGothOpt ("XERES", "ach", IntToString(CurrentErfolge));
		};

		// Eiserne Konstitution

		if (Erfolg_EiserneKonstitution == 0)
		&& (Mod_CountGifte >= 200)
		{
			Erfolg_EiserneKonstitution = 1;

			CurrentErfolge += 1;

			ErfolgText = ConcatStrings(IntToString((CurrentErfolge*100)/MaxErfolge), "% aller Erfolge erreicht");

			Npc_RemoveInvItems	(hero, ItWr_Erfolge, 1);
			CreateInvItems	(hero, ItWr_Erfolge, 1);

			B_GivePlayerXP	(50);

			B_PrintErfolg ("Eiserne Konstitution");

			MEM_SetGothOpt ("XERES", "achek", "1");
			MEM_SetGothOpt ("XERES", "ach", IntToString(CurrentErfolge));
		};

		// Erkenntnis um die Schöpfung

		if (Erfolg_Backgroundstory2 == 0)
		&& (BackGroundCounter == 18)
		{
			Erfolg_Backgroundstory2 = 1;

			CurrentErfolge += 1;

			ErfolgText = ConcatStrings(IntToString((CurrentErfolge*100)/MaxErfolge), "% aller Erfolge erreicht");

			Npc_RemoveInvItems	(hero, ItWr_Erfolge, 1);
			CreateInvItems	(hero, ItWr_Erfolge, 1);

			B_GivePlayerXP	(50);

			B_PrintErfolg ("Erkenntnis um die Schöpfung");

			MEM_SetGothOpt ("XERES", "achbgs2", "1");
			MEM_SetGothOpt ("XERES", "ach", IntToString(CurrentErfolge));
		};

		// Flinker Lehrling

		if (Erfolg_FLehrling == 0)
		&& (Mod_IstLehrling == 1)
		&& (TimeCounter_Real < 7200)
		{
			Erfolg_FLehrling = 1;

			CurrentErfolge += 1;

			ErfolgText = ConcatStrings(IntToString((CurrentErfolge*100)/MaxErfolge), "% aller Erfolge erreicht");

			Npc_RemoveInvItems	(hero, ItWr_Erfolge, 1);
			CreateInvItems	(hero, ItWr_Erfolge, 1);

			B_GivePlayerXP	(50);

			B_PrintErfolg ("Flinker Lehrling");

			MEM_SetGothOpt ("XERES", "achfl", "1");
			MEM_SetGothOpt ("XERES", "ach", IntToString(CurrentErfolge));
		};

		// Helferlein

		if (Erfolg_Helferlein == 0)
		&& (CurrentNQ >= ((80*MaxNQ)/100))
		{
			Erfolg_Helferlein = 1;

			CurrentErfolge += 1;

			ErfolgText = ConcatStrings(IntToString((CurrentErfolge*100)/MaxErfolge), "% aller Erfolge erreicht");

			Npc_RemoveInvItems	(hero, ItWr_Erfolge, 1);
			CreateInvItems	(hero, ItWr_Erfolge, 1);

			B_GivePlayerXP	(50);

			B_PrintErfolg ("Helferlein");

			MEM_SetGothOpt ("XERES", "achh", "1");
			MEM_SetGothOpt ("XERES", "ach", IntToString(CurrentErfolge));
		};

		// Kiffer

		if (Erfolg_Kiffer == 0)
		&& (Mod_JointCounter == 100)
		{
			Erfolg_Kiffer = 1;

			CurrentErfolge += 1;

			ErfolgText = ConcatStrings(IntToString((CurrentErfolge*100)/MaxErfolge), "% aller Erfolge erreicht");

			Npc_RemoveInvItems	(hero, ItWr_Erfolge, 1);
			CreateInvItems	(hero, ItWr_Erfolge, 1);

			B_GivePlayerXP	(50);

			B_PrintErfolg ("Kettenraucher");

			MEM_SetGothOpt ("XERES", "achk", "1");
			MEM_SetGothOpt ("XERES", "ach", IntToString(CurrentErfolge));
		};

		// Lange Finger

		if (Erfolg_LangeFinger == 0)
		&& (Mod_CountTaschendiebstahl >= 300)
		{
			Erfolg_LangeFinger = 1;

			CurrentErfolge += 1;

			ErfolgText = ConcatStrings(IntToString((CurrentErfolge*100)/MaxErfolge), "% aller Erfolge erreicht");

			Npc_RemoveInvItems	(hero, ItWr_Erfolge, 1);
			CreateInvItems	(hero, ItWr_Erfolge, 1);

			B_GivePlayerXP	(50);

			B_PrintErfolg ("Lange Finger");

			MEM_SetGothOpt ("XERES", "achlf", "1");
			MEM_SetGothOpt ("XERES", "ach", IntToString(CurrentErfolge));
		};

		// Leidensfähigkeit

		if (Erfolg_Leidensfaehigkeit == 0)
		&& (Npc_KnowsInfo(hero, Info_Mod_Hubert_CityGuide06))
		{
			Erfolg_Leidensfaehigkeit = 1;

			CurrentErfolge += 1;

			ErfolgText = ConcatStrings(IntToString((CurrentErfolge*100)/MaxErfolge), "% aller Erfolge erreicht");

			Npc_RemoveInvItems	(hero, ItWr_Erfolge, 1);
			CreateInvItems	(hero, ItWr_Erfolge, 1);

			B_GivePlayerXP	(50);

			B_PrintErfolg ("Leidensfähigkeit");

			MEM_SetGothOpt ("XERES", "achlf", "1");
			MEM_SetGothOpt ("XERES", "ach", IntToString(CurrentErfolge));
		};

		// Levelmeister

		if (Erfolg_MaxLevel == 0)
		&& (hero.level == 50)
		{
			Erfolg_MaxLevel = 1;

			CurrentErfolge += 1;

			ErfolgText = ConcatStrings(IntToString((CurrentErfolge*100)/MaxErfolge), "% aller Erfolge erreicht");

			Npc_RemoveInvItems	(hero, ItWr_Erfolge, 1);
			CreateInvItems	(hero, ItWr_Erfolge, 1);

			B_GivePlayerXP	(50);

			B_PrintErfolg ("Levelmeister");

			MEM_SetGothOpt ("XERES", "achlm", "1");
			MEM_SetGothOpt ("XERES", "ach", IntToString(CurrentErfolge));
		};

		// Magersüchtiger

		if (Erfolg_Magersucht == 0)
		&& (Mod_EssKo >= 5)
		{
			Erfolg_Magersucht = 1;

			CurrentErfolge += 1;

			ErfolgText = ConcatStrings(IntToString((CurrentErfolge*100)/MaxErfolge), "% aller Erfolge erreicht");

			Npc_RemoveInvItems	(hero, ItWr_Erfolge, 1);
			CreateInvItems	(hero, ItWr_Erfolge, 1);

			B_GivePlayerXP	(50);

			B_PrintErfolg ("Magersüchtiger");

			MEM_SetGothOpt ("XERES", "achms", "1");
			MEM_SetGothOpt ("XERES", "ach", IntToString(CurrentErfolge));
		};

		// Monsterjäger

		if (Erfolg_MonsterHunter == 0)
		&& (Mod_MonsterGekillt >= 2000)
		{
			Erfolg_MonsterHunter = 1;

			CurrentErfolge += 1;

			ErfolgText = ConcatStrings(IntToString((CurrentErfolge*100)/MaxErfolge), "% aller Erfolge erreicht");

			Npc_RemoveInvItems	(hero, ItWr_Erfolge, 1);
			CreateInvItems	(hero, ItWr_Erfolge, 1);

			B_GivePlayerXP	(50);

			B_PrintErfolg ("Monsterjäger");

			MEM_SetGothOpt ("XERES", "achmj", "1");
			MEM_SetGothOpt ("XERES", "ach", IntToString(CurrentErfolge));
		};

		// Rattenjäger

		if (Erfolg_Rattenjaeger == 0)
		&& (Mod_REL_Wettstreit_Hero > 20)
		{
			Erfolg_Rattenjaeger = 1;

			CurrentErfolge += 1;

			ErfolgText = ConcatStrings(IntToString((CurrentErfolge*100)/MaxErfolge), "% aller Erfolge erreicht");

			Npc_RemoveInvItems	(hero, ItWr_Erfolge, 1);
			CreateInvItems	(hero, ItWr_Erfolge, 1);

			B_GivePlayerXP	(50);

			B_PrintErfolg ("Rattenjäger");

			MEM_SetGothOpt ("XERES", "achrj", "1");
			MEM_SetGothOpt ("XERES", "ach", IntToString(CurrentErfolge));
		};

		// Seepferdchen

		if (Erfolg_Seepferdchen == 0)
		&& (Mod_SchwimmTauchCounter >= 1800)
		{
			Erfolg_Seepferdchen = 1;

			CurrentErfolge += 1;

			ErfolgText = ConcatStrings(IntToString((CurrentErfolge*100)/MaxErfolge), "% aller Erfolge erreicht");

			Npc_RemoveInvItems	(hero, ItWr_Erfolge, 1);
			CreateInvItems	(hero, ItWr_Erfolge, 1);

			B_GivePlayerXP	(50);

			B_PrintErfolg ("Seepferdchen");

			MEM_SetGothOpt ("XERES", "achsp", "1");
			MEM_SetGothOpt ("XERES", "ach", IntToString(CurrentErfolge));
		};

		// Selbstlosigkeit

		if (Erfolg_Selbstlosigkeit == 0)
		&& (Npc_KnowsInfo(hero, Info_Mod_Wolf_Rotkaeppchen_NimmMich))
		{
			Erfolg_Selbstlosigkeit = 1;

			CurrentErfolge += 1;

			ErfolgText = ConcatStrings(IntToString((CurrentErfolge*100)/MaxErfolge), "% aller Erfolge erreicht");

			Npc_RemoveInvItems	(hero, ItWr_Erfolge, 1);
			CreateInvItems	(hero, ItWr_Erfolge, 1);

			B_GivePlayerXP	(50);

			B_PrintErfolg ("Selbstlosigkeit");

			MEM_SetGothOpt ("XERES", "achsl", "1");
			MEM_SetGothOpt ("XERES", "ach", IntToString(CurrentErfolge));
		};

		// Sparschwein

		if (Erfolg_Sparschwein == 0)
		&& (Npc_HasItems(hero, ItMi_Gold) >= 100000)
		{
			Erfolg_Sparschwein = 1;

			CurrentErfolge += 1;

			ErfolgText = ConcatStrings(IntToString((CurrentErfolge*100)/MaxErfolge), "% aller Erfolge erreicht");

			Npc_RemoveInvItems	(hero, ItWr_Erfolge, 1);
			CreateInvItems	(hero, ItWr_Erfolge, 1);

			B_GivePlayerXP	(50);

			B_PrintErfolg ("Sparschwein");

			MEM_SetGothOpt ("XERES", "achss", "1");
			MEM_SetGothOpt ("XERES", "ach", IntToString(CurrentErfolge));
		};

		// Trampel

		if (Erfolg_Trampel == 0)
		&& (Fleischwanzen_Zertrampelt >= 100)
		{
			Erfolg_Trampel = 1;

			CurrentErfolge += 1;

			ErfolgText = ConcatStrings(IntToString((CurrentErfolge*100)/MaxErfolge), "% aller Erfolge erreicht");

			Npc_RemoveInvItems	(hero, ItWr_Erfolge, 1);
			CreateInvItems	(hero, ItWr_Erfolge, 1);

			B_GivePlayerXP	(50);

			B_PrintErfolg ("Trampel");

			MEM_SetGothOpt ("XERES", "achtr", "1");
			MEM_SetGothOpt ("XERES", "ach", IntToString(CurrentErfolge));
		};

		// Wandlungskünstler

		if (Erfolg_Wandlungskuenstler == 0)
		&& (Mod_CountVerwandlungen >= 50)
		{
			Erfolg_Wandlungskuenstler = 1;

			CurrentErfolge += 1;

			ErfolgText = ConcatStrings(IntToString((CurrentErfolge*100)/MaxErfolge), "% aller Erfolge erreicht");

			Npc_RemoveInvItems	(hero, ItWr_Erfolge, 1);
			CreateInvItems	(hero, ItWr_Erfolge, 1);

			B_GivePlayerXP	(50);

			B_PrintErfolg ("Wandlungskünstler");

			MEM_SetGothOpt ("XERES", "achwk", "1");
			MEM_SetGothOpt ("XERES", "ach", IntToString(CurrentErfolge));
		};

		// Wissen um das alte Volk

		if (Erfolg_Backgroundstory == 0)
		&& (BackGroundCounter == 8)
		{
			Erfolg_Backgroundstory = 1;

			CurrentErfolge += 1;

			ErfolgText = ConcatStrings(IntToString((CurrentErfolge*100)/MaxErfolge), "% aller Erfolge erreicht");

			Npc_RemoveInvItems	(hero, ItWr_Erfolge, 1);
			CreateInvItems	(hero, ItWr_Erfolge, 1);

			B_GivePlayerXP	(50);

			B_PrintErfolg ("Wissen um das alte Volk");

			MEM_SetGothOpt ("XERES", "achbgs1", "1");
			MEM_SetGothOpt ("XERES", "ach", IntToString(CurrentErfolge));
		};

		// Zeitspiel

		if (Erfolg_Zeitspiel == 0)
		&& (TimeCounter_Real >= 360000)
		{
			Erfolg_Zeitspiel = 1;

			CurrentErfolge += 1;

			ErfolgText = ConcatStrings(IntToString((CurrentErfolge*100)/MaxErfolge), "% aller Erfolge erreicht");

			Npc_RemoveInvItems	(hero, ItWr_Erfolge, 1);
			CreateInvItems	(hero, ItWr_Erfolge, 1);

			B_GivePlayerXP	(50);

			B_PrintErfolg ("Zeitspiel");

			MEM_SetGothOpt ("XERES", "achzs", "1");
			MEM_SetGothOpt ("XERES", "ach", IntToString(CurrentErfolge));
		};
	};
};