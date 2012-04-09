INSTANCE Info_Mod_Blade_Hi (C_INFO)
{
	npc		= Mod_1269_SLD_Blade_MT;
	nr		= 1;
	condition	= Info_Mod_Blade_Hi_Condition;
	information	= Info_Mod_Blade_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Das Training wartet. Geh zu Patrick.";
};

FUNC INT Info_Mod_Blade_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Patrick_Training))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Blade_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Blade_Hi_15_00"); //Das Training wartet. Geh zu Patrick.
	AI_Output(self, hero, "Info_Mod_Blade_Hi_11_01"); //Was? Man, ich bin doch sowieso schon einer der besten Schwertkämpfer.
	AI_Output(hero, self, "Info_Mod_Blade_Hi_15_02"); //Regeln sind Regeln.
	AI_Output(self, hero, "Info_Mod_Blade_Hi_11_03"); //Ja, ich mach mich ja schon auf die Socken.

	B_LogEntry	(TOPIC_MOD_SLD_PATRICK, "Blade zum Training zu bewegen war kein größeres Problem.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TRAINING");
};

INSTANCE Info_Mod_Blade_Ambient (C_INFO)
{
	npc		= Mod_1269_SLD_Blade_MT;
	nr		= 1;
	condition	= Info_Mod_Blade_Ambient_Condition;
	information	= Info_Mod_Blade_Ambient_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie geht's?";
};

FUNC INT Info_Mod_Blade_Ambient_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Blade_Ambient_Info()
{
	AI_Output(hero, self, "Info_Mod_Blade_Ambient_15_00"); //Wie geht's?
	AI_Output(self, hero, "Info_Mod_Blade_Ambient_11_01"); //Komisch heute. Hab da so ein Kribbeln im Arm.
	AI_Output(self, hero, "Info_Mod_Blade_Ambient_11_02"); //Muss wohl mal wieder ordentlich trainieren.
};

INSTANCE Info_Mod_Blade_Pickpocket (C_INFO)
{
	npc		= Mod_1269_SLD_Blade_MT;
	nr		= 1;
	condition	= Info_Mod_Blade_Pickpocket_Condition;
	information	= Info_Mod_Blade_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Blade_Pickpocket_Condition()
{
	C_Beklauen	(73, ItMi_Gold, 230);
};

FUNC VOID Info_Mod_Blade_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Blade_Pickpocket);

	Info_AddChoice	(Info_Mod_Blade_Pickpocket, DIALOG_BACK, Info_Mod_Blade_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Blade_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Blade_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Blade_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Blade_Pickpocket);
};

FUNC VOID Info_Mod_Blade_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Blade_Pickpocket);
};

INSTANCE Info_Mod_Blade_EXIT (C_INFO)
{
	npc		= Mod_1269_SLD_Blade_MT;
	nr		= 1;
	condition	= Info_Mod_Blade_EXIT_Condition;
	information	= Info_Mod_Blade_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Blade_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Blade_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};