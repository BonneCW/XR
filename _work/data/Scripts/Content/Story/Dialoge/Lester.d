INSTANCE Info_Mod_Lester_Hi (C_INFO)
{
	npc		= Mod_557_PSINoV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Hi_Condition;
	information	= Info_Mod_Lester_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lester_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Lester_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Lester_Hi_13_00"); //Meine Güte, du lebst noch!
	AI_Output(hero, self, "Info_Mod_Lester_Hi_15_01"); //Sieht so aus.
	AI_Output(self, hero, "Info_Mod_Lester_Hi_13_02"); //Du hast es also geschafft den Schläfer zu besiegen?
	AI_Output(hero, self, "Info_Mod_Lester_Hi_15_03"); //Ja, ich habe den Schläfer dahin geschickt, wo er herkommt.
	AI_Output(hero, self, "Info_Mod_Lester_Hi_15_04"); //Aber was machst du hier in dieser Höhle?
	AI_Output(self, hero, "Info_Mod_Lester_Hi_13_05"); //Ich bin im Auftrag von Baal Namib hier, um mit dem Sumpfkraut in dieser Höhle zu experimentieren.
	AI_Output(self, hero, "Info_Mod_Lester_Hi_13_06"); //Durch die Zauber der Schwarzmagier scheint der Boden hier besonders gut geeignet zu sein.
};

INSTANCE Info_Mod_Lester_Goetterwaffen (C_INFO)
{
	npc		= Mod_557_PSINoV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Goetterwaffen_Condition;
	information	= Info_Mod_Lester_Goetterwaffen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lester_Goetterwaffen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Milten_Daemonisch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_Goetterwaffen_Info()
{
	AI_Output(self, hero, "Info_Mod_Lester_Goetterwaffen_13_00"); //Schön dich zu sehen, ich habe hier etwas für dich.
	AI_Output(hero, self, "Info_Mod_Lester_Goetterwaffen_15_01"); //Ja, Milten hat mich geschickt.
	AI_Output(self, hero, "Info_Mod_Lester_Goetterwaffen_13_02"); //Nun, dann weißt du, dass ich ein paar Spruchrollen für dich verändert habe.
	AI_Output(self, hero, "Info_Mod_Lester_Goetterwaffen_13_03"); //Hier hast du fünf Exemplare.

	B_GiveInvItems	(self, hero, ItSc_SumRabbit, 5);

	AI_Output(self, hero, "Info_Mod_Lester_Goetterwaffen_13_04"); //Damit kannst du einige Häschen beschwören. Ist zwar nicht grade fein, aber sie eignen sich gut, um Fallen zu entdecken.
};

INSTANCE Info_Mod_Lester_Irdorath (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Irdorath_Condition;
	information	= Info_Mod_Lester_Irdorath_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Sache mit Xeres führt mich diesmal auf eine Insel und ich suche erfahrene Leute für meine Mannschaft.";
};

FUNC INT Info_Mod_Lester_Irdorath_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Irdorath))
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUnc VOID Info_Mod_Lester_Irdorath_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_Irdorath_15_00"); //Die Sache mit Xeres führt mich diesmal auf eine Insel und ich suche erfahrene Leute für meine Mannschaft. Wüsstest du da jemanden?
	AI_Output(self, hero, "Info_Mod_Lester_Irdorath_13_01"); //(erstaunt) Mannschaft und Insel? Jetzt also sogar über das Meer ...
	AI_Output(self, hero, "Info_Mod_Lester_Irdorath_13_02"); //Nun, ich bin mir sicher, dass Cor Angar sich dafür begeistern kann.
	AI_Output(self, hero, "Info_Mod_Lester_Irdorath_13_03"); //Zu Zeiten der Barriere hattest du ja bereits mit ihm nicht unerheblichen Anteil an dem weiteren Schicksal des Lagers.

	if (Templer_Dabei == 1)
	|| (Guru_Dabei == 1)
	{
		AI_Output(self, hero, "Info_Mod_Lester_Irdorath_13_04"); //Tja, und dann noch vielleicht Baal Namib. Unter den Baals ist er noch der mit dem größten Drang nach Neuem und Unbekannten.
		AI_Output(self, hero, "Info_Mod_Lester_Irdorath_13_05"); //Nicht umsonst steht er am Eingang des Lagers.

		B_LogEntry	(TOPIC_MOD_HQ_CREW, "Cor Angar und Baal Namib könnten sich für die Seereise erwärmen, wie mir Lester verriet.");
	}
	else
	{
		B_LogEntry	(TOPIC_MOD_HQ_CREW, "Cor Angar könnte sich für die Seereise erwärmen, wie mir Lester verriet.");
	};

	AI_Output(self, hero, "Info_Mod_Lester_Irdorath_13_06"); //Und dann, nun, würde ich mich glücklich schätzen, wenn ich mit von der Partie wäre auf diesem Abenteuer.
};

