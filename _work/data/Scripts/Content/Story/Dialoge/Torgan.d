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
	AI_Output(self, hero, "Info_Mod_Torgan_Hi_13_00"); //Halt, keinen Schritt weiter. Was willst du hier?
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
	AI_Output(self, hero, "Info_Mod_Torgan_Dragomir_13_01"); //Von Dragomir? Erzähle, wie sieht es in Khorinis aus?
	AI_Output(hero, self, "Info_Mod_Torgan_Dragomir_15_02"); //Es sieht schlecht bei ihm aus. Sein Lager wurde vor einigen Nächten von Schwarzmagiern und Banditen überfallen.
	AI_Output(hero, self, "Info_Mod_Torgan_Dragomir_15_03"); //Jetzt hat er sich in ein neues Lager bei der alten Mine im dunklen Wald aufgebaut.
	AI_Output(self, hero, "Info_Mod_Torgan_Dragomir_13_04"); //Das klingt nicht gut. Ich danke dir für diese wichtige Information. Wir werden den Vorfall besprechen.
	AI_Output(self, hero, "Info_Mod_Torgan_Dragomir_13_05"); //In der Zwischenzeit hätte ich noch eine Aufgabe für dich. Hast du interesse?

	Log_CreateTopic	(TOPIC_MOD_JG_EREMITENCAMP, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_JG_EREMITENCAMP, LOG_RUNNING);
	B_LogEntry_More	(TOPIC_MOD_JG_LAGER, TOPIC_MOD_JG_EREMITENCAMP, "Ich habe Torgan von den Vorfällen in Khorinis erzählt. Sie werden den Vorfall besprechen.", "Ich kann nicht in das Lager der Druiden. Ich werde versuchen müssen, mir den Zugang zu erarbeiten.");
	B_SetTopicStatus	(TOPIC_MOD_JG_LAGER, LOG_SUCCESS);

	B_Göttergefallen(2, 1);
};

INSTANCE Info_Mod_Torgan_Zwischenzeit (C_INFO)
{
	npc		= Mod_1963_JG_Torgan_MT;
	nr		= 1;
	condition	= Info_Mod_Torgan_Zwischenzeit_Condition;
	information	= Info_Mod_Torgan_Zwischenzeit_Info;
	permanent	= 0;
	important	= 0;
	description	= "Lass hören.";
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
	AI_Output(hero, self, "Info_Mod_Torgan_Zwischenzeit_15_00"); //Lass hören.
	AI_Output(self, hero, "Info_Mod_Torgan_Zwischenzeit_13_01"); //Ich habe lange nichts mehr von unseren Spähern hier im Minental gehört. Schau bitte nach ihnen und frage nach, ob sie neue Informationen haben.

	Info_ClearChoices	(Info_Mod_Torgan_Zwischenzeit);

	Info_AddChoice	(Info_Mod_Torgan_Zwischenzeit, "In Ordnung.", Info_Mod_Torgan_Zwischenzeit_B);
	Info_AddChoice	(Info_Mod_Torgan_Zwischenzeit, "In Ordnung, was bekomme ich dafür?", Info_Mod_Torgan_Zwischenzeit_A);
};

FUNC VOID Info_Mod_Torgan_Zwischenzeit_B()
{
	AI_Output(hero, self, "Info_Mod_Torgan_Zwischenzeit_B_15_00"); //In Ordnung.
	AI_Output(self, hero, "Info_Mod_Torgan_Zwischenzeit_B_13_01"); //Gut, das Lager der Späher liegt ziemlich in der Mitte des Tales an einem Pfad, der vom Alten Lager ins Neue Lager führt.
	AI_Output(self, hero, "Info_Mod_Torgan_Zwischenzeit_B_13_02"); //Nimm diese Spruchrolle, mit ihr kannst du dich wieder zu mir teleportieren.

	B_GiveInvItems	(self, hero, ItSc_TeleportTorgan, 1);

	Log_CreateTopic	(TOPIC_MOD_JG_TORGANSINFOS, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_JG_TORGANSINFOS, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_JG_TORGANSINFOS, "Torgan möchte, dass ich bei den Späher, welche ihr Lager etwa in der Mitte des Minentals bei einem Pfad vom alten Lager ins neue Lager haben, nach neuen Informationen frage.");

	Wld_InsertNpc	(Mod_1966_GRD_Gardist_MT, "OC1");
	B_KillNpc	(Mod_1966_GRD_Gardist_MT);
	B_KillNpc	(Mod_1964_JG_Jaeger_MT);
	B_KillNpc	(Mod_1965_JG_Jaeger_MT);

	Mod_Drago = 5;

	Info_ClearChoices	(Info_Mod_Torgan_Zwischenzeit);
};

