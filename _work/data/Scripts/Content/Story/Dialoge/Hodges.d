INSTANCE Info_Mod_Hodges_Unheil (C_INFO)
{
	npc		= Mod_786_BAU_Hodges_NW;
	nr		= 1;
	condition	= Info_Mod_Hodges_Unheil_Condition;
	information	= Info_Mod_Hodges_Unheil_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ist in letzter Zeit etwas Ungewöhnliches geschehen?";
};

FUNC INT Info_Mod_Hodges_Unheil_Condition()
{
	if (Mod_WM_Boeden == 14)
	|| (Mod_WM_Boeden == 13)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Hodges_Unheil_Info()
{
	AI_Output(hero, self, "Info_Mod_Hodges_Unheil_15_00"); //Ist in letzter Zeit etwas Ungewöhnliches geschehen?
	AI_Output(self, hero, "Info_Mod_Hodges_Unheil_03_01"); //Nun ja, z.B. die ganzen Ungeheuer, die sich hier auf den Höfen breit gemacht haben. Das ist schon etwas ungewöhnlich, würde ich sagen. Warum fragst du?

	Info_ClearChoices	(Info_Mod_Hodges_Unheil);

	if (Mod_WM_Hexeninfos > 1)
	{
		Info_AddChoice	(Info_Mod_Hodges_Unheil, "Ich bin auf der Suche nach Hexen.", Info_Mod_Hodges_Unheil_B);
	};
	Info_AddChoice	(Info_Mod_Hodges_Unheil, "Nur so.", Info_Mod_Hodges_Unheil_A);
};

FUNC VOID Info_Mod_Hodges_Unheil_B()
{
	AI_Output(hero, self, "Info_Mod_Hodges_Unheil_B_15_00"); //Ich bin auf der Suche nach Hexen.
	AI_Output(self, hero, "Info_Mod_Hodges_Unheil_B_03_01"); //Was Hexen?! Und da fragst du noch?
	AI_Output(hero, self, "Info_Mod_Hodges_Unheil_B_15_02"); //Ja, weißt du etwas?
	AI_Output(self, hero, "Info_Mod_Hodges_Unheil_B_03_03"); //Ja, nicht weit hinter der Krypta in einer Höhle. Da hast du deine Hexe. Sagitta nennt sie sich.
	AI_Output(self, hero, "Info_Mod_Hodges_Unheil_B_03_04"); //Die war mir noch nie geheuer. Sitzt alleine in der Einöde und macht bestimmt ihre finsteren Rituale.
	AI_Output(self, hero, "Info_Mod_Hodges_Unheil_B_03_05"); //Verscheuchen sollte man sie. Dann würde bestimmt alles besser.

	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Hodges äußerte die Überzeugung, dass Sagitta eine Hexe sei.");

	Mod_HinweiseDerBauernZuHexen += 1;

	Info_ClearChoices	(Info_Mod_Hodges_Unheil);
};

FUNC VOID Info_Mod_Hodges_Unheil_A()
{
	AI_Output(hero, self, "Info_Mod_Hodges_Unheil_A_15_00"); //Nur so.

	Info_ClearChoices	(Info_Mod_Hodges_Unheil);
};

INSTANCE Info_Mod_Hodges_Pickpocket (C_INFO)
{
	npc		= Mod_786_BAU_Hodges_NW;
	nr		= 1;
	condition	= Info_Mod_Hodges_Pickpocket_Condition;
	information	= Info_Mod_Hodges_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_20;
};

FUNC INT Info_Mod_Hodges_Pickpocket_Condition()
{
	C_Beklauen	(16, ItMi_Gold, 20);
};

FUNC VOID Info_Mod_Hodges_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Hodges_Pickpocket);

	Info_AddChoice	(Info_Mod_Hodges_Pickpocket, DIALOG_BACK, Info_Mod_Hodges_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Hodges_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Hodges_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Hodges_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Hodges_Pickpocket);
};

FUNC VOID Info_Mod_Hodges_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Hodges_Pickpocket);
};

INSTANCE Info_Mod_Hodges_EXIT (C_INFO)
{
	npc		= Mod_786_BAU_Hodges_NW;
	nr		= 1;
	condition	= Info_Mod_Hodges_EXIT_Condition;
	information	= Info_Mod_Hodges_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Hodges_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Hodges_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};