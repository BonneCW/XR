INSTANCE Info_Mod_GeistDesAusgleichs_Hi (C_INFO)
{
	npc		= GeistDesAusgleichs_11070_EIS;
	nr		= 1;
	condition	= Info_Mod_GeistDesAusgleichs_Hi_Condition;
	information	= Info_Mod_GeistDesAusgleichs_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_GeistDesAusgleichs_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_GeistDesAusgleichs_Hi_22_00"); //Ich bin der Geist des Ausgleichs. Jenen, die meinen würdig zu sein, werde ich die Prüfung auferlegen.
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Hi_15_01"); //Prüfung? Nicht so schnell! Worum geht es überhaupt?
	AI_Output(self, hero, "Info_Mod_GeistDesAusgleichs_Hi_22_02"); //Es geht um das Verständnis bestimmter Tugenden. Rätsel werde ich dir aufgeben.
	AI_Output(self, hero, "Info_Mod_GeistDesAusgleichs_Hi_22_03"); //Wirst du alle richtig beantworten können, winkt dir eine Belohnung.
	AI_Output(self, hero, "Info_Mod_GeistDesAusgleichs_Hi_22_04"); //Doch wisse, dass sie noch niemals jemand bestanden hat.
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Hi_15_05"); //Droht mir Gefahr, wenn ich scheitere?
	AI_Output(self, hero, "Info_Mod_GeistDesAusgleichs_Hi_22_06"); //Nur jene, dass du die Prüfung auf Neue beginnen musst, willst du sie bestehen. Also, wagst du es?
};

FUNC VOID B_SetRaetsel()
{
	Mod_Raetsel01 = Hlp_Random(10);

	var int ptr; ptr = MEM_StackPos.position;

	if (Mod_Raetsel02 == Mod_Raetsel01)
	{	
		Mod_Raetsel02 = Hlp_Random(10);

		MEM_StackPos.position = ptr;
	};

	ptr = MEM_StackPos.position;

	if (Mod_Raetsel03 == Mod_Raetsel01)
	|| (Mod_Raetsel03 == Mod_Raetsel02)
	{	
		Mod_Raetsel03 = Hlp_Random(10);

		MEM_StackPos.position = ptr;
	};

	ptr = MEM_StackPos.position;

	if (Mod_Raetsel04 == Mod_Raetsel01)
	|| (Mod_Raetsel04 == Mod_Raetsel02)
	|| (Mod_Raetsel04 == Mod_Raetsel03)
	{	
		Mod_Raetsel04 = Hlp_Random(10);

		MEM_StackPos.position = ptr;
	};

	ptr = MEM_StackPos.position;

	if (Mod_Raetsel05 == Mod_Raetsel01)
	|| (Mod_Raetsel05 == Mod_Raetsel02)
	|| (Mod_Raetsel05 == Mod_Raetsel03)
	|| (Mod_Raetsel05 == Mod_Raetsel04)
	{	
		Mod_Raetsel05 = Hlp_Random(10);

		MEM_StackPos.position = ptr;
	};
};

