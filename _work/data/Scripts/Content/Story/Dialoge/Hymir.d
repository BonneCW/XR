INSTANCE Info_Mod_Hymir_Hi (C_INFO)
{
	npc		= Mod_1016_KGD_Hymir_MT;
	nr		= 1;
	condition	= Info_Mod_Hymir_Hi_Condition;
	information	= Info_Mod_Hymir_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hymir_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_LeibwacheHymir_DarfDurch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hymir_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Hymir_Hi_08_00"); //Du bist also derjenige, von dem hier alle reden. Du hast uns eine Menge Arbeit abgenommen.
	AI_Output(self, hero, "Info_Mod_Hymir_Hi_08_01"); //Aber noch können wir kein Erz fördern, da in der Mine diese merkwürdigen Steinmonster sind.
	AI_Output(self, hero, "Info_Mod_Hymir_Hi_08_02"); //Wir brauchen noch etwas Vorbereitungszeit, dann werden wir die Mine stürmen.
	AI_Output(self, hero, "Info_Mod_Hymir_Hi_08_03"); //Komm also später wieder.

	Log_CreateTopic	(TOPIC_MOD_KG_STEINMONSTER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_KG_STEINMONSTER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_KG_STEINMONSTER, "Hymir braucht noch etwas Zeit für die Vorbereitungen. Ich soll später wieder kommen, dann können wir die Mine stürmen.");
};

