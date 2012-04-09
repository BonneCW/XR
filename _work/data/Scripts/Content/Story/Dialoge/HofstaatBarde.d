INSTANCE Info_Mod_HofstaatBarde_Hi (C_INFO)
{
	npc		= Mod_7269_HS_Barde_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatBarde_Hi_Condition;
	information	= Info_Mod_HofstaatBarde_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatBarde_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HofstaatWache_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatBarde_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Hi_09_00"); //Ein schwarzer Geselle betritt unser Reich,
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Hi_09_01"); //Die Haare sind blond, das Gesicht ist bleich.
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Hi_09_02"); //Die Narben seiner Seele, die sieht man nicht,
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Hi_09_03"); //Nur den Schrecken in seinem Gesicht.
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Hi_09_04"); //Bringt er uns Freude oder Bringt er uns Leid?
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Hi_09_05"); //Kommt er aus Gunst oder kommt er aus Neid?

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_HofstaatBarde_Sporen (C_INFO)
{
	npc		= Mod_7269_HS_Barde_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatBarde_Sporen_Condition;
	information	= Info_Mod_HofstaatBarde_Sporen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatBarde_Sporen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alex_Pilzsporen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatBarde_Sporen_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_09_00"); //Wer schleicht mit verbotenem Wissen herum?
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_09_01"); //Wer verkauft den hiesigen König für dumm?
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_09_02"); //Wer ist er, der er unser Schicksal trägt,
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_09_03"); //Und noch seine Entscheidung abwägt.
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_09_04"); //Ich habe dich durchschaut. Vom ersten Tag an war mir klar was du willst, doch ist es dir jetzt klar?
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_09_05"); //Du wurdest geschickt uns zu zerstören,
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_09_06"); //Stattdessen begannst du uns anzugehören.
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_09_07"); //In der einen Hand hältst du die Klinge,
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_09_08"); //In der andren meine Kehle.
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_09_09"); //Und während ich noch hier singe,
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_09_10"); //Hast du nur eine Wahl: WÄHLE!
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_09_11"); //Willst du Sturm in unsrem Garten säen
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_09_12"); //Oder ihn gar selbst bebauen
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_09_13"); //Über  unsre Leichen gehen
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_09_14"); //Oder aus unsrer Mitte schaun'.
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_09_15"); //Entscheide dich, und wähle gut,
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_09_16"); //Gib uns Hoffnung, gib uns Mut
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_09_17"); //Oder aber: nimm sie uns
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_09_18"); //Und bring das Säckchen in den Sumpf.
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_09_19"); //Entscheide dich welcher Seite du angehören willst.
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_09_20"); //Willst du bei deiner alten Gemeinschaft im Sumpf bleiben, so bring ihnen dieses Pulver.
	AI_Output(self, hero, "Info_Mod_HofstaatBarde_Sporen_09_21"); //Willst du aber einer neuen Gemeinschaft nicht alle Hoffnung nehmen, so bringe dieses Pulver dem Alchemisten.

	AI_StopProcessInfos	(self);

	B_SetTopicStatus	(TOPIC_MOD_SEKTE_FREUDENSPENDER, LOG_SUCCESS);

	Log_CreateTopic	(TOPIC_MOD_SEKTE_ENTSCHEIDUNG, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SEKTE_ENTSCHEIDUNG, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_SEKTE_ENTSCHEIDUNG, "Der Barde hat mich durchschaut und mich vor die Wahl gestellt. Entweder entscheide ich mich für das Sumpflager, indem ich die Sporen zu Baal Namib bringe, oder aber für den Hofstaat, dann muss ich den königlichen Jäger aufsuchen.");
};

INSTANCE Info_Mod_HofstaatBarde_Pickpocket (C_INFO)
{
	npc		= Mod_7269_HS_Barde_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatBarde_Pickpocket_Condition;
	information	= Info_Mod_HofstaatBarde_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_HofstaatBarde_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 50);
};

FUNC VOID Info_Mod_HofstaatBarde_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_HofstaatBarde_Pickpocket);

	Info_AddChoice	(Info_Mod_HofstaatBarde_Pickpocket, DIALOG_BACK, Info_Mod_HofstaatBarde_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_HofstaatBarde_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_HofstaatBarde_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_HofstaatBarde_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_HofstaatBarde_Pickpocket);
};

FUNC VOID Info_Mod_HofstaatBarde_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_HofstaatBarde_Pickpocket);
};

INSTANCE Info_Mod_HofstaatBarde_EXIT (C_INFO)
{
	npc		= Mod_7269_HS_Barde_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatBarde_EXIT_Condition;
	information	= Info_Mod_HofstaatBarde_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_HofstaatBarde_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_HofstaatBarde_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};