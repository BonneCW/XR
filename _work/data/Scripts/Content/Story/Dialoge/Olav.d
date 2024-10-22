INSTANCE Info_Mod_Olav_Hi (C_INFO)
{
	npc		= Mod_980_MIL_Olav_NW;
	nr		= 1;
	condition	= Info_Mod_Olav_Hi_Condition;
	information	= Info_Mod_Olav_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wozu bist du hier zuständig?";
};

FUNC INT Info_Mod_Olav_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Olav_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Olav_Hi_15_00"); //Wozu bist du hier zuständig?
	AI_Output(self, hero, "Info_Mod_Olav_Hi_04_01"); //Ich stehe mir die Beine in den Arsch, um den Marktplatz zu überwachen.
	AI_Output(self, hero, "Info_Mod_Olav_Hi_04_02"); //Nirgendwo wird so viel gelogen und betrogen wie hier, verflucht.
	AI_Output(self, hero, "Info_Mod_Olav_Hi_04_03"); //Sind doch alles zwielichtige Gestalten, die sich hier rumtreiben ...
};

INSTANCE Info_Mod_Olav_WarumMiliz (C_INFO)
{
	npc		= Mod_980_MIL_Olav_NW;
	nr		= 1;
	condition	= Info_Mod_Olav_WarumMiliz_Condition;
	information	= Info_Mod_Olav_WarumMiliz_Info;
	permanent	= 0;
	important	= 0;
	description	= "Warum bist du zu der Miliz gegangen?";
};

FUNC INT Info_Mod_Olav_WarumMiliz_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Olav_WarumMiliz_Info()
{
	AI_Output(hero, self, "Info_Mod_Olav_WarumMiliz_15_00"); //Warum bist du zu der Miliz gegangen?
	AI_Output(self, hero, "Info_Mod_Olav_WarumMiliz_04_01"); //Na ja, das hat eigentlich mein Vater damals entschieden.
	AI_Output(self, hero, "Info_Mod_Olav_WarumMiliz_04_02"); //Ich mochte die anderen Kinder in meiner Gasse nicht, und er dachte, in der Kaserne müsste ich nicht mehr mit ihnen zu tun haben.
};

INSTANCE Info_Mod_Olav_Mortis (C_INFO)
{
	npc		= Mod_980_MIL_Olav_NW;
	nr		= 1;
	condition	= Info_Mod_Olav_Mortis_Condition;
	information	= Info_Mod_Olav_Mortis_Info;
	permanent	= 0;
	important	= 0;
	description	= "Mortis schickt mich.";
};

FUNC INT Info_Mod_Olav_Mortis_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mortis_Andre))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Olav_Mortis_Info()
{
	AI_Output(hero, self, "Info_Mod_Olav_Mortis_15_00"); //Mortis schickt mich. Ich soll fragen ob alles in Ordnung ist.
	AI_Output(self, hero, "Info_Mod_Olav_Mortis_04_01"); //Ja, bei mir ist alles bestens.

	B_LogEntry	(TOPIC_MOD_MORTIS_KONTROLLE, "Bei Olav ist alles in Ordung.");

	B_GivePlayerXP	(50);
};

INSTANCE Info_Mod_Olav_Turm (C_INFO)
{
	npc		= Mod_980_MIL_Olav_NW;
	nr		= 1;
	condition	= Info_Mod_Olav_Turm_Condition;
	information	= Info_Mod_Olav_Turm_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was ist eigentlich in den Wachtürmen neben dem Stadttor?";
};

FUNC INT Info_Mod_Olav_Turm_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Olav_Hi))
	&& (Mod_Verhandlungsgeschick >= 40)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Olav_Turm_Info()
{
	AI_Output(hero, self, "Info_Mod_Olav_Turm_15_00"); //Was ist eigentlich in den Wachtürmen neben dem Stadttor?
	AI_Output(self, hero, "Info_Mod_Olav_Turm_04_01"); //Das würdest du wohl gern wissen. Ich weiß gut, was in dem einen ist, denn ich bin dafür verantwortlich.
	AI_Output(hero, self, "Info_Mod_Olav_Turm_15_02"); //Das heißt, du hast einen Schlüssel?
	AI_Output(self, hero, "Info_Mod_Olav_Turm_04_03"); //(leicht besorgt) Nun ja, natürlich. Sonst würde ich wohl kaum reinkommen.
};

