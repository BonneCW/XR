INSTANCE Info_Mod_Matt_Hi (C_INFO)
{
	npc		= Mod_936_PIR_Matt_AW;
	nr		= 1;
	condition	= Info_Mod_Matt_Hi_Condition;
	information	= Info_Mod_Matt_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Matt_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Matt_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Matt_Hi_10_01"); //Ich bin Matt.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Matt_Befreiung (C_INFO)
{
	npc		= Mod_936_PIR_Matt_AW;
	nr		= 1;
	condition	= Info_Mod_Matt_Befreiung_Condition;
	information	= Info_Mod_Matt_Befreiung_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Matt_Befreiung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matt_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Greg_Befreiung2))
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matt_Befreiung_Info()
{
	AI_Output(self, hero, "Info_Mod_Matt_Befreiung_10_00"); //Was willst du?
	AI_Output(hero, self, "Info_Mod_Matt_Befreiung_15_01"); //Ich soll euch Jungs aushelfen, hat Greg gesagt.
	AI_Output(self, hero, "Info_Mod_Matt_Befreiung_10_02"); //Dann hab' ich was zu tun für dich.
	AI_Output(hero, self, "Info_Mod_Matt_Befreiung_15_03"); //Um was geht's?
	AI_Output(self, hero, "Info_Mod_Matt_Befreiung_10_04"); //Ich habe letztens diese Insel da vorne im Meer erkundet. Auf einmal kamen ein paar Lurker, die mich als Mittagsmenü haben wollten.
	AI_Output(self, hero, "Info_Mod_Matt_Befreiung_10_05"); //Dann bin ich ins Wasser gesprungen und Richtung Strand getaucht und habe dabei drei Säcke voller Gold verloren, die nun auf dem Meeresgrund liegen.
	AI_Output(self, hero, "Info_Mod_Matt_Befreiung_10_06"); //Ich will, dass du mir diese wieder besorgst.
	AI_Output(hero, self, "Info_Mod_Matt_Befreiung_15_07"); //Von mir aus, ich geh dann mal.
	AI_Output(self, hero, "Info_Mod_Matt_Befreiung_10_08"); //Viel Spass.

	Log_CreateTopic	(TOPIC_MOD_BEL_PIRMATT, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_BEL_PIRMATT, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_BEL_PIRMATT, "Der Pirat Matt hat seine drei Goldsäcke im Meer verloren. Ich soll sie ihm wiederbringen.");

	Wld_InsertItem	(ItMi_MattsGoldsack, "FP_ITEM_GOLDSACK_MATT_01");
	Wld_InsertItem	(ItMi_MattsGoldsack, "FP_ITEM_GOLDSACK_MATT_02");
	Wld_InsertItem	(ItMi_MattsGoldsack, "FP_ITEM_GOLDSACK_MATT_03");
};

INSTANCE Info_Mod_Matt_Befreiung2 (C_INFO)
{
	npc		= Mod_936_PIR_Matt_AW;
	nr		= 1;
	condition	= Info_Mod_Matt_Befreiung2_Condition;
	information	= Info_Mod_Matt_Befreiung2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe dein Gold gefunden.";
};

FUNC INT Info_Mod_Matt_Befreiung2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matt_Befreiung))
	&& (Npc_HasItems(hero, ItMi_MattsGoldsack) == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Matt_Befreiung2_Info()
{
	AI_Output(hero, self, "Info_Mod_Matt_Befreiung2_15_00"); //Ich habe dein Gold gefunden.

	B_GiveInvItems	(hero, self, ItMi_MattsGoldsack, 3);

	AI_Output(self, hero, "Info_Mod_Matt_Befreiung2_10_01"); //Ich danke dir. Hier nimm das als Belohnung.

	B_GiveInvItems	(self, hero, ItPo_Perm_Health, 1);

	AI_Output(hero, self, "Info_Mod_Matt_Befreiung2_15_02"); //Danke, den Trank kann ich sicher gut gebrauchen.
	AI_Output(self, hero, "Info_Mod_Matt_Befreiung2_10_03"); //Das hoffe ich doch.

	Mod_Piratenbefreiung += 1;

	B_GivePlayerXP	(300);

	B_LogEntry_More	(TOPIC_MOD_BEL_PIRMATT, TOPIC_MOD_BEL_PIRATENLAGER, "Matt hat seine Goldsäcke wieder. Sein Lohn für mich war ein Elixier des Lebens.", "Matt habe ich nun geholfen.");
	B_SetTopicStatus	(TOPIC_MOD_BEL_PIRMATT, LOG_SUCCESS);
};

INSTANCE Info_Mod_Matt_Pickpocket (C_INFO)
{
	npc		= Mod_936_PIR_Matt_AW;
	nr		= 1;
	condition	= Info_Mod_Matt_Pickpocket_Condition;
	information	= Info_Mod_Matt_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Matt_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Matt_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Matt_Pickpocket);

	Info_AddChoice	(Info_Mod_Matt_Pickpocket, DIALOG_BACK, Info_Mod_Matt_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Matt_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Matt_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Matt_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Matt_Pickpocket);
};

FUNC VOID Info_Mod_Matt_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Matt_Pickpocket);
};

INSTANCE Info_Mod_Matt_EXIT (C_INFO)
{
	npc		= Mod_936_PIR_Matt_AW;
	nr		= 1;
	condition	= Info_Mod_Matt_EXIT_Condition;
	information	= Info_Mod_Matt_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Matt_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Matt_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};