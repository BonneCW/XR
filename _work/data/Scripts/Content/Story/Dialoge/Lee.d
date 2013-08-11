INSTANCE Info_Mod_Lee_Hi (C_INFO)
{
	npc		= Mod_525_SLD_Lee_MT;
	nr		= 1;
	condition	= Info_Mod_Lee_Hi_Condition;
	information	= Info_Mod_Lee_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lee_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Lee_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Lee_Hi_04_00"); //Du wieder? Nach deiner Nummer waren die Wassermagier ganz schön sauer. Du hast Glück, dass sie momentan nicht hier im Lager sind.
};

INSTANCE Info_Mod_Lee_AL (C_INFO)
{
	npc		= Mod_525_SLD_Lee_MT;
	nr		= 1;
	condition	= Info_Mod_Lee_AL_Condition;
	information	= Info_Mod_Lee_AL_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lee_AL_Condition()
{
	if (Kapitel >= 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lee_AL_Info()
{
	AI_Output(self, hero, "Info_Mod_Lee_AL_04_00"); //Nicht zu fassen ... das Alte Lager von Orks überrannt. Ich weiß nicht, ob ich jetzt lachen oder weinen soll ...
};

INSTANCE Info_Mod_Lee_WieStehts (C_INFO)
{
	npc		= Mod_525_SLD_Lee_MT;
	nr		= 1;
	condition	= Info_Mod_Lee_WieStehts_Condition;
	information	= Info_Mod_Lee_WieStehts_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie sieht es hier im Lager eigentlich aus nach dem Fall der Barriere?";
};

FUNC INT Info_Mod_Lee_WieStehts_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lee_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Hagen_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lee_WieStehts_Info()
{
	AI_Output(hero, self, "Info_Mod_Lee_WieStehts_15_00"); //Wie sieht es hier im Lager eigentlich aus nach dem Fall der Barriere?
	AI_Output(self, hero, "Info_Mod_Lee_WieStehts_04_01"); //Ach, es ist nicht gerade einfacher geworden. Als die Barriere noch stand hatten wir alle ein gemeinsames Ziel: Ihren Fall und unsere Flucht.
	AI_Output(self, hero, "Info_Mod_Lee_WieStehts_04_02"); //Jetzt, da sie nicht mehr steht, verhindert nur ein hartes Regiment, dass hier totale Anarchie Ausbricht. Sylvio ist mir da eine große Hilfe, der weiß, wie man mit Strolchen und Tagedieben umgehen muss.
	AI_Output(hero, self, "Info_Mod_Lee_WieStehts_15_03"); //Ja, und warum flieht ihr nicht einfach alle aus dem Minental, wie ursprünglich geplant?
	AI_Output(self, hero, "Info_Mod_Lee_WieStehts_04_04"); //Und wohin bitte? Den Paladinen, die sich in Khorinis niedergelassen haben in die Arme und danach der Galgen?
	AI_Output(hero, self, "Info_Mod_Lee_WieStehts_15_05"); //Nun ...
	AI_Output(self, hero, "Info_Mod_Lee_WieStehts_04_06"); //Nein, wenn wir nicht der Gerichtsbarkeit des Königs und seiner Paladine zum Opfer fallen wollen müssen wir schon etwas planvoller vorgehen.
	AI_Output(self, hero, "Info_Mod_Lee_WieStehts_04_07"); //Einige unserer Söldner haben sich ja bereits über den Pass geschlichen und sich in Khorinis auf dem Großbauernhof niedergelassen, um die Lage auszukundschaften, wie du schon sicherlich weißt.
	AI_Output(hero, self, "Info_Mod_Lee_WieStehts_15_08"); //Warum bitte geschlichen? Und warum nur so wenige?
	AI_Output(self, hero, "Info_Mod_Lee_WieStehts_04_09"); //Sind dir schon mal die schrägen Vögel am Pass aufgefallen? Die Königstreuen nennen sie sich. Der König scheint sie dorthin gesandt zu haben, aber frag mich nicht, was sie da vorhaben.
	AI_Output(self, hero, "Info_Mod_Lee_WieStehts_04_10"); //Naja, jedenfalls sind das kampferprobte Kerle, die uns die Tour versauen könnten, wenn gleich ein ganzer Pulk von uns über den Pass wollte.
	AI_Output(self, hero, "Info_Mod_Lee_WieStehts_04_11"); //Und dann, tja, ist da noch der alte Zwist mit dem Alten Lager. Sie haben zwar ihre Einnahmequelle, ihre Mine, verloren, verkehren jetzt aber wie eine Hure mit König und jedem anderen, der Geld und Erz hat.
	AI_Output(self, hero, "Info_Mod_Lee_WieStehts_04_12"); //Und man kann nie wissen, was die als nächstes vorhaben. Daher möchte ich auf keinen Fall zu viele meiner Männer aus dem Schutz des Lagers abziehen, sondern erst mal alles gut planen und vorbereiten.
	AI_Output(hero, self, "Info_Mod_Lee_WieStehts_15_13"); //Und wie sehen diese ,,Vorbereitungen’’ aus?
	AI_Output(self, hero, "Info_Mod_Lee_WieStehts_04_14"); //Wir trainieren unsere Leute und bereiten sie auf den finalen Schlag gegen den König vor. Sonst werden wir nie wirklich in Frieden leben können.
	AI_Output(hero, self, "Info_Mod_Lee_WieStehts_15_15"); //Gegen den König? Aber der ist doch auf dem Festland.
	AI_Output(self, hero, "Info_Mod_Lee_WieStehts_04_16"); //Ja, auf dem Festland und geschwächt von den Orks. Zu einem günstigen Zeitpunkt brechen wir aus dem Minental aus, bemächtigen uns eines Schiffes und statten dem König einen Besuch ab.
	AI_Output(self, hero, "Info_Mod_Lee_WieStehts_04_17"); //Und da es auf dem Festland mittlerweile von Orks nur so wimmeln soll, schulen wir viele unsere Männer speziell im Kampf gegen Orks, bilden sie zu Orkjägern aus, damit sie den behaarten Grünhäuten zeigen können, dass mit uns nicht zu spaßen ist.

	if (hero.guild == GIL_MIL) {
		AI_Output(self, hero, "Info_Mod_Lee_WieStehts_04_18"); //Wir nehmen aber nur die besten in die Reihen der Orkjäger auf. Dich würde ich auch gerne dabei haben, da du schon früher gezeigt hast, dass du über Kampfkraft und Verstand verfügst.
		AI_Output(self, hero, "Info_Mod_Lee_WieStehts_04_19"); //Sylvio führt die Orkjäger an und entscheidet darüber, wer mit machen darf. Schau eben, wo du dich im Lager nützlich machen kannst.

		Log_CreateTopic	(TOPIC_MOD_SLD_ORKJAEGER, LOG_MISSION);
		B_SetTopicStatus	(TOPIC_MOD_SLD_ORKJAEGER, LOG_RUNNING);
		B_LogEntry_More	(TOPIC_MOD_SLD_ORKJAEGER, TOPIC_MOD_HAGEN_ASYLANTEN, "Sylvio entscheidet, wer bei den Orkjägern aufgenommen wird.", "Lee plant, mit seinen Gefolgsleuten aus dem Minental auszubrechen und zum Festland zu gelangen, wo sie den König stürzen wollen. Der Ausbruch wird bereits vorbereitet.");
	} else {
		B_LogEntry	(TOPIC_MOD_HAGEN_ASYLANTEN, "Lee plant, mit seinen Gefolgsleuten aus dem Minental auszubrechen und zum Festland zu gelangen, wo sie den König stürzen wollen. Der Ausbruch wird bereits vorbereitet.");
	};
};

INSTANCE Info_Mod_Lee_Aufgabe (C_INFO)
{
	npc		= Mod_525_SLD_Lee_MT;
	nr		= 1;
	condition	= Info_Mod_Lee_Aufgabe_Condition;
	information	= Info_Mod_Lee_Aufgabe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du eine Aufgabe für mich?";
};

FUNC INT Info_Mod_Lee_Aufgabe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lee_WieStehts))
	&& (hero.guild == GIL_MIL)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lee_Aufgabe_Info()
{
	AI_Output(hero, self, "Info_Mod_Lee_Aufgabe_15_00"); //Hast du eine Aufgabe für mich?
	AI_Output(self, hero, "Info_Mod_Lee_Aufgabe_04_01"); //Ja, da wäre tatsächlich etwas, was du erledigen könntest. Zuletzt hat mir ein Informant nämlich berichtet, dass sich im Alten Lager was zusammenzubrauen scheint. Geh hin und spioniere etwas.
	AI_Output(self, hero, "Info_Mod_Lee_Aufgabe_04_02"); //Unterhalte dich dazu mit möglichst vielen Schatten, da man bei denen unter der Hand immer die besten Informationen erhalten kann.
	AI_Output(self, hero, "Info_Mod_Lee_Aufgabe_04_03"); //Mordrag wird dir dazu eine Schattenrüstung geben, die er noch von seinem Aufenthalt im Alten Lager vor dem Fall der Barriere hat. Du findest ihn in der Kneipe.

	Log_CreateTopic	(TOPIC_MOD_SLD_SPY, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SLD_SPY, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_SLD_SPY, "Lee gab mir den Auftrag im Alten Lager zu spionieren. Ich soll mir dazu eine Schattenrüstung von Mordrag holen und mich mit möglichst vielen Schatten unterhalten.");
};

INSTANCE Info_Mod_Lee_GotoSylvio (C_INFO)
{
	npc		= Mod_525_SLD_Lee_MT;
	nr		= 1;
	condition	= Info_Mod_Lee_GotoSylvio_Condition;
	information	= Info_Mod_Lee_GotoSylvio_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lee_GotoSylvio_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lee_Aufgabe))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lee_GotoSylvio_Info()
{
	AI_Output(self, hero, "Info_Mod_Lee_GotoSylvio_04_00"); //Achja, fast hätte ich es noch vergessen. Sylvio wollte sich noch mit demjenigen unterhalten, dem ich diesen Auftrag zuwies. Geh also am besten vorher noch zu ihm.

	B_LogEntry	(TOPIC_MOD_SLD_SPY, "Sylvio wollte mich noch zuvor sprechen.");
};

INSTANCE Info_Mod_Lee_Infos (C_INFO)
{
	npc		= Mod_525_SLD_Lee_MT;
	nr		= 1;
	condition	= Info_Mod_Lee_Infos_Condition;
	information	= Info_Mod_Lee_Infos_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe wichtige Informationen (...)";
};