INSTANCE Info_Mod_Olav_Turm2 (C_INFO)
{
	npc		= Mod_980_MIL_Olav_NW;
	nr		= 1;
	condition	= Info_Mod_Olav_Turm2_Condition;
	information	= Info_Mod_Olav_Turm2_Info;
	permanent	= 0;
	important	= 0;
	description	= "(Feilschen) Du gibst mir den Schlüssel, und ich sehe für dich nach dem Rechten.";
};

FUNC INT Info_Mod_Olav_Turm2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Olav_Turm))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Olav_Turm2_Info()
{
	AI_Output(hero, self, "Info_Mod_Olav_Turm2_15_00"); //Du gibst mir den Schlüssel, und ich sehe für dich nach dem Rechten.

	if (self.aivar[AIV_Verhandlung] == TRUE)
	{
		AI_Output(self, hero, "Info_Mod_Olav_Turm2_04_01"); //In Ordnung, das ist eh schon lange notwendig. Könnten sich ja schon Ratten dort ausgebreitet haben.

		B_GiveInVItems	(self, hero, ItKe_City_Tower_03, 1);

		B_RaiseHandelsgeschick (2);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Olav_Turm2_04_02"); //Ganz einfach: Nein.
	};
};

INSTANCE Info_Mod_Olav_Mario (C_INFO)
{
	npc		= Mod_980_MIL_Olav_NW;
	nr		= 1;
	condition	= Info_Mod_Olav_Mario_Condition;
	information	= Info_Mod_Olav_Mario_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hakon verkauft gestohlene Ware!";
};

FUNC INT Info_Mod_Olav_Mario_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mario_Hilfe8))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Olav_Mario_Info()
{
	AI_Output(hero, self, "Info_Mod_Olav_Mario_15_00"); //Hakon verkauft gestohlene Ware!
	AI_Output(self, hero, "Info_Mod_Olav_Mario_04_01"); //Was?! Verflucht, das muss ich prüfen.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "HAKON");

	B_LogEntry	(TOPIC_MOD_MARIO_FLUCHTHILFE, "Olav ist fürs Erste abgelenkt.");
};

