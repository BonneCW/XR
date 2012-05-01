var int BerichtCounter;

INSTANCE Info_Mod_Dragomir_Hi (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_Hi_Condition;
	information	= Info_Mod_Dragomir_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hi.";
};

FUNC INT Info_Mod_Dragomir_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Dragomir_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_Hi_15_00"); //Hi.
	AI_Output(self, hero, "Info_Mod_Dragomir_Hi_12_01"); //Hi.
};

INSTANCE Info_Mod_Dragomir_Jagdgebiete (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_Jagdgebiete_Condition;
	information	= Info_Mod_Dragomir_Jagdgebiete_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich bin bei allen Jägern gewesen.";
};

FUNC INT Info_Mod_Dragomir_Jagdgebiete_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dragomir_Mitmachen))
	&& (Npc_KnowsInfo(hero, Info_Mod_Nandor_WoelfeTot))
	&& (Npc_KnowsInfo(hero, Info_Mod_Gaan_Dragomir))
	&& (Npc_KnowsInfo(hero, Info_Mod_Grom_Dragomir))
	&& (Npc_KnowsInfo(hero, Info_Mod_Grimbald_Erzbrocken))
	&& (Npc_HasItems(hero, ItMi_Erzbrocken_Seltsam) == 1)
	&& (Npc_HasItems(hero, ItWr_NandorToDragomir) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_Jagdgebiete_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_Jagdgebiete_15_00"); //Ich bin bei allen Jägern gewesen.
	AI_Output(self, hero, "Info_Mod_Dragomir_Jagdgebiete_12_01"); //Und, was sagen sie?

	Info_ClearChoices	(Info_Mod_Dragomir_Jagdgebiete);
	
	Info_AddChoice	(Info_Mod_Dragomir_Jagdgebiete, "Nandor ...", Info_Mod_Dragomir_Jagdgebiete_Nandor);
	Info_AddChoice	(Info_Mod_Dragomir_Jagdgebiete, "Grom ...", Info_Mod_Dragomir_Jagdgebiete_Grom);
	Info_AddChoice	(Info_Mod_Dragomir_Jagdgebiete, "Grimbald ...", Info_Mod_Dragomir_Jagdgebiete_Grimbald);
	Info_AddChoice	(Info_Mod_Dragomir_Jagdgebiete, "Gaan ...", Info_Mod_Dragomir_Jagdgebiete_Gaan);
};

FUNC VOID Info_Mod_Dragomir_Jagdgebiete_Nandor()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_Jagdgebiete_Nandor_15_00"); //Nandor gab mir diesen Brief hier für dich.

	B_GiveInvItems	(hero, self, ItWr_NandorToDragomir, 1);

	AI_Output(hero, self, "Info_Mod_Dragomir_Jagdgebiete_Nandor_15_01"); //Außerdem haben wir eine Gruppe Wölfe getötet, die sich ziemlich unnormal verhalten haben.
	AI_Output(self, hero, "Info_Mod_Dragomir_Jagdgebiete_Nandor_12_02"); //Zeig mal her.

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Dragomir_Jagdgebiete_Nandor_12_03"); //Hm, gut. Was war mit den Wölfen?
	AI_Output(hero, self, "Info_Mod_Dragomir_Jagdgebiete_Nandor_15_04"); //Nandor meinte, dass ihre Augen wirkten, wie die eines Toten. Außerdem haben sie sich einfach anders als andere Wölfe verhalten.
	AI_Output(self, hero, "Info_Mod_Dragomir_Jagdgebiete_Nandor_12_05"); //Gut, danke.

	BerichtCounter += 1;

	if (BerichtCounter == 4)
	{
		AI_Output(self, hero, "Info_Mod_Dragomir_Jagdgebiete_Fertig_12_00"); //So, wie ich sehe hast du alle Jäger befragt, nicht schlecht. Es gehört schon was dazu, hier durch die Wälder zu streifen.
		AI_Output(self, hero, "Info_Mod_Dragomir_Jagdgebiete_Fertig_12_01"); //Hier, nimm das als Belohnung für deine Mühen, es ist etwas besonderes.

		CreateInvItems	(self, ItWr_Bauplan_Wolfsring_Ruestung, 1);
		B_GiveInvItems	(self, hero, ItWr_Bauplan_Wolfsring_Ruestung, 1);

		B_GivePlayerXP	(500);

		if (Mod_AnzahlNebengilden < MaxNebengilden)
		{
			AI_Output(self, hero, "Info_Mod_Dragomir_Jagdgebiete_Fertig_12_02"); //Wenn du willst, werde ich dich jetzt in unsere Reihen aufnehmen.
		};

		B_LogEntry	(TOPIC_MOD_JG_JAGDGEBIETE, "Ich habe Dragomir von den Jägern berichtet.");
		B_SetTopicStatus	(TOPIC_MOD_JG_JAGDGEBIETE, LOG_SUCCESS);		

		Info_ClearChoices	(Info_Mod_Dragomir_Jagdgebiete);
	};
};

FUNC VOID Info_Mod_Dragomir_Jagdgebiete_Grom()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_Jagdgebiete_Grom_15_00"); //Grom hält sich immer noch bei den Söldnern auf, ihm ist aber zu Ohren gekommen, dass die Feldräuber den Söldnern wohl ordentlich Ärger bereiten.
	AI_Output(self, hero, "Info_Mod_Dragomir_Jagdgebiete_Grom_12_01"); //Feldräuber? (lacht kurz auf) Lästige Biester sind das, aber zum Glück ziemlich harmlos für einen fortgeschrittenen Kämpfer.

	BerichtCounter += 1;

	if (BerichtCounter == 4)
	{
		AI_Output(self, hero, "Info_Mod_Dragomir_Jagdgebiete_Fertig_12_00"); //So, wie ich sehe hast du alle Jäger befragt, nicht schlecht. Es gehört schon was dazu, hier durch die Wälder zu streifen.
		AI_Output(self, hero, "Info_Mod_Dragomir_Jagdgebiete_Fertig_12_01"); //Hier, nimm das als Belohnung für deine Mühen, es ist etwas besonderes.

		CreateInvItems	(self, ItWr_Bauplan_Wolfsring_Ruestung, 1);
		B_GiveInvItems	(self, hero, ItWr_Bauplan_Wolfsring_Ruestung, 1);

		B_GivePlayerXP	(500);

		if (Mod_AnzahlNebengilden < MaxNebengilden)
		{
			AI_Output(self, hero, "Info_Mod_Dragomir_Jagdgebiete_Fertig_12_02"); //Wenn du willst, werde ich dich jetzt in unsere Reihen aufnehmen.
		};

		B_LogEntry	(TOPIC_MOD_JG_JAGDGEBIETE, "Ich habe Dragomir von den Jägern berichtet.");
		B_SetTopicStatus	(TOPIC_MOD_JG_JAGDGEBIETE, LOG_SUCCESS);		

		Info_ClearChoices	(Info_Mod_Dragomir_Jagdgebiete);
	};
};

