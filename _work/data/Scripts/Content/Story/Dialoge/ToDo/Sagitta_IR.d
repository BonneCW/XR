INSTANCE Info_Mod_Sagitta_IR_Bones (C_INFO)
{
	npc		= Mod_7459_NONE_Sagitta_IR;
	nr		= 1;
	condition	= Info_Mod_Sagitta_IR_Bones_Condition;
	information	= Info_Mod_Sagitta_IR_Bones_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hmm, you wouldn't happen to know what's going on with Bones, would you?";
};

FUNC INT Info_Mod_Sagitta_IR_Bones_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bones_IR_Hi))
	&& (Mod_CassiaDabei == 0)
	&& (Mod_VelayaDabei == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sagitta_IR_Bones_Info()
{
	AI_Output(hero, self, "Info_Mod_Sagitta_IR_Bones_15_00"); //Hmm, you wouldn't happen to know what's going on with Bones, would you?
	AI_Output(self, hero, "Info_Mod_Sagitta_IR_Bones_26_01"); //Oh, you mean that unwanted admirer.
	AI_Output(self, hero, "Info_Mod_Sagitta_IR_Bones_26_02"); //Well, he seemed a little too impulsive to me... after some castor oil in his food, he was more sociable.
	AI_Output(hero, self, "Info_Mod_Sagitta_IR_Bones_15_03"); //(to himself) Well great, in that state he's no longer usable as a fighter.
};

INSTANCE Info_Mod_Sagitta_IR_Trade (C_INFO)
{
	npc		= Mod_7459_NONE_Sagitta_IR;
	nr		= 1;
	condition	= Info_Mod_Sagitta_IR_Trade_Condition;
	information	= Info_Mod_Sagitta_IR_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Sagitta_IR_Trade_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Sagitta_IR_Trade_Info()
{
	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Sagitta_IR_EXIT (C_INFO)
{
	npc		= Mod_7459_NONE_Sagitta_IR;
	nr		= 1;
	condition	= Info_Mod_Sagitta_IR_EXIT_Condition;
	information	= Info_Mod_Sagitta_IR_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Sagitta_IR_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Sagitta_IR_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};
