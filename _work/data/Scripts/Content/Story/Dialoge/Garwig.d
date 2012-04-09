INSTANCE Info_Mod_Garwig_Hi (C_INFO)
{
	npc		= Mod_916_NOV_Garwig_NW;
	nr		= 1;
	condition	= Info_Mod_Garwig_Hi_Condition;
	information	= Info_Mod_Garwig_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Garwig_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Garwig_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Garwig_Hi_06_01"); //Ich bin Garwig, Novize hier im Kloster und Schützer des Heiligen Hammers.
};

INSTANCE Info_Mod_Garwig_Genehmigung (C_INFO)
{
	npc		= Mod_916_NOV_Garwig_NW;
	nr		= 1;
	condition	= Info_Mod_Garwig_Genehmigung_Condition;
	information	= Info_Mod_Garwig_Genehmigung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich soll den Hammer holen.";
};

FUNC INT Info_Mod_Garwig_Genehmigung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Garwig_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Pyrokar_Hammer))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Garwig_Genehmigung_Info()
{
	AI_Output(hero, self, "Info_Mod_Garwig_Genehmigung_15_00"); //Ich soll den Hammer holen.
	AI_Output(self, hero, "Info_Mod_Garwig_Genehmigung_06_01"); //Wer sagt das?
	AI_Output(hero, self, "Info_Mod_Garwig_Genehmigung_15_02"); //Pyrokar schickt mich.
	AI_Output(self, hero, "Info_Mod_Garwig_Genehmigung_06_03"); //Gut, nimm ihn.

	B_LogEntry	(TOPIC_MOD_URIZIEL, "Ich habe Garwig Bescheid gesagt und kann den heiligen Hammer nun mitnehmen.");
};

INSTANCE Info_Mod_Garwig_HammerKlau (C_INFO)
{
	npc		= Mod_916_NOV_Garwig_NW;
	nr		= 1;
	condition	= Info_Mod_Garwig_HammerKlau_Condition;
	information	= Info_Mod_Garwig_HammerKlau_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Garwig_HammerKlau_Condition()
{
	if (Npc_HasItems(hero, Holy_Hammer_MIS) == 1)
	&& (Kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Garwig_HammerKlau_Info()
{
	AI_Output(self, hero, "Info_Mod_Garwig_HammerKlau_06_00"); //Hey, so geht das aber nicht. Gib den Hammer her.

	B_GiveInvItems	(hero, self, Holy_Hammer_MIS, 1);
	
	Wld_RemoveItem	(Holy_Hammer_MIS);
	Wld_InsertItem	(Holy_Hammer_MIS, "FP_HAMMER");
	Wld_RemoveItem	(Holy_Hammer_MIS);

	B_Göttergefallen(3, 1);

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Garwig_Pickpocket (C_INFO)
{
	npc		= Mod_916_NOV_Garwig_NW;
	nr		= 1;
	condition	= Info_Mod_Garwig_Pickpocket_Condition;
	information	= Info_Mod_Garwig_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Garwig_Pickpocket_Condition()
{
	C_Beklauen	(120, ItMi_Gold, 100);
};

FUNC VOID Info_Mod_Garwig_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Garwig_Pickpocket);

	Info_AddChoice	(Info_Mod_Garwig_Pickpocket, DIALOG_BACK, Info_Mod_Garwig_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Garwig_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Garwig_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Garwig_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Garwig_Pickpocket);
};

FUNC VOID Info_Mod_Garwig_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Garwig_Pickpocket);
};

INSTANCE Info_Mod_Garwig_EXIT (C_INFO)
{
	npc		= Mod_916_NOV_Garwig_NW;
	nr		= 1;
	condition	= Info_Mod_Garwig_EXIT_Condition;
	information	= Info_Mod_Garwig_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Garwig_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Garwig_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};