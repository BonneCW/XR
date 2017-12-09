INSTANCE Info_Mod_Joseppe_Hi (C_INFO)
{
	npc		= Mod_7267_VLK_Joseppe_NW;
	nr		= 1;
	condition	= Info_Mod_Joseppe_Hi_Condition;
	information	= Info_Mod_Joseppe_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Joseppe_Hi_Condition()
{
	if (Mod_Sekte_Karras >= 1)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Katar_Daron))
	&& (Npc_HasItems(hero, ItWr_BeliarBook) == 0)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Karras_NamibHabBuch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Joseppe_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Joseppe_Hi_08_00"); //Hilfe!!! Ich benötige dringend exekutive Hilfe! Seid ihr bei der Miliz, guter Mann?

	Info_ClearChoices	(Info_Mod_Joseppe_Hi);

	Info_AddChoice	(Info_Mod_Joseppe_Hi, "Nein.", Info_Mod_Joseppe_Hi_B);
	Info_AddChoice	(Info_Mod_Joseppe_Hi, "Ja.", Info_Mod_Joseppe_Hi_A);
};

FUNC VOID Info_Mod_Joseppe_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Joseppe_Hi_B_15_00"); //Nein.
	AI_Output(self, hero, "Info_Mod_Joseppe_Hi_B_08_01"); //Wunderbar. Gestatten, mein Name ist Joseppe. Ich bin der Mann, für spezielle Aufgaben.
	AI_Output(self, hero, "Info_Mod_Joseppe_Hi_B_08_02"); //Falls du meine Dienste in Anspruch nehmen willst, ich stehe jeden Abend vor dem Adanosschrein. Gehabt euch wohl.

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Ein Mann namens Joseppe hat mir irgendwelche Dienste angeboten. Abends steht er beim Adanosschrein. Ich sollte ihn dort mal besuchen.");

	Mod_Sekte_Joseppe = 1;

	Info_ClearChoices	(Info_Mod_Joseppe_Hi);
};

FUNC VOID Info_Mod_Joseppe_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Joseppe_Hi_A_15_00"); //Ja.
	AI_Output(self, hero, "Info_Mod_Joseppe_Hi_A_08_01"); //Verzeih, ich hab mich wohl geirrt, ich dachte jemand hätte mein Portmonee gestohlen. Ich wünsche dir noch einen schönen Tag.

	Info_ClearChoices	(Info_Mod_Joseppe_Hi);
};

INSTANCE Info_Mod_Joseppe_Auftrag (C_INFO)
{
	npc		= Mod_7267_VLK_Joseppe_NW;
	nr		= 1;
	condition	= Info_Mod_Joseppe_Auftrag_Condition;
	information	= Info_Mod_Joseppe_Auftrag_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Joseppe_Auftrag_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Joseppe_Hi))
	&& (Mod_Sekte_Joseppe == 1)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Katar_Daron))
	&& (Wld_IsTime(20,30,05,00))
	&& (Npc_HasItems(hero, ItWr_BeliarBook) == 0)
	&& (!Npc_KnowsInfo(hero, ItWr_BeliarBook))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Joseppe_Auftrag_Info()
{
	AI_Output(self, hero, "Info_Mod_Joseppe_Auftrag_08_00"); //Du bist gekommen, wie überaus erfreulich. Was hast du für mich zu tun? Massenmord, Meuchelmord, Rufmord, ich bin Spezialist für alles.
	AI_Output(hero, self, "Info_Mod_Joseppe_Auftrag_15_01"); //Kannst du mir ein Buch beschaffen?
	AI_Output(self, hero, "Info_Mod_Joseppe_Auftrag_08_02"); //Du scheinst mein Potential nicht zu erkennen ... aber in der Not frisst der Teufel fliegen.
	AI_Output(self, hero, "Info_Mod_Joseppe_Auftrag_08_03"); //Welches Buch wollt ihr und wo ist es?
	AI_Output(hero, self, "Info_Mod_Joseppe_Auftrag_15_04"); //Das Necronomicum. Die Feuermagier verbergen es im Kloster.
	AI_Output(self, hero, "Info_Mod_Joseppe_Auftrag_08_05"); //Ein Buch der schwarzen Magie? Euer Auftrag scheint doch recht interessant zu sein.
	AI_Output(self, hero, "Info_Mod_Joseppe_Auftrag_08_06"); //Kommen wir zur Bezahlung. Das Basispaket kostet 10.000 Goldmünzen.
	AI_Output(self, hero, "Info_Mod_Joseppe_Auftrag_08_07"); //Ihr würdet einen Rabatt bekommen, wenn ihr mir Ausrüstung besorgt.
	AI_Output(self, hero, "Info_Mod_Joseppe_Auftrag_08_08"); //Je nachdem wie nützlich sie ist, werde ich mit dem Preis runter gehen.

	Mod_Sekte_JoseppePreis = 10000;

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Joseppe ist ein Spezialist für alle Arten von Verbrechen. Für den Diebstahl des Buches verlangt er allerdings 10.000 Goldmünzen. Er hat mir jedoch einen Rabatt angeboten, wenn ich ihm nützliche Ausrüstung bringe.");
};

