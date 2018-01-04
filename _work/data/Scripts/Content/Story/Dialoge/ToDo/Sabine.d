INSTANCE Info_Mod_Sabine_Hi (C_INFO)
{
	npc		= Mod_7010_HS_Sabine_REL;
	nr		= 1;
	condition	= Info_Mod_Sabine_Hi_Condition;
	information	= Info_Mod_Sabine_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Sabine_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Namib_NoDeal))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sabine_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Sabine_Hi_17_01"); //Mein Name ist Sabine, meines Zeichens königliche Gewürzhänlderin!
	AI_Output(hero, self, "Info_Mod_Sabine_Hi_15_02"); //Gewürzhändlerin?
	AI_Output(self, hero, "Info_Mod_Sabine_Hi_17_03"); //Königliche Gewürzhändlerin!
	AI_Output(hero, self, "Info_Mod_Sabine_Hi_15_04"); //Und mit was für Gewürzen handelst du?
	AI_Output(self, hero, "Info_Mod_Sabine_Hi_17_05"); //Mit keinen.
	AI_Output(hero, self, "Info_Mod_Sabine_Hi_15_06"); //Wieso heißt du dann Gewürzhändlerin?
	AI_Output(self, hero, "Info_Mod_Sabine_Hi_17_07"); //Königliche Gewürzhändlerin!
	AI_Output(hero, self, "Info_Mod_Sabine_Hi_15_08"); //... na gut. Warum heißt du dann "königliche Gewürzhändlerin"?
	AI_Output(self, hero, "Info_Mod_Sabine_Hi_17_09"); //Ich handle. Und ich mag Gewürze.
	AI_Output(hero, self, "Info_Mod_Sabine_Hi_15_10"); //Mit was handelst du dann?
	AI_Output(self, hero, "Info_Mod_Sabine_Hi_17_11"); //Mit Freudenspender.
	AI_Output(hero, self, "Info_Mod_Sabine_Hi_15_12"); //Freudenspender?
	AI_Output(self, hero, "Info_Mod_Sabine_Hi_17_13"); //Ja! Königlichem Freudenspender!
	AI_Output(hero, self, "Info_Mod_Sabine_Hi_15_14"); //Woher hast du es?
	AI_Output(self, hero, "Info_Mod_Sabine_Hi_17_15"); //Es wird im Hofstaat angebaut! Unter der Führung unsres großen Königs!
	AI_Output(hero, self, "Info_Mod_Sabine_Hi_15_16"); //Wo liegt dieser "Hofstaat"?
	AI_Output(self, hero, "Info_Mod_Sabine_Hi_17_17"); //Ich habe eine Karte, damit ich den Heimweg wieder finde!
	AI_Output(hero, self, "Info_Mod_Sabine_Hi_15_18"); //Lass mich raten. Die ist auch königlich?
	AI_Output(self, hero, "Info_Mod_Sabine_Hi_17_19"); //Schonmal was von 'ner "königlichen Karte" gehört? Ne, das ist nur 'ne stinknormale Karte.
	AI_Output(self, hero, "Info_Mod_Sabine_Hi_17_20"); //Wir können zusammen heimgehen, ich muss aber noch fünf Fläschchen Freudenspender verkaufen.
	AI_Output(self, hero, "Info_Mod_Sabine_Hi_17_21"); //Nimm sie und bring sie unter die Leute, dann können wir gehen.

	B_GiveInvItems	(self, hero, ItMi_Freudenspender, 5);

	AI_Output(hero, self, "Info_Mod_Sabine_Hi_15_22"); //Na gut ...

	B_LogEntry	(TOPIC_MOD_SEKTE_Freudenspender, "Sabine, die königliche Gewürzhändlerin, verkauft in Khorata Freudenspender. Sie bezieht es vom Hofstaat. Wo sich dieser befindet verrät eine Karte. Sabine will mich jedoch dorthin begleiten, wenn ich die fünf Fläschchen mit Freudenspender verkauft habe.");
};

INSTANCE Info_Mod_Sabine_Heiraten_01 (C_INFO)
{
	npc		= Mod_7010_HS_Sabine_REL;
	nr		= 1;
	condition	= Info_Mod_Sabine_Heiraten_01_Condition;
	information	= Info_Mod_Sabine_Heiraten_01_Info;
	permanent	= 0;
	important	= 0;
	description	= "Willst du mich heiraten?";
};

