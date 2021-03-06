INSTANCE Info_Mod_Torgan_Hi (C_INFO)
{
	npc		= Mod_1963_JG_Torgan_MT;
	nr		= 1;
	condition	= Info_Mod_Torgan_Hi_Condition;
	information	= Info_Mod_Torgan_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Torgan_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Torgan_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Torgan_Hi_23_00"); //Halt, keinen Schritt weiter. Was willst du hier?
};

INSTANCE Info_Mod_Torgan_Dragomir (C_INFO)
{
	npc		= Mod_1963_JG_Torgan_MT;
	nr		= 1;
	condition	= Info_Mod_Torgan_Dragomir_Condition;
	information	= Info_Mod_Torgan_Dragomir_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich komme von Dragomir.";
};

FUNC INT Info_Mod_Torgan_Dragomir_Condition()
{
	if (Mod_Drago == 4)
	&& (Npc_KnowsInfo(hero, Info_Mod_Torgan_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Torgan_Dragomir_Info()
{
	AI_Output(hero, self, "Info_Mod_Torgan_Dragomir_15_00"); //Ich komme von Dragomir.
	AI_Output(self, hero, "Info_Mod_Torgan_Dragomir_23_01"); //Von Dragomir? Erz�hle, wie sieht es in Khorinis aus?
	AI_Output(hero, self, "Info_Mod_Torgan_Dragomir_15_02"); //Es sieht schlecht bei ihm aus. Sein Lager wurde vor einigen N�chten von Schwarzmagiern und Banditen �berfallen.
	AI_Output(hero, self, "Info_Mod_Torgan_Dragomir_15_03"); //Jetzt hat er sich in ein neues Lager bei der alten Mine im dunklen Wald aufgebaut.
	AI_Output(self, hero, "Info_Mod_Torgan_Dragomir_23_04"); //Das klingt nicht gut. Ich danke dir f�r diese wichtige Information. Wir werden den Vorfall besprechen.
	AI_Output(self, hero, "Info_Mod_Torgan_Dragomir_23_05"); //In der Zwischenzeit h�tte ich noch eine Aufgabe f�r dich. Hast du interesse?

	Log_CreateTopic	(TOPIC_MOD_JG_EREMITENCAMP, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_JG_EREMITENCAMP, LOG_RUNNING);
	B_LogEntry_More	(TOPIC_MOD_JG_LAGER, TOPIC_MOD_JG_EREMITENCAMP, "Ich habe Torgan von den Vorf�llen in Khorinis erz�hlt. Sie werden den Vorfall besprechen.", "Ich kann nicht in das Lager der Druiden. Ich werde versuchen m�ssen, mir den Zugang zu erarbeiten.");
	B_SetTopicStatus	(TOPIC_MOD_JG_LAGER, LOG_SUCCESS);

	B_G�ttergefallen(2, 1);
};

INSTANCE Info_Mod_Torgan_Zwischenzeit (C_INFO)
{
	npc		= Mod_1963_JG_Torgan_MT;
	nr		= 1;
	condition	= Info_Mod_Torgan_Zwischenzeit_Condition;
	information	= Info_Mod_Torgan_Zwischenzeit_Info;
	permanent	= 0;
	important	= 0;
	description	= "Lass h�ren.";
};

FUNC INT Info_Mod_Torgan_Zwischenzeit_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Torgan_Dragomir))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Torgan_Zwischenzeit_Info()
{
	AI_Output(hero, self, "Info_Mod_Torgan_Zwischenzeit_15_00"); //Lass h�ren.
	AI_Output(self, hero, "Info_Mod_Torgan_Zwischenzeit_23_01"); //Ich habe lange nichts mehr von unseren Sp�hern hier im Minental geh�rt. Schau bitte nach ihnen und frage nach, ob sie neue Informationen haben.

	Info_ClearChoices	(Info_Mod_Torgan_Zwischenzeit);

	Info_AddChoice	(Info_Mod_Torgan_Zwischenzeit, "In Ordnung.", Info_Mod_Torgan_Zwischenzeit_B);
	Info_AddChoice	(Info_Mod_Torgan_Zwischenzeit, "In Ordnung, was bekomme ich daf�r?", Info_Mod_Torgan_Zwischenzeit_A);
};

FUNC VOID Info_Mod_Torgan_Zwischenzeit_B()
{
	AI_Output(hero, self, "Info_Mod_Torgan_Zwischenzeit_B_15_00"); //In Ordnung.
	AI_Output(self, hero, "Info_Mod_Torgan_Zwischenzeit_B_23_01"); //Gut, das Lager der Sp�her liegt ziemlich in der Mitte des Tales an einem Pfad, der vom Alten Lager ins Neue Lager f�hrt.
	AI_Output(self, hero, "Info_Mod_Torgan_Zwischenzeit_B_23_02"); //Nimm diese Spruchrolle, mit ihr kannst du dich wieder zu mir teleportieren.

	B_GiveInvItems	(self, hero, ItSc_TeleportTorgan, 1);

	Log_CreateTopic	(TOPIC_MOD_JG_TORGANSINFOS, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_JG_TORGANSINFOS, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_JG_TORGANSINFOS, "Torgan m�chte, dass ich bei den Sp�her, welche ihr Lager etwa in der Mitte des Minentals bei einem Pfad vom alten Lager ins neue Lager haben, nach neuen Informationen frage.");

	Wld_InsertNpc	(Mod_1966_GRD_Gardist_MT, "OC1");
	B_KillNpc	(Mod_1966_GRD_Gardist_MT);
	B_KillNpc	(Mod_1964_JG_Jaeger_MT);
	B_KillNpc	(Mod_1965_JG_Jaeger_MT);

	Mod_Drago = 5;

	Info_ClearChoices	(Info_Mod_Torgan_Zwischenzeit);
};

FUNC VOID Info_Mod_Torgan_Zwischenzeit_A()
{
	AI_Output(hero, self, "Info_Mod_Torgan_Zwischenzeit_A_15_00"); //In Ordnung, was bekomme ich daf�r?
	AI_Output(self, hero, "Info_Mod_Torgan_Zwischenzeit_A_23_01"); //Unseren Dank als Waldl�ufer.
	AI_Output(hero, self, "Info_Mod_Torgan_Zwischenzeit_A_15_02"); //Na toll.

	Info_ClearChoices	(Info_Mod_Torgan_Zwischenzeit);

	Info_AddChoice	(Info_Mod_Torgan_Zwischenzeit, "In Ordnung.", Info_Mod_Torgan_Zwischenzeit_B);
};

INSTANCE Info_Mod_Torgan_SpaeherTot (C_INFO)
{
	npc		= Mod_1963_JG_Torgan_MT;
	nr		= 1;
	condition	= Info_Mod_Torgan_SpaeherTot_Condition;
	information	= Info_Mod_Torgan_SpaeherTot_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe sie gefunden.";
};

FUNC INT Info_Mod_Torgan_SpaeherTot_Condition()
{
	if (Mod_Drago == 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Torgan_SpaeherTot_Info()
{
	AI_Output(hero, self, "Info_Mod_Torgan_SpaeherTot_15_00"); //Ich habe sie gefunden.
	AI_Output(self, hero, "Info_Mod_Torgan_SpaeherTot_23_01"); //Und was haben sie gesagt?

	Info_ClearChoices	(Info_Mod_Torgan_SpaeherTot);

	Info_AddChoice	(Info_Mod_Torgan_SpaeherTot, "Sie sind tot. Ich habe aber die Leiche eines Gardisten (...)", Info_Mod_Torgan_SpaeherTot_B);
	Info_AddChoice	(Info_Mod_Torgan_SpaeherTot, "Nichts, sie waren stumm wie eine Leiche.", Info_Mod_Torgan_SpaeherTot_A);
};

FUNC VOID Info_Mod_Torgan_SpaeherTot_C()
{
	AI_Output(hero, self, "Info_Mod_Torgan_SpaeherTot_C_15_00"); //Ja.
	AI_Output(self, hero, "Info_Mod_Torgan_SpaeherTot_C_23_01"); //Das kann ich kaum glauben. Bisher haben wir mit den Gardisten immer in relativer Ruhe gelebt.
	AI_Output(self, hero, "Info_Mod_Torgan_SpaeherTot_C_23_02"); //Ich verstehe nicht, warum sie unsere Sp�her angreifen sollten. Ich muss dies sofort weitergeben.
	AI_Output(self, hero, "Info_Mod_Torgan_SpaeherTot_C_23_03"); //Dass die Sachen jetzt beinahe gleichzeitig passieren, kann kein Zufall sein. Da muss mehr dahinter stecken.
	AI_Output(self, hero, "Info_Mod_Torgan_SpaeherTot_C_23_04"); //Hier, nimm dies als Entlohnung f�r deine M�he.

	CreateInvItems	(self, ItWr_Bauplan_Wolfsring_Leben, 1);
	B_GiveInvItems	(self, hero, ItWr_Bauplan_Wolfsring_Leben, 1);

	B_GivePlayerXP	(250);

	B_LogEntry	(TOPIC_MOD_JG_TORGANSINFOS, "Ich habe Torgan von den toten Sp�hern berichtet. Er schien sehr beunruhigt.");
	B_SetTopicStatus	(TOPIC_MOD_JG_TORGANSINFOS, LOG_SUCCESS);

	B_G�ttergefallen(2, 1);
};

FUNC VOID Info_Mod_Torgan_SpaeherTot_B()
{
	AI_Output(hero, self, "Info_Mod_Torgan_SpaeherTot_B_15_00"); //Sie sind tot. Ich habe aber die Leiche eines Gardisten bei ihnen gesehen.
	AI_Output(self, hero, "Info_Mod_Torgan_SpaeherTot_B_23_01"); //Was sagst du? Sie sind tot? ... einen Gardisten sagst du?

	Info_ClearChoices	(Info_Mod_Torgan_SpaeherTot);

	Info_Mod_Torgan_SpaeherTot_C();
};

FUNC VOID Info_Mod_Torgan_SpaeherTot_A()
{
	AI_Output(hero, self, "Info_Mod_Torgan_SpaeherTot_A_15_00"); //Nichts, sie waren stumm wie eine Leiche.
	AI_Output(self, hero, "Info_Mod_Torgan_SpaeherTot_A_23_01"); //Was sagst du da? Diese verdammten Nichtsnutze ... rauchen den ganzen Tag Sumpfkraut oder nehmen dieses neue Rauschmittel. Diese unzuerl�ssigen ...
	AI_Output(hero, self, "Info_Mod_Torgan_SpaeherTot_A_15_02"); //Hey, mach mal halblang. Sie sind tot und nicht benebelt! Neben ihnen haben ich noch die Leiche eines Gardisten gefunden.
	AI_Output(self, hero, "Info_Mod_Torgan_SpaeherTot_A_23_03"); //Wieso sagst du soetwas nicht gleich, verdammt? Sie sind tot? Und ein Gardist soll neben ihnen ebenfalls tot rumliegen?

	Info_ClearChoices	(Info_Mod_Torgan_SpaeherTot);

	Info_Mod_Torgan_SpaeherTot_C();
};

INSTANCE Info_Mod_Torgan_GardistenZettel (C_INFO)
{
	npc		= Mod_1963_JG_Torgan_MT;
	nr		= 1;
	condition	= Info_Mod_Torgan_GardistenZettel_Condition;
	information	= Info_Mod_Torgan_GardistenZettel_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Torgan_GardistenZettel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Torgan_NochEinAuftrag))
	&& (Npc_HasItems(hero, ItWr_MagicPaper) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Torgan_GardistenZettel_Info()
{
	AI_Output(self, hero, "Info_Mod_Torgan_GardistenZettel_23_00"); //Warst du schon bei den anderen Lagern?
	AI_Output(hero, self, "Info_Mod_Torgan_GardistenZettel_15_01"); //Ja.
	AI_Output(self, hero, "Info_Mod_Torgan_GardistenZettel_23_02"); //Hast du was neues herausgefunden?

	if (Npc_KnowsInfo(hero, Info_Mod_Torwache_Sekte_01_GardistenInfos))
	{
		AI_Output(hero, self, "Info_Mod_Torgan_GardistenZettel_15_03"); //Beim Sektenlager ist nichts au�ergew�hnliches vorgefallen.
		AI_Output(self, hero, "Info_Mod_Torgan_GardistenZettel_23_04"); //Das war zu erwarten. Bei denen dauert es immer eine Weile, bis sie es mitbekommen.

		B_GivePlayerXP	(500);
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Torwache_AL_01_Halt))
	{
		AI_Output(hero, self, "Info_Mod_Torgan_GardistenZettel_15_05"); //Beim Alten Lager konnte ich nichts weiter herausfinden.
		AI_Output(self, hero, "Info_Mod_Torgan_GardistenZettel_23_06"); //Nichts? Hm. Wir m�ssen herausfinden, ob sie wirklich nichts damit zu tun haben, oder ob sie sich doch nur verstellen. Zuzutrauen ist ihnen alles.

		B_GivePlayerXP	(500);
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Torwache_NL_01_GardistenInfos))
	{
		AI_Output(hero, self, "Info_Mod_Torgan_GardistenZettel_15_07"); //Ein W�chter des Neuen Lagers wurde von Unbekannten beschossen.
		AI_Output(self, hero, "Info_Mod_Torgan_GardistenZettel_23_08"); //Das Neue Lager wurde einfach beschossen? Wei� man mehr dar�ber?

		if (Npc_KnowsInfo(hero, Info_Mod_Nodrak_BierInfos))
		{
			AI_Output(hero, self, "Info_Mod_Torgan_GardistenZettel_15_09"); //Die Banditen und die Waldl�ufer werden verd�chtigt, den feigen Angriff begangen zu haben.
			AI_Output(self, hero, "Info_Mod_Torgan_GardistenZettel_23_10"); //Das ist bedenklich. Wir m�ssen schnell reagieren und diesen Irrtum gar nicht erst wachsen lassen.

			if (Npc_KnowsInfo(hero, Info_Mod_Hecta_Hi))
			{
				AI_Output(hero, self, "Info_Mod_Torgan_GardistenZettel_15_11"); //Ich glaube ich habe die beiden Sch�tzen gestellt.
				AI_Output(self, hero, "Info_Mod_Torgan_GardistenZettel_23_12"); //Das ist wenigstens eine erfreuliche Nachricht. Damit wird es uns leichter fallen, unseren Standpunkt zu behaupten.
			};
		}
		else
		{
			AI_Output(hero, self, "Info_Mod_Torgan_GardistenZettel_15_13"); //Leider nicht.
		};

		B_GivePlayerXP	(500);
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Sancho_GardistenInfos))
	{
		AI_Output(hero, self, "Info_Mod_Torgan_GardistenZettel_15_14"); //Ein paar Gardisten sind bei dem Banditenlager aufgetaucht, wurden von ihnen jedoch get�tet.
		AI_Output(self, hero, "Info_Mod_Torgan_GardistenZettel_23_15"); //Das verst�rkt meine Vermutung, dass es vielleicht gar keine Gardisten sind. Keiner von ihnen w�rde einfach so in der N�he der Banditen herumstreifen.


		B_GivePlayerXP	(500);
	};

	AI_Output(self, hero, "Info_Mod_Torgan_GardistenZettel_23_16"); //Trotz all den Informationen reicht es noch nicht. Wir brauchen etwas Handfestes, um einen Hinweis zu bekommen!
	AI_Output(self, hero, "Info_Mod_Torgan_GardistenZettel_23_17"); //Die ganze Situation ist noch zu undurchsichtig, um konkrete Vermutungen anstellen zu k�nnen.
	AI_Output(self, hero, "Info_Mod_Torgan_GardistenZettel_23_18"); //Gibt es noch mehr, was uns einen Hinweis auf den T�ter geben k�nnte?

	if (Npc_HasItems(hero, ItWr_MagicPaper) == 1)
	{
		if (Mod_SanchoHatZettel == 2)
		{
			AI_Output(hero, self, "Info_Mod_Torgan_GardistenZettel_15_19"); //Ja, hier, diesen Zettel habe ich von den Banditen. Er stammt von einem der get�teten Gardisten.
		}
		else
		{
			AI_Output(hero, self, "Info_Mod_Torgan_GardistenZettel_15_20"); //Ja, hier, diesen Zettel habe ich gefunden. Er stammt von den Gardisten, die das Neue Lager �berfallen haben.
		};
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Torgan_GardistenZettel_15_21"); //Ja, diese beiden Zettel habe ich gefunden.
		AI_Output(hero, self, "Info_Mod_Torgan_GardistenZettel_15_22"); //Einer stammt von den Gardisten, die das Neue Lager �berfallen haben, der andere von den Banditen. Sie haben ihn bei einem der get�teten Gardisten gefunden.
	};

	AI_Output(self, hero, "Info_Mod_Torgan_GardistenZettel_23_23"); //Wunderbar, kann ich ihn mal sehen?

	B_GiveInvItems	(hero, self, ItWr_MagicPaper, 1);
	B_UseFakeScroll	();

	AI_Output(self, hero, "Info_Mod_Torgan_GardistenZettel_23_24"); //Dieser Zettel ist eindeutig magischer Natur. Bitte nimm ihn zur�ck und bringe ihn dem Druiden Cyrco.
	AI_Output(self, hero, "Info_Mod_Torgan_GardistenZettel_23_25"); //Du hast die dir anvertrauten Aufgaben mit gro�em Erfolg erledigt. Von nun an ist dir der Zutritt zu unserem Lager erlaubt, da du uns dein Vertrauen bewiesen hast. Bitte tritt ein.

	B_GiveInvItems	(self, hero, ItWr_MagicPaper, 1);

	B_LogEntry_More	(TOPIC_MOD_JG_GARDISTEN, TOPIC_MOD_JG_EREMITENCAMP, "Ich habe Torgan von den Geschehnissen berichtet. Er ist sehr zufrieden mit den Informationen und ich darf nun endlich das Lager betreten.", "Dank meiner Verdienste darf ich jetzt in das Lager der Druiden.");

	B_GivePlayerXP	(500);

	B_SetTopicStatus	(TOPIC_MOD_JG_EREMITENCAMP, LOG_SUCCESS);

	B_G�ttergefallen(2, 2);
};

