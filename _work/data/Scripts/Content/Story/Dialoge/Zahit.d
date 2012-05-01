INSTANCE Info_Mod_Zahit_Amir (C_INFO)
{
	npc		= Mod_7100_ASS_Zahit_NW;
	nr		= 1;
	condition	= Info_Mod_Zahit_Amir_Condition;
	information	= Info_Mod_Zahit_Amir_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Zahit_Amir_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Amir_AtVersteck))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Zahit_Amir_Info()
{
	AI_Output(self, hero, "Info_Mod_Zahit_Amir_13_00"); //(überrascht) Was willst Du denn hier? Hat dich Amir etwa hieher gebracht?
	AI_Output(hero, self, "Info_Mod_Zahit_Amir_15_01"); //Ja, das hat er.
	AI_Output(self, hero, "Info_Mod_Zahit_Amir_13_02"); //(wütend) Was bildet sich der Kerl denn überhaupt ein?
	AI_Output(self, hero, "Info_Mod_Zahit_Amir_13_03"); //Nur, weil er in der Stadt ist, heißt das noch lange nicht, dass er unsere Regeln missachten und wildfremde Leute hieher schleifen kann.
	AI_Output(hero, self, "Info_Mod_Zahit_Amir_15_04"); //Bleib Locker. Ich habe Amir bei einem Problem geholfen und er bot mir daraufhin an, mich den Assassinen anzuschließen.
	AI_Output(self, hero, "Info_Mod_Zahit_Amir_13_05"); //(lauernd) Aha, du hast Amir geholfen. Soso mein Freund, was musstest du tun? Fleischwanzen erlegen?
	AI_Output(hero, self, "Info_Mod_Zahit_Amir_15_06"); //Ich habe für Amir einen nervigen Bürger der Stadt bei einem Attentat erledigt und von diesem einen Blutkelch gestohlen.
	AI_Output(self, hero, "Info_Mod_Zahit_Amir_13_07"); //(staunt) Du als Schwächling hast solche Begabungen? Das spricht für dich, das muss man sagen.
	AI_Output(hero, self, "Info_Mod_Zahit_Amir_15_08"); //Was ist jetzt, kann ich mich euch anschließen?
	AI_Output(self, hero, "Info_Mod_Zahit_Amir_13_09"); //Nicht so hastig, mein Freund. Du hast zwar Amir überzeugen können, doch um überhaupt ein Assassine werden zu können, musst du noch einiges erledigen.
	AI_Output(self, hero, "Info_Mod_Zahit_Amir_13_10"); //Da liegt noch ein weiter Weg vor dir, mein Junge.
};

INSTANCE Info_Mod_Zahit_Aufnahme (C_INFO)
{
	npc		= Mod_7100_ASS_Zahit_NW;
	nr		= 1;
	condition	= Info_Mod_Zahit_Aufnahme_Condition;
	information	= Info_Mod_Zahit_Aufnahme_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie kann ich mich euch anschließen?";
};

