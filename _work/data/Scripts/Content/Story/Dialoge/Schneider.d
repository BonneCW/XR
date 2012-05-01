INSTANCE Info_Mod_Schneider_Hi (C_INFO)
{
	npc		= Mod_7535_OUT_Schneider_REL;
	nr		= 1;
	condition	= Info_Mod_Schneider_Hi_Condition;
	information	= Info_Mod_Schneider_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Guten Tag.";
};

FUNC INT Info_Mod_Schneider_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gritta_Shakir))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Schneider_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Schneider_Hi_15_00"); //Guten Tag. Ich sehe die Schere auf deinem Schild. Du bist der Schneider?
	AI_Output(self, hero, "Info_Mod_Schneider_Hi_06_01"); //Wohl wahr. Mein Name ist Versage. Der beste Schneider im Lande.
	AI_Output(hero, self, "Info_Mod_Schneider_Hi_15_02"); //Das trifft sich gut. Ich suche ein Kleid für eine Dame mit gehobenen Ansprüchen.
	AI_Output(self, hero, "Info_Mod_Schneider_Hi_06_03"); //Verstehe. Etwas extravagantes. Hm. Ich habe hier einen passenden Entwurf.
	AI_Output(self, hero, "Info_Mod_Schneider_Hi_06_04"); //Aber das Kleid ist nicht fertig, denn ich fürchte, unsere Frauen hier in Khorata haben dafür keinen Bedarf.
	AI_Output(hero, self, "Info_Mod_Schneider_Hi_15_05"); //Und bis wann ...
	AI_Output(self, hero, "Info_Mod_Schneider_Hi_06_06"); //Komm morgen wieder. Dann sollte es fertig sein.

	B_LogEntry	(TOPIC_MOD_ASS_SHAKIR_FRAU, "Der Schneider wird ein Kleid für Gritta herstellen. Morgen sollte es fertig sein.");

	B_StartOtherRoutine	(Mod_7281_OUT_Felicita_REL, "SCHNEIDER");

	Mod_ASS_Schneider_Day = Wld_GetDay();
};

INSTANCE Info_Mod_Schneider_Aufgabe (C_INFO)
{
	npc		= Mod_7535_OUT_Schneider_REL;
	nr		= 1;
	condition	= Info_Mod_Schneider_Aufgabe_Condition;
	information	= Info_Mod_Schneider_Aufgabe_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ist das Kleid fertig?";
};