FUNC VOID B_Raetseln(var int raetsel)
{
	Mod_GdG_Frage += 1;

	Info_ClearChoices	(Info_Mod_GeistDesAusgleichs_Raetsel);

	if (raetsel == 0)
	{
		AI_Output(self, hero, "Info_Mod_GeistDesAusgleichs_Raetsel_01_22_00"); //Wer fiel dem machtvollen Hammer zum Opfer?

		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Der Verwegene.", Info_Mod_GeistDesAusgleichs_Raetsel_01_F);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Das Tier.", Info_Mod_GeistDesAusgleichs_Raetsel_01_E);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Der Dämon.", Info_Mod_GeistDesAusgleichs_Raetsel_01_D);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Der Untote.", Info_Mod_GeistDesAusgleichs_Raetsel_01_C);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Der Wächter.", Info_Mod_GeistDesAusgleichs_Raetsel_01_B);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Der Golem.", Info_Mod_GeistDesAusgleichs_Raetsel_01_A);
	}
	else if (raetsel == 1)
	{
		AI_Output(self, hero, "Info_Mod_GeistDesAusgleichs_Raetsel_02_22_01"); //Unter welcher Bürde litt der Letzte?

		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Der Gier.", Info_Mod_GeistDesAusgleichs_Raetsel_02_F);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Der Finsternis.", Info_Mod_GeistDesAusgleichs_Raetsel_02_E);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Dem Gift.", Info_Mod_GeistDesAusgleichs_Raetsel_02_D);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Der Fäulnis.", Info_Mod_GeistDesAusgleichs_Raetsel_02_C);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Dem Blute.", Info_Mod_GeistDesAusgleichs_Raetsel_02_B);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Der Pest.", Info_Mod_GeistDesAusgleichs_Raetsel_02_A);
	}
	else if (raetsel == 2)
	{
		AI_Output(self, hero, "Info_Mod_GeistDesAusgleichs_Raetsel_03_22_02"); //Worum stritten jene zwei, die sich in ihrem Wesen doch so gleich?

		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Um die Erde.", Info_Mod_GeistDesAusgleichs_Raetsel_03_F);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Um den Nachlass.", Info_Mod_GeistDesAusgleichs_Raetsel_03_E);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Um das Leben.", Info_Mod_GeistDesAusgleichs_Raetsel_03_D);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Um die Wiedergeburt.", Info_Mod_GeistDesAusgleichs_Raetsel_03_C);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Um die Macht.", Info_Mod_GeistDesAusgleichs_Raetsel_03_B);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Um das Gold.", Info_Mod_GeistDesAusgleichs_Raetsel_03_A);
	}
	else if (raetsel == 3)
	{
		AI_Output(self, hero, "Info_Mod_GeistDesAusgleichs_Raetsel_04_22_03"); //Der Eindringling glaubte sich vom Göttlichen umgeben und fiel doch welcher Macht anheim?

		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Dem Tier.", Info_Mod_GeistDesAusgleichs_Raetsel_04_F);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Der Wollust.", Info_Mod_GeistDesAusgleichs_Raetsel_04_E);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Der Gier.", Info_Mod_GeistDesAusgleichs_Raetsel_04_D);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Dem Dämonischen.", Info_Mod_GeistDesAusgleichs_Raetsel_04_C);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Der Verdammnis.", Info_Mod_GeistDesAusgleichs_Raetsel_04_B);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Der Finsternis.", Info_Mod_GeistDesAusgleichs_Raetsel_04_A);
	}
	else if (raetsel == 4)
	{
		AI_Output(self, hero, "Info_Mod_GeistDesAusgleichs_Raetsel_05_22_04"); //Zwei aus längst vergangenen Tagen. Der eine nahm die Bürde aus Stein. Wofür?

		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Als Thron für den zweiten.", Info_Mod_GeistDesAusgleichs_Raetsel_05_F);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Als seine Last.", Info_Mod_GeistDesAusgleichs_Raetsel_05_E);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Als sein Gefängnis.", Info_Mod_GeistDesAusgleichs_Raetsel_05_D);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Als seinen Diener.", Info_Mod_GeistDesAusgleichs_Raetsel_05_C);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Als Träger seiner Macht.", Info_Mod_GeistDesAusgleichs_Raetsel_05_B);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Als Zeugnis seiner Herkunft.", Info_Mod_GeistDesAusgleichs_Raetsel_05_A);
	}
	else if (raetsel == 5)
	{
		AI_Output(self, hero, "Info_Mod_GeistDesAusgleichs_Raetsel_06_22_05"); //Jener kam von außen und betrat die Halle der Gemeinschaft. Wovon war er durchdrungen?

		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Vom Göttlichen.", Info_Mod_GeistDesAusgleichs_Raetsel_06_F);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Vom Stein.", Info_Mod_GeistDesAusgleichs_Raetsel_06_E);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Von Zweifeln.", Info_Mod_GeistDesAusgleichs_Raetsel_06_D);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Vom Wasser.", Info_Mod_GeistDesAusgleichs_Raetsel_06_C);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Von Niedertracht.", Info_Mod_GeistDesAusgleichs_Raetsel_06_B);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Vom Feuer.", Info_Mod_GeistDesAusgleichs_Raetsel_06_A);
	}
	else if (raetsel == 6)
	{
		AI_Output(self, hero, "Info_Mod_GeistDesAusgleichs_Raetsel_07_22_06"); //Der Feind betrat die Gestade des Gottes. Wovon wurde er niedergestreckt?

		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Vom Wächter.", Info_Mod_GeistDesAusgleichs_Raetsel_07_F);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Vom Diener.", Info_Mod_GeistDesAusgleichs_Raetsel_07_E);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Von seinem Ebenbild.", Info_Mod_GeistDesAusgleichs_Raetsel_07_D);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Vom Blitz.", Info_Mod_GeistDesAusgleichs_Raetsel_07_C);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Von der Lanze.", Info_Mod_GeistDesAusgleichs_Raetsel_07_B);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Vom Schwert.", Info_Mod_GeistDesAusgleichs_Raetsel_07_A);
	}
	else if (raetsel == 7)
	{
		AI_Output(self, hero, "Info_Mod_GeistDesAusgleichs_Raetsel_08_22_07"); //Obdach, Speis und Trank gewährte er ihm, unwissend, das jener nicht recht schaffend. Denn wonach trachtete sein Gast?

		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Nach seinem Kind.", Info_Mod_GeistDesAusgleichs_Raetsel_08_F);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Nach seinem Wissen.", Info_Mod_GeistDesAusgleichs_Raetsel_08_E);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Nach seinem Frau.", Info_Mod_GeistDesAusgleichs_Raetsel_08_D);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Nach seinem Besitz.", Info_Mod_GeistDesAusgleichs_Raetsel_08_C);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Nach seiner Seele.", Info_Mod_GeistDesAusgleichs_Raetsel_08_B);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Nach seinem Leben.", Info_Mod_GeistDesAusgleichs_Raetsel_08_A);
	}
	else if (raetsel == 8)
	{
		AI_Output(self, hero, "Info_Mod_GeistDesAusgleichs_Raetsel_09_22_08"); //Jener hatte große Tapferkeit bewiesen, die eines Himmlischen würdig. Was war das Werkzeug seiner Taten?

		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Die Unwissenheit.", Info_Mod_GeistDesAusgleichs_Raetsel_09_F);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Die bloßen Hände.", Info_Mod_GeistDesAusgleichs_Raetsel_09_E);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Der Trank.", Info_Mod_GeistDesAusgleichs_Raetsel_09_D);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Magie.", Info_Mod_GeistDesAusgleichs_Raetsel_09_C);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Sein Wille.", Info_Mod_GeistDesAusgleichs_Raetsel_09_B);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Das Schwert.", Info_Mod_GeistDesAusgleichs_Raetsel_09_A);
	}
	else if (raetsel == 9)
	{
		AI_Output(self, hero, "Info_Mod_GeistDesAusgleichs_Raetsel_10_22_09"); //Er entriss des anderen Besitz, nicht ahnend, dass sein eigenes Schicksal damit besiegelt. Denn welches Übel lag darin verborgen?

		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Die Pest.", Info_Mod_GeistDesAusgleichs_Raetsel_10_F);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Das Gift.", Info_Mod_GeistDesAusgleichs_Raetsel_10_E);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Der Wahnsinn.", Info_Mod_GeistDesAusgleichs_Raetsel_10_D);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Das Siechtum.", Info_Mod_GeistDesAusgleichs_Raetsel_10_C);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Der Dämon.", Info_Mod_GeistDesAusgleichs_Raetsel_10_B);
		Info_AddChoice	(Info_Mod_GeistDesAusgleichs_Raetsel, "Der Feuertod.", Info_Mod_GeistDesAusgleichs_Raetsel_10_A);
	};
};

