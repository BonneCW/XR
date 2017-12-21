INSTANCE Info_Mod_Pendler_01_Hi (C_INFO)
{
	npc		= Mod_7706_OUT_Pendler_REL;
	nr		= 1;
	condition	= Info_Mod_Pendler_01_Hi_Condition;
	information	= Info_Mod_Pendler_01_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was seid ihr denn für eine Truppe?";
};

FUNC INT Info_Mod_Pendler_01_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Pendler_01_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Pendler_01_Hi_15_00"); //Was seid ihr denn für eine Truppe?
	AI_Output(self, hero, "Info_Mod_Pendler_01_Hi_03_01"); //Wir sind die Dummen, die von Anselm abkommandiert wurden, die Erträge unserer Mine in die Stadt zu transportieren.
	AI_Output(self, hero, "Info_Mod_Pendler_01_Hi_03_02"); //Aber wir haben noch Glück gehabt.
	AI_Output(self, hero, "Info_Mod_Pendler_01_Hi_03_03"); //Mit den armen Schweinen, die jetzt in der Mine schuften dürfen, will ich nicht tauschen.
};

INSTANCE Info_Mod_Pendler_01_WoMine (C_INFO)
{
	npc		= Mod_7706_OUT_Pendler_REL;
	nr		= 1;
	condition	= Info_Mod_Pendler_01_WoMine_Condition;
	information	= Info_Mod_Pendler_01_WoMine_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wo lang geht's denn zur Mine?";
};

FUNC INT Info_Mod_Pendler_01_WoMine_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Pendler_01_Hi))
	&& ((Wld_IsTime(07,00,08,00))
	|| (Wld_IsTime(18,00,19,00)))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Pendler_01_WoMine_Info()
{
	AI_Output(hero, self, "Info_Mod_Pendler_01_WoMine_15_00"); //Wo lang geht's denn zur Mine?

	if (Wld_IsTime(07,00,08,00))
	{
		AI_Output(self, hero, "Info_Mod_Pendler_01_WoMine_03_01"); //Komm doch einfach mit, wir sind gerade auf dem Weg dorthin.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Pendler_01_WoMine_03_02"); //Wir sind gerade auf dem Weg in die Stadt, also musst du in die andere Richtung.
		AI_Output(self, hero, "Info_Mod_Pendler_01_WoMine_03_03"); //Du müsstest aber genügend Wegweiser finden, die dich hinführen.
		AI_Output(self, hero, "Info_Mod_Pendler_01_WoMine_03_04"); //Ansonsten warte, bis wir wieder dorthin unterwegs sind, dann kannst du mitkommen.
	};
};

INSTANCE Info_Mod_Pendler_01_EXIT (C_INFO)
{
	npc		= Mod_7706_OUT_Pendler_REL;
	nr		= 1;
	condition	= Info_Mod_Pendler_01_EXIT_Condition;
	information	= Info_Mod_Pendler_01_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Pendler_01_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Pendler_01_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};