INSTANCE Info_Mod_Lester_Irdorath2 (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Irdorath2_Condition;
	information	= Info_Mod_Lester_Irdorath2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dann heiße ich dich hiermit an Bord unseres Schiffes willkommen.";
};

FUNC INT Info_Mod_Lester_Irdorath2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_Irdorath))
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUnc VOID Info_Mod_Lester_Irdorath2_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_Irdorath2_15_00"); //Dann heiße ich dich hiermit an Bord unseres Schiffes willkommen. Treffpunkt ist der Hafen in Khorinis.
	AI_Output(self, hero, "Info_Mod_Lester_Irdorath2_13_01"); //Großartig. Bis dahin.

	B_LogEntry	(TOPIC_MOD_HQ_CREW, "Sehr gut, mein Weggefährte Lester ist mit an Bord.");

	B_GivePlayerXP	(150);

	Mod_CrewCount += 1;

	if (CurrentLevel == NEWWORLD_ZEN)
	{
		Mod_LesterDabei = 2;

		AI_StopProcessInfos	(self);

		B_StartOtherRoutine	(self, "SCHIFF");
	}
	else
	{
		Mod_LesterDabei = 1;

		AI_StopProcessInfos	(self);

		B_StartOtherRoutine	(self, "TOT");
	};
};

INSTANCE Info_Mod_Lester_Irdorath3 (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Irdorath3_Condition;
	information	= Info_Mod_Lester_Irdorath3_Info;
	permanent	= 1;
	important	= 0;
	description	= "Tut mir leid, aber es scheint das wir zu viele sind.";
};

FUNC INT Info_Mod_Lester_Irdorath3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_Irdorath2))
	&& (Mod_Irdorath == 0)
	&& (Mod_LesterDabei == 1)
	&& (Mod_JackDabei == 1)
	&& (Mod_CrewCount > 15)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_Irdorath3_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_Irdorath3_15_00"); //Tut mir leid, aber es scheint das wir zu viele sind. Ich kann dich doch nicht mitnehmen.
	AI_Output(self, hero, "Info_Mod_Lester_Irdorath3_13_01"); //Schade. Ich gehe dann wieder zurück ins Minental.

	Mod_LesterDabei = 3;

	Mod_CrewCount -= 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");
};

INSTANCE Info_Mod_Lester_Fanatiker (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Fanatiker_Condition;
	information	= Info_Mod_Lester_Fanatiker_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hey Lester!";
};

FUNC INT Info_Mod_Lester_Fanatiker_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Andre_Auftrag))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Andre_Erfahrung_Fanatiker))
	{
		return 1;
	};
};

FUnc VOID Info_Mod_Lester_Fanatiker_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_Fanatiker_15_00"); //Hey Lester!
	AI_Output(self, hero, "Info_Mod_Lester_Fanatiker_13_01"); //Hallo, mein Freund. Was führt dich zu mir?
	AI_Output(hero, self, "Info_Mod_Lester_Fanatiker_15_02"); //Weißt du was aus dem Rest der Bruderschaft geworden ist?
	AI_Output(self, hero, "Info_Mod_Lester_Fanatiker_13_03"); //Nach dem Fall der Barriere? Sie sind nach Khorinis gezogen. Die meisten halten immer noch am Schläfer fest.
	AI_Output(hero, self, "Info_Mod_Lester_Fanatiker_15_04"); //Hast du 'ne Ahnung wie ich etwas über sie herausfinden könnte?
	AI_Output(self, hero, "Info_Mod_Lester_Fanatiker_13_05"); //Hmm ... soweit ich weiß ist der ehemalige Templer Cor Gar in Khorinis. Geht in dem Wald auf die Jagd und lebt ihm Hotel. Du triffst ihn sicher abends bei den Wasserpfeifen an.
	AI_Output(self, hero, "Info_Mod_Lester_Fanatiker_13_06"); //Am besten bringst du ihm auch etwas Sumpfkraut mit, dann wird er dir sicher gerne weiterhelfen. Ach ja, er nennt sich seit dem Fall des Schläfers Josef.

	B_LogEntry	(TOPIC_MOD_MILIZ_SEKTENSPINNER, "Lester hat erzählt, dass die Anhänger des Schläfers nach Khorinis gezogen sind. Ein ehemalgier Templer namens Cor Gar, welcher sich jetzt allerdings Josef nennt, wird mir mehr dazu sagen können - vorausgesetzt ich habe etwas Sumpfkraut für ihn.");
};