INSTANCE Info_Mod_Torgan_InsLager (C_INFO)
{
	npc		= Mod_1963_JG_Torgan_MT;
	nr		= 1;
	condition	= Info_Mod_Torgan_InsLager_Condition;
	information	= Info_Mod_Torgan_InsLager_Info;
	permanent	= 1;
	important	= 0;
	description	= "Kann ich jetzt in das Lager?";
};

FUNC INT Info_Mod_Torgan_InsLager_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Torgan_SpaeherTot))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Torgan_GardistenZettel))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Torgan_InsLager_Info()
{
	AI_Output(hero, self, "Info_Mod_Torgan_InsLager_15_00"); //Kann ich jetzt in das Lager?
	AI_Output(self, hero, "Info_Mod_Torgan_InsLager_23_01"); //Nein, noch nicht.
};

INSTANCE Info_Mod_Torgan_SomethingInteresting (C_INFO)
{
	npc		= Mod_1963_JG_Torgan_MT;
	nr		= 1;
	condition	= Info_Mod_Torgan_SomethingInteresting_Condition;
	information	= Info_Mod_Torgan_SomethingInteresting_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ist irgendetwas passiert?";
};

FUNC INT Info_Mod_Torgan_SomethingInteresting_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Torgan_SpaeherTot))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Torgan_SomethingInteresting_Info()
{
	AI_Output(hero, self, "Info_Mod_Torgan_SomethingInteresting_15_00"); //Ist irgendetwas passiert?
	AI_Output(self, hero, "Info_Mod_Torgan_SomethingInteresting_23_01"); //Erst Dragomir und nun unsere Sp�her. Du bringst nicht gerade positive Neuigkeiten, das reicht mir erstmal!
};

