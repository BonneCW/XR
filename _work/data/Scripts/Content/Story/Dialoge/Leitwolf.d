INSTANCE Info_Mod_Leitwolf_Hi (C_INFO)
{
	npc		= Monster_11060_Leitwolf_TUG;
	nr		= 1;
	condition	= Info_Mod_Leitwolf_Hi_Condition;
	information	= Info_Mod_Leitwolf_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Leitwolf_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Leitwolf_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Leitwolf_Hi_09_00"); //Was willst du hier?

	Info_ClearChoices	(Info_Mod_Leitwolf_Hi);

	Info_AddChoice	(Info_Mod_Leitwolf_Hi, "Verzieh dich du räudiger Köter.", Info_Mod_Leitwolf_Hi_C);
	Info_AddChoice	(Info_Mod_Leitwolf_Hi, "Du bist hier nicht gerne gesehen.", Info_Mod_Leitwolf_Hi_B);
	Info_AddChoice	(Info_Mod_Leitwolf_Hi, "Würde es dir etwas ausmachen, das Tal wieder zu verlassen?", Info_Mod_Leitwolf_Hi_A);
};

FUNC VOID Info_Mod_Leitwolf_Hi_F()
{
	AI_Output(self, hero, "Info_Mod_Leitwolf_Hi_F_09_00"); //Willst du unbedingt so enden wie alle anderen 	im Umkreis von zehn Metern?

	Info_ClearChoices	(Info_Mod_Leitwolf_Hi);

	if (Mod_WM_IsWarg == 1)
	{
		Info_AddChoice	(Info_Mod_Leitwolf_Hi, "Dann komm mal her, großer böser Wolf.", Info_Mod_Leitwolf_Hi_H);
		Info_AddChoice	(Info_Mod_Leitwolf_Hi, "Vielleicht können wir das ja friedlich lösen.", Info_Mod_Leitwolf_Hi_G);
	}
	else
	{
		Mod_VMG_Pruefung_Leitwolf = 1;

		B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "Ich musste den Leitwolf umbringen. Hoffentlich kann die Aufgabe trotzdem als erledigt angesehen werden. Ich sollte mit Asko darüber reden.");

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Leitwolf_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_Leitwolf_Hi_C_15_00"); //Verzieh dich du räudiger Köter.
	AI_Output(self, hero, "Info_Mod_Leitwolf_Hi_C_09_01"); //Was fällt dir ein? Wofür hältst du dich eigentlich?

	Info_ClearChoices	(Info_Mod_Leitwolf_Hi);

	if (Mod_WM_IsWarg == 1)
	{
		Info_AddChoice	(Info_Mod_Leitwolf_Hi, "Ich bin dir intellektuell überlegen, also ergib dich oder stirb.", Info_Mod_Leitwolf_Hi_E);
		Info_AddChoice	(Info_Mod_Leitwolf_Hi, "Wofür hältst du dich, hier einfach alles zu vernichten?", Info_Mod_Leitwolf_Hi_D);
	}
	else
	{
		Mod_VMG_Pruefung_Leitwolf = 1;

		B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "Ich musste den Leitwolf umbringen. Hoffentlich kann die Aufgabe trotzdem als erledigt angesehen werden. Ich sollte mit Asko darüber reden.");

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Leitwolf_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Leitwolf_Hi_B_15_00"); //Du bist hier nicht gerne gesehen.
	AI_Output(self, hero, "Info_Mod_Leitwolf_Hi_B_09_01"); //Sagt wer?

	Info_ClearChoices	(Info_Mod_Leitwolf_Hi);

	if (Mod_WM_IsWarg == 1)
	{
		Info_AddChoice	(Info_Mod_Leitwolf_Hi, "Die Verwandlungsmagier, um genau zu sein.", Info_Mod_Leitwolf_Hi_K);
		Info_AddChoice	(Info_Mod_Leitwolf_Hi, "Hast du nicht gehört? Ich sage es.", Info_Mod_Leitwolf_Hi_J);
	}
	else
	{
		Mod_VMG_Pruefung_Leitwolf = 1;

		B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "Ich musste den Leitwolf umbringen. Hoffentlich kann die Aufgabe trotzdem als erledigt angesehen werden. Ich sollte mit Asko darüber reden.");

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Leitwolf_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Leitwolf_Hi_A_15_00"); //Würde es dir etwas ausmachen, das Tal wieder zu verlassen?
	AI_Output(self, hero, "Info_Mod_Leitwolf_Hi_A_09_01"); //Wenn du schon so fragst ... ja. (lacht kehlig) Warum sollte ich das Tal verlassen?

	Info_ClearChoices	(Info_Mod_Leitwolf_Hi);

	if (Mod_WM_IsWarg == 1)
	{
		Info_AddChoice	(Info_Mod_Leitwolf_Hi, "Du bist hier nicht gerne gesehen.", Info_Mod_Leitwolf_Hi_B);
		Info_AddChoice	(Info_Mod_Leitwolf_Hi, "Du und deine Freunde, ihr zerstört den Frieden der Natur in diesem Tal.", Info_Mod_Leitwolf_Hi_M);
	}
	else
	{
		Mod_VMG_Pruefung_Leitwolf = 1;

		B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "Ich musste den Leitwolf umbringen. Hoffentlich kann die Aufgabe trotzdem als erledigt angesehen werden. Ich sollte mit Asko darüber reden.");

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Leitwolf_Hi_E()
{
	AI_Output(hero, self, "Info_Mod_Leitwolf_Hi_E_15_00"); //Ich bin dir intellektuell überlegen, also ergib dich oder stirb.
	AI_Output(self, hero, "Info_Mod_Leitwolf_Hi_E_09_01"); //Dass ich nicht lache! (lacht kehlig)

	Info_Mod_Leitwolf_Hi_F();
};

FUNC VOID Info_Mod_Leitwolf_Hi_D()
{
	AI_Output(hero, self, "Info_Mod_Leitwolf_Hi_D_15_00"); //Wofür hältst du dich, hier einfach alles zu vernichten?
	AI_Output(self, hero, "Info_Mod_Leitwolf_Hi_D_09_01"); //Ich bin der Leitwolf dieses Rudels! Und was kannst du vorweisen?
	AI_Output(hero, self, "Info_Mod_Leitwolf_Hi_D_15_02"); //Auch wenn man es mir nicht ansieht, aber ich bin ein Mensch.
	AI_Output(self, hero, "Info_Mod_Leitwolf_Hi_D_09_03"); //Du gehörst also auch zu diesen Schwachköpfen? (knurrt) Verzieh dich, Bürschchen.

	Info_ClearChoices	(Info_Mod_Leitwolf_Hi);

	if (Mod_WM_IsWarg == 1)
	{
		Info_AddChoice	(Info_Mod_Leitwolf_Hi, "Nein, du verziehst dich hier!", Info_Mod_Leitwolf_Hi_I);
		Info_AddChoice	(Info_Mod_Leitwolf_Hi, "Können wir nicht irgendwie eine Einigung finden?", Info_Mod_Leitwolf_Hi_N);
	}
	else
	{
		Mod_VMG_Pruefung_Leitwolf = 1;

		B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "Ich musste den Leitwolf umbringen. Hoffentlich kann die Aufgabe trotzdem als erledigt angesehen werden. Ich sollte mit Asko darüber reden.");

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Leitwolf_Hi_H()
{
	AI_Output(hero, self, "Info_Mod_Leitwolf_Hi_H_15_00"); //Dann komm mal her, großer böser Wolf.
	AI_Output(self, hero, "Info_Mod_Leitwolf_Hi_H_09_01"); //Wie du willst!

	Mod_VMG_Pruefung_Leitwolf = 1;

	B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "Ich musste den Leitwolf umbringen. Hoffentlich kann die Aufgabe trotzdem als erledigt angesehen werden. Ich sollte mit Asko darüber reden.");

	Info_ClearChoices	(Info_Mod_Leitwolf_Hi);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Leitwolf_Hi_G()
{
	AI_Output(hero, self, "Info_Mod_Leitwolf_Hi_G_15_00"); //Vielleicht können wir das ja friedlich lösen.
	AI_Output(self, hero, "Info_Mod_Leitwolf_Hi_G_09_01"); //Mir fällt spontan nichts ein. (knurrt)

	Info_Mod_Leitwolf_Hi_A();
};

FUNC VOID Info_Mod_Leitwolf_Hi_I()
{
	AI_Output(hero, self, "Info_Mod_Leitwolf_Hi_I_15_00"); //Nein, du verziehst dich hier!

	Info_Mod_Leitwolf_Hi_F();
};

FUNC VOID Info_Mod_Leitwolf_Hi_K()
{
	AI_Output(hero, self, "Info_Mod_Leitwolf_Hi_K_15_00"); //Die Verwandlungsmagier, um genau zu sein.
	AI_Output(self, hero, "Info_Mod_Leitwolf_Hi_K_09_01"); //Dieses Lumpenpack. Es verscheucht mir die ganze Beute! (knurrt) Sag denen, dass ich hier nicht weggehen werde.
	AI_Output(hero, self, "Info_Mod_Leitwolf_Hi_K_15_02"); //Und wenn ich es nicht tue?
	AI_Output(self, hero, "Info_Mod_Leitwolf_Hi_K_09_03"); //Dann bleibe ich halt hier! (lacht kehlig)

	Info_ClearChoices	(Info_Mod_Leitwolf_Hi);

	if (Mod_WM_IsWarg == 1)
	{
		Info_AddChoice	(Info_Mod_Leitwolf_Hi, "Verzieh dich du räudiger Köter.", Info_Mod_Leitwolf_Hi_C);
		Info_AddChoice	(Info_Mod_Leitwolf_Hi, "Können wir nicht irgendwie eine Einigung finden?", Info_Mod_Leitwolf_Hi_N);
	}
	else
	{
		Mod_VMG_Pruefung_Leitwolf = 1;

		B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "Ich musste den Leitwolf umbringen. Hoffentlich kann die Aufgabe trotzdem als erledigt angesehen werden. Ich sollte mit Asko darüber reden.");

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Leitwolf_Hi_J()
{
	AI_Output(hero, self, "Info_Mod_Leitwolf_Hi_J_15_00"); //Hast du nicht gehört? Ich sage es.
	AI_Output(self, hero, "Info_Mod_Leitwolf_Hi_J_09_01"); //Jetzt werd' mal nicht frech Bürschchen. (knurrt) Was willst du von mir?
	AI_Output(hero, self, "Info_Mod_Leitwolf_Hi_J_15_02"); //Dass du das Tal verlässt. Das habe ich doch schon gesagt.
	AI_Output(self, hero, "Info_Mod_Leitwolf_Hi_J_09_03"); //Ich will das Tal aber nicht verlassen. Es ist ein ausgezeichnetes Jagdgebiet.

	Info_ClearChoices	(Info_Mod_Leitwolf_Hi);

	if (Mod_WM_IsWarg == 1)
	{
		Info_AddChoice	(Info_Mod_Leitwolf_Hi, "Dann stirb, du räudiger Köter!", Info_Mod_Leitwolf_Hi_L);
		Info_AddChoice	(Info_Mod_Leitwolf_Hi, "Können wir nicht irgendwie eine Einigung finden?", Info_Mod_Leitwolf_Hi_N);
	}
	else
	{
		Mod_VMG_Pruefung_Leitwolf = 1;

		B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "Ich musste den Leitwolf umbringen. Hoffentlich kann die Aufgabe trotzdem als erledigt angesehen werden. Ich sollte mit Asko darüber reden.");

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Leitwolf_Hi_L()
{
	AI_Output(hero, self, "Info_Mod_Leitwolf_Hi_L_15_00"); //Dann stirb, du räudiger Köter!

	Info_Mod_Leitwolf_Hi_F();
};

FUNC VOID Info_Mod_Leitwolf_Hi_N()
{
	AI_Output(hero, self, "Info_Mod_Leitwolf_Hi_N_15_00"); //Können wir nicht irgendwie eine Einigung finden?
	AI_Output(self, hero, "Info_Mod_Leitwolf_Hi_N_09_01"); //Dein Gesülze fängt an, mich zu langweilen. Du willst eine Einigung?
	AI_Output(self, hero, "Info_Mod_Leitwolf_Hi_N_09_02"); //Dann bring mir Nahrung für ... (knurrt) eine Woche und wir verschwinden.

	Info_ClearChoices	(Info_Mod_Leitwolf_Hi);

	if (Mod_WM_IsWarg == 1)
	{
		Info_AddChoice	(Info_Mod_Leitwolf_Hi, "Vergiss es.", Info_Mod_Leitwolf_Hi_P);
		Info_AddChoice	(Info_Mod_Leitwolf_Hi, "Das werde ich, was willst du haben?", Info_Mod_Leitwolf_Hi_O);
	}
	else
	{
		Mod_VMG_Pruefung_Leitwolf = 1;

		B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "Ich musste den Leitwolf umbringen. Hoffentlich kann die Aufgabe trotzdem als erledigt angesehen werden. Ich sollte mit Asko darüber reden.");

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Leitwolf_Hi_M()
{
	AI_Output(hero, self, "Info_Mod_Leitwolf_Hi_M_15_00"); //Du und deine Freunde, ihr zerstört den Frieden der Natur in diesem Tal.
	AI_Output(self, hero, "Info_Mod_Leitwolf_Hi_M_09_01"); //Och, wie rührend. (knurrt) Das schert mich einen Dreck.

	Info_ClearChoices	(Info_Mod_Leitwolf_Hi);

	if (Mod_WM_IsWarg == 1)
	{
		Info_Mod_Leitwolf_Hi_N();
	}
	else
	{
		Mod_VMG_Pruefung_Leitwolf = 1;

		B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "Ich musste den Leitwolf umbringen. Hoffentlich kann die Aufgabe trotzdem als erledigt angesehen werden. Ich sollte mit Asko darüber reden.");

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Leitwolf_Hi_S()
{
	AI_Output(self, hero, "Info_Mod_Leitwolf_Hi_S_09_00"); //Bring mir ... ein zwanzig Stücke Fleisch.

	Info_ClearChoices	(Info_Mod_Leitwolf_Hi);

	if (Mod_WM_IsWarg == 1)
	{
		Info_AddChoice	(Info_Mod_Leitwolf_Hi, "Das ist zu viel verlangt!", Info_Mod_Leitwolf_Hi_U);
		Info_AddChoice	(Info_Mod_Leitwolf_Hi, "In Ordnung. Ich werde dir das Fleisch bringen.", Info_Mod_Leitwolf_Hi_T);
	}
	else
	{
		Mod_VMG_Pruefung_Leitwolf = 1;

		B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "Ich musste den Leitwolf umbringen. Hoffentlich kann die Aufgabe trotzdem als erledigt angesehen werden. Ich sollte mit Asko darüber reden.");

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Leitwolf_Hi_P()
{
	AI_Output(hero, self, "Info_Mod_Leitwolf_Hi_P_15_00"); //Vergiss es.
	AI_Output(self, hero, "Info_Mod_Leitwolf_Hi_P_09_01"); //Dann kommen wir nicht ins Geschäft. (knurrt) Verschwinde.

	Info_ClearChoices	(Info_Mod_Leitwolf_Hi);

	if (Mod_WM_IsWarg == 1)
	{
		Info_AddChoice	(Info_Mod_Leitwolf_Hi, "Nein du verschwindest. Und zwar sofort, oder ich bringe dich um!", Info_Mod_Leitwolf_Hi_R);
		Info_AddChoice	(Info_Mod_Leitwolf_Hi, "Warte! Was willst du haben?", Info_Mod_Leitwolf_Hi_Q);
	}
	else
	{
		Mod_VMG_Pruefung_Leitwolf = 1;

		B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "Ich musste den Leitwolf umbringen. Hoffentlich kann die Aufgabe trotzdem als erledigt angesehen werden. Ich sollte mit Asko darüber reden.");

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Leitwolf_Hi_O()
{
	AI_Output(hero, self, "Info_Mod_Leitwolf_Hi_O_15_00"); //Das werde ich, was willst du haben?

	Info_Mod_Leitwolf_Hi_S();
};

FUNC VOID Info_Mod_Leitwolf_Hi_R()
{
	AI_Output(hero, self, "Info_Mod_Leitwolf_Hi_R_15_00"); //Nein du verschwindest. Und zwar sofort, oder ich bringe dich um!
	AI_Output(self, hero, "Info_Mod_Leitwolf_Hi_R_09_01"); //Nicht, wenn ich schneller bin!

	Info_ClearChoices	(Info_Mod_Leitwolf_Hi);

	Mod_VMG_Pruefung_Leitwolf = 1;

	B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "Ich musste den Leitwolf umbringen. Hoffentlich kann die Aufgabe trotzdem als erledigt angesehen werden. Ich sollte mit Asko darüber reden.");

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Leitwolf_Hi_Q()
{
	AI_Output(hero, self, "Info_Mod_Leitwolf_Hi_Q_15_00"); //Warte! Was willst du haben?

	Info_Mod_Leitwolf_Hi_S();
};

FUNC VOID Info_Mod_Leitwolf_Hi_U()
{
	AI_Output(hero, self, "Info_Mod_Leitwolf_Hi_U_15_00"); //Das ist zu viel verlangt!
	AI_Output(self, hero, "Info_Mod_Leitwolf_Hi_U_09_01"); //Dann kommen wir nicht ins Geschäft. (knurrt) Verschwinde.
	AI_Output(hero, self, "Info_Mod_Leitwolf_Hi_U_15_02"); //Nein du verschwindest. Und zwar sofort, oder ich bringe dich um!
	AI_Output(self, hero, "Info_Mod_Leitwolf_Hi_U_09_03"); //Nicht, wenn ich schneller bin!

	Info_ClearChoices	(Info_Mod_Leitwolf_Hi);

	Mod_VMG_Pruefung_Leitwolf = 1;

	B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "Ich musste den Leitwolf umbringen. Hoffentlich kann die Aufgabe trotzdem als erledigt angesehen werden. Ich sollte mit Asko darüber reden.");

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Leitwolf_Hi_T()
{
	AI_Output(hero, self, "Info_Mod_Leitwolf_Hi_T_15_00"); //In Ordnung. Ich werde dir das Fleisch bringen.
	AI_Output(self, hero, "Info_Mod_Leitwolf_Hi_T_09_01"); //Wunderbar. (lacht kehlig)

	Info_ClearChoices	(Info_Mod_Leitwolf_Hi);

	Mod_VMG_Pruefung_Leitwolf = 2;

	Npc_SetRefuseTalk	(self, 60);

	B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "Ich soll dem Leitwolf 20 Fleischstücke bringen, damit er mit seinem Rudel verschwindet. Ich glaube, Dever verkauft Fleisch. Danach sollte ich mir von Asko eine neue Rolle geben lassen.");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Leitwolf_Aufgabe (C_INFO)
{
	npc		= Monster_11060_Leitwolf_TUG;
	nr		= 1;
	condition	= Info_Mod_Leitwolf_Aufgabe_Condition;
	information	= Info_Mod_Leitwolf_Aufgabe_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Leitwolf_Aufgabe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Leitwolf_Hi))
	&& (Mod_VMG_Pruefung_Leitwolf == 2)
	&& (Npc_RefuseTalk(self) == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Leitwolf_Aufgabe_Info()
{
	AI_Output(self, hero, "Info_Mod_Leitwolf_Aufgabe_09_00"); //Wie sieht's aus? (knurrt)

	if (Mod_HasFleisch_Amount >= 20)
	{
		AI_Output(hero, self, "Info_Mod_Leitwolf_Aufgabe_15_01"); //Hier ist dein Fleisch.

		//B_GiveInvItems	(hero, self, ItFo_MuttonRaw, 20);

		B_ShowGivenThings	("20 rohes Fleisch gegeben");

		AI_Output(self, hero, "Info_Mod_Leitwolf_Aufgabe_09_02"); //DAS nenne ich eine gute Mahlzeit! Ich werde mein Versprechen halten und von hier verschwinden.
		AI_Output(hero, self, "Info_Mod_Leitwolf_Aufgabe_15_03"); //Am besten, du lässt dich hier nicht mehr blicken.
		AI_Output(self, hero, "Info_Mod_Leitwolf_Aufgabe_09_04"); //(knurrt) Einverstanden. Wir verschwinden dann.

		B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "Der Leitwolf ist mit seinen Kumpanen abgezogen. Ich sollte Asko davon berichten.");

		Mod_VMG_Pruefung_Leitwolf = 3;
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Leitwolf_Aufgabe_15_05"); //Ich bin an der Sache dran.
		AI_Output(self, hero, "Info_Mod_Leitwolf_Aufgabe_09_06"); //Beeil' dich gefälligst!
	};

	AI_StopProcessInfos	(self);

	Npc_SetRefuseTalk	(self, 60);
};

INSTANCE Info_Mod_Leitwolf_EXIT (C_INFO)
{
	npc		= Monster_11060_Leitwolf_TUG;
	nr		= 1;
	condition	= Info_Mod_Leitwolf_EXIT_Condition;
	information	= Info_Mod_Leitwolf_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Leitwolf_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Leitwolf_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};