INSTANCE Info_Mod_Lester_Sekte (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Sekte_Condition;
	information	= Info_Mod_Lester_Sekte_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Bruderschaft existiert noch?";
};

FUNC INT Info_Mod_Lester_Sekte_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_Hi))
	{
		return 1;
	};
};

FUnc VOID Info_Mod_Lester_Sekte_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_Sekte_15_00"); //Die Bruderschaft existiert noch? Ich dachte ihr wolltet unbedingt die Kolonie verlassen?
	AI_Output(self, hero, "Info_Mod_Lester_Sekte_13_01"); //Ursprünglich wollten wir das, das ist richtig. Doch nachdem die Barriere gefallen ist und wir erfahren haben, was auf dem Festland los ist, haben wir beschlossen im Minental zu bleiben.
	AI_Output(self, hero, "Info_Mod_Lester_Sekte_13_02"); //Außerdem haben wir hier ein paar Abnehmer für unser Kraut. Das ist in Khorinis sehr beliebt.
};

INSTANCE Info_Mod_Lester_Aufnehmen (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Aufnehmen_Condition;
	information	= Info_Mod_Lester_Aufnehmen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kann ich mich euch anschließen?";
};

FUNC INT Info_Mod_Lester_Aufnehmen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_Sekte))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_Aufnehmen_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_Aufnehmen_15_00"); //Kann ich mich euch anschließen?
	AI_Output(self, hero, "Info_Mod_Lester_Aufnehmen_13_01"); //Natürlich, aber dazu musst du erst ins Minental. Du solltest auch wissen, dass wir keine der großen Gemeinschaften, wie die Miliz oder die Söldner, sind.
	AI_Output(self, hero, "Info_Mod_Lester_Aufnehmen_13_02"); //Du kannst uns auch beitreten, wenn du bereits in einer anderen Gemeinschaft bist. Sprich am besten mit Baal Namib, sobald du im Sumpflager ankommst.

	Log_CreateTopic	(TOPIC_MOD_SEKTE_AUFNAHME, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SEKTE_AUFNAHME, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Ich kann mich der Bruderschaft im Minental anschließen. Dazu soll ich mit Baal Namib sprechen.");
};

INSTANCE Info_Mod_Lester_Namib (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Namib_Condition;
	information	= Info_Mod_Lester_Namib_Info;
	permanent	= 0;
	important	= 0;
	description	= "Baal Namib schickt mich.";
};

FUNC INT Info_Mod_Lester_Namib_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Namib_Aufnehmen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_Namib_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_Namib_15_00"); //Baal Namib schickt mich. Ich soll ein Paket bei dir abholen und es zu Constantino bringen.
	AI_Output(self, hero, "Info_Mod_Lester_Namib_13_01"); //Sehr gut, dann kann ich mich weiter meinen ... Forschungen widmen.

	CreateInvItems	(self, ItMi_LesterPaket, 1);
	B_GiveInvItems	(self, hero, ItMi_LesterPaket, 1);

	CreateInvItems	(self, ItMi_Joint, 1);

	B_UseItem	(self, ItMi_Joint);

	AI_Output(hero, self, "Info_Mod_Lester_Namib_15_02"); //Ich soll außerdem einen Lagebericht abholen.
	AI_Output(self, hero, "Info_Mod_Lester_Namib_13_03"); //Einen Lagebericht? Wenn das so ist ... dazu brauche ich aber eine Flasche Zauberwasser für ... für ... für das Sumpfkraut!
	AI_Output(hero, self, "Info_Mod_Lester_Namib_15_04"); //Woher bekomme ich Zauberwasser?
	AI_Output(self, hero, "Info_Mod_Lester_Namib_13_05"); //Constantino braut es. Du wirst es bei ihm bekommen. Sag ihm, er soll es auf die Rechnung setzen.
	AI_Output(hero, self, "Info_Mod_Lester_Namib_15_06"); //Na gut.

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Das Paket hab ich, aber für den Lagebericht braucht Lester noch eine Flasche Zauberwasser. Er hat gesagt, dass Constantino das Zauberwasser herstellt und verkauft.");
};

