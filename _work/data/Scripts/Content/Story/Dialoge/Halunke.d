INSTANCE Info_Mod_Halunke_Hi (C_INFO)
{
	npc		= Mod_7214_OUT_Halunke_NW;
	nr		= 1;
	condition	= Info_Mod_Halunke_Hi_Condition;
	information	= Info_Mod_Halunke_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Halunke_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Halunke_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Halunke_Hi_06_00"); //Wen haben wir denn da? Jemand, der wohl unterwegs ist zu den Wassermagiern.
	AI_Output(self, hero, "Info_Mod_Halunke_Hi_06_01"); //Und jemand, der zu den Wassermagiern unterwegs ist, ist vermutlich einer ihrer Boten.
	AI_Output(self, hero, "Info_Mod_Halunke_Hi_06_02"); //Und ihre Boten haben bestimmt einige Goldmünzen, die sie locker machen können.

	Wld_InsertNpc	(Mod_7215_OUT_Halunke_NW, "NW_TROLLAREA_RUINS_01");
	Wld_InsertNpc	(Mod_7216_OUT_Halunke_NW, "NW_TROLLAREA_RUINS_01");
};

INSTANCE Info_Mod_Halunke_Gold (C_INFO)
{
	npc		= Mod_7214_OUT_Halunke_NW;
	nr		= 1;
	condition	= Info_Mod_Halunke_Gold_Condition;
	information	= Info_Mod_Halunke_Gold_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier habt ihr 500 Goldmünzen. Ich will keinen Ärger.";
};

FUNC INT Info_Mod_Halunke_Gold_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Halunke_Hi))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 500)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Halunke_Angriff))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Halunke_Gold_Info()
{
	AI_Output(hero, self, "Info_Mod_Halunke_Gold_15_00"); //Hier habt ihr 500 Goldmünzen. Ich will keinen Ärger.

	B_GiveInvItems	(hero, self, ItMi_Gold, 500);

	AI_Output(self, hero, "Info_Mod_Halunke_Gold_06_01"); //500 Goldmünzen? Wo es so viel zu holen gibt, gibt es bestimmt noch mehr.
};

INSTANCE Info_Mod_Halunke_Angriff (C_INFO)
{
	npc		= Mod_7214_OUT_Halunke_NW;
	nr		= 1;
	condition	= Info_Mod_Halunke_Angriff_Condition;
	information	= Info_Mod_Halunke_Angriff_Info;
	permanent	= 0;
	important	= 0;
	description	= "Von mir kriegt ihr Halunken gar nichts.";
};

FUNC INT Info_Mod_Halunke_Angriff_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Halunke_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Halunke_Gold))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Halunke_Angriff_Info()
{
	AI_Output(hero, self, "Info_Mod_Halunke_Angriff_15_00"); //Von mir kriegt ihr Halunken gar nichts.
	AI_Output(self, hero, "Info_Mod_Halunke_Angriff_06_01"); //Wie du willst.
};

INSTANCE Info_Mod_Halunke_EXIT (C_INFO)
{
	npc		= Mod_7214_OUT_Halunke_NW;
	nr		= 1;
	condition	= Info_Mod_Halunke_EXIT_Condition;
	information	= Info_Mod_Halunke_EXIT_Info;
	permanent	= 0;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Halunke_EXIT_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Halunke_Angriff))
	|| (Npc_KnowsInfo(hero, Info_Mod_Halunke_Gold))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Halunke_EXIT_Info()
{
	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_Kill, 0);
	B_Attack	(Mod_7215_OUT_Halunke_NW, hero, AR_Kill, 0);
	B_Attack	(Mod_7216_OUT_Halunke_NW, hero, AR_Kill, 0);
};