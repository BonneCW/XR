INSTANCE Info_Mod_Ole_Aufgabe (C_INFO)
{
	npc		= Mod_1011_KGD_Ole_MT;
	nr		= 1;
	condition	= Info_Mod_Ole_Aufgabe_Condition;
	information	= Info_Mod_Ole_Aufgabe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Cathran meint, ich könnte mir bei dir ein wenig Gold verdienen.";
};

FUNC INT Info_Mod_Ole_Aufgabe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cathran_Hi))
	&& (Mod_Gilde > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ole_Aufgabe_Info()
{
	AI_Output(hero, self, "Info_Mod_Ole_Aufgabe_15_00"); //Cathran meint, ich könnte mir bei dir ein wenig Gold verdienen.
	AI_Output(self, hero, "Info_Mod_Ole_Aufgabe_02_01"); //Ach, das meint er. Na gut, aber viel kann ich dir dafür nicht geben.
	AI_Output(self, hero, "Info_Mod_Ole_Aufgabe_02_02"); //Du müsstest für mich zu Lord Andre gehen und ihm diesen Brief übergeben.

	B_GiveInvItems	(self, hero, ItWr_OleForAndre, 1);

	AI_Output(self, hero, "Info_Mod_Ole_Aufgabe_02_03"); //Hier hast du 50 Goldmünzen.

	B_GiveInvItems	(self, hero, ItMi_Gold, 50);

	AI_Output(self, hero, "Info_Mod_Ole_Aufgabe_02_04"); //Wenn du mir seine Antwort überbracht hast reden wir über mehr Gold.

	Log_CreateTopic	(TOPIC_MOD_KG_OLEBRIEF, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_KG_OLEBRIEF, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_KG_OLEBRIEF, "Ole hat mir einen Brief gegeben, den ich zu Lord Andre bringen soll. Na toll ...");
};

INSTANCE Info_Mod_Ole_WarBeiAndre (C_INFO)
{
	npc		= Mod_1011_KGD_Ole_MT;
	nr		= 1;
	condition	= Info_Mod_Ole_WarBeiAndre_Condition;
	information	= Info_Mod_Ole_WarBeiAndre_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe den Brief Lord Andre überbracht.";
};

FUNC INT Info_Mod_Ole_WarBeiAndre_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_Ole))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ole_WarBeiAndre_Info()
{
	AI_Output(hero, self, "Info_Mod_Ole_WarBeiAndre_15_00"); //Ich habe den Brief Lord Andre überbracht.
	AI_Output(self, hero, "Info_Mod_Ole_WarBeiAndre_02_01"); //Gut, und was hat er dir gesagt.
	AI_Output(hero, self, "Info_Mod_Ole_WarBeiAndre_15_02"); //Er hat gemeint, er gibt dir erst neue Leute, wenn du wieder Erz abbaust, und als Zeichen dafür sollst du ihm 50 Erzbrocken überbringen.
	AI_Output(self, hero, "Info_Mod_Ole_WarBeiAndre_02_03"); //Wir haben nicht mal mehr zwei Erzbrocken im Lager und wie soll ich ohne mehr Leute eine Mine herrichten und dort Erz fördern?!

	if (Mod_AnzahlNebengilden < MaxNebengilden)
	&& (hero.guild != GIL_MIL)
	&& (Gardist_Dabei == FALSE)
	{
		AI_Output(self, hero, "Info_Mod_Ole_WarBeiAndre_02_04"); //Ah ... Jetzt hab ich's. Wie wäre es, wenn du für uns arbeitest.
		AI_Output(hero, self, "Info_Mod_Ole_WarBeiAndre_15_05"); //Wenn die Bezahlung stimmt, bin ich dabei.
		AI_Output(self, hero, "Info_Mod_Ole_WarBeiAndre_02_06"); //Keine Sorge, wenn die Mine erst mal wieder läuft, wirst du in Gold schwimmen.
		AI_Output(self, hero, "Info_Mod_Ole_WarBeiAndre_02_07"); //Als Anzahlung kannst du ja diese Rüstung betrachten.

		B_GiveInvItems	(self, hero, ItAr_KG_01, 1);

		KG_Dabei = 1;

		Mod_AnzahlNebengilden += 1;
		
		Spine_UnlockAchievement(SPINE_ACHIEVEMENT_54);
		Spine_UnlockAchievement(SPINE_ACHIEVEMENT_66);

		Log_CreateTopic	(TOPIC_MOD_NEBENGILDEN, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_NEBENGILDEN, "Ole hat mich bei der königlichen Garde aufgenommen.");
	}
	else if (hero.guild == GIL_MIL)
	{
		AI_Output(self, hero, "Info_Mod_Ole_WarBeiAndre_02_08"); //Tja, da müssen wir uns wohl jemanden suchen, kein Söldner ist.
	}
	else if (Gardist_Dabei == TRUE)
	{
		AI_Output(self, hero, "Info_Mod_Ole_WarBeiAndre_02_09"); //Tja, da müssen wir uns wohl jemanden suchen, der nicht im alten Lager mitmischt.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Ole_WarBeiAndre_02_10"); //Tja, da müssen wir uns wohl jemanden suchen, der nicht so beschäftigt ist wie du.
	};

	B_SetTopicStatus	(TOPIC_MOD_KG_OLEBRIEF, LOG_SUCCESS);

	B_GivePlayerXP	(250);
};

