INSTANCE Info_Mod_Myxir_NW_Irdorath3 (C_INFO)
{
	npc		= Mod_7447_KDS_Myxir_NW;
	nr		= 1;
	condition	= Info_Mod_Myxir_NW_Irdorath3_Condition;
	information	= Info_Mod_Myxir_NW_Irdorath3_Info;
	permanent	= 1;
	important	= 0;
	description	= "Tut mir leid, aber es scheint das wir zu viele sind.";
};

FUNC INT Info_Mod_Myxir_NW_Irdorath3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Myxir_Irdorath))
	&& (Mod_Irdorath == 0)
	&& (Mod_MyxirDabei == 2)
	&& (((Mod_JackDabei == 1)
	&& (Mod_CrewCount > 15))
	|| (Mod_CedricDabei == 1))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Myxir_NW_Irdorath3_Info()
{
	AI_Output(hero, self, "Info_Mod_Myxir_NW_Irdorath3_15_00"); //Tut mir leid, aber es scheint das wir zu viele sind. Ich kann dich doch nicht mitnehmen.
	AI_Output(self, hero, "Info_Mod_Myxir_NW_Irdorath3_15_01"); //Wie war das? Ich rate dir ganz genau zu überlegen, was du jetzt sagst ...

	Info_ClearChoices	(Info_Mod_Myxir_NW_Irdorath3);

	Info_AddChoice	(Info_Mod_Myxir_NW_Irdorath3, "Nein, es geht leider wirklich nicht. Die Plätze sind voll.", Info_Mod_Myxir_NW_Irdorath3_B);
	Info_AddChoice	(Info_Mod_Myxir_NW_Irdorath3, "Ähhm, war nur ein organisatorisches Missverständnis.", Info_Mod_Myxir_NW_Irdorath3_A);
};

FUNC VOID Info_Mod_Myxir_NW_Irdorath3_B()
{
	AI_Output(hero, self, "Info_Mod_Myxir_NW_Irdorath3_B_15_00"); //Nein, es geht leider wirklich nicht. Die Plätze sind voll.
	AI_Output(self, hero, "Info_Mod_Myxir_NW_Irdorath3_B_15_01"); //(zornig) In Ordnung, es ist dein Entschluss.
	AI_Output(self, hero, "Info_Mod_Myxir_NW_Irdorath3_B_15_02"); //Ich werde aber nicht so einfach gehen, ohne dir noch ein Präsent zu hinterlassen. Viel Spaß damit.

	Info_ClearChoices	(Info_Mod_Myxir_NW_Irdorath3);

	Mod_MyxirDabei = 3;

	Mod_CrewCount -= 1;

	AI_StopProcessInfos	(self);

	AI_Teleport	(self, "TOT");
	B_StartOtherRoutine	(self, "TOT");

	Wld_InsertNpc	(SkeletonWarrior, "PC_HERO");
	Wld_InsertNpc	(SkeletonWarrior, "PC_HERO");
	Wld_InsertNpc	(SkeletonWarrior, "PC_HERO");
};

FUNC VOID Info_Mod_Myxir_NW_Irdorath3_A()
{
	AI_Output(hero, self, "Info_Mod_Myxir_NW_Irdorath3_A_15_00"); //Ähhm, war nur ein organisatorisches Missverständnis.

	Info_ClearChoices	(Info_Mod_Myxir_NW_Irdorath3);
};

INSTANCE Info_Mod_Myxir_NW_EXIT (C_INFO)
{
	npc		= Mod_7447_KDS_Myxir_NW;
	nr		= 1;
	condition	= Info_Mod_Myxir_NW_EXIT_Condition;
	information	= Info_Mod_Myxir_NW_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Myxir_NW_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Myxir_NW_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};