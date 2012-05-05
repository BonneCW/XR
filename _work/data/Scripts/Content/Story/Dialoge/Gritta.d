INSTANCE Info_Mod_Gritta_Hi (C_INFO)
{
	npc		= Mod_580_NONE_Gritta_NW;
	nr		= 1;
	condition	= Info_Mod_Gritta_Hi_Condition;
	information	= Info_Mod_Gritta_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Gritta_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gritta_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Gritta_Hi_16_01"); //Ich bin Gritta.
};

INSTANCE Info_Mod_Gritta_ThorbenLehrling (C_INFO)
{
	npc		= Mod_580_NONE_Gritta_NW;
	nr		= 1;
	condition	= Info_Mod_Gritta_ThorbenLehrling_Condition;
	information	= Info_Mod_Gritta_ThorbenLehrling_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gritta_ThorbenLehrling_Condition()
{
	if (Mod_Thorben_KO == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gritta_ThorbenLehrling_Info()
{
	AI_Output(self, hero, "Info_Mod_Gritta_ThorbenLehrling_16_00"); //Du willst zu Thorben, oder?
	AI_Output(hero, self, "Info_Mod_Gritta_ThorbenLehrling_15_01"); //Ja ... Stimmt was nicht?
	AI_Output(self, hero, "Info_Mod_Gritta_ThorbenLehrling_16_02"); //Er ... Es sieht schlimm aus. Der Arzt meint, es sei ein Schlaganfall gewesen und dass er wieder aufwachen wird.
	AI_Output(self, hero, "Info_Mod_Gritta_ThorbenLehrling_16_03"); //Aber wie viel von seinem Gedächtnis verloren geht, weiß niemand.
	AI_Output(hero, self, "Info_Mod_Gritta_ThorbenLehrling_15_04"); //Das tut mir leid. Kann ich irgendetwas für ihn tun?
	AI_Output(self, hero, "Info_Mod_Gritta_ThorbenLehrling_16_05"); //Du bist sein Lehrling, nicht wahr? Er würde sich bestimmt über ein kleines selbstgefertigtes Geschenk freuen, oh ja.
	AI_Output(hero, self, "Info_Mod_Gritta_ThorbenLehrling_15_06"); //Ich werde mir etwas einfallen lassen. Mach's gut.

	Log_CreateTopic	(TOPIC_MOD_LEHRLING_THORBEN_FOUR, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_THORBEN_FOUR, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_LEHRLING_THORBEN_FOUR, "Thorben hat es voll erwischt. Seine Nichte meint, er würde sich über ein selbstgefertigtes Geschenk freuen. Nun ja, ein wenig kitschig ist es schon, aber wenn es hilft ... Ich sollte noch ein Mal Brahim nach einer Zeichnung fragen. Selbst wenn er sie nicht selbst machen will, so kann er mich doch vielleicht weiterleiten.");
};

INSTANCE Info_Mod_Gritta_ThorbenLehrling2 (C_INFO)
{
	npc		= Mod_580_NONE_Gritta_NW;
	nr		= 1;
	condition	= Info_Mod_Gritta_ThorbenLehrling2_Condition;
	information	= Info_Mod_Gritta_ThorbenLehrling2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gritta_ThorbenLehrling2_Condition()
{
	if (Mod_Thorben_Geschenk == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gritta_ThorbenLehrling2_Info()
{
	AI_Output(self, hero, "Info_Mod_Gritta_ThorbenLehrling2_16_00"); //Du hast ein Geschenk für meinen Onkel?
	AI_Output(hero, self, "Info_Mod_Gritta_ThorbenLehrling2_15_01"); //Ja. Ist er denn bei Bewusstsein?
	AI_Output(self, hero, "Info_Mod_Gritta_ThorbenLehrling2_16_02"); //Seit letzter Nacht. Es geht ihm schon wieder besser, und er scheint sich an alles zu erinnern. Bring ihm ruhig dein Geschenk.
};

INSTANCE Info_Mod_Gritta_Shakir (C_INFO)
{
	npc		= Mod_580_NONE_Gritta_NW;
	nr		= 1;
	condition	= Info_Mod_Gritta_Shakir_Condition;
	information	= Info_Mod_Gritta_Shakir_Info;
	permanent	= 0;
	important	= 0;
	description	= "Innos zum Gruß. Wie geht es dir?";
};

FUNC INT Info_Mod_Gritta_Shakir_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Jana_Shakir))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gritta_Shakir_Info()
{
	AI_Output(hero, self, "Info_Mod_Gritta_Shakir_15_00"); //Innos zum Gruß. Wie geht es dir?
	AI_Output(self, hero, "Info_Mod_Gritta_Shakir_16_01"); //Schlecht. Wer fragt das?
	AI_Output(hero, self, "Info_Mod_Gritta_Shakir_15_02"); //Ein Freier.
	AI_Output(self, hero, "Info_Mod_Gritta_Shakir_16_03"); //Du willst mich heiraten? Wieso?
	AI_Output(hero, self, "Info_Mod_Gritta_Shakir_15_04"); //Das nicht. Man sagt, du stehst auf schöne Kleider.
	AI_Output(self, hero, "Info_Mod_Gritta_Shakir_16_05"); //Das will ich meinen. Hast du welche?
	AI_Output(hero, self, "Info_Mod_Gritta_Shakir_15_06"); //Nein. Aber ich könnte dir eines besorgen. Feinster Stoff, eleganter Schnitt, beste Qualität.
	AI_Output(self, hero, "Info_Mod_Gritta_Shakir_16_07"); //Nur her damit! Was willst du dafür?
	AI_Output(hero, self, "Info_Mod_Gritta_Shakir_15_08"); //Nur eine Gefälligkeit. Ein guter Freund von mir möchte mal mit einer Frau zusammensein.
	AI_Output(hero, self, "Info_Mod_Gritta_Shakir_15_09"); //Er hat eine gemütliche Unterkunft draussen vor der Stadt ...
	AI_Output(self, hero, "Info_Mod_Gritta_Shakir_16_10"); //Verstehe. Wann bekomme ich das Teil?
	AI_Output(hero, self, "Info_Mod_Gritta_Shakir_15_11"); //Mein Freund wird es dir geben.

	B_LogEntry	(TOPIC_MOD_ASS_SHAKIR_FRAU, "Ich konnte Gritta 'engagieren'. Muss ihr ein Kleid vom Schneider in Khorata besorgen und es Shakir geben.");
};

INSTANCE Info_Mod_Gritta_Shakir2 (C_INFO)
{
	npc		= Mod_580_NONE_Gritta_NW;
	nr		= 1;
	condition	= Info_Mod_Gritta_Shakir2_Condition;
	information	= Info_Mod_Gritta_Shakir2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo! Ich habe bekommen, was du wolltest.";
};

FUNC INT Info_Mod_Gritta_Shakir2_Condition()
{
	if (Mod_ASS_Gritta == 0)
	&& (Mod_ASS_Schneider == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gritta_Shakir2_Info()
{
	AI_Output(hero, self, "Info_Mod_Gritta_Shakir2_15_00"); //Hallo! Ich habe bekommen, was du wolltest.
	AI_Output(self, hero, "Info_Mod_Gritta_Shakir2_16_01"); //Ein neues Kleid?
	AI_Output(hero, self, "Info_Mod_Gritta_Shakir2_15_02"); //Gewiss. Haute couture vom schwulen Versage.
	AI_Output(self, hero, "Info_Mod_Gritta_Shakir2_16_03"); //Ja und? Diese Leute haben wenigstens Geschmack.
	AI_Output(hero, self, "Info_Mod_Gritta_Shakir2_15_04"); //Wie du meinst. Lass uns gehen.

	Mod_ASS_Gritta = 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOWTOSHAKIR");

	B_LogEntry	(TOPIC_MOD_ASS_SHAKIR_FRAU, "Werde sie zur Höhle bringen und Shakir Bescheid sagen.");
};

INSTANCE Info_Mod_Gritta_Shakir3 (C_INFO)
{
	npc		= Mod_580_NONE_Gritta_NW;
	nr		= 1;
	condition	= Info_Mod_Gritta_Shakir3_Condition;
	information	= Info_Mod_Gritta_Shakir3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gritta_Shakir3_Condition()
{
	if (Mod_ASS_Gritta == 1)
	&& (Npc_GetDistToWP(hero, "NW_CITY_SMFOREST_05") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gritta_Shakir3_Info()
{
	AI_Output(self, hero, "Info_Mod_Gritta_Shakir3_16_00"); //Das nennst du gemütliche Unterkunft?
	AI_Output(hero, self, "Info_Mod_Gritta_Shakir3_15_01"); //Nun ja. Jedenfalls seid ihr hier ungestört. Schön warm ist es auch.
	AI_Output(self, hero, "Info_Mod_Gritta_Shakir3_16_02"); //Und wo ist dein guter Freund?
	AI_Output(hero, self, "Info_Mod_Gritta_Shakir3_15_03"); //Ich sag ihm Bescheid. Er heißt Shakir. Schenk dir inzwischen etwas Wein ein, wenn du möchtest.
	AI_Output(self, hero, "Info_Mod_Gritta_Shakir3_16_04"); //Und mein Kleid?
	AI_Output(hero, self, "Info_Mod_Gritta_Shakir3_15_05"); //Wird er mitbringen.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ATSHAKIR");
};

INSTANCE Info_Mod_Gritta_Flugblaetter (C_INFO)
{
	npc		= Mod_580_NONE_Gritta_NW;
	nr		= 1;
	condition	= Info_Mod_Gritta_Flugblaetter_Condition;
	information	= Info_Mod_Gritta_Flugblaetter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab hier ein Flugblatt für dich.";
};

FUNC INT Info_Mod_Gritta_Flugblaetter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Auftrag_2))
	&& (Npc_HasItems(hero, MatteoFlugblaetter) >= 1)
	&& (Mod_Flugblaetter < 20)
	&&(!Npc_KnowsInfo(hero, Info_Mod_Matteo_Flugblaetter))
	&& (Npc_KnowsInfo(hero, Info_Mod_Gritta_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gritta_Flugblaetter_Info()
{
	B_Say (hero, self, "$MATTEOPAPER");

	B_GiveInvItems	(hero, self, MatteoFlugblaetter, 1);

	AI_Output(self, hero, "Info_Mod_Gritta_Flugblaetter_16_01"); //(affektiert) Hmm, schöne Kleider hat Matteo aber glaube ich nicht.

	Mod_Flugblaetter += 1;
};

INSTANCE Info_Mod_Gritta_Pickpocket (C_INFO)
{
	npc		= Mod_580_NONE_Gritta_NW;
	nr		= 1;
	condition	= Info_Mod_Gritta_Pickpocket_Condition;
	information	= Info_Mod_Gritta_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60_Female;
};

FUNC INT Info_Mod_Gritta_Pickpocket_Condition()
{
	C_Beklauen	(36, ItMi_Gold, 75);
};

FUNC VOID Info_Mod_Gritta_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Gritta_Pickpocket);

	Info_AddChoice	(Info_Mod_Gritta_Pickpocket, DIALOG_BACK, Info_Mod_Gritta_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Gritta_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Gritta_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Gritta_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Gritta_Pickpocket);
};

FUNC VOID Info_Mod_Gritta_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Gritta_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Gritta_Pickpocket);

		Info_AddChoice	(Info_Mod_Gritta_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Gritta_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Gritta_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Gritta_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Gritta_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Gritta_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Gritta_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Gritta_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Gritta_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Gritta_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Gritta_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Gritta_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Gritta_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Gritta_EXIT (C_INFO)
{
	npc		= Mod_580_NONE_Gritta_NW;
	nr		= 1;
	condition	= Info_Mod_Gritta_EXIT_Condition;
	information	= Info_Mod_Gritta_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Gritta_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gritta_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};