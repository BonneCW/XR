INSTANCE Info_Mod_Oschust_Hi (C_INFO)
{
	npc		= Mod_7022_BDT_Oschust_MT;
	nr		= 1;
	condition	= Info_Mod_Oschust_Hi_Condition;
	information	= Info_Mod_Oschust_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo, ich bin neu im Lager.";
};

FUNC INT Info_Mod_Oschust_Hi_Condition()
{
	if (Banditen_Dabei == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Oschust_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Oschust_Hi_15_00"); //Hallo, ich bin neu im Lager. Was verrichtest du für Aufgaben an Schmiede und Alchemietisch?
	AI_Output(self, hero, "Info_Mod_Oschust_Hi_04_01"); //Ahh, ein neues Gesicht. Komm nur näher und schaue einem meisterhaften Fälscher und Alchemisten bei seinem Handwerk zu.
	AI_Output(self, hero, "Info_Mod_Oschust_Hi_04_02"); //Ich mache rostige Klingen wieder neu, präge Falschgeld und vergolde minderwertige Metalle. An meinen Betrügereien verdient unser Lager nicht gerade schlecht.
	AI_Output(self, hero, "Info_Mod_Oschust_Hi_04_03"); //Wenn du silberne Ringe hast, so werde ich sie dir auch gegen ein geringes Entgelt von 10 Münzen vergolden, sodass du sie jedem Händler für einen viel höheren Preis ihres eigentlichen Wertes veräußern kannst.
	AI_Output(self, hero, "Info_Mod_Oschust_Hi_04_04"); //Auch rostige Schwerter werde ich dir für nur 2 Goldmünzen mit meiner Säurespezialmischung wieder im Nu erneuern.
};

INSTANCE Info_Mod_Oschust_Amulett_A (C_INFO)
{
	npc		= Mod_7022_BDT_Oschust_MT;
	nr		= 1;
	condition	= Info_Mod_Oschust_Amulett_A_Condition;
	information	= Info_Mod_Oschust_Amulett_A_Info;
	permanent	= 0;
	important	= 0;
	description	= "Das Amulett hat sich als Fälschung entpuppt.";
};

FUNC INT Info_Mod_Oschust_Amulett_A_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Oschust_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Dexter_QuentinsBack))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Oschust_Amulett_B))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Oschust_Amulett_A_Info()
{
	AI_Output(hero, self, "Info_Mod_Oschust_Amulett_A_15_00"); //Das Amulett hat sich als Fälschung entpuppt. Kannst du mir etwas dazu sagen?
	AI_Output(self, hero, "Info_Mod_Oschust_Amulett_A_04_01"); //Was? Es eine Fälschung? Dann war der ganze Aufwand also völlig umsonst?
	AI_Output(hero, self, "Info_Mod_Oschust_Amulett_A_15_02"); //Kannst du mir nicht etwas mehr dazu verraten?
	AI_Output(self, hero, "Info_Mod_Oschust_Amulett_A_04_03"); //Wieso, was meinst du damit? Mehr kann ich auch nicht sagen.
	AI_Output(hero, self, "Info_Mod_Oschust_Amulett_A_15_04"); //Der Magier konnte noch deutlich die Aura des echten Amulettes spüren. Es muss also vor kurzem noch ganz in der Nähe gewesen sein.
	AI_Output(self, hero, "Info_Mod_Oschust_Amulett_A_04_05"); //Ähm, ich kann dir da wirklich nicht weiterhelfen. Ich habe es nur etwas poliert, ihm neuen Glanz verliehen. Sonst hatte ich nichts damit zu tun.
	AI_Output(hero, self, "Info_Mod_Oschust_Amulett_A_15_06"); //Du verstehst dich doch aufs Fälscherhandwerk und hattest das Amulett einige Zeit bei dir.
	AI_Output(self, hero, "Info_Mod_Oschust_Amulett_A_04_07"); //Was?! So was muss ich mir nicht anhören. Lass mich in Ruhe.

	AI_StopProcessInfos	(self);

	self.flags = 0;

	B_Attack	(self, hero, AR_None, 0);
};

INSTANCE Info_Mod_Oschust_Amulett_B (C_INFO)
{
	npc		= Mod_7022_BDT_Oschust_MT;
	nr		= 1;
	condition	= Info_Mod_Oschust_Amulett_B_Condition;
	information	= Info_Mod_Oschust_Amulett_B_Info;
	permanent	= 0;
	important	= 0;
	description	= "Sag mir, wo sich das richtige Amulett befindet ...";
};

