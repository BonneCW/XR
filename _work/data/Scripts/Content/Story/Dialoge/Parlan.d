INSTANCE Info_Mod_Parlan_Hi (C_INFO)
{
	npc		= Mod_554_KDF_Parlan_NW;
	nr		= 1;
	condition	= Info_Mod_Parlan_Hi_Condition;
	information	= Info_Mod_Parlan_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hi.";
};

FUNC INT Info_Mod_Parlan_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Parlan_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Parlan_Hi_15_00"); //Hi.
	AI_Output(self, hero, "Info_Mod_Parlan_Hi_05_01"); //Sei gegrüßt, Fremder. Was führt dich in unser Kloster?
};

INSTANCE Info_Mod_Parlan_Aufgabe (C_INFO)
{
	npc		= Mod_554_KDF_Parlan_NW;
	nr		= 1;
	condition	= Info_Mod_Parlan_Aufgabe_Condition;
	information	= Info_Mod_Parlan_Aufgabe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kann ich irgendwas für dich tun?";
};

FUNC INT Info_Mod_Parlan_Aufgabe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Parlan_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Pyrokar_Mitglied))
	&& (Mod_Gilde	==	0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Parlan_Aufgabe_Info()
{
	AI_Output(hero, self, "Info_Mod_Parlan_Aufgabe_15_00"); //Kann ich irgendwas für dich tun?
	AI_Output(self, hero, "Info_Mod_Parlan_Aufgabe_05_01"); //Ich brauche momentan keine Hilfe.
	AI_Output(hero, self, "Info_Mod_Parlan_Aufgabe_15_02"); //Ich will ein Novize werden und muss jedem Feuermagier helfen.

	Log_CreateTopic	(TOPIC_MOD_PARLAN_MANA, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_PARLAN_MANA, LOG_RUNNING);
	
	AI_Output(self, hero, "Info_Mod_Parlan_Aufgabe_05_03"); //Ach so ist das. Es reicht mir wenn du deine magische Kraft um 30 erhöhst.

	ParlanBisMana	=	hero.attribute[ATR_MANA_MAX];

	B_LogEntry	(TOPIC_MOD_PARLAN_MANA, "Für Parlan soll ich meine Mana um 30 erhöhen.");
};

INSTANCE Info_Mod_Parlan_Aufgabe_Fertig (C_INFO)
{
	npc		= Mod_554_KDF_Parlan_NW;
	nr		= 1;
	condition	= Info_Mod_Parlan_Aufgabe_Fertig_Condition;
	information	= Info_Mod_Parlan_Aufgabe_Fertig_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe meine MANA erhöht.";
};

FUNC INT Info_Mod_Parlan_Aufgabe_Fertig_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Parlan_Aufgabe))
	&& (hero.attribute[ATR_MANA_MAX] - ParlanBisMana >= 30)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Parlan_Aufgabe_Fertig_Info()
{
	AI_Output(hero, self, "Info_Mod_Parlan_Aufgabe_Fertig_15_00"); //Ich habe meine MANA erhöht.
	AI_Output(self, hero, "Info_Mod_Parlan_Aufgabe_Fertig_05_01"); //Gut, das reicht mir.

	B_GivePlayerXP	(100);

	B_LogEntry_More	(TOPIC_MoD_FEUERMAGIER, TOPIC_MOD_PARLAN_MANA, "Parlan habe ich überzeugt.", "Parlan ist zufrieden mit mir. Ich habe genug für ihn getan.");
	B_SetTopicStatus	(TOPIC_MOD_PARLAN_MANA, LOG_SUCCESS);

	B_Göttergefallen(1, 1);
};

INSTANCE Info_Mod_Parlan_Lehrer (C_INFO)
{
	npc		= Mod_554_KDF_Parlan_NW;
	nr		= 1;
	condition	= Info_Mod_Parlan_Lehrer_Condition;
	information	= Info_Mod_Parlan_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer kann mir beibringen meine magische Kraft zu erhöhen?";
};

FUNC INT Info_Mod_Parlan_Lehrer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Parlan_Hi))
	&& ((Mod_Gilde == 0)
	|| (Mod_Gilde == 6)
	|| (Mod_Gilde == 7))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Parlan_Lehrer_Info()
{
	AI_Output(hero, self, "Info_Mod_Parlan_Lehrer_15_00"); //Wer kann mir beibringen meine magische Kraft zu erhöhen?
	AI_Output(self, hero, "Info_Mod_Parlan_Lehrer_05_01"); //Ich kann dir beibringen deine magische Kraft zu steigern.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_KLOSTER, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_KLOSTER, "Parlan kann mir beibringen meine MANA zu steigern.");
};

