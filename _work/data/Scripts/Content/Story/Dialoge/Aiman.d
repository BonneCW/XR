INSTANCE Info_Mod_Aiman_Hi (C_INFO)
{
	npc		= Mod_7152_ASS_Aiman_NW;
	nr		= 1;
	condition	= Info_Mod_Aiman_Hi_Condition;
	information	= Info_Mod_Aiman_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Aiman_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mirza_Amulett))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Aiman_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Aiman_Hi_05_00"); //Da bist du ja.
	AI_Output(hero, self, "Info_Mod_Aiman_Hi_15_01"); //Ich tue, was ich kann. Was liegt an?
	AI_Output(self, hero, "Info_Mod_Aiman_Hi_05_02"); //Hast du schon mal von den Blutkelchen gehört?
	AI_Output(hero, self, "Info_Mod_Aiman_Hi_15_03"); //Ich habe für Amir schon mal einen besorgt. Vom Geldverleiher in Khorinis. Er ist tot.
	AI_Output(self, hero, "Info_Mod_Aiman_Hi_05_04"); //Natürlich, sonst hätte der Kelch ja keinen Wert. Der Besitzer muss sterben, damit die Kelche ihre Wirkung erlangen.
	AI_Output(hero, self, "Info_Mod_Aiman_Hi_15_05"); //Wieviele Kelche gibt es?
	AI_Output(self, hero, "Info_Mod_Aiman_Hi_05_06"); //Es sind drei. Einen besitzt nach unseren Informationen der Richter in Khorinis. Nach genau diesem verlangt der große Rat.
	AI_Output(hero, self, "Info_Mod_Aiman_Hi_15_07"); //Dann soll ich den Richter meucheln und den Kelch beibringen.
	AI_Output(self, hero, "Info_Mod_Aiman_Hi_05_08"); //Schlauer Bursche. Wenn dir das gelingt, ist dir ein Platz bei den Anwärtern sicher,
	AI_Output(hero, self, "Info_Mod_Aiman_Hi_15_09"); //Dann will ich mal ...

	AI_TurnAway	(hero, self);

	if (Mod_ASS_Krieger == 1)
	{
		AI_Output(hero, self, "Info_Mod_Aiman_Hi_15_10"); //Erst mal ein passendes Gift besorgen. Mal bei den Magiern hinten fragen.
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Aiman_Hi_15_11"); //Erst mal ein passendes Gift besorgen. Vielleicht kann Kamal helfen.
	};

	AI_TurnToNpc	(hero, self);

	Log_CreateTopic	(TOPIC_MOD_ASS_BLUTKELCH, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ASS_BLUTKELCH, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ASS_BLUTKELCH, "Ich soll dem Rat den 2. Blutkelch besorgen. Der Richter in Khorinis hat ihn wahrscheinlich. Er muss sterben, es sollte aber kein Aufsehen erregen. Gift wäre das rechte Mittel für einen Assassinen. Hier war doch irgendwo ein Alchemist ...");
};

INSTANCE Info_Mod_Aiman_Pickpocket (C_INFO)
{
	npc		= Mod_7152_ASS_Aiman_NW;
	nr		= 1;
	condition	= Info_Mod_Aiman_Pickpocket_Condition;
	information	= Info_Mod_Aiman_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Aiman_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Aiman_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Aiman_Pickpocket);

	Info_AddChoice	(Info_Mod_Aiman_Pickpocket, DIALOG_BACK, Info_Mod_Aiman_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Aiman_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Aiman_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Aiman_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Aiman_Pickpocket);
};

FUNC VOID Info_Mod_Aiman_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Aiman_Pickpocket);
};

INSTANCE Info_Mod_Aiman_EXIT (C_INFO)
{
	npc		= Mod_7152_ASS_Aiman_NW;
	nr		= 1;
	condition	= Info_Mod_Aiman_EXIT_Condition;
	information	= Info_Mod_Aiman_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Aiman_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Aiman_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};