INSTANCE Info_Mod_Ole_Vorbereitungen (C_INFO)
{
	npc		= Mod_1011_KGD_Ole_MT;
	nr		= 1;
	condition	= Info_Mod_Ole_Vorbereitungen_Condition;
	information	= Info_Mod_Ole_Vorbereitungen_Info;
	permanent	= 0;
	important	= 0;
	description	= "In Ordnung, was soll ich für dich machen?";
};

FUNC INT Info_Mod_Ole_Vorbereitungen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ole_WarBeiAndre))
	&& (KG_Dabei == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ole_Vorbereitungen_Info()
{
	AI_Output(hero, self, "Info_Mod_Ole_Vorbereitungen_15_00"); //In Ordnung, was soll ich für dich machen?
	AI_Output(self, hero, "Info_Mod_Ole_Vorbereitungen_02_01"); //Wir müssen die Mine wieder herrichten.
	AI_Output(self, hero, "Info_Mod_Ole_Vorbereitungen_02_02"); //Ich habe Bramrad, Granmar und Melcador damit beauftragt, allerdings geht das irgendwie nicht voran.
	AI_Output(self, hero, "Info_Mod_Ole_Vorbereitungen_02_03"); //Ich will, dass du ihnen bei ihren Aufgaben hilfst.

	Log_CreateTopic	(TOPIC_MOD_KG_VORBEREITUNGEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_KG_VORBEREITUNGEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_KG_VORBEREITUNGEN, "Die Mine muss wieder hergerichtet werden. Beauftragt dafür sind Bramrad, Granmar und Melcador, allerdings geht es bei ihnen scheinbar nicht voran. Ole will, dass ich mich der Sache annehme.");
};

INSTANCE Info_Mod_Ole_Vorbereitungen2 (C_INFO)
{
	npc		= Mod_1011_KGD_Ole_MT;
	nr		= 1;
	condition	= Info_Mod_Ole_Vorbereitungen2_Condition;
	information	= Info_Mod_Ole_Vorbereitungen2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe jedem der drei geholfen.";
};

FUNC INT Info_Mod_Ole_Vorbereitungen2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bramrad_Nahrungsversorgung2))
	&& (Npc_KnowsInfo(hero, Info_Mod_Bramrad_Nahrungsversorgung3))
	&& (Npc_KnowsInfo(hero, Info_Mod_Granmar_Trollholz2))
	&& (Npc_KnowsInfo(hero, Info_Mod_Melcador_Buddler7))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ole_Vorbereitungen2_Info()
{
	AI_Output(hero, self, "Info_Mod_Ole_Vorbereitungen2_15_00"); //Ich habe jedem der drei geholfen.
	AI_Output(self, hero, "Info_Mod_Ole_Vorbereitungen2_02_01"); //Somit können wir jetzt endlich mit der Begehung der Mine beginnen.
	AI_Output(self, hero, "Info_Mod_Ole_Vorbereitungen2_02_02"); //Du hast sehr gute Arbeit geleistet. Von nun an bekommst du deine Befehle direkt von Hymir.
	AI_Output(self, hero, "Info_Mod_Ole_Vorbereitungen2_02_03"); //Ach noch was: Diese Rüstung hast du dir somit auch verdient.

	CreateInvItems	(hero, SSLD_ARMOR, 1);

	B_ShowGivenThings	(ConcatStrings(SSLD_ARMOR.name, " erhalten"));

	B_SetTopicStatus	(TOPIC_MOD_KG_VORBEREITUNGEN, LOG_SUCCESS);

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Ole_ErzAnteil (C_INFO)
{
	npc		= Mod_1011_KGD_Ole_MT;
	nr		= 1;
	condition	= Info_Mod_Ole_ErzAnteil_Condition;
	information	= Info_Mod_Ole_ErzAnteil_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich bin hier, um meinen Anteil am Erz abzuholen.";
};

FUNC INT Info_Mod_Ole_ErzAnteil_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hymir_MineFertig))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ole_ErzAnteil_Info()
{
	AI_Output(hero, self, "Info_Mod_Ole_ErzAnteil_15_00"); //Ich bin hier, um meinen Anteil am Erz abzuholen.

	if (Wld_GetDay()-6 > Mod_KG_OleErz)
	{
		AI_Output(self, hero, "Info_Mod_Ole_ErzAnteil_02_01"); //Hier ist dein Anteil.

		B_GiveInvItems	(self, hero, ItMi_Nugget, 10+r_max(5));

		Mod_KG_OleErz = Wld_GetDay();
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Ole_ErzAnteil_02_02"); //Du hast diese Woche dein Erz bereits bekommen.
	};
};

