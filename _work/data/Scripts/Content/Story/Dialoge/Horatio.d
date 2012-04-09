INSTANCE Info_Mod_Horatio_Hi (C_INFO)
{
	npc		= Mod_2001_BAU_Horatio_MT;
	nr		= 1;
	condition	= Info_Mod_Horatio_Hi_Condition;
	information	= Info_Mod_Horatio_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Horatio_Hi_Condition()
{
	if (Mod_LeftysBauern >= 3)
	&& (Mod_Lefty_Horatio_Down == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Horatio_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Horatio_Hi_09_00"); //Ich habe dir damals gezeigt, wie du stärker zuschlägst. Und jetzt verprügelst du uns Bauern. Ich bin schwer enttäuscht.
};

INSTANCE Info_Mod_Horatio_DankeProBauern (C_INFO)
{
	npc		= Mod_2001_BAU_Horatio_MT;
	nr		= 1;
	condition	= Info_Mod_Horatio_DankeProBauern_Condition;
	information	= Info_Mod_Horatio_DankeProBauern_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Horatio_DankeProBauern_Condition()
{
	if (Npc_KnowsInfo(hero, Info_ReisBau_2_DankeProBauer))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Horatio_DankeProBauern_Info()
{
	AI_Output(self, hero, "Info_Mod_Horatio_DankeProBauern_09_00"); //Mit dem, was du für uns getan hast, hast du bewiesen, dass du ein wahrer Streiter für das Recht bist.
	AI_Output(self, hero, "Info_Mod_Horatio_DankeProBauern_09_01"); //Es ist nicht viel, was wir dir zum Dank veräußern können, aber wir haben zusammengelegt.

	B_ShowGivenThings	("110 Gold, 19 Erz, 8 Äpfel, 10 Reis und 2 Käse erhalten");

	CreateInvItems	(hero, ItMi_Gold, 110);
	CreateInvItems	(hero, ItMi_Nugget, 19);
	CreateInvItems	(hero, ItFo_Apple, 8);
	CreateInvItems	(hero, ItPl_Riceplant, 10);
	CreateInvItems	(hero, ItFo_Cheese, 2);

	AI_Output(self, hero, "Info_Mod_Horatio_DankeProBauern_09_02"); //Wie du härter zuschlägst hatte ich dir ja bereits gezeigt.
	AI_Output(self, hero, "Info_Mod_Horatio_DankeProBauern_09_03"); //Nun werde ich dir erklären, wie du den Stahl in deiner Hand gewandter führen kannst.
	AI_Output(self, hero, "Info_Mod_Horatio_DankeProBauern_09_04"); //Wenn du einen Hieb startest, solltest du vor allem versuchen möglichst viel Schwung hineinzubringen.
	AI_Output(self, hero, "Info_Mod_Horatio_DankeProBauern_09_05"); //Erst kurz bevor dein Schlag auftrifft, baust du Muskelspannung auf, um dem Schlag auch die entsprechende Härte zu verleihen.

	B_RaiseFightTalent (hero, NPC_TALENT_1H, 2);
	B_RaiseFightTalent (hero, NPC_TALENT_2H, 2);

	AI_PrintScreen	("+2 Ein- und Zweihand", -1, -1, FONT_Screen, 2);

	B_GivePlayerXP	(200);
};

INSTANCE Info_Mod_Horatio_Pickpocket (C_INFO)
{
	npc		= Mod_2001_BAU_Horatio_MT;
	nr		= 1;
	condition	= Info_Mod_Horatio_Pickpocket_Condition;
	information	= Info_Mod_Horatio_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_20;
};

FUNC INT Info_Mod_Horatio_Pickpocket_Condition()
{
	C_Beklauen	(11, ItMi_Gold, 9);
};

FUNC VOID Info_Mod_Horatio_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Horatio_Pickpocket);

	Info_AddChoice	(Info_Mod_Horatio_Pickpocket, DIALOG_BACK, Info_Mod_Horatio_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Horatio_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Horatio_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Horatio_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Horatio_Pickpocket);
};

FUNC VOID Info_Mod_Horatio_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Horatio_Pickpocket);
};

INSTANCE Info_Mod_Horatio_EXIT (C_INFO)
{
	npc		= Mod_2001_BAU_Horatio_MT;
	nr		= 1;
	condition	= Info_Mod_Horatio_EXIT_Condition;
	information	= Info_Mod_Horatio_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Horatio_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Horatio_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};