FUNC VOID Info_Mod_Dragomir_Jagdgebiete_Grimbald()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_Jagdgebiete_Grimbald_15_00"); //Grimbald ist fasziniert von dem Troll und hat von dort aus einen hervorragenden Blick übers Tal. Er hat einen merkwürdigen Erzbrocken bei einer Gruppe Snapper gefunden, die den Schwarzen Troll angegriffen haben.
	AI_Output(hero, self, "Info_Mod_Dragomir_Jagdgebiete_Grimbald_15_01"); //Er hat ihn mir für dich mitgegeben, vielleicht kannst du etwas damit anfangen.

	B_GiveInvItems	(hero, self, ItMi_Erzbrocken_Seltsam, 1);

	if (Npc_KnowsInfo(hero, Info_Mod_Grimbald_NandorGrom))
	{
		AI_Output(hero, self, "Info_Mod_Dragomir_Jagdgebiete_Grimbald_15_02"); //Ach ja. Und da oben im Wald geht auch was ab.
	};

	AI_Output(self, hero, "Info_Mod_Dragomir_Jagdgebiete_Grimbald_12_03"); //Merkwürdiges Zeug, das wirkt auf mich ganz und gar nicht gut. Wenn ich es nicht besser wüsste, würde ich sagen, dass von diesem Erz nichts gutes kommt.
	AI_Output(hero, self, "Info_Mod_Dragomir_Jagdgebiete_Grimbald_15_04"); //(skeptisch) Du meinst, der Klumpen Erz dort ist böse?
	AI_Output(self, hero, "Info_Mod_Dragomir_Jagdgebiete_Grimbald_12_05"); //He, was gibt es da zu lachen! Aber ja, so in etwa könnte man es auch ausdrücken ... Nimm den Brocken am besten wieder, vielleicht kennst du jemanden, der mehr darüber herausfinden kann.

	B_GiveInvItems	(self, hero, ItMi_Erzbrocken_Seltsam, 1);

	Mod_JG_GrimbaldTeacher = 1;

	BerichtCounter += 1;

	if (BerichtCounter == 4)
	{
		AI_Output(self, hero, "Info_Mod_Dragomir_Jagdgebiete_Fertig_12_00"); //So, wie ich sehe hast du alle Jäger befragt, nicht schlecht. Es gehört schon was dazu, hier durch die Wälder zu streifen.
		AI_Output(self, hero, "Info_Mod_Dragomir_Jagdgebiete_Fertig_12_01"); //Hier, nimm das als Belohnung für deine Mühen, es ist etwas besonderes.

		CreateInvItems	(self, ItWr_Bauplan_Wolfsring_Ruestung, 1);
		B_GiveInvItems	(self, hero, ItWr_Bauplan_Wolfsring_Ruestung, 1);

		B_GivePlayerXP	(500);

		if (Mod_AnzahlNebengilden < MaxNebengilden)
		{
			AI_Output(self, hero, "Info_Mod_Dragomir_Jagdgebiete_Fertig_12_02"); //Wenn du willst, werde ich dich jetzt in unsere Reihen aufnehmen.
		};

		B_LogEntry	(TOPIC_MOD_JG_JAGDGEBIETE, "Ich habe Dragomir von den Jägern berichtet.");
		B_SetTopicStatus	(TOPIC_MOD_JG_JAGDGEBIETE, LOG_SUCCESS);		

		Info_ClearChoices	(Info_Mod_Dragomir_Jagdgebiete);
	};
};

FUNC VOID Info_Mod_Dragomir_Jagdgebiete_Gaan()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_Jagdgebiete_Gaan_15_00"); //Gaan beobachtet weiter den Pass, hält die Wiese dort aber sehr geeignet für die Jagd. Ein paar Snapper hat er auch gesehen.
	AI_Output(self, hero, "Info_Mod_Dragomir_Jagdgebiete_Gaan_12_01"); //Snapper? Nichts besonderes in der Gegend.
	AI_Output(hero, self, "Info_Mod_Dragomir_Jagdgebiete_Gaan_15_03"); //Nein, wirklich nicht ...

	BerichtCounter += 1;

	if (BerichtCounter == 4)
	{
		AI_Output(self, hero, "Info_Mod_Dragomir_Jagdgebiete_Fertig_12_00"); //So, wie ich sehe hast du alle Jäger befragt, nicht schlecht. Es gehört schon was dazu, hier durch die Wälder zu streifen.
		AI_Output(self, hero, "Info_Mod_Dragomir_Jagdgebiete_Fertig_12_01"); //Hier, nimm das als Belohnung für deine Mühen, es ist etwas besonderes.

		CreateInvItems	(self, ItWr_Bauplan_Wolfsring_Ruestung, 1);
		B_GiveInvItems	(self, hero, ItWr_Bauplan_Wolfsring_Ruestung, 1);

		B_GivePlayerXP	(500);

		if (Mod_AnzahlNebengilden < MaxNebengilden)
		{
			AI_Output(self, hero, "Info_Mod_Dragomir_Jagdgebiete_Fertig_12_02"); //Wenn du willst, werde ich dich jetzt in unsere Reihen aufnehmen.
		};

		B_LogEntry	(TOPIC_MOD_JG_JAGDGEBIETE, "Ich habe Dragomir von den Jägern berichtet.");
		B_SetTopicStatus	(TOPIC_MOD_JG_JAGDGEBIETE, LOG_SUCCESS);		

		Info_ClearChoices	(Info_Mod_Dragomir_Jagdgebiete);
	};
};

INSTANCE Info_Mod_Dragomir_Aufnahme (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_Aufnahme_Condition;
	information	= Info_Mod_Dragomir_Aufnahme_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich will Jäger werden.";
};

FUNC INT Info_Mod_Dragomir_Aufnahme_Condition()
{
	if (BerichtCounter == 4)
	&& (Mod_AnzahlNebengilden < MaxNebengilden)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_Aufnahme_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_Aufnahme_15_00"); //Ich will Jäger werden.
	AI_Output(self, hero, "Info_Mod_Dragomir_Aufnahme_12_01"); //Hiermit bist du auch als Jäger aufgenommen.

	Mod_AnzahlNebengilden += 1;

	Jäger_Dabei = TRUE;

	Mod_DragomirsLager = Wld_GetDay();

	B_Göttergefallen(2, 2);

	Log_CreateTopic	(TOPIC_MOD_NEBENGILDEN, LOG_NOTE);
	B_LogEntry_NS	(TOPIC_MOD_NEBENGILDEN, "Ich bin jetzt ein Mitglied der Waldläufer.");
};

INSTANCE Info_Mod_Dragomir_ToDoChapter1 (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_ToDoChapter1_Condition;
	information	= Info_Mod_Dragomir_ToDoChapter1_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du noch mehr für mich zu tun?";
};

FUNC INT Info_Mod_Dragomir_ToDoChapter1_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dragomir_Jagdgebiete))
	&& (Jäger_Dabei == TRUE)
	&& (Kapitel == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_ToDoChapter1_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_ToDoChapter1_15_00"); //Hast du noch mehr für mich zu tun?
	AI_Output(self, hero, "Info_Mod_Dragomir_ToDoChapter1_12_01"); //Ja, hätte ich. Wahrscheinlich hast du dich ein wenig gewundert, dass die Feldräuber bei den Söldnern so aufdringlich waren, oder?
	AI_Output(hero, self, "Info_Mod_Dragomir_ToDoChapter1_15_02"); //Nunja, ein wenig.
	AI_Output(self, hero, "Info_Mod_Dragomir_ToDoChapter1_12_03"); //Nun, dass kommt davon, dass wir ihrer Population ... sagen wir mal ein bisschen unterstützt haben.
	AI_Output(hero, self, "Info_Mod_Dragomir_ToDoChapter1_15_04"); //Aha.
	AI_Output(self, hero, "Info_Mod_Dragomir_ToDoChapter1_12_05"); //Ja, die Bauern haben immer mehr Wald abgebrannt und die Tiere getötet um ihre Felder auszuweiten. Das konnten wir einfach nicht mehr gutheißen.
	AI_Output(hero, self, "Info_Mod_Dragomir_ToDoChapter1_15_06"); //Was habt ihr gemacht?
	AI_Output(self, hero, "Info_Mod_Dragomir_ToDoChapter1_12_07"); //Wir haben unter anderem Feldräubereier in ihren Nistplätzen versteckt und die Herde ein wenig vermehrt.
	AI_Output(hero, self, "Info_Mod_Dragomir_ToDoChapter1_15_08"); //Und was habe ich damit zu tun?
	AI_Output(self, hero, "Info_Mod_Dragomir_ToDoChapter1_12_09"); //Nun, ich hätte hier noch ein paar und das bisschen Ärger, das sie den Söldnern zur Zeit bereiten, reicht einfach noch nicht.
	AI_Output(hero, self, "Info_Mod_Dragomir_ToDoChapter1_15_10"); //Also soll ich ...
	AI_Output(self, hero, "Info_Mod_Dragomir_ToDoChapter1_12_11"); //Genau. Hier, du nimm diesen Trank ein, bevor du in ihr Nest gehst. Damit werden sie dich am Geruch nicht von ihren Artgenossen unterscheiden können und nicht angreifen.

	CreateInvItems	(self, ItPo_Feldraeubertrank, 1);
	B_GiveInvItems	(self, hero, ItPo_Feldraeubertrank, 1);

	AI_Output(self, hero, "Info_Mod_Dragomir_ToDoChapter1_12_12"); //Dann legst du in ihrem Nest diesen Eimer voller Eier ab. Das dürften noch ein paar Hundert von den Viechern sein, die in den nächsten Tagen schlüpfen müssten.

	CreateInvItems	(self, ItMi_Feldraeubereier, 1);
	B_GiveInvItems	(self, hero, ItMi_Feldraeubereier, 1);

	AI_Output(hero, self, "Info_Mod_Dragomir_ToDoChapter1_15_13"); //Oha. Ich hoffe für dich, dass der Trank funktioniert.
	AI_Output(self, hero, "Info_Mod_Dragomir_ToDoChapter1_12_14"); //Was denkst du denn wie wir das beim letzten Mal gemacht haben, he?

	Info_ClearChoices	(Info_Mod_Dragomir_ToDoChapter1);

	Info_AddChoice	(Info_Mod_Dragomir_ToDoChapter1, "In Ordnung, ich mach's.", Info_Mod_Dragomir_ToDoChapter1_Ja);
	Info_AddChoice	(Info_Mod_Dragomir_ToDoChapter1, "Ich glaub, ich lass es lieber. So ein wiederliches Zeug ...", Info_Mod_Dragomir_ToDoChapter1_Nein);
};

