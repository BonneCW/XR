INSTANCE Info_Mod_GorNaMon_Hi (C_INFO)
{
	npc		= Mod_1924_TPL_GorNaMon_MT;
	nr		= 1;
	condition	= Info_Mod_GorNaMon_Hi_Condition;
	information	= Info_Mod_GorNaMon_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_GorNaMon_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_GorNaKar_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_GorNaMon_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_GorNaMon_Hi_13_00"); //Nun sollten wir aufbrechen.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "GUIDETOOC");
	B_StartOtherRoutine	(Mod_1925_TPL_GorNaKar_MT, "FOLLOWTOOC");
	B_StartOtherRoutine	(Mod_1870_EBR_Alissandro_MT, "FOLLOWTOOC");
};

INSTANCE Info_Mod_GorNaMon_Hueterklinge (C_INFO)
{
	npc		= Mod_1924_TPL_GorNaMon_MT;
	nr		= 1;
	condition	= Info_Mod_GorNaMon_Hueterklinge_Condition;
	information	= Info_Mod_GorNaMon_Hueterklinge_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie bist du an die Rohstoffe für deine Hüterklinge gekommen?";
};

FUNC INT Info_Mod_GorNaMon_Hueterklinge_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Angar_Hueterklinge))
	&& (Mod_TPL_Hueterklinge == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_GorNaMon_Hueterklinge_Info()
{
	AI_Output(hero, self, "Info_Mod_GorNaMon_Hueterklinge_15_00"); //Wie bist du an die Rohstoffe für deine Hüterklinge gekommen?

	AI_PlayAni	(self, "T_SEARCH");

	AI_Output(self, hero, "Info_Mod_GorNaMon_Hueterklinge_13_01"); //Sag’s nicht weiter, aber ich hab die Hüterklinge von einem alten Templer bekommen, der sie nicht mehr gebraucht hat.

	B_LogEntry	(TOPIC_MOD_SL_SCHMIEDEFEUERN, "Gor Na Mon meinte, ich könnte von einem alten Templer eine Hüterklinge bekommen. Jetzt muss ich nur noch einen Templer finden, der seine Klinge nicht mehr braucht. Vielleicht kann ich von Angar ein paar Informationen bekommen.");
};

INSTANCE Info_Mod_GorNaMon_EXIT (C_INFO)
{
	npc		= Mod_1924_TPL_GorNaMon_MT;
	nr		= 1;
	condition	= Info_Mod_GorNaMon_EXIT_Condition;
	information	= Info_Mod_GorNaMon_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_GorNaMon_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_GorNaMon_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};