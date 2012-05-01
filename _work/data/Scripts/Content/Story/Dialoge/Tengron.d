INSTANCE Info_Mod_Tengron_Hi (C_INFO)
{
	npc		= Mod_981_RIT_Tengron_NW;
	nr		= 1;
	condition	= Info_Mod_Tengron_Hi_Condition;
	information	= Info_Mod_Tengron_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was machst du hier?";
};

FUNC INT Info_Mod_Tengron_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Tengron_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Tengron_Hi_15_00"); //Was machst du hier?
	AI_Output(self, hero, "Info_Mod_Tengron_Hi_07_01"); //Aufpassen.
	AI_Output(hero, self, "Info_Mod_Tengron_Hi_15_02"); //Meinst du nicht, Garond und die Stadtwachen schaffen das allein?
	AI_Output(self, hero, "Info_Mod_Tengron_Hi_07_03"); //Äh ... Nein. Ich passe auf ... etwas anderes auf.

	Info_ClearChoices	(Info_Mod_Tengron_Hi);

	Info_AddChoice	(Info_Mod_Tengron_Hi, "Lass mich raten: Du überwachst Garond.", Info_Mod_Tengron_Hi_B);
	Info_AddChoice	(Info_Mod_Tengron_Hi, "Interessiert mich nicht weiter.", Info_Mod_Tengron_Hi_A);
};

FUNC VOID Info_Mod_Tengron_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Tengron_Hi_B_15_00"); //Lass mich raten: Du überwachst Garond.
	AI_Output(self, hero, "Info_Mod_Tengron_Hi_B_07_01"); //Dazu darf ich nichts sagen.
	AI_Output(hero, self, "Info_Mod_Tengron_Hi_B_15_02"); //Er ist wohl bei Lord Hagen in Ungnade gefallen?
	AI_Output(self, hero, "Info_Mod_Tengron_Hi_B_07_03"); //Mag sein.
	AI_Output(hero, self, "Info_Mod_Tengron_Hi_B_15_04"); //Kein Wunder. Dann mal noch viel Spaß.

	Info_ClearChoices	(Info_Mod_Tengron_Hi);
};

FUNC VOID Info_Mod_Tengron_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Tengron_Hi_A_15_00"); //Interessiert mich nicht weiter.

	Info_ClearChoices	(Info_Mod_Tengron_Hi);
};

INSTANCE Info_Mod_Tengron_WillPaladinWerden (C_INFO)
{
	npc		= Mod_981_RIT_Tengron_NW;
	nr		= 1;
	condition	= Info_Mod_Tengron_WillPaladinWerden_Condition;
	information	= Info_Mod_Tengron_WillPaladinWerden_Info;
	permanent	= 0;
	important	= 0;
	description	= "Nehmen wir mal an, ich wollte ein Paladin werden ...";
};

FUNC INT Info_Mod_Tengron_WillPaladinWerden_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Tengron_WillPaladinWerden_Info()
{
	AI_Output(hero, self, "Info_Mod_Tengron_WillPaladinWerden_15_00"); //Nehmen wir mal an, ich wollte ein Paladin werden ...
	AI_Output(self, hero, "Info_Mod_Tengron_WillPaladinWerden_07_01"); //Nur die besten Milizionäre steigen zu Paladinen auf. Wir fordern absolute Treue zu Innos und zu Lord Hagen.
	AI_Output(self, hero, "Info_Mod_Tengron_WillPaladinWerden_07_02"); //Außerdem muss ein Paladin mit dem Schwert umzugehen wissen.
	AI_Output(self, hero, "Info_Mod_Tengron_WillPaladinWerden_07_03"); //Die Miliz findest du in der Kaserne. Lord Andre wird dich einweisen, wenn er dich für geeignet hält.
};

INSTANCE Info_Mod_Tengron_Daemonisch (C_INFO)
{
	npc		= Mod_981_RIT_Tengron_NW;
	nr		= 1;
	condition	= Info_Mod_Tengron_Daemonisch_Condition;
	information	= Info_Mod_Tengron_Daemonisch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir erzählen, was im dunklen Wald vorgefallen ist.";
};

