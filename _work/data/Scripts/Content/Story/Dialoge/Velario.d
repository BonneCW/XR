INSTANCE Info_Mod_Velario_Hi (C_INFO)
{
	npc		= Mod_1738_KDF_Velario_PAT;
	nr		= 1;
	condition	= Info_Mod_Velario_Hi_Condition;
	information	= Info_Mod_Velario_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Velario_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Velario_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Velario_Hi_06_01"); //Ich bin Velario.
};

INSTANCE Info_Mod_Velario_Fake (C_INFO)
{
	npc		= Mod_1738_KDF_Velario_PAT;
	nr		= 1;
	condition	= Info_Mod_Velario_Fake_Condition;
	information	= Info_Mod_Velario_Fake_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du irgendwas verdächtiges gesehen?";
};

FUNC INT Info_Mod_Velario_Fake_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Faros_Fake))
	&& (Npc_KnowsInfo(hero, Info_Mod_Velario_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Velario_Fake_Info()
{
	AI_Output(hero, self, "Info_Mod_Velario_Fake_15_00"); //Hast du irgendwas verdächtiges gesehen?
	AI_Output(self, hero, "Info_Mod_Velario_Fake_06_01"); //Nein, ich glaube nicht.
	AI_Output(hero, self, "Info_Mod_Velario_Fake_15_02"); //Bist du sicher? Ist hier kein Magier vorbeigekommen, der es ziemlich eilig hatte?
	AI_Output(self, hero, "Info_Mod_Velario_Fake_06_03"); //Da war tatsächlich jemand. Er wollte glaub ich in die Mine.

	//B_StartOtherRoutine	(Mod_1768_KDF_Magier_PAT, "MINE");

	//Mod_1768_KDF_Magier_PAT.name = "Schwarzmagier";

	B_LogEntry	(TOPIC_MOD_FM_SM, "Velario meint, dass der Magier in die Mine geflohen sei.");
};

INSTANCE Info_Mod_Velario_EXIT (C_INFO)
{
	npc		= Mod_1738_KDF_Velario_PAT;
	nr		= 1;
	condition	= Info_Mod_Velario_EXIT_Condition;
	information	= Info_Mod_Velario_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Velario_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Velario_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};