INSTANCE Info_Mod_Hymir_MineLos (C_INFO)
{
	npc		= Mod_1016_KGD_Hymir_MT;
	nr		= 1;
	condition	= Info_Mod_Hymir_MineLos_Condition;
	information	= Info_Mod_Hymir_MineLos_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hymir_MineLos_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hymir_Hi))
	&& (Kapitel >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hymir_MineLos_Info()
{
	AI_Output(self, hero, "Info_Mod_Hymir_MineLos_08_00"); //Wir sind nun soweit. In der Mine tummeln sich nach wie vor die Steinmonster.
	AI_Output(self, hero, "Info_Mod_Hymir_MineLos_08_01"); //Es liegt nun an dir diese zu vernichten und die Mine zu erschließen.
	AI_Output(self, hero, "Info_Mod_Hymir_MineLos_08_02"); //Geh zu Granmar, er wartet in der Mine auf dich. Er wird dir bei deiner Aufgabe helfen.

	B_LogEntry	(TOPIC_MOD_KG_STEINMONSTER, "Ich soll jetzt mit Granmar zusammen die Monster in der Mine beseitigen. Er wartet bereits in der Mine auf mich.");

	B_RemoveNpc	(Mod_1017_KGD_Granmar_MT);

	Mod_7537_KG_Minenwache_MT.aivar[AIV_PassGate] = TRUE;
};

INSTANCE Info_Mod_Hymir_MineFertig (C_INFO)
{
	npc		= Mod_1016_KGD_Hymir_MT;
	nr		= 1;
	condition	= Info_Mod_Hymir_MineFertig_Condition;
	information	= Info_Mod_Hymir_MineFertig_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Mine ist jetzt frei von Monster und wieder in Betrieb.";
};

FUNC INT Info_Mod_Hymir_MineFertig_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Granmar_VM_Trent2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hymir_MineFertig_Info()
{
	AI_Output(hero, self, "Info_Mod_Hymir_MineFertig_15_00"); //Die Mine ist jetzt frei von Monster und wieder in Betrieb.
	AI_Output(self, hero, "Info_Mod_Hymir_MineFertig_08_01"); //Schön zu hören, damit hast du es geschafft, in die kleine Reihe der Erzfürsten aufgenommen zu werden.
	AI_Output(self, hero, "Info_Mod_Hymir_MineFertig_08_02"); //Und glaub mir, dass haben nur sehr wenige in so kurzer Zeit geschafft.
	AI_Output(self, hero, "Info_Mod_Hymir_MineFertig_08_03"); //Du bestitzt jetzt somit 10% des Einkommens der Mine. Die Summe kannst du dir jede Woche bei Ole abholen.

	B_GiveInvItems	(self, hero, ItMi_Nugget, 5);

	AI_Output(self, hero, "Info_Mod_Hymir_MineFertig_08_04"); //Natürlich bekommst du jetzt auch eine neue Rüstung.

	CreateInvItems	(hero, ItAr_Erzbaron_Blau, 1);

	B_ShowGivenThings	("Königliche Erzfürstenrüstung erhalten");

	AI_Output(self, hero, "Info_Mod_Hymir_MineFertig_08_05"); //Ach, übrigens, der Paladin war kurz vor dir bei mir. Er meinte, er verdanke dir sein Leben.
	AI_Output(self, hero, "Info_Mod_Hymir_MineFertig_08_06"); //Gemeinsam mit einer Miliz-Truppe wurde er von Lord Andre persönlich ins Minental geschickt. Sie sollen dort die Orks ausspionieren.
	AI_Output(self, hero, "Info_Mod_Hymir_MineFertig_08_07"); //Lord Andre wollte übrigens auch noch mal mit dir reden, aber ich denke das dürfte noch Zeit haben.

	B_SetTopicStatus	(TOPIC_MOD_KG_STEINMONSTER, LOG_SUCCESS);

	B_GivePlayerXP	(500);

	Mod_KG_OleErz = Wld_GetDay();
};

INSTANCE Info_Mod_Hymir_Trent (C_INFO)
{
	npc		= Mod_1016_KGD_Hymir_MT;
	nr		= 1;
	condition	= Info_Mod_Hymir_Trent_Condition;
	information	= Info_Mod_Hymir_Trent_Info;
	permanent	= 0;
	important	= 0;
	description	= "Sieht so aus, als hätte ich noch eine Mine erschlossen.";
};

FUNC INT Info_Mod_Hymir_Trent_Condition()
{
	if (Mod_KG_OrkTot == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hymir_Trent_Info()
{
	AI_Output(hero, self, "Info_Mod_Hymir_Trent_15_00"); //Sieht so aus, als hätte ich noch eine Mine erschlossen.
	AI_Output(self, hero, "Info_Mod_Hymir_Trent_08_01"); //Was ... wir kommen ja noch nicht mal mit der einen nach. Vielleicht schickt uns Lord Andre ja jetzt ein paar neue Leute.
	AI_Output(self, hero, "Info_Mod_Hymir_Trent_08_02"); //Egal, das muss gefeiert werden. Geh zu Melcador und lass dir eine Erzwaffe und ein frisches Bier geben.
	AI_Output(self, hero, "Info_Mod_Hymir_Trent_08_03"); //Für dich ist jetzt nicht mehr zu tun. Lehn dich zurück und genieß das Leben, so wie ich!

	B_SetTopicStatus	(TOPIC_MOD_KG_RITUAL, LOG_SUCCESS);

	B_GivePlayerXP	(300);
};

INSTANCE Info_Mod_Hymir_Eroberung_06 (C_INFO)
{
	npc		= Mod_1016_KGD_Hymir_MT;
	nr		= 1;
	condition	= Info_Mod_Hymir_Eroberung_06_Condition;
	information	= Info_Mod_Hymir_Eroberung_06_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hymir_Eroberung_06_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Mod_Dexter_Eroberung_05))
	&& (!Npc_IsInState(Mod_761_BDT_Dexter_MT, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hymir_Eroberung_06_Info()
{
	AI_Output(self, hero, "Info_Mod_Hymir_Eroberung_06_08_00"); //... und wir in das Lager ein ...
};

INSTANCE Info_Mod_Hymir_Treue (C_INFO)
{
	npc		= Mod_1016_KGD_Hymir_MT;
	nr		= 1;
	condition	= Info_Mod_Hymir_Treue_Condition;
	information	= Info_Mod_Hymir_Treue_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hymir_Treue_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hagen_AndreVermaechtnis11))
	&& (Npc_HasItems(hero, ItWr_HagenForHymir) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hymir_Treue_Info()
{
	AI_Output(self, hero, "Info_Mod_Hymir_Treue_08_00"); //Eine Botschaft von Hagen? Ich bin gespannt, was der Aufschneider von mir möchte.

	B_GiveInvItems	(hero, self, ItWr_HagenForHymir, 1);

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Hymir_Treue_08_01"); //Ha, dass ich nicht lache. Jetzt, wo ihm der Arsch brennt sollen wir für ihn die Kohlen aus dem Feuer holen.
	AI_Output(self, hero, "Info_Mod_Hymir_Treue_08_02"); //Alles was recht ist. Und wie ... du bist der neue Hauptmann? Das wird ja immer schöner.
	AI_Output(self, hero, "Info_Mod_Hymir_Treue_08_03"); //Was ist mit Andre ... dem einzigen, der ein bisschen Anstand und Rückgrat hatte?
	AI_Output(hero, self, "Info_Mod_Hymir_Treue_15_04"); //Er ist tot. Er opferte sich für die Stadt, als diese bedroht wurde.
	AI_Output(self, hero, "Info_Mod_Hymir_Treue_08_05"); //(schockiert) Was ... er ist tot? Für die Stadt ...?

	AI_TurnAway	(hero, self);

	AI_Output(hero, self, "Info_Mod_Hymir_Treue_15_06"); //(zu sich selbst) Vielleicht gibt ihm das jetzt zu denken?

	AI_TurnToNpc	(hero, self);

	AI_Output(self, hero, "Info_Mod_Hymir_Treue_08_07"); //Geopfert? (bäumt sich auf) Erzähl mir doch nichts.
	AI_Output(self, hero, "Info_Mod_Hymir_Treue_08_08"); //Hagen hat ihn bestimmt als Bauernopfer benutzt, um sich selbst anschließend als edlen Retter hinzustellen.
	AI_Output(self, hero, "Info_Mod_Hymir_Treue_08_09"); //Und jetzt sollen auch wir für ihn den Kopf hinhalten. Da hört sich doch alles auf.
	AI_Output(self, hero, "Info_Mod_Hymir_Treue_08_10"); //Nicht mal den Anstand selbst zu erscheinen hat er, sondern schickt einen Laufburschen.
	AI_Output(self, hero, "Info_Mod_Hymir_Treue_08_11"); //Nein ... und jetzt geh mir besser aus den Augen.

	AI_GotoWP	(hero, "MC_WA_4");

	AI_Output(hero, self, "Info_Mod_Hymir_Treue_15_12"); //Das ist nicht ganz so gut gelaufen. Aber ... stimmt, die Spruchrolle.
	AI_Output(self, hero, "DEFAULT"); //

	AI_StopProcessInfos	(self);

};

INSTANCE Info_Mod_Hymir_Treue2 (C_INFO)
{
	npc		= Mod_1016_KGD_Hymir_MT;
	nr		= 1;
	condition	= Info_Mod_Hymir_Treue2_Condition;
	information	= Info_Mod_Hymir_Treue2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Hymir_Treue2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hagen_MT_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hymir_Treue2_Info()
{
	var c_npc Hymir; Hymir = Hlp_GetNpc(Mod_1016_KGD_Hymir_MT);
	var c_npc Hagen; Hagen = Hlp_GetNpc(Mod_7698_PAL_Hagen_MT);

	TRIA_Invite(Hagen);
	TRIA_Start();

	TRIA_Next(Hymir);

	AI_TurnToNpc	(Hymir, Hagen);
	AI_TurnToNpc	(Hagen, Hymir);

	AI_Output(self, hero, "Info_Mod_Hymir_Treue2_08_00"); //(verblüfft) Ist es möglich? Hagen, du hier!?

	TRIA_Next(Hagen);

	AI_Output(self, hero, "Info_Mod_Hymir_Treue2_04_01"); //Ja, da mein Anliegen von großer Trageweite für ganz Khorinis ist, habe ich mich persönlich herbegeben, um die Sache mit dir zu klären.

	TRIA_Next(Hymir);

	AI_Output(self, hero, "Info_Mod_Hymir_Treue2_08_02"); //Ich ... (fängt sich wieder) ... ja, ich habe dein Schreiben empfangen.
	AI_Output(self, hero, "Info_Mod_Hymir_Treue2_08_03"); //Und auch, wenn du hier vor mir stehst, sehe ich keinerlei Veranlassung dazu, darauf einzugehen.
	AI_Output(self, hero, "Info_Mod_Hymir_Treue2_08_04"); //Du weißt selbst am besten, dass wir unseren Aufenthalt in der Kolonie dir zu verdanken haben.
	AI_Output(self, hero, "Info_Mod_Hymir_Treue2_08_05"); //(streng) Und dass Andre unter deinem Kommando sein Leben ließ, macht den Sachverhalt nicht gerade besser.

	TRIA_Next(Hagen);

	AI_Output(self, hero, "Info_Mod_Hymir_Treue2_04_06"); //Andre hat sich selbstlos geopfert, da er keine andere Möglichkeit sah, die Stadt vor einem übermächtigen Feind zu retten.
	AI_Output(self, hero, "Info_Mod_Hymir_Treue2_04_07"); //Aber hier, lies selbst.

	B_ShowGivenThings	("Lord Hagen gibt Hymir Andres Testament");

	TRIA_Next(Hymir);

	B_UseFakeScroll	();

	AI_Output(self, hero, "Info_Mod_Hymir_Treue2_08_08"); //(liest) Roboter einzuschmelzen […] mordender Maschine […] denen sie das Leben nahm […] niemand ohne Schuld ist ...
	AI_Output(self, hero, "Info_Mod_Hymir_Treue2_08_09"); //Hmm, dies ist tatsächlich Andres Handschrift ... und es scheint zu stimmen, was ihr mir über sein Schicksal berichtet habt.
	AI_Output(self, hero, "Info_Mod_Hymir_Treue2_08_10"); //Im Lichte dieser Ereignisse will ich mich nicht mehr grundsätzlich gegen eine Zusammenarbeit mit der Stadt stellen.
	AI_Output(self, hero, "Info_Mod_Hymir_Treue2_08_11"); //Ich tue es aber gewiss nicht, um dir einen Gefallen zu tun, Hagen, sondern um des Beispieles Willen, das Andre uns gegeben hat.

	TRIA_Next(Hagen);

	AI_Output(self, hero, "Info_Mod_Hymir_Treue2_04_12"); //Hab Dank. In der aktuellen Situation sind Stadt und Königreich auf Männer wie euch angewiesen.
	AI_Output(self, hero, "Info_Mod_Hymir_Treue2_04_13"); //Ich habe hier einige Spruchrollen, welche eine schnelle Reise zwischen dem Pass und der Stadt ermöglichen.

	TRIA_Next(Hymir);

	AI_Output(self, hero, "Info_Mod_Hymir_Treue2_08_14"); //Gut ... zur weiteren Besprechung werde ich mich mit dir in die Stadt begeben.
    
	TRIA_Finish();

	AI_StopProcessInfos	(self);

	B_LogEntry	(TOPIC_MOD_MILIZ_TREUE, "Hymir hat sich mit Lord Hagen in die Stadt teleportiert. Ich sollte man bei Zeiten dort vorbeischauen.");

};

INSTANCE Info_Mod_Hymir_Pickpocket (C_INFO)
{
	npc		= Mod_1016_KGD_Hymir_MT;
	nr		= 1;
	condition	= Info_Mod_Hymir_Pickpocket_Condition;
	information	= Info_Mod_Hymir_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_180;
};

FUNC INT Info_Mod_Hymir_Pickpocket_Condition()
{
	C_Beklauen	(174, ItMi_Gold, 94);
};

FUNC VOID Info_Mod_Hymir_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Hymir_Pickpocket);

	Info_AddChoice	(Info_Mod_Hymir_Pickpocket, DIALOG_BACK, Info_Mod_Hymir_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Hymir_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Hymir_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Hymir_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Hymir_Pickpocket);
};

FUNC VOID Info_Mod_Hymir_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Hymir_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Hymir_Pickpocket);

		Info_AddChoice	(Info_Mod_Hymir_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Hymir_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Hymir_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Hymir_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Hymir_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Hymir_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Hymir_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Hymir_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Hymir_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Hymir_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Hymir_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Hymir_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Hymir_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Hymir_EXIT (C_INFO)
{
	npc		= Mod_1016_KGD_Hymir_MT;
	nr		= 1;
	condition	= Info_Mod_Hymir_EXIT_Condition;
	information	= Info_Mod_Hymir_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Hymir_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hymir_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};