INSTANCE Info_Mod_Lester_Zauberwasser (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Zauberwasser_Condition;
	information	= Info_Mod_Lester_Zauberwasser_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier, Zauberwasser.";
};

FUNC INT Info_Mod_Lester_Zauberwasser_Condition()
{
	if (Npc_HasItems(hero, ItMi_Zauberwasser) > 0)	
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_Zauberwasser_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_Zauberwasser_15_00"); //Hier, Zauberwasser.

	B_GiveInvItems	(hero, self, ItMi_Zauberwasser, 1);

	AI_Output(self, hero, "Info_Mod_Lester_Zauberwasser_13_01"); //Gut, endlich hab ich mein Zauberwasser.

	if (Mod_ConstantinoZauberwasser == 1)
	{
		AI_Output(hero, self, "Info_Mod_Lester_Zauberwasser_15_02"); //Ich musste arbeiten, um deine Schulden zu bezahlen!
	}
	else if (Mod_ConstantinoZauberwasser == 2)
	{
		AI_Output(hero, self, "Info_Mod_Lester_Zauberwasser_15_03"); //Ich musste Constantino die Flasche Zauberwasser aus seiner Truhe stehlen.
	}
	else if (Mod_ConstantinoZauberwasser == 3)
	{
		AI_Output(hero, self, "Info_Mod_Lester_Zauberwasser_15_04"); //Ich musste deine Schulden bei Constantino bezahlen.
	};

	AI_Output(self, hero, "Info_Mod_Lester_Zauberwasser_13_05"); //Danke! Das werde ich mir merken.
	AI_Output(hero, self, "Info_Mod_Lester_Zauberwasser_15_06"); //Wofür brauchst du dieses Zauberwasser eigentlich?
	AI_Output(self, hero, "Info_Mod_Lester_Zauberwasser_13_07"); //Nun, es gibt nichts Besseres, als einen harten Arbeitstag mit einem Stängel Sumpfkraut und einer Flasche Zauberwasser zu beenden.

	CreateInvItems	(self, ItMi_Joint, 1);

	B_UseItem	(self, ItMi_Joint);
	B_UseItem	(self, ItMi_Zauberwasser);

	AI_Output(hero, self, "Info_Mod_Lester_Zauberwasser_15_08"); //Warte mal ... das heißt Zauberwasser ist ein Getränk?
	AI_Output(self, hero, "Info_Mod_Lester_Zauberwasser_13_09"); //(lacht) Was dachtest du denn? Das es so was wie ein Wunderdünger ist?
	AI_Output(hero, self, "Info_Mod_Lester_Zauberwasser_15_10"); //Du ... ach egal, was ist mit dem Lagebericht?
	AI_Output(self, hero, "Info_Mod_Lester_Zauberwasser_13_11"); //Ah ja. Sag Baal Namib, dass das Sumpfkraut den Umständen entsprechend sehr gut gedeiht.
	AI_Output(self, hero, "Info_Mod_Lester_Zauberwasser_13_12"); //Obwohl die Luft nicht feucht genug ist und hier keine Sonne scheint, wächst es sehr gut.

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Ich hab Lester das Zauberwasser gegeben und es hat sich herausgestellt, dass es sich dabei um ein normales Getränk handelt. Jedenfalls hab ich jetzt den Lagebericht und sollte zu Baal Namib zurückkehren.");

	B_GivePlayerXP	(150);
};

INSTANCE Info_Mod_Lester_Zauberwasser_MIS (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Zauberwasser_MIS_Condition;
	information	= Info_Mod_Lester_Zauberwasser_MIS_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe hier jede Menge Zauberwasser.";
};

FUNC INT Info_Mod_Lester_Zauberwasser_MIS_Condition()
{
	if (Npc_HasItems(hero, ItMi_Zauberwasser_MIS) > 0)	
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_Zauberwasser_MIS_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_Zauberwasser_MIS_15_00"); //Ich habe hier jede Menge Zauberwasser.
	AI_Output(self, hero, "Info_Mod_Lester_Zauberwasser_MIS_13_01"); //Wo hast du es her?
	AI_Output(hero, self, "Info_Mod_Lester_Zauberwasser_MIS_15_02"); //Constantino wollte, dass ich es an verschiedene Händler verteile, um deine Schulden abzuarbeiten.
	AI_Output(self, hero, "Info_Mod_Lester_Zauberwasser_MIS_13_03"); //Äh ... dann liefere das Zauberwasser besser aus und bring mir nur eine, wenn du damit fertig bist.
	AI_Output(hero, self, "Info_Mod_Lester_Zauberwasser_MIS_15_04"); //Bist du sicher, dass du keine von denen hier willst?
	AI_Output(self, hero, "Info_Mod_Lester_Zauberwasser_MIS_13_05"); //Ja, wer weiß, was Constantino mit uns anstellt, wenn wir uns an seiner Lieferung vergreifen.

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Lester wollte kein Zauberwasser von den Lieferungen, die ich für Constantino ausliefern soll. Ich muss sie also wohl wirklich wegbringen und mir die Flasche Zauberwasser von Constantino verdienen.");
};

