INSTANCE Info_Mod_Cathran_Hi (C_INFO)
{
	npc		= Mod_1025_KGD_Cathran_MT;
	nr		= 1;
	condition	= Info_Mod_Cathran_Hi_Condition;
	information	= Info_Mod_Cathran_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Cathran_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Cathran_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Cathran_Hi_06_00"); //He Fremder, bevor du weiter ins Minental gehst, solltest du bei uns im Lager vorbei schauen.
	AI_Output(self, hero, "Info_Mod_Cathran_Hi_06_01"); //Jemand wie du kann sich bei uns bestimmt die ein oder andere Goldmünze verdienen.

	if (Mod_Gilde > 0)
	{
		AI_Output(self, hero, "Info_Mod_Cathran_Hi_06_02"); //Sprich mit Ole, er ist im Moment für die Verwaltung des Lagers zuständig.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Cathran_Hi_06_03"); //Sprich mit Ole, sobald du dich für eine der großen Gilden entschieden hast, vielleicht hat er dann etwas für dich zu tun.
	};
};

INSTANCE Info_Mod_Cathran_InGilde (C_INFO)
{
	npc		= Mod_1025_KGD_Cathran_MT;
	nr		= 1;
	condition	= Info_Mod_Cathran_InGilde_Condition;
	information	= Info_Mod_Cathran_InGilde_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Cathran_InGilde_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cathran_Hi))
	&& (KG_Dabei == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cathran_InGilde_Info()
{
	AI_Output(self, hero, "Info_Mod_Cathran_InGilde_06_00"); //Ah, wie ich sehe hast du dich entschieden bei uns mit zu machen.
	AI_Output(self, hero, "Info_Mod_Cathran_InGilde_06_01"); //Glaub mir, du hast die richtige Entscheidung getroffen. Bald schon werden wir alle im Erz schwimmen, das hab ich so im Urin.
	AI_Output(hero, self, "Info_Mod_Cathran_InGilde_15_02"); //Wenn du meinst. Ich hoffe nur, dass wir auch alle schwimmen können.
};

INSTANCE Info_Mod_Cathran_Trollholz (C_INFO)
{
	npc		= Mod_1025_KGD_Cathran_MT;
	nr		= 1;
	condition	= Info_Mod_Cathran_Trollholz_Condition;
	information	= Info_Mod_Cathran_Trollholz_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe gehört du hast zufällig noch ein paar Erzbrocken und weißt nicht wohin damit.";
};

FUNC INT Info_Mod_Cathran_Trollholz_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Heidrek_Trollholz))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Heidrek_Trollholz2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cathran_Trollholz_Info()
{
	AI_Output(hero, self, "Info_Mod_Cathran_Trollholz_15_00"); //Ich habe gehört du hast zufällig noch ein paar Erzbrocken und weißt nicht wohin damit.
	AI_Output(self, hero, "Info_Mod_Cathran_Trollholz_06_01"); //Das hättest du wohl gerne ...
	AI_Output(self, hero, "Info_Mod_Cathran_Trollholz_06_02"); //Weil ich heute aber einen guten Tag habe, gebe ich dir zwei, wenn du mir einen kleinen Gefallen erweist.
	AI_Output(hero, self, "Info_Mod_Cathran_Trollholz_15_03"); //Und der wäre?
	AI_Output(self, hero, "Info_Mod_Cathran_Trollholz_06_04"); //Besorg mir ein Keilerfell. Hier oben ist es bisweilen verdammt windig und ich hab lieber ein warmes Fell, als zwei kalte Erzbrocken.
	AI_Output(self, hero, "Info_Mod_Cathran_Trollholz_06_05"); //Wenn du selbst keins hast, dann frag doch mal die Wachen auf den Türmen, die haben wahrscheinlich selbst welche.

	B_LogEntry	(TOPIC_MOD_KG_TROLLHOLZ, "Damit Cathran mit zwei seiner Erzbrocken gibt soll ich ihm zuerst ein Keilerfell organisieren. Er meint, dass die Turmwachen eines haben könnten ...");
};

INSTANCE Info_Mod_Cathran_Trollholz2 (C_INFO)
{
	npc		= Mod_1025_KGD_Cathran_MT;
	nr		= 1;
	condition	= Info_Mod_Cathran_Trollholz2_Condition;
	information	= Info_Mod_Cathran_Trollholz2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier hast du dein Keilerfell.";
};

