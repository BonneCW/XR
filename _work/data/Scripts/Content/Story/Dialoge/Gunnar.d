INSTANCE Info_Mod_Gunnar_Hi (C_INFO)
{
	npc		= Mod_785_BAU_Gunnar_NW;
	nr		= 1;
	condition	= Info_Mod_Gunnar_Hi_Condition;
	information	= Info_Mod_Gunnar_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Gunnar_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gunnar_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Gunnar_Hi_10_01"); //Ich bin Gunnar, Bauer von Beruf.
};

INSTANCE Info_Mod_Gunnar_Unheil (C_INFO)
{
	npc		= Mod_785_BAU_Gunnar_NW;
	nr		= 1;
	condition	= Info_Mod_Gunnar_Unheil_Condition;
	information	= Info_Mod_Gunnar_Unheil_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hat sich in letzter Zeit etwas Außergewöhnliches ereignet?";
};

FUNC INT Info_Mod_Gunnar_Unheil_Condition()
{
	if (Mod_WM_Boeden == 14)
	|| (Mod_WM_Boeden == 13)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gunnar_Unheil_Info()
{
	AI_Output(hero, self, "Info_Mod_Gunnar_Unheil_15_00"); //Hat sich in letzter Zeit etwas Außergewöhnliches ereignet?
	AI_Output(self, hero, "Info_Mod_Gunnar_Unheil_10_01"); //Nun, wenn man mal von den Horden von Monstern in der Umgebung absieht, nichts Ungewöhnliches.
	AI_Output(hero, self, "Info_Mod_Gunnar_Unheil_15_02"); //Na dann ist ja gut.
	AI_Output(self, hero, "Info_Mod_Gunnar_Unheil_10_03"); //Nur eben die ständigen Hagelschauer, die uns die Ernte versauen, die Schafe geben nur noch saure Milch und die ständigen Erkrankungen auf dem Hof diese Saison.
	AI_Output(self, hero, "Info_Mod_Gunnar_Unheil_10_04"); //Besonders Maria leidet seid einigen Tagen unter starkem Siechtum. Sogar Sagittas Kräuterkunst konnte ihr noch nicht helfen. Ja, aber sonst ist alles normal.

	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Gunnar berichtete von Hagelschauern, sauerer Schafsmilch und gesundheitlichen Beschwerden auf dem Hof in dieser Saison.");

	if (!Npc_KnowsInfo(hero, Info_Mod_Bobo_Unheil))
	{
		B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Maria ist seit einigen Tagen stark erkrankt.");
	};

	Mod_HinweiseDerBauernZuHexen += 1;
};

INSTANCE Info_Mod_Gunnar_Dieb (C_INFO)
{
	npc		= Mod_785_BAU_Gunnar_NW;
	nr		= 1;
	condition	= Info_Mod_Gunnar_Dieb_Condition;
	information	= Info_Mod_Gunnar_Dieb_Info;
	permanent	= 0;
	important	= 0;
	description	= "Erwischt!";
};

FUNC INT Info_Mod_Gunnar_Dieb_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Onar_Dieb))
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), "NW_BIGFARM_KITCHEN_04"))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gunnar_Dieb_Info()
{
	AI_Output(hero, self, "Info_Mod_Gunnar_Dieb_15_00"); //Erwischt!
	AI_Output(self, hero, "Info_Mod_Gunnar_Dieb_10_01"); //Mist, schnell weg hier!

	B_LogEntry	(TOPIC_MOD_BAUER_DIEB, "Ich habe Gunnar erwischt wie er im Lagerraum Sachen geklaut hat.");

	AI_StopProcessInfos	(self);

	Npc_ExchangeRoutine	(self, "FLUCHT");
};

INSTANCE Info_Mod_Gunnar_Flucht (C_INFO)
{
	npc		= Mod_785_BAU_Gunnar_NW;
	nr		= 1;
	condition	= Info_Mod_Gunnar_Flucht_Condition;
	information	= Info_Mod_Gunnar_Flucht_Info;
	permanent	= 0;
	important	= 0;
	description	= "Jetzt haust du aber nicht mehr ab.";
};