FUNC VOID B_RaetselAuswertung()
{
	if (Mod_GdG_Richtig == 5)
	{
		AI_Output(self, hero, "Info_Mod_GeistDesAusgleichs_RaetselAuswertung_01_22_00"); //Du hast weise und recht geantwortet.
		AI_Output(self, hero, "Info_Mod_GeistDesAusgleichs_RaetselAuswertung_01_22_01"); //Die Bedeutung des Humors hast du verstanden, und deine Fähigkeiten, auf andere Menschen Einfluss zu nehmen, werde ich vergrößern.
		AI_Output(self, hero, "Info_Mod_GeistDesAusgleichs_RaetselAuswertung_01_22_02"); //Meine Aufgabe ist damit getan. Leb wohl.

		B_GivePlayerXP	(1500);

		B_ShowGivenThings	("Rune des Vergessens, 3 Spruchrollen Angst und 5 Spruchrollen Schlaf");

		CreateInvItems	(hero, ItRu_Charm, 1);
		CreateInvItems	(hero, ItSc_Fear, 3);
		CreateInvItems	(hero, ItSc_Sleep, 5);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_GeistDesAusgleichs_RaetselAuswertung_01_22_03"); //Deine Antworten waren fehlerhaft. Entweder mangelt es dir am Wissen, oder am Verständnis.
		AI_Output(self, hero, "Info_Mod_GeistDesAusgleichs_RaetselAuswertung_01_22_04"); //Komme wieder, wenn du so weit bist.
	};

	Info_ClearChoices	(Info_Mod_GeistDesAusgleichs_Raetsel);
};