FUNC INT Info_Mod_Cathran_Trollholz2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cathran_Trollholz))
	&& ((Npc_HasItems(hero, ItAt_Addon_KeilerFur) >= 1)
	|| (Npc_HasItems(hero, ItAt_Addon_KeilerFur_Rein) >= 1)
	|| (Npc_HasItems(hero, ItAt_Addon_KeilerFur_Feuer) >= 1))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cathran_Trollholz2_Info()
{
	AI_Output(hero, self, "Info_Mod_Cathran_Trollholz2_15_00"); //Hier hast du dein Keilerfell.

	if (Npc_HasItems(hero, ItAt_Addon_KeilerFur) >= 1)
	{
		B_GiveInvItems	(hero, self, ItAt_Addon_KeilerFur, 1);
	}
	else if (Npc_HasItems(hero, ItAt_Addon_KeilerFur_Rein) >= 1)
	{
		B_GiveInvItems	(hero, self, ItAt_Addon_KeilerFur_Rein, 1);
	}
	else
	{
		B_GiveInvItems	(hero, self, ItAt_Addon_KeilerFur_Feuer, 1);
	};

	AI_Output(self, hero, "Info_Mod_Cathran_Trollholz2_06_01"); //Danke, hier hast du deine zwei Erzbrocken.

	B_GiveInvItems	(self, hero, ItMi_Nugget, 2);

	B_GivePlayerXP	(100);

	B_LogEntry	(TOPIC_MOD_KG_TROLLHOLZ, "Damit hätte ich die zwei Erzbrocken von Cathran. Ich sollte sie gleich zu Heidrek bringen ...");
};

INSTANCE Info_Mod_Cathran_Asylanten (C_INFO)
{
	npc		= Mod_1025_KGD_Cathran_MT;
	nr		= 1;
	condition	= Info_Mod_Cathran_Asylanten_Condition;
	information	= Info_Mod_Cathran_Asylanten_Info;
	permanent	= 0;
	important	= 0;
	description	= "Woher kommt die königliche Garde?";
};

FUNC INT Info_Mod_Cathran_Asylanten_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hagen_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cathran_Asylanten_Info()
{
	AI_Output(hero, self, "Info_Mod_Cathran_Asylanten_15_00"); //Woher kommt die königliche Garde?
	AI_Output(self, hero, "Info_Mod_Cathran_Asylanten_06_01"); //Direkt nach dem Fall der Barriere wurden wir vom König hierher geschickt, um den Durchgang nach Khorinis zu überwachen.
	AI_Output(hero, self, "Info_Mod_Cathran_Asylanten_15_02"); //Aber das hat doch Lord Hagen auf der anderen Seite auch gemacht.
	AI_Output(self, hero, "Info_Mod_Cathran_Asylanten_06_03"); //Der König traut Lord Hagen nicht mehr über den Weg.
	AI_Output(self, hero, "Info_Mod_Cathran_Asylanten_06_04"); //Er befürchtet, dass Hagen zu schwach sein könnte, um die Sträflinge aufzuhalten.
	AI_Output(self, hero, "Info_Mod_Cathran_Asylanten_06_05"); //Der hat nämlich häufig genug betont, dass er ein Blutvergießen unbedingt verhindern möchte.
	AI_Output(hero, self, "Info_Mod_Cathran_Asylanten_15_06"); //Was wisst ihr über die Gruppierungen im Minental?
	AI_Output(self, hero, "Info_Mod_Cathran_Asylanten_06_07"); //Aggressives Potenzial geht vom Alten und vom Neuen Lager aus.
	AI_Output(self, hero, "Info_Mod_Cathran_Asylanten_06_08"); //Diese beiden Lager stehen unter besonderer Beobachtung.
	AI_Output(hero, self, "Info_Mod_Cathran_Asylanten_15_09"); //Danke für die Informationen.
	AI_Output(self, hero, "Info_Mod_Cathran_Asylanten_06_10"); //Schönen Tag noch, falls er hier so was gibt.

	B_LogEntry	(TOPIC_MOD_HAGEN_ASYLANTEN, "Der König hat seine Garde heimlich zum Pass im Minental geschickt, um ihn unabhängig von Lord Hagen zu überwachen. Besonders das Alte und das neue Lager werden als gefährlich eingeschätzt.");
};