FUNC INT Info_Mod_Schneider_Aufgabe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Schneider_Hi))
	&& (Wld_GetDay() > Mod_ASS_Schneider_Day)
	&& (Mod_ASS_Schneider == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Schneider_Aufgabe_Info()
{
	AI_Output(hero, self, "Info_Mod_Schneider_Aufgabe_15_00"); //Ist das Kleid fertig?

	if (Wld_GetDay()-1 == Mod_ASS_Schneider_Day)
	&& (Wld_IsTime(00,00,11,59))
	{
		AI_Output(self, hero, "Info_Mod_Schneider_Aufgabe_06_01"); //Nicht ganz. Hab die halbe Nacht dran gearbeitet.
		AI_Output(self, hero, "Info_Mod_Schneider_Aufgabe_06_02"); //Es sind noch einige Stiche zu machen. Und gebügelt muss es auch noch werden.
		AI_Output(self, hero, "Info_Mod_Schneider_Aufgabe_06_03"); //Komm am Mittag wieder.
		AI_Output(hero, self, "Info_Mod_Schneider_Aufgabe_15_04"); //Gut. Bis später.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Schneider_Aufgabe_06_05"); //Gewiss. Ein Prachtkleid. Haute couture nennt man so etwas. Ist kaum zu bezahlen.
		AI_Output(hero, self, "Info_Mod_Schneider_Aufgabe_15_06"); //Das heißt?
		AI_Output(self, hero, "Info_Mod_Schneider_Aufgabe_06_07"); //Bestes Tuch aus Schafwolle. Nähte doppelt gezogen. Eleganter Faltenwurf ...
		AI_Output(hero, self, "Info_Mod_Schneider_Aufgabe_15_08"); //Wieviel?
		AI_Output(self, hero, "Info_Mod_Schneider_Aufgabe_06_09"); //Zweimal gefärbt. Waschecht bis 60 Grad. Mein Signum eingestickt. 500 Gold.
		AI_Output(hero, self, "Info_Mod_Schneider_Aufgabe_15_10"); //Bist du von Sinnen? Dafür bekomme ich eine ganze Schafherde.
		AI_Output(self, hero, "Info_Mod_Schneider_Aufgabe_06_11"); //Das würde deine Dame kaum beeindrucken.

		Info_ClearChoices	(Info_Mod_Schneider_Aufgabe);

		Info_AddChoice	(Info_Mod_Schneider_Aufgabe, DIALOG_BACK, Info_Mod_Schneider_Aufgabe_BACK);

		if (Npc_HasItems(hero, ItMi_Gold) >= 500)
		{
			Info_AddChoice	(Info_Mod_Schneider_Aufgabe, "Mag sein. Hier hast du deine 500.", Info_Mod_Schneider_Aufgabe_D);
		};
		if (Npc_HasItems(hero, ItMi_Gold) >= 400)
		{
			Info_AddChoice	(Info_Mod_Schneider_Aufgabe, "Ich könnte dir 400 Gold geben.", Info_Mod_Schneider_Aufgabe_C);
		};
		Info_AddChoice	(Info_Mod_Schneider_Aufgabe, "Ich habe nur 300 dabei.", Info_Mod_Schneider_Aufgabe_B);
		Info_AddChoice	(Info_Mod_Schneider_Aufgabe, "Ich habe nur 200 dabei.", Info_Mod_Schneider_Aufgabe_A);
	};	
};

FUNC VOID Info_Mod_Schneider_Aufgabe_BACK()
{
	Info_ClearChoices	(Info_Mod_Schneider_Aufgabe);
};

FUNC VOID Info_Mod_Schneider_Aufgabe_D()
{
	AI_Output(hero, self, "Info_Mod_Schneider_Aufgabe_D_15_00"); //Mag sein. Hier hast du deine 500.

	B_GiveInvItems	(hero, self, ItMi_Gold, 500);

	AI_Output(self, hero, "Info_Mod_Schneider_Aufgabe_D_06_01"); //Besten Dank. Du wirst es nicht bereuen.

	B_GiveInvItems	(self, hero, ItAr_GrittasKleid, 1);

	Mod_ASS_Schneider = 1;

	Info_ClearChoices	(Info_Mod_Schneider_Aufgabe);

	B_LogEntry	(TOPIC_MOD_ASS_SHAKIR_FRAU, "War nicht leicht, dieses Kleid zu bekommen. Hoffe, Shakir weiß das zu würdigen. Zurück zur Gritta.");
};

FUNC VOID Info_Mod_Schneider_Aufgabe_C()
{
	AI_Output(hero, self, "Info_Mod_Schneider_Aufgabe_C_15_00"); //Ich könnte dir 400 Gold geben.

	B_GiveInvItems	(hero, self, ItMi_Gold, 400);

	AI_Output(self, hero, "Info_Mod_Schneider_Aufgabe_C_06_01"); //Ungern. Dafür musst du mich aber weiterempfehlen.
	AI_Output(hero, self, "Info_Mod_Schneider_Aufgabe_C_15_02"); //Mach ich doch glatt.

	B_GiveInvItems	(self, hero, ItAr_GrittasKleid, 1);

	Mod_ASS_Schneider = 1;

	Info_ClearChoices	(Info_Mod_Schneider_Aufgabe);

	B_LogEntry	(TOPIC_MOD_ASS_SHAKIR_FRAU, "War nicht leicht, dieses Kleid zu bekommen. Hoffe, Shakir weiß das zu würdigen. Zurück zur Gritta.");
};

FUNC VOID Info_Mod_Schneider_Aufgabe_B()
{
	AI_Output(hero, self, "Info_Mod_Schneider_Aufgabe_B_15_00"); //Ich habe nur 300 dabei.
	AI_Output(self, hero, "Info_Mod_Schneider_Aufgabe_B_06_01"); //300 Gold für dieses edle Teil? Nur über meine Leiche!  Es sei denn ...
	AI_Output(hero, self, "Info_Mod_Schneider_Aufgabe_B_15_02"); //Ja?
	AI_Output(self, hero, "Info_Mod_Schneider_Aufgabe_B_06_03"); //Du gehst mir ein wenig zur Hand.
	AI_Output(hero, self, "Info_Mod_Schneider_Aufgabe_B_15_04"); //Wie meinst du das?
	AI_Output(self, hero, "Info_Mod_Schneider_Aufgabe_B_06_05"); //Nun, ich denke da an einen gemütlichen Abend zu zweit. Nur du und ich ...
	AI_Output(hero, self, "Info_Mod_Schneider_Aufgabe_B_15_06"); //Bei Adanos! Du bist schwul!
	AI_Output(self, hero, "Info_Mod_Schneider_Aufgabe_B_06_07"); //Na und? Alle Modemacher, so wie ich, sind schwul. Sonst wären wir nicht das, was wir sind.
	AI_Output(hero, self, "Info_Mod_Schneider_Aufgabe_B_15_08"); //Ohne mich. Da lass ich mir was anderes einfallen.

	Info_ClearChoices	(Info_Mod_Schneider_Aufgabe);
};

FUNC VOID Info_Mod_Schneider_Aufgabe_A()
{
	AI_Output(hero, self, "Info_Mod_Schneider_Aufgabe_A_15_00"); //Ich habe nur 200 dabei.
	AI_Output(self, hero, "Info_Mod_Schneider_Aufgabe_A_06_01"); //Dann kommen wir nicht ins Geschäft. Vergiss es.
	AI_Output(hero, self, "Info_Mod_Schneider_Aufgabe_A_15_02"); //Schade. Da muss ich mir was anderes einfallen lassen.

	Info_ClearChoices	(Info_Mod_Schneider_Aufgabe);
};

INSTANCE Info_Mod_Schneider_Kissen (C_INFO)
{
	npc		= Mod_7535_OUT_Schneider_REL;
	nr		= 1;
	condition	= Info_Mod_Schneider_Kissen_Condition;
	information	= Info_Mod_Schneider_Kissen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Schneider_Kissen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Morpheus_Kissen02))
	&& (Npc_HasItems(hero, ItMi_Federbeutel) == 1)
	&& (Npc_HasItems(hero, ItMi_Heu) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Schneider_Kissen_Info()
{
	AI_Output(self, hero, "Info_Mod_Schneider_Kissen_06_00"); //Tritt näher, Freund der exklusiven Kleidung. Hat meine Kreation gefallen?
	AI_Output(hero, self, "Info_Mod_Schneider_Kissen_15_01"); //Und wie. Ich glaube, die Dame zieht das Kleid gar nicht mehr aus.
	AI_Output(self, hero, "Info_Mod_Schneider_Kissen_06_02"); //War auch nicht anders zu erwarten. Was darf's heute sein?
	AI_Output(hero, self, "Info_Mod_Schneider_Kissen_15_03"); //Nur eine Kleinigkeit. Kannst du mir ein Säckchen aus Leinen machen?
	AI_Output(self, hero, "Info_Mod_Schneider_Kissen_06_04"); //Das ist zwar unter meinem Niveau, aber für dich als guten Kunden ... Wie groß soll's denn sein?
	AI_Output(hero, self, "Info_Mod_Schneider_Kissen_15_05"); //So groß, dass diese Federn und dieses Heu reinpasst.

	Npc_RemoveInvItems	(hero, ItMi_Federbeutel, 1);
	Npc_RemoveInvItems	(hero, ItMi_Heu, 1);

	B_ShowGivenThings	("Vengerfedern und Heu gegeben");

	AI_Output(self, hero, "Info_Mod_Schneider_Kissen_06_06"); //Für was brauchst du das eigentlich?
	AI_Output(hero, self, "Info_Mod_Schneider_Kissen_15_07"); //Für einen alten Krieger. Wenn er schlafen geht, will er das unter seinen Kopf legen.
	AI_Output(self, hero, "Info_Mod_Schneider_Kissen_06_08"); //Sehr innovativ, diese Idee. Das könnte ein Verkaufsschlager werden. Wo hast du diese Federn her?
	AI_Output(hero, self, "Info_Mod_Schneider_Kissen_15_09"); //Vom Metzger. Der schlachtet die Venger von Erhards Hof.
	AI_Output(self, hero, "Info_Mod_Schneider_Kissen_06_10"); //Interessant. Nun gut. Stoff habe ich. Lass die Füllung da und komm in zwei Stunden wieder.

	B_LogEntry	(TOPIC_MOD_ASS_KISSEN, "Ich soll in zwei Stunden wieder bei Versage sein.");

	Npc_SetRefuseTalk(self, 300);
};

INSTANCE Info_Mod_Schneider_Kissen02 (C_INFO)
{
	npc		= Mod_7535_OUT_Schneider_REL;
	nr		= 1;
	condition	= Info_Mod_Schneider_Kissen02_Condition;
	information	= Info_Mod_Schneider_Kissen02_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo! Bist du fertig?";
};

FUNC INT Info_Mod_Schneider_Kissen02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Schneider_Kissen))
	&& (Npc_RefuseTalk(self) == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Schneider_Kissen02_Info()
{
	AI_Output(hero, self, "Info_Mod_Schneider_Kissen02_15_00"); //Hallo! Bist du fertig?
	AI_Output(self, hero, "Info_Mod_Schneider_Kissen02_06_01"); //Aber ja. Schau. In meiner Lieblingsfarbe.

	B_GiveInvItems	(self, hero, ItMi_Kissen, 1);

	AI_Output(hero, self, "Info_Mod_Schneider_Kissen02_15_02"); //Lila! Na ja, dem Krieger wird's egal sein.
	AI_Output(self, hero, "Info_Mod_Schneider_Kissen02_06_03"); //Sagenhaft weich und wohlriechend. Besser kann man so ein Teil nicht machen.
	AI_Output(hero, self, "Info_Mod_Schneider_Kissen02_15_04"); //Ich muss endlich weiter. Wieviel bekommst du?
	AI_Output(self, hero, "Info_Mod_Schneider_Kissen02_06_05"); //Für dich umsonst, wenn ich die Rechte an deiner Idee bekomme.
	AI_Output(hero, self, "Info_Mod_Schneider_Kissen02_15_06"); //Von mir aus auch die Linke. Mach's gut!

	B_LogEntry	(TOPIC_MOD_ASS_KISSEN, "Ich hab das Kissen. Auf zu Malik ...");
};

INSTANCE Info_Mod_Schneider_Pickpocket (C_INFO)
{
	npc		= Mod_7535_OUT_Schneider_REL;
	nr		= 1;
	condition	= Info_Mod_Schneider_Pickpocket_Condition;
	information	= Info_Mod_Schneider_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Schneider_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Schneider_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Schneider_Pickpocket);

	Info_AddChoice	(Info_Mod_Schneider_Pickpocket, DIALOG_BACK, Info_Mod_Schneider_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Schneider_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Schneider_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Schneider_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Schneider_Pickpocket);
};

FUNC VOID Info_Mod_Schneider_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Schneider_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Schneider_Pickpocket);

		Info_AddChoice	(Info_Mod_Schneider_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Schneider_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Schneider_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Schneider_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Schneider_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Schneider_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Schneider_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Schneider_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Schneider_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Schneider_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Schneider_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Schneider_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Schneider_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Schneider_EXIT (C_INFO)
{
	npc		= Mod_7535_OUT_Schneider_REL;
	nr		= 1;
	condition	= Info_Mod_Schneider_EXIT_Condition;
	information	= Info_Mod_Schneider_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Schneider_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Schneider_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};