INSTANCE Info_Mod_Joseppe_Equipment_Keule (C_INFO)
{
	npc		= Mod_7267_VLK_Joseppe_NW;
	nr		= 1;
	condition	= Info_Mod_Joseppe_Equipment_Keule_Condition;
	information	= Info_Mod_Joseppe_Equipment_Keule_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe hier einen magischen Knüppel.";
};

FUNC INT Info_Mod_Joseppe_Equipment_Keule_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Joseppe_Auftrag))
	&& (Mod_Sekte_Joseppe == 1)
	&& (Npc_HasItems(hero, ItMw_UnconsciousKnueppel) == 1)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Katar_Daron))
	&& (Npc_HasItems(hero, ItWr_BeliarBook) == 0)
	&& (!Npc_KnowsInfo(hero, ItWr_BeliarBook))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Joseppe_Equipment_Keule_Info()
{
	AI_Output(hero, self, "Info_Mod_Joseppe_Equipment_Keule_15_00"); //Ich habe hier einen magischen Knüppel. Wer damit geschlagen wird, wird sofort bewusstlos.

	B_GiveInvItems	(hero, self, ItMw_UnconsciousKnueppel, 1);

	AI_Output(hero, self, "Info_Mod_Joseppe_Equipment_Keule_15_01"); //Leider klappt das nur einmal, danach ist er wertlos.
	AI_Output(self, hero, "Info_Mod_Joseppe_Equipment_Keule_08_02"); //Interessant, das dürfte ziemlich hilfreich sein. Dafür gewähre ich dir einen Rabatt von 2.500 Goldmünzen.

	Mod_Sekte_JoseppePreis -= 2500;
};

INSTANCE Info_Mod_Joseppe_Equipment_FakeNove (C_INFO)
{
	npc		= Mod_7267_VLK_Joseppe_NW;
	nr		= 1;
	condition	= Info_Mod_Joseppe_Equipment_FakeNove_Condition;
	information	= Info_Mod_Joseppe_Equipment_FakeNove_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe noch eine gefälschte Feuer Novizenrobe.";
};

FUNC INT Info_Mod_Joseppe_Equipment_FakeNove_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Joseppe_Auftrag))
	&& (Mod_Sekte_Joseppe == 1)
	&& (Npc_HasItems(hero, ITAR_FAKE_NOV_L) == 1)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Katar_Daron))
	&& (Npc_HasItems(hero, ItWr_BeliarBook) == 0)
	&& (!Npc_KnowsInfo(hero, ItWr_BeliarBook))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Joseppe_Equipment_FakeNove_Info()
{
	AI_Output(hero, self, "Info_Mod_Joseppe_Equipment_FakeNove_15_00"); //Ich habe noch eine gefälschte Feuer Novizenrobe.

	B_GiveInvItems	(hero, self, ITAR_FAKE_NOV_L, 1);

	AI_Output(self, hero, "Info_Mod_Joseppe_Equipment_FakeNove_08_01"); //Damit sollte ich leicht unbeschadet ins Kloster kommen. Das ist mir glatt 2.500 Goldmünzen wert.

	Mod_Sekte_JoseppePreis -= 2500;
};