FUNC VOID B_Raetseln2()
{
	if (Mod_GdG_Frage == 1)
	{
		B_Raetseln(Mod_Raetsel02);
	}
	else if (Mod_GdG_Frage == 2)
	{
		B_Raetseln(Mod_Raetsel03);
	}
	else if (Mod_GdG_Frage == 3)
	{
		B_Raetseln(Mod_Raetsel04);
	}
	else if (Mod_GdG_Frage == 4)
	{
		B_Raetseln(Mod_Raetsel05);
	}
	else
	{
		B_RaetselAuswertung();
	};
};

INSTANCE Info_Mod_GeistDesAusgleichs_Raetsel (C_INFO)
{
	npc		= GeistDesAusgleichs_11070_EIS;
	nr		= 1;
	condition	= Info_Mod_GeistDesAusgleichs_Raetsel_Condition;
	information	= Info_Mod_GeistDesAusgleichs_Raetsel_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich will mich deiner Prüfung unterziehen.";
};

FUNC INT Info_Mod_GeistDesAusgleichs_Raetsel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_GeistDesAusgleichs_Hi))
	&& (Mod_GdG_Richtig != 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_Info()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_15_00"); //Ich will mich deiner Prüfung unterziehen.
	AI_Output(self, hero, "Info_Mod_GeistDesAusgleichs_Raetsel_22_01"); //So sei es. Höre denn nun und antworte mit Bedacht.

	Mod_GdG_Frage = 0;

	Mod_GdG_Richtig = 0;

	// Auswürfeln der 5 Fragen

	B_SetRaetsel();

	B_Raetseln(Mod_Raetsel01);
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_01_F()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_01_F_15_00"); //Der Verwegene.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_01_E()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_01_E_15_00"); //Das Tier.

	Mod_GdG_Richtig += 1;

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_01_D()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_01_D_15_00"); //Der Dämon.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_01_C()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_01_C_15_00"); //Der Untote.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_01_B()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_01_B_15_00"); //Der Wächter.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_01_A()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_01_A_15_00"); //Der Golem.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_02_F()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_02_F_15_00"); //Der Gier.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_02_E()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_02_E_15_00"); //Der Finsternis.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_02_D()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_02_D_15_00"); //Dem Gift.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_02_C()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_02_C_15_00"); //Der Fäulnis.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_02_B()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_02_B_15_00"); //Dem Blute.

	Mod_GdG_Richtig += 1;

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_02_A()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_02_A_15_00"); //Der Pest.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_03_F()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_03_F_15_00"); //Um die Erde.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_03_E()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_03_E_15_00"); //Um den Nachlass.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_03_D()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_03_D_15_00"); //Um das Leben.

	Mod_GdG_Richtig += 1;

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_03_C()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_03_C_15_00"); //Um die Wiedergeburt.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_03_B()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_03_B_15_00"); //Um die Macht.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_03_A()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_03_A_15_00"); //Um das Gold.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_04_F()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_04_F_15_00"); //Dem Tier.

	Mod_GdG_Richtig += 1;

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_04_E()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_04_E_15_00"); //Der Wollust.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_04_D()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_04_D_15_00"); //Der Gier.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_04_C()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_04_C_15_00"); //Dem Dämonischen.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_04_B()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_04_B_15_00"); //Der Verdammnis.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_04_A()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_04_A_15_00"); //Der Finsternis.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_05_F()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_05_F_15_00"); //Als Thron für den zweiten.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_05_E()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_05_E_15_00"); //Als seine Last.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_05_D()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_05_D_15_00"); //Als sein Gefängnis.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_05_C()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_05_C_15_00"); //Als seinen Diener.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_05_B()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_05_B_15_00"); //Als Träger seiner Macht.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_05_A()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_05_A_15_00"); //Als Zeugnis seiner Herkunft.

	Mod_GdG_Richtig += 1;

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_06_F()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_06_F_15_00"); //Vom Göttlichen.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_06_E()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_06_E_15_00"); //Vom Stein.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_06_D()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_06_D_15_00"); //Von Zweifeln.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_06_C()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_06_C_15_00"); //Vom Wasser.

	Mod_GdG_Richtig += 1;

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_06_B()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_06_B_15_00"); //Von Niedertracht.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_06_A()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_06_A_15_00"); //Vom Feuer.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_07_F()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_07_F_15_00"); //Vom Wächter.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_07_E()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_07_E_15_00"); //Vom Diener.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_07_D()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_07_D_15_00"); //Von seinem Ebenbild.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_07_C()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_07_C_15_00"); //Vom Blitz.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_07_B()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_07_B_15_00"); //Von der Lanze.

	Mod_GdG_Richtig += 1;

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_07_A()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_07_A_15_00"); //Vom Schwert.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_08_F()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_08_F_15_00"); //Nach seinem Kind.

	Mod_GdG_Richtig += 1;

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_08_E()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_08_E_15_00"); //Nach seinem Wissen.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_08_D()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_08_D_15_00"); //Nach seinem Frau.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_08_C()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_08_C_15_00"); //Nach seinem Besitz.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_08_B()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_08_B_15_00"); //Nach seiner Seele.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_08_A()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_08_A_15_00"); //Nach seinem Leben.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_09_F()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_09_F_15_00"); //Die Unwissenheit.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_09_E()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_09_E_15_00"); //Die bloßen Hände.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_09_D()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_09_D_15_00"); //Der Trank.

	Mod_GdG_Richtig += 1;

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_09_C()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_09_C_15_00"); //Magie.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_09_B()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_09_B_15_00"); //Sein Wille.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_09_A()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_09_A_15_00"); //Das Schwert.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_10_F()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_10_F_15_00"); //Die Pest.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_10_E()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_10_E_15_00"); //Das Gift.

	Mod_GdG_Richtig += 1;

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_10_D()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_10_D_15_00"); //Der Wahnsinn.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_10_C()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_10_C_15_00"); //Das Siechtum.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_10_B()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_10_B_15_00"); //Der Dämon.

	B_Raetseln2();
};

FUNC VOID Info_Mod_GeistDesAusgleichs_Raetsel_10_A()
{
	AI_Output(hero, self, "Info_Mod_GeistDesAusgleichs_Raetsel_10_A_15_00"); //Der Feuertod.

	B_Raetseln2();
};

INSTANCE Info_Mod_GeistDesAusgleichs_EXIT (C_INFO)
{
	npc		= GeistDesAusgleichs_11070_EIS;
	nr		= 1;
	condition	= Info_Mod_GeistDesAusgleichs_EXIT_Condition;
	information	= Info_Mod_GeistDesAusgleichs_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_GeistDesAusgleichs_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_GeistDesAusgleichs_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};