INSTANCE Info_Mod_Torgan_NochEinAuftrag (C_INFO)
{
	npc		= Mod_1963_JG_Torgan_MT;
	nr		= 1;
	condition	= Info_Mod_Torgan_NochEinAuftrag_Condition;
	information	= Info_Mod_Torgan_NochEinAuftrag_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kann ich f�r euch noch irgendetwas erledigen?";
};

FUNC INT Info_Mod_Torgan_NochEinAuftrag_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Torgan_SomethingInteresting))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Torgan_NochEinAuftrag_Info()
{
	AI_Output(hero, self, "Info_Mod_Torgan_NochEinAuftrag_15_00"); //Kann ich f�r euch noch irgendetwas erledigen?
	AI_Output(self, hero, "Info_Mod_Torgan_NochEinAuftrag_23_01"); //Ich muss zugeben, dass mir nicht ganz wohl dabei ist, Aufgaben an einen Au�enstehenden zu verteilen. Doch es scheint, als bliebe mir keine Wahl.
	AI_Output(self, hero, "Info_Mod_Torgan_NochEinAuftrag_23_02"); //Deine Zuverl�ssigkeit hast du ja bereits bewiesen, ich erwarte von dir �u�erste Diskretion �ber unsere Angelegenheiten.
	AI_Output(hero, self, "Info_Mod_Torgan_NochEinAuftrag_15_03"); //Nat�rlich.
	AI_Output(self, hero, "Info_Mod_Torgan_NochEinAuftrag_23_04"); //Gut, dann pass auf. Wir m�ssen unbedingt mehr �ber diese angeblichen Gardisten herausfinden.
	AI_Output(self, hero, "Info_Mod_Torgan_NochEinAuftrag_23_05"); //Ich kann mir einfach nicht vorstellen, dass das alte Lager uns angreifen sollte und dann die Leiche ihres Kumpanen einfach dort mitsamt Ausr�stung liegen lassen.
	AI_Output(self, hero, "Info_Mod_Torgan_NochEinAuftrag_23_06"); //Bringe in Erfahrung, ob jemand in den anderen Lagern des Minentals mehr �ber diese �Gardisten� wei�. Am besten fragst du bei den jeweiligen Torw�chtern des Sektenlagers, alten Lagers und Neuen Lagers nach.
	AI_Output(self, hero, "Info_Mod_Torgan_NochEinAuftrag_23_07"); //Beim Alten Lager solltest du besonders vorsichtig sein, wie ich h�rte, gibt es dort einige Spannungen.
	AI_Output(self, hero, "Info_Mod_Torgan_NochEinAuftrag_23_08"); //Geh auch ruhig zu den Banditen, falls du wei�t, wo diese sich aufhalten. In den letzten Meldungen der Sp�her haben sie angeblich welche im S�den gesehen.
	AI_Output(self, hero, "Info_Mod_Torgan_NochEinAuftrag_23_09"); //Sobald du etwas herausgefunden hast, komm sofort zu uns zur�ck.
	AI_Output(hero, self, "Info_Mod_Torgan_NochEinAuftrag_15_10"); //Ich bin schon unterwegs!
	AI_Output(self, hero, "Info_Mod_Torgan_NochEinAuftrag_23_11"); //Und hier, nimm diese Geschwindigkeitstr�nke. Ich denke, du wirst sie brauchen k�nnen.

	B_GiveInvItems	(self, hero, ItPo_Speed, 4);

	AI_Output(self, hero, "Info_Mod_Torgan_NochEinAuftrag_23_12"); //Und eine Spruchrolle habe ich auch wieder f�r dich.

	B_GiveInvItems	(self, hero, ItSc_TeleportTorgan, 1);

	Log_CreateTopic	(TOPIC_MOD_JG_GARDISTEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_JG_GARDISTEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_JG_GARDISTEN, "Torgan will, dass ich mehr �ber die Gardisten rausfinde. Dazu soll ich die Torw�chter der verschiedenen Lager hier im Minental nach Informationen befragen. Ich sollte mich aber beim alten Lager in Acht nehmen.");
};