FUNC VOID Info_Mod_Dragomir_ToDoChapter1_Ja()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_ToDoChapter1_Ja_15_00"); //In Ordnung, ich mach's.

	Log_CreateTopic	(TOPIC_MOD_JG_BUGS, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_JG_BUGS, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_JG_BUGS, "Ich soll für Dragomir einen Eimer mit Feldräubereiern in der Feldräubrhöhle nahe Onars Hof ausleeren.");

	Bug_Mission = TRUE;

	Info_ClearChoices	(Info_Mod_Dragomir_ToDoChapter1);
};

FUNC VOID Info_Mod_Dragomir_ToDoChapter1_Nein()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_ToDoChapter1_Nein_15_00"); //Ich glaub, ich lass es lieber. So ein wiederliches Zeug ...

	Npc_RemoveInvItems	(hero, ItPo_Feldraeubertrank, 1);

	Npc_RemoveInvItems	(hero, ItMi_Feldraeubereier, 1);

	B_ShowGivenThings	("Trank und Eimer mit Feldräubereiern gegeben");

	Info_ClearChoices	(Info_Mod_Dragomir_ToDoChapter1);
};	

INSTANCE Info_Mod_Dragomir_EimerLeer (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_EimerLeer_Condition;
	information	= Info_Mod_Dragomir_EimerLeer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Der Eimer ist in ihrem Nest.";
};

FUNC INT Info_Mod_Dragomir_EimerLeer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dragomir_ToDoChapter1))
	&& (Mod_EimerAusgeleert == TRUE)
	&& (Bug_Mission == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_EimerLeer_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_EimerLeer_15_00"); //Der Eimer ist in ihrem Nest.
	AI_Output(self, hero, "Info_Mod_Dragomir_EimerLeer_12_01"); //Sehr gut. Hier, nimm das als Belohnung.

	B_GivePlayerXP	(100);

	CreateInvItems	(self, ItMi_Gold, 100);
	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	B_SetTopicStatus	(TOPIC_MOD_JG_BUGS, LOG_SUCCESS);

	B_Göttergefallen(2, 1);	
};

INSTANCE Info_Mod_Dragomir_BurnedLager (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_BurnedLager_Condition;
	information	= Info_Mod_Dragomir_BurnedLager_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Dragomir_BurnedLager_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dragomir_Jagdgebiete))
	&& (Mod_Drago == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_BurnedLager_Info()
{
	AI_Output(self, hero, "Info_Mod_Dragomir_BurnedLager_12_00"); //Ah, du. Endlich. Ich dachte schon, hier würde sich niemand hinwagen, außer diesen wiederlichen Viechern aus dem Wald. Sag mal, kannst du für mich was erledigen?

	Wld_SendUntrigger	("DRAGOMIRSFEUER");
	Wld_SendUntrigger	("DRAGOMIRSMOKE");
	
	Info_ClearChoices	(Info_Mod_Dragomir_BurnedLager);
	
	Info_AddChoice	(Info_Mod_Dragomir_BurnedLager, "Nein, dafür habe ich jetzt keine Zeit.", Info_Mod_Dragomir_BurnedLager_C);
	Info_AddChoice	(Info_Mod_Dragomir_BurnedLager, "Was soll ich für dich tun?", Info_Mod_Dragomir_BurnedLager_B);
	Info_AddChoice	(Info_Mod_Dragomir_BurnedLager, "Was macht ihr hier eigentlich in dieser Wildnis?", Info_Mod_Dragomir_BurnedLager_A);
};

FUNC VOID Info_Mod_Dragomir_BurnedLager_C()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_BurnedLager_C_15_00"); //Nein, dafür habe ich jetzt keine Zeit.
	AI_Output(self, hero, "Info_Mod_Dragomir_BurnedLager_C_12_01"); //Dann hinfort mit dir und stör uns nicht bei der Arbeit.		

	Mod_Drago = 3;

	Info_ClearChoices	(Info_Mod_Dragomir_BurnedLager);
};

FUNC VOID Info_Mod_Dragomir_BurnedLager_B()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_BurnedLager_B_15_00"); //Was soll ich für dich tun?
	AI_Output(self, hero, "Info_Mod_Dragomir_BurnedLager_B_12_01"); //Gut, hör zu. Die Waldläufer und Druiden haben im Minental gerade eine Art Versammlung. Richte ihnen aus, wie es um uns steht und bitte sie, uns Verstärkung zu schicken.
	AI_Output(self, hero, "Info_Mod_Dragomir_BurnedLager_B_12_02"); //Hier, auf der Karte habe ich ihren Aufenthaltsort für dich markiert. Beeil dich.

	B_GiveInvItems	(self, hero, ItWr_EremitenCamp, 1);

	Mod_Drago = 4;

	B_LogEntry	(TOPIC_MOD_JG_LAGER, "Dragomir hat mir erzählt, dass das Lager von Schwarzmagiern und Banditen überfallen wurde. Er bat mich bei den Druiden und Waldläufern im Minental Verstärkung anzufordern.");

	Info_ClearChoices	(Info_Mod_Dragomir_BurnedLager);
};

FUNC VOID Info_Mod_Dragomir_BurnedLager_A()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_BurnedLager_A_15_00"); //Was macht ihr hier eigentlich in dieser Wildnis?
	AI_Output(self, hero, "Info_Mod_Dragomir_BurnedLager_A_12_01"); //Wir mussten hierhin flüchten. Einige Schwarzmagier griffen uns an, unterstützt wurden sie dazu noch von Banditen.
	AI_Output(self, hero, "Info_Mod_Dragomir_BurnedLager_A_12_02"); //Wir können von Glück reden, dass sie sich in dieser Gegend nicht so gut auskennen, sonst wären wir schon längst überwältigt worden. Aber lange werden sie nichtmehr brauchen, uns aufzuspüren.
	AI_Output(self, hero, "Info_Mod_Dragomir_BurnedLager_A_12_03"); //Du siehst, die Situation ist ernst, hilfst du uns nun?

	Info_ClearChoices	(Info_Mod_Dragomir_BurnedLager);
	
	Info_AddChoice	(Info_Mod_Dragomir_BurnedLager, "Nein, dafür habe ich jetzt keine Zeit.", Info_Mod_Dragomir_BurnedLager_C);
	Info_AddChoice	(Info_Mod_Dragomir_BurnedLager, "Was soll ich für dich tun?", Info_Mod_Dragomir_BurnedLager_B);
};

