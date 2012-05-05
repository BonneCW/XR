INSTANCE Info_Mod_Per_Trador (C_INFO)
{
	npc		= Mod_7353_VMG_Per_TUG;
	nr		= 1;
	condition	= Info_Mod_Per_Trador_Condition;
	information	= Info_Mod_Per_Trador_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Per_Trador_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Genn_Giftpflanzen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Per_Trador_Info()
{
	AI_Output(self, hero, "Info_Mod_Per_Trador_13_00"); //Lange nicht gesehen, was gibt’s?
	AI_Output(hero, self, "Info_Mod_Per_Trador_15_01"); //Kannst du mir sagen, welche Magier im Moment vermisst werden?
	AI_Output(self, hero, "Info_Mod_Per_Trador_13_02"); //Vermisst ist so eine Sache ... Ich kann dir wohl sagen, wer seit ein paar Tagen nicht mehr im Dorf war.
	AI_Output(self, hero, "Info_Mod_Per_Trador_13_03"); //Da ist zum einen Asko, der wollte sich bei den Ruinen umsehen.
	AI_Output(self, hero, "Info_Mod_Per_Trador_13_04"); //Dann noch Fore, der wollte unten am Hang nach seltenen Pflanzen suchen.
	AI_Output(self, hero, "Info_Mod_Per_Trador_13_05"); //Und Dean. Ich glaube, er wollte sich beim Steinkreis umschauen.
	AI_Output(hero, self, "Info_Mod_Per_Trador_15_06"); //Ich werde die drei mal aufsuchen.
	AI_Output(self, hero, "Info_Mod_Per_Trador_13_07"); //Dankeschön. Wenn du Asko triffst, sag ihm doch bitte, dass ich ein Päckchen für ihn habe.

	Log_CreateTopic	(TOPIC_MOD_PER_ASKO, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_PER_ASKO, LOG_RUNNING);

	if (Npc_KnowsInfo(hero, Info_Mod_Dever_Trador))
	{
		B_LogEntry	(TOPIC_MOD_PER_ASKO, "Ich soll Asko sagen, dass Per ein Paket für ihn hat.");
	}
	else
	{
		B_LogEntry_More	(TOPIC_MOD_FAICE_GIFT, TOPIC_MOD_PER_ASKO, "Seit einigen Tagen nicht mehr aufgetaucht sind: Asko, der ist bei den Ruinen; Fore, der ist unten am Hang; und Dean, der ist beim Steinkreis.", "Ich soll Asko sagen, dass Per ein Paket für ihn hat.");
	};
};

INSTANCE Info_Mod_Per_Dean (C_INFO)
{
	npc		= Mod_7353_VMG_Per_TUG;
	nr		= 1;
	condition	= Info_Mod_Per_Dean_Condition;
	information	= Info_Mod_Per_Dean_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Per_Dean_Condition()
{
	if (Mod_Turendil_Faice_Day == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Per_Dean_Info()
{
	AI_Output(self, hero, "Info_Mod_Per_Dean_13_00"); //Was hat deine Suche ergeben?
	AI_Output(hero, self, "Info_Mod_Per_Dean_15_01"); //Dean wurde von einem Golem umgebracht, der von einem Betrüger namens Trador hierher gesendet wurde.
	AI_Output(self, hero, "Info_Mod_Per_Dean_13_02"); //Das ist ja furchtbar! Aber ich habe in letzter Zeit keinen Golem hier in Tugettso gesehen. Merkwürdig.
	AI_Output(self, hero, "Info_Mod_Per_Dean_13_03"); //Du musst Genn auf jeden Fall davon in Kenntnis setzen.

	if (!Npc_KnowsInfo(hero, Info_Mod_Dever_Dean))
	{
		B_LogEntry	(TOPIC_MOD_FAICE_GIFT, "Ich habe von Deans Tod berichtet. Jetzt sollte ich zurück zu Genn gehen und ihn von den Ereignissen in Kenntnis setzen.");
	};
};

INSTANCE Info_Mod_Per_Asko (C_INFO)
{
	npc		= Mod_7353_VMG_Per_TUG;
	nr		= 1;
	condition	= Info_Mod_Per_Asko_Condition;
	information	= Info_Mod_Per_Asko_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe Asko gesagt, dass du ein Paket für ihn hast.";
};

FUNC INT Info_Mod_Per_Asko_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Asko_Per))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Per_Asko_Info()
{
	AI_Output(hero, self, "Info_Mod_Per_Asko_15_00"); //Ich habe Asko gesagt, dass du ein Paket für ihn hast. Er müsste auf dem Weg sein.
	AI_Output(self, hero, "Info_Mod_Per_Asko_13_01"); //Dankeschön. Hier hast du ein bisschen Gold.

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	B_GivePlayerXP	(250);

	B_LogEntry	(TOPIC_MOD_PER_ASKO, "Per weiß Bescheid, dass Asko auf dem Weg zu ihm ist.");
	B_SetTopicStatus	(TOPIC_MOD_PER_ASKO, LOG_SUCCESS);

	B_StartOtherRoutine	(Mod_7355_VMG_Asko_TUG, "START");
};

INSTANCE Info_Mod_Per_Pruefung (C_INFO)
{
	npc		= Mod_7353_VMG_Per_TUG;
	nr		= 1;
	condition	= Info_Mod_Per_Pruefung_Condition;
	information	= Info_Mod_Per_Pruefung_Info;
	permanent	= 1;
	important	= 0;
	description	= "Wie sieht es mit der letzten Aufgabe aus?";
};

FUNC INT Info_Mod_Per_Pruefung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Asko_Pruefung3))
	&& (Mod_VMG_Pruefung == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Per_Pruefung_Info()
{
	AI_Output(hero, self, "Info_Mod_Per_Pruefung_15_00"); //Wie sieht es mit der letzten Aufgabe aus?
	AI_Output(self, hero, "Info_Mod_Per_Pruefung_13_01"); //Da bist du ja. Ich habe schon erfahren, dass ich dich in die Kunst unserer Meditation einweisen soll. Bist du bereit?

	Info_ClearChoices	(Info_Mod_Per_Pruefung);

	Info_AddChoice	(Info_Mod_Per_Pruefung, "Nein, ich muss noch schnell etwas erledigen.", Info_Mod_Per_Pruefung_B);
	Info_AddChoice	(Info_Mod_Per_Pruefung, "Ja, erkläre mir, wie ich richtig meditiere.", Info_Mod_Per_Pruefung_A);
};

FUNC VOID Info_Mod_Per_Pruefung_B()
{
	AI_Output(hero, self, "Info_Mod_Per_Pruefung_B_15_00"); //Nein, ich muss noch schnell etwas erledigen.
	AI_Output(self, hero, "Info_Mod_Per_Pruefung_B_13_01"); //Beeile dich am besten.

	Info_ClearChoices	(Info_Mod_Per_Pruefung);
};

FUNC VOID Info_Mod_Per_Pruefung_A()
{
	AI_Output(hero, self, "Info_Mod_Per_Pruefung_A_15_00"); //Ja, erkläre mir, wie ich richtig meditiere.
	AI_Output(self, hero, "Info_Mod_Per_Pruefung_A_13_01"); //Vielleicht kennst du das kleine Tal nahe der Höhle, in der sich die Goblins eingenistet hatten?
	AI_Output(self, hero, "Info_Mod_Per_Pruefung_A_13_02"); //Begib dich dorthin und sprich eine Formel. Den Text dafür gebe ich dir am Ende unseres Gesprächs.
	AI_Output(self, hero, "Info_Mod_Per_Pruefung_A_13_03"); //Kannst du mir folgen?

	Info_ClearChoices	(Info_Mod_Per_Pruefung);

	Info_AddChoice	(Info_Mod_Per_Pruefung, "Kannst du das noch mal wiederholen?", Info_Mod_Per_Pruefung_D);
	Info_AddChoice	(Info_Mod_Per_Pruefung, "Ja, erzähl weiter.", Info_Mod_Per_Pruefung_C);
};

FUNC VOID Info_Mod_Per_Pruefung_E()
{
	AI_Output(self, hero, "Info_Mod_Per_Pruefung_E_13_00"); //Wenn du die Formel gesprochen hast, wirst du in einen Trance-Zustand verfallen und eine Vision wird dich überkommen.
	AI_Output(self, hero, "Info_Mod_Per_Pruefung_E_13_01"); //Erzähle niemandem von der Vision. Sie führt dich zu der nächsten Station dieser Aufgabe.
	AI_Output(self, hero, "Info_Mod_Per_Pruefung_E_13_02"); //Die Station ist für jeden individuell, daher kann ich dir nicht helfen. Höre genau auf die Vision. Klar soweit?

	Info_ClearChoices	(Info_Mod_Per_Pruefung);

	Info_AddChoice	(Info_Mod_Per_Pruefung, "Kannst du das noch mal wiederholen?", Info_Mod_Per_Pruefung_G);
	Info_AddChoice	(Info_Mod_Per_Pruefung, "Ja, erzähl weiter.", Info_Mod_Per_Pruefung_F);
};

FUNC VOID Info_Mod_Per_Pruefung_D()
{
	AI_Output(hero, self, "Info_Mod_Per_Pruefung_D_15_00"); //Kannst du das noch mal wiederholen?
	AI_Output(self, hero, "Info_Mod_Per_Pruefung_D_13_01"); //Begib dich in das kleine Tal nahe der Goblinhöhle und lies den Text, den ich dir gleich gebe, laut vor.

	Info_Mod_Per_Pruefung_E();
};

FUNC VOID Info_Mod_Per_Pruefung_C()
{
	AI_Output(hero, self, "Info_Mod_Per_Pruefung_C_15_00"); //Ja, erzähl weiter.

	Info_Mod_Per_Pruefung_E();
};

FUNC VOID Info_Mod_Per_Pruefung_H()
{
	AI_Output(self, hero, "Info_Mod_Per_Pruefung_H_13_00"); //Wenn du deine Vision richtig gedeutet und dein Ziel gefunden hast, wirst du ein rotes Blütenblatt erhalten.
	AI_Output(self, hero, "Info_Mod_Per_Pruefung_H_13_01"); //So ist es seit jeher von der Natur vorgesehen gewesen und du wirst wohl keine Ausnahme darstellen.
	AI_Output(self, hero, "Info_Mod_Per_Pruefung_H_13_02"); //Bring mir das Blütenblatt, damit ich weiß, dass du deine Aufgabe gemeistert hast. Kann es losgehen?

	Info_ClearChoices	(Info_Mod_Per_Pruefung);

	Info_AddChoice	(Info_Mod_Per_Pruefung, "Davon hätte ich gerne noch die Kurzfassung.", Info_Mod_Per_Pruefung_J);
	Info_AddChoice	(Info_Mod_Per_Pruefung, "Ja, gib mir den Text.", Info_Mod_Per_Pruefung_I);
};

FUNC VOID Info_Mod_Per_Pruefung_G()
{
	AI_Output(hero, self, "Info_Mod_Per_Pruefung_D_15_00"); //Kannst du das noch mal wiederholen?
	AI_Output(self, hero, "Info_Mod_Per_Pruefung_G_13_01"); //In deinem Trance-Zustand wirst du eine Vision haben, die dich zur nächsten Station führt.
	AI_Output(self, hero, "Info_Mod_Per_Pruefung_G_13_02"); //Allerdings darfst du niemandem davon erzählen.

	Info_Mod_Per_Pruefung_H();
};

FUNC VOID Info_Mod_Per_Pruefung_F()
{
	AI_Output(hero, self, "Info_Mod_Per_Pruefung_C_15_00"); //Ja, erzähl weiter.

	Info_Mod_Per_Pruefung_H();
};

FUNC VOID Info_Mod_Per_Pruefung_K()
{
	B_GiveInvItems	(self, hero, ItWr_PerZettel, 1);

	AI_Output(self, hero, "Info_Mod_Per_Pruefung_K_13_00"); //Nun mach' dich auf den Weg.

	B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "Ich soll im Tal eine Spruchrolle wirken. Die anschließende Vision wird mich zu einem Ziel führen, bei dem ich ein rotes Blütenblatt finden werde. Das soll ich Per bringen.");

	Mod_VMG_Pruefung = 3;

	Wld_SendTrigger	("EVT_BARRIERE");

	Info_ClearChoices	(Info_Mod_Per_Pruefung);

	Wld_InsertNpc	(Mod_7592_OUT_Handlanger_TUG,	"TUG_87");
	Wld_InsertNpc	(Mod_7593_OUT_Handlanger_TUG,	"TUG_87");
	Wld_InsertNpc	(Mod_7594_OUT_Petunia_TUG,	"TUG_87");
	Wld_InsertNpc	(Mod_7595_OUT_Verwandlungskrieger_TUG,	"TUG_87");
	Wld_InsertNpc	(Monster_11066_Hase_TUG,	"TUG_87");
};

