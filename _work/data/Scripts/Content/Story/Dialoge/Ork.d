INSTANCE Info_Mod_Ork_Hi (C_INFO)
{
	npc		= Mod_10042_Orc_Ork_REL;
	nr		= 1;
	condition	= Info_Mod_Ork_Hi_Condition;
	information	= Info_Mod_Ork_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Ork_Hi_Condition()
{
	if (Npc_IsDead(Mod_7703_OUT_Froppi_REL))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ork_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Ork_Hi_18_00"); //Jetzt ist er tatsächlich tot. Was mach ich denn jetzt?
	AI_Output(hero, self, "Info_Mod_Ork_Hi_15_01"); //Du bist frei! Du kannst tun, was du willst.
	AI_Output(self, hero, "Info_Mod_Ork_Hi_18_02"); //Ach ja? Und was macht man dann so, wenn man frei ist?
	AI_Output(hero, self, "Info_Mod_Ork_Hi_15_03"); //Alles.
	AI_Output(self, hero, "Info_Mod_Ork_Hi_18_04"); //(stöhnt) Klingt schrecklich kompliziert.
	AI_Output(self, hero, "Info_Mod_Ork_Hi_18_05"); //Ich warte lieber, ob Vater nicht doch wieder aufsteht, dann können wir weitersuchen.
};

INSTANCE Info_Mod_Ork_EXIT (C_INFO)
{
	npc		= Mod_10042_Orc_Ork_REL;
	nr		= 1;
	condition	= Info_Mod_Ork_EXIT_Condition;
	information	= Info_Mod_Ork_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Ork_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ork_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};