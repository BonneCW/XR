INSTANCE Info_Mod_SchwarzNovize_PAT_Fokus04_Hi (C_INFO)
{
	npc		= Mod_7795_SNOV_Novize_PAT;
	nr		= 1;
	condition	= Info_Mod_SchwarzNovize_PAT_Fokus04_Hi_Condition;
	information	= Info_Mod_SchwarzNovize_PAT_Fokus04_Hi_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_SchwarzNovize_PAT_Fokus04_Hi_Condition()
{
	if (Npc_RefuseTalk(self) == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_SchwarzNovize_PAT_Fokus04_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_SchwarzNovize_PAT_Fokus04_Hi_11_00"); //Was soll das? Du dürftest gar nicht hier sein.

	Info_ClearChoices	(Info_Mod_SchwarzNovize_PAT_Fokus04_Hi);

	Info_AddChoice	(Info_Mod_SchwarzNovize_PAT_Fokus04_Hi, "Ich brauche diesen Fokus, geh mal zur Seite.", Info_Mod_SchwarzNovize_PAT_Fokus04_Hi_B);
	Info_AddChoice	(Info_Mod_SchwarzNovize_PAT_Fokus04_Hi, "Ich komme nur zufällig vorbei. Wollte sehen, was es hier so gibt.", Info_Mod_SchwarzNovize_PAT_Fokus04_Hi_A);
};

FUNC VOID Info_Mod_SchwarzNovize_PAT_Fokus04_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_SchwarzNovize_PAT_Fokus04_Hi_B_15_00"); //Ich brauche diesen Fokus, geh mal zur Seite.
	AI_Output(self, hero, "Info_Mod_SchwarzNovize_PAT_Fokus04_Hi_B_11_01"); //Also ich weiß nicht. Ich glaube, ich muss dich aufhalten.
	AI_Output(hero, self, "Info_Mod_SchwarzNovize_PAT_Fokus04_Hi_B_15_02"); //Dann komm doch!
	AI_Output(self, hero, "DEFAULT"); //

	Info_ClearChoices	(Info_Mod_SchwarzNovize_PAT_Fokus04_Hi);

	AI_StopProcessInfos	(self);

	self.flags = 0;

	self.guild = GIL_KDF;
	Npc_SetTrueGuild	(self, GIL_KDF);

	B_LogEntry	(TOPIC_MOD_FM_FOKI, "Mit der Wahrheit kommt man manchmal weiter. Erstaunlich eigentlich ...");

	Mod_PAT_Focus_04 = 1;
};

FUNC VOID Info_Mod_SchwarzNovize_PAT_Fokus04_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_SchwarzNovize_PAT_Fokus04_Hi_A_15_00"); //Ich komme nur zufällig vorbei. Wollte sehen, was es hier so gibt.
	AI_Output(self, hero, "DEFAULT"); //

	Info_ClearChoices	(Info_Mod_SchwarzNovize_PAT_Fokus04_Hi);

	AI_StopProcessInfos	(self);

	Npc_SetRefuseTalk	(self, 120);
};

INSTANCE Info_Mod_SchwarzNovize_PAT_Fokus04_EXIT (C_INFO)
{
	npc		= Mod_7795_SNOV_Novize_PAT;
	nr		= 1;
	condition	= Info_Mod_SchwarzNovize_PAT_Fokus04_EXIT_Condition;
	information	= Info_Mod_SchwarzNovize_PAT_Fokus04_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_SchwarzNovize_PAT_Fokus04_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_SchwarzNovize_PAT_Fokus04_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};