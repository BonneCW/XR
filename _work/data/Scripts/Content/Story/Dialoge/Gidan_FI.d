INSTANCE Info_Mod_Gidan_FI_Hi (C_INFO)
{
	npc		= Mod_1974_MIL_Gidan_FI;
	nr		= 1;
	condition	= Info_Mod_Gidan_FI_Hi_Condition;
	information	= Info_Mod_Gidan_FI_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gidan_FI_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gidan_FI_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Gidan_FI_Hi_13_00"); //Du warst schneller hier als ich dich erwartet hatte. Für dich hab ich ein ganz besonderes Empfangskomitee.
	AI_Output(self, hero, "Info_Mod_Gidan_FI_Hi_13_01"); //Und als Bonus die Antwort auf eine kleine Frage. Was will die neue Bruderschaft mit magischem Erz? SIEH SELBST. (lacht)

	AI_StopProcessInfos	(self);

	B_InitMonsterAttitudes();

	B_StartOtherRoutine	(self, "WATCHFIGHT");
};

INSTANCE Info_Mod_Gidan_FI_FirstWaveDead (C_INFO)
{
	npc		= Mod_1974_MIL_Gidan_FI;
	nr		= 1;
	condition	= Info_Mod_Gidan_FI_FirstWaveDead_Condition;
	information	= Info_Mod_Gidan_FI_FirstWaveDead_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gidan_FI_FirstWaveDead_Condition()
{
	if (FI_Story == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gidan_FI_FirstWaveDead_Info()
{
	AI_Output(self, hero, "Info_Mod_Gidan_FI_FirstWaveDead_13_00"); //Du bist gut. Doch sobald wir dein Blut haben, wird der Schläfer wieder auferstehen.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "WATCHFIGHT");
};

INSTANCE Info_Mod_Gidan_FI_SecondWaveDead (C_INFO)
{
	npc		= Mod_1974_MIL_Gidan_FI;
	nr		= 1;
	condition	= Info_Mod_Gidan_FI_SecondWaveDead_Condition;
	information	= Info_Mod_Gidan_FI_SecondWaveDead_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gidan_FI_SecondWaveDead_Condition()
{
	if (FI_Story == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gidan_FI_SecondWaveDead_Info()
{
	AI_Output(self, hero, "Info_Mod_Gidan_FI_SecondWaveDead_13_00"); //(lacht) Du hast schon zu lange überlebt! Jetzt wirst du sterben!

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "WATCHFIGHT");
	B_StartOtherRoutine	(Mod_1981_Kolam_FI, "REDE");
};

INSTANCE Info_Mod_Gidan_FI_EXIT (C_INFO)
{
	npc		= Mod_1974_MIL_Gidan_FI;
	nr		= 1;
	condition	= Info_Mod_Gidan_FI_EXIT_Condition;
	information	= Info_Mod_Gidan_FI_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Gidan_FI_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gidan_FI_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};