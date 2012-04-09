INSTANCE Info_Mod_Setta_TUG_Hi (C_INFO)
{
	npc		= Mod_7361_OUT_Setta_TUG;
	nr		= 1;
	condition	= Info_Mod_Setta_TUG_Hi_Condition;
	information	= Info_Mod_Setta_TUG_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Setta_TUG_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Trador_Buff))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Setta_TUG_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Setta_TUG_Hi_16_00"); //Ich habe mich wieder erinnert, habe ich. Nur deinetwegen waren wir in dem Tal!

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Setta_TUG_Trador (C_INFO)
{
	npc		= Mod_7361_OUT_Setta_TUG;
	nr		= 1;
	condition	= Info_Mod_Setta_TUG_Trador_Condition;
	information	= Info_Mod_Setta_TUG_Trador_Info;
	permanent	= 0;
	important	= 0;
	description	= "Das wäre geschafft. Woher kanntest du Trador?";
};

FUNC INT Info_Mod_Setta_TUG_Trador_Condition()
{
	if (Mod_VMG_WSTrador == 4)
	|| (Mod_VMG_WSTrador == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Setta_TUG_Trador_Info()
{
	AI_Output(hero, self, "Info_Mod_Setta_TUG_Trador_15_00"); //Das wäre geschafft. Woher kanntest du Trador?
	AI_Output(self, hero, "Info_Mod_Setta_TUG_Trador_16_01"); //Vor zwei Jahren war ich noch Tänzerin für Gomez, war ich. Trador war einer der Hofmagier.
	AI_Output(self, hero, "Info_Mod_Setta_TUG_Trador_16_02"); //Mit ein paar anderen Leuten hat er ein Attentat auf Corristo geplant, hat er, aber ich habe das mitbekommen und gemeldet.
	AI_Output(self, hero, "Info_Mod_Setta_TUG_Trador_16_03"); //Er hat mich aber noch erwischt, hat er, und mich mit einer Teleporterrune in das Tal verfrachtet.
	AI_Output(self, hero, "Info_Mod_Setta_TUG_Trador_16_04"); //Ich baute mir ein Häuschen und entdeckte den alten Buff, entdeckte ich.
	AI_Output(self, hero, "Info_Mod_Setta_TUG_Trador_16_05"); //Ich hab ihm angeboten, bei mir zu nächtigen, hab ich, aber er wollte in seinem Zelt schlafen.
	AI_Output(self, hero, "Info_Mod_Setta_TUG_Trador_16_06"); //Durch dein Auftauchen wurde mir der Mut zum Handeln zurückgegeben, wurde er.
	AI_Output(self, hero, "Info_Mod_Setta_TUG_Trador_16_07"); //Vielen Dank! Was soll deine Belohnung sein?

	Mod_VMG_WSTrador += 1;

	if (Mod_VMG_WSTrador == 6)
	{
		B_LogEntry	(TOPIC_MOD_TURENDIL_GOLEM, "Ich habe mit den beiden gesprochen und eine Kurzfassung ihrer Lebensgeschichte gehört. Über seine Gruppe habe ich leider nichts Wissenswertes erfahren, aber ich weiß nun, dass er ein ehemaliger Gefangener in der Kolonie war. Ich sollte mal mit Genn wegen des Teleporters reden.");
	};

	B_StartOtherRoutine	(self, "DORF");

	Info_ClearChoices	(Info_Mod_Setta_TUG_Trador);

	Info_AddChoice	(Info_Mod_Setta_TUG_Trador, "Gib mir 100 Goldmünzen.", Info_Mod_Setta_TUG_Trador_C);
	Info_AddChoice	(Info_Mod_Setta_TUG_Trador, "Vielleicht 50 Goldmünzen. Das reicht völlig.", Info_Mod_Setta_TUG_Trador_B);
	Info_AddChoice	(Info_Mod_Setta_TUG_Trador, "Ich brauche keine Belohnung, dein Dank ist mir genug.", Info_Mod_Setta_TUG_Trador_A);
};

FUNC VOID Info_Mod_Setta_TUG_Trador_C()
{
	AI_Output(hero, self, "Info_Mod_Setta_TUG_Trador_C_15_00"); //Gib mir 100 Goldmünzen.
	AI_Output(self, hero, "Info_Mod_Setta_TUG_Trador_C_16_01"); //So viel? Ich muss schauen, ob ich so viel habe, muss ich. Ja, hier.

	B_GiveInvItems	(self, hero, ItMi_Gold, 100);

	Info_ClearChoices	(Info_Mod_Setta_TUG_Trador);
};

FUNC VOID Info_Mod_Setta_TUG_Trador_B()
{
	AI_Output(hero, self, "Info_Mod_Setta_TUG_Trador_B_15_00"); //Vielleicht 50 Goldmünzen. Das reicht völlig.
	AI_Output(self, hero, "Info_Mod_Setta_TUG_Trador_B_16_01"); //Hier. Ich weiß, dass das Gold in guten Händen ist, weiß ich.

	B_GiveInvItems	(self, hero, ItMi_Gold, 50);

	B_GivePlayerXP	(100);

	Info_ClearChoices	(Info_Mod_Setta_TUG_Trador);
};

FUNC VOID Info_Mod_Setta_TUG_Trador_A()
{
	AI_Output(hero, self, "Info_Mod_Setta_TUG_Trador_A_15_00"); //Ich brauche keine Belohnung, dein Dank ist mir genug.
	AI_Output(self, hero, "Info_Mod_Setta_TUG_Trador_A_16_01"); //Vielen, vielen Dank! Ich werde das nie vergessen, nie.

	B_GivePlayerXP	(200);

	Info_ClearChoices	(Info_Mod_Setta_TUG_Trador);
};

INSTANCE Info_Mod_Setta_TUG_EXIT (C_INFO)
{
	npc		= Mod_7361_OUT_Setta_TUG;
	nr		= 1;
	condition	= Info_Mod_Setta_TUG_EXIT_Condition;
	information	= Info_Mod_Setta_TUG_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Setta_TUG_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Setta_TUG_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};