INSTANCE Info_Mod_Dragomir_WillQuestDoch (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_WillQuestDoch_Condition;
	information	= Info_Mod_Dragomir_WillQuestDoch_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Dragomir_WillQuestDoch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dragomir_BurnedLager))
	&& (Npc_IsInState(self, ZS_Talk))
	&& (Mod_Drago == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_WillQuestDoch_Info()
{
	AI_Output(self, hero, "Info_Mod_Dragomir_WillQuestDoch_12_00"); //Hast du dich doch noch dazu entschlossen, uns zu helfen?
	
	Info_ClearChoices	(Info_Mod_Dragomir_WillQuestDoch);
	
	Info_AddChoice	(Info_Mod_Dragomir_WillQuestDoch, "Nein, dafür habe ich jetzt keine Zeit.", Info_Mod_Dragomir_BurnedLager_C);
	Info_AddChoice	(Info_Mod_Dragomir_WillQuestDoch, "Was soll ich für dich tun?", Info_Mod_Dragomir_BurnedLager_B);
};

INSTANCE Info_Mod_Dragomir_HilfeII (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_HilfeII_Condition;
	information	= Info_Mod_Dragomir_HilfeII_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bei Adanos! Was war hier los?";
};

FUNC INT Info_Mod_Dragomir_HilfeII_Condition()
{
	if (Mod_JG_DragoHilfe2 == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_HilfeII_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_HilfeII_15_00"); //Bei Adanos! Was war hier los?
	AI_Output(self, hero, "Info_Mod_Dragomir_HilfeII_12_01"); //Ich weiß es nicht! Die Meute kam aus dem dunklen Wald. Und das waren nicht die Ersten.
	AI_Output(hero, self, "Info_Mod_Dragomir_HilfeII_15_02"); //Hat einer der Feinde überlebt, den man ausfragen kann.
	AI_Output(self, hero, "Info_Mod_Dragomir_HilfeII_12_03"); //Ich glaub nicht. Es rührt sich keiner mehr.
	AI_Output(hero, self, "Info_Mod_Dragomir_HilfeII_15_04"); //Hm. Es hat was mit einem Khorgor zu tun. Scheinbar ein irrer Magier. Mehr wissen wir nicht.
	AI_Output(self, hero, "Info_Mod_Dragomir_HilfeII_12_05"); //Aber warum wir Jäger und Waldläufer? Wir gehören doch zu den Harmlosesten auf der Insel.
	AI_Output(hero, self, "Info_Mod_Dragomir_HilfeII_15_06"); //Wir wissen es nicht genau. Aber wir werden diesen Khorgor erwischen.
	AI_Output(self, hero, "Info_Mod_Dragomir_HilfeII_12_07"); //Dein Wort in Adanos Ohr! Und wie geht's weiter?
	AI_Output(hero, self, "Info_Mod_Dragomir_HilfeII_15_08"); //Keine Ahnung. Ich sollte euch nur unterstützen, wenn nötig.
	AI_Output(hero, self, "Info_Mod_Dragomir_HilfeII_15_09"); //Ich gehe zurück ins Minental. Habe da noch einiges zu erledigen.
	AI_Output(self, hero, "Info_Mod_Dragomir_HilfeII_12_10"); //Adanos mit dir! Ich halte hier die Stellung.
	AI_Output(hero, self, "Info_Mod_Dragomir_HilfeII_15_11"); //Wer kümmert sich um Nandor und Ruga?
	AI_Output(self, hero, "Info_Mod_Dragomir_HilfeII_12_12"); //Ich lass die Kräuterhexe kommen.
	AI_Output(hero, self, "Info_Mod_Dragomir_HilfeII_15_13"); //Gut. Und viel Glück noch.

	B_LogEntry	(TOPIC_MOD_JG_DRAGOMIRHILFE2, "Hier war der Kampf in vollem Gange, als ich eintraf. Mit Mühe haben wir gesiegt. Wild ist gefallen, Nandor und Ruga sind verletzt. Ich muss das Cyrco berichten.");

	B_StartOtherRoutine	(Mod_1937_JGR_Nandor_NW, "KO");
	B_StartOtherRoutine	(Mod_749_MIL_Ruga_NW, "KO");

	B_KillNpc	(Mod_7413_JG_Wild_NW);
};

INSTANCE Info_Mod_Dragomir_Untier (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_Untier_Condition;
	information	= Info_Mod_Dragomir_Untier_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ist dir in letzter Zeit etwas Ungewöhnliches begegnet?";
};

FUNC INT Info_Mod_Dragomir_Untier_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dragomir_Hi))
	&& (Mod_Cronos_Artefakt == 2)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Cronos_AW_Artefakt_02))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_Untier_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_Untier_15_00"); //Ist dir in letzter Zeit etwas Ungewöhnliches begegnet?
	AI_Output(self, hero, "Info_Mod_Dragomir_Untier_12_01"); //Hmm, ja, vor ein paar Tagen liefen hier einige dieser Dämonenmagier durch die Gegend und haben ihre finsteren Rituale durchgeführt.
	AI_Output(self, hero, "Info_Mod_Dragomir_Untier_12_02"); //Der Boden wies zunächst ungewöhnliche Veränderungen auf, aber ...
	AI_Output(hero, self, "Info_Mod_Dragomir_Untier_15_03"); //Ja, das hatte ich schon.
};

INSTANCE Info_Mod_Dragomir_WhoAreYou (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_WhoAreYou_Condition;
	information	= Info_Mod_Dragomir_WhoAreYou_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer seid ihr?";
};

FUNC INT Info_Mod_Dragomir_WhoAreYou_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dragomir_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_WhoAreYou_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_WhoAreYou_15_00"); //Wer seid ihr?
	AI_Output(self, hero, "Info_Mod_Dragomir_WhoAreYou_12_01"); //Wir sind Jäger in den Wäldern vor Khorinis und verkaufen unsere Beute meist an die Händler in der Stadt. Hier haben wir eines unserer Lager.
};

INSTANCE Info_Mod_Dragomir_LohntEsSich (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_LohntEsSich_Condition;
	information	= Info_Mod_Dragomir_LohntEsSich_Info;
	permanent	= 0;
	important	= 0;
	description	= "Lohnt sich die Jagd hier?";
};

FUNC INT Info_Mod_Dragomir_LohntEsSich_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dragomir_WhoAreYou))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_LohntEsSich_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_LohntEsSich_15_00"); //Lohnt sich die Jagd hier?
	AI_Output(self, hero, "Info_Mod_Dragomir_LohntEsSich_12_01"); //Oh ja. In den Wäldern hier wimmelt es von Tieren. Man darf sich nur nicht zu weit hinein wagen.
	AI_Output(hero, self, "Info_Mod_Dragomir_LohntEsSich_15_02"); //Warum nicht?
	AI_Output(self, hero, "Info_Mod_Dragomir_LohntEsSich_12_03"); //Würdest du laufende Skelette und verrückte Goblins als jagbare Tiere ansehen?
	AI_Output(hero, self, "Info_Mod_Dragomir_LohntEsSich_15_04"); //Eigentlich nicht.
	AI_Output(self, hero, "Info_Mod_Dragomir_LohntEsSich_12_05"); //Na also.
};

INSTANCE Info_Mod_Dragomir_WerBistDu (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_WerBistDu_Condition;
	information	= Info_Mod_Dragomir_WerBistDu_Info;
	permanent	= 0;
	important	= 0;
	description	= "Und wer bist du?";
};

FUNC INT Info_Mod_Dragomir_WerBistDu_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dragomir_WhoAreYou))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_WerBistDu_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_WerBistDu_15_00"); //Und wer bist du?
	AI_Output(self, hero, "Info_Mod_Dragomir_WerBistDu_12_01"); //Ich heiße Dragomir und bin der Anführer dieses Lagers.
};

INSTANCE Info_Mod_Dragomir_MitmachenPre (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_MitmachenPre_Condition;
	information	= Info_Mod_Dragomir_MitmachenPre_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kann ich mich den Jägern anschließen?";
};

FUNC INT Info_Mod_Dragomir_MitmachenPre_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dragomir_WhoAreYou))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_MitmachenPre_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_MitmachenPre_15_00"); //Kann ich mich den Jägern anschließen?
	AI_Output(self, hero, "Info_Mod_Dragomir_MitmachenPre_12_01"); //Gehörst du einer Gilde an?
	AI_Output(hero, self, "Info_Mod_Dragomir_MitmachenPre_15_02"); //Bis jetzt noch nicht.
	AI_Output(self, hero, "Info_Mod_Dragomir_MitmachenPre_12_03"); //Dann komm wieder, wenn du Mitglied einer Gilde bist. Hast ja noch nichts auf den Rippen. Bei uns geht's manchmal ruppig zu.
};

INSTANCE Info_Mod_Dragomir_Bosper (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_Bosper_Condition;
	information	= Info_Mod_Dragomir_Bosper_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich soll dich von Bosper grüßen. Er braucht neue Felle.";
};