INSTANCE Info_Mod_Ole_InGilde (C_INFO)
{
	npc		= Mod_1011_KGD_Ole_MT;
	nr		= 1;
	condition	= Info_Mod_Ole_InGilde_Condition;
	information	= Info_Mod_Ole_InGilde_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie bist du eigentlich zur königlichen Garde gekommen?";
};

FUNC INT Info_Mod_Ole_InGilde_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ole_Vorbereitungen2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ole_InGilde_Info()
{
	AI_Output(hero, self, "Info_Mod_Ole_InGilde_15_00"); //Wie bist du eigentlich zur königlichen Garde gekommen?
	AI_Output(self, hero, "Info_Mod_Ole_InGilde_02_01"); //Gute Frage. Heute hätte ich mich warscheinlich anders entschieden als damals, aber man muss mit seinen Entscheidungen leben.
	AI_Output(self, hero, "Info_Mod_Ole_InGilde_02_02"); //Ich war früher Stadtmiliz in Khorinis, bis sich der König entschloss im Minental die große Erzsuche zu starten. Also wurde ich der königlichen Garde zugeteilt und durfte hier im Minental auf Schwerverbrecher aufpassen.
	AI_Output(self, hero, "Info_Mod_Ole_InGilde_02_03"); //Zum Glück war ich, als die Barriere erschaffen wurde, bei einem Botengang in Khorinis. Sogut wie alle, die sich zu dieser Zeit im Minetal befanden, wurden von den Gefangenen abgeschlachtet.
	AI_Output(self, hero, "Info_Mod_Ole_InGilde_02_04"); //Mit den paar königliche Gardisten, die überlebt hatten, konnte der König natürlich nicht gewinnen, aber er brauchte eine Erzquelle, die nicht von der Gefühlslage der Gefangen abhing, und so gründeten wir dieses Lager in seinem Namen.
	AI_Output(self, hero, "Info_Mod_Ole_InGilde_02_05"); //Viel gebracht hat es aber nicht. Du siehst ja, wie schäbig hier alles ist.
	AI_Output(hero, self, "Info_Mod_Ole_InGilde_15_06"); //Warum hat der König euch nie mit zusätzlichen Truppen unterstützt?
	AI_Output(self, hero, "Info_Mod_Ole_InGilde_02_07"); //Na ja, das liegt wahrscheinlich zum einen am Krieg in Myrtana und zum anderen weiß er wahrscheinlich gar nicht mehr, dass wir leben.
	AI_Output(self, hero, "Info_Mod_Ole_InGilde_02_08"); //Er hat uns warscheinlich schon vor langer Zeit abgeschrieben.
};

INSTANCE Info_Mod_Ole_Pickpocket (C_INFO)
{
	npc		= Mod_1011_KGD_Ole_MT;
	nr		= 1;
	condition	= Info_Mod_Ole_Pickpocket_Condition;
	information	= Info_Mod_Ole_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Ole_Pickpocket_Condition()
{
	C_Beklauen	(79, ItMi_Gold, 23);
};

FUNC VOID Info_Mod_Ole_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Ole_Pickpocket);

	Info_AddChoice	(Info_Mod_Ole_Pickpocket, DIALOG_BACK, Info_Mod_Ole_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Ole_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Ole_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Ole_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Ole_Pickpocket);
};

FUNC VOID Info_Mod_Ole_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Ole_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Ole_Pickpocket);

		Info_AddChoice	(Info_Mod_Ole_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Ole_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Ole_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Ole_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Ole_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Ole_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Ole_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Ole_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Ole_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Ole_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Ole_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Ole_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Ole_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Ole_EXIT (C_INFO)
{
	npc		= Mod_1011_KGD_Ole_MT;
	nr		= 1;
	condition	= Info_Mod_Ole_EXIT_Condition;
	information	= Info_Mod_Ole_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Ole_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ole_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};