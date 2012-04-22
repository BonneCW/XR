INSTANCE Info_Mod_Alvares_Hi (C_INFO)
{
	npc		= Mod_200_NONE_Alvares_NW;
	nr		= 1;
	condition	= Info_Mod_Alvares_Hi_Condition;
	information	= Info_Mod_Alvares_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Alvares_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Alvares_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Alvares_Hi_11_01"); //Ich bin Alvares.
};

INSTANCE Info_Mod_Alvares_Knast (C_INFO)
{
	npc		= Mod_200_NONE_Alvares_NW;
	nr		= 1;
	condition	= Info_Mod_Alvares_Knast_Condition;
	information	= Info_Mod_Alvares_Knast_Info;
	permanent	= 0;
	important	= 0;
	description	= "Warum bist du im Gefängnis?";
};

FUNC INT Info_Mod_Alvares_Knast_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alvares_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alvares_Knast_Info()
{
	AI_Output(hero, self, "Info_Mod_Alvares_Knast_15_00"); //Warum bist du im Gefängnis?
	AI_Output(self, hero, "Info_Mod_Alvares_Knast_11_01"); //Ich hab mich mit einer Miliz rumgeschlagen. Daraufhin haben sie mich hier eingesperrt.
};

INSTANCE Info_Mod_Alvares_Soeldner (C_INFO)
{
	npc		= Mod_200_NONE_Alvares_NW;
	nr		= 1;
	condition	= Info_Mod_Alvares_Soeldner_Condition;
	information	= Info_Mod_Alvares_Soeldner_Info;
	permanent	= 0;
	important	= 0;
	description	= "Willst du dich den Söldnern anschließen?";
};

FUNC INT Info_Mod_Alvares_Soeldner_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alvares_Knast))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alvares_Soeldner_Info()
{
	AI_Output(hero, self, "Info_Mod_Alvares_Soeldner_15_00"); //Willst du dich den Söldnern anschließen?
	AI_Output(self, hero, "Info_Mod_Alvares_Soeldner_11_01"); //Mit dem Gedanken hab ich schon mal gespielt, aber wenn ich hier im Knast sitze kann ich mich ihnen wohl kaum anschließen.
	AI_Output(hero, self, "Info_Mod_Alvares_Soeldner_15_02"); //Ich könnte dich befreien.
	AI_Output(self, hero, "Info_Mod_Alvares_Soeldner_11_03"); //Das wäre sehr gut.

	B_LogEntry	(TOPIC_MOD_TORLOF_NEUERANWÄRTER, "Alvares würde sich den Söldnern anschließen wenn ich ihn aus dem Gefängnis befreien würde.");
};

INSTANCE Info_Mod_Alvares_Frei (C_INFO)
{
	npc		= Mod_200_NONE_Alvares_NW;
	nr		= 1;
	condition	= Info_Mod_Alvares_Frei_Condition;
	information	= Info_Mod_Alvares_Frei_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du bist jetzt frei.";
};

FUNC INT Info_Mod_Alvares_Frei_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_AlvaresGeld))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alvares_Frei_Info()
{
	AI_Output(hero, self, "Info_Mod_Alvares_Frei_15_00"); //Du bist jetzt frei.
	AI_Output(self, hero, "Info_Mod_Alvares_Frei_11_01"); //Dann kann ich jetzt zu den Söldner gehen?
	AI_Output(hero, self, "Info_Mod_Alvares_Frei_15_02"); //Ja, ich werde dich hinbringen.

	B_StartOtherRoutine	(self, "FOLLOWTOHOF");

	B_LogEntry	(TOPIC_MOD_TORLOF_NEUERANWÄRTER, "Ich werde Alvares jetzt zum Hof begleiten.");
};

INSTANCE Info_Mod_Alvares_Hof (C_INFO)
{
	npc		= Mod_200_NONE_Alvares_NW;
	nr		= 1;
	condition	= Info_Mod_Alvares_Hof_Condition;
	information	= Info_Mod_Alvares_Hof_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alvares_Hof_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alvares_Frei))
	&& (Npc_GetDistToWP(self, "NW_BIGFARM_PATH_03") < 2000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alvares_Hof_Info()
{
	AI_Output(self, hero, "Info_Mod_Alvares_Hof_11_00"); //Ah, das sind also die Söldner?
	AI_Output(hero, self, "Info_Mod_Alvares_Hof_15_01"); //Ja, das sind sie.
	AI_Output(self, hero, "Info_Mod_Alvares_Hof_11_02"); //Danke das du mich hergebracht hast.

	B_LogEntry	(TOPIC_MOD_TORLOF_NEUERANWÄRTER, "Ich habe Alvares jetzt zum Hof gebracht. Jetzt muss ich nur noch mit Torlof sprechen.");

	Npc_ExchangeRoutine	(self, "ATHOF");

	B_Göttergefallen(2, 1);
};

INSTANCE Info_Mod_Alvares_Pickpocket (C_INFO)
{
	npc		= Mod_200_NONE_Alvares_NW;
	nr		= 1;
	condition	= Info_Mod_Alvares_Pickpocket_Condition;
	information	= Info_Mod_Alvares_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_20;
};

FUNC INT Info_Mod_Alvares_Pickpocket_Condition()
{
	C_Beklauen	(20, ItMi_Gold, 50);
};

FUNC VOID Info_Mod_Alvares_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Alvares_Pickpocket);

	Info_AddChoice	(Info_Mod_Alvares_Pickpocket, DIALOG_BACK, Info_Mod_Alvares_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Alvares_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Alvares_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Alvares_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Alvares_Pickpocket);
};

FUNC VOID Info_Mod_Alvares_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Alvares_Pickpocket);
};

INSTANCE Info_Mod_Alvares_EXIT (C_INFO)
{
	npc		= Mod_200_NONE_Alvares_NW;
	nr		= 1;
	condition	= Info_Mod_Alvares_EXIT_Condition;
	information	= Info_Mod_Alvares_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Alvares_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Alvares_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};