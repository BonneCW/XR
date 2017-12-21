INSTANCE Info_Mod_Aaron_Fake_DoorIn (C_INFO)
{
	npc		= Mod_1858_KDF_Aaron_PAT;
	nr		= 1;
	condition	= Info_Mod_Aaron_Fake_DoorIn_Condition;
	information	= Info_Mod_Aaron_Fake_DoorIn_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Aaron_Fake_DoorIn_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Aaron_Fake_DoorIn_Info()
{
	AI_Output(self, hero, "Info_Mod_Aaron_Fake_DoorIn_03_00"); //Los, treten wir der Hexenkönigin in den Hintern!

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "FOLLOW");
};

INSTANCE Info_Mod_Aaron_Fake_EXIT (C_INFO)
{
	npc		= Mod_1858_KDF_Aaron_PAT;
	nr		= 1;
	condition	= Info_Mod_Aaron_Fake_EXIT_Condition;
	information	= Info_Mod_Aaron_Fake_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Aaron_Fake_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Aaron_Fake_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};