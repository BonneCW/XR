INSTANCE Info_Mod_Jack_Irdorath (C_INFO)
{
	npc		= Mod_586_NONE_Jack_NW;
	nr		= 1;
	condition	= Info_Mod_Jack_Irdorath_Condition;
	information	= Info_Mod_Jack_Irdorath_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hörte, du seiest einst Seemann gewesen, ein stolzer Kapitän ...";
};

FUNC INT Info_Mod_Jack_Irdorath_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Diego_Irdorath))
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jack_Irdorath_Info()
{
	AI_Output(hero, self, "Info_Mod_Jack_Irdorath_15_00"); //Ich hörte, du seiest einst Seemann gewesen, ein stolzer Kapitän ...
	AI_Output(self, hero, "Info_Mod_Jack_Irdorath_14_01"); //Tatsächlich? Wie du bloß davon erfahren hast ...
	AI_Output(self, hero, "Info_Mod_Jack_Irdorath_14_02"); //Ja, es stimmt, auch, wenn es schon viele Jahre her ist. Damals war ich Kapitän der Colossus.
	AI_Output(self, hero, "Info_Mod_Jack_Irdorath_14_03"); //Ja, so manches Abenteuer habe ich mit meiner Mannschaft überstanden.
	AI_Output(self, hero, "Info_Mod_Jack_Irdorath_14_04"); //Ob Piraten oder Stürme, ob Skorbut oder Seeungeheuer, allem haben wir getrotzt ...
	AI_Output(hero, self, "Info_Mod_Jack_Irdorath_15_05"); //Ok, das können wir ein andermal näher ausführen.
	AI_Output(hero, self, "Info_Mod_Jack_Irdorath_15_06"); //Mir scheint, auf jeden Fall, dass du gerne an die Zeiten zurückdenkst.
	AI_Output(hero, self, "Info_Mod_Jack_Irdorath_15_07"); //Was würdest du sagen, wenn dir jetzt noch einmal die Möglichkeit geschenkt würde, ein großes Schiff zu befehligen?
	AI_Output(self, hero, "Info_Mod_Jack_Irdorath_14_08"); //Ich würde es für einen schönen Traum halten.
	AI_Output(self, hero, "Info_Mod_Jack_Irdorath_14_09"); //Denn wer sollte eine altem Seebären wie mir noch einmal ein Schiff anvertrauen wollen ...
};

INSTANCE Info_Mod_Jack_Irdorath2 (C_INFO)
{
	npc		= Mod_586_NONE_Jack_NW;
	nr		= 1;
	condition	= Info_Mod_Jack_Irdorath2_Condition;
	information	= Info_Mod_Jack_Irdorath2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich könnte dir einen Posten als Kapitän auf dem Schiff der Paladine anbieten.";
};

