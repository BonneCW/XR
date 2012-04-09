INSTANCE Info_Mod_Den_Hi (C_INFO)
{
	npc		= Mod_969_MIL_Den_NW;
	nr		= 1;
	condition	= Info_Mod_Den_Hi_Condition;
	information	= Info_Mod_Den_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Den_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Den_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Den_Hi_05_01"); //Ich bin Den, Stadtwache von Khorinis.
};

INSTANCE Info_Mod_Den_Problem (C_INFO)
{
	npc		= Mod_969_MIL_Den_NW;
	nr		= 1;
	condition	= Info_Mod_Den_Problem_Condition;
	information	= Info_Mod_Den_Problem_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Den_Problem_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Den_Hi))
	&& (Wld_GetDay() >= 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Den_Problem_Info()
{
	AI_Output(self, hero, "Info_Mod_Den_Problem_05_00"); //Hey Du!
	AI_Output(hero, self, "Info_Mod_Den_Problem_15_01"); //Meinst du mich?
	AI_Output(self, hero, "Info_Mod_Den_Problem_05_02"); //Ja dich. Du bist doch neu hier, oder?
	AI_Output(hero, self, "Info_Mod_Den_Problem_15_03"); //Ja, wieso?
	AI_Output(self, hero, "Info_Mod_Den_Problem_05_04"); //Ich hab ein Problem. Du bist neu hier und könntest mir vielleicht dabei helfen.
	AI_Output(hero, self, "Info_Mod_Den_Problem_15_05"); //Worum gehts?
	AI_Output(self, hero, "Info_Mod_Den_Problem_05_06"); //Nun es ist so, dass ich schon recht lange gute Arbeit als Miliz leiste, aber Lord Andre will mich nicht befördern.
	AI_Output(self, hero, "Info_Mod_Den_Problem_05_07"); //Ich vermute, dass mich jemand bei Lord Andre schlecht macht, um mir meine Beförderung zu versauen.
	AI_Output(hero, self, "Info_Mod_Den_Problem_15_08"); //Aber wer sollte denn sowas tun?
	AI_Output(self, hero, "Info_Mod_Den_Problem_05_09"); //Rangar! Ich bin mir sicher, dass er dahinter steckt.
	AI_Output(hero, self, "Info_Mod_Den_Problem_15_10"); //Und was ist dann meine Aufgabe?
	AI_Output(self, hero, "Info_Mod_Den_Problem_05_11"); //Du sollst ein schlechtes Licht auf Rangar werfen. Verbreite Gerüchte über ihn, schmuggel verbotene Waren in seine Truhe und dann berichte Lord Andre davon.
	AI_Output(hero, self, "Info_Mod_Den_Problem_15_12"); //Und was hab ich davon?
	AI_Output(self, hero, "Info_Mod_Den_Problem_05_13"); //Ich werde dich natürlich dafür bezahlen. Also an die Arbeit!

	AI_StopProcessInfos	(self);

	Log_CreateTopic	(TOPIC_MOD_DENSPROBLEM, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_DENSPROBLEM, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_DENSPROBLEM, "Der Milizsoldat Den wartet vergeblich auf eine Beförderung, da Rangar ihn scheinbar bei Lord Andre schlecht macht. Ich soll jetzt das Gleiche mit Rangar machen: Gerüchte über ihn verbreiten, verbotene Waren in seine Truhe schmuggeln und ihn dann bei Lord Andre anschwärzen.");
};

INSTANCE Info_Mod_Den_Verbotenes (C_INFO)
{
	npc		= Mod_969_MIL_Den_NW;
	nr		= 1;
	condition	= Info_Mod_Den_Verbotenes_Condition;
	information	= Info_Mod_Den_Verbotenes_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was für verbotene Waren meinst du?";
};

FUNC INT Info_Mod_Den_Verbotenes_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Den_Problem))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Andre_Rangar))
	&& (Mod_DenVerpfiffen == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Den_Verbotenes_Info()
{
	AI_Output(hero, self, "Info_Mod_Den_Verbotenes_15_00"); //Was für verbotene Waren meinst du?
	AI_Output(self, hero, "Info_Mod_Den_Verbotenes_05_01"); //Ein Stängel Sumpfkraut würde schon reichen. Lord Andre hat uns das Zeug untersagt.
	AI_Output(self, hero, "Info_Mod_Den_Verbotenes_05_02"); //Wenn er jemanden von der Miliz damit erwischt, dann gibt das richtig Ärger.
	AI_Output(self, hero, "Info_Mod_Den_Verbotenes_05_03"); //Noch besser wäre natürlich ein ganzes Paket Sumpfkraut, aber da kommst du nicht so leicht ran.

	B_LogEntry	(TOPIC_MOD_DENSPROBLEM, "Bei den verbotenen Waren, die Den vorschweben, handelt es sich um Sumpfkraut. Ein Stängel sollte schon reichen, ein ganzes Paket wäre aber noch besser. Den meint nur, dass man da nicht so leicht ran kommen wird.");
};

INSTANCE Info_Mod_Den_RangarsTruhe (C_INFO)
{
	npc		= Mod_969_MIL_Den_NW;
	nr		= 1;
	condition	= Info_Mod_Den_RangarsTruhe_Condition;
	information	= Info_Mod_Den_RangarsTruhe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wo finde ich Rangars Truhe?";
};

FUNC INT Info_Mod_Den_RangarsTruhe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Den_Problem))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Andre_Rangar))
	&& (Mod_DenVerpfiffen == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Den_RangarsTruhe_Info()
{
	AI_Output(hero, self, "Info_Mod_Den_RangarsTruhe_15_00"); //Wo finde ich Rangars Truhe?
	AI_Output(self, hero, "Info_Mod_Den_RangarsTruhe_05_01"); //Die steht in seiner Nähe, an der Mauer beim Freibierstand.

	B_LogEntry	(TOPIC_MOD_DENSPROBLEM, "Rangars Truhe finde ich in seiner Nähe, an der Mauer beim Freibierstand.");
};

INSTANCE Info_Mod_Den_Rangar (C_INFO)
{
	npc		= Mod_969_MIL_Den_NW;
	nr		= 1;
	condition	= Info_Mod_Den_Rangar_Condition;
	information	= Info_Mod_Den_Rangar_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab mit Lord Andre gesprochen.";
};

FUNC INT Info_Mod_Den_Rangar_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_Rangar))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Den_Rangar_Info()
{
	AI_Output(hero, self, "Info_Mod_Den_Rangar_15_00"); //Ich hab mit Lord Andre gesprochen.
	AI_Output(self, hero, "Info_Mod_Den_Rangar_05_01"); //Und was hat er gesagt?
	AI_Output(hero, self, "Info_Mod_Den_Rangar_15_02"); //Er wird die Sachen überprüfen.
	AI_Output(self, hero, "Info_Mod_Den_Rangar_05_03"); //Sehr gut, hier ist deine Belohnung.

	CreateInvItems	(self, ItMi_Gold, 250);
	B_GiveInvItems	(self, hero, ItMi_Gold, 250);

	B_GivePlayerXP	(250);

	B_SetTopicStatus	(TOPIC_MOD_DENSPROBLEM, LOG_SUCCESS);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Den_Pickpocket (C_INFO)
{
	npc		= Mod_969_MIL_Den_NW;
	nr		= 1;
	condition	= Info_Mod_Den_Pickpocket_Condition;
	information	= Info_Mod_Den_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Den_Pickpocket_Condition()
{
	C_Beklauen	(60, ItMi_Gold, 200);
};

FUNC VOID Info_Mod_Den_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Den_Pickpocket);

	Info_AddChoice	(Info_Mod_Den_Pickpocket, DIALOG_BACK, Info_Mod_Den_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Den_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Den_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Den_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Den_Pickpocket);
};

FUNC VOID Info_Mod_Den_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Den_Pickpocket);
};

INSTANCE Info_Mod_Den_EXIT (C_INFO)
{
	npc		= Mod_969_MIL_Den_NW;
	nr		= 1;
	condition	= Info_Mod_Den_EXIT_Condition;
	information	= Info_Mod_Den_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Den_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Den_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};