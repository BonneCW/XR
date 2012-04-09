INSTANCE Info_Mod_Faros_Hi (C_INFO)
{
	npc		= Mod_1770_KDF_Faros_PAT;
	nr		= 1;
	condition	= Info_Mod_Faros_Hi_Condition;
	information	= Info_Mod_Faros_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Faros_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Faros_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Faros_Hi_09_01"); //Ich bin Faros, der Gärtner.
	AI_Output(self, hero, "Info_Mod_Faros_Hi_09_02"); //Ich bin der Chef vom Kräutergarten.
};

INSTANCE Info_Mod_Faros_Fake (C_INFO)
{
	npc		= Mod_1770_KDF_Faros_PAT;
	nr		= 1;
	condition	= Info_Mod_Faros_Fake_Condition;
	information	= Info_Mod_Faros_Fake_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ist hier ein seltsamer Magier gewesen?";
};

FUNC INT Info_Mod_Faros_Fake_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Paladin01_Fake))
	&& (Npc_KnowsInfo(hero, Info_Mod_Faros_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Faros_Fake_Info()
{
	AI_Output(hero, self, "Info_Mod_Faros_Fake_15_00"); //Ist hier ein seltsamer Magier gewesen?
	AI_Output(self, hero, "Info_Mod_Faros_Fake_09_01"); //Ja, allerdings. Da war so ein Kerl, der es ziemlich eilig hatte. Er hat sich umgeschaut und dann was von Bibliothek gemurmelt. Dann ist er verschwunden.

	B_LogEntry	(TOPIC_MOD_FM_SM, "Faros hat mir erzählt, dass der Magier etwas von der Bibliothek gemurmelt hat. Vielleicht sollte ich mich dort mal umsehen.");
};

INSTANCE Info_Mod_Faros_EXIT (C_INFO)
{
	npc		= Mod_1770_KDF_Faros_PAT;
	nr		= 1;
	condition	= Info_Mod_Faros_EXIT_Condition;
	information	= Info_Mod_Faros_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Faros_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Faros_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};