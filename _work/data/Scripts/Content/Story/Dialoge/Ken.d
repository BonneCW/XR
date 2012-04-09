INSTANCE Info_Mod_Ken_Eisgebiet (C_INFO)
{
	npc		= Mod_1627_VMG_Ken_MT;
	nr		= 1;
	condition	= Info_Mod_Ken_Eisgebiet_Condition;
	information	= Info_Mod_Ken_Eisgebiet_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ken_Eisgebiet_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ferco_Crazy))
	&& (VMG_Second == 2)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ken_Eisgebiet_Info()
{
	AI_Output(self, hero, "Info_Mod_Ken_Eisgebiet_03_00"); //Ich habe gehört, dass du dich um Einlass bemühst. Du suchst nach Gelato, habe ich Recht?
	AI_Output(hero, self, "Info_Mod_Ken_Eisgebiet_15_01"); //Stimmt. Ferco meinte, du weißt wo es liegt.
	AI_Output(self, hero, "Info_Mod_Ken_Eisgebiet_03_02"); //Ich weiß zwar, wo es liegt, aber das hilft dir nicht weiter, wenn du nicht weißt, wie man dorthin gelangt.
	AI_Output(self, hero, "Info_Mod_Ken_Eisgebiet_03_03"); //Es existiert ein Teleportzauber dahin, aber er ist schwierig zu finden.
	AI_Output(hero, self, "Info_Mod_Ken_Eisgebiet_15_04"); //Wo finde ich diesen Zauber?
	AI_Output(self, hero, "Info_Mod_Ken_Eisgebiet_03_05"); //Im Sumpf. Du wirst schon erwartet. Ich kann dir nicht mehr verraten, aber ein Rat noch: Hüte dich vor dem Eremiten.
	AI_Output(hero, self, "Info_Mod_Ken_Eisgebiet_15_06"); //Danke für die Information. Ich werde mich dort umsehen.

	B_LogEntry	(TOPIC_MOD_FERCO_WANZE, "Ken sagte, ich werde im Sumpf erwartet. Ich sollte mich mal dort umsehen. Außerdem soll ich mich vor dem Eremiten hüten.");

	B_StartOtherRoutine	(Mod_2012_PSINOV_Talas_MT, "ATGATE");

	VMG_Second = 3;
};

INSTANCE Info_Mod_Ken_Pickpocket (C_INFO)
{
	npc		= Mod_1627_VMG_Ken_MT;
	nr		= 1;
	condition	= Info_Mod_Ken_Pickpocket_Condition;
	information	= Info_Mod_Ken_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Ken_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 100);
};

FUNC VOID Info_Mod_Ken_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Ken_Pickpocket);

	Info_AddChoice	(Info_Mod_Ken_Pickpocket, DIALOG_BACK, Info_Mod_Ken_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Ken_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Ken_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Ken_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Ken_Pickpocket);
};

FUNC VOID Info_Mod_Ken_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Ken_Pickpocket);
};

INSTANCE Info_Mod_Ken_EXIT (C_INFO)
{
	npc		= Mod_1627_VMG_Ken_MT;
	nr		= 1;
	condition	= Info_Mod_Ken_EXIT_Condition;
	information	= Info_Mod_Ken_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Ken_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ken_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};