FUNC INT Info_Mod_Dragomir_Bosper_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dragomir_WhoAreYou))
	&& (Npc_KnowsInfo(hero, Info_Mod_Bosper_OtherHunters))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_Bosper_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_Bosper_15_00"); //Ich soll dich von Bosper grüßen. Er braucht neue Felle.
	AI_Output(self, hero, "Info_Mod_Dragomir_Bosper_12_01"); //Ach ja. Ich hab hier einen Stapel. Könntest du ...

	B_GiveInvItems	(self, hero, ItMi_Wolfsfelle, 1);

	AI_Output(hero, self, "Info_Mod_Dragomir_Bosper_15_02"); //Die Ausliefern? Wenn ich dir damit einen Gefallen tue, gerne.
	AI_Output(self, hero, "Info_Mod_Dragomir_Bosper_12_03"); //Sag ihm, wir rechnen ab, wenn ich in die Stadt komme.
	AI_Output(hero, self, "Info_Mod_Dragomir_Bosper_15_04"); //Bin schon unterwegs.

	Log_CreateTopic	(TOPIC_MOD_BOSPER_FELLLIEFERUNG, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BOSPER_FELLLIEFERUNG, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BOSPER_FELLLIEFERUNG, "Ich soll die Felle von Dragomir dem Bosper bringen. Das bringt sicher Punkte für die Aufnahme.");
};

INSTANCE Info_Mod_Dragomir_AllesKlar (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_AllesKlar_Condition;
	information	= Info_Mod_Dragomir_AllesKlar_Info;
	permanent	= 0;
	important	= 0;
	description	= "Und kommt ihr zurecht?";
};

FUNC INT Info_Mod_Dragomir_AllesKlar_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dragomir_WhoAreYou))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_AllesKlar_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_AllesKlar_15_00"); //Und kommt ihr zurecht?
	AI_Output(self, hero, "Info_Mod_Dragomir_AllesKlar_12_01"); //Es reicht zum überleben.
};

INSTANCE Info_Mod_Dragomir_Mitmachen (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_Mitmachen_Condition;
	information	= Info_Mod_Dragomir_Mitmachen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kann ich bei euch mitmachen?";
};

FUNC INT Info_Mod_Dragomir_Mitmachen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dragomir_WhoAreYou))
	&& (Mod_Gilde > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_Mitmachen_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_Mitmachen_15_00"); //Kann ich bei euch mitmachen?
	AI_Output(self, hero, "Info_Mod_Dragomir_Mitmachen_12_01"); //Das kann ich nicht alleine entscheiden. Aber wo du gerade fragst, ich hätte da etwas, was du für mich tun könntest.
	AI_Output(hero, self, "Info_Mod_Dragomir_Mitmachen_15_02"); //Um was geht es?
	AI_Output(self, hero, "Info_Mod_Dragomir_Mitmachen_12_03"); //Einige Jäger von uns haben sich über das Land verteilt und suchen gute Jagdgebiete. Ich möchte, dass du bei ihnen vorbeischaust und sie fragst, wie es bei ihnen aussieht.
	AI_Output(self, hero, "Info_Mod_Dragomir_Mitmachen_12_04"); //Dann müssen sie nicht den ganzen Weg hin und her rennen.
	AI_Output(hero, self, "Info_Mod_Dragomir_Mitmachen_15_05"); //Wo halten sich die Jäger auf?
	AI_Output(self, hero, "Info_Mod_Dragomir_Mitmachen_12_06"); //Es sind insgesamt vier Jäger unterwegs. Gaan, Nandor, Grimbald und Grom.
	AI_Output(self, hero, "Info_Mod_Dragomir_Mitmachen_12_07"); //Gaan hält sich am Pass zum Minental auf, Grom müsstest du auf Onars Hof bei den Söldnern finden, er wollte sich dort umhören.
	AI_Output(self, hero, "Info_Mod_Dragomir_Mitmachen_12_08"); //Nandor ist in den dunklen Wald gegangen. Soweit ich weiss, befindet sich dort irgendwo einer dieser Steinkreise, such dort nach ihm.
	AI_Output(self, hero, "Info_Mod_Dragomir_Mitmachen_12_09"); //Grimbald ist an einem See, in der Nähe der Höhle des schwarzen Trolles. Er wollte sich das Biest mal ansehen. Falls er die Begegnung überlebt hat, findest du ihn bestimt noch dort.

	Log_CreateTopic	(TOPIC_MOD_JG_JAGDGEBIETE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_JG_JAGDGEBIETE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_JG_JAGDGEBIETE, "Dragomir hat mich gebeten die vier Jäger Gaan, Nandor, Grimbald und Grom aufzusuchen. Gaan befindet sich am Pass zum Minental, Grom ist auf Onars Hof, Nandor ist im dunklen Wald in der Nähe eines Steinkreises und Grimbald ist an einem See in der nähe des schwarzen Trolls.");
};

INSTANCE Info_Mod_Dragomir_WoIst (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_WoIst_Condition;
	information	= Info_Mod_Dragomir_WoIst_Info;
	permanent	= 1;
	important	= 0;
	description	= "Wo finde ich ...";
};

FUNC INT Info_Mod_Dragomir_WoIst_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dragomir_Mitmachen))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Dragomir_Jagdgebiete))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_WoIst_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_WoIst_15_00"); //Wo finde ich ...

	Info_ClearChoices	(Info_Mod_Dragomir_WoIst);

	Info_AddChoice	(Info_Mod_Dragomir_WoIst, DIALOG_BACK, Info_Mod_Dragomir_WoIst_BACK);
	Info_AddChoice	(Info_Mod_Dragomir_WoIst, "Nandor", Info_Mod_Dragomir_WoIst_Nandor);
	Info_AddChoice	(Info_Mod_Dragomir_WoIst, "Grom", Info_Mod_Dragomir_WoIst_Grom);
	Info_AddChoice	(Info_Mod_Dragomir_WoIst, "Grimbald", Info_Mod_Dragomir_WoIst_Grimbald);
	Info_AddChoice	(Info_Mod_Dragomir_WoIst, "Gaan", Info_Mod_Dragomir_WoIst_Gaan);
};

FUNC VOID Info_Mod_Dragomir_WoIst_BACK()
{
	Info_ClearChoices	(Info_Mod_Dragomir_WoIst);
};

FUNC VOID Info_Mod_Dragomir_WoIst_Nandor()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_WoIst_Nandor_15_00"); //... Nandor?
	AI_Output(self, hero, "Info_Mod_Dragomir_WoIst_Nandor_12_01"); //Nandor ist im dunklen Wald, irgendwo in der Nähe eines Steinkreises.

	Info_ClearChoices	(Info_Mod_Dragomir_WoIst);

	Info_AddChoice	(Info_Mod_Dragomir_WoIst, DIALOG_BACK, Info_Mod_Dragomir_WoIst_BACK);
	Info_AddChoice	(Info_Mod_Dragomir_WoIst, "Nandor", Info_Mod_Dragomir_WoIst_Nandor);
	Info_AddChoice	(Info_Mod_Dragomir_WoIst, "Grom", Info_Mod_Dragomir_WoIst_Grom);
	Info_AddChoice	(Info_Mod_Dragomir_WoIst, "Grimbald", Info_Mod_Dragomir_WoIst_Grimbald);
	Info_AddChoice	(Info_Mod_Dragomir_WoIst, "Gaan", Info_Mod_Dragomir_WoIst_Gaan);
};

FUNC VOID Info_Mod_Dragomir_WoIst_Grom()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_WoIst_Grom_15_00"); //... Grom?
	AI_Output(self, hero, "Info_Mod_Dragomir_WoIst_Grom_12_01"); //Er ist auf Onars Hof bei den Söldnern.

	Info_ClearChoices	(Info_Mod_Dragomir_WoIst);

	Info_AddChoice	(Info_Mod_Dragomir_WoIst, DIALOG_BACK, Info_Mod_Dragomir_WoIst_BACK);
	Info_AddChoice	(Info_Mod_Dragomir_WoIst, "Nandor", Info_Mod_Dragomir_WoIst_Nandor);
	Info_AddChoice	(Info_Mod_Dragomir_WoIst, "Grom", Info_Mod_Dragomir_WoIst_Grom);
	Info_AddChoice	(Info_Mod_Dragomir_WoIst, "Grimbald", Info_Mod_Dragomir_WoIst_Grimbald);
	Info_AddChoice	(Info_Mod_Dragomir_WoIst, "Gaan", Info_Mod_Dragomir_WoIst_Gaan);
};