FUNC VOID Info_Mod_Per_Pruefung_J()
{
	AI_Output(hero, self, "Info_Mod_Per_Pruefung_J_15_00"); //Davon hätte ich gerne noch die Kurzfassung.
	AI_Output(self, hero, "Info_Mod_Per_Pruefung_J_13_01"); //Bei deinem Ziel findest du ein rotes Blütenblatt, dass du mir bringen sollst.
	AI_Output(self, hero, "Info_Mod_Per_Pruefung_J_13_02"); //So weiß ich, 	dass du deine Aufgabe bestanden hast. Hier ist die Formel.

	Info_Mod_Per_Pruefung_K();
};

FUNC VOID Info_Mod_Per_Pruefung_I()
{
	AI_Output(hero, self, "Info_Mod_Per_Pruefung_I_15_00"); //Ja, gib mir den Text.
	AI_Output(self, hero, "Info_Mod_Per_Pruefung_I_13_01"); //Hier hast du ihn.

	Info_Mod_Per_Pruefung_K();
};

INSTANCE Info_Mod_Per_Pruefung2 (C_INFO)
{
	npc		= Mod_7353_VMG_Per_TUG;
	nr		= 1;
	condition	= Info_Mod_Per_Pruefung2_Condition;
	information	= Info_Mod_Per_Pruefung2_Info;
	permanent	= 1;
	important	= 0;
	description	= "Es gibt da ein Problem ...";
};