FUNC VOID Info_Mod_Torgan_Zwischenzeit_A()
{
	AI_Output(hero, self, "Info_Mod_Torgan_Zwischenzeit_A_15_00"); //In Ordnung, was bekomme ich dafür?
	AI_Output(self, hero, "Info_Mod_Torgan_Zwischenzeit_A_13_01"); //Unseren Dank als Waldläufer.
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
	AI_Output(self, hero, "Info_Mod_Torgan_SpaeherTot_13_01"); //Und was haben sie gesagt?

	Info_ClearChoices	(Info_Mod_Torgan_SpaeherTot);

	Info_AddChoice	(Info_Mod_Torgan_SpaeherTot, "Sie sind tot. Ich habe aber die Leiche eines Gardisten bei ihnen gesehen.", Info_Mod_Torgan_SpaeherTot_B);
	Info_AddChoice	(Info_Mod_Torgan_SpaeherTot, "Nichts, sie waren stumm wie eine Leiche.", Info_Mod_Torgan_SpaeherTot_A);
};

FUNC VOID Info_Mod_Torgan_SpaeherTot_C()
{
	AI_Output(hero, self, "Info_Mod_Torgan_SpaeherTot_C_15_00"); //Ja.
	AI_Output(self, hero, "Info_Mod_Torgan_SpaeherTot_C_13_01"); //Das kann ich kaum glauben. Bisher haben wir mit den Gardisten immer in relativer Ruhe gelebt.
	AI_Output(self, hero, "Info_Mod_Torgan_SpaeherTot_C_13_02"); //Ich verstehe nicht, warum sie unsere Späher angreifen sollten. Ich muss dies sofort weitergeben.
	AI_Output(self, hero, "Info_Mod_Torgan_SpaeherTot_C_13_03"); //Dass die Sachen jetzt beinahe gleichzeitig passieren, kann kein Zufall sein. Da muss mehr dahinter stecken.
	AI_Output(self, hero, "Info_Mod_Torgan_SpaeherTot_C_13_04"); //Hier, nimm dies als Entlohnung für deine Mühe.

	CreateInvItems	(self, ItWr_Bauplan_Wolfsring_Leben, 1);
	B_GiveInvItems	(self, hero, ItWr_Bauplan_Wolfsring_Leben, 1);

	B_GivePlayerXP	(250);

	B_LogEntry	(TOPIC_MOD_JG_TORGANSINFOS, "Ich habe Torgan von den toten Spähern berichtet. Er schien sehr beunruhigt.");
	B_SetTopicStatus	(TOPIC_MOD_JG_TORGANSINFOS, LOG_SUCCESS);

	B_Göttergefallen(2, 1);
};

FUNC VOID Info_Mod_Torgan_SpaeherTot_B()
{
	AI_Output(hero, self, "Info_Mod_Torgan_SpaeherTot_B_15_00"); //Sie sind tot. Ich habe aber die Leiche eines Gardisten bei ihnen gesehen.
	AI_Output(self, hero, "Info_Mod_Torgan_SpaeherTot_B_13_01"); //Was sagst du? Sie sind tot? ... einen Gardisten sagst du?

	Info_ClearChoices	(Info_Mod_Torgan_SpaeherTot);

	Info_Mod_Torgan_SpaeherTot_C();
};

