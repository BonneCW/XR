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
	AI_Output(self, hero, "Info_Mod_Schmuggler_Hi_09_00"); //Ach, tam jestescie. Wykonal pan dobra prace.
	AI_Output(hero, self, "Info_Mod_Schmuggler_Hi_15_01"); //Gdzie jest Nagur?
	AI_Output(self, hero, "Info_Mod_Schmuggler_Hi_09_02"); //Opiera sie on na dnie morza i nie powoduje zadnych problemów.
	AI_Output(hero, self, "Info_Mod_Schmuggler_Hi_15_03"); //A moje zloto?
	AI_Output(self, hero, "Info_Mod_Schmuggler_Hi_09_04"); //Tutaj dobrze sie bawic.
	AI_Output(self, hero, "Info_Mod_Schmuggler_Hi_09_05"); //Poza tym w przyszlosci mozesz odebrac mi specjalne rzeczy.... Udowodniles, ze wiesz jak prowadzic biznes.

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