FUNC VOID Info_Mod_Dragomir_WoIst_Grimbald()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_WoIst_Grimbald_15_00"); //... Grimbald?
	AI_Output(self, hero, "Info_Mod_Dragomir_WoIst_Grimbald_12_01"); //Grimbald ist beim See in der Nähe des schwarzen Trolls.

	Info_ClearChoices	(Info_Mod_Dragomir_WoIst);

	Info_AddChoice	(Info_Mod_Dragomir_WoIst, DIALOG_BACK, Info_Mod_Dragomir_WoIst_BACK);
	Info_AddChoice	(Info_Mod_Dragomir_WoIst, "Nandor", Info_Mod_Dragomir_WoIst_Nandor);
	Info_AddChoice	(Info_Mod_Dragomir_WoIst, "Grom", Info_Mod_Dragomir_WoIst_Grom);
	Info_AddChoice	(Info_Mod_Dragomir_WoIst, "Grimbald", Info_Mod_Dragomir_WoIst_Grimbald);
	Info_AddChoice	(Info_Mod_Dragomir_WoIst, "Gaan", Info_Mod_Dragomir_WoIst_Gaan);
};

FUNC VOID Info_Mod_Dragomir_WoIst_Gaan()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_WoIst_Gaan_15_00"); //... Gaan?
	AI_Output(self, hero, "Info_Mod_Dragomir_WoIst_Gaan_12_01"); //Gaan ist am Pass zum Minental.

	Info_ClearChoices	(Info_Mod_Dragomir_WoIst);

	Info_AddChoice	(Info_Mod_Dragomir_WoIst, DIALOG_BACK, Info_Mod_Dragomir_WoIst_BACK);
	Info_AddChoice	(Info_Mod_Dragomir_WoIst, "Nandor", Info_Mod_Dragomir_WoIst_Nandor);
	Info_AddChoice	(Info_Mod_Dragomir_WoIst, "Grom", Info_Mod_Dragomir_WoIst_Grom);
	Info_AddChoice	(Info_Mod_Dragomir_WoIst, "Grimbald", Info_Mod_Dragomir_WoIst_Grimbald);
	Info_AddChoice	(Info_Mod_Dragomir_WoIst, "Gaan", Info_Mod_Dragomir_WoIst_Gaan);
};

INSTANCE Info_Mod_Dragomir_Pedro (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_Pedro_Condition;
	information	= Info_Mod_Dragomir_Pedro_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du einen Feuer Novizen gesehen?";
};

FUNC INT Info_Mod_Dragomir_Pedro_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Isgaroth_Pedro))
	&& (Npc_KnowsInfo(hero, Info_Mod_Dragomir_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Parlan_Ring_Zurueck))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_Pedro_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_Pedro_15_00"); //Hast du einen Feuer Novizen gesehen?
	AI_Output(self, hero, "Info_Mod_Dragomir_Pedro_12_01"); //Natürlich hab ich einen Feuer Novizen gesehen. Ich seh jeden Tag einen.
	AI_Output(hero, self, "Info_Mod_Dragomir_Pedro_15_02"); //Hast du heute auch schon einen gesehen.
	AI_Output(self, hero, "Info_Mod_Dragomir_Pedro_12_03"); //Klar, dich.
	AI_Output(hero, self, "Info_Mod_Dragomir_Pedro_15_04"); //Und außer mir?
	AI_Output(self, hero, "Info_Mod_Dragomir_Pedro_12_05"); //Ach ja, jetzt erinnere ich mich. Vorhin ist ein Novize in die Taverne gerannt. Er schien es ziemlich eilig zu haben.
	AI_Output(hero, self, "Info_Mod_Dragomir_Pedro_15_06"); //Danke.
	AI_output(self, hero, "Info_Mod_Dragomir_Pedro_12_07"); //Kein Problem.

	B_LogEntry	(TOPIC_MOD_PARLAN_FEUERRING, "Dragomir hat gesehen wie Pedro in die Taverne gerannt ist.");
};

INSTANCE Info_Mod_Dragomir_Orlan (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_Orlan_Condition;
	information	= Info_Mod_Dragomir_Orlan_Info;
	permanent	= 0;
	important	= 0;
	description	= "Orlan sagt, dass kein Novize in seine Taverne gegangen ist.";
};

FUNC INT Info_Mod_Dragomir_Orlan_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Orlan_Pedro))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_Orlan_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_Orlan_15_00"); //Orlan sagt, dass kein Novize in seine Taverne gegangen ist.
	AI_Output(self, hero, "Info_Mod_Dragomir_Orlan_12_01"); //Dann hat wohl einer von uns beiden gelogen.
	AI_Output(hero, self, "Info_Mod_Dragomir_Orlan_15_02"); //Ich schätze mal du hast mich angelogen.
	AI_Output(self, hero, "Info_Mod_Dragomir_Orlan_12_03"); //Na warte, sowas muss ich mir nicht gefallen lassen.

	AI_StopProcessInfos	(self);
	B_Attack	(self, hero, AR_NONE, 1);
};

INSTANCE Info_Mod_Dragomir_Niederlage (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_Niederlage_Condition;
	information	= Info_Mod_Dragomir_Niederlage_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Dragomir_Niederlage_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dragomir_Orlan))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_Niederlage_Info()
{
	if (self.aivar[AIV_LastPlayerAR] == AR_NONE) //Kampf aus Dialog heraus.
	{
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output(self, hero, "Info_Mod_Dragomir_Niederlage_12_00"); //Ok, Ok, ich hab gelogen.
			AI_Output(hero, self, "Info_Mod_Dragomir_Niederlage_15_01"); //Also sagst du mir jetzt wo Pedro ist oder muss ich nochmal?
			AI_Output(self, hero, "Info_Mod_Dragomir_Niederlage_12_02"); //Jaja. Wenn du dem Weg hier folgst findest auf der rechten Seite etwas abgelegen ein Lager. Dort hält er sich versteckt.

			B_LogEntry	(TOPIC_MOD_PARLAN_FEUERRING, "Pedro hält sich in einem Lager versteckt, dass sich hinter dem Lager von Dragomir befindet.");

			B_Göttergefallen(1, 1);
		}
		else if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
		{
			AI_Output(self, hero, "Info_Mod_Dragomir_Niederlage_12_03"); //Das nächste mal solltest du es dir zweimal überlegen bevor du mich als Lügner bezeichnest.
		};
							
		// ------ In jedem Fall: Arena-Kampf abgeschlossen ------
		self.aivar[AIV_ArenaFight] = AF_NONE;
		
		// ------ AIVAR resetten! ------	
		self.aivar[AIV_LastFightComment] = TRUE;
	};
		AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Dragomir_Plage (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_Plage_Condition;
	information	= Info_Mod_Dragomir_Plage_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du als Waldläufer hast doch bestimmt Kenntnis über die Fauna und Flora, auch die von Gewässern.";
};

