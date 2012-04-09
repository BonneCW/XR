INSTANCE Info_Mod_Alchemist01_Hi (C_INFO)
{
	npc		= Mod_1739_KDF_Ordenspriester_PAT;
	nr		= 1;
	condition	= Info_Mod_Alchemist01_Hi_Condition;
	information	= Info_Mod_Alchemist01_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Alchemist01_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Alchemist01_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Alchemist01_Hi_06_01"); //Ich bin einer der Alchemisten.
};

INSTANCE Info_Mod_Alchemist01_Fake (C_INFO)
{
	npc		= Mod_1739_KDF_Ordenspriester_PAT;
	nr		= 1;
	condition	= Info_Mod_Alchemist01_Fake_Condition;
	information	= Info_Mod_Alchemist01_Fake_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ist hier ein seltsamer Magier gewesen?";
};

FUNC INT Info_Mod_Alchemist01_Fake_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_KDF_13_Fake))
	&& (Npc_KnowsInfo(hero, Info_Mod_Alchemist01_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alchemist01_Fake_Info()
{
	AI_Output(hero, self, "Info_Mod_Alchemist01_Fake_15_00"); //Ist hier ein seltsamer Magier gewesen?
	AI_Output(self, hero, "Info_Mod_Alchemist01_Fake_06_01"); //Ein Magier war eben noch hier. Er hat gesagt, er wolle zu den Übungsräumen.

	B_LogEntry	(TOPIC_MOD_FM_SM, "Scheint so als wäre er vom Alchemielabor aus Richtung Übrungsräume geflohen.");
};

INSTANCE Info_Mod_Alchemist01_EXIT (C_INFO)
{
	npc		= Mod_1739_KDF_Ordenspriester_PAT;
	nr		= 1;
	condition	= Info_Mod_Alchemist01_EXIT_Condition;
	information	= Info_Mod_Alchemist01_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Alchemist01_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Alchemist01_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};