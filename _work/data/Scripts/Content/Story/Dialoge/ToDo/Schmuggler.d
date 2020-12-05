INSTANCE Info_Mod_Schmuggler_Hi (C_INFO)
{
	npc		= Mod_7783_OUT_Schmuggler_NW;
	nr		= 1;
	condition	= Info_Mod_Schmuggler_Hi_Condition;
	information	= Info_Mod_Schmuggler_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Schmuggler_Hi_Condition()
{
	if (Mod_Nagur_Geschaeft == 7)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Schmuggler_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Schmuggler_Hi_09_00"); //Ahh, there you are. You did a good job.
	AI_Output(hero, self, "Info_Mod_Schmuggler_Hi_15_01"); //Where's Nagur?
	AI_Output(self, hero, "Info_Mod_Schmuggler_Hi_09_02"); //It rests on the bottom of the sea and won't cause any more trouble.
	AI_Output(hero, self, "Info_Mod_Schmuggler_Hi_15_03"); //And my gold?
	AI_Output(self, hero, "Info_Mod_Schmuggler_Hi_09_04"); //Here, have fun with it.
	AI_Output(self, hero, "Info_Mod_Schmuggler_Hi_09_05"); //Besides, you can get special things from me in the future... You've proven you know how to do business.

	B_GivePlayerXP	(150);

	B_SetTopicStatus	(TOPIC_MOD_NAGUR_GESCHAEFT, LOG_SUCCESS);
};

INSTANCE Info_Mod_Schmuggler_Trade (C_INFO)
{
	npc		= Mod_7783_OUT_Schmuggler_NW;
	nr		= 1;
	condition	= Info_Mod_Schmuggler_Trade_Condition;
	information	= Info_Mod_Schmuggler_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Schmuggler_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Schmuggler_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Schmuggler_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Schmuggler_EXIT (C_INFO)
{
	npc		= Mod_7783_OUT_Schmuggler_NW;
	nr		= 1;
	condition	= Info_Mod_Schmuggler_EXIT_Condition;
	information	= Info_Mod_Schmuggler_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Schmuggler_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Schmuggler_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
