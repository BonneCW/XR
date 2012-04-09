INSTANCE Info_Mod_Bruce_KesselProblem (C_INFO)
{
	npc		= Mod_1289_SLD_Bruce_MT;
	nr		= 1;
	condition	= Info_Mod_Bruce_KesselProblem_Condition;
	information	= Info_Mod_Bruce_KesselProblem_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Bruce_KesselProblem_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lee_KesselProblem))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bruce_KesselProblem_Info()
{
	AI_Output(self, hero, "Info_Mod_Bruce_KesselProblem_06_00"); //(zu sich selbst, lalend) Hähä, das habe ich fantastisch hinbekommen.
	AI_Output(hero, self, "Info_Mod_Bruce_KesselProblem_15_01"); //(räuspert sich)
	AI_Output(self, hero, "Info_Mod_Bruce_KesselProblem_06_02"); //(überrascht)Hmm, hä ...? Hey, was bist du denn für einer?
	AI_Output(hero, self, "Info_Mod_Bruce_KesselProblem_15_03"); //Ich schau mich hier nur mal um.
	AI_Output(self, hero, "Info_Mod_Bruce_KesselProblem_06_04"); //Ja, tu das meinetwegen. Aber mach keinen Ärger. Sonst zieh ich dir das Fell über die Ohren.
	AI_Output(self, hero, "Info_Mod_Bruce_KesselProblem_06_05"); //So wie ... genau, so wie dem Schattenläufer, den ich vor kurzem in den Bergen erledigt habe. Siehst du. Echtes Schattenläuferfell.
	AI_Output(self, hero, "Info_Mod_Bruce_KesselProblem_06_06"); //Das Biest ... ähh, hat einen Schürfer gefressen, hähä. Aber ich war eben einfach zu gerissen.
	AI_Output(self, hero, "Info_Mod_Bruce_KesselProblem_06_07"); //So hat jeder bekommen, was er verdient hat. (lacht dreckig)

	B_LogEntry	(TOPIC_MOD_NL_TALKESSELPROB, "Am Eingang zum Talkessel habe ich Söldner Bruce angetroffen. Er scheint ziemlich betrunken zu sein und hat selbstgefällig mit dem Fell des Schattenläufers geprahlt, welcher den Schürfer gefressen haben soll. Er schien sehrt amüsiert.");
};

INSTANCE Info_Mod_Bruce_KesselProblem2 (C_INFO)
{
	npc		= Mod_1289_SLD_Bruce_MT;
	nr		= 1;
	condition	= Info_Mod_Bruce_KesselProblem2_Condition;
	information	= Info_Mod_Bruce_KesselProblem2_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Bruce_KesselProblem2_Condition()
{
	if (Wld_IsTime(20,00,24,00))
	&& (Mod_NL_TalkesselProblem >= 1)
	&& (Npc_IsInState(self, ZS_Talk))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Fester_KesselProblem))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bruce_KesselProblem2_Info()
{
	AI_Output(self, hero, "Info_Mod_Bruce_KesselProblem2_06_00"); //Hey, verpiss dich einfach.
};

INSTANCE Info_Mod_Bruce_KesselProblem3 (C_INFO)
{
	npc		= Mod_1289_SLD_Bruce_MT;
	nr		= 1;
	condition	= Info_Mod_Bruce_KesselProblem3_Condition;
	information	= Info_Mod_Bruce_KesselProblem3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du hast da glaube ich paar Sachen, die sich eigentlich nicht in deinem Besitz befinden dürften.";
};

FUNC INT Info_Mod_Bruce_KesselProblem3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fester_KesselProblem))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Bruce_KesselProblem3_Info()
{
	AI_Output(hero, self, "Info_Mod_Bruce_KesselProblem3_15_00"); //Du hast da glaube ich paar Sachen, die sich eigentlich nicht in deinem Besitz befinden dürften.
	AI_Output(self, hero, "Info_Mod_Bruce_KesselProblem3_06_01"); //(verdutzt) Wie, was sagst du da?
	AI_Output(hero, self, "Info_Mod_Bruce_KesselProblem3_15_02"); //Nun, ich meine zum Beispiel das Sumpfkraut und das ...
	AI_Output(self, hero, "Info_Mod_Bruce_KesselProblem3_06_03"); //Du hast dich gerade mit dem falschen angelegt!!!

	CreateInvItems	(self, ItWr_KesselProblem, 1);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_GuildEnemy, 0);
};

INSTANCE Info_Mod_Bruce_Pickpocket (C_INFO)
{
	npc		= Mod_1289_SLD_Bruce_MT;
	nr		= 1;
	condition	= Info_Mod_Bruce_Pickpocket_Condition;
	information	= Info_Mod_Bruce_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Bruce_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Bruce_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Bruce_Pickpocket);

	Info_AddChoice	(Info_Mod_Bruce_Pickpocket, DIALOG_BACK, Info_Mod_Bruce_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Bruce_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Bruce_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Bruce_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Bruce_Pickpocket);
};

FUNC VOID Info_Mod_Bruce_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Bruce_Pickpocket);
};

INSTANCE Info_Mod_Bruce_EXIT (C_INFO)
{
	npc		= Mod_1289_SLD_Bruce_MT;
	nr		= 1;
	condition	= Info_Mod_Bruce_EXIT_Condition;
	information	= Info_Mod_Bruce_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Bruce_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Bruce_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};