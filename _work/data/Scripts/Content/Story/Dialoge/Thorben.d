INSTANCE Info_Mod_Thorben_Hi (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Hi_Condition;
	information	= Info_Mod_Thorben_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Thorben_Hi_Condition()
{
	if (Wld_IsTime(24,00,19,00))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Thorben_Hi_06_01"); //Thorben. Ich stelle alle möglichen Haushaltsgegenstände her.
};

INSTANCE Info_Mod_Thorben_HiKneipe (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_HiKneipe_Condition;
	information	= Info_Mod_Thorben_HiKneipe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Thorben_HiKneipe_Condition()
{
	if (Wld_IsTime(19,00,24,00))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Thorben_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_HiKneipe_Info()
{
	B_Say (hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Thorben_HiKneipe_06_01"); //(betrunken) Ich bin Tischler, der Meisterthorben. Aber ich arbeite gerade nich.
};

INSTANCE Info_Mod_Thorben_Handel (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Handel_Condition;
	information	= Info_Mod_Thorben_Handel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Verkaufst du auch was?";
};

FUNC INT Info_Mod_Thorben_Handel_Condition()
{
	if (Wld_IsTime(24,00,19,00))
	&& (Npc_KnowsInfo(hero, Info_Mod_Thorben_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Handel_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Handel_15_00"); //Verkaufst du auch was?
	AI_Output(self, hero, "Info_Mod_Thorben_Handel_06_01"); //Ein bisschen Kleinkram.
};

INSTANCE Info_Mod_Thorben_HandelKneipe (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_HandelKneipe_Condition;
	information	= Info_Mod_Thorben_HandelKneipe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Verkaufst du Handwerksgegenstände?";
};

FUNC INT Info_Mod_Thorben_HandelKneipe_Condition()
{
	if (Wld_IsTime(19,00,24,00))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Thorben_Handel))
	&& (Npc_KnowsInfo(hero, Info_Mod_Thorben_HiKneipe))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_HandelKneipe_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_HandelKneipe_15_00"); //Verkaufst du Handwerksgegenstände?
	AI_Output(self, hero, "Info_Mod_Thorben_HandelKneipe_06_01"); //Weiß nich. Komm morgen bei mir vorbei, ja? Ich arbeite nämlich gerade nich.
};

INSTANCE Info_Mod_Thorben_Job (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Job_Condition;
	information	= Info_Mod_Thorben_Job_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kann ich bei dir als Lehrling anfangen?";
};

FUNC INT Info_Mod_Thorben_Job_Condition()
{
	if (Wld_IsTime(24,00,19,00))
	&& (Npc_KnowsInfo(hero, Info_Mod_Thorben_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Job_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Job_15_00"); //Kann ich bei dir als Lehrling anfangen?
	AI_Output(self, hero, "Info_Mod_Thorben_Job_06_01"); //Du bist ja nicht mal Bürger der Stadt. Und ich verlange von meinen Lehrlingen Eigeninti ... Eigentia ... Eigeninitiave.
};

INSTANCE Info_Mod_Thorben_JobKneipe (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_JobKneipe_Condition;
	information	= Info_Mod_Thorben_JobKneipe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kann ich bei dir als Lehrling anfangen?";
};

FUNC INT Info_Mod_Thorben_JobKneipe_Condition()
{
	if (Wld_IsTime(19,00,24,00))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Thorben_Job))
	&& (Npc_KnowsInfo(hero, Info_Mod_Thorben_HiKneipe))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_JobKneipe_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Job_15_00"); //Kann ich bei dir als Lehrling anfangen?
	AI_Output(self, hero, "Info_Mod_Thorben_JobKneipe_06_01"); //(ungeduldig) Arbeite ich gerade oder nich? Ich versuch mich hier zu entspannen.
};

INSTANCE Info_Mod_Thorben_Irdorath (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Irdorath_Condition;
	information	= Info_Mod_Thorben_Irdorath_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich muss eine Seereise unternehmen und brauche jemanden, der über handwerkliches Geschick verfügt ...";
};

FUNC INT Info_Mod_Thorben_Irdorath_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jack_Irdorath2))
	&& (Mod_JackHW == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Irdorath_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Irdorath_15_00"); //Ich muss eine Seereise unternehmen und brauche jemanden, der über handwerkliches Geschick verfügt ...
	AI_Output(self, hero, "Info_Mod_Thorben_Irdorath_06_01"); //Bei Innos, was soll ich auf einem Schiff auf dem Meer.
	AI_Output(hero, self, "Info_Mod_Thorben_Irdorath_15_02"); //Aber ...
	AI_Output(self, hero, "Info_Mod_Thorben_Irdorath_06_03"); //Nein, also wirklich ... das ist nichts für mich ... und hier warten noch mehr als genug Schränke auf mich, und die haben absoluten Vorrang vor allen anderen Dingen.
	AI_Output(hero, self, "Info_Mod_Thorben_Irdorath_15_04"); //(halblaut) Auch vor dem Niedergang der Insel ...
	AI_Output(self, hero, "Info_Mod_Thorben_Irdorath_06_05"); //Was sagst du?
	AI_Output(hero, self, "Info_Mod_Thorben_Irdorath_15_06"); //Ach, nichts wichtiges.

	B_LogEntry	(TOPIC_MOD_HQ_JACK, "Nein, es scheint mir nicht, als ließe Thorben sich zu einem Trip über das Meer überreden.");
};

INSTANCE Info_Mod_Thorben_Lehrling (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Lehrling_Condition;
	information	= Info_Mod_Thorben_Lehrling_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich möchte Bürger der Stadt werden. Gibst du mir deine Zustimmung?";
};

FUNC INT Info_Mod_Thorben_Lehrling_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Matteo_OberesViertel))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Lehrling_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Lehrling_15_00"); //Ich möchte Bürger der Stadt werden. Gibst du mir deine Zustimmung?
	AI_Output(self, hero, "Info_Mod_Thorben_Lehrling_06_01"); //Du kommst doch auch aus der Kolonie? Da musst du mir schon einen Gefallen tun, damit wir ins Geschäft kommen.
	AI_Output(hero, self, "Info_Mod_Thorben_Lehrling_15_02"); //Was wäre das für ein Gefallen?
	AI_Output(self, hero, "Info_Mod_Thorben_Lehrling_06_03"); //Ne blöde Sache: Ich habe meine wertvolle Innos-Statue verlegt.
	AI_Output(self, hero, "Info_Mod_Thorben_Lehrling_06_04"); //Allerdings habe ich eine Ahnung, wo sie sein könnte.
	AI_Output(hero, self, "Info_Mod_Thorben_Lehrling_15_05"); //Dann erzähl mal.
	AI_Output(self, hero, "Info_Mod_Thorben_Lehrling_06_06"); //Ist schon ein paar Tage her, da hatte ich gerade eine Truhe für Lehmar fertig gestellt.
	AI_Output(self, hero, "Info_Mod_Thorben_Lehrling_06_07"); //Ich hab sie offen stehen gelassen, damit das Holz und der Leim atmen können.
	AI_Output(self, hero, "Info_Mod_Thorben_Lehrling_06_08"); //In der Nacht hat die Erde gebebt, nicht spektakulär, aber das tut sie in letzter Zeit ja manchmal.
	AI_Output(self, hero, "Info_Mod_Thorben_Lehrling_06_09"); //Und da muss die Statue aus dem Regal in die Truhe gefallen sein.
	AI_Output(self, hero, "Info_Mod_Thorben_Lehrling_06_10"); //Am nächsten Morgen habe ich sie nur noch zugeklappt und abgeliefert.
	AI_Output(self, hero, "Info_Mod_Thorben_Lehrling_06_11"); //Dass die Statue fehlt, ist dann meiner Frau irgendwann beim Putzen aufgefallen.
	AI_Output(self, hero, "Info_Mod_Thorben_Lehrling_06_12"); //Der Dreckskerl von Lehmar hat sie wahrscheinlich gefunden und behalten.
	AI_Output(hero, self, "Info_Mod_Thorben_Lehrling_15_13"); //Wieso fragst du ihn nicht einfach?
	AI_Output(self, hero, "Info_Mod_Thorben_Lehrling_06_14"); //Dieses Arschloch behauptet, von nichts zu wissen.
	AI_Output(self, hero, "Info_Mod_Thorben_Lehrling_06_15"); //Wenn du herausfindest, ob er die Statue hat, und sie mir zurückbringst, geb ich dir einen aus.
	AI_Output(hero, self, "Info_Mod_Thorben_Lehrling_15_16"); //Mal sehen, was sich da machen lässt.

	Log_CreateTopic	(TOPIC_MOD_THORBENSSTATUE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_THORBENSSTATUE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_THORBENSSTATUE, "Thorben hat eine Truhe an Lehmar verkauft, in der sich wahrscheinlich noch seine Innos-Statue befand. Ich soll sie ihm wieder beschaffen.");
};