FUNC INT Info_Mod_Jack_Irdorath2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jack_Irdorath))
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jack_Irdorath2_Info()
{
	AI_Output(hero, self, "Info_Mod_Jack_Irdorath2_15_00"); //Ich könnte dir einen Posten als Kapitän auf dem Schiff der Paladine anbieten.
	AI_Output(self, hero, "Info_Mod_Jack_Irdorath2_14_01"); //Ach, was soll dieser Unfug. Warum versuchst du einen alten Seemann zum Narren zu halten ...?
	AI_Output(hero, self, "Info_Mod_Jack_Irdorath2_15_02"); //Nein, das ist mein voller Ernst.
	AI_Output(hero, self, "Info_Mod_Jack_Irdorath2_15_03"); //Vielleicht hörtest du von den beunruhigenden Vorgängen in der Stadt und sonst auf Khorinis?
	AI_Output(hero, self, "Info_Mod_Jack_Irdorath2_15_04"); //Ich bin im Auftrag der Magier unterwegs um den Urheber zu bannen.
	AI_Output(hero, self, "Info_Mod_Jack_Irdorath2_15_05"); //Zu diesem Zweck muss ich mit Schiff, Mannschaft und natürlich Kapitän zu einer Insel übersetzen.
	AI_Output(self, hero, "Info_Mod_Jack_Irdorath2_14_06"); //(etwas hellhöriger) Was sagst du, ist das wirklich dein ernst ...
	AI_Output(self, hero, "Info_Mod_Jack_Irdorath2_14_07"); //(nachdenklicher) Hmm, ja, stimmt, ich hörte Gerüchte über einen Mann und das Geschehene ... du bist das also?
	AI_Output(self, hero, "Info_Mod_Jack_Irdorath2_14_08"); //Und ich sah dich auch mit dem Boten der Wassermagier sprechen, Diego ...
	AI_Output(self, hero, "Info_Mod_Jack_Irdorath2_14_09"); //(unterbricht und wieder zum Helden) Ähh, ja, du sprachst also von einer Insel ...?
	AI_Output(hero, self, "Info_Mod_Jack_Irdorath2_15_10"); //Ja, einige Tage Seereise entfernt. Wir müssen dort ein Geschöpf stellen, was in die Machenschaften verwickelt war.
	AI_Output(self, hero, "Info_Mod_Jack_Irdorath2_14_11"); //Also wird es nicht ganz ungefährlich ...
	AI_Output(hero, self, "Info_Mod_Jack_Irdorath2_15_12"); //Aber es ist wichtig. Wirst du also mein Kapitän sein?
	AI_Output(self, hero, "Info_Mod_Jack_Irdorath2_14_13"); //Ja, natürlich, selbstverständlich ... Hmm, aber bestimmte Voraussetzungen müssen doch erfüllt sein.
	AI_Output(hero, self, "Info_Mod_Jack_Irdorath2_15_14"); //Ja, was meinst du?
	AI_Output(self, hero, "Info_Mod_Jack_Irdorath2_14_15"); //Falls sich die Reise verzögert, es Probleme geben sollte, so wäre es nicht schlecht, wenn jemanden an Bord haben, der sich auf ein Handwerk versteht.
	AI_Output(self, hero, "Info_Mod_Jack_Irdorath2_14_16"); //Ein Bootsbauer wäre natürlich das beste ... oder was du eben sonst findest an Leuten die sich auf Holz und Eisen verstehen.
	AI_Output(self, hero, "Info_Mod_Jack_Irdorath2_14_17"); //Und dann, wenn ich an eine meiner letzten Reisen zurückdenke, würde ich meiner einen Alchemisten mit Wissen über Pflanzen und Tränke wünschen.
	AI_Output(self, hero, "Info_Mod_Jack_Irdorath2_14_18"); //Wenn die Skorbut losbricht, ist so einer Goldwert ...
	AI_Output(self, hero, "Info_Mod_Jack_Irdorath2_14_19"); //Ja, das ist im Moment alles, was mir in den Sinn kommt.
	AI_Output(hero, self, "Info_Mod_Jack_Irdorath2_15_20"); //Na, dann mach ich mich mal auf die Suche ...
	AI_Output(self, hero, "Info_Mod_Jack_Irdorath2_14_21"); //Und ich werde mir dann schon mal das stolze Schiff anschauen.

	Mod_Kapitan = 1;
	Mod_JackDabei = 1;

	Mod_CrewCount += 1;

	Log_CreateTopic	(TOPIC_MOD_HQ_JACK, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_HQ_JACK, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_HQ_JACK, "Jack wäre Feuer und Flamme dafür, mein Kapitän zu werden. Zwei Bedingungen hat er aber noch, bevor es losgehen kann. Ich soll jemanden finden, der handwerklich erfahren ist – ein Bootsbauer wäre das Beste, aber was anderes tut’s auch. Und dann wünscht er sich noch einen Alchemisten an Bord, der sich auch auf Pflanzenkunde gut versteht.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "SCHIFF");
};

INSTANCE Info_Mod_Jack_Irdorath3 (C_INFO)
{
	npc		= Mod_586_NONE_Jack_NW;
	nr		= 1;
	condition	= Info_Mod_Jack_Irdorath3_Condition;
	information	= Info_Mod_Jack_Irdorath3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe einen Handwerker gefunden.";
};

FUNC INT Info_Mod_Jack_Irdorath3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jack_Irdorath2))
	&& (Mod_JackHW == 1)
	&& (Mod_JackDabei == 1)
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jack_Irdorath3_Info()
{
	AI_Output(hero, self, "Info_Mod_Jack_Irdorath3_15_00"); //Ich habe einen Handwerker gefunden.
	AI_Output(self, hero, "Info_Mod_Jack_Irdorath3_14_01"); //Sehr gut, wer ist es?
	AI_Output(hero, self, "Info_Mod_Jack_Irdorath3_15_02"); //Der Schmied Bennet.
	AI_Output(self, hero, "Info_Mod_Jack_Irdorath3_14_03"); //Ein Schmied ...?! Hmm, als ich hätte mir wirklich lieber jemanden gewünscht, der auch Ahnung von Holz hat ...
	AI_Output(hero, self, "Info_Mod_Jack_Irdorath3_15_04"); //Tja ...
	AI_Output(self, hero, "Info_Mod_Jack_Irdorath3_14_05"); //Hmm ... (kurzes Schweigen) ... aber daran soll jetzt unsere Reise nicht scheitern.
	AI_Output(self, hero, "Info_Mod_Jack_Irdorath3_14_06"); //Ok, dann eben der Schmied.

	Mod_JackHW = 2;

	B_LogEntry	(TOPIC_MOD_HQ_JACK, "Ok, Jack hat den Schmied gerade so durchgehen lassen.");

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Jack_Irdorath4 (C_INFO)
{
	npc		= Mod_586_NONE_Jack_NW;
	nr		= 1;
	condition	= Info_Mod_Jack_Irdorath4_Condition;
	information	= Info_Mod_Jack_Irdorath4_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe jemanden gefunden, der sich vortrefflich auf Kräuter und Tränke versteht.";
};

FUNC INT Info_Mod_Jack_Irdorath4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jack_Irdorath2))
	&& (Mod_JackAL == 1)
	&& (Mod_JackDabei == 1)
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jack_Irdorath4_Info()
{
	AI_Output(hero, self, "Info_Mod_Jack_Irdorath4_15_00"); //Ich habe jemanden gefunden, der sich vortrefflich auf Kräuter und Tränke versteht.
	AI_Output(self, hero, "Info_Mod_Jack_Irdorath4_14_01"); //Ja, wer ist es? Alchemist Constantino?
	AI_Output(hero, self, "Info_Mod_Jack_Irdorath4_15_02"); //Ähh, nein ... es ist Sagitta, die Kräuterhe ... ähh, die kräuterkundige Alchemistin.
	AI_Output(self, hero, "Info_Mod_Jack_Irdorath4_14_03"); //Was, die Kräuterhexe die sich irgendwo im Wald beim Großbauernhof herumtreiben soll?
	AI_Output(self, hero, "Info_Mod_Jack_Irdorath4_14_04"); //Bist du dir sicher, dass du da keinen Fehler machst?
	AI_Output(self, hero, "Info_Mod_Jack_Irdorath4_14_05"); //Vielleicht bringt sie ja Unglück oder hat es darauf abgesehen, zur Abwechslung arglose Seeleute zu verhexen ...
	AI_Output(hero, self, "Info_Mod_Jack_Irdorath4_15_06"); //(halblaut) Ähem, arglose Seeleute ...
	AI_Output(hero, self, "Info_Mod_Jack_Irdorath4_15_07"); //(Wieder zu Jack) Nein, ich glaube wirklich, dass wir mit ihr den besten und zuverlässigsten Experten an Bord haben, wenn es um Pflanzen und Kräuter geht, so wie du es dir ja gewünscht hast.
	AI_Output(self, hero, "Info_Mod_Jack_Irdorath4_14_08"); //Naja, wir werden sehen ... meinen Talisman werde ich aber die ganze Seereise über anbehalten.
	AI_Output(self, hero, "Info_Mod_Jack_Irdorath4_14_09"); //Nicht, dass ich eines morgens noch als Tiefseebarsch erwache ...

	Mod_JackAL = 2;

	B_LogEntry	(TOPIC_MOD_HQ_JACK, "Mit leichtem Nachdruck konnte ich Jack von Sagitta 'überzeugen'");

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Jack_Irdorath5 (C_INFO)
{
	npc		= Mod_586_NONE_Jack_NW;
	nr		= 1;
	condition	= Info_Mod_Jack_Irdorath5_Condition;
	information	= Info_Mod_Jack_Irdorath5_Info;
	permanent	= 1;
	important	= 0;
	description	= "Also, jetzt sind die nötigen Vorbereitungen getroffen.";
};

FUNC INT Info_Mod_Jack_Irdorath5_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jack_Irdorath2))
	&& (Mod_JackHW == 2)
	&& (Mod_JackDabei == 1)
	&& (Mod_JackAL == 2)
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jack_Irdorath5_Info()
{
	AI_Output(hero, self, "Info_Mod_Jack_Irdorath5_15_00"); //Also, jetzt sind die nötigen Vorbereitungen getroffen.

	if (Mod_CrewCount >= 5)
	&& (Mod_CrewCount <= 15)
	&& ((Mod_MyxirDabei > 0)
	|| (Mod_NamibDabei > 0)
	|| (Mod_MiltenDabei > 0)
	|| (Mod_VatrasDabei > 0))
	{
		AI_Output(self, hero, "Info_Mod_Jack_Irdorath5_14_01"); //Ja, stimmt. Sag einfach Bescheid. Wann es losgehen kann.

		Mod_JackHW = 3;
		Mod_JackAL = 3;

		B_SetTopicStatus	(TOPIC_MOD_HQ_JACK, LOG_SUCCESS);
	}
	else if ((Mod_MyxirDabei == 0)
	&& (Mod_NamibDabei == 0)
	&& (Mod_MiltenDabei == 0)
	&& (Mod_VatrasDabei == 0))
	{
		AI_Output(self, hero, "Info_Mod_Jack_Irdorath5_14_02"); //Nicht ganz ... Da du im Auftrag der Magier unterwegs bist, hätte ich mir schon zumindest einen mit an Bord gewünscht.
		AI_Output(self, hero, "Info_Mod_Jack_Irdorath5_14_03"); //Wäre sicher nicht schlecht, einen erfahrenen von der Sorte mit dabei zu haben.
	}
	else if (Mod_CrewCount < 5)
	{
		AI_Output(self, hero, "Info_Mod_Jack_Irdorath5_14_04"); //Na du bist mir lustig ... Als du von Mannschaft sprachst hatte ich gedacht, dass du bereits eine angeheuert hast.
		AI_Output(self, hero, "Info_Mod_Jack_Irdorath5_14_05"); //Ohne weitere Leute können wir schlecht in See stechen.
		AI_Output(self, hero, "Info_Mod_Jack_Irdorath5_14_06"); //Ich will außer dem Schmied und der Kräuterhexe zumindest noch drei weitere Leute mit an Bord haben.
		AI_Output(self, hero, "Info_Mod_Jack_Irdorath5_14_07"); //Sonst können wir doch kein Schiff führen.
	}
	else if (Mod_CedricDabei == 1)
	{
		AI_Output(self, hero, "Info_Mod_Jack_Irdorath5_14_08"); //Cedric macht, ähh, Schwierigkeiten. Solltest du vielleicht erst einmal mit ihm klären.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Jack_Irdorath5_14_09"); //Ja, sag mal, willst du eine ganze Kompanie auf der Esmeralda mitnehmen?!
		AI_Output(self, hero, "Info_Mod_Jack_Irdorath5_14_10"); //Das Schiff mag zwar groß sein, aber auch nicht unendlich.
		AI_Output(self, hero, "Info_Mod_Jack_Irdorath5_14_11"); //Ein paar wirst du wieder nach Hause schicken müssen.
		AI_Output(self, hero, "Info_Mod_Jack_Irdorath5_14_12"); //Für mehr als 15 Leute reicht der Platz nicht auf dem Schiff.
	};
};

