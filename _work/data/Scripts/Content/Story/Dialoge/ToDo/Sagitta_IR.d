INSTANCE Info_Mod_Sagitta_IR_Bones (C_INFO)
{
	npc		= Mod_7459_NONE_Sagitta_IR;
	nr		= 1;
	condition	= Info_Mod_Sagitta_IR_Bones_Condition;
	information	= Info_Mod_Sagitta_IR_Bones_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hmm, du weißt nicht zufällig, was mit Bones los ist?";
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
	AI_Output(hero, self, "Info_Mod_Sagitta_IR_Bones_15_00"); //Hmm, du weißt nicht zufällig, was mit Bones los ist?
	AI_Output(self, hero, "Info_Mod_Sagitta_IR_Bones_26_01"); //Ach, du meinst diesen unerwünschten Verehrer.
	AI_Output(self, hero, "Info_Mod_Sagitta_IR_Bones_26_02"); //Nun, er schien mir etwas zu triebhaft ... nach etwas Rizinuswurzel in seinem Essen war er gleich umgänglicher.
	AI_Output(hero, self, "Info_Mod_Sagitta_IR_Bones_15_03"); //(zu sich) Na toll, in dem Zustand ist er als Kämpfer nicht mehr zu gebrauchen.
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
	Backup_Questitems();

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