INSTANCE Info_Mod_Thorben_Stimme (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Stimme_Condition;
	information	= Info_Mod_Thorben_Stimme_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe deine Statue.";
};

FUNC INT Info_Mod_Thorben_Stimme_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_Lehrling))
	&& (Npc_HasItems(hero, ItMi_LostInnosStatue_Daron) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Stimme_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Stimme_15_00"); //Ich habe deine Statue.

	B_GiveInvItems	(hero, self, ItMi_LostInnosStatue_Daron, 1);

	AI_Output(self, hero, "Info_Mod_Thorben_Stimme_06_01"); //Ja, verdammt, das ist sie! Wie hast du sie dem Pfennigfuchser abgeluchst?
	AI_Output(hero, self, "Info_Mod_Thorben_Stimme_15_02"); //Mit genügend Geld.
	AI_Output(self, hero, "Info_Mod_Thorben_Stimme_06_03"); //Klar, bei Lehmar geht alles übers Geld. Kann's dir aber leider nicht wiedergeben.
	AI_Output(self, hero, "Info_Mod_Thorben_Stimme_06_04"); //Aber ich hab ja gesagt, dass wir zusammen einen heben. Da!

	CreateInvItems	(self, ItFo_Beer, 1);
	CreateInvItems	(hero, ItFo_Beer, 1);

	B_UseItem	(self, ItFo_Beer);
	B_UseItem	(hero, ItFo_Beer);

	AI_Output(self, hero, "Info_Mod_Thorben_Stimme_06_05"); //Und meine Zustimmung ist dir auch sicher.

	B_GivePlayerXP	(200);

	Npc_RemoveInvItems	(self, ItMi_LostInnosStatue_Daron, 1);

	B_SetTopicStatus	(TOPIC_MOD_THORBENSSTATUE, LOG_SUCCESS);
	
	Mod_LehrlingsStimmen += 1;

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Thorben_Aufnahme (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Aufnahme_Condition;
	information	= Info_Mod_Thorben_Aufnahme_Info;
	permanent	= 1;
	important	= 0;
	description	= "Nimmst du mich als Lehrling auf?";
};

FUNC INT Info_Mod_Thorben_Aufnahme_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_Stimme))
	&& (Mod_IstLehrling == 0)
	&& (Mod_LehrlingsStimmen == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Aufnahme_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Aufnahme_15_00"); //Nimmst du mich als Lehrling auf?
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_06_01"); //Hmm, kann ja eigentlich nicht schaden. Allerdings kann ich hier keinen Gammler gebrauchen.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_06_02"); //Wenn du keine Arbeit hast, wirst du dir welche suchen.

	Info_ClearChoices	(Info_Mod_Thorben_Aufnahme);

	Info_AddChoice	(Info_Mod_Thorben_Aufnahme, "Lieber nicht.", Info_Mod_Thorben_Aufnahme_B);
	Info_AddChoice	(Info_Mod_Thorben_Aufnahme, "So soll es sein.", Info_Mod_Thorben_Aufnahme_A);
};

FUNC VOID Info_Mod_Thorben_Aufnahme_B()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Aufnahme_B_15_00"); //Lieber nicht.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_B_06_01"); //Nicht mein Pech.

	Info_ClearChoices	(Info_Mod_Thorben_Aufnahme);
};