FUNC INT Info_Mod_Zahit_Aufnahme_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Zahit_Amir))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Zahit_Aufnahme_Info()
{
	AI_Output(hero, self, "Info_Mod_Zahit_Aufnahme_15_00"); //Wie kann ich mich euch anschließen?
	AI_Output(self, hero, "Info_Mod_Zahit_Aufnahme_13_01"); //Nun, um zu einem Assassinen werden zu können bedarf es einer sehr wichtigen Sache.
	AI_Output(hero, self, "Info_Mod_Zahit_Aufnahme_15_02"); //Die wäre?
	AI_Output(self, hero, "Info_Mod_Zahit_Aufnahme_13_03"); //Vertrauen.
	AI_Output(hero, self, "Info_Mod_Zahit_Aufnahme_15_04"); //Aha. Und weiter?
	AI_Output(self, hero, "Info_Mod_Zahit_Aufnahme_13_05"); //Um ein Mitglied des Lagers werden zu können, musst du zuerst das Vertrauen der niederen Assassinenmitgliedern erwerben, den sogenannten Gaunern.
	AI_Output(self, hero, "Info_Mod_Zahit_Aufnahme_13_06"); //Ihr Viertel liegt hinter dieser Tür.
	AI_Output(self, hero, "Info_Mod_Zahit_Aufnahme_13_07"); //Dahinter kommt dann das Viertel der Krieger und danach das der Magier und des Hohen Rates.
	AI_Output(self, hero, "Info_Mod_Zahit_Aufnahme_13_08"); //Um die zwei letzten Viertel überhaupt betreten zu können, musst du jedoch ein Gauner sein.
	AI_Output(self, hero, "Info_Mod_Zahit_Aufnahme_13_09"); //Wenn du diesen Weg, der sehr schwirieg sein wird, tatsächlich einschlägst, dann hast du die Möglichkeit dich den Magiern oder den Kriegern anzuschließen.
	AI_Output(self, hero, "Info_Mod_Zahit_Aufnahme_13_10"); //Doch vorher wirst du dich dafür schweren Prüfungen unterziehen müssen.
	AI_Output(hero, self, "Info_Mod_Zahit_Aufnahme_15_11"); //Das hört sich sehr motivierend an.
	AI_Output(self, hero, "Info_Mod_Zahit_Aufnahme_13_12"); //(streng) Sei froh, dass du überhaupt die Möglichkeit bekommst, dich uns anzuschließen.
	AI_Output(self, hero, "Info_Mod_Zahit_Aufnahme_13_13"); //Nur wenige Außenstehende haben bisher diese Ehre erhalten, also zügle dein freches Mundwerk.
	AI_Output(self, hero, "Info_Mod_Zahit_Aufnahme_13_14"); //Wenn du den Magiern oder Kriegern so begegnest, werden sie dir Manieren beibringen.
	AI_Output(hero, self, "Info_Mod_Zahit_Aufnahme_15_15"); //(trocken) Ich werde es mir merken.
	AI_Output(self, hero, "Info_Mod_Zahit_Aufnahme_13_16"); //Gut. Also du kannst jetzt das erste Viertel betreten.
	AI_Output(self, hero, "Info_Mod_Zahit_Aufnahme_13_17"); //Sprich mit den Gauern und erledige ihre Aufgaben, um aufgenommen zu werden.
	AI_Output(self, hero, "Info_Mod_Zahit_Aufnahme_13_18"); //Wenn du alle überzeugt hast, bekommst du die Chance mit den Magiern und Kriegern zu reden.
	AI_Output(self, hero, "Info_Mod_Zahit_Aufnahme_13_19"); //Der Anführer ist Obergauner Shakir. Rede mit ihm, um Weiteres zu erfahren.
	AI_Output(hero, self, "Info_Mod_Zahit_Aufnahme_15_20"); //Danke, das werde ich tun.
	AI_Output(self, hero, "Info_Mod_Zahit_Aufnahme_13_21"); //Und mach keinen Ärger, dass wir uns da richtig verstanden haben!
	AI_Output(hero, self, "Info_Mod_Zahit_Aufnahme_15_22"); //Das haben wir, nur keine Sorge.

	Log_CreateTopic	(TOPIC_MOD_ASS_VERTRAUEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ASS_VERTRAUEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ASS_VERTRAUEN, "Ich habe mit der Wache Zahit gesprochen, die mit einem Kollegen den Eingang zum Versteck der Assassinen bewacht. Er meinte, um ein Mitglied des Lagers zu werden, ein sogenannter Gauner, muss ich das Vertrauen ebenjener Assasinen erlangen. Das geht nur, indem ich wohl wieder den Laufburschen spiele. Um genaueres erfahren zu können soll ich im Lager mit dem Anführer der Gauner, Shakir, sprechen. Da bin ich aber gespannt.");
};

