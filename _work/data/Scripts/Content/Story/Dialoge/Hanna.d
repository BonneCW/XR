INSTANCE Info_Mod_Hanna_Hi (C_INFO)
{
	npc		= Mod_583_NONE_Hanna_NW;
	nr		= 1;
	condition	= Info_Mod_Hanna_Hi_Condition;
	information	= Info_Mod_Hanna_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wo bin ich hier?";
};

FUNC INT Info_Mod_Hanna_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hanna_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Hanna_Hi_15_00"); //Wo bin ich hier?
	AI_Output(self, hero, "Info_Mod_Hanna_Hi_21_01"); //In meinem Rasthaus. Wenn du eine Bleibe für die Nacht suchst, bist du herzlich willkommen.
};

INSTANCE Info_Mod_Hanna_Preis (C_INFO)
{
	npc		= Mod_583_NONE_Hanna_NW;
	nr		= 1;
	condition	= Info_Mod_Hanna_Preis_Condition;
	information	= Info_Mod_Hanna_Preis_Info;
	permanent	= 0;
	important	= 0;
	description	= "Je nachdem. Wie viel verlangst du?";
};

FUNC INT Info_Mod_Hanna_Preis_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hanna_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Hanna_Meldor))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hanna_Preis_Info()
{
	AI_Output(hero, self, "Info_Mod_Hanna_Preis_15_00"); //Je nachdem. Wie viel verlangst du?
	AI_Output(self, hero, "Info_Mod_Hanna_Preis_21_01"); //Hmm... Du bist der Neue aus dem Minental und hast sicher keine vollen Taschen.
	AI_Output(self, hero, "Info_Mod_Hanna_Preis_21_02"); //Wenn du friedlich bist und ein freies Bett findest, kannst du meinetwegen kostenlos übernachten.
	AI_Output(hero, self, "Info_Mod_Hanna_Preis_15_03"); //Das ist eine angenehme Überraschung. Davon hatte ich in letzter Zeit wenige.
	AI_Output(self, hero, "Info_Mod_Hanna_Preis_21_04"); //Ich kann auch nur so großzügig sein, weil ich finanziell nicht von dem Rasthaus abhängig bin.
	AI_Output(self, hero, "Info_Mod_Hanna_Preis_21_05"); //(hintergründig) Aber davon dann ein andermal vielleicht mehr...
};

INSTANCE Info_Mod_Hanna_Gaeste (C_INFO)
{
	npc		= Mod_583_NONE_Hanna_NW;
	nr		= 1;
	condition	= Info_Mod_Hanna_Gaeste_Condition;
	information	= Info_Mod_Hanna_Gaeste_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer übernachtet sonst noch hier?";
};

FUNC INT Info_Mod_Hanna_Gaeste_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hanna_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Hanna_Meldor))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hanna_Gaeste_Info()
{
	AI_Output(hero, self, "Info_Mod_Hanna_Gaeste_15_00"); //Wer übernachtet sonst noch hier?
	AI_Output(self, hero, "Info_Mod_Hanna_Gaeste_21_01"); //Eigentlich jeder, der von außerhalb kommt und keine Lust hat, sich in der Roten Laterne zu verausgaben.
	AI_Output(self, hero, "Info_Mod_Hanna_Gaeste_21_02"); //Es kommt aber trotzdem sehr selten vor, dass ich meine Kundschaft nicht kenne. Es sind doch immer wieder dieselben Gesichter, die abends mehr oder weniger betrunken an mir vorbeitorkeln.
};

INSTANCE Info_Mod_Hanna_Rasthaus (C_INFO)
{
	npc		= Mod_583_NONE_Hanna_NW;
	nr		= 1;
	condition	= Info_Mod_Hanna_Rasthaus_Condition;
	information	= Info_Mod_Hanna_Rasthaus_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dein Rasthaus? Hast du keinen Mann?";
};

FUNC INT Info_Mod_Hanna_Rasthaus_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hanna_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Hanna_Meldor))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hanna_Rasthaus_Info()
{
	AI_Output(hero, self, "Info_Mod_Hanna_Rasthaus_15_00"); //Dein Rasthaus? Hast du keinen Mann?
	AI_Output(self, hero, "Info_Mod_Hanna_Rasthaus_21_01"); //(spöttisch) Ich nehme mal an, dass du aus einem hinterwäldlerischen Landstrich stammst, wenn du es nicht für eine Frechheit hältst, so etwas zu fragen.
	AI_Output(self, hero, "Info_Mod_Hanna_Rasthaus_21_02"); //Ich komme sehr gut allein zurecht, und für den Notfall weiß ich, wie ich Hilfe organisieren kann. Und für kleinere Probleme tut's auch immer der Prügel.
};

INSTANCE Info_Mod_Hanna_ThorbenLehrling (C_INFO)
{
	npc		= Mod_583_NONE_Hanna_NW;
	nr		= 1;
	condition	= Info_Mod_Hanna_ThorbenLehrling_Condition;
	information	= Info_Mod_Hanna_ThorbenLehrling_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hanna_ThorbenLehrling_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_LehrlingQuest5))
	&& (Wld_IsTime(10,55,11,25))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hanna_ThorbenLehrling_Info()
{
	AI_Output(self, hero, "Info_Mod_Hanna_ThorbenLehrling_21_00"); //Hallo. Ich würde gern Thorben sprechen.
	AI_Output(hero, self, "Info_Mod_Hanna_ThorbenLehrling_15_01"); //Ich vertrete ihn heute. Möchtest du ein Möbelstück in Auftrag geben?
	AI_Output(self, hero, "Info_Mod_Hanna_ThorbenLehrling_21_02"); //Du vermutest richtig. Ein betrunkener Gast hat meine Kommode für einen nächtlichen Angreifer gehalten und mit dem Degen schwer beschädigt.
	AI_Output(hero, self, "Info_Mod_Hanna_ThorbenLehrling_15_03"); //Wir werden uns um die Reparatur kümmern.
	AI_Output(self, hero, "Info_Mod_Hanna_ThorbenLehrling_21_04"); //Gut. Ich erwarte euch in meinem Haus.
};