FUNC VOID Info_Mod_Thorben_Aufnahme_A()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Aufnahme_A_15_00"); //So soll es sein.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_06_01"); //Na, das klingt doch schon mal gut.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_06_02"); //Damit wirst du auch ein Bürger von Khorinis und so. Solltest also auch wie einer rumlaufen.

	CreateInvItems	(hero, ItAr_Vlk_H, 1);
	B_ShowGivenThings	("Bürgerkleidung erhalten");

	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_06_03"); //Jetzt werd ich dir erst mal unsere einfachsten Arbeitsabläufe erklären. Aber erst brauch ich 'nen kleinen Schluck.

	CreateInvItems	(self, ItFo_Beer, 1);

	B_UseItem	(self, ItFo_Beer);

	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_06_04"); //Bevor du drauf los zimmerst, brauchst du einen genauen Plan von dem, was du herstellen willst.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_06_05"); //Kannst du gut zeichnen?
	AI_Output(hero, self, "Info_Mod_Thorben_Aufnahme_A_15_06"); //Keine Ahnung.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_06_07"); //Notfalls wirst du es schon lernen. In der Zeichnung markierst du jedes einzelne Stück, das du später brauchst.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_06_08"); //Da wir meistens Auftragsarbeit leisten, gibt es teilweise schon Zeichnungen oder sehr konkrete Vorstellungen vom Endprodukt.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_06_09"); //Die solltest du nicht enttäuschen. Kommt nicht gut.

	CreateInvItems	(self, ItFo_Beer, 1);

	B_UseItem	(self, ItFo_Beer);

	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_06_10"); //Wenn du damit fertig bist, geht's an die Muskelarbeit.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_06_11"); //Mit der Säge an meinem Arbeitsplatz schneidest du dir die Holzstücke zurecht, wie du sie eben brauchst.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_06_12"); //Verbinden kannst du die Einzelteile durch Leimung oder durch Nägel. Dazu brauchst du auf jedenfall einen Hammer.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_06_13"); //Was sich in welcher Situation besser eignet, wirst du schon herausfinden.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_06_14"); //(leicht betrunken) Das war's eigentlich auch schon. Halt, warte!
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_06_15"); //Wenn du irgendwelche Verzierungen aus Metall oder so brauchst, komm zu mir, dann regeln wir das schon.
	AI_Output(hero, self, "Info_Mod_Thorben_Aufnahme_A_15_16"); //Hast du schon eine Aufgabe für mich?
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_06_17"); //(betrunken) Aufff...? (überlegt) Ja, schon.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_06_18"); //Coragon hat einen Stuhl bei mir bestellt und die Maße gleich mitgeliefert, damit er in seine Bude passt.
	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_06_19"); //Brauchst also nur noch zu zimmern.

	CreateInvItems	(hero, ItMi_Brett, 5);
	CreateInvItems	(hero, ItWr_Zeichnung_Stuhl, 1);

	AI_Output(self, hero, "Info_Mod_Thorben_Aufnahme_A_06_20"); //Und immer schön - hicks - dran denken: Erst an die Säge, dann die Nägel. Hicks.

	Mod_IstLehrling	= 1;

	Mod_LehrlingBei = 2;

	Wld_AssignRoomToGuild ("gritta",	GIL_NONE);

	Log_CreateTopic	(TOPIC_MOD_LEHRLING_THORBEN_ONE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_THORBEN_ONE, LOG_RUNNING);

	if (Npc_KnowsInfo(hero, Info_Mod_Torlof_Auftrag))
	{
		B_LogEntry_NMore	(TOPIC_MOD_BÜRGER, TOPIC_MOD_LEHRLING_THORBEN_ONE, TOPIC_MOD_TORLOFSPIONAGE, "Thorben, der Tischler, hat mich als seinen Lehrling aufgenommen. Dadurch bin ich jetzt ein Bürger der Stadt.", "Ich soll für Coragon einen Stuhl anfertigen. Die Vorgaben habe ich schon, jetzt muss ich sie nur noch umsetzen.", "Da Thorben mich als seinen Lehrling aufgenommen hat ist es mir jetzt möglich das Obere Viertel zu betreten.");
	}
	else
	{
		B_LogEntry_More	(TOPIC_MOD_BÜRGER, TOPIC_MOD_LEHRLING_THORBEN_ONE, "Thorben, der Tischler, hat mich als seinen Lehrling aufgenommen. Dadurch bin ich jetzt ein Bürger der Stadt.", "Ich soll für Coragon einen Stuhl anfertigen. Die Vorgaben habe ich schon, jetzt muss ich sie nur noch umsetzen.");
	};

	B_SetTopicStatus	(TOPIC_MOD_BÜRGER, LOG_SUCCESS);

	CurrentNQ += 1;

	Info_ClearChoices	(Info_Mod_Thorben_Aufnahme);
};