INSTANCE Info_Mod_Torgan_Scharmuetzel (C_INFO)
{
	npc		= Mod_1963_JG_Torgan_MT;
	nr		= 1;
	condition	= Info_Mod_Torgan_Scharmuetzel_Condition;
	information	= Info_Mod_Torgan_Scharmuetzel_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Torgan_Scharmuetzel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Orun_Cyrco))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Torgan_Scharmuetzel_Info()
{
	AI_Output(self, hero, "Info_Mod_Torgan_Scharmuetzel_23_00"); //Wer waren die? Was wollten die? Die haben kein Wort geredet.
	AI_Output(hero, self, "Info_Mod_Torgan_Scharmuetzel_15_01"); //Vielleicht wei� Cyrco was. Mal sehen.
};

INSTANCE Info_Mod_Torgan_Turm (C_INFO)
{
	npc		= Mod_1963_JG_Torgan_MT;
	nr		= 1;
	condition	= Info_Mod_Torgan_Turm_Condition;
	information	= Info_Mod_Torgan_Turm_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Torgan_Turm_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wulfgar_Hi))
	&& (Kapitel >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Torgan_Turm_Info()
{
	AI_Output(self, hero, "Info_Mod_Torgan_Turm_23_00"); //Eh. Gut, dass du kommst. Wulfgar will dich sprechen.
	AI_Output(hero, self, "Info_Mod_Torgan_Turm_15_01"); //Bin schon unterwegs.
};

INSTANCE Info_Mod_Torgan_Turm2 (C_INFO)
{
	npc		= Mod_1963_JG_Torgan_MT;
	nr		= 1;
	condition	= Info_Mod_Torgan_Turm2_Condition;
	information	= Info_Mod_Torgan_Turm2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Torgan_Turm2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Suchender_Turm))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Torgan_Turm2_Info()
{
	AI_Output(self, hero, "Info_Mod_Torgan_Turm2_23_00"); //Du schon wieder.
	AI_Output(hero, self, "Info_Mod_Torgan_Turm2_15_01"); //Ich muss ...
	AI_Output(self, hero, "Info_Mod_Torgan_Turm2_23_02"); //Moment. H�rst du den Kerl da oben im Turm?
	AI_Output(self, hero, "Info_Mod_Torgan_Turm2_23_03"); //Der schreit sich schier die Lunge aus dem Leib.
	AI_Output(hero, self, "Info_Mod_Torgan_Turm2_15_04"); //Na und? Soll er doch. Ich muss ...
	AI_Output(self, hero, "Info_Mod_Torgan_Turm2_23_05"); //Geh doch mal eben rauf und frag, was er will. Hast auch was gut bei mit.

	Info_ClearChoices	(Info_Mod_Torgan_Turm2);

	Info_AddChoice	(Info_Mod_Torgan_Turm2, "Geht nicht. Ich muss zu Wulfgar.", Info_Mod_Torgan_Turm2_A);
	Info_AddChoice	(Info_Mod_Torgan_Turm2, "Na gut. Ich nehm dich beim Wort.", Info_Mod_Torgan_Turm2_B);
};

FUNC VOID Info_Mod_Torgan_Turm2_B()
{
	AI_Output(hero, self, "Info_Mod_Torgan_Turm2_B_15_00"); //Na gut. Ich nehm dich beim Wort.

	Mod_JG_TurmwaechterFelle = 1;

	Info_ClearChoices	(Info_Mod_Torgan_Turm2);
};

FUNC VOID Info_Mod_Torgan_Turm2_A()
{
	AI_Output(hero, self, "Info_Mod_Torgan_Turm2_A_15_00"); //Geht nicht. Ich muss zu Wulfgar.

	Info_ClearChoices	(Info_Mod_Torgan_Turm2);
};