FUNC INT Info_Mod_Oschust_Amulett_B_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Oschust_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Dexter_QuentinsBack))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Oschust_Amulett_A))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Oschust_Amulett_B_Info()
{
	AI_Output(hero, self, "Info_Mod_Oschust_Amulett_B_15_00"); //Sag mir, wo sich das richtige Amulett befindet, oder ich schlage dir die Zähne ein.
	AI_Output(self, hero, "Info_Mod_Oschust_Amulett_B_04_01"); //Was?! Lass mich in Ruhe. Ich weiß nicht, was du willst.

	AI_StopProcessInfos	(self);

	self.flags = 0;

	B_Attack	(self, hero, AR_None, 0);
};

INSTANCE Info_Mod_Oschust_Umgehauen (C_INFO)
{
	npc		= Mod_7022_BDT_Oschust_MT;
	nr		= 1;
	condition	= Info_Mod_Oschust_Umgehauen_Condition;
	information	= Info_Mod_Oschust_Umgehauen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Sagst du mir jetzt, wo das Amulett ist, oder muss ich ...";
};

FUNC INT Info_Mod_Oschust_Umgehauen_Condition()
{
	if ((Npc_KnowsInfo(hero, Info_Mod_Oschust_Amulett_A))
	|| (Npc_KnowsInfo(hero, Info_Mod_Oschust_Amulett_B)))
	&& (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Oschust_Umgehauen_Info()
{
	AI_Output(hero, self, "Info_Mod_Oschust_Umgehauen_15_00"); //Sagst du mir jetzt, wo das Amulett ist, oder muss ich ...

	AI_ReadyMeleeWeapon	(hero);

	AI_Output(self, hero, "Info_Mod_Oschust_Umgehauen_04_01"); //Warte, ich will ja schon alles sagen.
	AI_Output(hero, self, "Info_Mod_Oschust_Umgehauen_15_02"); //Ich höre ...

	AI_RemoveWeapon	(hero);

	AI_Output(self, hero, "Info_Mod_Oschust_Umgehauen_04_03"); //Ja, es tut mir Leid, ich habe das echte Amulett bekommen und die Kopie davon erstellt.
	AI_Output(hero, self, "Info_Mod_Oschust_Umgehauen_15_04"); //Na also, geht doch. Und für Reue ist es etwas spät. Wo ist das Amulett jetzt?
	AI_Output(self, hero, "Info_Mod_Oschust_Umgehauen_04_05"); //Ich habe es in einer Höhle versteckt, nicht weit von hier. Unterhalb des Lagers einige Meter Richtung Mine und du wirst sie nicht verfehlen.
	AI_Output(self, hero, "Info_Mod_Oschust_Umgehauen_04_06"); //Das Problem ist nur, dass sich dort eine Gruppe Orks mit ihren Kötern eingenistet hat.
	AI_Output(self, hero, "Info_Mod_Oschust_Umgehauen_04_07"); //Ich ... ich hätte das Amulett sonst schon längst zurückgeholt und meinen Fehler wieder gut gemacht.
	AI_Output(hero, self, "Info_Mod_Oschust_Umgehauen_15_08"); //Ja, sicher. Hmm, mit den Orks muss ich wohl irgendwie fertig werden ...
	AI_Output(self, hero, "Info_Mod_Oschust_Umgehauen_04_09"); //Wenn du wirklich den Versuch unternehmen willst an das Amulett zu kommen, so musst du ganz hinten in der Höhle den Boden mit einer Spitzhacke beackern, um es zu finden.
	AI_Output(hero, self, "Info_Mod_Oschust_Umgehauen_15_10"); //Nun gut, ich schaue dann mal.

	B_LogEntry	(TOPIC_MOD_BDT_ORKS, "Ich habe von Oschust erfahren, dass er das Amulett in einer Höhle ganz hinten vergraben hat, welche unterhalb des Lagers Richtung Mine gelegen ist. Jedoch sollen sich dort auch einige Orks eingenistet haben. Ich sollte nun Dexter darüber informieren.");
		
	self.aivar[AIV_ArenaFight] = AF_NONE;
		
	// ------ AIVAR resetten! ------	
	self.aivar[AIV_LastFightComment] = TRUE;
};

INSTANCE Info_Mod_Oschust_WegenRingen (C_INFO)
{
	npc		= Mod_7022_BDT_Oschust_MT;
	nr		= 1;
	condition	= Info_Mod_Oschust_WegenRingen_Condition;
	information	= Info_Mod_Oschust_WegenRingen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Wegen den Ringen ...";
};

FUNC INT Info_Mod_Oschust_WegenRingen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Oschust_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Oschust_WegenRingen_Info()
{
	AI_Output(hero, self, "Info_Mod_Oschust_WegenRingen_15_00"); //Wegen den Ringen ...

	Info_ClearChoices	(Info_Mod_Oschust_WegenRingen);

	Info_AddChoice	(Info_Mod_Oschust_WegenRingen, DIALOG_BACK, Info_Mod_Oschust_WegenRingen_BACK);

	if (Npc_HasItems(hero, ItRi_SkinnersRing) > 0)
	&& (Npc_HasItems(hero, ItMi_Gold) > 49)
	{
		Info_AddChoice	(Info_Mod_Oschust_WegenRingen, "Was ist mit diesem verwitterten Orkring?", Info_Mod_Oschust_WegenRingen_Skinner_C);
	};

	if (Npc_HasItems(hero, ItMi_SilverRing) > 0)
	&& (Npc_HasItems(hero, ItMi_Gold) > 9)
	{
		Info_AddChoice	(Info_Mod_Oschust_WegenRingen, "Alle Silberringe vergolden", Info_Mod_Oschust_WegenRingen_Silber_B);
		Info_AddChoice	(Info_Mod_Oschust_WegenRingen, "Einen Silberring vergolden", Info_Mod_Oschust_WegenRingen_Silber_A);
	};
};

FUNC VOID Info_Mod_Oschust_WegenRingen_BACK()
{
	Info_ClearChoices	(Info_Mod_Oschust_WegenRingen);
};

FUNC VOID Info_Mod_Oschust_WegenRingen_Skinner_C()
{
	AI_Output(hero, self, "Info_Mod_Oschust_WegenRingen_Skinner_C_15_00"); //Was ist mit diesem verwitterten Orkring?

	B_GiveInvItems	(hero, self, ItRi_SkinnersRing, 1);

	Npc_RemoveInvItems	(self, ItRi_SkinnersRing, 1);

	AI_Output(self, hero, "Info_Mod_Oschust_WegenRingen_Skinner_C_04_01"); //Hmm, in sehr schlechtem Zustand. Das wird etwas länger dauern und ein wenig mehr kosten.
	AI_Output(self, hero, "Info_Mod_Oschust_WegenRingen_Skinner_C_04_02"); //Für 50 Goldmünzen ist er morgen aber wieder wie neu.

	B_GiveInvItems	(hero, self, ItMi_Gold, 50);

	Mod_OschustMachtOrkring = 1;
	Mod_OschustRingDay = Wld_GetDay();

	Info_ClearChoices	(Info_Mod_Oschust_WegenRingen);
};

FUNC VOID Info_Mod_Oschust_WegenRingen_Silber_B()
{
	if (Npc_HasItems(hero, ItMi_Gold) >= Npc_HasItems(hero, ItMi_Silverring)*10)
	{
		Npc_RemoveInvItems	(hero, ItMi_Gold, 10*Npc_HasItems(hero, ItMi_SilverRing));
		CreateInvItems	(hero, ItMi_GoldRing, Npc_HasItems(hero, ItMi_SilverRing));

		Print	(ConcatStrings(IntToString(Npc_HasItems(hero, ItMi_SilverRing)), " Silberringe vergoldet"));

		Npc_RemoveInvItems	(hero, ItMi_SilverRing, Npc_HasItems(hero, ItMi_SilverRing));
	}
	else
	{
		var int GoldForRinge;

		GoldForRinge = Npc_HasItems(hero, ItMi_Gold) / 10;

		Npc_RemoveInvItems	(hero, ItMi_Gold, 10*GoldForRinge);
		CreateInvItems	(hero, ItMi_GoldRing, GoldForRinge);
		Npc_RemoveInvItems	(hero, ItMi_SilverRing, GoldForRinge);

		Print	(ConcatStrings(IntToString(GoldForRinge), " Silberringe vergoldet"));
	};

	Info_ClearChoices	(Info_Mod_Oschust_WegenRingen);
};

FUNC VOID Info_Mod_Oschust_WegenRingen_Silber_A()
{
	Npc_RemoveInvItems	(hero, ItMi_Gold, 10);
	CreateInvItems	(hero, ItMi_GoldRing, 1);
	Npc_RemoveInvItems	(hero, ItMi_SilverRing, 1);

	Print	("Einen Silberring vergoldet");

	Info_ClearChoices	(Info_Mod_Oschust_WegenRingen);
};

INSTANCE Info_Mod_Oschust_WegenSchwertern (C_INFO)
{
	npc		= Mod_7022_BDT_Oschust_MT;
	nr		= 1;
	condition	= Info_Mod_Oschust_WegenSchwertern_Condition;
	information	= Info_Mod_Oschust_WegenSchwertern_Info;
	permanent	= 1;
	important	= 0;
	description	= "Wegen den Schwertern ...";
};

FUNC INT Info_Mod_Oschust_WegenSchwertern_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Oschust_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Oschust_WegenSchwertern_Info()
{
	AI_Output(hero, self, "Info_Mod_Oschust_WegenSchwertern_15_00"); //Wegen den Schwertern ...

	Info_ClearChoices	(Info_Mod_Oschust_WegenSchwertern);

	Info_AddChoice	(Info_Mod_Oschust_WegenSchwertern, DIALOG_BACK, Info_Mod_Oschust_WegenSchwertern_BACK);

	if (Npc_HasItems(hero, ItMw_2H_Sword_M_01_Geschaerft) >= 1)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 2)
	{
		Info_AddChoice	(Info_Mod_Oschust_WegenSchwertern, "Alle geschärften rostigem Zweihänder entrosten", Info_Mod_Oschust_WegenSchwertern_H);
		Info_AddChoice	(Info_Mod_Oschust_WegenSchwertern, "Einen geschärften rostigen Zweihänder entrosten", Info_Mod_Oschust_WegenSchwertern_G);
	};
	if (Npc_HasItems(hero, ItMw_2H_Sword_M_01) >= 1)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 2)
	{
		Info_AddChoice	(Info_Mod_Oschust_WegenSchwertern, "Alle rostigen Zweihänder entrosten", Info_Mod_Oschust_WegenSchwertern_F);
		Info_AddChoice	(Info_Mod_Oschust_WegenSchwertern, "Einen rostigen Zweihänder entrosten", Info_Mod_Oschust_WegenSchwertern_E);
	};
	if (Npc_HasItems(hero, ItMw_1h_MISC_Sword_Geschaerft) >= 1)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 2)
	{
		Info_AddChoice	(Info_Mod_Oschust_WegenSchwertern, "Alle geschärften rostigen Schwerter entrosten", Info_Mod_Oschust_WegenSchwertern_D);
		Info_AddChoice	(Info_Mod_Oschust_WegenSchwertern, "Ein geschärftes rostiges Schwert entrosten", Info_Mod_Oschust_WegenSchwertern_C);
	};
	if (Npc_HasItems(hero, ItMw_1h_MISC_Sword) >= 1)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 2)
	{
		Info_AddChoice	(Info_Mod_Oschust_WegenSchwertern, "Alle rostigen Schwerter entrosten", Info_Mod_Oschust_WegenSchwertern_B);
		Info_AddChoice	(Info_Mod_Oschust_WegenSchwertern, "Ein rostiges Schwert entrosten", Info_Mod_Oschust_WegenSchwertern_A);
	};
};