INSTANCE Info_Mod_Thorben_GildenZeug (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_GildenZeug_Condition;
	information	= Info_Mod_Thorben_GildenZeug_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Thorben_GildenZeug_Condition()
{
	if (Mod_LehrlingBei == 2)
	&& (hero.guild > GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_GildenZeug_Info()
{
	if (hero.guild == GIL_PAL)
	{
		AI_Output(self, hero, "Info_Mod_Thorben_GildenZeug_06_00"); //Packst jetzt auch bei den Milizen ordentlich an? Bring mal Ordnung in den Saustall.
	}
	else if (hero.guild == GIL_VLK)
	|| (hero.guild == GIL_NOV)
	{
		AI_Output(self, hero, "Info_Mod_Thorben_GildenZeug_06_01"); //Ich glaub ja nicht, dass die Luschenmagier das Richtige für dich sind.
	}
	else if (hero.guild == GIL_MIL)
	{
		AI_Output(self, hero, "Info_Mod_Thorben_GildenZeug_06_02"); //Hast eine gute Wahl getroffen mit den Söldnern. Alle anderen sind doch Weicheier, was?
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output(self, hero, "Info_Mod_Thorben_GildenZeug_06_03"); //Hör bloß auf mit dieser Beliar-Kacke, ja?
	};
};

INSTANCE Info_Mod_Thorben_LehrlingQuest (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_LehrlingQuest_Condition;
	information	= Info_Mod_Thorben_LehrlingQuest_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe hier den Stuhl für Coragon.";
};

FUNC INT Info_Mod_Thorben_LehrlingQuest_Condition()
{
	if (Mod_LehrlingBei == 2)
	&& (Npc_HasItems(hero, ItMi_CoragonStuhl) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_LehrlingQuest_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest_15_00"); //Ich habe hier den Stuhl für Coragon.

	B_GiveInvItems	(hero, self, ItMi_CoragonStuhl, 1);

	Npc_RemoveInvItems	(self, ItMi_CoragonStuhl, 1);

	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest_06_01"); //Lass sehen. Hicks. (untersuchend) Ja, ganz ordentlich. Denke, da wird Coragon zufrieden sein. Hicks.
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest_06_02"); //Ich meld mich, wenn ich wieder was zu tun für dich habe. So lange bist du frei. In Ordnung?
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest_15_03"); //Geht klar. Man sieht sich. Und trink nicht zu viel.
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest_06_04"); //Das lass mal meine Sorge sein.

	B_GivePlayerXP	(100);

	CurrentNQ += 1;

	B_RaiseAttribute	(hero, ATR_STRENGTH, 3);
	B_RaiseAttribute	(hero, ATR_DEXTERITY, 3);

	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_THORBEN_ONE, LOG_SUCCESS);
};

INSTANCE Info_Mod_Thorben_LehrlingQuest2 (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_LehrlingQuest2_Condition;
	information	= Info_Mod_Thorben_LehrlingQuest2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du was zu tun für mich?";
};

FUNC INT Info_Mod_Thorben_LehrlingQuest2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_LehrlingQuest))
	&& (Kapitel >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_LehrlingQuest2_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest2_15_00"); //Hast du was zu tun für mich?
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest2_06_01"); //(mit rauer Stimme) Ich hab so viel zu tun, dass ich gar nicht weiß, wo ich anfangen soll. Verdammte Scheiße. (hustet)
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest2_15_02"); //Bist du krank?
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest2_06_03"); //Nein, das geht schon. Aber ich komme kaum zum Arbeiten mit diesem Husten.
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest2_15_04"); //Was steht denn an?
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest2_06_05"); //Am dringendsten sind die zwei Festtische für Matteos Hochzeit. (hustet)
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest2_06_06"); //Die sind zwar einfach zu zimmern, aber es gibt noch keine Zeichnung.
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest2_15_07"); //Gibt es jemanden, den wir mit der Zeichnung beauftragen können?
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest2_06_08"); //(überlegt) Brahim schuldet mir noch einen Gefallen. Hab ihm damals mit seiner Hütte ausgeholfen.
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest2_06_09"); //Du solltest ihn mal fragen. Komm dann zurück.

	Log_CreateTopic	(TOPIC_MOD_LEHRLING_THORBEN_TWO, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_THORBEN_TWO, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_LEHRLING_THORBEN_TWO, "Thorben hat zwei Festtische bei mir in Auftrag gegeben. Für diese muss allerdings erst eine Zeichnung angefertigt werden. Ich soll Brahim, den Kartenverkäufer, um Hilfe bitten.");
};

INSTANCE Info_Mod_Thorben_LehrlingQuest3 (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_LehrlingQuest3_Condition;
	information	= Info_Mod_Thorben_LehrlingQuest3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Brahim hat gezeichnet.";
};

FUNC INT Info_Mod_Thorben_LehrlingQuest3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Brahim_ThorbenLehrling2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_LehrlingQuest3_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest3_15_00"); //Brahim hat gezeichnet.
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest3_06_01"); //Gut. Mach dich an die Arbeit, die Zeit läuft uns davon.

	B_GiveInvItems	(self, hero, ItMi_Brett, 12);
};

INSTANCE Info_Mod_Thorben_LehrlingQuest4 (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_LehrlingQuest4_Condition;
	information	= Info_Mod_Thorben_LehrlingQuest4_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Tische sind bereit zur Auslieferung.";
};

FUNC INT Info_Mod_Thorben_LehrlingQuest4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_LehrlingQuest3))
	&& (Npc_HasItems(hero, ItMi_MatteoFesttisch) == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_LehrlingQuest4_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest4_15_00"); //Die Tische sind bereit zur Auslieferung.

	B_GiveInvItems	(hero, self, ItMi_MatteoFesttisch, 2);

	Npc_RemoveInvItems	(self, ItMi_MatteoFesttisch, 2);

	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest4_06_01"); //Bist ein guter Mann. Auf dich kann man sich noch verlassen.
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest4_15_02"); //Gibt es weitere dringende Aufträge?
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest4_06_03"); //(hustet) Bald bestimmt wieder. Schau also mal wieder bei mir vorbei, klar?
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest4_15_04"); //Alles klar. Bis dann.

	B_GivePlayerXP	(200);

	CurrentNQ += 1;

	B_RaiseAttribute	(hero, ATR_STRENGTH, 3);
	B_RaiseAttribute	(hero, ATR_DEXTERITY, 3);

	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_THORBEN_TWO, LOG_SUCCESS);
};

INSTANCE Info_Mod_Thorben_LehrlingQuest5 (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_LehrlingQuest5_Condition;
	information	= Info_Mod_Thorben_LehrlingQuest5_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was gibt es Neues?";
};

FUNC INT Info_Mod_Thorben_LehrlingQuest5_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_LehrlingQuest4))
	&& (Kapitel >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_LehrlingQuest5_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest5_15_00"); //Was gibt es Neues?
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest5_06_01"); //(schwer atmend) Es läuft schleppend. Die Leute wollen mir keine Aufträge mehr anvertrauen. (hustet) Ich fühle mich schon fast tot.
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest5_15_02"); //Jetzt übertreib mal nicht!
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest5_06_03"); //Ich hätte eine kleine Bitte an dich: Könntest du mich morgen früh von 9 bis 12 Uhr ersetzen?
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest5_06_04"); //Stell dich einfach neben die Säge oder so und nimm Aufträge entgegen.
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest5_15_05"); //Hast du keine Zeit?
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest5_06_06"); //Ich muss endlich mal aussschlafen, damit ich wieder (hustet) einigermaßen zu Kräften komme.
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest5_06_07"); //Springst du also morgen für mich ein?
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest5_15_08"); //Kein Problem. Ruh dich aus.
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest5_06_09"); //Es könnte sein, dass Matteo seine Festtische abholen will.

	B_GiveInvItems	(self, hero, ItMi_MatteoFesttisch, 2);

	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest5_06_10"); //Verkauf sie ihm für 150 Gold.
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest5_06_11"); //Ich komme dann und löse dich ab.

	Log_CreateTopic	(TOPIC_MOD_LEHRLING_THORBEN_THREE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_THORBEN_THREE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_LEHRLING_THORBEN_THREE, "Thorben will mal einen Tag ausschlafen und hat mich gebeten, am nächsten Tag von 9 bis 12 auf den Arbeitsplatz aufzupassen und Aufträge entgegen zu nehmen.");

	B_StartOtherRoutine	(self, "TAGPAUSE");
	B_StartOtherRoutine	(Mod_583_NONE_Hanna_NW, "TAGPAUSE");
	B_StartOtherRoutine	(Mod_529_NONE_Matteo_NW, "TAGPAUSE");

	Mod_Thorben_Vertretung_Tag = Wld_GetDay();
};