INSTANCE Info_Mod_Olav_HaradLehrling (C_INFO)
{
	npc		= Mod_980_MIL_Olav_NW;
	nr		= 1;
	condition	= Info_Mod_Olav_HaradLehrling_Condition;
	information	= Info_Mod_Olav_HaradLehrling_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Olav_HaradLehrling_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Harad_LehrlingQuest5))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Olav_HaradLehrling_Info()
{
	var c_npc Olav; Olav = Hlp_GetNpc(Mod_980_MIL_Olav_NW);
	var c_npc Harad; Harad = Hlp_GetNpc(Mod_535_NONE_Harad_NW);

	TRIA_Invite(Harad);
	TRIA_Start();

	TRIA_Next(Olav);

	AI_TurnToNpc	(Olav, Harad);

	AI_Output(self, hero, "Info_Mod_Olav_HaradLehrling_04_00"); //Schöne Waffe.

	TRIA_Next(Harad);

	AI_TurnToNpc	(Harad, Olav);

	AI_Output(self, hero, "Info_Mod_Olav_HaradLehrling_09_01"); //(argwöhnisch) Ja. Wieso?

	TRIA_Next(Olav);

	AI_Output(self, hero, "Info_Mod_Olav_HaradLehrling_04_02"); //Kann ich mal haben? Ist doch immer wieder beeindruckend, was mit dem richtiger Schmiedekunst schaffen kann.

	TRIA_Next(Harad);

	AI_Output(self, hero, "Info_Mod_Olav_HaradLehrling_09_03"); //Alles harte Arbeit.

	TRIA_Next(Olav);

	AI_DrawWeapon	(self);

	AI_PlayAni	(self, "T_1HINSPECT");

	AI_RemoveWeapon	(self);

	AI_Output(self, hero, "Info_Mod_Olav_HaradLehrling_04_04"); //(murmelt) Ja, das glaube ich. (Pause)
	AI_Output(self, hero, "Info_Mod_Olav_HaradLehrling_04_05"); //Aha. Da haben wir's. "Glück und Ruhm Lares, dem Sieger." Na, wenn das mal nicht verdächtig klingt.

	TRIA_Next(Harad);

	AI_Output(self, hero, "Info_Mod_Olav_HaradLehrling_09_06"); //Das ist doch ganz anders gemeint!

	TRIA_Next(Olav);

	AI_Output(self, hero, "Info_Mod_Olav_HaradLehrling_04_07"); //(lacht) Red du nur. Das Schwert ist konfisziert, basta. Du weißt doch, dass du keinen Kontakt zu den Söldnerlümmeln haben sollst.
	AI_Output(self, hero, "Info_Mod_Olav_HaradLehrling_04_08"); //(stöhnt) Wenn's nicht so schwer wäre, würde ich das Ding ja gern behalten.

	TRIA_Finish();

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Olav_HaradLehrling2 (C_INFO)
{
	npc		= Mod_980_MIL_Olav_NW;
	nr		= 1;
	condition	= Info_Mod_Olav_HaradLehrling2_Condition;
	information	= Info_Mod_Olav_HaradLehrling2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Olav_HaradLehrling2_Condition()
{
	if (Mod_HaradLehrling_Kap4 == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Olav_HaradLehrling2_Info()
{
	AI_Output(self, hero, "Info_Mod_Olav_HaradLehrling2_04_00"); //Die Schmiede darf nicht betreten werden.
	AI_Output(hero, self, "Info_Mod_Olav_HaradLehrling2_15_01"); //Was ist denn los?
	AI_Output(self, hero, "Info_Mod_Olav_HaradLehrling2_04_02"); //Tengron hat entschieden, dass es für Harad Zeit wird, bestimmte Lektionen über Anstand zu lernen.
	AI_Output(hero, self, "Info_Mod_Olav_HaradLehrling2_15_03"); //(seufzt) Der ist auch so ein sturer Hund.
	AI_Output(self, hero, "Info_Mod_Olav_HaradLehrling2_04_04"); //Das ist für diese Angelegenheit nicht von Belang.
	AI_Output(hero, self, "Info_Mod_Olav_HaradLehrling2_15_05"); //Und was ist mit Harad? Sitzt er im Gefängnis?
	AI_Output(self, hero, "Info_Mod_Olav_HaradLehrling2_04_06"); //Korrekt. Und wenn ich Tengron richtig verstanden habe, kommt er dort auch nicht so schnell wieder raus.

	Log_CreateTopic	(TOPIC_MOD_LEHRLING_HARAD_FOUR, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_HARAD_FOUR, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_LEHRLING_HARAD_FOUR, "Harad sitzt im Gefängnis! Tengron hat ihn für seinen Handel mit den Söldnern eingebuchtet.");
};

INSTANCE Info_Mod_Olav_Pickpocket (C_INFO)
{
	npc		= Mod_980_MIL_Olav_NW;
	nr		= 1;
	condition	= Info_Mod_Olav_Pickpocket_Condition;
	information	= Info_Mod_Olav_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Olav_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 16);
};

FUNC VOID Info_Mod_Olav_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Olav_Pickpocket);

	Info_AddChoice	(Info_Mod_Olav_Pickpocket, DIALOG_BACK, Info_Mod_Olav_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Olav_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Olav_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Olav_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Olav_Pickpocket);
};

FUNC VOID Info_Mod_Olav_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Olav_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Olav_Pickpocket);

		Info_AddChoice	(Info_Mod_Olav_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Olav_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Olav_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Olav_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Olav_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Olav_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Olav_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Olav_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Olav_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Olav_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Olav_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Olav_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Olav_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Olav_EXIT (C_INFO)
{
	npc		= Mod_980_MIL_Olav_NW;
	nr		= 1;
	condition	= Info_Mod_Olav_EXIT_Condition;
	information	= Info_Mod_Olav_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Olav_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Olav_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};