INSTANCE Info_Mod_Tojan_Hi (C_INFO)
{
	npc		= Mod_1746_KDF_Tojan_PAT;
	nr		= 1;
	condition	= Info_Mod_Tojan_Hi_Condition;
	information	= Info_Mod_Tojan_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Tojan_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Tojan_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Tojan_Hi_15_00"); //Endlich. Wir haben lange gewartet, Bruder. Doch endlich bist du da.
	AI_Output(hero, self, "Info_Mod_Tojan_Hi_15_01"); //Pyrokar schickt mich. Ich habe hier ein Paket voller Tränke und eins voller Nahrung.
	AI_Output(self, hero, "Info_Mod_Tojan_Hi_15_02"); //Sehr gut. Bring das Nahrungspaket zu Furgas. Du findest ihn im Turm.
	AI_Output(hero, self, "Info_Mod_Tojan_Hi_15_03"); //Und was soll ich mit den Tränken machen?
	AI_Output(self, hero, "Info_Mod_Tojan_Hi_15_04"); //Verteile sie an die Magier und Paladine auf der Außenmauer. Die Manatränke für die Magier und die Heiltränke für die Paladine.
	AI_Output(self, hero, "Info_Mod_Tojan_Hi_15_05"); //Es sollte genau aufgehen. Und jetzt beeil dich, lass unsere Brüder und Söhne nicht länger warten.

	Npc_RemoveInvItems	(hero, ItMi_PAT_Trank, 1);

	CreateInvItems	(hero, ItPo_Health_02, 10);
	CreateInvItems	(hero, ItPo_Mana_02, 10);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Tojan_Trank (C_INFO)
{
	npc		= Mod_1746_KDF_Tojan_PAT;
	nr		= 1;
	condition	= Info_Mod_Tojan_Trank_Condition;
	information	= Info_Mod_Tojan_Trank_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Tränke sind nicht aufgegangen.";
};

FUNC INT Info_Mod_Tojan_Trank_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_KDF_13_TrankLeer))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Tojan_Trank_Info()
{
	AI_Output(hero, self, "Info_Mod_Tojan_Trank_15_00"); //Die Tränke sind nicht aufgegangen. Einer hat gefehlt.
	AI_Output(self, hero, "Info_Mod_Tojan_Trank_15_01"); //Was? Das kann nicht sein!
	AI_Output(hero, self, "Info_Mod_Tojan_Trank_15_02"); //Es ist aber so.
	AI_Output(self, hero, "Info_Mod_Tojan_Trank_15_03"); //Wie sollte das ... Verdammt!
	AI_Output(hero, self, "Info_Mod_Tojan_Trank_15_04"); //Sind die Tränke so teuer oder was ist so schlimm?
	AI_Output(self, hero, "Info_Mod_Tojan_Trank_15_05"); //Das ist nicht der richtige Moment für Scherze! Verstehst du nicht was das heißt?
	AI_Output(self, hero, "Info_Mod_Tojan_Trank_15_06"); //Patherion wurde infiltriert!
	AI_Output(hero, self, "Info_Mod_Tojan_Trank_15_07"); //Ein Schwarzmagier? Hier im Kloster?
	AI_Output(self, hero, "Info_Mod_Tojan_Trank_15_08"); //Ich kann es selbst kaum glauben. Du musst den Kerl finden.
	AI_Output(hero, self, "Info_Mod_Tojan_Trank_15_09"); //Jetzt wo du es sagst, einer der Magier hat sich seltsam verhalten. Er war nicht wie die anderen auf der Mauer, sondern auf dem Podest.
	AI_Output(self, hero, "Info_Mod_Tojan_Trank_15_10"); //Das muss er gewesen sein. Finde ihn Bruder. Hier, nimm diese Spruchrolle.

	CreateInvItems	(self, ItSc_Laehmen, 1);
	B_GiveInvItems	(self, hero, ItSc_Laehmen, 1);

	AI_Output(self, hero, "Info_Mod_Tojan_Trank_15_11"); //Mit ihr kannst du ihn lähmen, sobald du ihn gefunden hast.
	AI_Output(hero, self, "Info_Mod_Tojan_Trank_15_12"); //Und wo soll ich anfangen ihn zu suchen?
	AI_Output(self, hero, "Info_Mod_Tojan_Trank_15_13"); //Frag einen der Magier auf der Außenmauermauer. Vielleicht hat einer von ihnen bemerkt wohin er rannte.

	Log_CreateTopic	(TOPIC_MOD_FM_SM, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_FM_SM, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_FM_SM, "Ich muss den Schwarzmagier finden, der sich unter den Feuermagier versteckt hält, und ihn dann mit der Spruchrolle, die Tojan mir gegeben hat, lähmen. Ich sollte zuerst mal auf der Mauer fragen, ob sie gesehen haben, wohin er geflohen ist.");
};