INSTANCE Info_Mod_Torgan_WeicheFelle (C_INFO)
{
	npc		= Mod_1963_JG_Torgan_MT;
	nr		= 1;
	condition	= Info_Mod_Torgan_WeicheFelle_Condition;
	information	= Info_Mod_Torgan_WeicheFelle_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Torgan_WeicheFelle_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_JGTurmwache_Felle))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Torgan_WeicheFelle_Info()
{
	AI_Output(self, hero, "Info_Mod_Torgan_WeicheFelle_23_00"); //Und? Was will der Schreihals?
	AI_Output(hero, self, "Info_Mod_Torgan_WeicheFelle_15_01"); //Ein Fell. Ein warmes, weiches Fell.
	AI_Output(self, hero, "Info_Mod_Torgan_WeicheFelle_23_02"); //Soll er sich bewegen. Da wird ihm warm. Oder nein.
	AI_Output(self, hero, "Info_Mod_Torgan_WeicheFelle_23_03"); //Ich hab geh�rt, dass der Alchemist was Neues mit den Fellen macht. Frag den mal.
	AI_Output(hero, self, "Info_Mod_Torgan_WeicheFelle_15_04"); //Mach ich. Bis dann.

	B_LogEntry	(TOPIC_MOD_JG_TURMFELLE, "Wulfgar macht was mit den Fellen. Gut zu wissen.");
};

INSTANCE Info_Mod_Torgan_Nahkampf (C_INFO)
{
	npc		= Mod_1963_JG_Torgan_MT;
	nr		= 1;
	condition	= Info_Mod_Torgan_Nahkampf_Condition;
	information	= Info_Mod_Torgan_Nahkampf_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Torgan_Nahkampf_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cyrco_Opferschale))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Torgan_Nahkampf_Info()
{
	AI_Output(self, hero, "Info_Mod_Torgan_Nahkampf_23_00"); //Na. Wieder auf zu neuen Abenteuern?
	AI_Output(hero, self, "Info_Mod_Torgan_Nahkampf_15_01"); //Abenteuer? Neues Lager ist besser. Neue Leute beschaffen.
	AI_Output(self, hero, "Info_Mod_Torgan_Nahkampf_23_02"); //Da kannst du gleich mal da drau�en schauen. Da lungert so ein Typ rum. K�nnte ein S�ldner sein.
	AI_Output(hero, self, "Info_Mod_Torgan_Nahkampf_15_03"); //Das trifft sich gut.

	Wld_InsertNpc	(Mod_7475_SLD_Falin_MT, "WP_MT_JAEGERLAGER_05");
};

INSTANCE Info_Mod_Torgan_Nahkampf2 (C_INFO)
{
	npc		= Mod_1963_JG_Torgan_MT;
	nr		= 1;
	condition	= Info_Mod_Torgan_Nahkampf2_Condition;
	information	= Info_Mod_Torgan_Nahkampf2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Torgan_Nahkampf2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Falin_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Hock_NahkampfJG))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Torgan_Nahkampf2_Info()
{
	AI_Output(self, hero, "Info_Mod_Torgan_Nahkampf2_23_00"); //Sch�ner Tag heute.
	AI_Output(hero, self, "Info_Mod_Torgan_Nahkampf2_15_01"); //Ich wei� nicht. Auf jeden Fall wieder mal anstrengend.
};

INSTANCE Info_Mod_Torgan_Sweetwater (C_INFO)
{
	npc		= Mod_1963_JG_Torgan_MT;
	nr		= 1;
	condition	= Info_Mod_Torgan_Sweetwater_Condition;
	information	= Info_Mod_Torgan_Sweetwater_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Torgan_Sweetwater_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hock_JG_Sweetwater))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Torgan_Sweetwater_Info()
{
	AI_Output(self, hero, "Info_Mod_Torgan_Sweetwater_23_00"); //Nanu, schon wieder weg? Bist doch eben erst gekommen.
	AI_Output(hero, self, "Info_Mod_Torgan_Sweetwater_15_01"); //Wie du siehst. Einer muss ja was tun ...
	AI_Output(self, hero, "Info_Mod_Torgan_Sweetwater_23_02"); //Hmm ...
};

