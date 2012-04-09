INSTANCE Info_Mod_HofstaatJaeger_Hi (C_INFO)
{
	npc		= Mod_7289_HS_Jaeger_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatJaeger_Hi_Condition;
	information	= Info_Mod_HofstaatJaeger_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bist du der Jäger?";
};

FUNC INT Info_Mod_HofstaatJaeger_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HofstaatBarde_Sporen))
	&& ((!Npc_KnowsInfo(hero, Info_Mod_Namib_Sporen))
	|| (Npc_KnowsInfo(hero, Info_Mod_Namib_Motivation)))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatJaeger_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_HofstaatJaeger_Hi_15_00"); //Bist du der Jäger?
	AI_Output(self, hero, "Info_Mod_HofstaatJaeger_Hi_09_01"); //Na, seh ich denn so aus?
	AI_Output(hero, self, "Info_Mod_HofstaatJaeger_Hi_15_02"); //Naja ... du bist jedenfalls kein konventioneller Jäger ...
	AI_Output(self, hero, "Info_Mod_HofstaatJaeger_Hi_09_03"); //AAAAAHA! Hab ich dich ertappt! Du arbeitest für die Konvention!
	AI_Output(hero, self, "Info_Mod_HofstaatJaeger_Hi_15_04"); //Die Konvention? Was ist das?
	AI_Output(self, hero, "Info_Mod_HofstaatJaeger_Hi_09_05"); //Das wollte ich dich gerade fragen, schließlich arbeitest du für sie ...
	AI_Output(hero, self, "Info_Mod_HofstaatJaeger_Hi_15_06"); //Bist du jetzt der Jäger oder nicht?
	AI_Output(self, hero, "Info_Mod_HofstaatJaeger_Hi_09_07"); //Ach, weißt du, wenn du es dir ganz, ganz doll vorstellst und fest daran glaubst, dann kannst du AAAAAAAALLLES sein was du willst.
	AI_Output(hero, self, "Info_Mod_HofstaatJaeger_Hi_15_08"); //Wirklich Alles? Dann sag mir endlich ob du der Jäger bist oder nicht!
	AI_Output(self, hero, "Info_Mod_HofstaatJaeger_Hi_09_09"); //Achsoooo du suchst den Jäger? Der is’ im Moment nicht da.
	AI_Output(hero, self, "Info_Mod_HofstaatJaeger_Hi_15_10"); //Nicht da?
	AI_Output(self, hero, "Info_Mod_HofstaatJaeger_Hi_09_11"); //Jop.
	AI_Output(hero, self, "Info_Mod_HofstaatJaeger_Hi_15_12"); //Und wo ist er?
	AI_Output(self, hero, "Info_Mod_HofstaatJaeger_Hi_09_13"); //Urlaub.
	AI_Output(hero, self, "Info_Mod_HofstaatJaeger_Hi_15_14"); //Wann kommt er wieder?
	AI_Output(self, hero, "Info_Mod_HofstaatJaeger_Hi_09_15"); //Garnicht.
	AI_Output(hero, self, "Info_Mod_HofstaatJaeger_Hi_15_16"); //Garnicht?
	AI_Output(self, hero, "Info_Mod_HofstaatJaeger_Hi_09_17"); //Jop.
	AI_Output(hero, self, "Info_Mod_HofstaatJaeger_Hi_15_18"); //...
	AI_Output(self, hero, "Info_Mod_HofstaatJaeger_Hi_09_19"); //(summt vor sich hin)
	AI_Output(hero, self, "Info_Mod_HofstaatJaeger_Hi_15_20"); //Was soll das heißen?
	AI_Output(self, hero, "Info_Mod_HofstaatJaeger_Hi_09_21"); //Er hat unbefristeten Urlaub.
	AI_Output(hero, self, "Info_Mod_HofstaatJaeger_Hi_15_22"); //Dann wurde er entlassen?
	AI_Output(self, hero, "Info_Mod_HofstaatJaeger_Hi_09_23"); //Wenn er entlassen wurde, könnte er kaum Urlaub haben.
	AI_Output(hero, self, "Info_Mod_HofstaatJaeger_Hi_15_24"); //Ach vergiss es.
	AI_Output(self, hero, "Info_Mod_HofstaatJaeger_Hi_09_25"); //Okay. Ach ja, solltest du den Jäger treffen richte ihm folgendes von mir aus: „Bananarama“
	AI_Output(hero, self, "Info_Mod_HofstaatJaeger_Hi_15_26"); //Bananarama?
	AI_Output(self, hero, "Info_Mod_HofstaatJaeger_Hi_09_27"); //Wer hat dir das gesagt?
	AI_Output(hero, self, "Info_Mod_HofstaatJaeger_Hi_15_28"); //Du?
	AI_Output(self, hero, "Info_Mod_HofstaatJaeger_Hi_09_29"); //Wieso sollte ich dir das Codewort gesagt haben?
	AI_Output(hero, self, "Info_Mod_HofstaatJaeger_Hi_15_30"); //Na damit ich es dem Jäger ausrichte.
	AI_Output(self, hero, "Info_Mod_HofstaatJaeger_Hi_09_31"); //Hallo.
	AI_Output(hero, self, "Info_Mod_HofstaatJaeger_Hi_15_32"); //WAS IST EIGENTLICH LOS MIT DIR?
	AI_Output(self, hero, "Info_Mod_HofstaatJaeger_Hi_09_33"); //Stress mich nicht so, ich habe Urlaub!
	AI_Output(hero, self, "Info_Mod_HofstaatJaeger_Hi_15_34"); //Du hast Urlau ... lass mich raten. Du bist der Jäger?
	AI_Output(self, hero, "Info_Mod_HofstaatJaeger_Hi_09_35"); //WOHER WEIßT DU DAS??!!
	AI_Output(hero, self, "Info_Mod_HofstaatJaeger_Hi_15_36"); //Lass den Scheiß. Der König schickt mich.
	AI_Output(self, hero, "Info_Mod_HofstaatJaeger_Hi_09_37"); //Der König?! Was will er?
	AI_Output(hero, self, "Info_Mod_HofstaatJaeger_Hi_15_38"); //Du sollst mir den Weg zum Drogenminister zeigen.
	AI_Output(self, hero, "Info_Mod_HofstaatJaeger_Hi_09_39"); //Achso ... na, dann komm mal mit.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "DROGENMINISTER");

	if (Npc_KnowsInfo(hero, Info_Mod_Namib_Motivation))
	{
		B_LogEntry	(TOPIC_MOD_SEKTE_ENTSCHEIDUNG, "Ich habe den Jäger aufgesucht und er wird mich jetzt zum Drogenminister führen.");
	}
	else
	{
		B_LogEntry	(TOPIC_MOD_SEKTE_ENTSCHEIDUNG, "Ich habe mich für den Hofstaat entschieden und den Jäger aufgesucht. Dieser führt mich jetzt zum Drogenminister.");
	};
};