FUNC INT Info_Mod_Tengron_Daemonisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Milten_Daemonisch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Tengron_Daemonisch_Info()
{
	AI_Output(hero, self, "Info_Mod_Tengron_Daemonisch_15_00"); //Kannst du mir erzählen, was im dunklen Wald vorgefallen ist.
	AI_Output(self, hero, "Info_Mod_Tengron_Daemonisch_07_01"); //(resigniert) Ach, ist nicht so wichtig, wahrscheinlich habe ich nur den Verstand verloren ...
	AI_Output(hero, self, "Info_Mod_Tengron_Daemonisch_15_02"); //Nein, es interessiert mich wirklich. Es könnte von großer Wichtigkeit für die Sicherheit der Stadt sein ...
	AI_Output(self, hero, "Info_Mod_Tengron_Daemonisch_07_03"); //(etwas hellhöriger) Meinst du wirklich? Nun, ich werde dir erzählen, was ich gesehen habe ...
	AI_Output(self, hero, "Info_Mod_Tengron_Daemonisch_07_04"); //Es war zwar schon später Abend, als ich aufbrach und ich hatte keine Fackel bei mir, aber ich bediente mich des heiligen Paladinlichtes, um die Umgebung etwas zu erhellen.
	AI_Output(self, hero, "Info_Mod_Tengron_Daemonisch_07_05"); //Ich trat also in das kleine Tal und konnte zunächst nichts entdecken ...
	AI_Output(self, hero, "Info_Mod_Tengron_Daemonisch_07_06"); //Als ich mich aber Umsah, so sah ich von weitem bei einer Höhle etwas Glänzendes liegen.
	AI_Output(self, hero, "Info_Mod_Tengron_Daemonisch_07_07"); //Als ich näher herantrat, musste ich zu meinem Entsetzen feststellen, dass es die Paladine und Stadtwachen waren, die sich regungslos am Boden befanden.
	AI_Output(self, hero, "Info_Mod_Tengron_Daemonisch_07_08"); //Gerade in diesem Augenblick erlosch mein Licht.
	AI_Output(self, hero, "Info_Mod_Tengron_Daemonisch_07_09"); //Ich sammelte mein Mana um das Licht nochmals zu entzünden ... und sah mich plötzlich von dutzenden schwarzer ... Schatten umgeben, die kreischend in alle Richtungen zerstoben.
	AI_Output(self, hero, "Info_Mod_Tengron_Daemonisch_07_10"); //Von entsetzlicher Angst gepackt ergriff ich die Flucht zurück zur Stadt ...
	AI_Output(self, hero, "Info_Mod_Tengron_Daemonisch_07_11"); //Tja, und wieso ich hier sitze, weißt du wahrscheinlich.
	AI_Output(self, hero, "Info_Mod_Tengron_Daemonisch_07_12"); //Meine Kameraden kamen aus dem Wald uns bezichtigten mich, sie angegriffen zu haben ...
	AI_Output(hero, self, "Info_Mod_Tengron_Daemonisch_15_13"); //Wer war alles unter den Männern im Wald?
	AI_Output(self, hero, "Info_Mod_Tengron_Daemonisch_07_14"); //Nun, unter den Paladinen ... (wird unterbrochen)

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Tengron_Irdorath (C_INFO)
{
	npc		= Mod_981_RIT_Tengron_NW;
	nr		= 1;
	condition	= Info_Mod_Tengron_Irdorath_Condition;
	information	= Info_Mod_Tengron_Irdorath_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich breche demnächst mit dem Schiff zu einer Insel auf.";
};

FUNC INT Info_Mod_Tengron_Irdorath_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Milten_Irdorath))
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Tengron_Irdorath_Info()
{
	AI_Output(hero, self, "Info_Mod_Tengron_Irdorath_15_00"); //Ich breche demnächst mit dem Schiff zu einer Insel auf.
	AI_Output(hero, self, "Info_Mod_Tengron_Irdorath_15_01"); //Es geht darum einen Lakaien des Xeres zu bannen, jenem Unhold, der mit dunkler Magie fast die Stadt unter seine Kontrolle gebracht hätte.
	AI_Output(self, hero, "Info_Mod_Tengron_Irdorath_07_02"); //Tatsächlich, den üblen Magier der für das alles verantwortlich war strafen?
	AI_Output(self, hero, "Info_Mod_Tengron_Irdorath_07_03"); //Nur zu gerne würde ich dich begleiten ...
};