INSTANCE Info_Mod_Zahit_Assassinengold (C_INFO)
{
	npc		= Mod_7100_ASS_Zahit_NW;
	nr		= 1;
	condition	= Info_Mod_Zahit_Assassinengold_Condition;
	information	= Info_Mod_Zahit_Assassinengold_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Zahit_Assassinengold_Condition()
{
	if (Mod_ASS_Assassinengold == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Zahit_Assassinengold_Info()
{
	AI_Output(self, hero, "Info_Mod_Zahit_Assassinengold_13_00"); //Da bist du endlich. Alle warten auf dich. Mach hin.
	AI_Output(hero, self, "Info_Mod_Zahit_Assassinengold_15_01"); //Etwas Respekt vor einem Magier, Bursche!
	AI_Output(self, hero, "Info_Mod_Zahit_Assassinengold_13_02"); //Tschuldigung. Vor Kurzem warst du noch ein Nichts.
	AI_Output(hero, self, "Info_Mod_Zahit_Assassinengold_15_03"); //Jedem das Seine. Mach Platz.
};

INSTANCE Info_Mod_Zahit_PosWechsel (C_INFO)
{
	npc		= Mod_7100_ASS_Zahit_NW;
	nr		= 1;
	condition	= Info_Mod_Zahit_PosWechsel_Condition;
	information	= Info_Mod_Zahit_PosWechsel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was machst du denn hier?";
};

FUNC INT Info_Mod_Zahit_PosWechsel_Condition()
{
	if (Mod_ASS_PosWechsel == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Zahit_PosWechsel_Info()
{
	AI_Output(hero, self, "Info_Mod_Zahit_PosWechsel_15_00"); //Was machst du denn hier?
	AI_Output(self, hero, "Info_Mod_Zahit_PosWechsel_13_01"); //Habe Amir als Beobachter abgelöst.
	AI_Output(hero, self, "Info_Mod_Zahit_PosWechsel_15_02"); //Und was ist so wichtig?
	AI_Output(self, hero, "Info_Mod_Zahit_PosWechsel_13_03"); //Du musst sofort zu Mustafa gehen. Scheint wichtig zu sein.
	AI_Output(hero, self, "Info_Mod_Zahit_PosWechsel_15_04"); //Da bin ich aber gespannt.
};

INSTANCE Info_Mod_Zahit_Gefunden (C_INFO)
{
	npc		= Mod_7100_ASS_Zahit_NW;
	nr		= 1;
	condition	= Info_Mod_Zahit_Gefunden_Condition;
	information	= Info_Mod_Zahit_Gefunden_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie kommt es, dass ihr bisher noch nicht endeckt worden seit?";
};

FUNC INT Info_Mod_Zahit_Gefunden_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Zahit_Amir))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Zahit_Gefunden_Info()
{
	AI_Output(hero, self, "Info_Mod_Zahit_Gefunden_15_00"); //Wie kommt es, dass ihr bisher noch nicht endeckt worden seid?
	AI_Output(self, hero, "Info_Mod_Zahit_Gefunden_13_01"); //Wie meinst du das?
	AI_Output(hero, self, "Info_Mod_Zahit_Gefunden_15_02"); //Ich glaube kaum, dass bisher noch niemand diese Höhle erforscht hat.
	AI_Output(self, hero, "Info_Mod_Zahit_Gefunden_13_03"); //Das ist bisher selten passiert und die, die hieher kamen, konnten es niemandem mehr berichten.
	AI_Output(hero, self, "Info_Mod_Zahit_Gefunden_15_04"); //Also habt ihr sie getötet?
	AI_Output(self, hero, "Info_Mod_Zahit_Gefunden_13_05"); //Ja, wir wollen doch nicht das Paladine und Milizen hieher anrücken.
	AI_Output(hero, self, "Info_Mod_Zahit_Gefunden_15_06"); //Klar, das wäre nicht gut.
};

INSTANCE Info_Mod_Zahit_Hergekommen (C_INFO)
{
	npc		= Mod_7100_ASS_Zahit_NW;
	nr		= 1;
	condition	= Info_Mod_Zahit_Hergekommen_Condition;
	information	= Info_Mod_Zahit_Hergekommen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie seid ihr hierher gekommen?";
};

FUNC INT Info_Mod_Zahit_Hergekommen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Zahit_Amir))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Zahit_Hergekommen_Info()
{
	AI_Output(hero, self, "Info_Mod_Zahit_Hergekommen_15_00"); //Wie seid ihr hierher gekommen?
	AI_Output(self, hero, "Info_Mod_Zahit_Hergekommen_13_01"); //Auf dem Festland herrscht ja bekanntlich das vollkommene Chaos.
	AI_Output(hero, self, "Info_Mod_Zahit_Hergekommen_15_02"); //Ja, davon habe ich auch gehört.
	AI_Output(self, hero, "Info_Mod_Zahit_Hergekommen_13_03"); //Wir haben es dort nicht mehr ausgehalten. Deshalb beschlossen unsere weisen Anführer diesem Wahnsinn zu entfliehen.
	AI_Output(self, hero, "Info_Mod_Zahit_Hergekommen_13_04"); //Mittels eines starken Teleportzaubers haben es die Magier von uns geschafft uns alle nach Khorinis zu telepotieren.
	AI_Output(self, hero, "Info_Mod_Zahit_Hergekommen_13_05"); //Wir suchten nach einem Versteck und fanden diese Höhle hier unbenutzt vor.
	AI_Output(self, hero, "Info_Mod_Zahit_Hergekommen_13_06"); //Wir beschlossen hier zu bleiben und seither ist dies unser Lager.
	AI_Output(self, hero, "Info_Mod_Zahit_Hergekommen_13_07"); //Wir wollen aber in nächster Zeit versuchen, unseren Einfluss auszuweiten.
	AI_Output(hero, self, "Info_Mod_Zahit_Hergekommen_15_08"); //Das hört sich alles sehr abenteuerlich an. Interessant zu erfahren wie ihr hiehrher kamt. Danke für die Infos.
	AI_Output(self, hero, "Info_Mod_Zahit_Hergekommen_13_09"); //Keine Ursache.
};

INSTANCE Info_Mod_Zahit_Pickpocket (C_INFO)
{
	npc		= Mod_7100_ASS_Zahit_NW;
	nr		= 1;
	condition	= Info_Mod_Zahit_Pickpocket_Condition;
	information	= Info_Mod_Zahit_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_100;
};

FUNC INT Info_Mod_Zahit_Pickpocket_Condition()
{
	C_Beklauen	(79, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Zahit_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Zahit_Pickpocket);

	Info_AddChoice	(Info_Mod_Zahit_Pickpocket, DIALOG_BACK, Info_Mod_Zahit_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Zahit_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Zahit_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Zahit_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Zahit_Pickpocket);
};

FUNC VOID Info_Mod_Zahit_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Zahit_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Zahit_Pickpocket);

		Info_AddChoice	(Info_Mod_Zahit_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Zahit_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Zahit_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Zahit_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Zahit_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Zahit_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Zahit_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Zahit_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Zahit_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Zahit_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Zahit_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Zahit_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Zahit_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Zahit_EXIT (C_INFO)
{
	npc		= Mod_7100_ASS_Zahit_NW;
	nr		= 1;
	condition	= Info_Mod_Zahit_EXIT_Condition;
	information	= Info_Mod_Zahit_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Zahit_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Zahit_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};