INSTANCE Info_Mod_Parlan_Ring (C_INFO)
{
	npc		= Mod_554_KDF_Parlan_NW;
	nr		= 1;
	condition	= Info_Mod_Parlan_Ring_Condition;
	information	= Info_Mod_Parlan_Ring_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Parlan_Ring_Condition()
{
	if (Mod_Gilde	==	1)
	&& (hero.guild	==	GIL_NOV)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Parlan_Ring_Info()
{
	AI_Output(self, hero, "Info_Mod_Parlan_Ring_05_00"); //Du musst mir helfen.
	AI_Output(hero, self, "Info_Mod_Parlan_Ring_15_01"); //Was ist denn passiert?
	AI_Output(self, hero, "Info_Mod_Parlan_Ring_05_02"); //Der Novize Pedro hat mir meinen Feuerring gestohlen und ist aus dem Kloster geflohen.
	AI_Output(self, hero, "Info_Mod_Parlan_Ring_05_03"); //Du musst mir unbedingt den Ring zurückbringen. Am besten fragst du ein paar Leute ob sie ihn gesehen haben.

	Npc_ExchangeRoutine	(Mod_7037_NOV_Pedro_NW,	"FEUERRING");

	Log_CreateTopic	(TOPIC_MOD_PARLAN_FEUERRING, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_PARLAN_FEUERRING, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_PARLAN_FEUERRING, "Der Novize Pedro hat dem Magier Parlan seinen Feuerring gestohlen und ich soll ihm den Ring wiederbeschaffen. Ich soll ein paar Leute fragen wohin er gerannt ist.");
};

INSTANCE Info_Mod_Parlan_Ring_Zurück (C_INFO)
{
	npc		= Mod_554_KDF_Parlan_NW;
	nr		= 1;
	condition	= Info_Mod_Parlan_Ring_Zurück_Condition;
	information	= Info_Mod_Parlan_Ring_Zurück_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab den Ring.";
};

FUNC INT Info_Mod_Parlan_Ring_Zurück_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Pedro_Niederlage))
	&& (Npc_HasItems(hero, ItRi_Feuerring_Parlan)	==	1)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Parlan_Ring_Zurück))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Parlan_Ring_Zurück_Info()
{
	AI_Output(hero, self, "Info_Mod_Parlan_Ring_Zurück_15_00"); //Ich hab den Ring.

	B_GiveInvItems	(hero, self, ItRi_Feuerring_Parlan, 1);

	AI_Output(self, hero, "Info_Mod_Parlan_Ring_Zurück_05_01"); //Vielen Dank. Hier ist deine Belohnung.

	CreateInvItems	(self, ItMi_Gold, 250);
	B_GiveInvItems	(self, hero, ItMi_Gold, 250);

	B_GivePlayerXP	(250);

	B_LogEntry	(TOPIC_MOD_PARLAN_FEUERRING, "Ich hab Parlan seinen Ring gegeben.");
	B_SetTopicStatus	(TOPIC_MOD_PARLAN_FEUERRING, LOG_SUCCESS);

	B_Göttergefallen(1, 1);
};

INSTANCE Info_Mod_Parlan_Lernen (C_INFO)
{
	npc		= Mod_554_KDF_Parlan_NW;
	nr		= 1;
	condition	= Info_Mod_Parlan_Lernen_Condition;
	information	= Info_Mod_Parlan_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Bring mir was bei.";
};

FUNC INT Info_Mod_Parlan_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Parlan_Lehrer))
	&& (Mod_RealMana < 100)
	&& ((Mod_Gilde == 0)
	|| (Mod_Gilde == 6)
	|| (Mod_Gilde == 7))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Parlan_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Parlan_Lernen_15_00"); //Bring mir was bei.

	Info_ClearChoices	(Info_Mod_Parlan_Lernen);

	Info_AddChoice		(Info_Mod_Parlan_Lernen, DIALOG_BACK, INFO_MOD_Parlan_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Parlan_Lernen, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Parlan_Lernen_5);
	Info_AddChoice		(Info_Mod_Parlan_Lernen, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Parlan_Lernen_1);
};

FUNC VOID Info_Mod_Parlan_Lernen_BACK()
{
	if (Mod_RealMana	>=	100)
	{
		AI_Output(self, hero, "Info_Mod_Parlan_Lernen_BACK_05_01"); //Deine magischen Kenntnisse sind jetzt so gut, dass ich dir nichts mehr beibringen kann.
	};
	Info_ClearChoices	(Info_Mod_Parlan_Lernen);
};

FUNC VOID Info_Mod_Parlan_Lernen_5()
{
	B_TeachAttributePoints_New (self, hero, ATR_MANA_MAX, 5, 100);

	Info_ClearChoices	(Info_Mod_Parlan_Lernen);

	Info_AddChoice		(Info_Mod_Parlan_Lernen, DIALOG_BACK, INFO_MOD_Parlan_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Parlan_Lernen, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Parlan_Lernen_5);
	Info_AddChoice		(Info_Mod_Parlan_Lernen, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Parlan_Lernen_1);
};

FUNC VOID Info_Mod_Parlan_Lernen_1()
{
	B_TeachAttributePoints (self, hero, ATR_MANA_MAX, 1, 100);

	Info_ClearChoices	(Info_Mod_Parlan_Lernen);

	Info_AddChoice		(Info_Mod_Parlan_Lernen, DIALOG_BACK, INFO_MOD_Parlan_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Parlan_Lernen, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Parlan_Lernen_5);
	Info_AddChoice		(Info_Mod_Parlan_Lernen, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Parlan_Lernen_1);
};

INSTANCE Info_Mod_Parlan_Pickpocket (C_INFO)
{
	npc		= Mod_554_KDF_Parlan_NW;
	nr		= 1;
	condition	= Info_Mod_Parlan_Pickpocket_Condition;
	information	= Info_Mod_Parlan_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_100;
};

FUNC INT Info_Mod_Parlan_Pickpocket_Condition()
{
	C_Beklauen	(86, ItMi_Gold, 560);
};

FUNC VOID Info_Mod_Parlan_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Parlan_Pickpocket);

	Info_AddChoice	(Info_Mod_Parlan_Pickpocket, DIALOG_BACK, Info_Mod_Parlan_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Parlan_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Parlan_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Parlan_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Parlan_Pickpocket);
};

FUNC VOID Info_Mod_Parlan_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Parlan_Pickpocket);
};

INSTANCE Info_Mod_Parlan_EXIT (C_INFO)
{
	npc		= Mod_554_KDF_Parlan_NW;
	nr		= 1;
	condition	= Info_Mod_Parlan_EXIT_Condition;
	information	= Info_Mod_Parlan_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Parlan_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Parlan_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};