FUNC INT Info_Mod_Dragomir_Plage_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lee_Plage))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_Plage_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_Plage_15_00"); //Du als Waldläufer hast doch bestimmt Kenntnis über die Fauna und Flora, auch die von Gewässern.
	AI_Output(self, hero, "Info_Mod_Dragomir_Plage_12_01"); //Ja, da bist du bei mir richtig. Worum geht es?
	AI_Output(hero, self, "Info_Mod_Dragomir_Plage_15_02"); //Nun, aus dem See im Neuen Lager entsteigen lauter Würmer und Krabben, die die gesamte Umgebung heimsuchen.
	AI_Output(self, hero, "Info_Mod_Dragomir_Plage_12_03"); //Der See im Neuen Lager?! So weit ich mich erinnere soll dort doch ein Staudamm errichtet worden sein.
	AI_Output(self, hero, "Info_Mod_Dragomir_Plage_12_04"); //Und die ursprüngliche Tierwelt habt ihr dort bestimmt auch ordentlich dezimiert, stimmt’s?
	AI_Output(self, hero, "Info_Mod_Dragomir_Plage_12_05"); //Es würde mich wundern, wenn man dort noch einen einzigen Lurker finden würde.
	AI_Output(hero, self, "Info_Mod_Dragomir_Plage_15_06"); //(verlegen) Ohh, öhh, nun ... aber woher ...?
	AI_Output(self, hero, "Info_Mod_Dragomir_Plage_12_07"); //Wie töricht doch die Menschen sind. Verheeren ihre Umgebung und glauben, dass dies ungesühnt bliebe.
	AI_Output(self, hero, "Info_Mod_Dragomir_Plage_12_08"); //Was meinst du, wie es kommt, dass sich so viele Sumpfhaie und Blutfliegen gerade im Sumpf finden?
	AI_Output(self, hero, "Info_Mod_Dragomir_Plage_12_09"); //Herrliche stehende Gewässer, wo sich die Eier der Sumpffliegen und die Sporen der Sumpfhaie zu Larven entwickeln können ... und vor allem ohne ihre Fressfeinde, die Lurker.
	AI_Output(self, hero, "Info_Mod_Dragomir_Plage_12_10"); //Ihr keilt den See in einen Staudamm ein und rottet die Lurker aus?
	AI_Output(self, hero, "Info_Mod_Dragomir_Plage_12_11"); //Geschieht auch ganz recht, ihr seid selbst schuld, an dem, was nun mit dem See passiert.
	AI_Output(hero, self, "Info_Mod_Dragomir_Plage_15_12"); //Aber kann man denn gar nichts machen, um das was geschieht zu stoppen?
	AI_Output(self, hero, "Info_Mod_Dragomir_Plage_12_13"); //Tjaa ... ihr müsstet zumindest den Schaden, welchen ihr an der Tierwelt des Sees begangen habt, wieder beheben.
	AI_Output(hero, self, "Info_Mod_Dragomir_Plage_15_14"); //Das hieße ja aber, die Lurker wieder ...
	AI_Output(self, hero, "Info_Mod_Dragomir_Plage_12_15"); //Ganz genau.
	AI_Output(hero, self, "Info_Mod_Dragomir_Plage_15_16"); //Wie sollte das zu schaffen sein?
	AI_Output(hero, self, "Info_Mod_Dragomir_Plage_15_17"); //Ich kann schlecht ein ausgewachsenes Tier ins Lager schleifen ... und die Brutsaison ist schon um, sodass es keine Lurkereier mehr gibt.
	AI_Output(self, hero, "Info_Mod_Dragomir_Plage_12_18"); //Deine Kenntnis über die Brutzeiten der Lurker überrascht mich ...
	AI_Output(hero, self, "Info_Mod_Dragomir_Plage_15_19"); //Tja, nun ...
	AI_Output(self, hero, "Info_Mod_Dragomir_Plage_12_20"); //Sie scheint aber nicht vollkommen zu sein.
	AI_Output(hero, self, "Info_Mod_Dragomir_Plage_15_21"); //Wie, was meinst du damit?
	AI_Output(self, hero, "Info_Mod_Dragomir_Plage_12_22"); //Zwar haben die Lurker im Minental und nahe Khorinis schon gebrütet, das stimmt ... aber die ihre Artgenossen im Norden der Insel, genannt Relendel, sind da einige Wochen später dran.
	AI_Output(self, hero, "Info_Mod_Dragomir_Plage_12_23"); //Wenn du Glück hast, findest du dort nahe dem See noch einige Eier.
	AI_Output(self, hero, "Info_Mod_Dragomir_Plage_12_24"); //Wenn du zumindest drei davon in einer Lurkerhöhle beim See des Neuen Lagers ablegst, so sollte sich der Zustand eures Gewässers in nicht allzu langer Zeit wieder normalisieren.
	AI_Output(self, hero, "Info_Mod_Dragomir_Plage_12_25"); //Ich hoffe aber, dass dieser Zwischenfall dir und den anderen Söldnern eine Lehre von Dauer sein wird.

	B_LogEntry	(TOPIC_MOD_NL_PLAGE, "Dragomir meinte, dass ich beim See in Relendel noch Lurkereier finden könnte. Wenn ich drei davon in der Lurkerhöhle im Neuen Lager deponiere, müsste die Plage bald Geschichte sein. Die Eier werden sich vermutlich in einer Höhle im große See befinden. Die Stelle, wo ich tauchen muss, wird sicher durch Lurker am Strand angezeigt.");

	Mod_NL_JeremiahHasEier = 3;

	B_GivePlayerXP	(200);
};

INSTANCE Info_Mod_Dragomir_Leichengase (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_Leichengase_Condition;
	information	= Info_Mod_Dragomir_Leichengase_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich brauche deine Hilfe.";
};

FUNC INT Info_Mod_Dragomir_Leichengase_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Caine_Leichengase4))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Lobart_Leichengase2))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Hyglas_Leichengase))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_Leichengase_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_Leichengase_15_00"); //Ich brauche deine Hilfe.
	AI_Output(self, hero, "Info_Mod_Dragomir_Leichengase_12_01"); //Wobei?
	AI_Output(hero, self, "Info_Mod_Dragomir_Leichengase_15_02"); //Ich hab hier einen Sack voll Kräuter, die ich einen Troll verfüttern muss.
	AI_Output(self, hero, "Info_Mod_Dragomir_Leichengase_12_03"); //(lacht herzhaft) Du willst einem Troll dieses Gemüse verfüttern?
	AI_Output(self, hero, "Info_Mod_Dragomir_Leichengase_12_04"); //Wir sprechen schon von dem gleichen Wesen, oder?
	AI_Output(self, hero, "Info_Mod_Dragomir_Leichengase_12_05"); //Drei Meter groß, ziemlich haarig, Mundgeruch wie Beliars Arsch ... und warte, da war doch noch was. Ach ja, FLEISCHFRESSER!
	AI_Output(hero, self, "Info_Mod_Dragomir_Leichengase_15_06"); //Wenn der Troll das Zeug einfach fressen würde, bräuchte ich wohl kaum deine Hilfe.
	AI_Output(self, hero, "Info_Mod_Dragomir_Leichengase_12_07"); //Was soll der ganze Scheiß überhaupt? Ach lass stecken, ich will’s gar nicht wissen.
	AI_Output(self, hero, "Info_Mod_Dragomir_Leichengase_12_08"); //Wenn du wirklich willst, dass ein Troll dieses Grünzeug frisst dann schmier es kräftig mit Moleratfett ein!
	AI_Output(self, hero, "Info_Mod_Dragomir_Leichengase_12_09"); //Die Biester lieben den Gestank von diesem ranzigen Teufelszeug.

	if (Jäger_Dabei == TRUE)
	{
		AI_Output(hero, self, "Info_Mod_Dragomir_Leichengase_15_10"); //Danke.
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Dragomir_Leichengase_15_11"); //Warum nicht gleich so? Danke.
		AI_Output(self, hero, "Info_Mod_Dragomir_Leichengase_12_12"); //Was soll der Mist?
		AI_Output(self, hero, "Info_Mod_Dragomir_Leichengase_12_13"); //Mit einem Danke kann ich mich in der Taverne nicht betrinken, um das Gespräch das wir eben hatten zu vergessen.

		Info_ClearChoices	(Info_Mod_Dragomir_Leichengase);

		if (Npc_HasItems(hero, ItMi_Gold) >= 50)
		{
			Info_AddChoice	(Info_Mod_Dragomir_Leichengase, "Hier hast du 50 Goldstücke.", Info_Mod_Dragomir_Leichengase_B);
		};
		Info_AddChoice	(Info_Mod_Dragomir_Leichengase, "", Info_Mod_Dragomir_Leichengase_A);
	};

	B_GivePlayerXP	(150);

	B_LogEntry	(TOPIC_MOD_SL_LEICHENGASE, "Dragomir meinte, es reiche den Beutel mit der Kräutermischung mit Moleratfett einzureiben.");
};