INSTANCE Info_Mod_Torgan_Drachental (C_INFO)
{
	npc		= Mod_1963_JG_Torgan_MT;
	nr		= 1;
	condition	= Info_Mod_Torgan_Drachental_Condition;
	information	= Info_Mod_Torgan_Drachental_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Torgan_Drachental_Condition()
{
	if (Mod_JG_SuchenderDT == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Torgan_Drachental_Info()
{
	AI_Output(self, hero, "Info_Mod_Torgan_Drachental_23_00"); //Diesmal warst du aber lange weg. Was war los?
	AI_Output(hero, self, "Info_Mod_Torgan_Drachental_15_01"); //Stress ohne Ende. Bei Gelegenheit erz�hl ich's dir.
	AI_Output(self, hero, "Info_Mod_Torgan_Drachental_23_02"); //Dein Wort in Adanos Ohr!
	AI_Output(hero, self, "Info_Mod_Torgan_Drachental_15_03"); //Bis dann.
};

INSTANCE Info_Mod_Torgan_AlterMann (C_INFO)
{
	npc		= Mod_1963_JG_Torgan_MT;
	nr		= 1;
	condition	= Info_Mod_Torgan_AlterMann_Condition;
	information	= Info_Mod_Torgan_AlterMann_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wegen altem Mann im Wald fragen.";
};

FUNC INT Info_Mod_Torgan_AlterMann_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Morgahard_AlterWaldMann))
	&& (Mod_BDT_AlterWaldMann < 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Torgan_AlterMann_Info()
{
	if (Mod_BDT_AlterWaldMann == 0)
	{
		B_Say	(hero, self, "$ALTERWALDMANN01");

		AI_Output(self, hero, "Info_Mod_Torgan_AlterMann_23_00"); //Ahh, du meinst den alten Mann des Waldes. Ja, etwas wei� ich �ber ihn.
		AI_Output(self, hero, "Info_Mod_Torgan_AlterMann_23_01"); //Er soll Jahrhunderte alt sein und die Tiere des Waldes Rund um Khorata beh�ten.
		AI_Output(self, hero, "Info_Mod_Torgan_AlterMann_23_02"); //Zwar sagt man, er sei blind, jedoch gleichzeitig auch magisch begabt.
		AI_Output(self, hero, "Info_Mod_Torgan_AlterMann_23_03"); //Mehr f�llt mir gerade nicht ein. Vielleicht wei� ein anderer mehr.

		B_LogEntry	(TOPIC_MOD_BDT_ALTERMANN, "Von dem ersten Waldl�ufer erfuhr ich nicht viel Neues. Der alte Mann des Waldes, beh�tet die Tiere, er ist uralt, blind und magisch begabt. Vielleicht wei� ein anderer Waldl�ufer mehr.");
	}
	else if (Mod_BDT_AlterWaldMann == 1)
	{
		B_Say	(hero, self, "$ALTERWALDMANN02");

		AI_Output(self, hero, "Info_Mod_Torgan_AlterMann_23_04"); //Der alte Mann des Waldes? Ja, ich h�rte er solle einst ein Diener Adanos gewesen sein.
		AI_Output(self, hero, "Info_Mod_Torgan_AlterMann_23_05"); //Wobei unklar ist, ob er ein Waldl�ufer war wie wir, ein Magier des Wassers, oder ein Verwandlungsmagier.
		AI_Output(self, hero, "Info_Mod_Torgan_AlterMann_23_06"); //Seine magischen F�higkeiten, wie auch seine starke Bindung zur Tier- und Pflanzenwelt zeugen davon, dass er von allem etwas hat.

		B_LogEntry	(TOPIC_MOD_BDT_ALTERMANN, "Beim 2ten Waldl�ufer erfuhr ich auch nicht viel wissenswertes. Der alte Mann des Waldes soll Adanos und der Sch�pfung verbunden sein, allem voran der Tier und Pflanzenwelt.");
	}
	else if (Mod_BDT_AlterWaldMann == 2)
	{
		B_Say	(hero, self, "$ALTERWALDMANN03");

		AI_Output(self, hero, "Info_Mod_Torgan_AlterMann_23_07"); //Tja, viel kann ich dir nicht �ber ihn verraten.
		AI_Output(self, hero, "Info_Mod_Torgan_AlterMann_23_08"); //Das Problem besteht auch darin, dass er mit keinem Menschen spricht, nicht mal mit uns, auch, wenn wir eigentlich �hnliche Ziele verfolgen.
		AI_Output(self, hero, "Info_Mod_Torgan_AlterMann_23_09"); //Allein mit den Tieren des Waldes unterh�lt er sich.
		AI_Output(self, hero, "Info_Mod_Torgan_AlterMann_23_10"); //Tja, wenn ich ein Keiler w�re, k�nnte ich dir bestimmt mehr �ber ihn verraten.

		B_LogEntry	(TOPIC_MOD_BDT_ALTERMANN, "Acha, das k�nnte ein wichtiger Hinweis gewesen sein. Der alte Mann des Waldes meidet Menschen g�nzlich, spricht nur mit Tieren.");
	}
	else if (Mod_BDT_AlterWaldMann == 3)
	{
		B_Say	(hero, self, "$ALTERWALDMANN04");

		AI_Output(self, hero, "Info_Mod_Torgan_AlterMann_23_11"); //Der alte Mann des Waldes? Nun, er soll in enger Beziehung zur Tier- und Pflanzenwelt stehen.
		AI_Output(self, hero, "Info_Mod_Torgan_AlterMann_23_12"); //Man sagt, er leite Rudeltiere wie Keiler, oder W�lfe dazu an, den Wald gegen Eindringlinge zu besch�tzen.
		AI_Output(self, hero, "Info_Mod_Torgan_AlterMann_23_13"); //Selbst, so sagt man, f�nde man ihn h�ufig in Gestalt eines gr�nen Wolfes vor.

		B_LogEntry	(TOPIC_MOD_BDT_ALTERMANN, "Er soll vor allem auch gr��ere Rudeltiere wie Keiler und W�lfe dazu anleiten den Wald gegen Eindringlinge zu besch�tzen.");
	}
	else if (Mod_BDT_AlterWaldMann == 4)
	{
		B_Say	(hero, self, "$ALTERWALDMANN05");

		AI_Output(self, hero, "Info_Mod_Torgan_AlterMann_23_14"); //Du interessierst dich f�r Geschichten �ber den alten Mann des Waldes?
		AI_Output(self, hero, "Info_Mod_Torgan_AlterMann_23_15"); //Nun, viel wei� ich nicht �ber diesen mystischen Kauz.
		AI_Output(self, hero, "Info_Mod_Torgan_AlterMann_23_16"); //Er soll sich meistens im dunklen Wald aufhalten, aber auch immer in der N�he von Gew�ssern, wie Seen.
		AI_Output(self, hero, "Info_Mod_Torgan_AlterMann_23_17"); //Selten hat ihn jemand zu Gesicht bekommen ...

		B_LogEntry	(TOPIC_MOD_BDT_ALTERMANN, "Man findet ihn h�chst wahrscheinlich im dichten Wald Khorata�s in der N�he eines Sees.");
	};

	Mod_BDT_AlterWaldMann += 1;
};

INSTANCE Info_Mod_Torgan_Asylanten (C_INFO)
{
	npc		= Mod_1963_JG_Torgan_MT;
	nr		= 1;
	condition	= Info_Mod_Torgan_Asylanten_Condition;
	information	= Info_Mod_Torgan_Asylanten_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wieso seid ihr J�ger hier im Minental?";
};

FUNC INT Info_Mod_Torgan_Asylanten_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hagen_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Torgan_Asylanten_Info()
{
	AI_Output(hero, self, "Info_Mod_Torgan_Asylanten_15_00"); //Wieso seid ihr J�ger hier im Minental?
	AI_Output(self, hero, "Info_Mod_Torgan_Asylanten_23_01"); //Na, wegen unseres Berufs.
	AI_Output(self, hero, "Info_Mod_Torgan_Asylanten_23_02"); //Das Minental ist ein gef�hrlicher Ort, und die Lager senden nur wenige eigene J�ger aus, sodass es hier fette Beute f�r uns zu machen gibt.
	AI_Output(hero, self, "Info_Mod_Torgan_Asylanten_15_03"); //Habt ihr schon Kontakt zu anderen Lagern gehabt?
	AI_Output(self, hero, "Info_Mod_Torgan_Asylanten_23_04"); //Nicht viel. Die meisten sind doch Schwerverbrecher, mit denen wollen wir nichts zu tun haben.

	B_LogEntry	(TOPIC_MOD_HAGEN_ASYLANTEN, "Einen Trupp J�ger hat es auch in das Minental verschlagen. Er ist jedoch nur zum Jagen da und tritt kaum in Kontakt mit den anderen Gruppierungen.");
};

INSTANCE Info_Mod_Torgan_WerBistDu (C_INFO)
{
	npc		= Mod_1963_JG_Torgan_MT;
	nr		= 1;
	condition	= Info_Mod_Torgan_WerBistDu_Condition;
	information	= Info_Mod_Torgan_WerBistDu_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Torgan_WerBistDu_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Torgan_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Torgan_WerBistDu_Info()
{
	AI_Output(hero, self, "Info_Mod_Torgan_WerBistDu_15_00"); //Wer bist du?
	AI_Output(self, hero, "Info_Mod_Torgan_WerBistDu_23_01"); //Mein Name ist Torgan und ich bin angewiesen, niemanden Unbekannten hereinzulassen.
};

INSTANCE Info_Mod_Torgan_WasBewachstDu (C_INFO)
{
	npc		= Mod_1963_JG_Torgan_MT;
	nr		= 1;
	condition	= Info_Mod_Torgan_WasBewachstDu_Condition;
	information	= Info_Mod_Torgan_WasBewachstDu_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was bewachst du dort?";
};

FUNC INT Info_Mod_Torgan_WasBewachstDu_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Torgan_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Torgan_WasBewachstDu_Info()
{
	AI_Output(hero, self, "Info_Mod_Torgan_WasBewachstDu_15_00"); //Was bewachst du dort?
	AI_Output(self, hero, "Info_Mod_Torgan_WasBewachstDu_23_01"); //Wir sind Waldl�ufer und J�ger, hier befindet sich zur Zeit eines unserer Lager, die von niemandem Fremden betreten werden sollen.
};

INSTANCE Info_Mod_Torgan_Wegschauen (C_INFO)
{
	npc		= Mod_1963_JG_Torgan_MT;
	nr		= 1;
	condition	= Info_Mod_Torgan_Wegschauen_Condition;
	information	= Info_Mod_Torgan_Wegschauen_Info;
	permanent	= 0;
	important	= 0;
	description	= "K�nntest du nicht eine kleine Ausnahme machen (...)";
};

FUNC INT Info_Mod_Torgan_Wegschauen_Condition()
{
	if ((Npc_KnowsInfo(hero, Info_Mod_Torgan_WerBistDu))
	|| (Npc_KnowsInfo(hero, Info_Mod_Torgan_WasBewachstDu)))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Torgan_GardistenZettel))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Torgan_Wegschauen_Info()
{
	AI_Output(hero, self, "Info_Mod_Torgan_Wegschauen_15_00"); //K�nntest du nicht eine kleine Ausnahme machen und kurz in eine Andere Richtung schaun?
	AI_Output(self, hero, "Info_Mod_Torgan_Wegschauen_23_01"); //Nein! Kannst du nicht zuh�ren? Vielleicht haben einige Jagdtrupps von uns was f�r dich zu tun, sie mal bei denen nach.
	AI_Output(self, hero, "Info_Mod_Torgan_Wegschauen_23_02"); //Bei Dragomir in Khorinis findest du eigentlich immer genug.
};

INSTANCE Info_Mod_Torgan_Lernen (C_INFO)
{
	npc		= Mod_1963_JG_Torgan_MT;
	nr          	= 1;
	condition	= Info_Mod_Torgan_Lernen_Condition;
	information	= Info_Mod_Torgan_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Was kannst du mir beibringen?";
};

FUNC INT Info_Mod_Torgan_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Dusty_Hi))
	{
		return 1;
	};
};

