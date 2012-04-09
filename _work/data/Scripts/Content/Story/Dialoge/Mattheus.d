INSTANCE Info_Mod_Mattheus_Hi (C_INFO)
{
	npc		= Mod_724_NOV_Mattheus_NW;
	nr		= 1;
	condition	= Info_Mod_Mattheus_Hi_Condition;
	information	= Info_Mod_Mattheus_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Mattheus_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Mattheus_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Mattheus_Hi_09_01"); //Ich bin Mattheus, Feuer Novize und Bote von Pyrokar, dem obersten der Feuermagier.
	AI_Output(self, hero, "Info_Mod_Mattheus_Hi_09_02"); //Ich überbringe Nachrichten von Pyrokar an Lord Hagen in der Stadt.
};

INSTANCE Info_Mod_Mattheus_Bote (C_INFO)
{
	npc		= Mod_724_NOV_Mattheus_NW;
	nr		= 1;
	condition	= Info_Mod_Mattheus_Bote_Condition;
	information	= Info_Mod_Mattheus_Bote_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was sind das für Botschaften?";
};

FUNC INT Info_Mod_Mattheus_Bote_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mattheus_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Karras_HastDuAuftrag_2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mattheus_Bote_Info()
{
	AI_Output(hero, self, "Info_Mod_Mattheus_Bote_15_00"); //Was sind das für Botschaften?
	AI_Output(self, hero, "Info_Mod_Mattheus_Bote_09_01"); //So dies und das, lauter wichtige Sachen. Ich darf dir aber nichts sagen, was da drin steht.
	
	B_LogEntry	(TOPIC_MOD_KARRAS_BOTE, "Mattheus will mir nicht verraten was das für Botschaften sind. Vielleicht sollte ich ihm noch ein bisschen mehr zu trinken geben.");
};

INSTANCE Info_Mod_Mattheus_Alk (C_INFO)
{
	npc		= Mod_724_NOV_Mattheus_NW;
	nr		= 1;
	condition	= Info_Mod_Mattheus_Alk_Condition;
	information	= Info_Mod_Mattheus_Alk_Info;
	permanent	= 0;
	important	= 0;
	description	= "Nimm dieses Bier.";
};

FUNC INT Info_Mod_Mattheus_Alk_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mattheus_Bote))
	&& (Npc_HasItems(hero, ItFo_Beer) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mattheus_Alk_Info()
{
	AI_Output(hero, self, "Info_Mod_Mattheus_Alk_15_00"); //Nimm dieses Bier.

	B_GiveInvItems	(hero, self, ItFo_Beer, 1);

	B_UseItem	(self, ItFo_Beer);

	AI_StopProcessInfos	(self);

	B_Göttergefallen(3, 1);
};

INSTANCE Info_Mod_Mattheus_WhatsNew (C_INFO)
{
	npc		= Mod_724_NOV_Mattheus_NW;
	nr		= 1;
	condition	= Info_Mod_Mattheus_WhatsNew_Condition;
	information	= Info_Mod_Mattheus_WhatsNew_Info;
	permanent	= 1;
	important	= 0;
	description	= "Was gibts Neues?";
};

FUNC INT Info_Mod_Mattheus_WhatsNew_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Mattheus_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Mattheus_WhatsNew_Info()
{
	AI_Output(hero, self, "Info_Mod_Mattheus_WhatsNew_15_00"); //Was gibts Neues?
	AI_Output(self, hero, "Info_Mod_Mattheus_WhatsNew_09_01"); //Moment gibts nichts.
};

INSTANCE Info_Mod_Mattheus_Pickpocket (C_INFO)
{
	npc		= Mod_724_NOV_Mattheus_NW;
	nr		= 1;
	condition	= Info_Mod_Mattheus_Pickpocket_Condition;
	information	= Info_Mod_Mattheus_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Mattheus_Pickpocket_Condition()
{
	C_Beklauen	(72, ItMi_Gold, 300);
};

FUNC VOID Info_Mod_Mattheus_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Mattheus_Pickpocket);

	Info_AddChoice	(Info_Mod_Mattheus_Pickpocket, DIALOG_BACK, Info_Mod_Mattheus_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Mattheus_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Mattheus_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Mattheus_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Mattheus_Pickpocket);
};

FUNC VOID Info_Mod_Mattheus_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Mattheus_Pickpocket);
};

INSTANCE Info_Mod_Mattheus_EXIT (C_INFO)
{
	npc		= Mod_724_NOV_Mattheus_NW;
	nr		= 1;
	condition	= Info_Mod_Mattheus_EXIT_Condition;
	information	= Info_Mod_Mattheus_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Mattheus_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Mattheus_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};