INSTANCE Info_Mod_Jack_Irdorath6 (C_INFO)
{
	npc		= Mod_586_NONE_Jack_NW;
	nr		= 1;
	condition	= Info_Mod_Jack_Irdorath6_Condition;
	information	= Info_Mod_Jack_Irdorath6_Info;
	permanent	= 0;
	important	= 0;
	description	= "Lass uns zu der Insel aufbrechen.";
};

FUNC INT Info_Mod_Jack_Irdorath6_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jack_Irdorath2))
	&& (Mod_JackHW == 3)
	&& (Mod_JackAL == 3)
	&& (Mod_JackDabei == 1)
	&& (Mod_CedricDabei == 0)
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jack_Irdorath6_Info()
{
	var int Mod_JackWomanizer;

	AI_Output(hero, self, "Info_Mod_Jack_Irdorath6_15_00"); //Lass uns zu der Insel aufbrechen.

	if (Mod_SagittaDabei == 1)
	{
		Mod_JackWomanizer += 1;
	};
	if (Mod_VelayaDabei == 1)
	{
		Mod_JackWomanizer += 1;
	};
	if (Mod_UrielaDabei == 1)
	{
		Mod_JackWomanizer += 1;
	};
	if (Mod_CassiaDabei == 1)
	{
		Mod_JackWomanizer += 1;
	};

	if (Mod_JackWomanizer >= 3)
	{
		AI_Output(self, hero, "Info_Mod_Jack_Irdorath6_14_01"); //Man, da war ich schon jahrelang Seemann, aber so viele Frauen an Bord bei einer Kampfexpedition… das wird mir keiner glauben, wenn ich das erzähle.

		if (Mod_JackWomanizer == 3)
		{
			B_GivePlayerXP	(1000);
		}
		else
		{
			B_GivePlayerXP	(1500);
		};
	};

	AI_Output(self, hero, "Info_Mod_Jack_Irdorath6_14_02"); //Na, dann ... Anker einziehen, Segel setzen. Dass ich das noch mal erleben darf ...

	Mod_JackHW = 4;

	B_GivePlayerXP	(1000);

	B_SetTopicStatus	(TOPIC_MOD_HQ_CREW, LOG_SUCCESS);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Jack_Masut (C_INFO)
{
	npc		= Mod_586_NONE_Jack_NW;
	nr		= 1;
	condition	= Info_Mod_Jack_Masut_Condition;
	information	= Info_Mod_Jack_Masut_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo. Einer hier ist zuviel.";
};

FUNC INT Info_Mod_Jack_Masut_Condition()
{
	if (Mod_ASS_Krieger == 1)
	&& (Mod_ASS_Jack == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Jack_Masut_Info()
{
	AI_Output(hero, self, "Info_Mod_Jack_Masut_15_00"); //Hallo. Einer hier ist zuviel.
	AI_Output(self, hero, "Info_Mod_Jack_Masut_14_01"); //Dann geh doch wieder raus. Ich hab dich nicht gerufen.
	AI_Output(hero, self, "Info_Mod_Jack_Masut_15_02"); //Das verstehst du falsch. DU bist zuviel.
	AI_Output(self, hero, "Info_Mod_Jack_Masut_14_03"); //Das kann nicht sein. Ich wohne schon ewig hier oben.
	AI_Output(hero, self, "Info_Mod_Jack_Masut_15_04"); //Dieser Turm wird aber gebraucht. Ohne dich.
	AI_Output(self, hero, "Info_Mod_Jack_Masut_14_05"); //Nur über meine Leiche.

	Info_ClearChoices	(Info_Mod_Jack_Masut);

	Info_AddChoice	(Info_Mod_Jack_Masut, "Bleib ruhig. Bist eigentlich ein netter, alter Kerl. Würde dich ungern töten.", Info_Mod_Jack_Masut_B);
	Info_AddChoice	(Info_Mod_Jack_Masut, "Das kannst du haben. Ich soll dich eh töten.", Info_Mod_Jack_Masut_A);
};

FUNC VOID Info_Mod_Jack_Masut_B()
{
	AI_Output(hero, self, "Info_Mod_Jack_Masut_B_15_00"); //Bleib ruhig. Bist eigentlich ein netter, alter Kerl. Würde dich ungern töten.
	AI_Output(self, hero, "Info_Mod_Jack_Masut_B_14_01"); //Mir kommen die Tränen. Was wäre dir lieber?
	AI_Output(hero, self, "Info_Mod_Jack_Masut_B_15_02"); //Du würdest das Feld räumen und untertauchen.
	AI_Output(self, hero, "Info_Mod_Jack_Masut_B_14_03"); //Hört sich vernünftig an. Bin auch nicht mehr der Jüngste ...
	AI_Output(hero, self, "Info_Mod_Jack_Masut_B_15_04"); //Du verschwindest also und tauchst unter? Aber richtig. Wir haben Späher in Khorinis.
	AI_Output(self, hero, "Info_Mod_Jack_Masut_B_14_05"); //Versprochen. Ich verschwinde.
	AI_Output(hero, self, "Info_Mod_Jack_Masut_B_15_06"); //Dann gib mir deinen Degen. Ich brauch einen Beweis für deinen Tod.
	AI_Output(self, hero, "Info_Mod_Jack_Masut_B_14_07"); //Hier.

	B_GiveInvItems	(self, hero, ItMw_Degen_Jack, 1);

	AI_Output(hero, self, "Info_Mod_Jack_Masut_B_15_08"); //Das muss sein. Und lass deinen Kram hier. Nimm nur das Nötigste mit.
	AI_Output(self, hero, "Info_Mod_Jack_Masut_B_14_09"); //Verstehe.

	B_GivePlayerXP	(1000);

	Mod_ASS_Jack = 1;

	B_LogEntry	(TOPIC_MOD_ASS_JACK, "Jack wird untertauchen. Als Beweis seines Todes hat er mir seinen Degen gegeben. Auf zu Masut.");

	Info_ClearChoices	(Info_Mod_Jack_Masut);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ASSIS");
};

FUNC VOID Info_Mod_Jack_Masut_A()
{
	AI_Output(hero, self, "Info_Mod_Jack_Masut_A_15_00"); //Das kannst du haben. Ich soll dich eh töten.
	AI_Output(self, hero, "Info_Mod_Jack_Masut_A_14_01"); //Na, dann komm doch, Großmaul.

	Mod_ASS_Jack = 2;

	Info_ClearChoices	(Info_Mod_Jack_Masut);

	self.flags = 0;

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_GuildEnemy, 0);
};

INSTANCE Info_Mod_Jack_Fanatiker (C_INFO)
{
	npc		= Mod_586_NONE_Jack_NW;
	nr		= 1;
	condition	= Info_Mod_Jack_Fanatiker_Condition;
	information	= Info_Mod_Jack_Fanatiker_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was machst du denn hier?";
};

FUNC INT Info_Mod_Jack_Fanatiker_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_Auftrag))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Andre_Erfahrung_Fanatiker))
	{
		return 1;
	};
};