FUNC INT Info_Mod_Per_Pruefung2_Condition()
{
	if (Mod_VMG_Pruefung == 3)
	&& (Mod_VMG_Pruefung_Barriere == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Per_Pruefung2_Info()
{
	AI_Output(hero, self, "Info_Mod_Per_Pruefung2_15_00"); //Es gibt da ein Problem ...
	AI_Output(self, hero, "Info_Mod_Per_Pruefung2_13_01"); //Was für ein Problem?

	Info_ClearChoices	(Info_Mod_Per_Pruefung2);

	Info_AddChoice	(Info_Mod_Per_Pruefung2, "Ach nichts, damit werde ich schon fertig.", Info_Mod_Per_Pruefung2_B);
	Info_AddChoice	(Info_Mod_Per_Pruefung2, "In dem Tal hat sich eine Frau breit gemacht.", Info_Mod_Per_Pruefung2_A);
};

FUNC VOID Info_Mod_Per_Pruefung2_B()
{
	AI_Output(hero, self, "Info_Mod_Per_Pruefung2_B_15_00"); //Ach nichts, damit werde ich schon fertig.
	AI_Output(self, hero, "Info_Mod_Per_Pruefung2_B_13_01"); //Du weißt, was du zu tun hast.

	Info_ClearChoices	(Info_Mod_Per_Pruefung2);
};

FUNC VOID Info_Mod_Per_Pruefung2_A()
{
	AI_Output(hero, self, "Info_Mod_Per_Pruefung2_A_15_00"); //In dem Tal hat sich eine Frau breit gemacht, die sich mit einer magischen Barriere umgibt.
	AI_Output(self, hero, "Info_Mod_Per_Pruefung2_A_13_01"); //DAS ist allerdings ein Problem.
	AI_Output(self, hero, "Info_Mod_Per_Pruefung2_A_13_02"); //Das Tal hat einen magischen Ursprung, der so stark ist, dass die Vision dich nur dort ereilt.
	AI_Output(self, hero, "Info_Mod_Per_Pruefung2_A_13_03"); //Wahrscheinlich ist diese Frau deshalb dort erschienen.
	AI_Output(hero, self, "Info_Mod_Per_Pruefung2_A_15_04"); //Was können wir tun?
	AI_Output(self, hero, "Info_Mod_Per_Pruefung2_A_13_05"); //Ist dir irgendetwas aufgefallen, das uns weiterhelfen könnte?
	AI_Output(hero, self, "Info_Mod_Per_Pruefung2_A_15_06"); //Scheinbar kann die Barriere Tieren nichts anhaben.
	AI_Output(self, hero, "Info_Mod_Per_Pruefung2_A_13_07"); //Das ist doch schon mal etwas! Damit sollte es dir nicht schwer fallen, sie zu erreichen, und herauszufinden, wer sie ist.

	Info_ClearChoices	(Info_Mod_Per_Pruefung2);

	Info_AddChoice	(Info_Mod_Per_Pruefung2, "Nein, da mache ich nicht mit.", Info_Mod_Per_Pruefung2_D);
	Info_AddChoice	(Info_Mod_Per_Pruefung2, "Was soll ich machen?", Info_Mod_Per_Pruefung2_C);
};

FUNC VOID Info_Mod_Per_Pruefung2_E()
{
	AI_Output(self, hero, "Info_Mod_Per_Pruefung2_E_13_00"); //Hier hast du eine Verwandlungsspruchrolle. Sie wird dich in eine Fleischwanze verwandeln, die fällt nicht auf.

	B_GiveInvItems	(self, hero, ItSc_TrfMeatbug, 1);

	AI_Output(self, hero, "Info_Mod_Per_Pruefung2_E_13_01"); //Dank dir können wir ja wieder einige dieser Rollen herstellen.
	AI_Output(hero, self, "Info_Mod_Per_Pruefung2_E_15_02"); //Okay, ich werde herausfinden, wer diese Frau ist.
	AI_Output(self, hero, "Info_Mod_Per_Pruefung2_E_13_03"); //Ich wusste, dass ich mich auf dich verlassen kann.

	Mod_VMG_Pruefung_Barriere = 3;

	B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "Per hat mir eine Verwandlung zur Fleischwanze gegeben. Damit sollte ich unbemerkt in die Barriere gelangen und kann die Frau zur Rede stellen.");

	Info_ClearChoices	(Info_Mod_Per_Pruefung2);
};

FUNC VOID Info_Mod_Per_Pruefung2_D()
{
	AI_Output(hero, self, "Info_Mod_Per_Pruefung2_D_15_00"); //Nein, da mache ich nicht mit.
	AI_Output(self, hero, "Info_Mod_Per_Pruefung2_D_13_01"); //Sieh es einfach als Teil der Prüfung.
	AI_Output(hero, self, "Info_Mod_Per_Pruefung2_D_15_02"); //Dann habe ich wohl keine andere Wahl. Was soll ich machen?

	Info_Mod_Per_Pruefung2_E();
};

FUNC VOID Info_Mod_Per_Pruefung2_C()
{
	AI_Output(hero, self, "Info_Mod_Per_Pruefung2_C_15_00"); //Was soll ich machen?

	Info_Mod_Per_Pruefung2_E();
};

INSTANCE Info_Mod_Per_Pruefung3 (C_INFO)
{
	npc		= Mod_7353_VMG_Per_TUG;
	nr		= 1;
	condition	= Info_Mod_Per_Pruefung3_Condition;
	information	= Info_Mod_Per_Pruefung3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Es gibt da ein Problem ...";
};

FUNC INT Info_Mod_Per_Pruefung3_Condition()
{
	if (Mod_VMG_Pruefung_Petunia >= 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Per_Pruefung3_Info()
{
	if (Mod_VMG_Pruefung_Petunia == 6)
	{
		AI_Output(hero, self, "Info_Mod_Per_Pruefung3_15_00"); //Ich denke, wir können das Problem hier und jetzt zusammen lösen.
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Per_Pruefung3_15_01"); //Ich denke, ich habe das Problem gelöst.
	};

	AI_Output(self, hero, "Info_Mod_Per_Pruefung3_13_02"); //Was ist passiert?
	AI_Output(hero, self, "Info_Mod_Per_Pruefung3_15_03"); //Die Frau dort im Tal heißt Petunia und behauptet, mal eine Verwandlungsmagierin gewesen zu sein, aber sie wurde verstoßen.
	AI_Output(self, hero, "Info_Mod_Per_Pruefung3_13_04"); //Ich erinnere mich an sie. Was soll denn jetzt mit ihr geschehen?

	Info_ClearChoices	(Info_Mod_Per_Pruefung3);

	Info_AddChoice	(Info_Mod_Per_Pruefung3, "Sie sollte bestraft werden, für alles, was sie getan hat.", Info_Mod_Per_Pruefung3_B);

	if (Mod_VMG_Pruefung_Petunia == 6)
	{
		Info_AddChoice	(Info_Mod_Per_Pruefung3, "Ich habe ihr versprochen, dass wir uns etwas ausdenken.", Info_Mod_Per_Pruefung3_A);
	};
};

FUNC VOID Info_Mod_Per_Pruefung3_E()
{
	AI_Output(self, hero, "Info_Mod_Per_Pruefung3_E_13_00"); //Es gibt einige Möglichkeiten. Wir könnten sie einsperren, einfach laufen lassen oder wieder aufnehmen.
	AI_Output(self, hero, "Info_Mod_Per_Pruefung3_E_13_01"); //Du solltest entscheiden, was mit ihr passiert.

	Info_ClearChoices	(Info_Mod_Per_Pruefung3);

	Info_AddChoice	(Info_Mod_Per_Pruefung3, "Wir sollten sie wieder aufnehmen.", Info_Mod_Per_Pruefung3_I);
	Info_AddChoice	(Info_Mod_Per_Pruefung3, "Ich glaube, wir können sie laufen lassen.", Info_Mod_Per_Pruefung3_H);
	Info_AddChoice	(Info_Mod_Per_Pruefung3, "Wir sollten sie einsperren. Dann ist sie keine Gefahr mehr.", Info_Mod_Per_Pruefung3_G);
};

FUNC VOID Info_Mod_Per_Pruefung3_F()
{
	AI_Output(hero, self, "Info_Mod_Per_Pruefung3_F_15_00"); //Was soll ich jetzt tun?
	AI_Output(self, hero, "Info_Mod_Per_Pruefung3_F_13_01"); //Hast du die Formel von mir noch?

	if (Npc_HasItems(hero, ItWr_PerZettel) == 1)
	{
		AI_Output(hero, self, "Info_Mod_Per_Pruefung3_F_15_02"); //Ja.
		AI_Output(self, hero, "Info_Mod_Per_Pruefung3_F_13_03"); //Dann erledige deine Aufgabe und komm anschließend zu mir zurück.
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Per_Pruefung3_F_15_04"); //Nein
		AI_Output(self, hero, "Info_Mod_Per_Pruefung3_F_13_05"); //Dann bekommst du von mir eine neue. Hier.

		B_GiveInvItems	(self, hero, ItWr_PerZettel, 1);

		AI_Output(self, hero, "Info_Mod_Per_Pruefung3_F_13_06"); //Und jetzt erledige deine Aufgabe und komme anschließend zu mir zurück.
	};

	B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "Petunias Schicksal ist nun entschieden. Jetzt muss ich noch die Aufgabe bewältigen.");

	Info_ClearChoices	(Info_Mod_Per_Pruefung3);
};

FUNC VOID Info_Mod_Per_Pruefung3_B()
{
	AI_Output(hero, self, "Info_Mod_Per_Pruefung3_B_15_00"); //Sie sollte bestraft werden, für alles, was sie getan hat.
	AI_Output(self, hero, "Info_Mod_Per_Pruefung3_B_13_01"); //Wenn das deine Entscheidung ist.

	Info_ClearChoices	(Info_Mod_Per_Pruefung3);

	Info_AddChoice	(Info_Mod_Per_Pruefung3, "Nein! Das hat sie doch nicht verdient.", Info_Mod_Per_Pruefung3_D);
	Info_AddChoice	(Info_Mod_Per_Pruefung3, "Bestraft sie.", Info_Mod_Per_Pruefung3_C);
};

FUNC VOID Info_Mod_Per_Pruefung3_D()
{
	AI_Output(hero, self, "Info_Mod_Per_Pruefung3_D_15_00"); //Nein! Das hat sie doch nicht verdient. Haben wir noch eine andere Wahl?

	Info_Mod_Per_Pruefung3_E();
};

FUNC VOID Info_Mod_Per_Pruefung3_C()
{
	AI_Output(hero, self, "Info_Mod_Per_Pruefung3_C_15_00"); //Bestraft sie.
	AI_Output(self, hero, "Info_Mod_Per_Pruefung3_C_13_01"); //Wenn das dein Wunsch ist. Ich werde alles in die Wege leiten.

	B_StartOtherRoutine	(Mod_7594_OUT_Petunia_TUG, "GEFANGEN");

	Info_Mod_Per_Pruefung3_F();
};

FUNC VOID Info_Mod_Per_Pruefung3_M()
{
	AI_Output(self, hero, "Info_Mod_Per_Pruefung3_M_13_00"); //So sei es. Ich werde alles in die Wege leiten.

	Info_Mod_Per_Pruefung3_F();
};

FUNC VOID Info_Mod_Per_Pruefung3_A()
{
	AI_Output(hero, self, "Info_Mod_Per_Pruefung3_A_15_00"); //Ich habe ihr versprochen, dass wir uns etwas ausdenken. Was schlägst du vor?

	Info_Mod_Per_Pruefung3_E();
};

FUNC VOID Info_Mod_Per_Pruefung3_I()
{
	AI_Output(hero, self, "Info_Mod_Per_Pruefung3_I_15_00"); //Wir sollten sie wieder aufnehmen.
	AI_Output(self, hero, "Info_Mod_Per_Pruefung3_I_13_01"); //Bist du dir da sicher?

	Info_ClearChoices	(Info_Mod_Per_Pruefung3);

	Info_AddChoice	(Info_Mod_Per_Pruefung3, "Nein, ich glaube, in Freiheit ist sie besser aufgehoben.", Info_Mod_Per_Pruefung3_L);
	Info_AddChoice	(Info_Mod_Per_Pruefung3, "Nein, wir sollten sie einsperren. Dann ist sie keine Gefahr mehr.", Info_Mod_Per_Pruefung3_K);
	Info_AddChoice	(Info_Mod_Per_Pruefung3, "Ich bin von ihrer inneren Aufrichtigkeit überzeugt.", Info_Mod_Per_Pruefung3_J);
};

FUNC VOID Info_Mod_Per_Pruefung3_H()
{
	AI_Output(hero, self, "Info_Mod_Per_Pruefung3_H_15_00"); //Ich glaube, wir können sie laufen lassen.

	B_RemoveNpc	(Mod_7594_OUT_Petunia_TUG);

	Info_Mod_Per_Pruefung3_M();
};

FUNC VOID Info_Mod_Per_Pruefung3_G()
{
	AI_Output(hero, self, "Info_Mod_Per_Pruefung3_G_15_00"); //Wir sollten sie einsperren. Dann ist sie keine Gefahr mehr.

	B_StartOtherRoutine	(Mod_7594_OUT_Petunia_TUG,	"GEFANGEN");

	Info_Mod_Per_Pruefung3_M();
};

FUNC VOID Info_Mod_Per_Pruefung3_L()
{
	AI_Output(hero, self, "Info_Mod_Per_Pruefung3_L_15_00"); //Nein, ich glaube, in Freiheit ist sie besser aufgehoben.

	B_RemoveNpc	(Mod_7594_OUT_Petunia_TUG);

	Info_Mod_Per_Pruefung3_M();
};

FUNC VOID Info_Mod_Per_Pruefung3_K()
{
	AI_Output(hero, self, "Info_Mod_Per_Pruefung3_K_15_00"); //Nein, wir sollten sie einsperren. Dann ist sie keine Gefahr mehr.

	B_StartOtherRoutine	(Mod_7594_OUT_Petunia_TUG,	"GEFANGEN");

	Info_Mod_Per_Pruefung3_M();
};

FUNC VOID Info_Mod_Per_Pruefung3_J()
{
	AI_Output(hero, self, "Info_Mod_Per_Pruefung3_J_15_00"); //Ich bin von ihrer inneren Aufrichtigkeit überzeugt. Man müsste sie vielleicht ein wenig beaufsichtigen, aber sie kann den Sprung schaffen.
	AI_Output(self, hero, "Info_Mod_Per_Pruefung3_J_13_01"); //Eine weise Entscheidung. Ich werde alles in die Wege leiten.

	AI_UnequipArmor	(Mod_7594_OUT_Petunia_TUG);

	CreateInvItems	(Mod_7594_OUT_Petunia_TUG, ItAr_Naturmagier2, 1);

	AI_EquipArmor	(Mod_7594_OUT_Petunia_TUG, ItAr_Naturmagier2);

	B_StartOtherRoutine	(Mod_7594_OUT_Petunia_TUG,	"MAGIERIN");

	Info_Mod_Per_Pruefung3_F();
};

INSTANCE Info_Mod_Per_Pruefung4 (C_INFO)
{
	npc		= Mod_7353_VMG_Per_TUG;
	nr		= 1;
	condition	= Info_Mod_Per_Pruefung4_Condition;
	information	= Info_Mod_Per_Pruefung4_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe das Blütenblatt.";
};

FUNC INT Info_Mod_Per_Pruefung4_Condition()
{
	if (Mod_VMG_Pruefung == 5)
	&& (Npc_HasItems(hero, ItMi_Bluetenblatt) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Per_Pruefung4_Info()
{
	AI_Output(hero, self, "Info_Mod_Per_Pruefung4_15_00"); //Ich habe das Blütenblatt.
	AI_Output(self, hero, "Info_Mod_Per_Pruefung4_13_01"); //Das ist großartig! Ich wusste, du würdest es schaffen. Zeig mal her.
	AI_Output(hero, self, "Info_Mod_Per_Pruefung4_15_02"); //Hier hast du es.

	B_GiveInvItems	(hero, self, ItMi_Bluetenblatt, 1);

	AI_Output(self, hero, "Info_Mod_Per_Pruefung4_13_03"); //Hach, ich liebe diese Blütenblätter. Ich erinnere mich noch, wie ich meins gefunden habe ...
	AI_Output(hero, self, "Info_Mod_Per_Pruefung4_15_04"); //Komm zur Sache.
	AI_Output(self, hero, "Info_Mod_Per_Pruefung4_13_05"); //Entschuldigung, natürlich. Hast du eine Erkenntnis aus dem Finden des Blütenblattes erhalten?

	Info_ClearChoices	(Info_Mod_Per_Pruefung4);

	Info_AddChoice	(Info_Mod_Per_Pruefung4, "Ich bin etwas Besonderes.", Info_Mod_Per_Pruefung4_C);
	Info_AddChoice	(Info_Mod_Per_Pruefung4, "Die Natur ist etwas Harmonisches und sollte nicht durch Fremdeinflüsse beeinflusst werden.", Info_Mod_Per_Pruefung4_B);
	Info_AddChoice	(Info_Mod_Per_Pruefung4, "Nein, sollte ich?", Info_Mod_Per_Pruefung4_A);
};

FUNC VOID Info_Mod_Per_Pruefung4_H()
{
	AI_Output(hero, self, "Info_Mod_Per_Pruefung4_H_15_00"); //Das werde ich. Auf Wiedersehen.
	AI_Output(self, hero, "Info_Mod_Per_Pruefung4_H_13_01"); //Vielleicht sehen wir uns noch einmal wieder.

	Info_ClearChoices	(Info_Mod_Per_Pruefung4);
};

FUNC VOID Info_Mod_Per_Pruefung4_D()
{
	AI_Output(self, hero, "Info_Mod_Per_Pruefung4_D_13_00"); //Bravo, du hast die Aufgabe gemeistert! Geh nun zu Genn, er wird dich wieder ins Minental teleportieren.

	Mod_VMG_Pruefung_Per = 1;

	B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "Die letzte Aufgabe habe ich bestanden. Nun muss ich zu Genn, um zurück ins Minental zu gelangen. Danach spreche ich mit Faice und schaue, was er mir zu sagen hat.");

	Info_Mod_Per_Pruefung4_H();
};

FUNC VOID Info_Mod_Per_Pruefung4_E()
{
	if (Mod_VMG_Pruefung_Genn == 1)
	&& (Mod_VMG_Pruefung_Asko == 1)
	{
		AI_Output(self, hero, "Info_Mod_Per_Pruefung4_E_13_00"); //Du hast bei dieser wichtigsten Aufgabe leider versagt, aber durch dein Handeln vorhin werde ich noch mal ein Auge zudrücken.
		AI_Output(self, hero, "Info_Mod_Per_Pruefung4_E_13_01"); //Geh nun zu Genn, er wird dich wieder ins Minental teleportieren.
	}
	else if (Mod_VMG_Pruefung_Genn == 2)
	&& (Mod_VMG_Pruefung_Asko == 2)
	{
		AI_Output(self, hero, "Info_Mod_Per_Pruefung4_E_13_02"); //Du hast bei dieser wichtigsten Aufgabe leider auch versagt, so wie bei den beiden Aufgaben zuvor.
		AI_Output(self, hero, "Info_Mod_Per_Pruefung4_E_13_03"); //Damit wirst du nie ein richtiger Verwandlungmagier sein. Das tut mir wirklich sehr leid für dich, nach allem, was du für uns getan hast, aber so besagen es die Traditionen.
		AI_Output(hero, self, "Info_Mod_Per_Pruefung4_E_15_04"); //Das ist doch nicht dein Ernst. Gibt es keine andere Möglichkeit, wie ich doch noch dabei sein kann?
		AI_Output(self, hero, "Info_Mod_Per_Pruefung4_E_13_05"); //Dieses Mal nicht. Es tut mir wirklich Leid. Geh nun zu Genn, er wird dich wieder ins Minental teleportieren.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Per_Pruefung4_E_13_06"); //Du hast bei dieser wichtigsten Aufgabe leider auch versagt, so wie bei einer Aufgabe zuvor.
		AI_Output(self, hero, "Info_Mod_Per_Pruefung4_E_13_07"); //Ich kann dich nur unter der Bedingung weiter lassen, dass du auf deine Belohnung verzichtest.
		AI_Output(self, hero, "Info_Mod_Per_Pruefung4_E_13_08"); //Und das ist schon gut gemeint. Du hast einfach zu viel für uns getan, als dass ich dich durchfallen lassen könnte.
		AI_Output(hero, self, "Info_Mod_Per_Pruefung4_E_15_09"); //Ich habe wohl keine andere Wahl.
		AI_Output(self, hero, "Info_Mod_Per_Pruefung4_E_13_10"); //Geh nun zu Genn, er wird dich wieder ins Minental teleportieren.
	};

	Mod_VMG_Pruefung_Per = 2;

	B_LogEntry	(TOPIC_MOD_FAICE_PRUEFUNG, "Bei der letzten Aufgabe bin ich gescheitert. Nun muss ich zu Genn, um zurück ins Minental zu gelangen. Danach spreche ich mit Faice und schaue, was er mir zu sagen hat.");

	Info_Mod_Per_Pruefung4_H();
};

FUNC VOID Info_Mod_Per_Pruefung4_C()
{
	AI_Output(hero, self, "Info_Mod_Per_Pruefung4_C_15_00"); //Ich bin etwas Besonderes.
	AI_Output(self, hero, "Info_Mod_Per_Pruefung4_C_13_01"); //Ist das dein Ernst?

	Info_ClearChoices	(Info_Mod_Per_Pruefung4);

	Info_AddChoice	(Info_Mod_Per_Pruefung4, "Natürlich nicht.", Info_Mod_Per_Pruefung4_G);
	Info_AddChoice	(Info_Mod_Per_Pruefung4, "Natürlich.", Info_Mod_Per_Pruefung4_F);
};

FUNC VOID Info_Mod_Per_Pruefung4_B()
{
	AI_Output(hero, self, "Info_Mod_Per_Pruefung4_B_15_00"); //Die Natur ist etwas Harmonisches und sollte nicht durch Fremdeinflüsse beeinflusst werden.

	Info_Mod_Per_Pruefung4_D();
};

FUNC VOID Info_Mod_Per_Pruefung4_A()
{
	AI_Output(hero, self, "Info_Mod_Per_Pruefung4_A_15_00"); //Nein, sollte ich?

	Info_Mod_Per_Pruefung4_E();
};

FUNC VOID Info_Mod_Per_Pruefung4_G()
{
	AI_Output(hero, self, "Info_Mod_Per_Pruefung4_G_15_00"); //Natürlich nicht. Die Natur ist etwas Harmonisches und sollte nicht durch Fremdeinflüsse beeinflusst werden. Das ist meine Erkenntnis.

	Info_Mod_Per_Pruefung4_D();
};

FUNC VOID Info_Mod_Per_Pruefung4_F()
{
	AI_Output(hero, self, "Info_Mod_Per_Pruefung4_F_15_00"); //Natürlich.

	Info_Mod_Per_Pruefung4_E();
};

INSTANCE Info_Mod_Per_Lernen_DEX (C_INFO)
{
	npc		= Mod_7353_VMG_Per_TUG;
	nr		= 1;
	condition	= Info_Mod_Per_Lernen_DEX_Condition;
	information	= Info_Mod_Per_Lernen_DEX_Info;
	permanent	= 1;
	important	= 0;
	description	= "Bring mir was bei.";
};

FUNC INT Info_Mod_Per_Lernen_DEX_Condition()
{
	if (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Per_Lernen_DEX_Info()
{
	AI_Output(hero, self, "Info_Mod_Per_Lernen_DEX_15_00"); //Bring mir was bei.
	AI_Output(self, hero, "Info_Mod_Per_Lernen_DEX_13_01"); //Was willst du lernen?

	Info_ClearChoices	(Info_Mod_Per_Lernen_DEX);

	Info_AddChoice 		(Info_Mod_Per_Lernen_DEX, DIALOG_BACK, Info_Mod_Per_Lernen_DEX_BACK);
	Info_AddChoice		(Info_Mod_Per_Lernen_DEX, B_BuildLearnString_New(PRINT_LearnDEX5	, B_GetLearnCostAttribute_New(hero, ATR_DEXTERITY), ATR_DEXTERITY)	, Info_Mod_Per_Lernen_DEX_Geschick_5);
	Info_AddChoice		(Info_Mod_Per_Lernen_DEX, B_BuildLearnString_New(PRINT_LearnDEX1	, B_GetLearnCostAttribute(hero, ATR_DEXTERITY), ATR_DEXTERITY)	, Info_Mod_Per_Lernen_DEX_Geschick_1);
};

FUNC VOID Info_Mod_Per_Lernen_DEX_BACK()
{
	Info_ClearChoices (Info_Mod_Per_Lernen_DEX);
};

FUNC VOID Info_Mod_Per_Lernen_DEX_Geschick_5()
{
	B_TeachAttributePoints_New (self, hero, ATR_DEXTERITY, 5, 200);
	
	Info_ClearChoices	(Info_Mod_Per_Lernen_DEX);

	Info_AddChoice 		(Info_Mod_Per_Lernen_DEX, DIALOG_BACK, Info_Mod_Per_Lernen_DEX_BACK);
	Info_AddChoice		(Info_Mod_Per_Lernen_DEX, B_BuildLearnString_New(PRINT_LearnDEX5	, B_GetLearnCostAttribute_New(hero, ATR_DEXTERITY), ATR_DEXTERITY)	, Info_Mod_Per_Lernen_DEX_Geschick_5);
	Info_AddChoice		(Info_Mod_Per_Lernen_DEX, B_BuildLearnString_New(PRINT_LearnDEX1	, B_GetLearnCostAttribute(hero, ATR_DEXTERITY), ATR_DEXTERITY)	, Info_Mod_Per_Lernen_DEX_Geschick_1);
};

FUNC VOID Info_Mod_Per_Lernen_DEX_Geschick_1()
{
	B_TeachAttributePoints (self, hero, ATR_DEXTERITY, 1, 200);
	
	Info_ClearChoices	(Info_Mod_Per_Lernen_DEX);

	Info_AddChoice 		(Info_Mod_Per_Lernen_DEX, DIALOG_BACK, Info_Mod_Per_Lernen_DEX_BACK);
	Info_AddChoice		(Info_Mod_Per_Lernen_DEX, B_BuildLearnString_New(PRINT_LearnDEX5	, B_GetLearnCostAttribute_New(hero, ATR_DEXTERITY), ATR_DEXTERITY)	, Info_Mod_Per_Lernen_DEX_Geschick_5);
	Info_AddChoice		(Info_Mod_Per_Lernen_DEX, B_BuildLearnString_New(PRINT_LearnDEX1	, B_GetLearnCostAttribute(hero, ATR_DEXTERITY), ATR_DEXTERITY)	, Info_Mod_Per_Lernen_DEX_Geschick_1);
};

INSTANCE Info_Mod_Per_Pickpocket (C_INFO)
{
	npc		= Mod_7353_VMG_Per_TUG;
	nr		= 1;
	condition	= Info_Mod_Per_Pickpocket_Condition;
	information	= Info_Mod_Per_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Per_Pickpocket_Condition()
{
	C_Beklauen	(72, ItMi_Gold, 350);
};

FUNC VOID Info_Mod_Per_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Per_Pickpocket);

	Info_AddChoice	(Info_Mod_Per_Pickpocket, DIALOG_BACK, Info_Mod_Per_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Per_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Per_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Per_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Per_Pickpocket);
};

FUNC VOID Info_Mod_Per_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Per_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Per_Pickpocket);

		Info_AddChoice	(Info_Mod_Per_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Per_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Per_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Per_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Per_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Per_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Per_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Per_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Per_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Per_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Per_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Per_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Per_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Per_EXIT (C_INFO)
{
	npc		= Mod_7353_VMG_Per_TUG;
	nr		= 1;
	condition	= Info_Mod_Per_EXIT_Condition;
	information	= Info_Mod_Per_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Per_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Per_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};