INSTANCE Info_Mod_Thorben_LehrlingQuest6 (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_LehrlingQuest6_Condition;
	information	= Info_Mod_Thorben_LehrlingQuest6_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Thorben_LehrlingQuest6_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_LehrlingQuest5))
	&& (Mod_Thorben_Vertretung == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_LehrlingQuest6_Info()
{
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest6_06_00"); //Wie ist es gelaufen? War jemand da?

	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_ThorbenLehrling))
	|| (Npc_KnowsInfo(hero, Info_Mod_Hanna_ThorbenLehrling))
	{
		if (Npc_KnowsInfo(hero, Info_Mod_Matteo_ThorbenLehrling))
		{
			AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest6_15_01"); //Matteo hat seine Tische abgeholt und bezahlt.
			AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest6_06_02"); //Gut, behalt das Geld. Es war deine Arbeit, und es soll dein Lohn sein.
		};
		if (Npc_KnowsInfo(hero, Info_Mod_Hanna_ThorbenLehrling))
		{
			AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest6_15_03"); //Hanna war hier und hat eine Reparatur ihrer Kommode in Auftrag gegeben.
			AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest6_06_04"); //Wenigstens ein neuer Auftrag. (hustet) Darum kann ich mich noch allein kümmern.
			AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest6_06_05"); //Ich danke dir für deine Hilfe, ohne dich müsste ich den Laden schließen.
		};
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest6_15_06"); //Heute war nichts los.
		AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest6_06_07"); //Verdammter Mist! Wovon soll ich denn solange leben? Ich kann dir nicht mal eine Bezahlung anbieten.
	};

	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest6_15_08"); //Ich sehe bald mal wieder nach dem Rechten.
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest6_06_09"); //Tu das.

	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_THORBEN_THREE, LOG_SUCCESS);

	CurrentNQ += 1;

	B_RaiseAttribute	(hero, ATR_STRENGTH, 3);
	B_RaiseAttribute	(hero, ATR_DEXTERITY, 3);
};

INSTANCE Info_Mod_Thorben_LehrlingQuest7 (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_LehrlingQuest7_Condition;
	information	= Info_Mod_Thorben_LehrlingQuest7_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe hier was für dich.";
};

FUNC INT Info_Mod_Thorben_LehrlingQuest7_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gritta_ThorbenLehrling2))
	&& ((Npc_HasItems(hero, ItMi_Schmuckkasten) == 1)
	&& (Npc_HasItems(hero, ItMi_Bierkrug) == 1)
	&& (Npc_HasItems(hero, ItMi_Karte) == 1))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_LehrlingQuest7_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest7_15_00"); //Ich habe hier was für dich.

	if (Npc_HasItems(hero, ItMi_Schmuckkasten) == 1)
	{
		B_GiveInvItems	(hero, self, ItMi_Schmuckkasten, 1);

		AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest7_06_01"); //(rau) Na, wenn das mal nicht von einem Vollprofi kommt. Junge, du bist besser, als ich in meinen besten Zeiten war. (hustet)
		AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest7_06_02"); //Ich werd meiner Nichte sagen, dass sie es auf ein Regal stellen soll. Ich danke dir, so viel hätte ich nicht erwartet.

		B_GivePlayerXP	(1000);
	}
	else if (Npc_HasItems(hero, ItMi_Bierkrug) == 1)
	{
		B_GiveInvItems	(hero, self, ItMi_Bierkrug, 1);

		AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest7_06_03"); //Oh, danke. Der wird mich immer an die Vergangenheit erinnern, fürchte ich.
		AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest7_06_04"); //Ich werd meiner Frau sagen, dass sie ihn auf ein Regal stellen soll.

		B_GivePlayerXP	(800);
	}
	else if (Npc_HasItems(hero, ItMi_Karte) == 1)
	{
		B_GiveInvItems	(hero, self, ItMi_Karte, 1);

		AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest7_06_05"); //Oh, danke. Die Idee kommt sicher von Brahim, oder?
		AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest7_06_06"); //Der Junge hat eben keine Fantasie, aber damit sieht's wohl bei dir auch nicht so gut aus.
		AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest7_06_07"); //Na ja, der Wille zählt, und die Umsetzung ist auch einwandfrei.

		B_GivePlayerXP	(600);
	};

	Mod_Thorben_Geschenk_Tag = Wld_GetDay();

	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_THORBEN_FOUR, LOG_SUCCESS);
};

INSTANCE Info_Mod_Thorben_LehrlingQuest8 (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_LehrlingQuest8_Condition;
	information	= Info_Mod_Thorben_LehrlingQuest8_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie geht es dir?";
};

FUNC INT Info_Mod_Thorben_LehrlingQuest8_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gritta_ThorbenLehrling2))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Thorben_LehrlingQuest7))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_LehrlingQuest8_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest8_15_00"); //Wie geht es dir?
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest8_06_01"); //Im Moment geht es mir ziemlich beschissen. Aber das wird sich schon wieder legen. Ich lasse mich so schnell nicht kleinkriegen. (hustet)
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest8_06_02"); //Die Arbeit darf auch nicht lange ruhen, sonst haben wir bald nichts mehr zu essen.
};

INSTANCE Info_Mod_Thorben_LehrlingQuest9 (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_LehrlingQuest9_Condition;
	information	= Info_Mod_Thorben_LehrlingQuest9_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie steht's?";
};

FUNC INT Info_Mod_Thorben_LehrlingQuest9_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_LehrlingQuest7))
	&& (Mod_Thorben_Lehrling_Weg == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_LehrlingQuest9_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_LehrlingQuest9_15_00"); //Wie steht's?
	AI_Output(self, hero, "Info_Mod_Thorben_LehrlingQuest9_06_01"); //Ich hab's gut überstanden, den Schlaganfall. Gibt nur ein paar Sachen, die ich nicht mehr koordinieren kann. Schnürsenkel zubinden beispielsweise. (hustet) Da hilft mir meine Frau.
};

INSTANCE Info_Mod_Thorben_Laute (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Laute_Condition;
	information	= Info_Mod_Thorben_Laute_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich komme wegen einem Auftrag zu dir.";
};