FUNC VOID Info_Mod_Oschust_WegenSchwertern_BACK()
{
	Info_ClearChoices	(Info_Mod_Oschust_WegenSchwertern);
};

FUNC VOID Info_Mod_Oschust_WegenSchwertern_H()
{
	if (Npc_HasItems(hero, ItMi_Gold) >= Npc_HasItems(hero, ItMw_2H_Sword_M_01_Geschaerft)*2)
	{
		Npc_RemoveInvItems	(hero, ItMi_Gold, 2*Npc_HasItems(hero, ItMw_2H_Sword_M_01_Geschaerft));
		CreateInvItems	(hero, ItMw_Zweihaender_Geschaerft, Npc_HasItems(hero, ItMw_2H_Sword_M_01_Geschaerft));

		Print	(ConcatStrings(IntToString(Npc_HasItems(hero, ItMw_2H_Sword_M_01_Geschaerft)), " Zweihänder entrostet"));

		Npc_RemoveInvItems	(hero, ItMw_2H_Sword_M_01_Geschaerft, Npc_HasItems(hero, ItMw_2H_Sword_M_01_Geschaerft));
	}
	else
	{
		var int GoldForSchwerter;

		GoldForSchwerter = Npc_HasItems(hero, ItMi_Gold) / 2;

		Npc_RemoveInvItems	(hero, ItMi_Gold, 2*GoldForSchwerter);
		CreateInvItems	(hero, ItMw_Zweihaender_Geschaerft, GoldForSchwerter);
		Npc_RemoveInvItems	(hero, ItMw_2H_Sword_M_01_Geschaerft, GoldForSchwerter);

		Print	(ConcatStrings(IntToString(GoldForSchwerter), " Zweihänder entrostet"));
	};

	Info_ClearChoices	(Info_Mod_Oschust_WegenSchwertern);
};