INSTANCE Info_Mod_Tengron_Irdorath2 (C_INFO)
{
	npc		= Mod_981_RIT_Tengron_NW;
	nr		= 1;
	condition	= Info_Mod_Tengron_Irdorath2_Condition;
	information	= Info_Mod_Tengron_Irdorath2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dann komm doch einfach mit.";
};

FUNC INT Info_Mod_Tengron_Irdorath2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Tengron_Irdorath))
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Tengron_Irdorath2_Info()
{
	AI_Output(hero, self, "Info_Mod_Tengron_Irdorath2_15_00"); //Dann komm doch einfach mit.
	AI_Output(self, hero, "Info_Mod_Tengron_Irdorath2_07_01"); //Das hieße aber dann meinen Posten in der Stadt zu verlassen ...
	AI_Output(hero, self, "Info_Mod_Tengron_Irdorath2_15_02"); //... genau wie damals, als du einer der wenigen warst, die die Gefahr für die Stadt erkannten.
	AI_Output(self, hero, "Info_Mod_Tengron_Irdorath2_07_03"); //Hmm, ja, du hast Recht. Hier scheint es um viel mehr zu gehen ...
	AI_Output(self, hero, "Info_Mod_Tengron_Irdorath2_07_04"); //In Ordnung, ich werde dann am Hafen auf den Aufbruch warten.

	B_LogEntry	(TOPIC_MOD_HQ_CREW, "Sehr gut, mit ein bisschen Überzeugungsarbeit konnte ich auch Tengron davon überzeugen, mit auf das Schiff zu kommen.");

	B_GivePlayerXP	(100);

	Mod_TengronDabei = 1;

	Mod_CrewCount += 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "SCHIFF");
};

INSTANCE Info_Mod_Tengron_Irdorath3 (C_INFO)
{
	npc		= Mod_981_RIT_Tengron_NW;
	nr		= 1;
	condition	= Info_Mod_Tengron_Irdorath3_Condition;
	information	= Info_Mod_Tengron_Irdorath3_Info;
	permanent	= 1;
	important	= 0;
	description	= "Tut mir leid, aber es scheint das wir zu viele sind.";
};

FUNC INT Info_Mod_Tengron_Irdorath3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Tengron_Irdorath2))
	&& (Mod_Irdorath == 0)
	&& (Mod_TengronDabei == 1)
	&& (Mod_JackDabei == 1)
	&& (Mod_CrewCount > 15)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Tengron_Irdorath3_Info()
{
	AI_Output(hero, self, "Info_Mod_Tengron_Irdorath3_15_00"); //Tut mir leid, aber es scheint das wir zu viele sind. Ich kann dich doch nicht mitnehmen.
	AI_Output(self, hero, "Info_Mod_Tengron_Irdorath3_07_01"); //Schade. Ich gehe dann wieder zurück. Du weißt wo du mich findest, wenn doch noch ein Platz frei werden sollte.

	Mod_TengronDabei = 0;

	Mod_CrewCount -= 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Tengron_Irdorath4 (C_INFO)
{
	npc		= Mod_981_RIT_Tengron_NW;
	nr		= 1;
	condition	= Info_Mod_Tengron_Irdorath4_Condition;
	information	= Info_Mod_Tengron_Irdorath4_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich kann dich doch mitnehmen.";
};

FUNC INT Info_Mod_Tengron_Irdorath4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Tengron_Irdorath2))
	&& (Mod_Irdorath == 0)
	&& (Mod_TengronDabei == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Tengron_Irdorath4_Info()
{
	AI_Output(hero, self, "Info_Mod_Tengron_Irdorath4_15_00"); //Ich kann dich doch mitnehmen. Es hat sich noch ein Platz auf dem Schiff gefunden.
	AI_Output(self, hero, "Info_Mod_Tengron_Irdorath4_07_01"); //Sehr gut, ich bin dann wieder am Hafen.

	Mod_TengronDabei = 1;

	Mod_CrewCount += 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "SCHIFF");
};