FUNC VOID Info_Mod_Torgan_SpaeherTot_A()
{
	AI_Output(hero, self, "Info_Mod_Torgan_SpaeherTot_A_15_00"); //Nichts, sie waren stumm wie eine Leiche.
	AI_Output(self, hero, "Info_Mod_Torgan_SpaeherTot_A_13_01"); //Was sagst du da? Diese verdammten Nichtsnutze ... rauchen den ganzen Tag Sumpfkraut oder nehmen dieses neue Rauschmittel. Diese unzuerlässigen ...
	AI_Output(hero, self, "Info_Mod_Torgan_SpaeherTot_A_15_02"); //Hey, mach mal halblang. Sie sind tot und nicht benebelt! Neben ihnen haben ich noch die Leiche eines Gardisten gefunden.
	AI_Output(self, hero, "Info_Mod_Torgan_SpaeherTot_A_13_03"); //Wieso sagst du soetwas nicht gleich, verdammt? Sie sind tot? Und ein Gardist soll neben ihnen ebenfalls tot rumliegen?

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
	AI_Output(self, hero, "Info_Mod_Torgan_GardistenZettel_13_00"); //Warst du schon bei den anderen Lagern?
	AI_Output(hero, self, "Info_Mod_Torgan_GardistenZettel_15_01"); //Ja.
	AI_Output(self, hero, "Info_Mod_Torgan_GardistenZettel_13_02"); //Hast du was neues herausgefunden?

	if (Npc_KnowsInfo(hero, Info_Mod_Torwache_Sekte_01_GardistenInfos))
	{
		AI_Output(hero, self, "Info_Mod_Torgan_GardistenZettel_15_03"); //Beim Sektenlager ist nichts außergewöhnliches vorgefallen.
		AI_Output(self, hero, "Info_Mod_Torgan_GardistenZettel_13_04"); //Das war zu erwarten. Bei denen dauert es immer eine Weile, bis sie es mitbekommen.

		B_GivePlayerXP	(500);
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Torwache_AL_01_Halt))
	{
		AI_Output(hero, self, "Info_Mod_Torgan_GardistenZettel_15_05"); //Beim Alten Lager konnte ich nichts weiter herausfinden.
		AI_Output(self, hero, "Info_Mod_Torgan_GardistenZettel_13_06"); //Nichts? Hm. Wir müssen herausfinden, ob sie wirklich nichts damit zu tun haben, oder ob sie sich doch nur verstellen. Zuzutrauen ist ihnen alles.

		B_GivePlayerXP	(500);
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Torwache_NL_01_GardistenInfos))
	{
		AI_Output(hero, self, "Info_Mod_Torgan_GardistenZettel_15_07"); //Ein Wächter des Neuen Lagers wurde von Unbekannten beschossen.
		AI_Output(self, hero, "Info_Mod_Torgan_GardistenZettel_13_08"); //Das Neue Lager wurde einfach beschossen? Weiß man mehr darüber?

		if (Npc_KnowsInfo(hero, Info_Mod_Nodrak_BierInfos))
		{
			AI_Output(hero, self, "Info_Mod_Torgan_GardistenZettel_15_09"); //Die Banditen und die Waldläufer werden verdächtigt, den feigen Angriff begangen zu haben.
			AI_Output(self, hero, "Info_Mod_Torgan_GardistenZettel_13_10"); //Das ist bedenklich. Wir müssen schnell reagieren und diesen Irrtum gar nicht erst wachsen lassen.

			if (Npc_KnowsInfo(hero, Info_Mod_Hecta_Hi))
			{
				AI_Output(hero, self, "Info_Mod_Torgan_GardistenZettel_15_11"); //Ich glaube ich habe die beiden Schützen gestellt.
				AI_Output(self, hero, "Info_Mod_Torgan_GardistenZettel_13_12"); //Das ist wenigstens eine erfreuliche Nachricht. Damit wird es uns leichter fallen, unseren Standpunkt zu behaupten.
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
		AI_Output(hero, self, "Info_Mod_Torgan_GardistenZettel_15_14"); //Ein paar Gardisten sind bei dem Banditenlager aufgetaucht, wurden von ihnen jedoch getötet.
		AI_Output(self, hero, "Info_Mod_Torgan_GardistenZettel_13_15"); //Das verstärkt meine Vermutung, dass es vielleicht gar keine Gardisten sind. Keiner von ihnen würde einfach so in der Nähe der Banditen herumstreifen.


		B_GivePlayerXP	(500);
	};

	AI_Output(self, hero, "Info_Mod_Torgan_GardistenZettel_13_16"); //Trotz all den Informationen reicht es noch nicht. Wir brauchen etwas Handfestes, um einen Hinweis zu bekommen!
	AI_Output(self, hero, "Info_Mod_Torgan_GardistenZettel_13_17"); //Die ganze Situation ist noch zu undurchsichtig, um konkrete Vermutungen anstellen zu können.
	AI_Output(self, hero, "Info_Mod_Torgan_GardistenZettel_13_18"); //Gibt es noch mehr, was uns einen Hinweis auf den Täter geben könnte?

	if (Npc_HasItems(hero, ItWr_MagicPaper) == 1)
	{
		if (Mod_SanchoHatZettel == 2)
		{
			AI_Output(hero, self, "Info_Mod_Torgan_GardistenZettel_15_19"); //Ja, hier, diesen Zettel habe ich von den Banditen. Er stammt von einem der getöteten Gardisten.
		}
		else
		{
			AI_Output(hero, self, "Info_Mod_Torgan_GardistenZettel_15_20"); //Ja, hier, diesen Zettel habe ich gefunden. Er stammt von den Gardisten, die das Neue Lager überfallen haben.
		};
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Torgan_GardistenZettel_15_21"); //Ja, diese beiden Zettel habe ich gefunden.
		AI_Output(hero, self, "Info_Mod_Torgan_GardistenZettel_15_22"); //Einer stammt von den Gardisten, die das Neue Lager überfallen haben, der andere von den Banditen. Sie haben ihn bei einem der getöteten Gardisten gefunden.
	};

	AI_Output(self, hero, "Info_Mod_Torgan_GardistenZettel_13_23"); //Wunderbar, kann ich ihn mal sehen?

	B_GiveInvItems	(hero, self, ItWr_MagicPaper, 1);
	B_UseFakeScroll	();

	AI_Output(self, hero, "Info_Mod_Torgan_GardistenZettel_13_24"); //Dieser Zettel ist eindeutig magischer Natur. Bitte nimm ihn zurück und bringe ihn dem Druiden Cyrco.
	AI_Output(self, hero, "Info_Mod_Torgan_GardistenZettel_13_25"); //Du hast die dir anvertrauten Aufgaben mit großem Erfolg erledigt. Von nun an ist dir der Zutritt zu unserem Lager erlaubt, da du uns dein Vertrauen bewiesen hast. Bitte tritt ein.

	B_GiveInvItems	(self, hero, ItWr_MagicPaper, 1);

	B_LogEntry_More	(TOPIC_MOD_JG_GARDISTEN, TOPIC_MOD_JG_EREMITENCAMP, "Ich habe Torgan von den Geschehnissen berichtet. Er ist sehr zufrieden mit den Informationen und ich darf nun endlich das Lager betreten.", "Dank meiner Verdienste darf ich jetzt in das Lager der Druiden.");

	B_GivePlayerXP	(500);

	B_SetTopicStatus	(TOPIC_MOD_JG_EREMITENCAMP, LOG_SUCCESS);

	B_Göttergefallen(2, 2);
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
	AI_Output(self, hero, "Info_Mod_Torgan_InsLager_13_01"); //Nein, noch nicht.
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
	AI_Output(self, hero, "Info_Mod_Torgan_SomethingInteresting_13_01"); //Erst Dragomir und nun unsere Späher. Du bringst nicht gerade positive Neuigkeiten, das reicht mir erstmal!
};

INSTANCE Info_Mod_Torgan_NochEinAuftrag (C_INFO)
{
	npc		= Mod_1963_JG_Torgan_MT;
	nr		= 1;
	condition	= Info_Mod_Torgan_NochEinAuftrag_Condition;
	information	= Info_Mod_Torgan_NochEinAuftrag_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kann ich für euch noch irgendetwas erledigen?";
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
	AI_Output(hero, self, "Info_Mod_Torgan_NochEinAuftrag_15_00"); //Kann ich für euch noch irgendetwas erledigen?
	AI_Output(self, hero, "Info_Mod_Torgan_NochEinAuftrag_13_01"); //Ich muss zugeben, dass mir nicht ganz wohl dabei ist, Aufgaben an einen Außenstehenden zu verteilen. Doch es scheint, als bliebe mir keine Wahl.
	AI_Output(self, hero, "Info_Mod_Torgan_NochEinAuftrag_13_02"); //Deine Zuverlässigkeit hast du ja bereits bewiesen, ich erwarte von dir äußerste Diskretion über unsere Angelegenheiten.
	AI_Output(hero, self, "Info_Mod_Torgan_NochEinAuftrag_15_03"); //Natürlich.
	AI_Output(self, hero, "Info_Mod_Torgan_NochEinAuftrag_13_04"); //Gut, dann pass auf. Wir müssen unbedingt mehr über diese angeblichen Gardisten herausfinden.
	AI_Output(self, hero, "Info_Mod_Torgan_NochEinAuftrag_13_05"); //Ich kann mir einfach nicht vorstellen, dass das alte Lager uns angreifen sollte und dann die Leiche ihres Kumpanen einfach dort mitsamt Ausrüstung liegen lassen.
	AI_Output(self, hero, "Info_Mod_Torgan_NochEinAuftrag_13_06"); //Bringe in Erfahrung, ob jemand in den anderen Lagern des Minentals mehr über diese „Gardisten“ weiß. Am besten fragst du bei den jeweiligen Torwächtern des Sektenlagers, alten Lagers und Neuen Lagers nach.
	AI_Output(self, hero, "Info_Mod_Torgan_NochEinAuftrag_13_07"); //Beim Alten Lager solltest du besonders vorsichtig sein, wie ich hörte, gibt es dort einige Spannungen.
	AI_Output(self, hero, "Info_Mod_Torgan_NochEinAuftrag_13_08"); //Geh auch ruhig zu den Banditen, falls du weißt, wo diese sich aufhalten. In den letzten Meldungen der Späher haben sie angeblich welche im Süden gesehen.
	AI_Output(self, hero, "Info_Mod_Torgan_NochEinAuftrag_13_09"); //Sobald du etwas herausgefunden hast, komm sofort zu uns zurück.
	AI_Output(hero, self, "Info_Mod_Torgan_NochEinAuftrag_15_10"); //Ich bin schon unterwegs!
	AI_Output(self, hero, "Info_Mod_Torgan_NochEinAuftrag_13_11"); //Und hier, nimm diese Geschwindigkeitstränke. Ich denke, du wirst sie brauchen können.

	CreateInvItems	(self, ItPo_Speed, 4);
	B_GiveInvItems	(self, hero, ItPo_Speed, 4);

	AI_Output(self, hero, "Info_Mod_Torgan_NochEinAuftrag_13_12"); //Und eine Spruchrolle habe ich auch wieder für dich.

	B_GiveInvItems	(self, hero, ItSc_TeleportTorgan, 1);

	Log_CreateTopic	(TOPIC_MOD_JG_GARDISTEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_JG_GARDISTEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_JG_GARDISTEN, "Torgan will, dass ist mehr über die Gardisten rausfinde. Dazu soll ich die Torwächter der verschiedenen Lager hier im Minental nach Informationen befragen. Ich sollte mich aber beim alten Lager in Acht nehmen.");
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
	AI_Output(self, hero, "Info_Mod_Torgan_Scharmuetzel_13_00"); //Wer waren die? Was wollten die? Die haben kein Wort geredet.
	AI_Output(hero, self, "Info_Mod_Torgan_Scharmuetzel_15_01"); //Vielleicht weiß Cyrco was. Mal sehen.
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
	AI_Output(self, hero, "Info_Mod_Torgan_Turm_13_00"); //Eh. Gut, dass du kommst. Wulfgar will dich sprechen.
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
	AI_Output(self, hero, "Info_Mod_Torgan_Turm2_13_00"); //Du schon wieder.
	AI_Output(hero, self, "Info_Mod_Torgan_Turm2_15_01"); //Ich muss ...
	AI_Output(self, hero, "Info_Mod_Torgan_Turm2_13_02"); //Moment. Hörst du den Kerl da oben im Turm?
	AI_Output(self, hero, "Info_Mod_Torgan_Turm2_13_03"); //Der schreit sich schier die Lunge aus dem Leib.
	AI_Output(hero, self, "Info_Mod_Torgan_Turm2_15_04"); //Na und? Soll er doch. Ich muss ...
	AI_Output(self, hero, "Info_Mod_Torgan_Turm2_13_05"); //Geh doch mal eben raus und frag, was er will. Hast auch was gut bei mit.

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
	AI_Output(self, hero, "Info_Mod_Torgan_WeicheFelle_13_00"); //Und? Was will der Schreihals?
	AI_Output(hero, self, "Info_Mod_Torgan_WeicheFelle_15_01"); //Ein Fell. Ein warmes, weiches Fell.
	AI_Output(self, hero, "Info_Mod_Torgan_WeicheFelle_13_02"); //Soll er sich bewegen. Da wird ihm warm. Oder nein.
	AI_Output(self, hero, "Info_Mod_Torgan_WeicheFelle_13_03"); //Ich hab gehört, dass der Alchemist was Neues mit den Fellen macht. Frag den mal.
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
	AI_Output(self, hero, "Info_Mod_Torgan_Nahkampf_13_00"); //Na. Wieder auf zu neuen Abenteuern?
	AI_Output(hero, self, "Info_Mod_Torgan_Nahkampf_15_01"); //Abenteuer? Neues Lager ist besser. Neue Leute beschaffen.
	AI_Output(self, hero, "Info_Mod_Torgan_Nahkampf_13_02"); //Da kannst du gleich mal da draußen schauen. Da lungert so ein Typ rum. Könnte ein Söldner sein.
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
	AI_Output(self, hero, "Info_Mod_Torgan_Nahkampf2_13_00"); //Schöner Tag heute.
	AI_Output(hero, self, "Info_Mod_Torgan_Nahkampf2_15_01"); //Ich weiß nicht. Auf jeden Fall wieder mal anstrengend.
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
	AI_Output(self, hero, "Info_Mod_Torgan_Sweetwater_13_00"); //Nanu, schon wieder weg? Bist doch eben erst gekommen.
	AI_Output(hero, self, "Info_Mod_Torgan_Sweetwater_15_01"); //Wie du siehst. Einer muss ja was tun ...
	AI_Output(self, hero, "Info_Mod_Torgan_Sweetwater_13_02"); //Hmm ...
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
	AI_Output(self, hero, "Info_Mod_Torgan_Drachental_13_00"); //Diesmal warst du aber lange weg. Was war los?
	AI_Output(hero, self, "Info_Mod_Torgan_Drachental_15_01"); //Stress ohne Ende. Bei Gelegenheit erzähl ich's dir.
	AI_Output(self, hero, "Info_Mod_Torgan_Drachental_13_02"); //Dein Wort in Adanos Ohr!
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

		AI_Output(self, hero, "Info_Mod_Torgan_AlterMann_13_00"); //Ahh, du meinst den alten Mann des Waldes. Ja, etwas weiß ich über ihn.
		AI_Output(self, hero, "Info_Mod_Torgan_AlterMann_13_01"); //Er soll Jahrhunderte alt sein und die Tiere des Waldes Rund um Khorata behüten.
		AI_Output(self, hero, "Info_Mod_Torgan_AlterMann_13_02"); //Zwar sagt man, er sei blind, jedoch gleichzeitig auch magisch begabt.
		AI_Output(self, hero, "Info_Mod_Torgan_AlterMann_13_03"); //Mehr fällt mir gerade nicht ein. Vielleicht weiß ein anderer mehr.

		B_LogEntry	(TOPIC_MOD_BDT_ALTERMANN, "Von dem ersten Waldläufer erfuhr ich nicht viel Neues. Der alte Mann des Waldes, behütet die Tiere, er ist uralt, blind und magisch begabt. Vielleicht weiß ein anderer Waldläufer mehr.");
	}
	else if (Mod_BDT_AlterWaldMann == 1)
	{
		B_Say	(hero, self, "$ALTERWALDMANN02");

		AI_Output(self, hero, "Info_Mod_Torgan_AlterMann_13_04"); //Der alte Mann des Waldes? Ja, ich hörte er solle einst ein Diener Adanos gewesen sein.
		AI_Output(self, hero, "Info_Mod_Torgan_AlterMann_13_05"); //Wobei unklar ist, ob er ein Waldläufer war wie wir, ein Magier des Wassers, oder ein Verwandlungsmagier.
		AI_Output(self, hero, "Info_Mod_Torgan_AlterMann_13_06"); //Seine magischen Fähigkeiten, wie auch seine starke Bindung zur Tier- und Pflanzenwelt zeugen davon, dass er von allem etwas hat.

		B_LogEntry	(TOPIC_MOD_BDT_ALTERMANN, "Beim 2ten Waldläufer erfuhr ich auch nicht viel wissenswertes. Der alte Mann des Waldes soll Adanos und der Schöpfung verbunden sein, allem voran der Tier und Pflanzenwelt.");
	}
	else if (Mod_BDT_AlterWaldMann == 2)
	{
		B_Say	(hero, self, "$ALTERWALDMANN03");

		AI_Output(self, hero, "Info_Mod_Torgan_AlterMann_13_07"); //Tja, viel kann ich dir nicht über ihn verraten.
		AI_Output(self, hero, "Info_Mod_Torgan_AlterMann_13_08"); //Das Problem besteht auch darin, dass er mit keinem Menschen spricht, nicht mal mit uns, auch, wenn wir eigentlich ähnliche Ziele verfolgen.
		AI_Output(self, hero, "Info_Mod_Torgan_AlterMann_13_09"); //Allein mit den Tieren des Waldes unterhält er sich.
		AI_Output(self, hero, "Info_Mod_Torgan_AlterMann_13_10"); //Tja, wenn ich ein Keiler wäre, könnte ich dir bestimmt mehr über ihn verraten.

		B_LogEntry	(TOPIC_MOD_BDT_ALTERMANN, "Acha, das könnte ein wichtiger Hinweis gewesen sein. Der alte Mann des Waldes meidet Menschen gänzlich, spricht nur mit Tieren.");
	}
	else if (Mod_BDT_AlterWaldMann == 3)
	{
		B_Say	(hero, self, "$ALTERWALDMANN04");

		AI_Output(self, hero, "Info_Mod_Torgan_AlterMann_13_11"); //Der alte Mann des Waldes? Nun, er soll in enger Beziehung zur Tier- und Pflanzenwelt stehen.
		AI_Output(self, hero, "Info_Mod_Torgan_AlterMann_13_12"); //Man sagt, er leite Rudeltiere wie Keiler, oder Wölfe dazu an, den Wald gegen Eindringlinge zu beschützen.
		AI_Output(self, hero, "Info_Mod_Torgan_AlterMann_13_13"); //Selbst, so sagt man, fände man ihn häufig in Gestalt eines grünen Wolfes vor.

		B_LogEntry	(TOPIC_MOD_BDT_ALTERMANN, "Er soll vor allem auch größere Rudeltiere wie Keiler und Wölfe dazu anleiten den Wald gegen Eindringlinge zu beschützen.");
	}
	else if (Mod_BDT_AlterWaldMann == 4)
	{
		B_Say	(hero, self, "$ALTERWALDMANN05");

		AI_Output(self, hero, "Info_Mod_Torgan_AlterMann_13_14"); //Du interessierst dich für Geschichten über den alten Mann des Waldes?
		AI_Output(self, hero, "Info_Mod_Torgan_AlterMann_13_15"); //Nun, viel weiß ich nicht über diesen mystischen Kauz.
		AI_Output(self, hero, "Info_Mod_Torgan_AlterMann_13_16"); //Er soll sich meistens im dunklen Wald aufhalten, aber auch immer in der Nähe von Gewässern, wie Seen.
		AI_Output(self, hero, "Info_Mod_Torgan_AlterMann_13_17"); //Selten hat ihn jemand zu Gesicht bekommen ...

		B_LogEntry	(TOPIC_MOD_BDT_ALTERMANN, "Man findet ihn höchst wahrscheinlich im dichten Wald Khorata’s in der Nähe eines Sees.");
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
	description	= "Wieso seid ihr Jäger hier im Minental?";
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
	AI_Output(hero, self, "Info_Mod_Torgan_Asylanten_15_00"); //Wieso seid ihr Jäger hier im Minental?
	AI_Output(self, hero, "Info_Mod_Torgan_Asylanten_13_01"); //Na, wegen unseres Berufs.
	AI_Output(self, hero, "Info_Mod_Torgan_Asylanten_13_02"); //Das Minental ist ein gefährlicher Ort, und die Lager senden nur wenige eigene Jäger aus, sodass es hier fette Beute für uns zu machen gibt.
	AI_Output(hero, self, "Info_Mod_Torgan_Asylanten_15_03"); //Habt ihr schon Kontakt zu anderen Lagern gehabt?
	AI_Output(self, hero, "Info_Mod_Torgan_Asylanten_13_04"); //Nicht viel. Die meisten sind doch Schwerverbrecher, mit denen wollen wir nichts zu tun haben.

	B_LogEntry	(TOPIC_MOD_HAGEN_ASYLANTEN, "Einen Trupp Jäger hat es auch in das Minental verschlagen. Er ist jedoch nur zum Jagen da und tritt kaum in Kontakt mit den anderen Gruppierungen.");
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
	AI_Output(self, hero, "Info_Mod_Torgan_WerBistDu_13_01"); //Mein Name ist Torgan und ich bin angewiesen, niemanden Unbekannten hereinzulassen.
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
	AI_Output(self, hero, "Info_Mod_Torgan_WasBewachstDu_13_01"); //Wir sind Waldläufer und Jäger, hier befindet sich zur Zeit eines unserer Lager, die von niemandem Fremden betreten werden sollen.
};

INSTANCE Info_Mod_Torgan_Wegschauen (C_INFO)
{
	npc		= Mod_1963_JG_Torgan_MT;
	nr		= 1;
	condition	= Info_Mod_Torgan_Wegschauen_Condition;
	information	= Info_Mod_Torgan_Wegschauen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Könntest du nicht eine kleine Ausnahme machen und kurz in eine Andere Richtung schaun?";
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
	AI_Output(hero, self, "Info_Mod_Torgan_Wegschauen_15_00"); //Könntest du nicht eine kleine Ausnahme machen und kurz in eine Andere Richtung schaun?
	AI_Output(self, hero, "Info_Mod_Torgan_Wegschauen_13_01"); //Nein! Kannst du nicht zuhören? Vielleicht haben einige Jagdtrupps von uns was für dich zu tun, sie mal bei denen nach.
	AI_Output(self, hero, "Info_Mod_Torgan_Wegschauen_13_02"); //Bei Dragomir in Khorinis findest du eigentlich immer genug.
};

INSTANCE Info_Mod_Torgan_Pickpocket (C_INFO)
{
	npc		= Mod_1963_JG_Torgan_MT;
	nr		= 1;
	condition	= Info_Mod_Torgan_Pickpocket_Condition;
	information	= Info_Mod_Torgan_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Torgan_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 100);
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