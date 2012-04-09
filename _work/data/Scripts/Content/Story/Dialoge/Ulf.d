INSTANCE Info_Mod_Ulf_Hi (C_INFO)
{
	npc		= Mod_753_NOV_Ulf_NW;
	nr		= 1;
	condition	= Info_Mod_Ulf_Hi_Condition;
	information	= Info_Mod_Ulf_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Ulf_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ulf_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Ulf_Hi_03_01"); //Ich bin Ulf, meine Aufgabe ist es, den Wein des Klosters hier in der Stadt zu verkaufen.
};

INSTANCE Info_Mod_Ulf_WieGehts (C_INFO)
{
	npc		= Mod_753_NOV_Ulf_NW;
	nr		= 1;
	condition	= Info_Mod_Ulf_WieGehts_Condition;
	information	= Info_Mod_Ulf_WieGehts_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie gehts so?";
};

FUNC INT Info_Mod_Ulf_WieGehts_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ulf_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ulf_WieGehts_Info()
{
	AI_Output(hero, self, "Info_Mod_Ulf_WieGehts_15_00"); //Wie gehts so?
	AI_Output(self, hero, "Info_Mod_Ulf_WieGehts_03_01"); //Ich mache mir sorgen um Akahasch.
	AI_Output(hero, self, "Info_Mod_Ulf_WieGehts_15_02"); //Wer ist Akahasch?
	AI_Output(self, hero, "Info_Mod_Ulf_WieGehts_03_03"); //Er ist auch ein Novize des Klosters, der mir eine Lieferung Wein bringen sollte, doch er ist noch nicht hier angekommen.
	AI_Output(self, hero, "Info_Mod_Ulf_WieGehts_03_04"); //Kannst du mir sagen, wenn du ihn findest?
	AI_Output(hero, self, "Info_Mod_Ulf_WieGehts_15_05"); //Ok.
};

INSTANCE Info_Mod_Ulf_AkahaschTot (C_INFO)
{
	npc		= Mod_753_NOV_Ulf_NW;
	nr		= 1;
	condition	= Info_Mod_Ulf_AkahaschTot_Condition;
	information	= Info_Mod_Ulf_AkahaschTot_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe Akahasch gefunden.";
};

FUNC INT Info_Mod_Ulf_AkahaschTot_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ulf_WieGehts))
	&& ((Npc_IsDead(Mod_4016_NOV_Akahasch_NW))
	|| (Npc_KnowsInfo(hero, Info_Mod_Akahasch_AtKloster)))
	&& (Npc_HasItems(hero, ItMi_Weinlieferung) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ulf_AkahaschTot_Info()
{
	AI_Output(hero, self, "Info_Mod_Ulf_AkahaschTot_15_00"); //Ich habe Akahasch gefunden.
	AI_Output(self, hero, "Info_Mod_Ulf_AkahaschTot_03_01"); //Wo ist er?

	if (Npc_IsDead(Mod_4016_NOV_Akahasch_NW))
	{
		AI_Output(hero, self, "Info_Mod_Ulf_AkahaschTot_15_02"); //Er ist tot.
		AI_Output(self, hero, "Info_Mod_Ulf_AkahaschTot_03_03"); //Bei Innos, ist das wahr? Was ist passiert?
		AI_Output(hero, self, "Info_Mod_Ulf_AkahaschTot_15_04"); //Ich bin in der nähe des Leuchtturms über seine Leiche gestolpert. Das hier hatte er bei sich.
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Ulf_AkahaschTot_15_05"); //Er ist wieder im Kloster. Hier ist der Wein von ihm.
	};

	B_GiveInvItems	(hero, self, ItMi_Weinlieferung, 1);

	AI_Output(self, hero, "Info_Mod_Ulf_AkahaschTot_03_06"); //Wenigstens der Wein ist gerettet. Nimm das als Dank für deine Mühen.

	B_GivePlayerXP	(100);

	CreateInvItems	(self, ItMi_Gold, 50);
	B_GiveInvItems	(self, hero, ItMi_Gold, 50);
};

INSTANCE Info_Mod_Ulf_Pickpocket (C_INFO)
{
	npc		= Mod_753_NOV_Ulf_NW;
	nr		= 1;
	condition	= Info_Mod_Ulf_Pickpocket_Condition;
	information	= Info_Mod_Ulf_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Ulf_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 100);
};

FUNC VOID Info_Mod_Ulf_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Ulf_Pickpocket);

	Info_AddChoice	(Info_Mod_Ulf_Pickpocket, DIALOG_BACK, Info_Mod_Ulf_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Ulf_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Ulf_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Ulf_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Ulf_Pickpocket);
};

FUNC VOID Info_Mod_Ulf_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Ulf_Pickpocket);
};

INSTANCE Info_Mod_Ulf_EXIT (C_INFO)
{
	npc		= Mod_753_NOV_Ulf_NW;
	nr		= 1;
	condition	= Info_Mod_Ulf_EXIT_Condition;
	information	= Info_Mod_Ulf_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Ulf_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ulf_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};