INSTANCE Info_Mod_Lester_Treffen (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Treffen_Condition;
	information	= Info_Mod_Lester_Treffen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Gorn schickt mich.";
};

FUNC INT Info_Mod_Lester_Treffen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gorn_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_Treffen_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_Treffen_15_00"); //Gorn schickt mich. Ich soll dir sagen, dass ihr euch in der Taverne 'Zur Toten Harpie' trefft.
	AI_Output(self, hero, "Info_Mod_Lester_Treffen_13_01"); //Oh, danke. Ich mach mich sofort auf den Weg. Du kannst doch auch vorbeikommen, du gehörst schließlich auch zu uns.

	B_LogEntry	(TOPIC_MOD_TREFFEN, "Ich habe Lester vom Treffen bescheid gesagt, er wird sich sofort dorthin begeben.");

	AI_StopProcessInfos	(self);

	Npc_ExchangeRoutine	(self, "TREFFEN");
};

INSTANCE Info_Mod_Lester_Karras (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Karras_Condition;
	information	= Info_Mod_Lester_Karras_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich soll dich abholen.";
};

FUNC INT Info_Mod_Lester_Karras_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Karras_NamibHabBuch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_Karras_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_Karras_15_00"); //Ich soll dich abholen.
	AI_Output(self, hero, "Info_Mod_Lester_Karras_13_01"); //Wurde auch Zeit, dieses Höhlenleben bekommt mir nicht gut.

	B_LogEntry	(TOPIC_MOD_SEKTE_AUFNAHME, "Lester begleitet mich nun zu Karras.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "KARRAS");
};

INSTANCE Info_Mod_Lester_Crawlersekret (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Crawlersekret_Condition;
	information	= Info_Mod_Lester_Crawlersekret_Info;
	permanent	= 0;
	important	= 0;
	description	= "Weißt du, wo es Minecrawler-Sekret gibt?";
};

FUNC INT Info_Mod_Lester_Crawlersekret_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Constantino_Lehrling))
	&& (Mod_MinecrawlerEi >= 0)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Constantino_Stimme))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_Crawlersekret_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_Crawlersekret_15_00"); //Weißt du, wo es Minecrawler-Sekret gibt?
	AI_Output(self, hero, "Info_Mod_Lester_Crawlersekret_13_01"); //Minecrawler-Sekret? Cor Kalom hat es früher aus den Zangen der Minecrawler extrahiert.
	AI_Output(hero, self, "Info_Mod_Lester_Crawlersekret_15_02"); //Ich brauche stärkeres Sekret als das der Zangen.
	AI_Output(self, hero, "Info_Mod_Lester_Crawlersekret_13_03"); //Wie das aus den Eiern der Königin, welche du uns damals gebracht hast?
	AI_Output(hero, self, "Info_Mod_Lester_Crawlersekret_15_04"); //Genau das.
	AI_Output(self, hero, "Info_Mod_Lester_Crawlersekret_13_05"); //Dann solltest du dir Eier besorgen und das Sekret abfüllen. Wenn du Glück hast, gibt es im Lager auch noch bereits abgefülltes Sekret.
};