FUNC INT Info_Mod_Thorben_Laute_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Zeki_Aufgabe))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 250)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Laute_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Laute_15_00"); //Ich komme wegen einem Auftrag zu dir.
	AI_Output(self, hero, "Info_Mod_Thorben_Laute_06_01"); //Um was geht es denn?
	AI_Output(hero, self, "Info_Mod_Thorben_Laute_15_02"); //Könntest du mir eine Laute anfertigen?
	AI_Output(self, hero, "Info_Mod_Thorben_Laute_06_03"); //(überlegt) Hmm ... ja das könnte ich.
	AI_Output(self, hero, "Info_Mod_Thorben_Laute_06_04"); //Aber dazu brauche ich spezielle Materialien und außerdem 250 Goldmünzen, um diese Arbeit überhaupt annehmen zu können.
	AI_Output(hero, self, "Info_Mod_Thorben_Laute_15_05"); //Das Geld habe ich schon, hier ist es.

	B_GiveInvItems	(hero, self, ItMi_Gold, 250);

	AI_Output(self, hero, "Info_Mod_Thorben_Laute_06_06"); //Sehr gut. Also um die Laute anfertigen zu können benötige ich zwölf Äste, die du überall in den Wäldern finden kannst.
	AI_Output(self, hero, "Info_Mod_Thorben_Laute_06_07"); //Zudem brauche ich Seide, um das Instrument überhaupt spielen zu können.
	AI_Output(hero, self, "Info_Mod_Thorben_Laute_15_08"); //Woher soll ich denn Seide bekommen?
	AI_Output(self, hero, "Info_Mod_Thorben_Laute_06_09"); //Natürlich bei den Händlern. Seide ist teuer, weshalb ich mir das nicht Leisten kann.
	AI_Output(self, hero, "Info_Mod_Thorben_Laute_06_10"); //Ich brauche drei Striegen voller Seide. Das müsste reichen.
	AI_Output(hero, self, "Info_Mod_Thorben_Laute_15_11"); //Okay, dann werde ich das Zeug mal besorgen.

	B_LogEntry	(TOPIC_MOD_ASS_ZEKI_LAUTE, "Ich bin bei Thorben gewesen, doch diesem fehlen die nötigen Materialien, um eine Laute anfertigen zu können. Ich soll ihm zwölf Äste aus dem Wald bringen und zudem drei Striegen Seide, die es bei den Händlern von Khorinis zu kaufen gibt. Wenn ich den Krempel habe, soll ich mich wieder bei Thorben ankündigen.");
};

INSTANCE Info_Mod_Thorben_LauteMaterialien (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_LauteMaterialien_Condition;
	information	= Info_Mod_Thorben_LauteMaterialien_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe alle benötigten Materialien für die Laute besorgen können.";
};

FUNC INT Info_Mod_Thorben_LauteMaterialien_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_Laute))
	&& (Npc_HasItems(hero, ItMi_Seide) >= 3)
	&& (Npc_HasItems(hero, ItMi_Ast) >= 12)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_LauteMaterialien_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_LauteMaterialien_15_00"); //Ich habe alle benötigten Materialien für die Laute besorgen können.

	Npc_RemoveInvItems	(hero, ItMi_Ast, 12);
	Npc_RemoveInvItems	(hero, ItMi_Seide, 3);

	B_ShowGivenThings	("12 Äste und 3 Seide gegeben");

	AI_Output(self, hero, "Info_Mod_Thorben_LauteMaterialien_06_01"); //(lächelnd) Gut, dann kann ich mich an die Arbeit machen.
	AI_Output(hero, self, "Info_Mod_Thorben_LauteMaterialien_15_02"); //Wann kann ich die Laute denn abholen?
	AI_Output(self, hero, "Info_Mod_Thorben_LauteMaterialien_06_03"); //Komm morgen wieder.

	Mod_ASS_ThorbenLaute = Wld_GetDay();

	B_LogEntry	(TOPIC_MOD_ASS_ZEKI_LAUTE, "Ich habe Thorben alle Materialien gebracht und er war sehr zufrieden. Morgen kann ich die Laute für Zeki endlich abholen und diese seinem neuen Besitzer bringen.");

	B_GivePlayerXP	(300);
};

INSTANCE Info_Mod_Thorben_LauteFertig (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_LauteFertig_Condition;
	information	= Info_Mod_Thorben_LauteFertig_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ist die Laute fertig?";
};

FUNC INT Info_Mod_Thorben_LauteFertig_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_LauteMaterialien))
	&& (Wld_GetDay() > Mod_ASS_ThorbenLaute)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_LauteFertig_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_LauteFertig_15_00"); //Ist die Laute fertig?
	AI_Output(self, hero, "Info_Mod_Thorben_LauteFertig_06_01"); //Ja, es war zwar einige Arbeit, aber hier ist sie.

	B_GiveInvItems	(self, hero, ItMi_Lute_Zeki, 1);

	AI_Output(hero, self, "Info_Mod_Thorben_LauteFertig_15_02"); //Danke sehr.
	AI_Output(self, hero, "Info_Mod_Thorben_LauteFertig_06_03"); //Gib gut auf sie acht, sie ist sehr wertvoll.
	AI_Output(hero, self, "Info_Mod_Thorben_LauteFertig_15_04"); //Ich werde es mir merken. Bis dann.
	AI_Output(self, hero, "Info_Mod_Thorben_LauteFertig_06_05"); //Man sieht sich.

	B_LogEntry	(TOPIC_MOD_ASS_ZEKI_LAUTE, "Thorben hat die Laute für Zeki fertigstellen können und hat sie mir wie versprochen gegeben. Jetzt muss ich sie nur noch Zeki bringen und dann ist mir eine Stimme bei den gaunern sicher.");

	B_GivePlayerXP	(100);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Thorben_BDTSchatzkisten (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_BDTSchatzkisten_Condition;
	information	= Info_Mod_Thorben_BDTSchatzkisten_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir diese zwei Schatzkisten öffnen?";
};

FUNC INT Info_Mod_Thorben_BDTSchatzkisten_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_Hi))
	&& (Npc_HasItems(hero, ItMi_BDTKiste_01) == 1)
	&& (Npc_HasItems(hero, ItMi_BDTKiste_02) == 1)
	&& (Mod_Banditenüberfall_Esteban >= 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_BDTSchatzkisten_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_BDTSchatzkisten_15_00"); //Kannst du mir diese zwei Schatzkisten öffnen?
	AI_Output(self, hero, "Info_Mod_Thorben_BDTSchatzkisten_06_01"); //Natürlich kann ich das. Aber ich kann es leider nicht umsonst machen. Gib mir wenigstens 200 Goldmünzen dafür.
};

INSTANCE Info_Mod_Thorben_BDTSchatzkisten_Open (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_BDTSchatzkisten_Open_Condition;
	information	= Info_Mod_Thorben_BDTSchatzkisten_Open_Info;
	permanent	= 0;
	important	= 0;
	description	= "Öffne mir die Kisten.";
};