FUnc VOID Info_Mod_Jack_Fanatiker_Info()
{
	AI_Output(hero, self, "Info_Mod_Jack_Fanatiker_15_00"); //Was machst du denn hier?
	AI_Output(self, hero, "Info_Mod_Jack_Fanatiker_14_01"); //Geflohen bin ich. Vor kurzem sind einige seltsame Typen in meinen Leuchtturm marschiert.
	AI_Output(self, hero, "Info_Mod_Jack_Fanatiker_14_02"); //Haben etwas von einem Schläfer erzählt.
	AI_Output(hero, self, "Info_Mod_Jack_Fanatiker_15_03"); //Was weißt du noch?
	AI_Output(self, hero, "Info_Mod_Jack_Fanatiker_14_04"); //Ein Teil von ihnen wurde dann irgendwo in den Wald vor der Stadt bei Lobart geschickt.
	AI_Output(self, hero, "Info_Mod_Jack_Fanatiker_14_05"); //Aber dann hab ich mich lieber aus dem Staub gemacht.
	AI_Output(self, hero, "Info_Mod_Jack_Fanatiker_14_06"); //Geh lieber nicht zum Leuchtturm.

	B_LogEntry	(TOPIC_MOD_MILIZ_SEKTENSPINNER, "Jack hat erzählt, dass die Anhänger des Schläfers nach Khorinis gezogen sind. Einige sind bei seinem Leuchtturm, ein kleinerer Trupp wurde in den Wald vor Khorinis bei Lobart geschicht. Den Leuchtturm sollte ich lieber vorerst unberührt lassen.");
};

INSTANCE Info_Mod_Jack_Pickpocket (C_INFO)
{
	npc		= Mod_586_NONE_Jack_NW;
	nr		= 1;
	condition	= Info_Mod_Jack_Pickpocket_Condition;
	information	= Info_Mod_Jack_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Jack_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Jack_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Jack_Pickpocket);

	Info_AddChoice	(Info_Mod_Jack_Pickpocket, DIALOG_BACK, Info_Mod_Jack_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Jack_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Jack_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Jack_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Jack_Pickpocket);
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

INSTANCE Info_Mod_Jack_EXIT (C_INFO)
{
	npc		= Mod_586_NONE_Jack_NW;
	nr		= 1;
	condition	= Info_Mod_Jack_EXIT_Condition;
	information	= Info_Mod_Jack_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Jack_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Jack_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};