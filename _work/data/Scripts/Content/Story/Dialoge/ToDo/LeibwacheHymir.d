INSTANCE Info_Mod_LeibwacheHymir_Treue (C_INFO)
{
	npc		= Mod_1014_KGD_Leibwache_MT;
	nr		= 1;
	condition	= Info_Mod_LeibwacheHymir_Treue_Condition;
	information	= Info_Mod_LeibwacheHymir_Treue_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_LeibwacheHymir_Treue_Condition()
{
	if (!Npc_KnowsInfo(hero, Info_Mod_Ole_Vorbereitungen2))
	&& (Npc_KnowsInfo(hero, Info_Mod_Hagen_AndreVermaechtnis11))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_LeibwacheHymir_Treue_Info()
{
	AI_Output(self, hero, "Info_Mod_LeibwacheHymir_Treue_06_00"); //Halt! Hier geht es nicht weiter für dich.
	AI_Output(hero, self, "Info_Mod_LeibwacheHymir_Treue_15_01"); //Ich habe eine Botschaft von Lord Hagen. Schau.

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_LeibwacheHymir_Treue_06_02"); //Tatsächlich ... versehen mit dem königlichen Siegel. In Ordnung, du darfst zu Hymir.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_LeibwacheHymir_Hi (C_INFO)
{
	npc		= Mod_1014_KGD_Leibwache_MT;
	nr		= 1;
	condition	= Info_Mod_LeibwacheHymir_Hi_Condition;
	information	= Info_Mod_LeibwacheHymir_Hi_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_LeibwacheHymir_Hi_Condition()
{
	if (!Npc_KnowsInfo(hero, Info_Mod_Ole_Vorbereitungen2))
	&& (!Npc_KnowsInfo(hero, Info_Mod_LeibwacheHymir_Treue))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_LeibwacheHymir_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_LeibwacheHymir_Hi_06_00"); //Halt! Ohne Erlaubnis wird niemand zu Hymir vorgelassen.
	AI_Output(hero, self, "Info_Mod_LeibwacheHymir_Hi_15_01"); //Warum das denn? Er sieht nicht so aus, als hätte er viel zu tun.
	AI_Output(self, hero, "Info_Mod_LeibwacheHymir_Hi_06_02"); //Das ist egal. Ich habe den Befehl, niemanden passieren zu lassen, und auch du wirst dich danach richten, verstanden!
	AI_Output(hero, self, "Info_Mod_LeibwacheHymir_Hi_15_03"); //Schon in Ordnung, ich geh ja schon.

	AI_TurnAway	(hero, self);

	AI_GotoWP	(hero, "MC_THRON_1");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_LeibwacheHymir_DarfDurch (C_INFO)
{
	npc		= Mod_1014_KGD_Leibwache_MT;
	nr		= 1;
	condition	= Info_Mod_LeibwacheHymir_DarfDurch_Condition;
	information	= Info_Mod_LeibwacheHymir_DarfDurch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_LeibwacheHymir_DarfDurch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ole_Vorbereitungen2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_LeibwacheHymir_DarfDurch_Info()
{
	AI_Output(self, hero, "Info_Mod_LeibwacheHymir_DarfDurch_06_00"); //Halt!
	AI_Output(hero, self, "Info_Mod_LeibwacheHymir_DarfDurch_15_01"); //Ole schickt mich, er meint Hymir will mich sehen.
	AI_Output(self, hero, "Info_Mod_LeibwacheHymir_DarfDurch_06_02"); //Warte hier!

	AI_TurnToNpc	(self, Mod_1016_KGD_Hymir_MT);

	AI_Wait (self, 3);

	AI_TurnToNpc	(self, hero);

	AI_Output(self, hero, "Info_Mod_LeibwacheHymir_DarfDurch_06_03"); //Gut! Du darfst zu ihm gehen.
};

INSTANCE Info_Mod_LeibwacheHymir_EXIT (C_INFO)
{
	npc		= Mod_1014_KGD_Leibwache_MT;
	nr		= 1;
	condition	= Info_Mod_LeibwacheHymir_EXIT_Condition;
	information	= Info_Mod_LeibwacheHymir_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_LeibwacheHymir_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_LeibwacheHymir_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};