var int Mod_Torgan_Lehrer;

FUNC VOID Info_Mod_Torgan_Lernen_ShowOptions()
{
	Info_ClearChoices	(Info_Mod_Torgan_Lernen);

	Info_AddChoice	(Info_Mod_Torgan_Lernen, DIALOG_BACK, Info_Mod_Torgan_Lernen_BACK);

	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
	{ 
		Info_AddChoice	(Info_Mod_Torgan_Lernen, B_BuildLearnString ("Z�hne reissen",B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)), Info_Mod_Torgan_Lernen_Teeth);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
	{ 
		Info_AddChoice	(Info_Mod_Torgan_Lernen, B_BuildLearnString ("Klauen hacken",B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Claws)), Info_Mod_Torgan_Lernen_Claws);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE)
	{ 
		Info_AddChoice	(Info_Mod_Torgan_Lernen, B_BuildLearnString("Fliegenstachel", B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFSting)), Info_Mod_Torgan_Lernen_BFSting);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{ 
		Info_AddChoice	(Info_Mod_Torgan_Lernen, B_BuildLearnString ("Fell abziehen",B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Fur)), Info_Mod_Torgan_Lernen_Fur);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TrollTeeth] == FALSE)
	{ 
		Info_AddChoice	(Info_Mod_Torgan_Lernen, B_BuildLearnString ("Trollhauer reissen",B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_TrollTeeth)), Info_Mod_Torgan_Lernen_TrollTeeth);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SwampSharkTeeth] == FALSE)
	{ 
		Info_AddChoice	(Info_Mod_Torgan_Lernen, B_BuildLearnString ("Sumpfhaiz�hne ziehen",B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_SwampSharkTeeth)), Info_Mod_Torgan_Lernen_SwampsharkTeeth);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == FALSE)
	{ 
		Info_AddChoice	(Info_Mod_Torgan_Lernen, B_BuildLearnString ("H�uten von Reptilien",B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_ReptileSkin)), Info_Mod_Torgan_Lernen_ReptileSkin);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] == FALSE)
	{ 
		Info_AddChoice	(Info_Mod_Torgan_Lernen, B_BuildLearnString ("Herzen nehmen",B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Heart)), Info_Mod_Torgan_Lernen_Heart);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE)
	{ 
		Info_AddChoice	(Info_Mod_Torgan_Lernen, B_BuildLearnString ("Schattenl�uferh�rner nehmen",B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_ShadowHorn)), Info_Mod_Torgan_Lernen_ShadowHorn);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE)
	{ 
		Info_AddChoice	(Info_Mod_Torgan_Lernen, B_BuildLearnString ("Feuerzungen rei�en",B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_FireTongue)), Info_Mod_Torgan_Lernen_FireTongue);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE)
	{ 
		Info_AddChoice	(Info_Mod_Torgan_Lernen, B_BuildLearnString ("Fl�gel nehmen",B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFWing)), Info_Mod_Torgan_Lernen_BFWing);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE)
	{ 
		Info_AddChoice	(Info_Mod_Torgan_Lernen, B_BuildLearnString ("Klauen nehmen",B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Mandibles)), Info_Mod_Torgan_Lernen_Mandibles);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE)
	{ 
		Info_AddChoice	(Info_Mod_Torgan_Lernen, B_BuildLearnString ("Drachensnapperhorn nehmen",B_GetLearnCostTalent (hero,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DrgSnapperHorn)), Info_Mod_Torgan_Lernen_DrgSnapperHorn);
	};
};

FUNC VOID Info_Mod_Torgan_Lernen_Info()
{
	if (Mod_Torgan_Lehrer == FALSE) {
		Mod_Torgan_Lehrer = TRUE;
		
		Log_CreateTopic	(TOPIC_MOD_LEHRER_WALDIS, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_LEHRER_WALDIS, "Torgan kann mich das Nehmen verschiedener Jagdtroph�en lehren.");
	};
	AI_Output(hero, self, "Info_Mod_Torgan_Lernen_15_00"); //Was kannst du mir beibringen?

	if ((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TrollTeeth] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SwampSharkTeeth] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE))
	{
		AI_Output(self, hero, "Info_Mod_Torgan_Lernen_23_01"); //Kommt darauf an, was du wissen willst.

		Info_Mod_Torgan_Lernen_ShowOptions();
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Torgan_Lernen_23_02"); //Ich kann dir im Moment nicht mehr beibringen, als du ohnehin schon wei�t. Tut mir Leid.
	};
};

FUNC void Info_Mod_Torgan_Lernen_BACK()
{
	Info_ClearChoices (Info_Mod_Torgan_Lernen);
};

FUNC void Info_Mod_Torgan_Lernen_Claws()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_Claws))
	{
		AI_Output(self, hero, "Info_Mod_Torgan_Lernen_Claws_23_00"); //Tiere geben ihre Klauen nicht sehr gerne her. Du musst schon sehr genau den Punkt treffen, an dem du mit deinem Messer ansetzt.
		AI_Output(self, hero, "Info_Mod_Torgan_Lernen_Claws_23_01"); //Die Haltung deiner Hand sollte etwas verschr�nkt sein. Mit einem kr�ftigen Ruck trennst du dann die Klaue ab.
		AI_Output(self, hero, "Info_Mod_Torgan_Lernen_Claws_23_02"); //Klauen sind immer ein begehrtes Zahlungsmittel bei einem H�ndler.
	};

	Info_Mod_Torgan_Lernen_ShowOptions();
		
};