INSTANCE Info_Mod_Joseppe_Equipment_Sumpfkraut (C_INFO)
{
	npc		= Mod_7267_VLK_Joseppe_NW;
	nr		= 1;
	condition	= Info_Mod_Joseppe_Equipment_Sumpfkraut_Condition;
	information	= Info_Mod_Joseppe_Equipment_Sumpfkraut_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was hälst du von diesem Sumpfkrautpaket?";
};

FUNC INT Info_Mod_Joseppe_Equipment_Sumpfkraut_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Joseppe_Auftrag))
	&& (Mod_Sekte_Joseppe == 1)
	&& (Npc_HasItems(hero, ItMi_HerbPaket) >= 1)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Katar_Daron))
	&& (Npc_HasItems(hero, ItWr_BeliarBook) == 0)
	&& (!Npc_KnowsInfo(hero, ItWr_BeliarBook))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Joseppe_Equipment_Sumpfkraut_Info()
{
	AI_Output(hero, self, "Info_Mod_Joseppe_Equipment_Sumpfkraut_15_00"); //Was hälst du von diesem Sumpfkrautpaket?

	B_GiveInvItems	(hero, self, ItMi_HerbPaket, 1);

	AI_Output(self, hero, "Info_Mod_Joseppe_Equipment_Sumpfkraut_08_01"); //Sumpfkraut ist immer gut, her damit. Dafür erlasse ich dir 2.500 Goldmünzen.

	Mod_Sekte_JoseppePreis -= 2500;
};

INSTANCE Info_Mod_Joseppe_StartAuftrag (C_INFO)
{
	npc		= Mod_7267_VLK_Joseppe_NW;
	nr		= 1;
	condition	= Info_Mod_Joseppe_StartAuftrag_Condition;
	information	= Info_Mod_Joseppe_StartAuftrag_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ok, du hast den Auftrag.";
};

FUNC INT Info_Mod_Joseppe_StartAuftrag_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Joseppe_Auftrag))
	&& (Mod_Sekte_Joseppe == 1)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Katar_Daron))
	&& (Npc_HasItems(hero, ItWr_BeliarBook) == 0)
	&& (!Npc_KnowsInfo(hero, ItWr_BeliarBook))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Joseppe_StartAuftrag_Info()
{
	AI_Output(hero, self, "Info_Mod_Joseppe_StartAuftrag_15_00"); //Ok, du hast den Auftrag.

	if (Mod_Sekte_JoseppePreis == 10000)
	{
		AI_Output(self, hero, "Info_Mod_Joseppe_StartAuftrag_08_01"); //Das macht dann 10.000 Goldmünzen.
	}
	else if (Mod_Sekte_JoseppePreis == 7500)
	{
		AI_Output(self, hero, "Info_Mod_Joseppe_StartAuftrag_08_02"); //Das macht dann 7.500 Goldmünzen.
	}
	else if (Mod_Sekte_JoseppePreis == 5000)
	{
		AI_Output(self, hero, "Info_Mod_Joseppe_StartAuftrag_08_03"); //Das macht dann 5.000 Goldmünzen.
	}
	else if (Mod_Sekte_JoseppePreis == 2500)
	{
		AI_Output(self, hero, "Info_Mod_Joseppe_StartAuftrag_08_04"); //Das macht dann 2.500 Goldmünzen.
	};

	Info_ClearChoices	(Info_Mod_Joseppe_StartAuftrag);

	Info_AddChoice	(Info_Mod_Joseppe_StartAuftrag, "So viel Gold habe ich nicht.", Info_Mod_Joseppe_StartAuftrag_B);

	if (Npc_HasItems(hero, ItMi_Gold) >= Mod_Sekte_JoseppePreis)
	{
		Info_AddChoice	(Info_Mod_Joseppe_StartAuftrag, "Hier hast du das Gold.", Info_Mod_Joseppe_StartAuftrag_A);
	};
};