FUNC INT Info_Mod_Gunnar_Flucht_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gunnar_Dieb))
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), "NW_BIGFARM_FELDREUBER4"))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gunnar_Flucht_Info()
{
	AI_Output(hero, self, "Info_Mod_Gunnar_Flucht_15_00"); //Jetzt haust du aber nicht mehr ab.
	AI_Output(self, hero, "Info_Mod_Gunnar_Flucht_10_01"); //Äh ... was willst du von mir? Ich hab nichts gemacht.
	AI_Output(hero, self, "Info_Mod_Gunnar_Flucht_15_02"); //Denkst du ich bin blöd? Ich hab dich gesehen wie du Sachen aus dem Lager gestohlen hast.
	AI_Output(self, hero, "Info_Mod_Gunnar_Flucht_10_03"); //D ... Das muss ein Irrtum sein. Ich habe nichts gestohlen.
	
	Info_ClearChoices	(Info_Mod_Gunnar_Flucht);

	Info_AddChoice	(Info_Mod_Gunnar_Flucht, "Wenn du die Beute mit mir teilst werde ich dich nicht verraten.", Info_Mod_Gunnar_Flucht_Teilen);
	Info_AddChoice	(Info_Mod_Gunnar_Flucht, "Wenn du mir nichts sagen willst werde ich es eben aus dir rausprügeln.", Info_Mod_Gunnar_Flucht_Attacke);
};

FUNC VOID Info_Mod_Gunnar_Flucht_Teilen()
{
	AI_Output(hero, self, "Info_Mod_Gunnar_Flucht_Teilen_15_00"); //Wenn du die Beute mit mir teils werde ich dich nicht verraten.
	AI_Output(self, hero, "Info_Mod_Gunnar_Flucht_Teilen_10_01"); //Ok, mir bleibt wohl keine andere Wahl. Hier hast du deinen Teil.

	CreateInvItems	(hero, ItFo_MuttonRaw, 10);
	CreateInvItems	(hero, ItFo_Cheese, 3);
	CreateInvItems	(hero, ItFo_Water, 5);

	B_ShowGivenThings	("10 rohes Fleisch, 3 Käse und 5 Wasser erhalten");

	Mod_Gunnar_Partner = TRUE;

	B_SetTopicStatus	(TOPIC_MOD_BAUER_DIEB, LOG_FAILED);

	AI_StopProcessInfos	(self);

	Info_ClearChoices	(Info_Mod_Gunnar_Flucht);

	Npc_ExchangeRoutine	(self, "START");
};

FUNC VOID Info_Mod_Gunnar_Flucht_Attacke()
{
	AI_Output(hero, self, "Info_Mod_Gunnar_Flucht_Attacke_15_00"); //Wenn du mir nichts sagen willst werde ich es eben aus dir rausprügeln.
	AI_Output(self, hero, "Info_Mod_Gunnar_Flucht_Attacke_10_01"); //Das wollen wir erstmal sehen.
	
	CreateInvItems	(self, ItKe_Mod_Gunnar_Dieb, 1);
	
	AI_StopProcessInfos	(self);

	Info_ClearChoices	(Info_Mod_Gunnar_Flucht);

	Npc_ExchangeRoutine	(self, "START");

	B_Attack	(self, hero, AR_NONE, 0);
};

INSTANCE Info_Mod_Gunnar_Pickpocket (C_INFO)
{
	npc		= Mod_785_BAU_Gunnar_NW;
	nr		= 1;
	condition	= Info_Mod_Gunnar_Pickpocket_Condition;
	information	= Info_Mod_Gunnar_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_20;
};

FUNC INT Info_Mod_Gunnar_Pickpocket_Condition()
{
	C_Beklauen	(20, ItMi_Gold, 30);
};

FUNC VOID Info_Mod_Gunnar_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Gunnar_Pickpocket);

	Info_AddChoice	(Info_Mod_Gunnar_Pickpocket, DIALOG_BACK, Info_Mod_Gunnar_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Gunnar_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Gunnar_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Gunnar_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Gunnar_Pickpocket);
};

FUNC VOID Info_Mod_Gunnar_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Gunnar_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Gunnar_Pickpocket);

		Info_AddChoice	(Info_Mod_Gunnar_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Gunnar_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Gunnar_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Gunnar_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Gunnar_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Gunnar_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Gunnar_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Gunnar_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Gunnar_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Gunnar_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Gunnar_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Gunnar_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Gunnar_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Gunnar_EXIT (C_INFO)
{
	npc		= Mod_785_BAU_Gunnar_NW;
	nr		= 1;
	condition	= Info_Mod_Gunnar_EXIT_Condition;
	information	= Info_Mod_Gunnar_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Gunnar_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gunnar_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};