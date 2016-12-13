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
	AI_Output(self, hero, "Info_Mod_Malcom_NW_Hi_30_00"); //He - was willst du?
	AI_Output(hero, self, "Info_Mod_Malcom_NW_Hi_15_01"); //Du siehst ja geradezu verdächtig nach einem Pirat aus.
	AI_Output(self, hero, "Info_Mod_Malcom_NW_Hi_30_02"); //Ich bin auch einer, bei meiner einbeinigen Großmutter! Grimmig und gefährlich!
	AI_Output(hero, self, "Info_Mod_Malcom_NW_Hi_15_03"); //Aber ganze ohne Schiff...
	AI_Output(self, hero, "Info_Mod_Malcom_NW_Hi_30_04"); //Ja, verdammich! Ich bin vor ein paar Tagen bei einem Sturm gekentert. Jetzt liegt mein Boot da drüben auf dem Strand, bei meiner einäugigen Tante!

	Log_CreateTopic	(TOPIC_MOD_MALCOM_GOLD, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_MALCOM_GOLD, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_MALCOM_GOLD, "Malcom ist vor ein paar Tagen am Strand vor Khorinis gestrandet und hat dabei seinen Geldbeutel verloren. Dieser wird von einem Waran bewacht.");
};

INSTANCE Info_Mod_Malcom_NW_WarumKhorinis (C_INFO)
{
	npc		= Mod_963_PIR_Malcom_NW;
	nr		= 1;
	condition	= Info_Mod_Malcom_NW_WarumKhorinis_Condition;
	information	= Info_Mod_Malcom_NW_WarumKhorinis_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was hast du in Khorinis zu schaffen?";
};

FUNC INT Info_Mod_Malcom_NW_WarumKhorinis_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Malcom_NW_WarumKhorinis_Info()
{
	AI_Output(hero, self, "Info_Mod_Malcom_NW_WarumKhorinis_15_00"); //Was hast du in Khorinis zu schaffen?
	AI_Output(self, hero, "Info_Mod_Malcom_NW_WarumKhorinis_30_01"); //Geschäfte - aber nichts, was dich zu interessieren braucht.
};

INSTANCE Info_Mod_Malcom_NW_Boot (C_INFO)
{
	npc		= Mod_963_PIR_Malcom_NW;
	nr		= 1;
	condition	= Info_Mod_Malcom_NW_Boot_Condition;
	information	= Info_Mod_Malcom_NW_Boot_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wieso machst du dein Boot nicht mehr flott?";
};

FUNC INT Info_Mod_Malcom_NW_Boot_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Malcom_NW_Boot_Info()
{
	AI_Output(hero, self, "Info_Mod_Malcom_NW_Boot_15_00"); //Wieso machst du dein Boot nicht mehr flott?
	AI_Output(self, hero, "Info_Mod_Malcom_NW_Boot_30_01"); //Bei meiner einbrüstigen Amme, das ist nicht mehr zu retten! Aber meinen Geldbeutel hätte ich gern wieder, sonst brauch ich mich in meinem Lager nicht mehr blicken zu lassen.
};

INSTANCE Info_Mod_Malcom_NW_BeutelProblem (C_INFO)
{
	npc		= Mod_963_PIR_Malcom_NW;
	nr		= 1;
	condition	= Info_Mod_Malcom_NW_BeutelProblem_Condition;
	information	= Info_Mod_Malcom_NW_BeutelProblem_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was ist das Problem mit deinem Beutel?";
};

FUNC INT Info_Mod_Malcom_NW_BeutelProblem_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Malcom_NW_Boot)) {
		return 1;
	};
};

FUNC VOID Info_Mod_Malcom_NW_BeutelProblem_Info()
{
	AI_Output(hero, self, "Info_Mod_Malcom_NW_BeutelProblem_15_00"); //Was ist das Problem mit deinem Beutel?
	AI_Output(self, hero, "Info_Mod_Malcom_NW_BeutelProblem_30_01"); //Der lag irgendwo im Boot, als es mich erwischt hat, also wurde er wahrscheinlich mit an den Strand gespült.
	AI_Output(self, hero, "Info_Mod_Malcom_NW_BeutelProblem_30_02"); //Aber da sitzt ein fetter Waran, und so ganz ohne Eisen zwischen den Fingern werd ihn den sicher nicht bitten, sich zu verpissen.
	AI_Output(self, hero, "Info_Mod_Malcom_NW_BeutelProblem_30_03"); //Ich kann dir zwar nichts anbieten, weil ich nichts hab, aber wenn du mir den Beutel bringst, schau ich mal, ob ich mich später noch erkenntlich zeigen kann.

	Log_CreateTopic	(TOPIC_MOD_MALCOM_GOLD, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_MALCOM_GOLD, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_MALCOM_GOLD, "Malcom ist vor ein paar Tagen am Strand vor Khorinis gestrandet und hat dabei seinen Geldbeutel verloren. Dieser wird von einem Waran bewacht.");
};

INSTANCE Info_Mod_Malcom_NW_Piratenlager (C_INFO)
{
	npc		= Mod_963_PIR_Malcom_NW;
	nr		= 1;
	condition	= Info_Mod_Malcom_NW_Piratenlager_Condition;
	information	= Info_Mod_Malcom_NW_Piratenlager_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ihr Piraten habt sogar ein Lager?";
};

FUNC INT Info_Mod_Malcom_NW_Piratenlager_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Malcom_NW_Boot)) {
		return 1;
	};
};

FUNC VOID Info_Mod_Malcom_NW_Piratenlager_Info()
{
	AI_Output(hero, self, "Info_Mod_Malcom_NW_Piratenlager_15_00"); //Ihr Piraten habt sogar ein Lager?
	AI_Output(self, hero, "Info_Mod_Malcom_NW_Piratenlager_30_01"); //Willst wohl auch mitmachen, oder warum so neugierig? Aber ich werd dir nichts erzählen. Wer zu den Piraten will, findet sie früher oder später allein.
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
	if (Npc_KnowsInfo(hero, Info_Mod_Malcom_NW_BeutelProblem))
	&& (Npc_HasItems(hero, ItMi_Malcom_Beutel) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Malcom_NW_Beutel_Info()
{
	AI_Output(hero, self, "Info_Mod_Malcom_NW_Beutel_15_00"); //Ich hab deinen Beutel.
	
	B_GiveInvItems	(hero, self, ItMi_Malcom_Beutel, 1);

	AI_Output(self, hero, "Info_Mod_Malcom_NW_Beutel_30_01"); //Vielen Dank, jetzt muss ich nur noch einen Weg zurück zum Lager finden. Ich hoffe, hier schaut bald mal einer von meinen Kumpels vorbei.

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