FUNC INT Info_Mod_Thorben_BDTSchatzkisten_Open_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_BDTSchatzkisten))
	&& (Npc_HasItems(hero, ItMi_BDTKiste_01) == 1)
	&& (Npc_HasItems(hero, ItMi_BDTKiste_02) == 1)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 200)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_BDTSchatzkisten_Open_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_BDTSchatzkisten_Open_15_00"); //Öffne mir die Kisten.

	B_GiveInvItems	(hero, self, ItMi_Gold, 200);

	AI_Output(self, hero, "Info_Mod_Thorben_BDTSchatzkisten_Open_06_01"); //Gut, moment ...

	AI_PlayAni	(self, "T_PLUNDER");

	AI_Output(self, hero, "Info_Mod_Thorben_BDTSchatzkisten_Open_06_02"); //Da hast du deine Kisten wieder. Du kannst sie jetzt selber öffnen, die Schlösser sind geknackt.
};

INSTANCE Info_Mod_Thorben_Paddel (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Paddel_Condition;
	information	= Info_Mod_Thorben_Paddel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich suche Paddel.";
};

FUNC INT Info_Mod_Thorben_Paddel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Garvell_Paddel))
	&& (Npc_KnowsInfo(hero, Info_Mod_Skip_Francis))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Paddel_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Paddel_15_00"); //Ich suche Paddel.
	AI_Output(self, hero, "Info_Mod_Thorben_Paddel_06_01"); //Paddel sagst du? Hm ... Zedernholz wäre wohl das Richtige. Biegsam und wenig wasserempfindlich.
	AI_Output(self, hero, "Info_Mod_Thorben_Paddel_06_02"); //Aber hier auf der Insel wachsen keine Zedern. Sonst wüsste ich davon. Tut mir leid.
	AI_Output(hero, self, "Info_Mod_Thorben_Paddel_15_03"); //Kann man nichts machen. Wen könnte ich noch Fragen.
	AI_Output(self, hero, "Info_Mod_Thorben_Paddel_06_04"); //Frag doch mal Kardif, der hat manchmal so Sonderposten.

	B_LogEntry	(TOPIC_MOD_SKIP_PADDEL, "Thorben hat zwar keine Paddel, gab mir aber den Tipp mal bei Kardif nachzufragen.");
};

INSTANCE Info_Mod_Thorben_Dietriche (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Dietriche_Condition;
	information	= Info_Mod_Thorben_Dietriche_Info;
	permanent	= 1;
	important	= 0;
	description	= "Hast du noch Dietriche für mich?";
};

FUNC INT Info_Mod_Thorben_Dietriche_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_Hi))
	&& (Npc_HasItems(self, ItKe_Lockpick) == 0)
	&& (Mod_Thorben_Dietriche == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Dietriche_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Dietriche_15_00"); //Hast du noch Dietriche für mich?
	AI_Output(self, hero, "Info_Mod_Thorben_Dietriche_06_01"); //Hmm, nein, du hast mir alle abgekauft. Ich müsste erst wieder welche machen lassen, aber das dauert seine Zeit.

	Info_ClearChoices	(Info_Mod_Thorben_Dietriche);

	Info_AddChoice	(Info_Mod_Thorben_Dietriche, "Dann warte ich so lange.", Info_Mod_Thorben_Dietriche_B);
	Info_AddChoice	(Info_Mod_Thorben_Dietriche, "Kann ich die Zeit irgendwie abkürzen?", Info_Mod_Thorben_Dietriche_A);
};

FUNC VOID Info_Mod_Thorben_Dietriche_B()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Dietriche_B_15_00"); //Dann warte ich so lange.

	Info_ClearChoices	(Info_Mod_Thorben_Dietriche);
};

FUNC VOID Info_Mod_Thorben_Dietriche_A()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Dietriche_A_15_00"); //Kann ich die Zeit irgendwie abkürzen?
	AI_Output(self, hero, "Info_Mod_Thorben_Dietriche_A_06_01"); //Du könntest mir eine Menge Laufarbeit ersparen. Neue Dietriche kann ich nur in Khorata beim Schmied Robert in Auftrag geben.
	AI_Output(hero, self, "Info_Mod_Thorben_Dietriche_A_15_02"); //Aber hier gibt es doch auch Schmiede.
	AI_Output(self, hero, "Info_Mod_Thorben_Dietriche_A_06_03"); //Um Dietriche in größeren Mengen herstellen zu können, muss viel Rohstahl eingeschmolzen werden.
	AI_Output(self, hero, "Info_Mod_Thorben_Dietriche_A_06_04"); //Das kann Harad mit seinem kleinen Feuerchen nicht.
	AI_Output(self, hero, "Info_Mod_Thorben_Dietriche_A_06_05"); //Wenn du dich darum kümmerst, Robert Bescheid zu sagen, kann ich dir bald wieder Dietriche verkaufen.

	Mod_Thorben_Dietriche = 1;

	Info_ClearChoices	(Info_Mod_Thorben_Dietriche);
};

INSTANCE Info_Mod_Thorben_Dietriche2 (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Dietriche2_Condition;
	information	= Info_Mod_Thorben_Dietriche2_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich gehe zu Robert.";
};