FUNC INT Info_Mod_Lee_Infos_Condition()
{
	if (Mod_SLD_Spy == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lee_Infos_Info()
{
	AI_Output(hero, self, "Info_Mod_Lee_Infos_15_00"); //Ich habe wichtige Informationen aus meinen Gesprächen mit einigen Schatten gewonnen. Offenbar ist ein Gardist einem Mord zum Opfer gefallen.
	AI_Output(hero, self, "Info_Mod_Lee_Infos_15_01"); //Ein anderer Gardist will einen von unseren Männern als Täter ausgemacht haben und das Alte Lager plant einen Überfall auf uns im Morgengrauen der nächsten Tage.
	AI_Output(self, hero, "Info_Mod_Lee_Infos_04_02"); //(erschüttert) Was?! Das Alte Lager kriegt wohl den Hals nicht voll.
	AI_Output(self, hero, "Info_Mod_Lee_Infos_04_03"); //(nachdenklicher) Über die Berge können sie nicht mehr kommen, dafür haben wir schon gesorgt. Am ehesten werden sie es wohl mit einem frontalen Überfall versuchen, der uns einige Verluste bescheren soll.
	AI_Output(self, hero, "Info_Mod_Lee_Infos_04_04"); //Ich werde meine Männer die nächsten Tage immer im Morgengrauen beim Haupteingang in Position bringen.
	AI_Output(self, hero, "Info_Mod_Lee_Infos_04_05"); //(zum Helden) Wenn du auch dabei wärest, würde es dir einige Pluspunkte bescheren. Obwohl du uns natürlich jetzt schon einen großen Dienst erwiesen hast.

	B_LogEntry	(TOPIC_MOD_SLD_SPY, "Lee will den Angriff der Gardisten im Morgengrauen am Haupteingang abfangen. Wenn ich dabei wäre, könnte ich mich als Kämpfer bewähren.");

	Mod_SLD_Spy = 2;

	Mod_SLD_KampfDay = Wld_GetDay();

	B_GivePlayerXP	(250);

	B_StartOtherRoutine	(self, "GARDISTEN");
	B_StartOtherRoutine	(Mod_1283_SLD_Soeldner_MT, "GARDISTEN");
	B_StartOtherRoutine	(Mod_1282_SLD_Soeldner_MT, "GARDISTEN");
	B_StartOtherRoutine	(Mod_1281_SLD_Soeldner_MT, "GARDISTEN");
	B_StartOtherRoutine	(Mod_1280_SLD_Soeldner_MT, "GARDISTEN");
	B_StartOtherRoutine	(Mod_1278_SLD_Soeldner_MT, "GARDISTEN");
	B_StartOtherRoutine	(Mod_1279_SLD_Soeldner_MT, "GARDISTEN");
	B_StartOtherRoutine	(Mod_1277_SLD_Soeldner_MT, "GARDISTEN");
	B_StartOtherRoutine	(Mod_1276_SLD_Soeldner_MT, "GARDISTEN");
	B_StartOtherRoutine	(Mod_1284_SLD_Soeldner_MT, "GARDISTEN");
};

INSTANCE Info_Mod_Lee_SchlachtVerpasst (C_INFO)
{
	npc		= Mod_525_SLD_Lee_MT;
	nr		= 1;
	condition	= Info_Mod_Lee_SchlachtVerpasst_Condition;
	information	= Info_Mod_Lee_SchlachtVerpasst_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lee_SchlachtVerpasst_Condition()
{
	if (Mod_SLD_Spy == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lee_SchlachtVerpasst_Info()
{
	AI_Output(self, hero, "Info_Mod_Lee_SchlachtVerpasst_04_00"); //Schade, dass du beim Kampf nicht dabei warst. Den Gardisten haben wir eine ordentliche Abreibung verpasst. Von einem sterbenden Gardisten habe ich noch etwas mehr über den Mord erfahren.
	AI_Output(self, hero, "Info_Mod_Lee_SchlachtVerpasst_04_01"); //Zeitpunkt und Erscheinungsbild passen nur auf Sentenza als Mörder. Der kriegt was zu hören. Mit denen aus dem Alten Lager Geschäfte machen, also wirklich ...
	AI_Output(self, hero, "Info_Mod_Lee_SchlachtVerpasst_04_02"); //Hier, dein Sold.

	B_ShowGivenThings	("200 Gold und 8 Erz erhalten");

	CreateInvItems	(hero, ItMi_Gold, 200);
	CreateInvItems	(hero, ItMi_Nugget, 8);

	B_GivePlayerXP	(200);

	Mod_SLD_Spy = 7;

	B_SetTopicStatus	(TOPIC_MOD_SLD_SPY, LOG_SUCCESS);

	B_StartOtherRoutine	(self, "START");
	B_StartOtherRoutine	(Mod_1283_SLD_Soeldner_MT, "START");
	B_StartOtherRoutine	(Mod_1282_SLD_Soeldner_MT, "START");
	B_StartOtherRoutine	(Mod_1281_SLD_Soeldner_MT, "START");
	B_StartOtherRoutine	(Mod_1280_SLD_Soeldner_MT, "START");
	B_StartOtherRoutine	(Mod_1278_SLD_Soeldner_MT, "START");
	B_StartOtherRoutine	(Mod_1279_SLD_Soeldner_MT, "START");
	B_StartOtherRoutine	(Mod_1277_SLD_Soeldner_MT, "START");
	B_StartOtherRoutine	(Mod_1276_SLD_Soeldner_MT, "START");
	B_StartOtherRoutine	(Mod_1284_SLD_Soeldner_MT, "START");
};

INSTANCE Info_Mod_Lee_SchlachtDa (C_INFO)
{
	npc		= Mod_525_SLD_Lee_MT;
	nr		= 1;
	condition	= Info_Mod_Lee_SchlachtDa_Condition;
	information	= Info_Mod_Lee_SchlachtDa_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lee_SchlachtDa_Condition()
{
	if (Mod_SLD_Spy == 2)
	&& (Wld_GetDay() > Mod_SLD_KampfDay)
	&& (Wld_IsTime(05,00,08,00))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lee_SchlachtDa_Info()
{
	AI_Output(self, hero, "Info_Mod_Lee_SchlachtDa_04_00"); //Schön, dass du da bist. Da kommen sie auch schon.

	AI_StopProcessInfos	(self);

	Wld_InsertNpc	(Mod_7221_GRD_Gardist_MT, "OW_PATH_066");
	Wld_InsertNpc	(Mod_7222_GRD_Gardist_MT, "OW_PATH_066");
	Wld_InsertNpc	(Mod_7223_GRD_Gardist_MT, "OW_PATH_066");
	Wld_InsertNpc	(Mod_7224_GRD_Gardist_MT, "OW_PATH_066");
	Wld_InsertNpc	(Mod_7225_GRD_Gardist_MT, "OW_PATH_066");
	Wld_InsertNpc	(Mod_7226_GRD_Gardist_MT, "OW_PATH_066");
	Wld_InsertNpc	(Mod_7227_GRD_Gardist_MT, "OW_PATH_066");
	Wld_InsertNpc	(Mod_7228_GRD_Gardist_MT, "OW_PATH_066");
	Wld_InsertNpc	(Mod_7229_GRD_Gardist_MT, "OW_PATH_066");
	Wld_InsertNpc	(Mod_7230_GRD_Gardist_MT, "OW_PATH_066");
};

INSTANCE Info_Mod_Lee_SchlachtDabei (C_INFO)
{
	npc		= Mod_525_SLD_Lee_MT;
	nr		= 1;
	condition	= Info_Mod_Lee_SchlachtDabei_Condition;
	information	= Info_Mod_Lee_SchlachtDabei_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lee_SchlachtDabei_Condition()
{
	if (Mod_SLD_Spy == 2)
	&& (Npc_KnowsInfo(hero, Info_Mod_Lee_SchlachtDa))
	&& (NpC_IsDead(Mod_7221_GRD_Gardist_MT))
	&& (NpC_IsDead(Mod_7222_GRD_Gardist_MT))
	&& (NpC_IsDead(Mod_7223_GRD_Gardist_MT))
	&& (NpC_IsDead(Mod_7224_GRD_Gardist_MT))
	&& (NpC_IsDead(Mod_7225_GRD_Gardist_MT))
	&& (NpC_IsDead(Mod_7226_GRD_Gardist_MT))
	&& (NpC_IsDead(Mod_7227_GRD_Gardist_MT))
	&& (NpC_IsDead(Mod_7228_GRD_Gardist_MT))
	&& (NpC_IsDead(Mod_7229_GRD_Gardist_MT))
	&& (NpC_IsDead(Mod_7230_GRD_Gardist_MT))
	&& (Mod_NL_SchlachtDa == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lee_SchlachtDabei_Info()
{
	AI_Output(self, hero, "Info_Mod_Lee_SchlachtDabei_04_00"); //Ausgezeichnet. Die hätten wir alle zerschmettert. Das Alte Lager wird etwas brauchen, bis es sich von dem Verlust erholt hat.
	AI_Output(self, hero, "Info_Mod_Lee_SchlachtDabei_04_01"); //Von einem sterbenden Gardisten habe ich noch etwas mehr über den Mord erfahren. Zeitpunkt und Erscheinungsbild passen nur auf Sentenza als Mörder.
	AI_Output(self, hero, "Info_Mod_Lee_SchlachtDabei_04_02"); //Der kriegt was zu hören. Mit denen aus dem Alten Lager Geschäfte machen, also wirklich ...
	AI_Output(self, hero, "Info_Mod_Lee_SchlachtDabei_04_03"); //Achja, hier hast du Gold und Erz als deinen wohlverdienten Sold.

	B_ShowGivenThings	("300 Gold und 10 Erz erhalten");

	CreateInvItems	(hero, ItMi_Gold, 300);
	CreateInvItems	(hero, ItMi_Nugget, 10);

	B_GivePlayerXP	(400);

	Mod_SLD_Spy = 7;

	B_SetTopicStatus	(TOPIC_MOD_SLD_SPY, LOG_SUCCESS);

	B_StartOtherRoutine	(self, "START");
	B_StartOtherRoutine	(Mod_1283_SLD_Soeldner_MT, "START");
	B_StartOtherRoutine	(Mod_1282_SLD_Soeldner_MT, "START");
	B_StartOtherRoutine	(Mod_1281_SLD_Soeldner_MT, "START");
	B_StartOtherRoutine	(Mod_1280_SLD_Soeldner_MT, "START");
	B_StartOtherRoutine	(Mod_1278_SLD_Soeldner_MT, "START");
	B_StartOtherRoutine	(Mod_1279_SLD_Soeldner_MT, "START");
	B_StartOtherRoutine	(Mod_1277_SLD_Soeldner_MT, "START");
	B_StartOtherRoutine	(Mod_1276_SLD_Soeldner_MT, "START");
	B_StartOtherRoutine	(Mod_1284_SLD_Soeldner_MT, "START");
};

INSTANCE Info_Mod_Lee_Kagan (C_INFO)
{
	npc		= Mod_525_SLD_Lee_MT;
	nr		= 1;
	condition	= Info_Mod_Lee_Kagan_Condition;
	information	= Info_Mod_Lee_Kagan_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lee_Kagan_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kagan_Isidro))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lee_Kagan_Info()
{
	AI_Output(self, hero, "Info_Mod_Lee_Kagan_04_00"); //Ich habe gehört, dass durch dein Einwirken die beiden Sumpffritzen das Lager verlassen haben.
	AI_Output(hero, self, "Info_Mod_Lee_Kagan_15_01"); //Nun ...
	AI_Output(self, hero, "Info_Mod_Lee_Kagan_04_02"); //Das hast du wirklich gut gemacht. Nun werden die Männer im Lager noch seltener zu dem Genuss von Sumpfkraut verführt.
	AI_Output(self, hero, "Info_Mod_Lee_Kagan_04_03"); //Hier hast du etwas Erz und Gold als Entlohnung.

	B_ShowGivenThings	("200 Gold und 6 Erz erhalten");

	CreateInvItems	(hero, ItMi_Gold, 200);
	CreateInvItems	(hero, ItMi_Nugget, 6);

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Lee_OrkjaegerDabei (C_INFO)
{
	npc		= Mod_525_SLD_Lee_MT;
	nr		= 1;
	condition	= Info_Mod_Lee_OrkjaegerDabei_Condition;
	information	= Info_Mod_Lee_OrkjaegerDabei_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lee_OrkjaegerDabei_Condition()
{
	if (Mod_Gilde == 19)
	&& (Mod_SLD_Orkjaeger == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lee_OrkjaegerDabei_Info()
{
	AI_Output(self, hero, "Info_Mod_Lee_OrkjaegerDabei_04_00"); //Gratulation. Habe gehört, dass du bei den Orkjägern dabei bist. Hätte mich auch gewundert, wenn du es nicht geschafft hättest.
};

INSTANCE Info_Mod_Lee_OrkjaegerNoway (C_INFO)
{
	npc		= Mod_525_SLD_Lee_MT;
	nr		= 1;
	condition	= Info_Mod_Lee_OrkjaegerNoway_Condition;
	information	= Info_Mod_Lee_OrkjaegerNoway_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lee_OrkjaegerNoway_Condition()
{
	if (Mod_SLD_Orkjaeger == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lee_OrkjaegerNoway_Info()
{
	AI_Output(self, hero, "Info_Mod_Lee_OrkjaegerNoway_04_00"); //Wie sieht es eigentlich mit deiner Aufnahme bei den Orkjägern aus? Geht es voran?
	AI_Output(hero, self, "Info_Mod_Lee_OrkjaegerNoway_15_01"); //Nein. Sylvio hat beschlossen mich nicht aufzunehmen.
	AI_Output(self, hero, "Info_Mod_Lee_OrkjaegerNoway_04_02"); //Was?! Einen Kämpfer wie dich hätte ich nur zu gerne in den Reihen der Orkjäger gesehen. Zu schade. Es sei denn ...
	AI_Output(hero, self, "Info_Mod_Lee_OrkjaegerNoway_15_03"); //Ja, was?
	AI_Output(self, hero, "Info_Mod_Lee_OrkjaegerNoway_04_04"); //Nun, wenn du ihn zum Wettstreit forderst und den Sieg davonträgst, wärest du automatisch Anführer der Orkjäger. So sind die Regeln.
};

INSTANCE Info_Mod_Lee_Wettstreit (C_INFO)
{
	npc		= Mod_525_SLD_Lee_MT;
	nr		= 1;
	condition	= Info_Mod_Lee_Wettstreit_Condition;
	information	= Info_Mod_Lee_Wettstreit_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dann fordere ich ihn zum Wettstreit.";
};

FUNC INT Info_Mod_Lee_Wettstreit_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lee_OrkjaegerNoway))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lee_Wettstreit_Info()
{
	AI_Output(hero, self, "Info_Mod_Lee_Wettstreit_15_00"); //Dann fordere ich ihn zum Wettstreit.
	AI_Output(self, hero, "Info_Mod_Lee_Wettstreit_04_01"); //Dann geh zu Sylvio und sag ihm bescheid. Ich lasse in der Zwischenzeit alles vorbereiten.
	AI_Output(self, hero, "Info_Mod_Lee_Wettstreit_04_02"); //Komm dann wieder zu mir und ich unterrichte dich darüber, was du  zu tun hast.

	B_LogEntry	(TOPIC_MOD_SLD_ORKJAEGER, "Wenn ich Sylvio zum Wettstreit herausfordere und gewinnen, kann ich seine Position übernehmen und auf diesem Weg doch noch Orkjäger werden. Danach wird mir Lee erklären, was ich zu tun habe.");
};

INSTANCE Info_Mod_Lee_GiveMap (C_INFO)
{
	npc		= Mod_525_SLD_Lee_MT;
	nr		= 1;
	condition	= Info_Mod_Lee_GiveMap_Condition;
	information	= Info_Mod_Lee_GiveMap_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ok, wie sieht der Wettstreit aus?";
};

FUNC INT Info_Mod_Lee_GiveMap_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sylvio_Wettstreit))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lee_GiveMap_Info()
{
	AI_Output(hero, self, "Info_Mod_Lee_GiveMap_15_00"); //Ok, wie sieht der Wettstreit aus?
	AI_Output(self, hero, "Info_Mod_Lee_GiveMap_04_01"); //Hier hast du eine Karte.

	B_GiveInvItems	(self, hero, ItWr_Map_Wettstreit_01, 1);

	AI_Output(self, hero, "Info_Mod_Lee_GiveMap_04_02"); //Das blaue Kreuz zeigt dir den Aufenthaltsort eines Schlüssels, das rote den einer Truhe, zu welcher der Schlüssel passt. Es gibt einen 2ten Schlüssel, den Sylvio sucht.
	AI_Output(self, hero, "Info_Mod_Lee_GiveMap_04_03"); //Wer mit den Inhalt der Truhe zuerst besorgt hat gewonnen. Alles verstanden? Na dann los.

	B_LogEntry	(TOPIC_MOD_SLD_ORKJAEGER, "Lee hat mir eine Karte mit zwei Kreuzen gegeben. Das Blaue Kreuz zeigt mir, wo ich den Schlüssel für die Truhe finde, die durch das rote Kreuz gekennzeichnet ist. Ich soll den Inhalt der Truhe zu Lee bringen. Sylvio wird das gleiche Ziel verfolgen und dazu einen 2ten Schlüssel finden müssen.");

	Mod_SLD_Wettstreit = 1;

	Wld_InsertNpc	(Mod_7231_SLD_Organisator_MT,	"LOCATION_29_04");
	Wld_InsertNpc	(Mod_7232_SLD_Organisator_MT,	"OW_ABYSS_SPAWN_WARAN");

	B_KillNpc	(Mod_7231_SLD_Organisator_MT);
	B_KillNpc	(Mod_7232_SLD_Organisator_MT);
};

INSTANCE Info_Mod_Lee_HabPfeife (C_INFO)
{
	npc		= Mod_525_SLD_Lee_MT;
	nr		= 1;
	condition	= Info_Mod_Lee_HabPfeife_Condition;
	information	= Info_Mod_Lee_HabPfeife_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe den Inhalt der Truhe.";
};

FUNC INT Info_Mod_Lee_HabPfeife_Condition()
{
	if (Mod_SLD_Wettstreit == 3)
	&& (Npc_HasItems(hero, ItMi_LeePipe) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lee_HabPfeife_Info()
{
	AI_Output(hero, self, "Info_Mod_Lee_HabPfeife_15_00"); //Ich habe den Inhalt der Truhe.
	AI_Output(self, hero, "Info_Mod_Lee_HabPfeife_04_01"); //Zeig her ...

	B_GiveInvItems	(hero, self, ItMi_LeePipe, 1);

	AI_Output(self, hero, "Info_Mod_Lee_HabPfeife_04_02"); //Tatsache. Damit hast du den Wettstreit gewonnen. Gratuliere!
	AI_Output(self, hero, "Info_Mod_Lee_HabPfeife_04_03"); //(zu sich selbst) Ich frage mich nur, wo die Söldner bleiben, die für die Schlüssel zuständig waren.
	AI_Output(self, hero, "Info_Mod_Lee_HabPfeife_04_04"); //(wieder zum Helden) Naja, egal, wie dem auch sei, damit bist du nun Anführer der Orkjäger und somit selbst Orkjäger. Hier ist deine neue Rüstung.

	B_ShowGivenThings	("Orkjägerrüstung erhalten");

	CreateInvItems	(hero, ItAr_Sld_H, 1);

	AI_UnequipArmor	(hero);
	AI_EquipArmor	(hero, ItAr_Sld_H);

	AI_Output(self, hero, "Info_Mod_Lee_HabPfeife_04_05"); //Ein gutes Stück. Deine Waffe kannst du dir bei Thofeistos abholen. Du wirst deine neuen Position bestimmt alle Ehre machen.

	if (Npc_KnowsInfo(hero, Info_Mod_Lee_Orkfriedhof))
	{
		AI_Output(self, hero, "Info_Mod_Lee_HabPfeife_04_06"); //So, jetzt kannst du auch zum Orkfriedhof eilen. Vielleicht kommst du ja noch rechtzeitig.
	};

	Snd_Play ("LEVELUP");

	B_GivePlayerXP	(600);

	B_Göttergefallen(2, 5);

	Mod_Gilde = 19;

	Mod_LeeOJGBoss = Wld_GetDay();

	B_SetTopicStatus	(TOPIC_MOD_SLD_ORKJAEGER, LOG_SUCCESS);

	if (!Npc_KnowsInfo(hero, Info_Mod_Tarrok_AtStonehenge))
	{
		B_StartOtherRoutine	(Mod_10000_Orc_Tarrok_MT, "START");
	};
};

INSTANCE Info_Mod_Lee_Orkfriedhof (C_INFO)
{
	npc		= Mod_525_SLD_Lee_MT;
	nr		= 1;
	condition	= Info_Mod_Lee_Orkfriedhof_Condition;
	information	= Info_Mod_Lee_Orkfriedhof_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lee_Orkfriedhof_Condition()
{
	if (Mod_NL_UOS == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lee_Orkfriedhof_Info()
{
	AI_Output(self, hero, "Info_Mod_Lee_Orkfriedhof_04_00"); //Hey, gut dass du vorbeikommst.
	
	B_Say	(hero, self, "$WHATSUP");

	AI_Output(self, hero, "Info_Mod_Lee_Orkfriedhof_04_02"); //Das Sumpflager hat sich an uns gewandt und um unsere Hilfe gebeten.
	AI_Output(self, hero, "Info_Mod_Lee_Orkfriedhof_04_03"); //Als einige Sumpffritzen kürzlich den Orkfriedhof nach Schätzen und Artefakten absuchten, erhoben sich plötzlich die sterblichen Überreste der Orks zu untotem Dasein. Nur einem Novizen ist die Flucht gelungen.
	AI_Output(self, hero, "Info_Mod_Lee_Orkfriedhof_04_04"); //Wir sollen nun unsere Fähigkeit im Kampf mit den Grünhäuten einsetzen und nach Überlebenden suchen.
	AI_Output(self, hero, "Info_Mod_Lee_Orkfriedhof_04_05"); //Die Bezahlung ist gut und unsere Jungs können ein bisschen Extratraining brauchen.
	AI_Output(hero, self, "Info_Mod_Lee_Orkfriedhof_15_06"); //Orkfriedhof?! Untote Orks?! Da muss ich unbedingt hin ...

	Log_CreateTopic	(TOPIC_MOD_SLD_FRIEDHOF, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SLD_FRIEDHOF, LOG_RUNNING);

	if (Mod_Gilde == 19)
	{
		AI_Output(self, hero, "Info_Mod_Lee_Orkfriedhof_04_07"); //Hey, mit soviel Begeisterung hatte ich gar nicht gerechnet, auch, wenn ich gehofft hatte, du würdest unsere Jungs im Kampf anführen.
		AI_Output(self, hero, "Info_Mod_Lee_Orkfriedhof_04_08"); //Sie warten bereits vor dem Orkfriedhof um loszulegen. Beeile dich, damit du nicht den ganzen Spaß versäumst.

		B_LogEntry	(TOPIC_MOD_SLD_FRIEDHOF, "Orkfriedhof?! Untote Orks?! Da muss der Schamane sein ...");
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Lee_Orkfriedhof_04_09"); //Hey, soviel Begeisterung für den Kampf ehrt dich. Du musst jedoch erst Orkjäger werden, um die Jungs bei ihrer Mission begleiten zu können.
		AI_Output(self, hero, "Info_Mod_Lee_Orkfriedhof_04_10"); //Aber viel Zeit hast du nicht mehr, bevor es losgeht. (zögerlich) Es gäbe nur noch die Möglichkeit ...
		AI_Output(hero, self, "Info_Mod_Lee_Orkfriedhof_15_11"); //Ja, was?
		AI_Output(self, hero, "Info_Mod_Lee_Orkfriedhof_04_12"); //Du müsstest Sylvio zum Wettstreit herausfordern und ihn besiegen, um seine Position einzunehmen. Wenn du das willst ...
		AI_Output(hero, self, "Info_Mod_Lee_Orkfriedhof_15_13"); //Ja, ich muss in diesen Friedhof.
		AI_Output(self, hero, "Info_Mod_Lee_Orkfriedhof_04_14"); //Ok, dann sag Sylvio bescheid und komm dann wieder zu mir.

		B_LogEntry_More	(TOPIC_MOD_SLD_ORKJAEGER, TOPIC_MOD_SLD_FRIEDHOF, "Wenn ich Sylvio zum Wettstreit herausfordere und gewinnen, kann ich seine Position übernehmen und auf diesem Weg doch noch Orkjäger werden. Danach wird mir Lee erklären, was ich zu tun habe.", "Orkfriedhof?! Untote Orks?! Da muss der Schamane sein ... Ich erhalte jedoch erst Einlass in den Friedhof, wenn ich Orkjäger bin.");
	};

	AI_Output(self, hero, "Info_Mod_Lee_Orkfriedhof_04_15"); //Hier hab ich noch ein paar Teleport-Spruchrollen für dich. Haben dir Gurus vor einiger Zeit angefertigt ...

	B_GiveInvItems	(self, hero, ItSc_TeleportOrkfriedhof, 3);
};

INSTANCE Info_Mod_Lee_OrkschamaneTot (C_INFO)
{
	npc		= Mod_525_SLD_Lee_MT;
	nr		= 1;
	condition	= Info_Mod_Lee_OrkschamaneTot_Condition;
	information	= Info_Mod_Lee_OrkschamaneTot_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lee_OrkschamaneTot_Condition()
{
	if ((Mod_NL_UOS == 8)
	|| (Mod_NL_UOS == 7))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lee_OrkschamaneTot_Info()
{
	if (Mod_NL_UOS == 7)
	{
		AI_Output(self, hero, "Info_Mod_Lee_OrkschamaneTot_04_00"); //Du hast es geschafft. Das Sumpflager war außerordentlich zufrieden über der Rettung seiner Leute und hat uns großzügig dafür honoriert. Hier ist dein Anteil.

		CreateInvItems	(hero, ItMi_Gold, 400);
		CreateInvItems	(hero, ItMi_Nugget, 4);
		CreateInvItems	(hero, ItPo_Health_03, 5);

		B_GivePlayerXP	(500);

		B_ShowGivenThings	("400 Gold, 4 Erzbrocken und 5 Extrakte der Heilung erhalten");

		AI_Output(self, hero, "Info_Mod_Lee_OrkschamaneTot_04_01"); //Aber nun sprich: Wo bleiben denn unsere Jungs. Machen sie eine wohlverdiente Rast im Sumpflager?
		AI_Output(hero, self, "Info_Mod_Lee_OrkschamaneTot_15_02"); //Ähh, nein. Nun ... die ganzen Untoten und Orks haben ihnen ziemlich zugesetzt. Was soll ich sagen ... alle sind tot (zu sich selbst) oder untot ...
		AI_Output(self, hero, "Info_Mod_Lee_OrkschamaneTot_04_03"); //(erschüttert) Ich hoffe, das ist ein übler Scherz.
		AI_Output(hero, self, "Info_Mod_Lee_OrkschamaneTot_15_04"); //Tja, ich wünschte, es wäre so.
		AI_Output(self, hero, "Info_Mod_Lee_OrkschamaneTot_04_05"); //(resigniert) So viele gute Männer ... Diese ... diese verfluchten Orks. Das werden sie mir büßen.

		if (Npc_KnowsInfo(hero, Info_Mod_Lee_HabPfeife))
		{
			AI_Output(self, hero, "Info_Mod_Lee_OrkschamaneTot_04_06"); //(wütend) Und du hast in deiner Position als Orkanführer kläglich versagt, wenn sie alle den Tod fanden.
		}
		else
		{
			AI_Output(self, hero, "Info_Mod_Lee_OrkschamaneTot_04_07"); //(wütend) Vielleicht habe ich mit Sylvio als Anführer der Orkjäger auch eine schlechte Wahl getroffen, wenn meine Jungs in so schlechter Form waren.
		};
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Lee_OrkschamaneTot_04_08"); //Was?! Du hier? Und was ist mit dem Orkfriedhof?
		AI_Output(hero, self, "Info_Mod_Lee_OrkschamaneTot_15_09"); //Nun, ich war dort ...
		AI_Output(self, hero, "Info_Mod_Lee_OrkschamaneTot_04_10"); //Ja, und weiter? Habt ihr jemanden retten können?
		AI_Output(hero, self, "Info_Mod_Lee_OrkschamaneTot_15_11"); //Nein, leider nicht. Sie sind jetzt ... ähh, waren alle tot.
		AI_Output(self, hero, "Info_Mod_Lee_OrkschamaneTot_04_12"); //(unzufrieden) Verdammt. Das wird die Sumpffritzen nicht freuen ...
		AI_Output(self, hero, "Info_Mod_Lee_OrkschamaneTot_04_13"); //Aber wo bleiben die anderen Jungs? Die machen sich doch bestimmt einen schönen Lenz im Sumpflager. Die sollen mal machen, dass sie hier herkommen.
		AI_Output(hero, self, "Info_Mod_Lee_OrkschamaneTot_15_14"); //Nun, das könnte etwas schwierig werden.
		AI_Output(self, hero, "Info_Mod_Lee_OrkschamaneTot_04_15"); //Was soll das jetzt wieder heißen?
		AI_Output(hero, self, "Info_Mod_Lee_OrkschamaneTot_15_16"); //Tja, dass die alle tot sind (zu sich selbst) oder untot.
		AI_Output(self, hero, "Info_Mod_Lee_OrkschamaneTot_04_17"); //(baff) Das ist doch wohl ein schlechter Scherz.
		AI_Output(hero, self, "Info_Mod_Lee_OrkschamaneTot_15_18"); //Nun, ich denke nicht. Zombies, Orks und untote Schamanen haben uns ziemlich zugesetzt.
		AI_Output(self, hero, "Info_Mod_Lee_OrkschamaneTot_04_19"); //(außer sich) Was?! So viele gute Männer? Diese ... diese verfluchten Orks, das werden sie mir büßen.

		if (Npc_KnowsInfo(hero, Info_Mod_Lee_HabPfeife))
		{
			AI_Output(self, hero, "Info_Mod_Lee_OrkschamaneTot_04_20"); //Und du trittst mir hier noch unter die Augen, nachdem du sie hast verrecken lassen?! Ihr Anführer?! Kläglich versagt hast du.
		}
		else
		{
			AI_Output(self, hero, "Info_Mod_Lee_OrkschamaneTot_04_21"); //Und Sylvio macht sich während dessen einen schönen Tag?! Vielleicht lag ich doch nicht so gut mit meiner Wahl, wenn die Jungs in so schlechter Form waren. Der kann was erleben.
		};

		B_GivePlayerXP	(200);
	};

	B_SetTopicStatus	(TOPIC_MOD_SLD_FRIEDHOF, LOG_SUCCESS);

	// Orkfriedhof wieder dicht machen

	Wld_SendTrigger	("EVT_ORCGRAVYARD_MOVER_01");
};

INSTANCE Info_Mod_Lee_FreieMine (C_INFO)
{
	npc		= Mod_525_SLD_Lee_MT;
	nr		= 1;
	condition	= Info_Mod_Lee_FreieMine_Condition;
	information	= Info_Mod_Lee_FreieMine_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lee_FreieMine_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Drachen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lee_FreieMine_Info()
{
	AI_Output(self, hero, "Info_Mod_Lee_FreieMine_04_00"); //Na endlich bist du da ...
	
	B_Say	(hero, self, "$WHATSUP");

	AI_Output(self, hero, "Info_Mod_Lee_FreieMine_04_02"); //In der Mine ist die Kacke am Dampfen. Ständige Minecrawlerattacken, egal, wie viele wir von den Biestern auch erledigen.
	AI_Output(self, hero, "Info_Mod_Lee_FreieMine_04_03"); //Du hast damals die Alte Mine von den Viechern gesäubert ...
	AI_Output(hero, self, "Info_Mod_Lee_FreieMine_15_04"); //... und da dachtest du an mich, um das Problem zu lösen.
	AI_Output(self, hero, "Info_Mod_Lee_FreieMine_04_05"); //Ja, du bist die qualifizierteste Ansprechperson, wenn es um diese Minenkrabbler geht.
	AI_Output(self, hero, "Info_Mod_Lee_FreieMine_04_06"); //Geh also zur Mine, und schau, was sich machen lässt.
	AI_Output(hero, self, "Info_Mod_Lee_FreieMine_15_07"); //Ok, ich wollte aber noch vorher mitteilen, dass auf Khorinis ...
	AI_Output(self, hero, "Info_Mod_Lee_FreieMine_04_08"); //(unterbricht) Das hat später Zeit. Zuerst die Crawler.

	Log_CreateTopic	(TOPIC_MOD_NL_CRAWLER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_NL_CRAWLER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_NL_CRAWLER, "Die freie Mine leidet unter einer Minecrawlerplage. Lee hat mir aufgetragen die Sache in Ordnung zu bringen.");
};

INSTANCE Info_Mod_Lee_Gormgniez (C_INFO)
{
	npc		= Mod_525_SLD_Lee_MT;
	nr		= 1;
	condition	= Info_Mod_Lee_Gormgniez_Condition;
	information	= Info_Mod_Lee_Gormgniez_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lee_Gormgniez_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Endolf_Gormgniez))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lee_Gormgniez_Info()
{
	AI_Output(self, hero, "Info_Mod_Lee_Gormgniez_04_00"); //Ist es dir gelungen das Crawlerproblem in der Mine zu lösen?
	AI_Output(hero, self, "Info_Mod_Lee_Gormgniez_15_01"); //Ja, dort herrscht wieder Ruhe.
	AI_Output(self, hero, "Info_Mod_Lee_Gormgniez_04_02"); //Sehr gut, ich habe auch nichts anderes erwartet. Hier dein Sold.

	B_ShowGivenThings	("400 Gold und 10 Erz erhalten");

	CreateInvItems	(hero, ItMi_Gold, 400);
	CreateInvItems	(hero, ItMi_Nugget, 10);

	AI_Output(self, hero, "Info_Mod_Lee_Gormgniez_04_03"); //Gibt es sonst Neuigkeiten aus der Welt, nennenswertes, wissenswertes?
	AI_Output(hero, self, "Info_Mod_Lee_Gormgniez_15_04"); //Nunja, zum Beispiel wurde Khorinis von Drachen heimgesucht.
	AI_Output(self, hero, "Info_Mod_Lee_Gormgniez_04_05"); //Drachen? Du nimmst mich doch auf den Arm, oder? Aber wenn es wahr sein sollte ...
	AI_Output(hero, self, "Info_Mod_Lee_Gormgniez_15_06"); //Es ist wahr.
	AI_Output(self, hero, "Info_Mod_Lee_Gormgniez_04_07"); //(wie besessen) Ja, ich wusste es. Alle haben mich für verrückt gehalten, als ich die teuren Drachenjägerrüstungen gekauft habe. Aber jetzt, ja, jetzt kommen sie zum Einsatz.
	AI_Output(self, hero, "Info_Mod_Lee_Gormgniez_04_08"); //Ich schicke gleich meine Elite zur Unterstützung nach Khorinis.
	AI_Output(self, hero, "Info_Mod_Lee_Gormgniez_04_09"); //Geh zu Thofeistos, er soll dir Erz zur Belohnung geben.

	B_LogEntry	(TOPIC_MOD_NL_CRAWLER, "Ich soll mir bei Thofeistos einige Erzbrocken als Belohnung abholen.");

	B_RemoveNpc	(Mod_1288_SLD_Butch_MT);
	B_RemoveNpc	(Mod_1306_SLD_Organisator_MT);
	B_RemoveNpc	(Mod_1314_SLD_Organisator_MT);
};

INSTANCE Info_Mod_Lee_Plage (C_INFO)
{
	npc		= Mod_525_SLD_Lee_MT;
	nr		= 1;
	condition	= Info_Mod_Lee_Plage_Condition;
	information	= Info_Mod_Lee_Plage_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lee_Plage_Condition()
{
	if (Mod_NL_JeremiahHasEier == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lee_Plage_Info()
{
	AI_Output(self, hero, "Info_Mod_Lee_Plage_04_00"); //(aufgebracht) Verdammter Dreck, das hatte wirklich noch zu allem Überfluss gefehlt.
	AI_Output(hero, self, "Info_Mod_Lee_Plage_15_01"); //Was ist es diesmal? Untote, Orks, oder gar schlimmeres?
	AI_Output(self, hero, "Info_Mod_Lee_Plage_04_02"); //Ich meine dieses dreckige Ungeziefer, dass aus dem See gekrochen kommt, diese Würmer und Krabben.
	AI_Output(self, hero, "Info_Mod_Lee_Plage_04_03"); //Überall krabbeln diese Viecher hin, besudeln alles Essbare, was man offen stehen lässt, man kann kein Auge zumachen, ohne, dass diese Parasiten gleich an einem kleben und der See stinkt auch langsam von denen.
	AI_Output(hero, self, "Info_Mod_Lee_Plage_15_04"); //Tja, was lässt sich da machen.
	AI_Output(self, hero, "Info_Mod_Lee_Plage_04_05"); //(genervt) Was sich da machen lässt? Das will ich dir sagen.
	AI_Output(self, hero, "Info_Mod_Lee_Plage_04_06"); //Auf Khorinis laufen doch diese Jäger und Waldläufer umher. Die kennen sich doch mit so einem Mist aus.
	AI_Output(self, hero, "Info_Mod_Lee_Plage_04_07"); //Da du dich sowieso die ganze Zeit auf der ganzen Insel herumtreibst, kannst du doch gleich zu einem hingehen und ihn um Rat fragen.
	AI_Output(hero, self, "Info_Mod_Lee_Plage_15_08"); //Ok, dann mach ich mich mal auf den Weg ...
	AI_Output(self, hero, "Info_Mod_Lee_Plage_04_09"); //(drängend) Ja, mach mal ein bisschen hin, bevor die ganze Gegend von diesem Dreck verseucht ist und wir das Lager noch zuletzt räumen müssen.

	Log_CreateTopic	(TOPIC_MOD_NL_PLAGE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_NL_PLAGE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_NL_PLAGE, "Im Neuen Lager entsteigt lästiges Ungeziefer dem See. Lee will, dass ich bei den Waldläufern nachfrage, wie man dieser Plage Herr werden kann.");
};

INSTANCE Info_Mod_Lee_PlageFertig (C_INFO)
{
	npc		= Mod_525_SLD_Lee_MT;
	nr		= 1;
	condition	= Info_Mod_Lee_PlageFertig_Condition;
	information	= Info_Mod_Lee_PlageFertig_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lee_PlageFertig_Condition()
{
	if (Mod_NL_JeremiahHasEier == 6)
	&& (Wld_GetDay()-3 >= Mod_NL_JeremiahHasEier_Day)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lee_PlageFertig_Info()
{
	AI_Output(self, hero, "Info_Mod_Lee_PlageFertig_04_00"); //Die Parasiten sind schon deutlich weniger geworden. War das dein Werk?
	AI_Output(hero, self, "Info_Mod_Lee_PlageFertig_15_01"); //Ja, ich hatte durchaus meinen Anteil daran. Nicht mehr lange und die Plage dürfte endgültig Geschichte sein.
	AI_Output(self, hero, "Info_Mod_Lee_PlageFertig_04_02"); //Tatsächlich, keine Mistviecher mehr am See?
	AI_Output(hero, self, "Info_Mod_Lee_PlageFertig_15_03"); //Ähh, nun, außer den Lurkern, die ich wieder angesiedelt habe.
	AI_Output(self, hero, "Info_Mod_Lee_PlageFertig_04_04"); //Was, wie, willst du mich auf den Arm nehmen?
	AI_Output(hero, self, "Info_Mod_Lee_PlageFertig_15_05"); //Nein, die Lurker sind die natürlichen Feinde dieses Krabbelgetiers.
	AI_Output(hero, self, "Info_Mod_Lee_PlageFertig_15_06"); //Es ist wichtig, dass zumindest eine kleine Population von ihnen am See bestehen bleibt.
	AI_Output(self, hero, "Info_Mod_Lee_PlageFertig_04_07"); //Na, meinetwegen. Auf jeden Fall hast du echt gute Arbeit geleistet und dem Lager einen riesen Dienst erwiesen.
	AI_Output(self, hero, "Info_Mod_Lee_PlageFertig_04_08"); //Hier, die Belohnung hast du dir mehr als verdient.

	B_ShowGivenThings	("400 Gold, 20 Erz, 5 reine Lebensenergien und Elixier des Lebens erhalten");

	CreateInvItems	(hero, ItMi_Gold, 400);
	CreateInvItems	(hero, ItMi_Nugget, 20);
	CreateInvItems	(hero, ItPo_Health_Addon_04, 5);
	CreateInvItems	(hero, ItPo_Perm_Health, 1);

	B_SetTopicStatus	(TOPIC_MOD_NL_PLAGE, LOG_SUCCESS);

	CurrentNQ += 1;

	B_GivePlayerXP	(600);
};

INSTANCE Info_Mod_Lee_ZugangKneipe (C_INFO)
{
	npc		= Mod_525_SLD_Lee_MT;
	nr		= 1;
	condition	= Info_Mod_Lee_ZugangKneipe_Condition;
	information	= Info_Mod_Lee_ZugangKneipe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich würde gerne in die Kneipe und brauche deine Genehmigung.";
};

FUNC INT Info_Mod_Lee_ZugangKneipe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Khaled_KenneLee))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lee_ZugangKneipe_Info()
{
	AI_Output(hero, self, "Info_Mod_Lee_ZugangKneipe_15_00"); //Ich würde gerne in die Kneipe und brauche deine Genehmigung.
	AI_Output(self, hero, "Info_Mod_Lee_ZugangKneipe_04_01"); //In die Kneipe? Nun, die Regeln besagen, dass man Söldner oder Schürfer sein muss.
	AI_Output(self, hero, "Info_Mod_Lee_ZugangKneipe_04_02"); //Und wenn ich dir einfach so die Erlaubnis erteile, dann trage ich damit zu einem Regelverstoß bei. Und das wäre schlecht für die Moral im Lager.
	AI_Output(self, hero, "Info_Mod_Lee_ZugangKneipe_04_03"); //Also musst du entweder Söldner werden und dazu die Jungs in Khorinis unterstützen oder ...
	AI_Output(hero, self, "Info_Mod_Lee_ZugangKneipe_15_04"); //... ich wähle den Weg des Schürfers?
	AI_Output(self, hero, "Info_Mod_Lee_ZugangKneipe_04_05"); //Ja, genau, dass wäre die andere Möglichkeit.
	AI_Output(hero, self, "Info_Mod_Lee_ZugangKneipe_15_06"); //Und was muss ich dazu tun?
	AI_Output(self, hero, "Info_Mod_Lee_ZugangKneipe_04_07"); //Lass mich mal überlegen.
	AI_Output(self, hero, "Info_Mod_Lee_ZugangKneipe_04_08"); //Um ein vollwertiger Schürfer zu sein, muss man natürlich Erz geschürft haben und dem Lager seinen Anteil entrichten.
	AI_Output(self, hero, "Info_Mod_Lee_ZugangKneipe_04_09"); //Bring mir also – sagen wir mal - zehn Brocken Erz.
	AI_Output(self, hero, "Info_Mod_Lee_ZugangKneipe_04_10"); //Diese symbolische Menge soll mir genügen.

	B_LogEntry	(TOPIC_MOD_NLINKNEIPE, "Ich soll Lee 10 Brocken Erz bringen, als Nachweis meiner Tätigkeit als Schürfer. Dann darf ich in die Kneipe.");
};

INSTANCE Info_Mod_Lee_ZugangKneipe2 (C_INFO)
{
	npc		= Mod_525_SLD_Lee_MT;
	nr		= 1;
	condition	= Info_Mod_Lee_ZugangKneipe2_Condition;
	information	= Info_Mod_Lee_ZugangKneipe2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier sind zehn Brocken Erz.";
};

FUNC INT Info_Mod_Lee_ZugangKneipe2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lee_ZugangKneipe))
	&& (Npc_HasItems(hero, ItMi_Nugget) >= 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lee_ZugangKneipe2_Info()
{
	AI_Output(hero, self, "Info_Mod_Lee_ZugangKneipe2_15_00"); //Hier sind zehn Brocken Erz.

	B_GiveInvItems	(hero, self, ItMi_Nugget, 10);

	AI_Output(self, hero, "Info_Mod_Lee_ZugangKneipe2_04_01"); //Gut, dass zu schaffen war sicher kein Kunststück, aber nur für den Zugang zur Kneipe soll sich ja auch niemand ein Bein ausreißen.
	AI_Output(self, hero, "Info_Mod_Lee_ZugangKneipe2_04_02"); //Hier, meine schriftliche Erlaubnis. Trink einen auf mein Wohl.

	B_GiveInvItems	(self, hero, ItWr_LeeInKneipe, 1);

	B_GivePlayerXP	(200);

	B_LogEntry	(TOPIC_MOD_NLINKNEIPE, "Gut, ich habe Lees schriftliche Genehmigung.");
};

INSTANCE Info_Mod_Lee_KesselProblem (C_INFO)
{
	npc		= Mod_525_SLD_Lee_MT;
	nr		= 1;
	condition	= Info_Mod_Lee_KesselProblem_Condition;
	information	= Info_Mod_Lee_KesselProblem_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lee_KesselProblem_Condition()
{
	if (Kapitel >= 3)
	&& (hero.guild == GIL_MIL)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lee_KesselProblem_Info()
{
	B_USEFAKESCROLL();

	AI_Output(self, hero, "Info_Mod_Lee_KesselProblem_04_00"); //Verdammt! Schon wieder.
	AI_Output(hero, self, "Info_Mod_Lee_KesselProblem_15_01"); //Was ist?
	AI_Output(self, hero, "Info_Mod_Lee_KesselProblem_04_02"); //Zurzeit machen wilde Tiere in den Bergen die Arbeiten im Talkessel unsicher. Sogar ein Schürfer wurde von Ihnen gefressen.
	AI_Output(self, hero, "Info_Mod_Lee_KesselProblem_04_03"); //Jemand sollte dort nach dem Rechten sehen, was vor sich geht, ehe hier bald gar kein Erz mehr ankommt.
	AI_Output(self, hero, "Info_Mod_Lee_KesselProblem_04_04"); //(überlegt) Hmm, auf meine Männer dort offensichtlich kein Verlass mehr.
	AI_Output(self, hero, "Info_Mod_Lee_KesselProblem_04_05"); //Kesselchef Bullco scheint auch mehr Zeit bei der Taverne zu verbringen, als vor der Mine.
	AI_Output(self, hero, "Info_Mod_Lee_KesselProblem_04_06"); //Könntest du dich vielleicht im Talkessel umschauen und umhören, wie es wirklich um die Situation steht?
	AI_Output(self, hero, "Info_Mod_Lee_KesselProblem_04_07"); //Gib mir Bescheid, wenn es dort Probleme gibt ...

	Log_CreateTopic	(TOPIC_MOD_NL_TALKESSELPROB, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_NL_TALKESSELPROB, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_NL_TALKESSELPROB, "Lee fluchte über die Probleme im Talkessel. Wilde Tiere aus den Bergen treiben dort ihr Unwesen und haben sogar schon einen Schürfer getötet. Die Erzlieferungen könnten zunehmend darunter leiden. Lee bat mich darum, mich dort mal umzuhören und umzusehen und ihm zu melden, wenn es ernsthafte Probleme gibt.");
};

INSTANCE Info_Mod_Lee_KesselProblem2 (C_INFO)
{
	npc		= Mod_525_SLD_Lee_MT;
	nr		= 1;
	condition	= Info_Mod_Lee_KesselProblem2_Condition;
	information	= Info_Mod_Lee_KesselProblem2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lee_KesselProblem2_Condition()
{
	if (Mod_NL_TalkesselProblem == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lee_KesselProblem2_Info()
{
	AI_Output(self, hero, "Info_Mod_Lee_KesselProblem2_04_00"); //(wütend) Halt! Ich habe gehört, dass Bruce das Zeitliche gesegnet hat ... und du sollst darin verwickelt gewesen sein.
	AI_Output(self, hero, "Info_Mod_Lee_KesselProblem2_04_01"); //Was zum Teufel ist beim Kessel vorgefallen?!
	AI_Output(hero, self, "Info_Mod_Lee_KesselProblem2_15_02"); //Ich hatte  keine Wahl. Er hat versucht mich umzubringen.
	AI_Output(self, hero, "Info_Mod_Lee_KesselProblem2_04_03"); //(Verwundert) Aber ... wieso? Was ist da vorgefallen?
	AI_Output(hero, self, "Info_Mod_Lee_KesselProblem2_15_04"); //Nun, ich bin ihm auf die Schliche gekommen.
	AI_Output(hero, self, "Info_Mod_Lee_KesselProblem2_15_05"); //Er hat einen Teil von dem Erz aus dem Kessel für eigene Geschäfte benutzt.
	AI_Output(hero, self, "Info_Mod_Lee_KesselProblem2_15_06"); //Die ganze Geschichte mit den wilden Tieren war erfunden. Zur Täuschung hat er sich sogar ein Schattenläuferfell von Fester besorgt.
	AI_Output(hero, self, "Info_Mod_Lee_KesselProblem2_15_07"); //Hier seine Liste.

	B_GiveInvItems	(hero, self, ItWr_KesselProblem, 1);

	B_USEFAKESCROLL();

	AI_Output(self, hero, "Info_Mod_Lee_KesselProblem2_04_08"); //(entgeistert) Tatsächlich. Scheffelweise hat er das Erz ausgegeben.
	AI_Output(self, hero, "Info_Mod_Lee_KesselProblem2_04_09"); //Und dann noch so eine hinterlistige Täuschung. Vermutlich hat er gar den Schürfer selbst umgebracht, als Ablenkungsmanöver.
	AI_Output(self, hero, "Info_Mod_Lee_KesselProblem2_04_10"); //(wütend) Unterschlagung von Erz für dubiose Geschäfte ... und sogar Mord.
	AI_Output(self, hero, "Info_Mod_Lee_KesselProblem2_04_11"); //Und Bullco sitzt vor der Kneipe und säuft. Er ist die längste Zeit Chef des Talkessels gewesen ...
	AI_Output(self, hero, "Info_Mod_Lee_KesselProblem2_04_12"); //Hmm ...  und was ist mit Fester. Was sind das für andere Sachen, die er Bruce verkauft hat?

	B_SetTopicStatus	(TOPIC_MOD_NL_TALKESSELPROB, LOG_SUCCESS);

	B_StartOtherRoutine	(Mod_1288_SLD_Butch_MT, "BOSS");

	Info_ClearChoices	(Info_Mod_Lee_KesselProblem2);

	Info_AddChoice	(Info_Mod_Lee_KesselProblem2, "Waren von Außerhalb. Wein, Schinken ...", Info_Mod_Lee_KesselProblem2_B);
	Info_AddChoice	(Info_Mod_Lee_KesselProblem2, "Er hat ihm Sumpfkraut verkauft.", Info_Mod_Lee_KesselProblem2_A);
};

FUNC VOID Info_Mod_Lee_KesselProblem2_B()
{
	AI_Output(hero, self, "Info_Mod_Lee_KesselProblem2_B_15_00"); //Waren von Außerhalb. Wein, Schinken ...
	AI_Output(self, hero, "Info_Mod_Lee_KesselProblem2_B_04_01"); //(wieder ruhiger) So? Na gut. Ich werde mal einige Worte mit ihm wechseln und ihm auf den Zahn fühlen.
	AI_Output(self, hero, "Info_Mod_Lee_KesselProblem2_B_04_02"); //Vielleicht hat er ja gar nichts von Bruce Machenschaften gewusst.
	AI_Output(hero, self, "Info_Mod_Lee_KesselProblem2_B_15_03"); //Nun ...
	AI_Output(self, hero, "Info_Mod_Lee_KesselProblem2_B_04_04"); //Achso, richtig. Du hast deine Arbeit sehr gut gemacht.
	AI_Output(self, hero, "Info_Mod_Lee_KesselProblem2_B_04_05"); //Dank dir wird es von nun an besser im Lager laufen. Hier, das Erz und Gold steht dir auf jeden Fall zu.

	CreateInvItems	(hero, ItMi_Nugget, 20);
	CreateInvItems	(hero, ItMi_Gold, 200);

	B_GivePlayerXP	(500);

	B_ShowGivenThings	("20 Erz und 200 Gold erhalten");

	Mod_NL_TalkesselProblem = 5;

	Info_ClearChoices	(Info_Mod_Lee_KesselProblem2);
};

FUNC VOID Info_Mod_Lee_KesselProblem2_A()
{
	AI_Output(hero, self, "Info_Mod_Lee_KesselProblem2_A_15_00"); //Er hat ihm Sumpfkraut verkauft.
	AI_Output(self, hero, "Info_Mod_Lee_KesselProblem2_A_04_01"); //(außer sich) Was?! Verkauft Kraut in meinem Lager?! Der kann was erleben.
	AI_Output(self, hero, "Info_Mod_Lee_KesselProblem2_A_04_02"); //Ab jetzt 6 Uhr aufstehen, Leibesübungen ... ich werde schon noch dafür sorgen, dass er nicht mehr auf dumme Gedanken kommt.
	AI_Output(hero, self, "Info_Mod_Lee_KesselProblem2_A_15_03"); //Also ...
	AI_Output(self, hero, "Info_Mod_Lee_KesselProblem2_A_04_04"); //(zum Helden) Hmm, was? Achso, richtig. Du hast deine Arbeit wirklich gut gemacht.
	AI_Output(self, hero, "Info_Mod_Lee_KesselProblem2_A_04_05"); //Die ganzen Schmarotzer und Taugenichtse bekommen, was ihnen zusteht.
	AI_Output(self, hero, "Info_Mod_Lee_KesselProblem2_A_04_06"); //Hier, das Erz und Gold hast du dir wirklich verdient.

	CreateInvItems	(hero, ItMi_Nugget, 27);
	CreateInvItems	(hero, ItMi_Gold, 260);

	B_GivePlayerXP	(500);

	B_ShowGivenThings	("27 Erz und 260 Gold erhalten");

	Mod_NL_TalkesselProblem = 6;

	B_StartOtherRoutine	(Mod_784_SLD_Fester_MT, "STRAFE");

	Info_ClearChoices	(Info_Mod_Lee_KesselProblem2);
};

INSTANCE Info_Mod_Lee_SentenzaSchwert (C_INFO)
{
	npc		= Mod_525_SLD_Lee_MT;
	nr		= 1;
	condition	= Info_Mod_Lee_SentenzaSchwert_Condition;
	information	= Info_Mod_Lee_SentenzaSchwert_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ihr wart also auf dem Laufenden?";
};

FUNC INT Info_Mod_Lee_SentenzaSchwert_Condition()
{
	if (Mod_NL_BruceTot == 3)
	&& (Npc_IsDead(Mod_796_SLD_Sentenza_MT))
	&& (Npc_IsDead(Mod_779_SLD_Bullco_MT))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lee_SentenzaSchwert_Info()
{
	AI_Output(hero, self, "Info_Mod_Lee_SentenzaSchwert_15_00"); //Ihr wart also auf dem Laufenden?
	AI_Output(self, hero, "Info_Mod_Lee_SentenzaSchwert_04_01"); //Nun, ich hatte einen starken Verdacht. Letztendlich hat sich Bruce nie weit genug vom Talkessel entfernt, um andere Händler aufzusuchen.
	AI_Output(self, hero, "Info_Mod_Lee_SentenzaSchwert_04_02"); //Er musste also noch Hintermänner im Lager gehabt haben.
	AI_Output(self, hero, "Info_Mod_Lee_SentenzaSchwert_04_03"); //Roscoe hat für mich dann seine Augen und Ohren offen gehalten ... und genug mitbekommen, um die Bastarde hier zu stellen.
	AI_Output(hero, self, "Info_Mod_Lee_SentenzaSchwert_15_04"); //Ja, das war gutes Timing.
	AI_Output(self, hero, "Info_Mod_Lee_SentenzaSchwert_04_05"); //Nun, jedenfalls ist unser Lager Dank deiner Mithilfe wieder um zwei Halunken ärmer. Hier etwas Erz.

	B_GiveInvItems	(self, hero, ItMi_Nugget, 5);

	AI_Output(self, hero, "Info_Mod_Lee_SentenzaSchwert_04_06"); //In den Taschen der beiden wirst du sicher auch noch genug finden. Und den Rest sollen sich die wilden Tiere holen.

	B_GivePlayerXP	(300);

	B_SetTopicStatus	(TOPIC_MOD_NL_SENTENZAKLINGE, LOG_SUCCESS);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");

	self.aivar[AIV_Partymember] = FALSE;
};

INSTANCE Info_Mod_Lee_Mitmachen (C_INFO)
{
	npc		= Mod_525_SLD_Lee_MT;
	nr		= 1;
	condition	= Info_Mod_Lee_Mitmachen_Condition;
	information	= Info_Mod_Lee_Mitmachen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kann ich bei euch wieder mitmachen?";
};

FUNC INT Info_Mod_Lee_Mitmachen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lee_WieStehts))
	&& (Mod_Gilde == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lee_Mitmachen_Info()
{
	AI_Output(hero, self, "Info_Mod_Lee_Mitmachen_15_00"); //Kann ich bei euch wieder mitmachen?
	AI_Output(self, hero, "Info_Mod_Lee_Mitmachen_04_01"); //Bei uns mitmachen? Nun, gute Männer können wir immer gebrauchen und du hast damals gezeigt, dass du kein Taugenichts bist.
	AI_Output(self, hero, "Info_Mod_Lee_Mitmachen_04_02"); //Trotzdem wäre es mir lieber, wenn du dich erst einmal bewährst, damit die Söldner deine Aufnahme auch respektieren.
	AI_Output(self, hero, "Info_Mod_Lee_Mitmachen_04_03"); //Viele neue Jungs sind im Lager und von den anderen kann sich wohl auch nicht mehr jeder an dich erinnern.
	AI_Output(self, hero, "Info_Mod_Lee_Mitmachen_04_04"); //Du warst ja immer unterwegs.
	AI_Output(hero, self, "Info_Mod_Lee_Mitmachen_15_05"); //Ok, was soll ich tun.
	AI_Output(self, hero, "Info_Mod_Lee_Mitmachen_04_06"); //Nun, wie ich dich kenne, warst du bestimmt schon auf halb Khorinis und kennst dich in der Umgebung aus.
	AI_Output(hero, self, "Info_Mod_Lee_Mitmachen_15_07"); //Ja, hier und da war ich schon.
	AI_Output(self, hero, "Info_Mod_Lee_Mitmachen_04_08"); //Gut, dann will ich, dass du die Jungs auf dem Großbauernhof in Khorinis unterstützt.
	AI_Output(self, hero, "Info_Mod_Lee_Mitmachen_04_09"); //Dort Fuß zu fassen hat jetzt erst einmal Priorität.
	AI_Output(self, hero, "Info_Mod_Lee_Mitmachen_04_10"); //Wenn du dich einigermaßen geschickt anstellst, bin ich mir sicher, dass ich dich bald in der Söldnerrüstung wieder sehe.
	AI_Output(self, hero, "Info_Mod_Lee_Mitmachen_04_11"); //Es sei denn natürlich, du gehörst schon einem anderen großen Lager an, oder gar dem Alten Lager. Alles klar? Gut.
};

var int Lee_LastPetzCounter;
var int Lee_LastPetzCrime;

INSTANCE Info_Mod_Lee_PMSchulden (C_INFO)
{
	npc         	= Mod_525_SLD_Lee_MT;
	nr          	= 1;
	condition   	= Info_Mod_Lee_PMSchulden_Condition;
	information 	= Info_Mod_Lee_PMSchulden_Info;
	permanent   	= 1;
	important 	= 1; 
};

FUNC INT Info_Mod_Lee_PMSchulden_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Lee_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Lee_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Lee_PMSchulden_Info()
{
	AI_Output (self, hero, "Info_Mod_Lee_PMSchulden_04_00"); //Bist du gekommen, um deine Strafe zu zahlen?

	if (B_GetTotalPetzCounter(self) > Lee_LastPetzCounter)
	{
		AI_Output (self, hero, "Info_Mod_Lee_PMSchulden_04_01"); //Ich hatte mich schon gefragt, ob du es überhaupt noch wagst, hierher zu kommen!
		AI_Output (self, hero, "Info_Mod_Lee_PMSchulden_04_02"); //Anscheinend ist es nicht bei den letzten Anschuldigungen geblieben!

		if (Lee_Schulden < 1000)
		{
			AI_Output (self, hero, "Info_Mod_Lee_PMSchulden_04_03"); //Ich hatte dich gewarnt! Die Strafe, die du jetzt zahlen musst, ist höher!
			AI_Output (hero, self, "Info_Mod_Lee_PMAdd_15_00"); //Wieviel?
			
			var int diff; diff = (B_GetTotalPetzCounter(self) - Lee_LastPetzCounter);
		
			if (diff > 0)
			{
				Lee_Schulden = Lee_Schulden + (diff * 50);
			};
		
			if (Lee_Schulden > 1000)	{	Lee_Schulden = 1000;	};
		
			B_Say_Gold (self, hero, Lee_Schulden);
		}
		else
		{
			AI_Output (self, hero, "Info_Mod_Lee_PMSchulden_04_04"); //Du hast mich schwer enttäuscht!
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Lee_LastPetzCrime)
	{
		AI_Output (self, hero, "Info_Mod_Lee_PMSchulden_04_05"); //Es haben sich einige neue Dinge ergeben.
		
		if (Lee_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, hero, "Info_Mod_Lee_PMSchulden_04_06"); //Plötzlich gibt es niemanden mehr, der dich des Mordes bezichtigt.
		};
		
		if (Lee_LastPetzCrime == CRIME_THEFT)
		|| ( (Lee_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, hero, "Info_Mod_Lee_PMSchulden_04_07"); //Niemand erinnert sich mehr, dich bei einem Diebstahl gesehen zu haben.
		};
		
		if (Lee_LastPetzCrime == CRIME_ATTACK)
		|| ( (Lee_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, hero, "Info_Mod_Lee_PMSchulden_04_08"); //Es gibt keine Zeugen mehr dafür, dass du jemals in eine Schlägerei verwickelt warst.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, hero, "Info_Mod_Lee_PMSchulden_04_09"); //Anscheinend haben sich alle Anklagen gegen dich in Wohlgefallen aufgelöst.
		};
		
		AI_Output (self, hero, "Info_Mod_Lee_PMSchulden_04_10"); //Ich weiß nicht, was da gelaufen ist, aber ich warne dich: Spiel keine Spielchen mit mir.
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, hero, "Info_Mod_Lee_PMSchulden_04_11"); //Ich habe mich jedenfalls entschieden, dir deine Schulden zu erlassen.
			AI_Output (self, hero, "Info_Mod_Lee_PMSchulden_04_12"); //Sieh zu, dass du nicht wieder in Schwierigkeiten kommst.
	
			Lee_Schulden			= 0;
			Lee_LastPetzCounter 	= 0;
			Lee_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, hero, "Info_Mod_Lee_PMSchulden_04_13"); //Damit eins klar ist: Deine Strafe musst du trotzdem in voller Höhe zahlen.
			B_Say_Gold (self, hero, Lee_Schulden);
			AI_Output (self, hero, "Info_Mod_Lee_PMSchulden_04_14"); //Also, was ist?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(Info_Mod_Lee_PMSchulden);
		Info_ClearChoices  	(Info_Mod_Lee_PETZMASTER);
		Info_AddChoice		(Info_Mod_Lee_PMSchulden,"Ich habe nicht genug Gold!",Info_Mod_Lee_PETZMASTER_PayLater);
		Info_AddChoice		(Info_Mod_Lee_PMSchulden,"Wieviel war es nochmal?",Info_Mod_Lee_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(hero, itmi_gold) >= Lee_Schulden)
		{
			Info_AddChoice 	(Info_Mod_Lee_PMSchulden,"Ich will die Strafe zahlen.",Info_Mod_Lee_PETZMASTER_PayNow);
		};
	};
};

func void Info_Mod_Lee_PMSchulden_HowMuchAgain()
{
	AI_Output (hero, self, "Info_Mod_Lee_PMSchulden_HowMuchAgain_15_00"); //Wie viel war es noch mal?
	B_Say_Gold (self, hero, Lee_Schulden);

	Info_ClearChoices  	(Info_Mod_Lee_PMSchulden);
	Info_ClearChoices  	(Info_Mod_Lee_PETZMASTER);
	Info_AddChoice		(Info_Mod_Lee_PMSchulden,"Ich habe nicht genug Gold!",Info_Mod_Lee_PETZMASTER_PayLater);
	Info_AddChoice		(Info_Mod_Lee_PMSchulden,"Wieviel war es nochmal?",Info_Mod_Lee_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(hero, itmi_gold) >= Lee_Schulden)
	{
		Info_AddChoice 	(Info_Mod_Lee_PMSchulden,"Ich will die Strafe zahlen.",Info_Mod_Lee_PETZMASTER_PayNow);
	};
};

INSTANCE Info_Mod_Lee_PETZMASTER   (C_INFO)
{
	npc         	= Mod_525_SLD_Lee_MT;
	nr          	= 1;
	condition   	= Info_Mod_Lee_PETZMASTER_Condition;
	information 	= Info_Mod_Lee_PETZMASTER_Info;
	permanent   	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Lee_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Lee_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Lee_PETZMASTER_Info()
{
	Lee_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, hero, "Info_Mod_Lee_PETZMASTER_04_01"); //Gut, dass du zu mir kommst, bevor alles noch schlimmer für dich wird.
		AI_Output (self, hero, "Info_Mod_Lee_PETZMASTER_04_02"); //Mord ist ein schweres Vergehen!

		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50

		Lee_Schulden = Lee_Schulden + 500;						//PLUS Mörder-Malus

		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, hero, "Info_Mod_Lee_PETZMASTER_04_03"); //Ganz zu schweigen von den anderen Sachen, die du angerichtet hast.
		};

		AI_Output (self, hero, "Info_Mod_Lee_PETZMASTER_04_06"); //Ich habe kein Interesse daran, dich an den Galgen zu bringen. Wir sind im Krieg und wir brauchen jeden Mann.
		AI_Output (self, hero, "Info_Mod_Lee_PETZMASTER_04_07"); //Aber es wird nicht leicht sein, die Leute wieder gnädig zu stimmen.
		AI_Output (self, hero, "Info_Mod_Lee_PETZMASTER_04_08"); //Du könntest deine Reue zeigen, indem du eine Strafe zahlst - natürlich muss die Strafe angemessen hoch sein.
	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, hero, "Info_Mod_Lee_PETZMASTER_04_09"); //Gut, dass du kommst! Du wirst des Diebstahls bezichtigt! Es gibt Zeugen!

		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, hero, "Info_Mod_Lee_PETZMASTER_04_10"); //Von den anderen Dingen, die mir zu Ohren gekommen sind, will ich gar nicht erst reden.
		};

		AI_Output (self, hero, "Info_Mod_Lee_PETZMASTER_04_11"); //Ich werde so ein Verhalten bei uns nicht dulden!
		AI_Output (self, hero, "Info_Mod_Lee_PETZMASTER_04_12"); //Du wirst eine Strafe zahlen müssen, um dein Verbrechen wieder gutzumachen!
		
		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, hero, "Info_Mod_Lee_PETZMASTER_04_13"); //Wenn du dich mit dem Gesindel in der Stadt herumprügelst, ist das eine Sache ...
		AI_Output (self, hero, "Info_Mod_Lee_PETZMASTER_04_14"); //Aber wenn du die Bauern oder andere Söldner angreifst, muss ich dich zur Rechenschaft ziehen.

		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, hero, "Info_Mod_Lee_PETZMASTER_04_15"); //Und die Sache mit den Schafen musste wohl auch nicht sein.
		};

		AI_Output (self, hero, "Info_Mod_Lee_PETZMASTER_04_16"); //Wenn ich dir das durchgehen lasse, macht hier bald jeder, was er will.
		AI_Output (self, hero, "Info_Mod_Lee_PETZMASTER_04_17"); //Also wirst du eine angemessene Strafe zahlen - und die Sache ist vergessen.
		
		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf getötet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, hero, "Info_Mod_Lee_PETZMASTER_04_18"); //Mir ist zu Ohren gekommen, du hättest dich an unseren Schafen vergriffen.
		AI_Output (self, hero, "Info_Mod_Lee_PETZMASTER_04_19"); //Dir ist klar, dass ich das nicht durchgehen lassen kann.
		AI_Output (self, hero, "Info_Mod_Lee_PETZMASTER_04_20"); //Du wirst eine Entschädigung zahlen müssen!
		
		Lee_Schulden = 100;
	};
	
	AI_Output (hero, self, "Info_Mod_Lee_PETZMASTER_15_21"); //Wie viel?
	
	if (Lee_Schulden > 1000)	{	Lee_Schulden = 1000;	};
		
	B_Say_Gold (self, hero, Lee_Schulden);
	
	Info_ClearChoices  	(Info_Mod_Lee_PMSchulden);
	Info_ClearChoices  	(Info_Mod_Lee_PETZMASTER);
	Info_AddChoice		(Info_Mod_Lee_PETZMASTER,"Ich habe nicht genug Gold!",Info_Mod_Lee_PETZMASTER_PayLater);
	if (Npc_HasItems(hero, itmi_gold) >= Lee_Schulden)
	{
		Info_AddChoice 	(Info_Mod_Lee_PETZMASTER,"Ich will die Strafe zahlen.",Info_Mod_Lee_PETZMASTER_PayNow);
	};
};

func void Info_Mod_Lee_PETZMASTER_PayNow()
{
	AI_Output (hero, self, "Info_Mod_Lee_PETZMASTER_PayNow_15_00"); //Ich will die Strafe zahlen!
	B_GiveInvItems (hero, self, itmi_gold, Lee_Schulden);
	AI_Output (self, hero, "Info_Mod_Lee_PETZMASTER_PayNow_04_01"); //Gut! Ich werde dafür sorgen, dass es jeder Bauer und Söldner erfährt - damit wäre dein Ruf einigermaßen wiederhergestellt.

	B_GrantAbsolution (LOC_FARM);
	
	Lee_Schulden			= 0;
	Lee_LastPetzCounter 	= 0;
	Lee_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(Info_Mod_Lee_PETZMASTER);
	Info_ClearChoices  	(Info_Mod_Lee_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void Info_Mod_Lee_PETZMASTER_PayLater()
{
	AI_Output (hero, self, "Info_Mod_Lee_PETZMASTER_PayLater_15_00"); //Ich habe nicht genug Gold!
	AI_Output (self, hero, "Info_Mod_Lee_PETZMASTER_PayLater_04_01"); //Dann sieh zu, dass du das Gold so schnell wie möglich beschaffst.
	AI_Output (self, hero, "Info_Mod_Lee_PETZMASTER_PayLater_04_02"); //Und ich warne dich: Wenn du dir noch was zu schulden kommen lässt, wird die Sache noch schlimmer für dich!
	
	Lee_LastPetzCounter 	= B_GetTotalPetzCounter(self);
	Lee_LastPetzCrime		= B_GetGreatestPetzCrime(self);
	
	AI_StopProcessInfos (self);
};

INSTANCE Info_Mod_Lee_Pickpocket (C_INFO)
{
	npc		= Mod_525_SLD_Lee_MT;
	nr		= 1;
	condition	= Info_Mod_Lee_Pickpocket_Condition;
	information	= Info_Mod_Lee_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_180;
};

FUNC INT Info_Mod_Lee_Pickpocket_Condition()
{
	C_Beklauen	(158, ItMi_Gold, 100);
};

FUNC VOID Info_Mod_Lee_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Lee_Pickpocket);

	Info_AddChoice	(Info_Mod_Lee_Pickpocket, DIALOG_BACK, Info_Mod_Lee_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Lee_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Lee_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Lee_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Lee_Pickpocket);
};

FUNC VOID Info_Mod_Lee_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Lee_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Lee_Pickpocket);

		Info_AddChoice	(Info_Mod_Lee_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Lee_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Lee_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Lee_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Lee_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Lee_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Lee_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Lee_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Lee_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Lee_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Lee_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Lee_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Lee_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Lee_EXIT (C_INFO)
{
	npc		= Mod_525_SLD_Lee_MT;
	nr		= 999;
	condition	= Info_Mod_Lee_EXIT_Condition;
	information	= Info_Mod_Lee_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Lee_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Lee_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};