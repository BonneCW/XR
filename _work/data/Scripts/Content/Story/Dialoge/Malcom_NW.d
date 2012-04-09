INSTANCE Info_Mod_Malcom_NW_Hi (C_INFO)
{
	npc		= Mod_963_PIR_Malcom_NW;
	nr		= 1;
	condition	= Info_Mod_Malcom_NW_Hi_Condition;
	information	= Info_Mod_Malcom_NW_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Malcom_NW_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Malcom_NW_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Malcom_NW_Hi_04_00"); //Hey du!
	AI_Output(hero, self, "Info_Mod_Malcom_NW_Hi_15_01"); //Meinst du mich?
	AI_Output(self, hero, "Info_Mod_Malcom_NW_Hi_04_02"); //Ja, du. Ich hab was zu tun für dich.

	Info_ClearChoices	(Info_Mod_Malcom_NW_Hi);

	Info_AddChoice	(Info_Mod_Malcom_NW_Hi, "Ich hab keine Zeit.", Info_Mod_Malcom_NW_Hi_Nein);
	Info_AddChoice	(Info_Mod_Malcom_NW_Hi, "Was soll ich für dich machen?", Info_Mod_Malcom_NW_Hi_Ja);
};

FUNC VOID Info_Mod_Malcom_NW_Hi_Nein()
{
	AI_Output(hero, self, "Info_Mod_Malcom_NW_Hi_Nein_15_00"); //Ich hab keine Zeit.
	AI_Output(self, hero, "Info_Mod_Malcom_NW_Hi_Nein_04_01"); //Wie du meinst, aber ich hätte dir später sicher mal helfen können.

	Info_ClearChoices	(Info_Mod_Malcom_NW_Hi);
};

FUNC VOID Info_Mod_Malcom_NW_Hi_Ja()
{
	AI_Output(hero, self, "Info_Mod_Malcom_NW_Hi_Ja_15_00"); //Was soll ich für dich machen?
	AI_Output(self, hero, "Info_Mod_Malcom_NW_Hi_Ja_04_01"); //Ich war vor ein paar Tagen mit meine Boot unterwegs, als ein Sturm kam und ich hier gestrandet bin. Dabei habe ich meinen Geldbeutel verloren.
	AI_Output(self, hero, "Info_Mod_Malcom_NW_Hi_Ja_04_02"); //Er liegt dort drüben, allerdings kann ich nicht da rüber, da tummelt sich ein Waran. Ich will, dass du mir meinen Geldbeutel holst.

	Log_CreateTopic	(TOPIC_MOD_MALCOM_GOLD, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_MALCOM_GOLD, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_MALCOM_GOLD, "Malcom ist vor ein paar Tagen am Strand vor Khorinis gestrandet und hat dabei seinen Geldbeutel verloren. Dieser wird von einem Waran bewacht.");

	Info_ClearChoices	(Info_Mod_Malcom_NW_Hi);
};

INSTANCE Info_Mod_Malcom_NW_Beutel (C_INFO)
{
	npc		= Mod_963_PIR_Malcom_NW;
	nr		= 1;
	condition	= Info_Mod_Malcom_NW_Beutel_Condition;
	information	= Info_Mod_Malcom_NW_Beutel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab deinen Beutel.";
};

FUNC INT Info_Mod_Malcom_NW_Beutel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Malcom_NW_Hi))
	&& (Npc_HasItems(hero, ItMi_Malcom_Beutel) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Malcom_NW_Beutel_Info()
{
	AI_Output(hero, self, "Info_Mod_Malcom_NW_Beutel_15_00"); //Ich hab deinen Beutel.
	
	B_GiveInvItems	(hero, self, ItMi_Malcom_Beutel, 1);

	AI_Output(self, hero, "Info_Mod_Malcom_NW_Beutel_04_01"); //Vielen Dank, jetzt muss ich nur noch einen Weg zurück zum Lager finden. Ich hoffe hier schaut bald mal einer von meinen Kumpels vorbei.

	B_LogEntry	(TOPIC_MOD_MALCOM_GOLD, "Ich habe Malcom sein Gold gebracht.");
	B_SetTopicStatus	(TOPIC_MOD_MALCOM_GOLD, LOG_SUCCESS);

	B_GivePlayerXP	(100);

	B_Göttergefallen(2, 1);
};

INSTANCE Info_Mod_Malcom_NW_EXIT (C_INFO)
{
	npc		= Mod_963_PIR_Malcom_NW;
	nr		= 1;
	condition	= Info_Mod_Malcom_NW_EXIT_Condition;
	information	= Info_Mod_Malcom_NW_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Malcom_NW_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Malcom_NW_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};