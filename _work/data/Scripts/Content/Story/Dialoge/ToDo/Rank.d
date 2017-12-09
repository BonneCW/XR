INSTANCE Info_Mod_Rank_Hueterklinge (C_INFO)
{
	npc		= Mod_7721_OUT_Rank_MT;
	nr		= 1;
	condition	= Info_Mod_Rank_Hueterklinge_Condition;
	information	= Info_Mod_Rank_Hueterklinge_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Rank_Hueterklinge_Condition()
{
	if (Mod_TPL_HK_Ydran == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rank_Hueterklinge_Info()
{
	AI_Output(self, hero, "Info_Mod_Rank_Hueterklinge_06_00"); //Hast dem alten Haudegen wohl den Rest gegeben was? Der Letzte hatte nicht so viel Glück.
	AI_Output(hero, self, "Info_Mod_Rank_Hueterklinge_15_01"); //Der Letzte?
	AI_Output(self, hero, "Info_Mod_Rank_Hueterklinge_06_02"); //Ja, ist noch gar nicht lange her.
	AI_Output(hero, self, "Info_Mod_Rank_Hueterklinge_15_03"); //Was ist passiert?
	AI_Output(self, hero, "Info_Mod_Rank_Hueterklinge_06_04"); //Ein Templer kam hier vorbei, da wurde er vom alten Haudegen angefallen.
	AI_Output(self, hero, "Info_Mod_Rank_Hueterklinge_06_05"); //Hat ihm zwar ganz schön zugesetzt, aber er konnte ihn doch nicht besiegen und ist auch als Abendbrot geendet.
	AI_Output(self, hero, "Info_Mod_Rank_Hueterklinge_06_06"); //Ich kam leider zu spät vorbei. Der Templer hat mir kurz bevor er sein Leben ausgehaucht hat gesagt, er wollte den Eremiten besuchen, der hier begraben liegt.
	AI_Output(self, hero, "Info_Mod_Rank_Hueterklinge_06_07"); //Ich fand es also ganz passend, ihn im gleichen Grab zu beerdigen. Und da liegen sie jetzt.
	AI_Output(hero, self, "Info_Mod_Rank_Hueterklinge_15_08"); //Was hast du mit seinen Sachen gemacht?
	AI_Output(self, hero, "Info_Mod_Rank_Hueterklinge_06_09"); //Das war nur einiger seltsamer Plunder. Den hab' ich in einem Beutel mit ihm begraben.

	B_LogEntry	(TOPIC_MOD_SL_SCHMIEDEFEUERN, "Gor Na Kosh hat die Zutaten zwar gefunden, konnte seine Hüterklinge aber nicht mehr bekommen. Rank hat gesagt, er habe Gor Na Koshs Zeug mit ihm begraben. Da werde ich wohl eine Hacke brauchen ...");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TOT");

	Wld_SendTrigger	("EVT_GORNAKOSHSZEUG");
};

INSTANCE Info_Mod_Rank_EXIT (C_INFO)
{
	npc		= Mod_7721_OUT_Rank_MT;
	nr		= 1;
	condition	= Info_Mod_Rank_EXIT_Condition;
	information	= Info_Mod_Rank_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Rank_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Rank_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};