INSTANCE Info_Mod_Tojan_Magier (C_INFO)
{
	npc		= Mod_1915_KDF_Tojan_PAT_UG;
	nr		= 1;
	condition	= Info_Mod_Tojan_Magier_Condition;
	information	= Info_Mod_Tojan_Magier_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Tojan_Magier_Condition()
{
	if (Mod_FM_SM_TOT == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Tojan_Magier_Info()
{
	AI_Output(self, hero, "Info_Mod_Tojan_Magier_15_00"); //Der Feind ist oftmals näher als man denkt? Verflucht, ich glaube wir haben einen Verräter in unseren Reihen. Du musst ihn finden!
	AI_Output(hero, self, "Info_Mod_Tojan_Magier_15_01"); //Wie soll ich ihn finden? Es könnte jeder sein!
	AI_Output(self, hero, "Info_Mod_Tojan_Magier_15_02"); //Ich werde verbreiten, dass du ihn suchen sollst!
	AI_Output(hero, self, "Info_Mod_Tojan_Magier_15_03"); //Und dann? Er wird sich mir nicht zeigen, wenn er weiß, dass ich ihn finden soll.
	AI_Output(self, hero, "Info_Mod_Tojan_Magier_15_04"); //Oh doch! Er wird unvorsichtig werden und versuchen dich aus dem Weg zu schaffen. Er wird dir direkt ins Netz gehen! Und jetzt geh!
	
	B_SetTopicStatus	(TOPIC_MOD_FM_SM, LOG_SUCCESS);

	B_Göttergefallen(1, 1);

	Log_CreateTopic	(TOPIC_MOD_FM_VERRAT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_FM_VERRAT, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_FM_VERRAT, "Der Schwarzmagier hat angedeutet, dass sich ein weiterer Schwarzmagier in unseren Reihen befindet. Tojan hat mich damit beauftragt ihn zu finden.");
};

INSTANCE Info_Mod_Tojan_Beschwoerer (C_INFO)
{
	npc		= Mod_1746_KDF_Tojan_PAT;
	nr		= 1;
	condition	= Info_Mod_Tojan_Beschwoerer_Condition;
	information	= Info_Mod_Tojan_Beschwoerer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich glaube, ich weiß, wer der Verräter ist.";
};

FUNC INT Info_Mod_Tojan_Beschwoerer_Condition()
{
	if (Mod_FM_Foki == 2)
	&& (Npc_KnowsInfo(hero, Info_Mod_Aaron_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Tojan_Beschwoerer_Info()
{
	AI_Output(hero, self, "Info_Mod_Tojan_Beschwoerer_15_00"); //Ich glaube, ich weiß, wer der Verräter ist.
	AI_Output(self, hero, "Info_Mod_Tojan_Beschwoerer_15_01"); //Wirklich?
	AI_Output(hero, self, "Info_Mod_Tojan_Beschwoerer_15_02"); //Einer der Magier namens Aaron.
	AI_Output(self, hero, "Info_Mod_Tojan_Beschwoerer_15_03"); //Aaron? Wusste ich’s doch! Er kam mir gleich verdächtig vor.
	AI_Output(self, hero, "Info_Mod_Tojan_Beschwoerer_15_04"); //Hier, nimm dieses Amulett. Sobald du Aaron überwältigt hast, benutze es, ich werde dann sofort zu dir kommen.

	CreateInvItems	(self, ItAm_TojansAmulett, 1);
	B_GiveInvItems	(self, hero, ItAm_TojansAmulett, 1);

	B_LogEntry	(TOPIC_MOD_FM_VERRAT, "Tojan stimmt meinem Verdacht zu, dass Aaron der Verräter ist. Ich soll ihn überwältigen und dann das Amulett anlegen, dass er mir gegeben hat.");

	Mod_FM_Foki = 3;
};

INSTANCE Info_Mod_Tojan_Falle (C_INFO)
{
	npc		= Mod_1746_KDF_Tojan_PAT;
	nr		= 1;
	condition	= Info_Mod_Tojan_Falle_Condition;
	information	= Info_Mod_Tojan_Falle_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Tojan_Falle_Condition()
{
	if (Mod_FM_Foki == 7)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Tojan_Falle_Info()
{
	AI_Output(self, hero, "Info_Mod_Tojan_Falle_15_00"); //(lacht) Du Narr!
	AI_Output(hero, self, "Info_Mod_Tojan_Falle_15_01"); //Was meinst du damit?
	AI_Output(self, hero, "Info_Mod_Tojan_Falle_15_02"); //Ganz einfach, dass du gerade einen riesengroßen Fehler begangen hast!
	AI_Output(self, hero, "Info_Mod_Tojan_Falle_15_03"); //Der Magier, den du gerade getötet hast, war kein Verräter.
	AI_Output(hero, self, "Info_Mod_Tojan_Falle_15_04"); //Nein? Wer ist es dann?
	AI_Output(self, hero, "Info_Mod_Tojan_Falle_15_05"); //Ich bin es!
	AI_Output(hero, self, "Info_Mod_Tojan_Falle_15_06"); //Du? Aber warum?
	AI_Output(self, hero, "Info_Mod_Tojan_Falle_15_07"); //Nun, mein Auftraggeber will euch tot sehen.
	AI_Output(hero, self, "Info_Mod_Tojan_Falle_15_08"); //Aber warum uns?
	AI_Output(self, hero, "Info_Mod_Tojan_Falle_15_09"); //Nun, du warst eigentlich nur ein Mittel zum Zweck, ein Sündenbock. Man wird dich des Todes von Aaron beschuldigen.
	AI_Output(self, hero, "Info_Mod_Tojan_Falle_15_10"); //Wer würde schon mich verdächtigen, der im letzten Moment versuchte ihn zu retten?
	AI_Output(self, hero, "Info_Mod_Tojan_Falle_15_11"); //Ich werde allen sagen, dass ich zu spät kam, um dich an Aarons Tod zu hindern und du mich auch töten wolltest und ich dich deshalb leider vernichten musste.
	AI_Output(self, hero, "Info_Mod_Tojan_Falle_15_12"); //Außerdem wird niemand mehr einen Verräter suchen. DU bist ja schon tot. (lacht)
	AI_Output(hero, self, "Info_Mod_Tojan_Falle_15_13"); //Und warum Aaron? Weshalb sollte ich ihn töten?
	AI_Output(self, hero, "Info_Mod_Tojan_Falle_15_14"); //Weil Aaron früher oder später eine Gefahr darstellen wird.
	AI_Output(hero, self, "Info_Mod_Tojan_Falle_15_15"); //Wieso ausgerechnet er?
	AI_Output(self, hero, "Info_Mod_Tojan_Falle_15_16"); //Es ist das Blut, dass in seinen Adern fließt! Er ist mein Vater.
	AI_Output(hero, self, "Info_Mod_Tojan_Falle_15_17"); //Dein Vater? Aber du bist doch viel älter als er?
	AI_Output(self, hero, "Info_Mod_Tojan_Falle_15_18"); //Du verstehst es immer noch nicht? Wir sind die letzen Nachfahren des Mannes, der dieses Kloster mit eigenen Händen erbaut hat!
	AI_Output(hero, self, "Info_Mod_Tojan_Falle_15_19"); //Und warum sieht er viel Jünger aus als du?
	AI_Output(self, hero, "Info_Mod_Tojan_Falle_15_20"); //Er altert langsamer als ich, weil durch meine Adern auch das Blut meiner Mutter fließt.
	AI_Output(hero, self, "Info_Mod_Tojan_Falle_15_21"); //Aber warum war Aron dann hier im Kloster nur ein gewöhnlicher Magier?
	AI_Output(self, hero, "Info_Mod_Tojan_Falle_15_22"); //Nun, meine Mutter ist sehr mächtig. Sie hat sein Gedächtnis gelöscht.
	AI_Output(self, hero, "Info_Mod_Tojan_Falle_15_23"); //Dass er seinen Weg zurück zu den Innos-Magiern gefunden hat, hat auch uns gewundert.
	AI_Output(hero, self, "Info_Mod_Tojan_Falle_15_24"); //Aber wer zum Teufel ist dann deine Mutter?
	AI_Output(self, hero, "Info_Mod_Tojan_Falle_15_25"); //(lacht) Sie ist die Mächtigste aller Hexen, Ihre Königin!
	AI_Output(hero, self, "Info_Mod_Tojan_Falle_15_26"); //Die Hexenkönigin?
	AI_Output(self, hero, "Info_Mod_Tojan_Falle_15_27"); //Nun, ich kann dich doch nicht dumm sterben lassen. Die Hexen sind schon seit langer Zeit Verbündete der Schwarzmagier.
	AI_Output(self, hero, "Info_Mod_Tojan_Falle_15_28"); //Aber genug der Worte, jetzt wirst du meinem Vater in Beliars Reich folgen.

	Mod_FM_Foki = 8;

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Tojan_EXIT (C_INFO)
{
	npc		= Mod_1746_KDF_Tojan_PAT;
	nr		= 1;
	condition	= Info_Mod_Tojan_EXIT_Condition;
	information	= Info_Mod_Tojan_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Tojan_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Tojan_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};