FUNC VOID Info_Mod_Oschust_WegenSchwertern_G()
{
	Npc_RemoveInvItems	(hero, ItMi_Gold, 2);
	CreateInvItems	(hero, ItMw_Zweihaender, 1);
	Npc_RemoveInvItems	(hero, ItMw_2H_Sword_M_01, 1);

	Print	("Einen Zweihänder entrostet");

	Info_ClearChoices	(Info_Mod_Oschust_WegenSchwertern);
};

FUNC VOID Info_Mod_Oschust_WegenSchwertern_F()
{
	if (Npc_HasItems(hero, ItMi_Gold) >= Npc_HasItems(hero, ItMw_2H_Sword_M_01)*2)
	{
		Npc_RemoveInvItems	(hero, ItMi_Gold, 2*Npc_HasItems(hero, ItMw_2H_Sword_M_01));
		CreateInvItems	(hero, ItMw_Zweihaender, Npc_HasItems(hero, ItMw_2H_Sword_M_01));

		Print	(ConcatStrings(IntToString(Npc_HasItems(hero, ItMw_2H_Sword_M_01)), " Zweihänder entrostet"));

		Npc_RemoveInvItems	(hero, ItMw_2H_Sword_M_01, Npc_HasItems(hero, ItMw_2H_Sword_M_01));
	}
	else
	{
		var int GoldForSchwerter;

		GoldForSchwerter = Npc_HasItems(hero, ItMi_Gold) / 2;

		Npc_RemoveInvItems	(hero, ItMi_Gold, 2*GoldForSchwerter);
		CreateInvItems	(hero, ItMw_Zweihaender, GoldForSchwerter);
		Npc_RemoveInvItems	(hero, ItMw_2H_Sword_M_01, GoldForSchwerter);

		Print	(ConcatStrings(IntToString(GoldForSchwerter), " Zweihänder entrostet"));
	};

	Info_ClearChoices	(Info_Mod_Oschust_WegenSchwertern);
};