FUNC void Info_Mod_Torgan_Lernen_Teeth()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_Teeth))
	{
		AI_Output(self, hero, "Info_Mod_Torgan_Lernen_Teeth_23_00"); //Das einfachste, was du Tieren entnehmen kannst, sind seine Z�hne. Du f�hrst mit deinem Messer in seinem Maul um das Gebiss.
		AI_Output(self, hero, "Info_Mod_Torgan_Lernen_Teeth_23_01"); //Dann trennst es geschickt mit einem Ruck vom Sch�del des Tieres.
	};

	Info_Mod_Torgan_Lernen_ShowOptions();
};

FUNC void Info_Mod_Torgan_Lernen_BFSting()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_BFSting))
	{
		AI_Output(self, hero, "Info_Mod_Torgan_Lernen_BFSting_23_00"); //Die Fliege hat am R�cken eine weiche Stelle.
		AI_Output(self, hero, "Info_Mod_Torgan_Lernen_BFSting_23_01"); //Wenn du dort mit der Hand gegen dr�ckst, f�hrt der Stachel sehr weit aus und du kannst ihn mit dem Messer abtrennen.
	};

	Info_Mod_Torgan_Lernen_ShowOptions();
};

FUNC void Info_Mod_Torgan_Lernen_Fur()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_Fur))
	{
		AI_Output(self, hero, "Info_Mod_Torgan_Lernen_Fur_23_00"); //Felle ziehst du am besten ab, indem du einen tiefen Schnitt an den Hinterl�ufen des Tieres vornimmst.
		AI_Output(self, hero, "Info_Mod_Torgan_Lernen_Fur_23_01"); //Dann kannst du das Fell von vorne nach hinten eigentlich immer sehr leicht abziehen.
	};

	Info_Mod_Torgan_Lernen_ShowOptions();
};

FUNC void Info_Mod_Torgan_Lernen_TrollTeeth()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_TrollTeeth))
	{
	};

	Info_Mod_Torgan_Lernen_ShowOptions();
};

FUNC void Info_Mod_Torgan_Lernen_SwampSharkTeeth()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_SwampSharkTeeth))
	{
	};

	Info_Mod_Torgan_Lernen_ShowOptions();
};

FUNC void Info_Mod_Torgan_Lernen_ReptileSkin()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_ReptileSkin))
	{
		AI_Output(self, hero, "Info_Mod_Torgan_Lernen_ReptileSkin_23_00"); //Wenn du die Haut an den Seiten anschneidest, l�st sie sich wie von selbst. Du solltest ab jetzt kein Problem mehr haben, Echsen zu h�uten.
	};

	Info_Mod_Torgan_Lernen_ShowOptions();
};

FUNC void Info_Mod_Torgan_Lernen_Heart()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_Heart))
	{
		AI_Output(self, hero, "Info_Mod_Torgan_Lernen_Heart_23_00"); //Ein Herz entfernst du dem Tier mit einem gekonnten Schnitt in die Brust. Lohnt sich aber h�ufig nur bei besonderen Tieren oder magischen Wesen.
	};

	Info_Mod_Torgan_Lernen_ShowOptions();
};

FUNC void Info_Mod_Torgan_Lernen_ShadowHorn()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_ShadowHorn))
	{
	};

	Info_Mod_Torgan_Lernen_ShowOptions();
};

FUNC void Info_Mod_Torgan_Lernen_FireTongue()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_FireTongue))
	{
		AI_Output(self, hero, "Info_Mod_Torgan_Lernen_FireTongue_23_00"); //Die Zunge von einem Feuerwaran schl�gst du mit einem Messerhieb aus dem Maul, w�hrend du sie mit der anderen Hand festh�ltst.
	};

	Info_Mod_Torgan_Lernen_ShowOptions();
};

FUNC void Info_Mod_Torgan_Lernen_BFWing()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_BFWing))
	{
		AI_Output(self, hero, "Info_Mod_Torgan_Lernen_BFWing_23_00"); //Die Fl�gel einer Fliege entfernst du am besten mit einem Hieb einer scharfen Klinge sehr nah am K�rper der Fliege.
		AI_Output(self, hero, "Info_Mod_Torgan_Lernen_BFWing_23_01"); //Du musst nur darauf achten, dass du das feine Gewebe der Fl�gel nicht verletzt. Sie sind nichts mehr wert, wenn du es nicht vorsichtig machst.
	};

	Info_Mod_Torgan_Lernen_ShowOptions();
};

FUNC void Info_Mod_Torgan_Lernen_Mandibles()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_Mandibles))
	{
		AI_Output(self, hero, "Info_Mod_Torgan_Lernen_Mandibles_23_00"); //Klar, nachdem du das Vieh get�tet hast, packst du es an den Bei�zangen und rei�t sie gerade heraus. Dann kommt die Sekretdr�se mit raus, ohne zu zerrei�en.
		AI_Output(self, hero, "Info_Mod_Torgan_Lernen_Mandibles_23_01"); //Ich habe �brigens geh�rt, dass das so auch mit Feldr�ubern klappen soll.
	};

	Info_Mod_Torgan_Lernen_ShowOptions();
};

FUNC void Info_Mod_Torgan_Lernen_DrgSnapperHorn()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, hero, TROPHY_DrgSnapperHorn))
	{
		AI_Output(self, hero, "Info_Mod_Torgan_Lernen_DrgSnapperHorn_23_00"); //Am Stirnansatz des Drachensnappers ist die beste Stelle, ihm das Horn mit einem stabilen Messer aus dem Sch�del zu trennen.
	};

	Info_Mod_Torgan_Lernen_ShowOptions();
};

INSTANCE Info_Mod_Torgan_Pickpocket (C_INFO)
{
	npc		= Mod_1963_JG_Torgan_MT;
	nr		= 1;
	condition	= Info_Mod_Torgan_Pickpocket_Condition;
	information	= Info_Mod_Torgan_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Torgan_Pickpocket_Condition()
{
	C_Beklauen	(105, ItMi_Gold, 39);
};

FUNC VOID Info_Mod_Torgan_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Torgan_Pickpocket);

	Info_AddChoice	(Info_Mod_Torgan_Pickpocket, DIALOG_BACK, Info_Mod_Torgan_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Torgan_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Torgan_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Torgan_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Torgan_Pickpocket);
};

FUNC VOID Info_Mod_Torgan_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Torgan_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Torgan_Pickpocket);

		Info_AddChoice	(Info_Mod_Torgan_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Torgan_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Torgan_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Torgan_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Torgan_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Torgan_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Torgan_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Torgan_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Torgan_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Torgan_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Torgan_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Torgan_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Torgan_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Torgan_EXIT (C_INFO)
{
	npc		= Mod_1963_JG_Torgan_MT;
	nr		= 1;
	condition	= Info_Mod_Torgan_EXIT_Condition;
	information	= Info_Mod_Torgan_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Torgan_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Torgan_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};