INSTANCE Info_Mod_Hanna_Meldor (C_INFO)
{
	npc		= Mod_583_NONE_Hanna_NW;
	nr		= 1;
	condition	= Info_Mod_Hanna_Meldor_Condition;
	information	= Info_Mod_Hanna_Meldor_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hanna_Meldor_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Meldor_PaketSicher))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hanna_Meldor_Info()
{
	AI_Output(self, hero, "Info_Mod_Hanna_Meldor_21_00"); //Was kann ich für dich tun?
	AI_Output(hero, self, "Info_Mod_Hanna_Meldor_15_01"); //Sumpfkrautmeldor schickt mich.
	AI_Output(self, hero, "Info_Mod_Hanna_Meldor_21_02"); //Oh, ein Neuer, was?
	AI_Output(hero, self, "Info_Mod_Hanna_Meldor_15_03"); //Was seid ihr überhaupt?
	AI_Output(self, hero, "Info_Mod_Hanna_Meldor_21_04"); //Hier, nimm diesen Schlüssel und geh durch die Kellertür.

	B_GiveInvItems	(self, hero, ItKe_ThiefGuildKey_Hotel_MIS, 1);

	AI_Output(self, hero, "Info_Mod_Hanna_Meldor_21_05"); //Dort wirst du deine Antwort finden.

	B_LogEntry	(TOPIC_MOD_MELDOR_HANNA, "Hanna hat mir einen Schlüssel gegeben, der die Tür zu ihrem Keller öffnet. Ich bin gespannt, was mich dort unten erwartet.");
};

INSTANCE Info_Mod_Hanna_Keller (C_INFO)
{
	npc		= Mod_583_NONE_Hanna_NW;
	nr		= 1;
	condition	= Info_Mod_Hanna_Keller_Condition;
	information	= Info_Mod_Hanna_Keller_Info;
	permanent	= 0;
	important	= 0;
	description	= "Es gibt Probleme.";
};

FUNC INT Info_Mod_Hanna_Keller_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_Keller))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hanna_Keller_Info()
{
	AI_Output(hero, self, "Info_Mod_Hanna_Keller_15_00"); //Es gibt Probleme.
	AI_Output(self, hero, "Info_Mod_Hanna_Keller_21_01"); //Was ist passiert?
	AI_Output(hero, self, "Info_Mod_Hanna_Keller_15_02"); //Einer der Händler hat nachts festgestellt, dass mehrere Gestalten aus dem Keller gekommen sind. Passt besser auf.
	AI_Output(self, hero, "Info_Mod_Hanna_Keller_21_03"); //Danke, werden wir machen.

	B_LogEntry	(TOPIC_MOD_DIEB_ANDRE_HANNA, "Ich habe Hanna gewarnt. Hoffentlich kommt so etwas nicht mehr vor.");
};

INSTANCE Info_Mod_Hanna_Flugblaetter (C_INFO)
{
	npc		= Mod_583_NONE_Hanna_NW;
	nr		= 1;
	condition	= Info_Mod_Hanna_Flugblaetter_Condition;
	information	= Info_Mod_Hanna_Flugblaetter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab hier ein Flugblatt für dich.";
};

FUNC INT Info_Mod_Hanna_Flugblaetter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Auftrag_2))
	&& (Npc_HasItems(hero, MatteoFlugblaetter) >= 1)
	&& (Mod_Flugblaetter < 20)
	&&(!Npc_KnowsInfo(hero, Info_Mod_Matteo_Flugblaetter))
	&& (Npc_KnowsInfo(hero, Info_Mod_Hanna_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hanna_Flugblaetter_Info()
{
	B_Say (hero, self, "$MATTEOPAPER");

	B_GiveInvItems	(hero, self, MatteoFlugblaetter, 1);

	AI_Output(self, hero, "Info_Mod_Hanna_Flugblaetter_21_01"); //Oh danke. Mal sehen ...

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Hanna_Flugblaetter_21_02"); //Ah ja. Vielleicht werd ich mal bei Matteo vorbeischauen.

	Mod_Flugblaetter += 1;
};

INSTANCE Info_Mod_Hanna_Pickpocket (C_INFO)
{
	npc		= Mod_583_NONE_Hanna_NW;
	nr		= 1;
	condition	= Info_Mod_Hanna_Pickpocket_Condition;
	information	= Info_Mod_Hanna_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90_Female;
};

FUNC INT Info_Mod_Hanna_Pickpocket_Condition()
{
	C_Beklauen	(75, ItMi_Gold, 26);
};

FUNC VOID Info_Mod_Hanna_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Hanna_Pickpocket);

	Info_AddChoice	(Info_Mod_Hanna_Pickpocket, DIALOG_BACK, Info_Mod_Hanna_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Hanna_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Hanna_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Hanna_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Hanna_Pickpocket);
};

FUNC VOID Info_Mod_Hanna_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Hanna_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Hanna_Pickpocket);

		Info_AddChoice	(Info_Mod_Hanna_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Hanna_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Hanna_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Hanna_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Hanna_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Hanna_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Hanna_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Hanna_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Hanna_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Hanna_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Hanna_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Hanna_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Hanna_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Hanna_EXIT (C_INFO)
{
	npc		= Mod_583_NONE_Hanna_NW;
	nr		= 1;
	condition	= Info_Mod_Hanna_EXIT_Condition;
	information	= Info_Mod_Hanna_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Hanna_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hanna_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};