INSTANCE Info_Mod_Cathran_Treue (C_INFO)
{
	npc		= Mod_1025_KGD_Cathran_MT;
	nr		= 1;
	condition	= Info_Mod_Cathran_Treue_Condition;
	information	= Info_Mod_Cathran_Treue_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Cathran_Treue_Condition()
{
	if (Mod_Kap4_KGOrks == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cathran_Treue_Info()
{
	AI_Output(self, hero, "Info_Mod_Cathran_Treue_06_00"); //Man muss sie alle schlachten, diese grünen Bastarde.
	AI_Output(self, hero, "Info_Mod_Cathran_Treue_06_01"); //Sollen sie ruhig wiederkommen.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Cathran_Siegelring (C_INFO)
{
	npc		= Mod_1025_KGD_Cathran_MT;
	nr		= 1;
	condition	= Info_Mod_Cathran_Siegelring_Condition;
	information	= Info_Mod_Cathran_Siegelring_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Cathran_Siegelring_Condition()
{
	if (Mod_Herold_Siegelring == 3)
	&& (!Npc_IsDead(Mod_7749_OUT_Raeuber_MT))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cathran_Siegelring_Info()
{
	AI_Output(self, hero, "Info_Mod_Cathran_Siegelring_06_00"); //Halt. Der Würdenträger des Königs wünscht nicht gestört zu werden.
	AI_Output(hero, self, "Info_Mod_Cathran_Siegelring_15_01"); //Würdenträger des Königs?
	AI_Output(self, hero, "Info_Mod_Cathran_Siegelring_06_02"); //Nun ... ähh, er trägt die Kleidung eines Würdenträgers und hat einen Erlass mit königlichem Siegel bei sich.
};

INSTANCE Info_Mod_Cathran_Siegelring2 (C_INFO)
{
	npc		= Mod_1025_KGD_Cathran_MT;
	nr		= 1;
	condition	= Info_Mod_Cathran_Siegelring2_Condition;
	information	= Info_Mod_Cathran_Siegelring2_Info;
	permanent	= 0;
	important	= 0;
	description	= "In etwa in dieser Schrift verfasst?";
};

FUNC INT Info_Mod_Cathran_Siegelring2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cathran_Siegelring))
	&& (Npc_HasItems(hero, ItWr_LandstreicherSiegelring) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cathran_Siegelring2_Info()
{
	AI_Output(hero, self, "Info_Mod_Cathran_Siegelring2_15_00"); //In etwa in dieser Schrift verfasst?

	B_GiveInvItems	(hero, self, ItWr_LandstreicherSiegelring, 1);

	AI_Output(self, hero, "Info_Mod_Cathran_Siegelring2_06_01"); //Was?

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Cathran_Siegelring2_06_02"); //Aber ... das ... Jetzt wird mir einiges klar. Ich hatte mich schon gewundert.
	AI_Output(self, hero, "Info_Mod_Cathran_Siegelring2_06_03"); //Dieser ... dieser schmierige Halunke säuft und stopft sich auf unsere Kosten den Wanst voll ... mit seinem gefälschten Erlass.
	AI_Output(self, hero, "Info_Mod_Cathran_Siegelring2_06_04"); //Das werde ich ihm schon austreiben.

	AI_StopProcessInfos	(self);

	Mod_7749_OUT_Raeuber_MT.guild = GIL_STRF;
	Npc_SetTrueGuild	(Mod_7749_OUT_Raeuber_MT, GIL_STRF);

	B_Attack	(self, Mod_7749_OUT_Raeuber_MT, AR_Kill, 0);
};

INSTANCE Info_Mod_Cathran_Siegelring3 (C_INFO)
{
	npc		= Mod_1025_KGD_Cathran_MT;
	nr		= 1;
	condition	= Info_Mod_Cathran_Siegelring3_Condition;
	information	= Info_Mod_Cathran_Siegelring3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Cathran_Siegelring3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cathran_Siegelring2))
	&& (Npc_IsDead(Mod_7749_OUT_Raeuber_MT))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cathran_Siegelring3_Info()
{
	AI_Output(self, hero, "Info_Mod_Cathran_Siegelring3_06_00"); //So, das hat der Dreckskerl nun davon. Danke, dass du mir die Augen geöffnet hast. Hier, nimm das zur Belohnung.

	CreateInvItems	(hero, ItMi_Gold, 100);
	CreateInvItems	(hero, ItMi_Nugget, 5);

	B_ShowGivenThings	("100 Gold und 5 Erzbrocken erhalten");

	B_GivePlayerXP	(200);
};

INSTANCE Info_Mod_Cathran_Pickpocket (C_INFO)
{
	npc		= Mod_1025_KGD_Cathran_MT;
	nr		= 1;
	condition	= Info_Mod_Cathran_Pickpocket_Condition;
	information	= Info_Mod_Cathran_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Cathran_Pickpocket_Condition()
{
	C_Beklauen	(78, ItMi_Gold, 360);
};

FUNC VOID Info_Mod_Cathran_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Cathran_Pickpocket);

	Info_AddChoice	(Info_Mod_Cathran_Pickpocket, DIALOG_BACK, Info_Mod_Cathran_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Cathran_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Cathran_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Cathran_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Cathran_Pickpocket);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Aabid_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Aabid_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Aabid_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Cathran_EXIT (C_INFO)
{
	npc		= Mod_1025_KGD_Cathran_MT;
	nr		= 1;
	condition	= Info_Mod_Cathran_EXIT_Condition;
	information	= Info_Mod_Cathran_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Cathran_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Cathran_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};