FUNC INT Info_Mod_Sabine_Heiraten_01_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HofstaatTuersteher_Hi))
	&& (Mod_HS_DarfZuKing == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sabine_Heiraten_01_Info()
{
	B_Say (hero, self, "$WANNAMARRY");

	AI_Output(self, hero, "Info_Mod_Sabine_Heiraten_01_17_01"); //Nein.
};

INSTANCE Info_Mod_Sabine_Heiraten_02 (C_INFO)
{
	npc		= Mod_7010_HS_Sabine_REL;
	nr		= 1;
	condition	= Info_Mod_Sabine_Heiraten_02_Condition;
	information	= Info_Mod_Sabine_Heiraten_02_Info;
	permanent	= 0;
	important	= 0;
	description	= "Willst du vielleicht mal mit mir zusammen Freudenspender nehmen?";
};

FUNC INT Info_Mod_Sabine_Heiraten_02_Condition()
{
	if (Npc_HasItems(self, ItFo_Trunken) > 0)
	&& (Npc_HasItems(self, ItMi_Freudenspender_Sabine) == 0)
	&& (Mod_Sekte_Verheiratet == 0)
	&& (Mod_HSBook == 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Heiraten_01))
	&& (Mod_HS_DarfZuKing == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sabine_Heiraten_02_Info()
{
	AI_Output(hero, self, "Info_Mod_Sabine_Heiraten_02_15_00"); //Willst du vielleicht mal mit mir zusammen Freudenspender nehmen?
	AI_Output(self, hero, "Info_Mod_Sabine_Heiraten_02_17_01"); //Na gut.

	B_UseItem	(self, ItFo_Trunken);

	Info_ClearChoices	(Info_Mod_Sabine_Heiraten_02);

	Info_AddChoice	(Info_Mod_Sabine_Heiraten_02, "Ich bin ein Mann, du eine Frau, worauf warten wir eigentlich noch?", Info_Mod_Sabine_Heiraten_02_D);
	Info_AddChoice	(Info_Mod_Sabine_Heiraten_02, "Deine Kleider würden auf meinem Fussboden besser aussehen.", Info_Mod_Sabine_Heiraten_02_C);
	Info_AddChoice	(Info_Mod_Sabine_Heiraten_02, "Kommst du öfter hierher?", Info_Mod_Sabine_Heiraten_02_B);
	Info_AddChoice	(Info_Mod_Sabine_Heiraten_02, "Du siehst verdammt gut aus.", Info_Mod_Sabine_Heiraten_02_A);
};

FUNC VOID Info_Mod_Sabine_Heiraten_02_E()
{
	AI_Output(self, hero, "Info_Mod_Sabine_Heiraten_02_E_17_00"); //Du Wüstling, so etwas lasse ich mir vom Pöbel nicht bieten!

	B_LogEntry	(TOPIC_MOD_SEKTE_Freudenspender, "Sabine will mich noch immer nicht heiraten. Ich glaube ich sollte nochmal beim Weiberheld vorbei sehen.");

	Info_ClearChoices	(Info_Mod_Sabine_Heiraten_02);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Sabine_Heiraten_02_D()
{
	AI_Output(hero, self, "Info_Mod_Sabine_Heiraten_02_D_15_00"); //Ich bin ein Mann, du eine Frau, worauf warten wir eigentlich noch?

	Info_Mod_Sabine_Heiraten_02_E();
};

FUNC VOID Info_Mod_Sabine_Heiraten_02_C()
{
	AI_Output(hero, self, "Info_Mod_Sabine_Heiraten_02_C_15_00"); //Deine Kleider würden auf meinem Fussboden besser aussehen.

	Info_Mod_Sabine_Heiraten_02_E();
};

FUNC VOID Info_Mod_Sabine_Heiraten_02_B()
{
	AI_Output(hero, self, "Info_Mod_Sabine_Heiraten_02_B_15_00"); //Kommst du öfter hierher?

	Info_Mod_Sabine_Heiraten_02_E();
};

FUNC VOID Info_Mod_Sabine_Heiraten_02_A()
{
	AI_Output(hero, self, "Info_Mod_Sabine_Heiraten_02_A_15_00"); //Du siehst verdammt gut aus.

	Info_Mod_Sabine_Heiraten_02_E();
};

INSTANCE Info_Mod_Sabine_Heiraten_03 (C_INFO)
{
	npc		= Mod_7010_HS_Sabine_REL;
	nr		= 1;
	condition	= Info_Mod_Sabine_Heiraten_03_Condition;
	information	= Info_Mod_Sabine_Heiraten_03_Info;
	permanent	= 0;
	important	= 0;
	description	= "Es tut mir leid wegen letztem Mal.";
};

FUNC INT Info_Mod_Sabine_Heiraten_03_Condition()
{
	if (Npc_HasItems(self, ItFo_Trunken) > 0)
	&& (Npc_HasItems(self, ItMi_Freudenspender_Sabine) == 0)
	&& (Mod_Sekte_Verheiratet == 0)
	&& (Mod_HSBook2 == 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Heiraten_02))
	&& (Mod_HS_DarfZuKing == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sabine_Heiraten_03_Info()
{
	AI_Output(hero, self, "Info_Mod_Sabine_Heiraten_03_15_00"); //Es tut mir leid wegen letztem Mal. Willst du zur Versöhnung etwas Freudenspender mit mir nehmen?
	AI_Output(self, hero, "Info_Mod_Sabine_Heiraten_03_17_01"); //Na gut.

	B_UseItem	(self, ItFo_Trunken);

	AI_Output(hero, self, "Info_Mod_Sabine_Heiraten_03_15_02"); //Hast du eine Brieftaube dabei? Ich habe nämlich meiner Mutter versprochen zu schreiben, sobald ich meine Traumfrau gefunden habe.
	AI_Output(self, hero, "Info_Mod_Sabine_Heiraten_03_17_03"); //(kichert)
	AI_Output(hero, self, "Info_Mod_Sabine_Heiraten_03_15_04"); //Du siehst meiner vierten Freundin ähnlich.
	AI_Output(self, hero, "Info_Mod_Sabine_Heiraten_03_17_05"); //Oh, wie viele Freundinnen hattest du denn schon?
	AI_Output(hero, self, "Info_Mod_Sabine_Heiraten_03_15_06"); //Drei.
	AI_Output(self, hero, "Info_Mod_Sabine_Heiraten_03_17_03"); //(kichert)
	AI_Output(hero, self, "Info_Mod_Sabine_Heiraten_03_15_07"); //Wenn ich dich fragen würde, ob du mich heiratest, wäre es dieselbe Antwort wie auf diese Frage?
	AI_Output(self, hero, "Info_Mod_Sabine_Heiraten_03_17_08"); //Das musst du ausprobieren.

	B_Say (hero, self, "$WANNAMARRY");

	AI_Output(self, hero, "Info_Mod_Sabine_Heiraten_03_17_09"); //Ja, ich will!

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_7270_OUT_Weiberheld_REL, "SABINE");
};

INSTANCE Info_Mod_Sabine_FreudenspenderVerkauft (C_INFO)
{
	npc		= Mod_7010_HS_Sabine_REL;
	nr		= 1;
	condition	= Info_Mod_Sabine_FreudenspenderVerkauft_Condition;
	information	= Info_Mod_Sabine_FreudenspenderVerkauft_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wo warst du so plötzlich?";
};

FUNC INT Info_Mod_Sabine_FreudenspenderVerkauft_Condition()
{
	if (Mod_Freudenspender == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sabine_FreudenspenderVerkauft_Info()
{
	AI_Output(hero, self, "Info_Mod_Sabine_FreudenspenderVerkauft_15_00"); //Wo warst du so plötzlich?
	AI_Output(self, hero, "Info_Mod_Sabine_FreudenspenderVerkauft_17_01"); //Ich musste weg.
	AI_Output(hero, self, "Info_Mod_Sabine_FreudenspenderVerkauft_15_02"); //Weg?
	AI_Output(self, hero, "Info_Mod_Sabine_FreudenspenderVerkauft_17_03"); //Ja, weg. Wichtige Dinge und so.
	AI_Output(hero, self, "Info_Mod_Sabine_FreudenspenderVerkauft_15_04"); //Aha ... ich habe jedenfalls dein Freudenspender verkauft.
	AI_Output(self, hero, "Info_Mod_Sabine_FreudenspenderVerkauft_17_05"); //Schön. Hier hast du zwei Fläschchen Freudenspender als Belohnung.

	B_GiveInvItems	(self, hero, ItMi_Freudenspender, 2);

	AI_Output(hero, self, "Info_Mod_Sabine_FreudenspenderVerkauft_15_06"); //Äh ... danke.

	B_GivePlayerXP	(300);
};

INSTANCE Info_Mod_Sabine_Trade (C_INFO)
{
	npc		= Mod_7010_HS_Sabine_REL;
	nr		= 1;
	condition	= Info_Mod_Sabine_Trade_Condition;
	information	= Info_Mod_Sabine_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Sabine_Trade_Condition()
{
	if ((Npc_HasItems(self, ItMi_Freudenspender_Sabine) == 1)
	|| (Npc_HasItems(self, ItFo_Trunken) == 0))
	&& (Mod_Sekte_Verheiratet == 0)
	&& (Mod_HSBook == 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Heiraten_01))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sabine_Trade_Info()
{
	Backup_Questitems();

	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Sabine_Pickpocket (C_INFO)
{
	npc		= Mod_7010_HS_Sabine_REL;
	nr		= 1;
	condition	= Info_Mod_Sabine_Pickpocket_Condition;
	information	= Info_Mod_Sabine_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120_Female;
};

FUNC INT Info_Mod_Sabine_Pickpocket_Condition()
{
	C_Beklauen	(105, ItMi_Freudenspender, 4);
};

FUNC VOID Info_Mod_Sabine_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Sabine_Pickpocket);

	Info_AddChoice	(Info_Mod_Sabine_Pickpocket, DIALOG_BACK, Info_Mod_Sabine_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Sabine_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Sabine_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Sabine_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Sabine_Pickpocket);
};

FUNC VOID Info_Mod_Sabine_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Sabine_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Sabine_Pickpocket);

		Info_AddChoice	(Info_Mod_Sabine_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Sabine_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Sabine_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Sabine_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Sabine_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Sabine_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Sabine_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Sabine_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Sabine_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Sabine_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Sabine_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Sabine_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Sabine_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Sabine_EXIT (C_INFO)
{
	npc		= Mod_7010_HS_Sabine_REL;
	nr		= 1;
	condition	= Info_Mod_Sabine_EXIT_Condition;
	information	= Info_Mod_Sabine_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Sabine_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Sabine_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};