FUNC INT Info_Mod_Thorben_Dietriche2_Condition()
{
	if (Mod_Thorben_Dietriche == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Dietriche2_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorben_Dietriche2_15_00"); //Ich gehe zu Robert.
	AI_Output(self, hero, "Info_Mod_Thorben_Dietriche2_06_01"); //In Ordnung. Bring ihm am besten fünf Stangen Rohstahl und einen Lohn von 100 Goldmünzen mit, dann kann er gleich anfangen.

	Mod_Thorben_Dietriche = 2;
};

INSTANCE Info_Mod_Thorben_Dietriche3 (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Dietriche3_Condition;
	information	= Info_Mod_Thorben_Dietriche3_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Thorben_Dietriche3_Condition()
{
	if (Mod_Thorben_Dietriche == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Dietriche3_Info()
{
	AI_Output(self, hero, "Info_Mod_Thorben_Dietriche3_06_00"); //Die Dietriche sind gerade angekommen. Danke für deine Hilfe.

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	Mod_Thorben_Dietriche = 0;

	CreateInvItems	(self, ItKe_Lockpick, 30);

	if (Mod_Thorben_Dietriche2 == FALSE)
	{
		B_GivePlayerXP	(100);

		Mod_Thorben_Dietriche2 = TRUE;
	};
};

INSTANCE Info_Mod_Thorben_Anschlagtafel (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Anschlagtafel_Condition;
	information	= Info_Mod_Thorben_Anschlagtafel_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich habe deinen Aushang an der Anschlagtafel gesehen ...";
};

FUNC INT Info_Mod_Thorben_Anschlagtafel_Condition()
{
	if (Mod_Anschlagtafel_Khorinis_Thorben == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Anschlagtafel_Info()
{
	B_Say	(hero, self, "$ANSCHLAGTAFEL01");

	if (Npc_HasItems(hero, ItMi_Ast) >= Mod_Anschlagtafel_Khorinis_Thorben_Ast)
	&& (Npc_HasItems(hero, ItMw_1h_Vlk_Axe) >= Mod_Anschlagtafel_Khorinis_Thorben_Beil)
	&& (Npc_HasItems(hero, ItMi_Hammer) >= Mod_Anschlagtafel_Khorinis_Thorben_Hammer)
	&& (Npc_HasItems(hero, ItMw_1h_Bau_Mace) >= Mod_Anschlagtafel_Khorinis_Thorben_SchwererAst)
	&& (Npc_HasItems(hero, ItMw_1h_Vlk_Dagger) >= Mod_Anschlagtafel_Khorinis_Thorben_Dolch)
	&& (Npc_HasItems(hero, ItMi_Broom) >= Mod_Anschlagtafel_Khorinis_Thorben_Besen)
	&& (Npc_HasItems(hero, ItMi_Brush) >= Mod_Anschlagtafel_Khorinis_Thorben_Buerste)
	&& (Npc_HasItems(hero, ItMi_Saw) >= Mod_Anschlagtafel_Khorinis_Thorben_Saege)
	{
		Npc_RemoveInvItems	(hero, ItMi_Ast, Mod_Anschlagtafel_Khorinis_Thorben_Ast);
		Npc_RemoveInvItems	(hero, ItMw_1h_Vlk_Axe, Mod_Anschlagtafel_Khorinis_Thorben_Beil);
		Npc_RemoveInvItems	(hero, ItMi_Hammer, Mod_Anschlagtafel_Khorinis_Thorben_Hammer);
		Npc_RemoveInvItems	(hero, ItMw_1h_Bau_Mace, Mod_Anschlagtafel_Khorinis_Thorben_SchwererAst);
		Npc_RemoveInvItems	(hero, ItMw_1h_Vlk_Dagger, Mod_Anschlagtafel_Khorinis_Thorben_Dolch);
		Npc_RemoveInvItems	(hero, ItMi_Broom, Mod_Anschlagtafel_Khorinis_Thorben_Besen);
		Npc_RemoveInvItems	(hero, ItMi_Brush, Mod_Anschlagtafel_Khorinis_Thorben_Buerste);
		Npc_RemoveInvItems	(hero, ItMi_Saw, Mod_Anschlagtafel_Khorinis_Thorben_Saege);

		AI_Output(self, hero, "Info_Mod_Thorben_Anschlagtafel_06_00"); //Was? Zeig her ... Tatsächlich, alles dabei. Ausgesprochen gut gemacht.
		AI_Output(self, hero, "Info_Mod_Thorben_Anschlagtafel_06_01"); //Hier ist deine Entlohnung.

		B_GiveInvItems	(self, hero, ItMi_Gold, Mod_Anschlagtafel_Khorinis_Thorben_Gold);

		AI_Output(self, hero, "Info_Mod_Thorben_Anschlagtafel_06_02"); //Hat mich gefreut mit dir Geschäfte zu machen.

		if (Mod_Anschlagtafel_Khorinis_Thorben_Gold < 200)
		{
			B_GivePlayerXP	(300);
		}
		else if (Mod_Anschlagtafel_Khorinis_Thorben_Gold < 400)
		{
			B_GivePlayerXP	(400);
		}
		else if (Mod_Anschlagtafel_Khorinis_Thorben_Gold < 600)
		{
			B_GivePlayerXP	(500);
		}
		else
		{
			B_GivePlayerXP	(600);
		};

		Mod_Anschlagtafel_Khorinis_Thorben = 0;
		Mod_Anschlagtafel_Khorinis_Thorben_Cooldown = 3600;

		Npc_RemoveInvItems	(hero, ItWr_Anschlagtafel_Thorben, 1);
	}
	else
	{
		B_Say	(hero, self, "$ANSCHLAGTAFEL02");
	};
};

INSTANCE Info_Mod_Thorben_Trade (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Trade_Condition;
	information	= Info_Mod_Thorben_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Thorben_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorben_Trade_Info()
{
	if (Mod_ThorbenTrader == FALSE)
	{
		Log_CreateTopic	(TOPIC_MOD_HÄNDLER_STADT, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_HÄNDLER_STADT, "Thorben verkauft Dietriche.");

		Mod_ThorbenTrader = 1;
	};

	Backup_Questitems();

	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Thorben_Pickpocket (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_Pickpocket_Condition;
	information	= Info_Mod_Thorben_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Thorben_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 120);
};

FUNC VOID Info_Mod_Thorben_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Thorben_Pickpocket);

	Info_AddChoice	(Info_Mod_Thorben_Pickpocket, DIALOG_BACK, Info_Mod_Thorben_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Thorben_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Thorben_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Thorben_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Thorben_Pickpocket);
};

FUNC VOID Info_Mod_Thorben_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Thorben_Pickpocket);
};

INSTANCE Info_Mod_Thorben_EXIT (C_INFO)
{
	npc		= Mod_536_NONE_Thorben_NW;
	nr		= 1;
	condition	= Info_Mod_Thorben_EXIT_Condition;
	information	= Info_Mod_Thorben_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Thorben_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Thorben_EXIT_Info()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorben_LehrlingQuest7))
	&& (Mod_Thorben_Lehrling_Weg == 0)
	{
		AI_Output(self, hero, "Info_Mod_Thorben_EXIT_06_00"); //Ich entlasse dich hiermit als Lehrling. Du hast mir gut gedient und deinen Meister überflügelt. Sei stolz auf dich. Aus dir kann noch was werden.
		AI_Output(hero, self, "Info_Mod_Thorben_EXIT_15_01"); //Gute Besserung. Vielleicht sieht man sich mal wieder.
		AI_Output(self, hero, "Info_Mod_Thorben_EXIT_06_02"); //Meine Rede! Gib auf dich Acht!
	};

	AI_StopProcessInfos	(self);
};