FUNC VOID Info_Mod_Oschust_WegenSchwertern_E()
{
	Npc_RemoveInvItems	(hero, ItMi_Gold, 2);
	CreateInvItems	(hero, ItMw_Zweihaender, 1);
	Npc_RemoveInvItems	(hero, ItMw_2H_Sword_M_01, 1);

	Print	("Einen Zweihänder entrostet");

	Info_ClearChoices	(Info_Mod_Oschust_WegenSchwertern);
};

FUNC VOID Info_Mod_Oschust_WegenSchwertern_D()
{
	if (Npc_HasItems(hero, ItMi_Gold) >= Npc_HasItems(hero, ItMw_1h_MISC_Sword_Geschaerft)*2)
	{
		Npc_RemoveInvItems	(hero, ItMi_Gold, 2*Npc_HasItems(hero, ItMw_1h_MISC_Sword_Geschaerft));
		CreateInvItems	(hero, ItMw_1H_quantarie_Schwert_01_Geschaerft, Npc_HasItems(hero, ItMw_1h_MISC_Sword_Geschaerft));

		Print	(ConcatStrings(IntToString(Npc_HasItems(hero, ItMw_1h_MISC_Sword_Geschaerft)), " Schwerter entrostet"));

		Npc_RemoveInvItems	(hero, ItMw_1h_MISC_Sword_Geschaerft, Npc_HasItems(hero, ItMw_1h_MISC_Sword_Geschaerft));
	}
	else
	{
		var int GoldForSchwerter;

		GoldForSchwerter = Npc_HasItems(hero, ItMi_Gold) / 2;

		Npc_RemoveInvItems	(hero, ItMi_Gold, 2*GoldForSchwerter);
		CreateInvItems	(hero, ItMw_1H_quantarie_Schwert_01_Geschaerft, GoldForSchwerter);
		Npc_RemoveInvItems	(hero, ItMw_1h_MISC_Sword_Geschaerft, GoldForSchwerter);

		Print	(ConcatStrings(IntToString(GoldForSchwerter), " Schwerter entrostet"));
	};

	Info_ClearChoices	(Info_Mod_Oschust_WegenSchwertern);
};

