INSTANCE Info_Mod_Roman_REL_Hi (C_INFO)
{
	npc		= Mod_7492_OUT_Roman_REL;
	nr		= 1;
	condition	= Info_Mod_Roman_REL_Hi_Condition;
	information	= Info_Mod_Roman_REL_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Roman_REL_Hi_Condition()
{
	if (Mod_EndresIndizien >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Roman_REL_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Roman_REL_Hi_08_00"); //Warte mal!
	AI_Output(hero, self, "Info_Mod_Roman_REL_Hi_15_01"); //Was ist?
	AI_Output(self, hero, "Info_Mod_Roman_REL_Hi_08_02"); //(empört) Ich habe gerade gehört, dass die Tatwaffe eine Spitzhacke gewesen sein soll!
	AI_Output(hero, self, "Info_Mod_Roman_REL_Hi_15_03"); //Das stimmt.
	AI_Output(self, hero, "Info_Mod_Roman_REL_Hi_08_04"); //Da fällt mir doch glatt eine kleine Begegnung auf dem Heimweg vor ein paar Tagen ein.
	AI_Output(self, hero, "Info_Mod_Roman_REL_Hi_08_05"); //Es war schon dunkel, da spricht mich von der Seite aus einer Gasse eine Stimme an, ob ich ihr meine Hacke leihen könne.
	AI_Output(self, hero, "Info_Mod_Roman_REL_Hi_08_06"); //Die hatte ich dabei, weil ich sie schleifen wollte. Eigentlich nicht, sage ich, was willst du damit?
	AI_Output(self, hero, "Info_Mod_Roman_REL_Hi_08_07"); //Nur die Zeit vertreiben, sagt die Stimme. Morgen früh hast du sie wieder.
	AI_Output(self, hero, "Info_Mod_Roman_REL_Hi_08_08"); //Und dann kam 'ne Hand aus dem Dunkeln und hat mir Gold in die Hand gedrückt.
	AI_Output(self, hero, "Info_Mod_Roman_REL_Hi_08_09"); //Also habe ich ihm die Hacke geliehen.
	AI_Output(self, hero, "Info_Mod_Roman_REL_Hi_08_10"); //Am nächsten Morgen lehnte sie an meinem Haus, und zwar blitzblank geputzt und geschliffen.
	AI_Output(self, hero, "Info_Mod_Roman_REL_Hi_08_11"); //Da habe ich mir dann keine weiteren Gedanken gemacht.
	AI_Output(self, hero, "Info_Mod_Roman_REL_Hi_08_12"); //Und jetzt hör ich, dass dieser Scheißkerl mit der Hacke den Verdacht auf uns Bergleute lenken wollte!
	AI_Output(hero, self, "Info_Mod_Roman_REL_Hi_15_13"); //Kerl?
	AI_Output(self, hero, "Info_Mod_Roman_REL_Hi_08_14"); //Ja, 'n Kerl. Hat seine Stimme wahrscheinlich verstellt, aber so tief kommt keine Frau.
	AI_Output(self, hero, "Info_Mod_Roman_REL_Hi_08_15"); //Außerdem hatte er 'ne haarige Pranke.
	AI_Output(hero, self, "Info_Mod_Roman_REL_Hi_15_16"); //Danke, das hilft mir weiter.
	AI_Output(self, hero, "Info_Mod_Roman_REL_Hi_08_17"); //Er soll hängen!

	B_LogEntry	(TOPIC_MOD_KHORATA_ENDRES, "Roman hat dem Mörder seine Spitzhacke geliehen. Er ist sich sicher, dass wir es mit einem Mann zu tun haben.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");
};

INSTANCE Info_Mod_Roman_REL_Unruhen (C_INFO)
{
	npc		= Mod_7492_OUT_Roman_REL;
	nr		= 1;
	condition	= Info_Mod_Roman_REL_Unruhen_Condition;
	information	= Info_Mod_Roman_REL_Unruhen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Roman_REL_Unruhen_Condition()
{
	if (Kapitel >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Roman_REL_Unruhen_Info()
{
	AI_Output(self, hero, "Info_Mod_Roman_REL_Unruhen_08_00"); //(aggressiv) Was willst du?

	if (Npc_KnowsInfo(hero, Info_Mod_August_Unruhen))
	{
		AI_Output(hero, self, "Info_Mod_Roman_REL_Unruhen_15_01"); //Ich soll dafür sorgen, dass Khorata einen neuen Stadthalter bekommt, damit die Friedensverhandlungen mit euch fortgesetzt werden.
		AI_Output(self, hero, "Info_Mod_Roman_REL_Unruhen_08_02"); //Was, Anselm ist abgehauen? (lacht dreckig) Das sieht dem Arsch ähnlich.
		AI_Output(self, hero, "Info_Mod_Roman_REL_Unruhen_08_03"); //Und du sollst einen Nachfolger bestimmen? Du Würstchen?
		AI_Output(self, hero, "Info_Mod_Roman_REL_Unruhen_08_04"); //Aber wenn du's wissen willst: Theodorus ist der einzige, den wir als Stadthalter akzeptieren würden.
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Roman_REL_Unruhen_15_05"); //Was ist denn überhaupt los?
		AI_Output(self, hero, "Info_Mod_Roman_REL_Unruhen_08_06"); //Nichts, was dich zu interessieren braucht. (hustet) Wir Buddler fordern nur unser Recht.
		AI_Output(hero, self, "Info_Mod_Roman_REL_Unruhen_15_07"); //Und dafür geht ihr über Leichen?
		AI_Output(self, hero, "Info_Mod_Roman_REL_Unruhen_08_08"); //Hör mal, du hast keine Ahnung, worum es geht, aber willst dich trotzdem einmischen?
		AI_Output(hero, self, "Info_Mod_Roman_REL_Unruhen_15_09"); //Irgendjemand muss ja verhindern, dass es noch mehr Tote gibt.
		AI_Output(self, hero, "Info_Mod_Roman_REL_Unruhen_08_10"); //Es hätte nie dazu kommen müssen. (hustet)
		AI_Output(self, hero, "Info_Mod_Roman_REL_Unruhen_08_11"); //(ungeduldig) So, die Sprechstunde ist vorbei. Sei friedlich und zisch ab.
	};
};

INSTANCE Info_Mod_Roman_REL_Unruhen2 (C_INFO)
{
	npc		= Mod_7492_OUT_Roman_REL;
	nr		= 1;
	condition	= Info_Mod_Roman_REL_Unruhen2_Condition;
	information	= Info_Mod_Roman_REL_Unruhen2_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Roman_REL_Unruhen2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wendel_Unruhen4))
	&& (Npc_RefuseTalk(self) == FALSE)
	&& (Mod_REL_WendelS == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Roman_REL_Unruhen2_Info()
{
	AI_Output(self, hero, "Info_Mod_Roman_REL_Unruhen2_08_00"); //Schaut her, da will einer nicht verstehen, dass er hier nichts zu suchen hat.
	AI_Output(self, hero, "Info_Mod_Roman_REL_Unruhen2_08_01"); //Was hast du hier verloren?

	Info_ClearChoices	(Info_Mod_Roman_REL_Unruhen2);

	Info_AddChoice	(Info_Mod_Roman_REL_Unruhen2, "Ich will gleich weiter.", Info_Mod_Roman_REL_Unruhen2_B);
	Info_AddChoice	(Info_Mod_Roman_REL_Unruhen2, "Würdest du die Bergleute bei Friedensgesprächen vertreten?", Info_Mod_Roman_REL_Unruhen2_A);
};

FUNC VOID Info_Mod_Roman_REL_Unruhen2_B()
{
	AI_Output(hero, self, "Info_Mod_Roman_REL_Unruhen2_B_15_00"); //Ich will gleich weiter.
	AI_Output(self, hero, "DEFAULT"); //

	Info_ClearChoices	(Info_Mod_Roman_REL_Unruhen2);

	Npc_SetRefuseTalk	(self, 30);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Roman_REL_Unruhen2_A()
{
	AI_Output(hero, self, "Info_Mod_Roman_REL_Unruhen2_A_15_00"); //Würdest du die Bergleute bei Friedensgesprächen vertreten?
	AI_Output(self, hero, "Info_Mod_Roman_REL_Unruhen2_A_08_01"); //Friedensgespräche, so so. (spöttisch) Da lasst ihr euch ja zu etwas herab.
	AI_Output(hero, self, "Info_Mod_Roman_REL_Unruhen2_A_15_02"); //Khorata hat einen neuen Stadthalter, Wendel. Er will euch entgegen kommen.
	AI_Output(self, hero, "Info_Mod_Roman_REL_Unruhen2_A_08_03"); //(erregt) Wendel?! Na, der kann was erleben!
	AI_Output(hero, self, "Info_Mod_Roman_REL_Unruhen2_A_15_04"); //Du kommst also mit?
	AI_Output(self, hero, "Info_Mod_Roman_REL_Unruhen2_A_08_05"); //Und wenn's nur dazu gut ist, ihm die Fresse zu polieren! Setz dich in Bewegung!

	B_LogEntry	(TOPIC_MOD_KHORATA_UNRUHEN, "Roman scheint auf Gewalt aus zu sein. Ich muss in seinem Gespräch mit Anselm aufpassen, dass es nicht eskaliert.");

	Mod_REL_WendelS = 1;

	Info_ClearChoices	(Info_Mod_Roman_REL_Unruhen2);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOWTOWENDEL");
};

INSTANCE Info_Mod_Roman_REL_Unruhen3 (C_INFO)
{
	npc		= Mod_7492_OUT_Roman_REL;
	nr		= 1;
	condition	= Info_Mod_Roman_REL_Unruhen3_Condition;
	information	= Info_Mod_Roman_REL_Unruhen3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Roman_REL_Unruhen3_Condition()
{
	if (Mod_REL_WendelS == 17)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Roman_REL_Unruhen3_Info()
{
	AI_Output(self, hero, "Info_Mod_Roman_REL_Unruhen3_08_00"); //Na klasse! Wofür bin ich eigentlich hergekommen?

	B_LogEntry	(TOPIC_MOD_KHORATA_UNRUHEN, "Die Verhandlungen sind zu keinem befriedigenden Abschluss gekommen.");
	B_SetTopicStatus	(TOPIC_MOD_KHORATA_UNRUHEN, LOG_SUCCESS);

	Mod_REL_Stadthalter = 2;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ATMINE");
	B_StartOtherRoutine	(Mod_7480_OUT_Wendel_REL, "STADTHALTER");
};

INSTANCE Info_Mod_Roman_REL_Unruhen4 (C_INFO)
{
	npc		= Mod_7492_OUT_Roman_REL;
	nr		= 1;
	condition	= Info_Mod_Roman_REL_Unruhen4_Condition;
	information	= Info_Mod_Roman_REL_Unruhen4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Roman_REL_Unruhen4_Condition()
{
	if (Mod_REL_WendelS == 18)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Roman_REL_Unruhen4_Info()
{
	AI_Output(self, hero, "Info_Mod_Roman_REL_Unruhen4_08_00"); //Von mir aus. Na gut, dann geh ich mal den anderen Bescheid sagen, was hier gelaufen ist. Vergessen wir die Streitigkeiten.

	Mod_REL_WendelS = 19;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");

	B_RemoveNpc	(Mod_7619_OUT_Frazer_REL);
	B_RemoveNpc	(Mod_7613_OUT_Schuerfer_REL);
	B_RemoveNpc	(Mod_7614_OUT_Schuerfer_REL);
	B_RemoveNpc	(Mod_7615_OUT_Schuerfer_REL);
	B_RemoveNpc	(Mod_7616_OUT_Schuerfer_REL);
	B_RemoveNpc	(Mod_7617_OUT_Schuerfer_REL);
	B_RemoveNpc	(Mod_7618_OUT_Norman_REL);
};

INSTANCE Info_Mod_Roman_REL_Unruhen5 (C_INFO)
{
	npc		= Mod_7492_OUT_Roman_REL;
	nr		= 1;
	condition	= Info_Mod_Roman_REL_Unruhen5_Condition;
	information	= Info_Mod_Roman_REL_Unruhen5_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Roman_REL_Unruhen5_Condition()
{
	if (Mod_REL_WendelS == 20)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Roman_REL_Unruhen5_Info()
{
	if (Mod_REL_WendelS_Choice == 3)
	{
		AI_Output(self, hero, "Info_Mod_Roman_REL_Unruhen5_08_00"); //(aufbrausend) Und du willst also unparteiisch sein?
		AI_Output(self, hero, "Info_Mod_Roman_REL_Unruhen5_08_01"); //Ich merke doch, was das hier für ein Spiel ist, ihr beide habt euch fröhlich abgesprochen!
		AI_Output(self, hero, "Info_Mod_Roman_REL_Unruhen5_08_02"); //Ihr tut so gerecht, aber in Wirklichkeit kümmert ihr euch einen Scheißdreck um uns! Und zum Duellieren seid ihr auch zu feige!
		AI_Output(self, hero, "Info_Mod_Roman_REL_Unruhen5_08_03"); //Ich hätte es vorher wissen müssen!

		Mod_REL_WendelS = 19;

		B_LogEntry	(TOPIC_MOD_KHORATA_UNRUHEN, "Die Verhandlungen sind zu keinem befriedigenden Abschluss gekommen.");
		B_SetTopicStatus	(TOPIC_MOD_KHORATA_UNRUHEN, LOG_SUCCESS);

		Mod_REL_Stadthalter = 2;

		AI_StopProcessInfos	(self);

		B_StartOtherRoutine	(self, "ATMINE");
		B_StartOtherRoutine	(Mod_7480_OUT_Wendel_REL, "STADTHALTER");
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Roman_REL_Unruhen5_08_04"); //Na ja, wirklich gerecht finde ich es immer noch nicht, aber als Kompromiss können wir es gelten lassen.
		AI_Output(self, hero, "Info_Mod_Roman_REL_Unruhen5_08_05"); //Ich werde den Jungs die Neuigkeiten mitteilen, und Frazer darf zurück in die Stadt.

		Mod_REL_WendelS = 19;

		AI_StopProcessInfos	(self);

		B_StartOtherRoutine	(self, "TOT");

		B_RemoveNpc	(Mod_7619_OUT_Frazer_REL);
		B_RemoveNpc	(Mod_7613_OUT_Schuerfer_REL);
		B_RemoveNpc	(Mod_7614_OUT_Schuerfer_REL);
		B_RemoveNpc	(Mod_7615_OUT_Schuerfer_REL);
		B_RemoveNpc	(Mod_7616_OUT_Schuerfer_REL);
		B_RemoveNpc	(Mod_7617_OUT_Schuerfer_REL);
		B_RemoveNpc	(Mod_7618_OUT_Norman_REL);
	};
};

INSTANCE Info_Mod_Roman_REL_EXIT (C_INFO)
{
	npc		= Mod_7492_OUT_Roman_REL;
	nr		= 1;
	condition	= Info_Mod_Roman_REL_EXIT_Condition;
	information	= Info_Mod_Roman_REL_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Roman_REL_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Roman_REL_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};