INSTANCE Info_Mod_Lester_DefenseBreak (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_DefenseBreak_Condition;
	information	= Info_Mod_Lester_DefenseBreak_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lester_DefenseBreak_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lester_Hi))
	&& (hero.attribute[ATR_DEXTERITY] >= 50)
	&& ((hero.hitChance[NPC_TALENT_1H] >= 30)
	|| (hero.hitChance[NPC_TALENT_2H] >= 30))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_DefenseBreak_Info()
{
	AI_Output(self, hero, "Info_Mod_Lester_DefenseBreak_12_00"); //Hey! Gestern Abend hab ich zu viel Sumpfkraut geraucht, und da ist mir in der Nacht ein System eingefallen, wie man blockende Gegner überwinden kann.
	AI_Output(hero, self, "Info_Mod_Lester_DefenseBreak_15_01"); //Du denkst über Sachen nach ...
	AI_Output(self, hero, "Info_Mod_Lester_DefenseBreak_12_02"); //Ich war zu dem Zeitpunkt nicht zurechnungsfähig!
	AI_Output(self, hero, "Info_Mod_Lester_DefenseBreak_12_03"); //Ich habe auch andere Sachen geträumt, von denen willst du gar nichts wissen.
	AI_Output(self, hero, "Info_Mod_Lester_DefenseBreak_12_04"); //Wie dem auch sei: Wenn du willst, sage ich dir, wie die Technik funktioniert.
};

INSTANCE Info_Mod_Lester_DefenseBreak2 (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_DefenseBreak2_Condition;
	information	= Info_Mod_Lester_DefenseBreak2_Info;
	permanent	= 1;
	important	= 0;
};

FUNC INT Info_Mod_Lester_DefenseBreak2_Condition()
{
	if (Mod_Schwierigkeit == 4)
	{
		Info_Mod_Lester_DefenseBreak2.description = "Wie kann ich einen Block brechen? (500 Gold)";
	}
	else
	{
		Info_Mod_Lester_DefenseBreak2.description = "Wie kann ich einen Block brechen? (5 LP)";
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Lester_DefenseBreak))
	&& (DefenseBreak_Perk == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lester_DefenseBreak2_Info()
{
	AI_Output(hero, self, "Info_Mod_Lester_DefenseBreak2_15_00"); //Wie kann ich einen Block brechen?

	if ((Mod_Schwierigkeit == 4)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 500))
	|| ((Mod_Schwierigkeit != 4)
	&& (hero.lp >= 5))
	{
		AI_Output(self, hero, "Info_Mod_Lester_DefenseBreak2_12_01"); //Du musst den Gegner glauben lassen, dass du auf seine Beine zielst.
		AI_Output(self, hero, "Info_Mod_Lester_DefenseBreak2_12_02"); //Dein Blick und deine Körperstellung muss ganz darauf ausgerichtet sein.
		AI_Output(self, hero, "Info_Mod_Lester_DefenseBreak2_12_03"); //Im letzten Moment ziehst du das Schwert hoch. Wenn du Finte klappt, ist sein Oberkörper ungeschützt.
		AI_Output(hero, self, "Info_Mod_Lester_DefenseBreak2_15_04"); //Das wird aber sicher nicht jedes Mal klappen.
		AI_Output(self, hero, "Info_Mod_Lester_DefenseBreak2_12_05"); //Wenn du ein besseres Rezept kennst ...
		AI_Output(hero, self, "Info_Mod_Lester_DefenseBreak2_15_06"); //Schon gut. Danke für den Ratschlag.

		DefenseBreak_Perk = TRUE;

		if (Mod_Schwierigkeit == 4)
		{
			Npc_RemoveInvItems	(hero, ItMi_Gold, 500);
		}
		else
		{
			hero.lp -= 5;
		};
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Lester_DefenseBreak2_12_07"); //Komm wieder, wenn du bereit bist.
	};
};

INSTANCE Info_Mod_Lester_Pickpocket (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_Pickpocket_Condition;
	information	= Info_Mod_Lester_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Lester_Pickpocket_Condition()
{
	C_Beklauen	(105, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Lester_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Lester_Pickpocket);

	Info_AddChoice	(Info_Mod_Lester_Pickpocket, DIALOG_BACK, Info_Mod_Lester_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Lester_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Lester_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Lester_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Lester_Pickpocket);
};

FUNC VOID Info_Mod_Lester_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Lester_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Lester_Pickpocket);

		Info_AddChoice	(Info_Mod_Lester_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Lester_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Lester_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Lester_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Lester_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Lester_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Lester_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Lester_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Lester_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Lester_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Lester_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Lester_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Lester_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Lester_EXIT (C_INFO)
{
	npc		= Mod_557_PSINOV_Lester_NW;
	nr		= 1;
	condition	= Info_Mod_Lester_EXIT_Condition;
	information	= Info_Mod_Lester_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Lester_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Lester_EXIT_Info()
{
	AI_Output(self, hero, "Info_Mod_Lester_EXIT_13_01"); //Dem Ziel entgegen!

	AI_StopProcessInfos	(self);
};