INSTANCE Info_Mod_Tengron_HaradLehrling (C_INFO)
{
	npc		= Mod_981_RIT_Tengron_NW;
	nr		= 1;
	condition	= Info_Mod_Tengron_HaradLehrling_Condition;
	information	= Info_Mod_Tengron_HaradLehrling_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wegen Harad ...";
};

FUNC INT Info_Mod_Tengron_HaradLehrling_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Harad_LehrlingQuest8))
	&& (Mod_HaradLehrling_Kap4 == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Tengron_HaradLehrling_Info()
{
	AI_Output(hero, self, "Info_Mod_Tengron_HaradLehrling_15_00"); //Wegen Harad ...
	AI_Output(self, hero, "Info_Mod_Tengron_HaradLehrling_07_01"); //Spar dir den Atem! Die Beweise für seine Schuld sind erbracht.
	AI_Output(self, hero, "Info_Mod_Tengron_HaradLehrling_07_02"); //Alles Weitere liegt in Lord Andres Hand, nicht in meiner.
};

INSTANCE Info_Mod_Tengron_BinPaladin (C_INFO)
{
	npc		= Mod_981_RIT_Tengron_NW;
	nr		= 1;
	condition	= Info_Mod_Tengron_BinPaladin_Condition;
	information	= Info_Mod_Tengron_BinPaladin_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich bin jetzt auch ein Paladin.";
};

FUNC INT Info_Mod_Tengron_BinPaladin_Condition()
{
	if (Mod_Gilde == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Tengron_BinPaladin_Info()
{
	AI_Output(hero, self, "Info_Mod_Tengron_BinPaladin_15_00"); //Ich bin jetzt auch ein Paladin.
	AI_Output(self, hero, "Info_Mod_Tengron_BinPaladin_07_01"); //Du bist also der Neue. Hast ja einen rasanten Aufstieg hinter dir. Manche brauchen da länger. Schau dir Mario an. (lacht)
	AI_Output(self, hero, "Info_Mod_Tengron_BinPaladin_07_02"); //Wenn Lord Hagen dir vertraut, tue ich es auch. Möge Innos dich auf deinen Wegen behüten.
};

INSTANCE Info_Mod_Tengron_Beliar (C_INFO)
{
	npc		= Mod_981_RIT_Tengron_NW;
	nr		= 1;
	condition	= Info_Mod_Tengron_Beliar_Condition;
	information	= Info_Mod_Tengron_Beliar_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Tengron_Beliar_Condition()
{
	if (hero.guild == GIL_KDF)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Tengron_Beliar_Info()
{
	AI_Output(self, hero, "Info_Mod_Tengron_Beliar_07_00"); //(kreischt) Ahhhhh! Nimm deine Finger von mir, Beliargezücht!

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Tengron_Pickpocket (C_INFO)
{
	npc		= Mod_981_RIT_Tengron_NW;
	nr		= 1;
	condition	= Info_Mod_Tengron_Pickpocket_Condition;
	information	= Info_Mod_Tengron_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Tengron_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Tengron_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Tengron_Pickpocket);

	Info_AddChoice	(Info_Mod_Tengron_Pickpocket, DIALOG_BACK, Info_Mod_Tengron_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Tengron_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Tengron_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Tengron_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Tengron_Pickpocket);
};

FUNC VOID Info_Mod_Tengron_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Tengron_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Tengron_Pickpocket);

		Info_AddChoice	(Info_Mod_Tengron_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Tengron_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Tengron_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Tengron_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Tengron_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Tengron_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Tengron_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Tengron_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Tengron_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Tengron_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Tengron_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Tengron_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Tengron_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Tengron_EXIT (C_INFO)
{
	npc		= Mod_981_RIT_Tengron_NW;
	nr		= 1;
	condition	= Info_Mod_Tengron_EXIT_Condition;
	information	= Info_Mod_Tengron_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Tengron_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Tengron_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};