FUNC VOID Info_Mod_Oschust_WegenSchwertern_C()
{
	Npc_RemoveInvItems	(hero, ItMi_Gold, 2);
	CreateInvItems	(hero, ItMw_1H_quantarie_Schwert_01_Geschaerft, 1);
	Npc_RemoveInvItems	(hero, ItMw_1h_MISC_Sword_Geschaerft, 1);

	Print	("Ein Schwert entrostet");

	Info_ClearChoices	(Info_Mod_Oschust_WegenSchwertern);
};

FUNC VOID Info_Mod_Oschust_WegenSchwertern_B()
{
	if (Npc_HasItems(hero, ItMi_Gold) >= Npc_HasItems(hero, ItMw_1h_MISC_Sword)*2)
	{
		Npc_RemoveInvItems	(hero, ItMi_Gold, 2*Npc_HasItems(hero, ItMw_1h_MISC_Sword));
		CreateInvItems	(hero, ItMw_1H_quantarie_Schwert_01, Npc_HasItems(hero, ItMw_1h_MISC_Sword));

		Print	(ConcatStrings(IntToString(Npc_HasItems(hero, ItMw_1h_MISC_Sword)), " Schwerter entrostet"));

		Npc_RemoveInvItems	(hero, ItMw_1h_MISC_Sword, Npc_HasItems(hero, ItMw_1h_MISC_Sword));
	}
	else
	{
		var int GoldForSchwerter;

		GoldForSchwerter = Npc_HasItems(hero, ItMi_Gold) / 2;

		Npc_RemoveInvItems	(hero, ItMi_Gold, 2*GoldForSchwerter);
		CreateInvItems	(hero, ItMw_1H_quantarie_Schwert_01, GoldForSchwerter);
		Npc_RemoveInvItems	(hero, ItMw_1h_MISC_Sword, GoldForSchwerter);

		Print	(ConcatStrings(IntToString(GoldForSchwerter), " Schwerter entrostet"));
	};

	Info_ClearChoices	(Info_Mod_Oschust_WegenSchwertern);
};

FUNC VOID Info_Mod_Oschust_WegenSchwertern_A()
{
	Npc_RemoveInvItems	(hero, ItMi_Gold, 2);
	CreateInvItems	(hero, ItMw_1H_quantarie_Schwert_01, 1);
	Npc_RemoveInvItems	(hero, ItMw_1h_MISC_Sword, 1);

	Print	("Ein Schwert entrostet");

	Info_ClearChoices	(Info_Mod_Oschust_WegenSchwertern);
};

