INSTANCE Info_Mod_August_Hi (C_INFO)
{
	npc		= Mod_7385_OUT_August_REL;
	nr		= 1;
	condition	= Info_Mod_August_Hi_Condition;
	information	= Info_Mod_August_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_August_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_August_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_August_Hi_13_00"); //Halt! Deine Fresse kenn ich nicht.
	AI_Output(self, hero, "Info_Mod_August_Hi_13_01"); //Das bedeutet, ich hab dir die Regeln der Stadt noch nicht vorgelesen - oder du hast dich von 'nem Schattenläufer "umoperieren" lassen. (lacht merkwürdig)
	AI_Output(self, hero, "Info_Mod_August_Hi_13_02"); //Ich kann den bescheuerten Text immer noch nicht auswendig, also muss ich zwischendurch mal aufs Papier gucken, wenn es dir nichts ausmacht.

	B_UseFakeScroll ();

	AI_Output(self, hero, "Info_Mod_August_Hi_13_03"); //(liest stockend) Die vier Gebote für Stadtfremde.
	AI_Output(self, hero, "Info_Mod_August_Hi_13_04"); //Erstens: Der Gebrauch von Freudenspender innerhalb der Stadtmauern ist untersagt.
	AI_Output(self, hero, "Info_Mod_August_Hi_13_05"); //Haha, gilt wenigstens nur für euch Fremde.

	B_UseFakeScroll ();

	AI_Output(self, hero, "Info_Mod_August_Hi_13_06"); //Zweitens: Den drei gezähmten Ratten des Stadthalters soll gehuldigt werden.
	AI_Output(self, hero, "Info_Mod_August_Hi_13_07"); //Das hat sich übrigens erledigt, die sind gestorben.

	B_UseFakeScroll ();

	AI_Output(self, hero, "Info_Mod_August_Hi_13_08"); //Drittens: Jegliche Anwendung von Gewalt ist untersagt.

	B_UseFakeScroll ();

	AI_Output(self, hero, "Info_Mod_August_Hi_13_09"); //Viertens: Die Huldigung Beliars und Ausübung von Gräueln in seinem Namen können mit dem Feuertod bestraft werden.

	if (Mod_Gottstatus == 1)
	|| (Mod_Gottstatus == 2)
	|| (Mod_Gottstatus == 3)
	|| (Mod_Gottstatus == 4)
	{
		AI_Output(self, hero, "Info_Mod_August_Hi_13_10"); //Oh ja, das könnte ganz besonders für dich interessant sein.
	};

	AI_Output(self, hero, "Info_Mod_August_Hi_13_11"); //Das war's. Noch irgendwelche Fragen?

	AI_PlayAni	(self, "T_HUNGER");

	AI_Output(self, hero, "Info_Mod_August_Hi_13_12"); //(murmelt) Ich könnte auch mal wieder was zum Beißen vertragen ...

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_August_Essenholen (C_INFO)
{
	npc		= Mod_7385_OUT_August_REL;
	nr		= 1;
	condition	= Info_Mod_August_Essenholen_Condition;
	information	= Info_Mod_August_Essenholen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Soll ich dir was Essbares besorgen?";
};

FUNC INT Info_Mod_August_Essenholen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_August_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_August_Essenholen_Info()
{
	AI_Output(hero, self, "Info_Mod_August_Essenholen_15_00"); //Soll ich dir was Essbares besorgen?
	AI_Output(self, hero, "Info_Mod_August_Essenholen_13_01"); //Oh ja! Ich hätte so richtig Hunger auf eine Spezialität des Gasthauses, das gepökelte Lammfleisch.
	AI_Output(self, hero, "Info_Mod_August_Essenholen_13_02"); //Zwei Rationen, und das Geld geb ich dir natürlich wieder.

	Log_CreateTopic	(TOPIC_MOD_KHORATA_FRISCHFLEISCH, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_KHORATA_FRISCHFLEISCH, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_KHORATA_FRISCHFLEISCH, "Der Torwächter August wünscht sich zwei Rationen gepökeltes Lammfleisch aus dem Gasthaus Khoratas.");
};

INSTANCE Info_Mod_August_EssenGeholt (C_INFO)
{
	npc		= Mod_7385_OUT_August_REL;
	nr		= 1;
	condition	= Info_Mod_August_EssenGeholt_Condition;
	information	= Info_Mod_August_EssenGeholt_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier hast du dein Essen.";
};

FUNC INT Info_Mod_August_EssenGeholt_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_August_Essenholen))
	&& (Npc_HasItems(hero, ItFo_LammPoekelfleisch) >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_August_EssenGeholt_Info()
{
	AI_Output(hero, self, "Info_Mod_August_EssenGeholt_15_00"); //Hier hast du dein Essen.

	B_GiveInvItems	(hero, self, ItFo_LammPoekelfleisch, 2);

	AI_Output(self, hero, "Info_Mod_August_EssenGeholt_13_01"); //Dank dir! Nimm das!

	B_GiveInvItems	(self, hero, ItMi_Gold, 50);

	B_GivePlayerXP	(50);

	B_LogEntry	(TOPIC_MOD_KHORATA_FRISCHFLEISCH, "Ich konnte den Auftrag zu Hans' Zufriedenheit ausführen.");
	B_SetTopicStatus	(TOPIC_MOD_KHORATA_FRISCHFLEISCH, LOG_SUCCESS);

	CurrentNQ += 1;

	Mod_REL_QuestCounter += 1;

	Info_ClearChoices	(Info_Mod_August_EssenGeholt);

	Info_AddChoice	(Info_Mod_August_EssenGeholt, "Bis bald.", Info_Mod_August_EssenGeholt_B);
	Info_AddChoice	(Info_Mod_August_EssenGeholt, "Ein bisschen wenig ... (Feilschen)", Info_Mod_August_EssenGeholt_A);
};

FUNC VOID Info_Mod_August_EssenGeholt_B()
{
	AI_Output(hero, self, "Info_Mod_August_EssenGeholt_B_15_00"); //Bis bald.

	Info_ClearChoices	(Info_Mod_August_EssenGeholt);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_August_EssenGeholt_A()
{
	AI_Output(hero, self, "Info_Mod_August_EssenGeholt_A_15_00"); //Ein bisschen wenig ...

	if (self.aivar[AIV_Verhandlung] == TRUE)
	{
		AI_Output(self, hero, "Info_Mod_August_EssenGeholt_A_13_01"); //Hast Recht, hast mehr verdient.

		B_GiveInvItems	(self, hero, ItMi_Gold, 50);
	
		B_GivePlayerXP	(10);

		B_RaiseHandelsgeschick (2);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_August_EssenGeholt_A_13_02"); //Du machst Späße!
	};

	Info_ClearChoices	(Info_Mod_August_EssenGeholt);
};

INSTANCE Info_Mod_August_Plagenquest (C_INFO)
{
	npc		= Mod_7385_OUT_August_REL;
	nr		= 1;
	condition	= Info_Mod_August_Plagenquest_Condition;
	information	= Info_Mod_August_Plagenquest_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_August_Plagenquest_Condition()
{
	if (Mod_WM_UnheilFertig == 2)
	&& (Mod_REL_Stadthalter > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_August_Plagenquest_Info()
{
	if (Mod_REL_Stadthalter == 1)
	{
		AI_Output(self, hero, "Info_Mod_August_Plagenquest_13_00"); //Verdammt, hoffentlich findet Theodorus bald etwas heraus.

		Log_CreateTopic	(TOPIC_MOD_ADANOS_DRECKSVIECHER, LOG_MISSION);
		B_SetTopicStatus	(TOPIC_MOD_ADANOS_DRECKSVIECHER, LOG_RUNNING);
		B_LogEntry	(TOPIC_MOD_ADANOS_DRECKSVIECHER, "Khorata scheint ein Problem mit Insekten zu haben. Theodorus wird hoffentlich mehr dazu sagen können.");
	}
	else if (Mod_REL_Stadthalter == 2)
	{
		AI_Output(self, hero, "Info_Mod_August_Plagenquest_13_01"); //Verdammt, hoffentlich findet Wendel bald etwas heraus.

		Log_CreateTopic	(TOPIC_MOD_ADANOS_DRECKSVIECHER, LOG_MISSION);
		B_SetTopicStatus	(TOPIC_MOD_ADANOS_DRECKSVIECHER, LOG_RUNNING);
		B_LogEntry	(TOPIC_MOD_ADANOS_DRECKSVIECHER, "Khorata scheint ein Problem mit Insekten zu haben. Wendel wird hoffentlich mehr dazu sagen können.");
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_August_Plagenquest_13_02"); //Verdammt, hoffentlich findet Lukas bald etwas heraus.

		Log_CreateTopic	(TOPIC_MOD_ADANOS_DRECKSVIECHER, LOG_MISSION);
		B_SetTopicStatus	(TOPIC_MOD_ADANOS_DRECKSVIECHER, LOG_RUNNING);
		B_LogEntry	(TOPIC_MOD_ADANOS_DRECKSVIECHER, "Khorata scheint ein Problem mit Insekten zu haben. Lukas wird hoffentlich mehr dazu sagen können.");
	};

	AI_Output(self, hero, "Info_Mod_August_Plagenquest_13_03"); //Die ganzen Scheißviecher ... erinnert mich an meinen bisher übelsten Trip, den ich hatte.
};

INSTANCE Info_Mod_August_Zurechtfinden (C_INFO)
{
	npc		= Mod_7385_OUT_August_REL;
	nr		= 1;
	condition	= Info_Mod_August_Zurechtfinden_Condition;
	information	= Info_Mod_August_Zurechtfinden_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie finde ich mich hier zurecht?";
};

FUNC INT Info_Mod_August_Zurechtfinden_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_August_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_August_Zurechtfinden_Info()
{
	AI_Output(hero, self, "Info_Mod_August_Zurechtfinden_15_00"); //Wie finde ich mich hier zurecht?
	AI_Output(self, hero, "Info_Mod_August_Zurechtfinden_13_01"); //Das ist gar nicht so schwierig. Einfach die Hauptstraße hier geradeaus, und du kommst zum Marktplatz.
	AI_Output(self, hero, "Info_Mod_August_Zurechtfinden_13_02"); //Links davon geht eine Straße ab, die führt dich geradewegs zum Gericht.
	AI_Output(self, hero, "Info_Mod_August_Zurechtfinden_13_03"); //Und von dort nochmal links und du landest beim Gasthaus. Das sollte fürs Erste genügen.
	AI_Output(self, hero, "Info_Mod_August_Zurechtfinden_13_04"); //Wenn du geführt werden willst, frag doch Hubert, der lungert häufig hier beim Tor herum.
};

INSTANCE Info_Mod_August_KhorataOrganisation (C_INFO)
{
	npc		= Mod_7385_OUT_August_REL;
	nr		= 1;
	condition	= Info_Mod_August_KhorataOrganisation_Condition;
	information	= Info_Mod_August_KhorataOrganisation_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie ist Khorata organisiert?";
};

FUNC INT Info_Mod_August_KhorataOrganisation_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_August_Hi))
	&& (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_August_KhorataOrganisation_Info()
{
	AI_Output(hero, self, "Info_Mod_August_KhorataOrganisation_15_00"); //Wie ist Khorata organisiert?
	AI_Output(self, hero, "Info_Mod_August_KhorataOrganisation_13_01"); //Kann ich dir auch nicht ganz genau erklären.
	AI_Output(self, hero, "Info_Mod_August_KhorataOrganisation_13_02"); //Unser Stadthalter Anselm kümmert sich um die ganzen Vorschriften und neuen Gesetze, der Richter und seine zwei Schöppen leiten das Gericht, und wir Wachen sorgen dafür, dass alles ruhig bleibt.
	AI_Output(self, hero, "Info_Mod_August_KhorataOrganisation_13_03"); //Durch den Handel mit Freudenspender macht Khorata ganz ordentlich Gewinn, und was die Händler dafür alles kaufen!
	AI_Output(self, hero, "Info_Mod_August_KhorataOrganisation_13_04"); //Schleppen ganz schön viel Zeug rein in die Stadt, ich bekomm's ja hier mit.
};

INSTANCE Info_Mod_August_Buerger (C_INFO)
{
	npc		= Mod_7385_OUT_August_REL;
	nr		= 1;
	condition	= Info_Mod_August_Buerger_Condition;
	information	= Info_Mod_August_Buerger_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du hattest doch mal die drei Ratten von Anselm erwähnt ...";
};

FUNC INT Info_Mod_August_Buerger_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Anselm_Buerger2))
	&& (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_August_Buerger_Info()
{
	AI_Output(hero, self, "Info_Mod_August_Buerger_15_00"); //Du hattest doch mal die drei Ratten von Anselm erwähnt ...
	AI_Output(self, hero, "Info_Mod_August_Buerger_13_01"); //Die toten Drecksviecher, genau. Was ist mit denen?
	AI_Output(hero, self, "Info_Mod_August_Buerger_15_02"); //Kennst du ihre Namen?
	AI_Output(self, hero, "Info_Mod_August_Buerger_13_03"); //Türlich. Damals, als die noch gelebt haben, mussten wir von der Wache ihnen täglich huldigen.
	AI_Output(self, hero, "Info_Mod_August_Buerger_13_04"); //Oleg, Pinky und Fievel. Haha, echt kranke Namen für so olle Ratten, oder?
	AI_Output(hero, self, "Info_Mod_August_Buerger_15_05"); //Stimmt. Dank dir für die Information.
	AI_Output(self, hero, "Info_Mod_August_Buerger_13_06"); //Nix zu danken.
};

INSTANCE Info_Mod_August_Buerger2 (C_INFO)
{
	npc		= Mod_7385_OUT_August_REL;
	nr		= 1;
	condition	= Info_Mod_August_Buerger2_Condition;
	information	= Info_Mod_August_Buerger2_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_Mod_August_Buerger2_Condition()
{
	if (Mod_REL_Buerger == 1)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_August_Buerger2_Info()
{
	AI_Output(self, hero, "Info_Mod_August_Buerger2_13_00"); //Na, die Stadtsbürgerschaft hast du gekriegt? Meinen Glückwunsch, bist ein guter Mann.
};

INSTANCE Info_Mod_August_Unruhen (C_INFO)
{
	npc		= Mod_7385_OUT_August_REL;
	nr		= 1;
	condition	= Info_Mod_August_Unruhen_Condition;
	information	= Info_Mod_August_Unruhen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_August_Unruhen_Condition()
{
	if (Kapitel >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_August_Unruhen_Info()
{
	AI_Output(self, hero, "Info_Mod_August_Unruhen_13_00"); //(grimmig) Kein guter Zeitpunkt, um hier anzukommen, fürchte ich.
	AI_Output(hero, self, "Info_Mod_August_Unruhen_15_01"); //Was ist passiert?
	AI_Output(self, hero, "Info_Mod_August_Unruhen_13_02"); //Lauter Scheiße. Es begann damit, dass die Buddler in unserer Mine mehr Lohn und bessere Arbeitsbedingungen forderten.
	AI_Output(self, hero, "Info_Mod_August_Unruhen_13_03"); //Aber Anselm ließ nicht mit sich reden.
	AI_Output(self, hero, "Info_Mod_August_Unruhen_13_04"); //Daraufhin haben die Bergleute sich geweigert, weiterzuarbeiten, und dazu haben sie ihren Aufseher Frazer überwältigt und gefesselt.
	AI_Output(self, hero, "Info_Mod_August_Unruhen_13_05"); //Anselm hat Tyrus und Dalton geschickt, um die Buddler wieder zum Arbeiten zu bringen.
	AI_Output(self, hero, "Info_Mod_August_Unruhen_13_06"); //Scheiße! Gerade Tyrus und Dalton, die beiden Hitzköpfe.
	AI_Output(self, hero, "Info_Mod_August_Unruhen_13_07"); //Natürlich ist der Streit eskaliert, und dann kamen die Spitzhacken ins Spiel.
	AI_Output(self, hero, "Info_Mod_August_Unruhen_13_08"); //Wir haben uns noch nicht getraut, die beiden Leichen vor der Mine wegzuholen.
	AI_Output(hero, self, "Info_Mod_August_Unruhen_15_09"); //Klingt nach einem gewaltigen Problem.
	AI_Output(self, hero, "Info_Mod_August_Unruhen_13_10"); //Wenn das nur alles wäre! Anselm hat sich aus dem Staub gemacht, und wir haben keinen Stadthalter mehr!
	AI_Output(self, hero, "Info_Mod_August_Unruhen_13_11"); //Und ohne einen verdammten Anführer will sich niemand um die Verhandlungen mit den Buddlern kümmern.
	AI_Output(self, hero, "Info_Mod_August_Unruhen_13_12"); //Du hast nicht zufällig Lust auf das Amt?
	AI_Output(hero, self, "Info_Mod_August_Unruhen_15_13"); //Tut mir Leid, aber das entspricht nicht meiner Vorstellung der Zukunft.
	AI_Output(self, hero, "Info_Mod_August_Unruhen_13_14"); //(verzweifelt) Könntest du dich dann wenigstens um einen Nachfolger für Anselm kümmern?

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_August_Unruhen2 (C_INFO)
{
	npc		= Mod_7385_OUT_August_REL;
	nr		= 1;
	condition	= Info_Mod_August_Unruhen2_Condition;
	information	= Info_Mod_August_Unruhen2_Info;
	permanent	= 0;
	important	= 0;
	description	= "In Ordnung, ich mache mich auf die Suche.";
};

FUNC INT Info_Mod_August_Unruhen2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_August_Unruhen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_August_Unruhen2_Info()
{
	AI_Output(hero, self, "Info_Mod_August_Unruhen2_15_00"); //In Ordnung, ich mache mich auf die Suche.
	AI_Output(self, hero, "Info_Mod_August_Unruhen2_13_01"); //In meinen Augen gibt's drei geeignete Kandidaten: Lukas, Wendel und Theodorus.
	AI_Output(self, hero, "Info_Mod_August_Unruhen2_13_02"); //Sprich mit ihnen und versuch sie zu überzeugen.
	AI_Output(self, hero, "Info_Mod_August_Unruhen2_13_03"); //Wenn du sie alle angehört hast, entscheide dich und berichte mir.
	AI_Output(self, hero, "Info_Mod_August_Unruhen2_13_04"); //Wir vertrauen auf dich.

	Log_CreateTopic	(TOPIC_MOD_KHORATA_UNRUHEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_KHORATA_UNRUHEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_KHORATA_UNRUHEN, "In Khorata geht es drunter und drüber: Die Buddler proben einen Aufstand, und die Städter haben ihr Oberhaupt verloren und versinken im Chaos. August meint, Lukas, Wendel und Theodorus würden sich als nachfolgende Stadthalter eignen. Ich sollte mit jedem von ihnen sprechen.");
};

INSTANCE Info_Mod_August_Unruhen3 (C_INFO)
{
	npc		= Mod_7385_OUT_August_REL;
	nr		= 1;
	condition	= Info_Mod_August_Unruhen3_Condition;
	information	= Info_Mod_August_Unruhen3_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich habe mich entschieden.";
};

FUNC INT Info_Mod_August_Unruhen3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_August_Unruhen2))
	&& (Mod_REL_Kandidat == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_August_Unruhen3_Info()
{
	AI_Output(hero, self, "Info_Mod_August_Unruhen3_15_00"); //Ich habe mich entschieden.
	AI_Output(self, hero, "Info_Mod_August_Unruhen3_13_01"); //Spuck's aus.

	Info_ClearChoices	(Info_Mod_August_Unruhen3);

	Info_AddChoice	(Info_Mod_August_Unruhen3, "Ich brauche doch noch Zeit ...", Info_Mod_August_Unruhen3_BACK);

	Info_AddChoice	(Info_Mod_August_Unruhen3, "Lukas soll neuer Stadthalter werden.", Info_Mod_August_Unruhen3_C);
	Info_AddChoice	(Info_Mod_August_Unruhen3, "Wendel soll neuer Stadthalter werden.", Info_Mod_August_Unruhen3_B);
	Info_AddChoice	(Info_Mod_August_Unruhen3, "Theodorus soll neuer Stadthalter werden.", Info_Mod_August_Unruhen3_A);
};

FUNC VOID Info_Mod_August_Unruhen3_BACK()
{
	AI_Output(hero, self, "Info_Mod_August_Unruhen3_BACK_15_00"); //Ich brauche doch noch Zeit ...

	Info_ClearChoices	(Info_Mod_August_Unruhen3);
};

FUNC VOID Info_Mod_August_Unruhen3_C()
{
	AI_Output(hero, self, "Info_Mod_August_Unruhen3_C_15_00"); //Lukas soll neuer Stadthalter werden.
	AI_Output(self, hero, "Info_Mod_August_Unruhen3_C_13_01"); //Ja, der gute Lukas wird's richten.
	AI_Output(self, hero, "Info_Mod_August_Unruhen3_C_13_02"); //Geh zu ihm und richte ihm die freudige Botschaft aus, ich kümmere mich darum, dass die ganze Stadt davon erfährt.

	Mod_REL_Kandidat = 4;

	B_LogEntry	(TOPIC_MOD_KHORATA_UNRUHEN, "Ich habe die Aufgabe, Lukas davon in Erfahrung zu setzen, dass er der neue Stadthalter ist.");

	Info_ClearChoices	(Info_Mod_August_Unruhen3);
};

FUNC VOID Info_Mod_August_Unruhen3_B()
{
	AI_Output(hero, self, "Info_Mod_August_Unruhen3_B_15_00"); //Wendel soll neuer Stadthalter werden.
	AI_Output(self, hero, "Info_Mod_August_Unruhen3_B_13_01"); //Dann lass uns hoffen, dass Wendel genug Biss hat.
	AI_Output(self, hero, "Info_Mod_August_Unruhen3_B_13_02"); //Teil ihm die Neuigkeiten mit, ich werde sie in der Stadt bekannt machen.

	Mod_REL_Kandidat = 3;

	B_LogEntry	(TOPIC_MOD_KHORATA_UNRUHEN, "Wendel soll von mir erfahren, dass er der neue Stadthalter ist.");

	Info_ClearChoices	(Info_Mod_August_Unruhen3);
};

FUNC VOID Info_Mod_August_Unruhen3_A()
{
	AI_Output(hero, self, "Info_Mod_August_Unruhen3_A_15_00"); //Theodorus soll neuer Stadthalter werden.
	AI_Output(self, hero, "Info_Mod_August_Unruhen3_A_13_01"); //Eine ... ungewöhnliche Wahl. Na gut, du wirst schon wissen, was du da sagst.
	AI_Output(self, hero, "Info_Mod_August_Unruhen3_A_13_02"); //Ich werde es der restlichen Bevölkerung mitteilen.
	AI_Output(self, hero, "Info_Mod_August_Unruhen3_A_13_03"); //Du solltest Theodorus in die Stadt führen und ihm seine neue Behausung zeigen.

	Mod_REL_Kandidat = 2;

	B_LogEntry	(TOPIC_MOD_KHORATA_UNRUHEN, "Ich soll als nächstes Theodorus zu seinem neuen Dienstgebäude führen.");

	Info_ClearChoices	(Info_Mod_August_Unruhen3);
};

INSTANCE Info_Mod_August_Freudenspender (C_INFO)
{
	npc		= Mod_7385_OUT_August_REL;
	nr		= 1;
	condition	= Info_Mod_August_Freudenspender_Condition;
	information	= Info_Mod_August_Freudenspender_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Ich hab hier Freudenspender ...";
};                       

FUNC INT Info_Mod_August_Freudenspender_Condition()
{
	if (Npc_HasItems(hero, ItMi_Freudenspender) >= 1)
	&& (Mod_Freudenspender < 5)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Hi))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_August_Freudenspender_Info()
{
	AI_Output(hero, self, "Info_Mod_August_Freudenspender_15_00"); //Ich hab hier Freudenspender ...
	AI_Output(self, hero, "Info_Mod_August_Freudenspender_13_01"); //... das du nicht in der Stadt konsumieren darfst, genau. Halt dich dran.
};

INSTANCE Info_Mod_August_Penner (C_INFO)
{
	npc		= Mod_7385_OUT_August_REL;
	nr		= 1;
	condition	= Info_Mod_August_Penner_Condition;
	information	= Info_Mod_August_Penner_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_Mod_August_Penner_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cyrco_Sweetwater2))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_August_Penner_Info()
{
	AI_Output(self, hero, "Info_Mod_August_Penner_13_00"); //Schau her! Ein neues Gesich ... Nein. Dich hab ich schon mal gesehen.
	AI_Output(hero, self, "Info_Mod_August_Penner_15_01"); //Wohl wahr.

	if (Npc_KnowsInfo(hero, Info_Mod_August_EssenGeholt))
	{
		AI_Output(hero, self, "Info_Mod_August_Penner_15_02"); //Habe dir das Frühstück gebracht.
		AI_Output(self, hero, "Info_Mod_August_Penner_13_03"); //(eifrig) Genau! Das gepökelte Lamm. Köstlich, köstlich. Würdest du ...
		AI_Output(hero, self, "Info_Mod_August_Penner_15_04"); //Ich verstehe. Noch eine Portion ...
		AI_Output(self, hero, "Info_Mod_August_Penner_13_05"); //Genau! Und ein Fladenbrot vom Bäcker dazu, wenn's recht ist, und ein Dunkelbier aus der Brauerei.
		AI_Output(self, hero, "Info_Mod_August_Penner_13_06"); //Das Lamm vom  Fleischer ist fast noch besser, als das von den Peter. So drei Keulen dürfen's sein.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_August_Penner_13_07"); //Könntest du mir einen Gefallen tun?
		AI_Output(hero, self, "Info_Mod_August_Penner_15_08"); //Sicher, was gibt's?
		AI_Output(self, hero, "Info_Mod_August_Penner_13_09"); //Könntest du mir eine Portion gepökeltes Lammfleisch von Peter oder dem Metzger, ein Fladenbrot vom Bäcker und ein Dunkelbier vom Brauer besorgen?
	};

	AI_Output(hero, self, "Info_Mod_August_Penner_15_10"); //Alkohol im Dienst? Wenn ich das dem Stadthalter sage ...
	AI_Output(self, hero, "Info_Mod_August_Penner_13_11"); //Sagst du nicht. Weil, ich hätte da ein ganz heißes Teil für dich.
	AI_Output(hero, self, "Info_Mod_August_Penner_15_12"); //So? Was denn?
	AI_Output(self, hero, "Info_Mod_August_Penner_13_13"); //Erst den Happen.

	Log_CreateTopic	(TOPIC_MOD_JG_AUGUST, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_JG_AUGUST, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_JG_AUGUST, "Soll für August Essen besorgen. Gepökeltes Lamm von Peter oder dem Metzger, Fladenbrot vom Bäcker und Dunkelbier vom Brauer.");

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_August_Penner2 (C_INFO)
{
	npc		= Mod_7385_OUT_August_REL;
	nr		= 1;
	condition	= Info_Mod_August_Penner2_Condition;
	information	= Info_Mod_August_Penner2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier, dein Festmal.";
};                       

FUNC INT Info_Mod_August_Penner2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_August_Penner))
	&& (Npc_HasItems(hero, ItFo_LammPoekelfleisch) >= 3)
	&& (Npc_HasItems(hero, ItFo_Fladenbrot) >= 1)
	&& (Npc_HasItems(hero, ItFo_Dunkelbier) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_August_Penner2_Info()
{
	AI_Output(hero, self, "Info_Mod_August_Penner2_15_00"); //Hier, dein Festmahl.

	Npc_RemoveInvItems	(hero, ItFo_LammPoekelfleisch, 3);
	Npc_RemoveInvItems	(hero, ItFo_Fladenbrot, 1);
	Npc_RemoveInvItems	(hero, ItFo_Dunkelbier, 1);

	B_ShowGivenThings	("3 gepökeltes Lammfleisch, Fladenbrot und Dunkelbier gegeben");

	AI_Output(self, hero, "Info_Mod_August_Penner2_13_01"); //Gib schon her. Hab Kohldampf.
	AI_Output(hero, self, "Info_Mod_August_Penner2_15_02"); //Was ist jetzt mit dem heißen Teil?
	AI_Output(self, hero, "Info_Mod_August_Penner2_13_03"); //Also letzthin hatte ich Dienst auf dem Wachturm am Pass.
	AI_Output(self, hero, "Info_Mod_August_Penner2_13_04"); //Wie ich so den Hang hochlaufe, stolpere ich doch über dieses Ding hier. Ist garantiert wertvoll, das Teil.
	AI_Output(hero, self, "Info_Mod_August_Penner2_15_05"); //Zeig her.
	AI_Output(self, hero, "Info_Mod_August_Penner2_13_06"); //Hier.

	B_GiveInvItems	(self, hero, ItMi_Brokenrune01, 1);

	AI_Output(hero, self, "Info_Mod_August_Penner2_15_07"); //Aha. Eine kaputte Rune. Hast du auch die andere Hälfte?
	AI_Output(self, hero, "Info_Mod_August_Penner2_13_08"); //Nee. Hab lange gesucht, aber nichts mehr gefunden.
	AI_Output(hero, self, "Info_Mod_August_Penner2_15_09"); //Na gut. Vielleicht ist sie noch zu gebrauchen.
	AI_Output(hero, self, "Info_Mod_August_Penner2_15_10"); //Hast mich aber ganz schön angeschmiert. Ich bekomme noch 50 Gold fürs Essen.
	AI_Output(self, hero, "Info_Mod_August_Penner2_13_11"); //Natürlich, hier. Und sicher findet sich das andere Stück noch.

	B_GiveInvItems	(self, hero, ItMi_Gold, 50);

	B_SetTopicStatus	(TOPIC_MOD_JG_AUGUST, LOG_SUCCESS);

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_August_Pickpocket (C_INFO)
{
	npc		= Mod_7385_OUT_August_REL;
	nr		= 1;
	condition	= Info_Mod_August_Pickpocket_Condition;
	information	= Info_Mod_August_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_August_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 100);
};

FUNC VOID Info_Mod_August_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_August_Pickpocket);

	Info_AddChoice	(Info_Mod_August_Pickpocket, DIALOG_BACK, Info_Mod_August_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_August_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_August_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_August_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_August_Pickpocket);
};

FUNC VOID Info_Mod_August_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_August_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_August_Pickpocket);

		Info_AddChoice	(Info_Mod_August_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_August_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_August_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_August_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_August_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_August_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_August_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_August_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_August_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_August_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_August_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_August_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_August_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_August_EXIT (C_INFO)
{
	npc		= Mod_7385_OUT_August_REL;
	nr		= 1;
	condition	= Info_Mod_August_EXIT_Condition;
	information	= Info_Mod_August_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_August_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_August_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};