FUNC VOID Info_Mod_Joseppe_StartAuftrag_B()
{
	AI_Output(hero, self, "Info_Mod_Joseppe_StartAuftrag_B_15_00"); //So viel Gold habe ich nicht.
	AI_Output(self, hero, "Info_Mod_Joseppe_StartAuftrag_B_08_01"); //Dann komm wieder, wenn du es hast.
	
	Info_ClearChoices	(Info_Mod_Joseppe_StartAuftrag);
};

FUNC VOID Info_Mod_Joseppe_StartAuftrag_A()
{
	AI_Output(hero, self, "Info_Mod_Joseppe_StartAuftrag_A_15_00"); //Hier hast du das Gold.

	B_GiveInvItems	(hero, self, ItMi_Gold, Mod_Sekte_JoseppePreis);

	AI_Output(self, hero, "Info_Mod_Joseppe_StartAuftrag_A_08_01"); //Gut, komm morgen wieder, dann sollte ich dein Buch haben.

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Joseppe hat den Auftrag übernommen. Morgen wird er mir das Buch geben.");

	Mod_Sekte_Joseppe = 2;

	Mod_Sekte_JoseppeBuch = Wld_GetDay();
	
	Info_ClearChoices	(Info_Mod_Joseppe_StartAuftrag);
};

INSTANCE Info_Mod_Joseppe_Necronomicum (C_INFO)
{
	npc		= Mod_7267_VLK_Joseppe_NW;
	nr		= 1;
	condition	= Info_Mod_Joseppe_Necronomicum_Condition;
	information	= Info_Mod_Joseppe_Necronomicum_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Joseppe_Necronomicum_Condition()
{
	if (Mod_Sekte_Joseppe == 2)
	&& (Wld_GetDay() > Mod_Sekte_JoseppeBuch)
	&& (Npc_HasItems(hero, ItWr_BeliarBook) == 0)
	&& (!Npc_KnowsInfo(hero, ItWr_BeliarBook))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Joseppe_Necronomicum_Info()
{
	AI_Output(self, hero, "Info_Mod_Joseppe_Necronomicum_08_00"); //Da bist du ja wieder. Ich habe dein Buch bekommen. Hier hast du es.

	B_GiveInvItems	(self, hero, ItWr_BeliarBook, 1);

	AI_Output(hero, self, "Info_Mod_Joseppe_Necronomicum_15_01"); //Danke.

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Ich habe das Neconomicum von Joseppe erhalten. Ich sollte nun zu Karras zurückkehren.");
};

INSTANCE Info_Mod_Joseppe_Pickpocket (C_INFO)
{
	npc		= Mod_7267_VLK_Joseppe_NW;
	nr		= 1;
	condition	= Info_Mod_Joseppe_Pickpocket_Condition;
	information	= Info_Mod_Joseppe_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Joseppe_Pickpocket_Condition()
{
	C_Beklauen	(75, ItMi_Gold, 24);
};

FUNC VOID Info_Mod_Joseppe_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Joseppe_Pickpocket);

	Info_AddChoice	(Info_Mod_Joseppe_Pickpocket, DIALOG_BACK, Info_Mod_Joseppe_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Joseppe_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Joseppe_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Joseppe_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Joseppe_Pickpocket);
};

FUNC VOID Info_Mod_Joseppe_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Joseppe_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Joseppe_Pickpocket);

		Info_AddChoice	(Info_Mod_Joseppe_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Joseppe_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Joseppe_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Joseppe_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Joseppe_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Joseppe_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Joseppe_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Joseppe_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Joseppe_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Joseppe_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Joseppe_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Joseppe_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Joseppe_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Joseppe_EXIT (C_INFO)
{
	npc		= Mod_7267_VLK_Joseppe_NW;
	nr		= 1;
	condition	= Info_Mod_Joseppe_EXIT_Condition;
	information	= Info_Mod_Joseppe_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Joseppe_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Joseppe_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};