FUNC VOID Info_Mod_Dragomir_Leichengase_B()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_Leichengase_B_15_00"); //Hier hast du 50 Goldstücke.

	B_GiveInvItems	(hero, self, ItMi_Gold, 50);

	AI_Output(self, hero, "Info_Mod_Dragomir_Leichengase_B_12_01"); //Naja, eine leichte Amnesie wird ich mir damit wohl leisten können. Man sieht sich.
	AI_Output(self, hero, "Info_Mod_Dragomir_Leichengase_B_12_02"); //Ach warte. Ich hab hier noch etwas altes Moleratfett, was bei mir eh nur vor sich hinfault.

	B_GiveInvItems	(self, hero, ItMi_MoleratLubric_MIS, 1);

	AI_Output(self, hero, "Info_Mod_Dragomir_Leichengase_B_12_03"); //Je mehr es stinkt, desto lieber ist's den Viechern.
	AI_Output(self, hero, "Info_Mod_Dragomir_Leichengase_B_12_04"); //Aber pass auf, so ein Stück Molerattschimmel räumt selbst den stärksten Troll aus! (lacht herzhaft)

	Info_ClearChoices	(Info_Mod_Dragomir_Leichengase);
};

FUNC VOID Info_Mod_Dragomir_Leichengase_A()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_Leichengase_A_15_00"); //Ich brauche deine Hilfe.
	AI_Output(self, hero, "Info_Mod_Dragomir_Leichengase_A_12_01"); //Wobei?

	Info_ClearChoices	(Info_Mod_Dragomir_Leichengase);
};

INSTANCE Info_Mod_Dragomir_AlterMann (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_AlterMann_Condition;
	information	= Info_Mod_Dragomir_AlterMann_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wegen altem Mann im Wald fragen.";
};

FUNC INT Info_Mod_Dragomir_AlterMann_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Morgahard_AlterWaldMann))
	&& (Mod_BDT_AlterWaldMann < 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Dragomir_AlterMann_Info()
{
	if (Mod_BDT_AlterWaldMann == 0)
	{
		B_Say	(hero, self, "$ALTERWALDMANN01");

		AI_Output(self, hero, "Info_Mod_Dragomir_AlterMann_12_00"); //Ahh, du meinst den alten Mann des Waldes. Ja, etwas weiß ich über ihn.
		AI_Output(self, hero, "Info_Mod_Dragomir_AlterMann_12_01"); //Er soll Jahrhunderte alt sein und die Tiere des Waldes Rund um Khorata behüten.
		AI_Output(self, hero, "Info_Mod_Dragomir_AlterMann_12_02"); //Zwar sagt man, er sei blind, jedoch gleichzeitig auch magisch begabt.
		AI_Output(self, hero, "Info_Mod_Dragomir_AlterMann_12_03"); //Mehr fällt mir gerade nicht ein. Vielleicht weiß ein anderer mehr.

		B_LogEntry	(TOPIC_MOD_BDT_ALTERMANN, "Von dem ersten Waldläufer erfuhr ich nicht viel Neues. Der alte Mann des Waldes, behütet die Tiere, er ist uralt, blind und magisch begabt. Vielleicht weiß ein anderer Waldläufer mehr.");
	}
	else if (Mod_BDT_AlterWaldMann == 1)
	{
		B_Say	(hero, self, "$ALTERWALDMANN02");

		AI_Output(self, hero, "Info_Mod_Dragomir_AlterMann_12_04"); //Der alte Mann des Waldes? Ja, ich hörte er solle einst ein Diener Adanos gewesen sein.
		AI_Output(self, hero, "Info_Mod_Dragomir_AlterMann_12_05"); //Wobei unklar ist, ob er ein Waldläufer war wie wir, ein Magier des Wassers, oder ein Verwandlungsmagier.
		AI_Output(self, hero, "Info_Mod_Dragomir_AlterMann_12_06"); //Seine magischen Fähigkeiten, wie auch seine starke Bindung zur Tier- und Pflanzenwelt zeugen davon, dass er von allem etwas hat.

		B_LogEntry	(TOPIC_MOD_BDT_ALTERMANN, "Beim 2ten Waldläufer erfuhr ich auch nicht viel wissenswertes. Der alte Mann des Waldes soll Adanos und der Schöpfung verbunden sein, allem voran der Tier und Pflanzenwelt.");
	}
	else if (Mod_BDT_AlterWaldMann == 2)
	{
		B_Say	(hero, self, "$ALTERWALDMANN03");

		AI_Output(self, hero, "Info_Mod_Dragomir_AlterMann_12_07"); //Tja, viel kann ich dir nicht über ihn verraten.
		AI_Output(self, hero, "Info_Mod_Dragomir_AlterMann_12_08"); //Das Problem besteht auch darin, dass er mit keinem Menschen spricht, nicht mal mit uns, auch, wenn wir eigentlich ähnliche Ziele verfolgen.
		AI_Output(self, hero, "Info_Mod_Dragomir_AlterMann_12_09"); //Allein mit den Tieren des Waldes unterhält er sich.
		AI_Output(self, hero, "Info_Mod_Dragomir_AlterMann_12_10"); //Tja, wenn ich ein Keiler wäre, könnte ich dir bestimmt mehr über ihn verraten.

		B_LogEntry	(TOPIC_MOD_BDT_ALTERMANN, "Acha, das könnte ein wichtiger Hinweis gewesen sein. Der alte Mann des Waldes meidet Menschen gänzlich, spricht nur mit Tieren.");
	}
	else if (Mod_BDT_AlterWaldMann == 3)
	{
		B_Say	(hero, self, "$ALTERWALDMANN04");

		AI_Output(self, hero, "Info_Mod_Dragomir_AlterMann_12_11"); //Der alte Mann des Waldes? Nun, er soll in enger Beziehung zur Tier- und Pflanzenwelt stehen.
		AI_Output(self, hero, "Info_Mod_Dragomir_AlterMann_12_12"); //Man sagt, er leite Rudeltiere wie Keiler, oder Wölfe dazu an, den Wald gegen Eindringlinge zu beschützen.
		AI_Output(self, hero, "Info_Mod_Dragomir_AlterMann_12_13"); //Selbst, so sagt man, fände man ihn häufig in Gestalt eines grünen Wolfes vor.

		B_LogEntry	(TOPIC_MOD_BDT_ALTERMANN, "Er soll vor allem auch größere Rudeltiere wie Keiler und Wölfe dazu anleiten den Wald gegen Eindringlinge zu beschützen.");
	}
	else if (Mod_BDT_AlterWaldMann == 4)
	{
		B_Say	(hero, self, "$ALTERWALDMANN05");

		AI_Output(self, hero, "Info_Mod_Dragomir_AlterMann_12_14"); //Du interessierst dich für Geschichten über den alten Mann des Waldes?
		AI_Output(self, hero, "Info_Mod_Dragomir_AlterMann_12_15"); //Nun, viel weiß ich nicht über diesen mystischen Kauz.
		AI_Output(self, hero, "Info_Mod_Dragomir_AlterMann_12_16"); //Er soll sich meistens im dunklen Wald aufhalten, aber auch immer in der Nähe von Gewässern, wie Seen.
		AI_Output(self, hero, "Info_Mod_Dragomir_AlterMann_12_17"); //Selten hat ihn jemand zu Gesicht bekommen ...

		B_LogEntry	(TOPIC_MOD_BDT_ALTERMANN, "Man findet ihn höchst wahrscheinlich im dichten Wald Khorata’s in der Nähe eines Sees.");
	};

	Mod_BDT_AlterWaldMann += 1;
};

INSTANCE Info_Mod_Dragomir_Pickpocket (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_Pickpocket_Condition;
	information	= Info_Mod_Dragomir_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Dragomir_Pickpocket_Condition()
{
	C_Beklauen	(58, ItMi_Gold, 140);
};

FUNC VOID Info_Mod_Dragomir_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Dragomir_Pickpocket);

	Info_AddChoice	(Info_Mod_Dragomir_Pickpocket, DIALOG_BACK, Info_Mod_Dragomir_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Dragomir_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Dragomir_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Dragomir_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Dragomir_Pickpocket);
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

INSTANCE Info_Mod_Dragomir_EXIT (C_INFO)
{
	npc		= Mod_759_NONE_Dragomir_NW;
	nr		= 1;
	condition	= Info_Mod_Dragomir_EXIT_Condition;
	information	= Info_Mod_Dragomir_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= "Bis dann.";
};

FUNC INT Info_Mod_Dragomir_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Dragomir_EXIT_Info()
{
	AI_Output(hero, self, "Info_Mod_Dragomir_EXIT_15_00"); //Bis dann.

	AI_StopProcessInfos	(hero);
};