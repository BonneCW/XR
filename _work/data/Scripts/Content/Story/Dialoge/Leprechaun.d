INSTANCE Info_Mod_Leprechaun_Hi (C_INFO)
{
	npc		= Monster_11073_Leprechaun_AW;
	nr		= 1;
	condition	= Info_Mod_Leprechaun_Hi_Condition;
	information	= Info_Mod_Leprechaun_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Leprechaun_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Leprechaun_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Leprechaun_Hi_20_00"); //Direkt in die Falle gelaufen.
	AI_Output(hero, self, "Info_Mod_Leprechaun_Hi_15_01"); //Was wird das hier?
	AI_Output(self, hero, "Info_Mod_Leprechaun_Hi_20_02"); //Der Meister hat entschieden, dass jetzt die Zeit gekommen ist, dich zu ihm zu bringen.
	AI_Output(self, hero, "Info_Mod_Leprechaun_Hi_20_03"); //Seine Kraft ist nun groß genug, es mit dir aufzunehmen.

	Info_ClearChoices	(Info_Mod_Leprechaun_Hi);

	Info_AddChoice	(Info_Mod_Leprechaun_Hi, "Wieso gerade ich?", Info_Mod_Leprechaun_Hi_B);
	Info_AddChoice	(Info_Mod_Leprechaun_Hi, "Wer ist dein Meister?", Info_Mod_Leprechaun_Hi_A);
};

FUNC VOID Info_Mod_Leprechaun_Hi_C()
{
	AI_Output(self, hero, "Info_Mod_Leprechaun_Hi_C_20_00"); //Das bedeutet wohl, dass Leprechaun die falsche Person gefangen hält.
	AI_Output(self, hero, "Info_Mod_Leprechaun_Hi_C_20_01"); //Diese Nachricht wird seinen Herrn nicht erfreuen.

	Info_ClearChoices	(Info_Mod_Leprechaun_Hi);

	Log_CreateTopic	(TOPIC_MOD_MAGISCHEMARKIERUNG, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_MAGISCHEMARKIERUNG, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_MAGISCHEMARKIERUNG, "Kaum angekommen in Jharkendar, wurde ich schon von einer rätselhaften Gestalt gefangen genommen. Sie behauptete, ein Diener von Xeres zu sein, ließ mich aber fast dankbar frei, als ich ihr vorspielte, nicht der zu sein, den sie suchte.");

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_Leprechaun_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Leprechaun_Hi_B_15_00"); //Wieso gerade ich?
	AI_Output(self, hero, "Info_Mod_Leprechaun_Hi_B_20_01"); //Du hast das Lieblingshaustier des Meisters getötet. Tagelang tobte er durch seine Hallen.

	if (hero.guild == GIL_MIL)
	{
		AI_Output(hero, self, "Info_Mod_Leprechaun_Hi_B_15_02"); //Ich?! Ich bin doch nur ein einfacher Söldner!
	}
	else if (hero.guild == GIL_PAL)
	{
		AI_Output(hero, self, "Info_Mod_Leprechaun_Hi_B_15_03"); //Ich?! Ich bin doch nur ein einfacher Milizsoldat!
	}
	else if (hero.guild == GIL_NOV)
	{
		AI_Output(hero, self, "Info_Mod_Leprechaun_Hi_B_15_04"); //Ich?! Ich bin doch nur ein einfacher Wassernovize!
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output(hero, self, "Info_Mod_Leprechaun_Hi_B_15_05"); //Ich?! Ich bin doch nur ein einfacher Schwarzer Novize!
	}
	else if (hero.guild == GIL_VLK)
	{
		AI_Output(hero, self, "Info_Mod_Leprechaun_Hi_B_15_06"); //Ich?! Ich bin doch nur ein einfacher Feuernovize!
	};

	AI_Output(self, hero, "Info_Mod_Leprechaun_Hi_B_20_07"); //(hoffnungsvoll) Also bist du nicht der, den sie den Auserwählten nennen?
	AI_Output(hero, self, "Info_Mod_Leprechaun_Hi_B_15_08"); //Davon habe ich noch nie etwas gehört.
	AI_Output(self, hero, "Info_Mod_Leprechaun_Hi_B_20_09"); //Na, so was. Der Meister war sich sicher, dass er es wäre, der als Erster das Portal durchqueren würde, und nicht einer der unwichtigen Handlanger.

	Mod_Leprechaun_Choices += 1;

	if (Mod_Leprechaun_Choices == 2)
	{
		Info_Mod_Leprechaun_Hi_C();
	};
};

FUNC VOID Info_Mod_Leprechaun_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Leprechaun_Hi_A_15_00"); //Wer ist dein Meister?
	AI_Output(self, hero, "Info_Mod_Leprechaun_Hi_A_20_01"); //Xeres ist der Herr und Gebieter. Leprechauns Familie dient ihm seit über hundert Generationen.

	Mod_Leprechaun_Choices += 1;

	if (Mod_Leprechaun_Choices == 2)
	{
		Info_Mod_Leprechaun_Hi_C();
	};
};

INSTANCE Info_Mod_Leprechaun_EXIT (C_INFO)
{
	npc		= Monster_11073_Leprechaun_AW;
	nr		= 1;
	condition	= Info_Mod_Leprechaun_EXIT_Condition;
	information	= Info_Mod_Leprechaun_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Leprechaun_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Leprechaun_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};