INSTANCE Info_Mod_Oschust_OrkringFertig (C_INFO)
{
	npc		= Mod_7022_BDT_Oschust_MT;
	nr		= 1;
	condition	= Info_Mod_Oschust_OrkringFertig_Condition;
	information	= Info_Mod_Oschust_OrkringFertig_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Oschust_OrkringFertig_Condition()
{
	if (Mod_OschustMachtOrkring == 1)
	&& (Mod_OschustRingDay < Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Oschust_OrkringFertig_Info()
{
	AI_Output(self, hero, "Info_Mod_Oschust_OrkringFertig_04_00"); //Der Ring ist fertig und ein wahres Prachtstück geworden.
	AI_Output(self, hero, "Info_Mod_Oschust_OrkringFertig_04_01"); //Ich habe stundenlang daran gearbeitet und konnte dabei sogar seltsame Runenzeichen wieder sichtbar herausarbeiten, die in den Ring graviert waren.
	AI_Output(self, hero, "Info_Mod_Oschust_OrkringFertig_04_02"); //Hier, sein Wert dürfte jetzt um einiges gestiegen sein.

	B_GiveInvItems	(self, hero, ItRi_SkinnersRing_Gold, 1);
};

INSTANCE Info_Mod_Oschust_Piraten (C_INFO)
{
	npc		= Mod_7022_BDT_Oschust_MT;
	nr		= 1;
	condition	= Info_Mod_Oschust_Piraten_Condition;
	information	= Info_Mod_Oschust_Piraten_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du diesen Säbel reparieren?";
};

FUNC INT Info_Mod_Oschust_Piraten_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Oschust_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Greg_Aufgabe))
	&& (Npc_HasItems(hero, ItMw_Piratensaebel_Greg) == 1)
	&& (Banditen_Dabei == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Oschust_Piraten_Info()
{
	AI_Output(hero, self, "Info_Mod_Oschust_Piraten_15_00"); //Kannst du diesen Säbel reparieren?
	AI_Output(self, hero, "Info_Mod_Oschust_Piraten_04_01"); //Zeig mal her ...

	B_GiveInvItems	(hero, self, ItMw_Piratensaebel_Greg, 1);

	AI_UnequipWeapons	(self);
	EquipItem	(self, ItMw_Piratensaebel_Greg);
	AI_ReadyMeleeWeapon	(self);
	AI_PlayAni	(self, "T_1HSINSPECT");
	AI_RemoveWeapon	(self);
	AI_UnequipWeapons	(self);

	AI_Output(self, hero, "Info_Mod_Oschust_Piraten_04_02"); //Das sieht nach einem guten Säbel aus.
	AI_Output(self, hero, "Info_Mod_Oschust_Piraten_04_03"); //Morgen ist wieder wie neu.

	AI_Output(self, hero, "Info_Mod_Oschust_Piraten_04_05"); //Da du zu uns gehört kostet es dich nichts.

	Mod_MachtSäbel = 1;
	
	Mod_SäbelReparieren = Wld_GetDay();
};

INSTANCE Info_Mod_Oschust_Saebel (C_INFO)
{
	npc		= Mod_7022_BDT_Oschust_MT;
	nr		= 1;
	condition	= Info_Mod_Oschust_Saebel_Condition;
	information	= Info_Mod_Oschust_Saebel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ist der Säbel fertig?";
};

FUNC INT Info_Mod_Oschust_Saebel_Condition()
{
	if (Mod_MachtSäbel == 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Oschust_Piraten))
	&& (Wld_GetDay() > Mod_SäbelReparieren)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Oschust_Saebel_Info()
{
	AI_Output(hero, self, "Info_Mod_Oschust_Saebel_15_00"); //Ist der Säbel fertig?
	AI_Output(self, hero, "Info_Mod_Oschust_Saebel_04_01"); //Ja, er ist wieder wie neu. Hier ist er.

	B_GiveInvItems	(self, hero, ItMw_Piratensaebel_Greg_Gut, 1);
};

INSTANCE Info_Mod_Oschust_Pickpocket (C_INFO)
{
	npc		= Mod_7022_BDT_Oschust_MT;
	nr		= 1;
	condition	= Info_Mod_Oschust_Pickpocket_Condition;
	information	= Info_Mod_Oschust_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Oschust_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1800);
};

FUNC VOID Info_Mod_Oschust_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Oschust_Pickpocket);

	Info_AddChoice	(Info_Mod_Oschust_Pickpocket, DIALOG_BACK, Info_Mod_Oschust_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Oschust_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Oschust_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Oschust_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Oschust_Pickpocket);
};

FUNC VOID Info_Mod_Oschust_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Oschust_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Oschust_Pickpocket);

		Info_AddChoice	(Info_Mod_Oschust_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Oschust_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Oschust_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Oschust_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Oschust_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Oschust_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Oschust_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Oschust_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Oschust_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Oschust_Pickpocket);

		AI_StopProcessInfos	(self);

		B_Attack (self, hero, AR_Theft, 1);
	}
	else
	{
		if (rnd >= 75)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 200);
		}
		else if (rnd >= 50)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 100);
		}
		else if (rnd >= 25)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 50);
		};

		B_Say	(self, hero, "$PICKPOCKET_BESTECHUNG_01");

		Info_ClearChoices	(Info_Mod_Oschust_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Oschust_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Oschust_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Oschust_EXIT (C_INFO)
{
	npc		= Mod_7022_BDT_Oschust_MT;
	nr		= 1;
	condition	= Info_Mod_Oschust_EXIT_Condition;
	information	= Info_Mod_Oschust_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Oschust_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Oschust_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};