INSTANCE Info_Mod_HofstaatJaeger_Drogenminister (C_INFO)
{
	npc		= Mod_7289_HS_Jaeger_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatJaeger_Drogenminister_Condition;
	information	= Info_Mod_HofstaatJaeger_Drogenminister_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatJaeger_Drogenminister_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HofstaatJaeger_Hi))
	&& (Npc_GetDistToWP(self, "REL_301") < 300)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatJaeger_Drogenminister_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatJaeger_Drogenminister_09_00"); //Wir sind da!
	AI_Output(hero, self, "Info_Mod_HofstaatJaeger_Drogenminister_15_01"); //Dort oben wohnt also der Drogenminister?
	AI_Output(self, hero, "Info_Mod_HofstaatJaeger_Drogenminister_09_02"); //Ja.
	AI_Output(hero, self, "Info_Mod_HofstaatJaeger_Drogenminister_15_03"); //Und wie komm ich da rüber?
	AI_Output(self, hero, "Info_Mod_HofstaatJaeger_Drogenminister_09_04"); //Achso du willst auf die andre Seite?
	AI_Output(self, hero, "Info_Mod_HofstaatJaeger_Drogenminister_09_05"); //Dann kannst du entweder versuchen über Das Seil dorthin zu kommen und dir dein Genick brechen, oder du gehst zum Gleichgewichtsminister und lässt dich rüberführen.
	AI_Output(hero, self, "Info_Mod_HofstaatJaeger_Drogenminister_15_06"); //(genervt) Und wo finde ich den Gleichgewichtsminister?
	AI_Output(self, hero, "Info_Mod_HofstaatJaeger_Drogenminister_09_07"); //Ich bring dich hin.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "GLEICHGEWICHTSMINISTER");

	B_LogEntry	(TOPIC_MOD_SEKTE_ENTSCHEIDUNG, "Der Drogenminister lebt auf dem Gipfel bei der Festung. Von diesem Hügel aus führt nur ein Seil zu ihm, doch da drüber zu laufen wäre der sichere Tod. Der Jäger bringt mich nun zum Gleichgewichtsminister, welcher mich rüberführen sollte.");
};

INSTANCE Info_Mod_HofstaatJaeger_Pickpocket (C_INFO)
{
	npc		= Mod_7289_HS_Jaeger_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatJaeger_Pickpocket_Condition;
	information	= Info_Mod_HofstaatJaeger_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_HofstaatJaeger_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 100);
};

FUNC VOID Info_Mod_HofstaatJaeger_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_HofstaatJaeger_Pickpocket);

	Info_AddChoice	(Info_Mod_HofstaatJaeger_Pickpocket, DIALOG_BACK, Info_Mod_HofstaatJaeger_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_HofstaatJaeger_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_HofstaatJaeger_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_HofstaatJaeger_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_HofstaatJaeger_Pickpocket);
};

FUNC VOID Info_Mod_HofstaatJaeger_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_HofstaatJaeger_Pickpocket);
};

INSTANCE Info_Mod_HofstaatJaeger_EXIT (C_INFO)
{
	npc		= Mod_7289_HS_Jaeger_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatJaeger_EXIT_Condition;
	information	= Info_Mod_HofstaatJaeger_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_HofstaatJaeger_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_HofstaatJaeger_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};