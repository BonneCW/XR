INSTANCE Info_Mod_Orkjaeger_MT_SindSchonDrin (C_INFO)
{
	npc		= Mod_7245_SLD_Orkjaeger_MT;
	nr		= 1;
	condition	= Info_Mod_Orkjaeger_MT_SindSchonDrin_Condition;
	information	= Info_Mod_Orkjaeger_MT_SindSchonDrin_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Orkjaeger_MT_SindSchonDrin_Condition()
{
	if (Mod_NL_UOS == 2)
	&& (Mod_Gilde == 19)
	&& (Npc_GetDistToWP(hero, "OW_PATH_198_ORCGRAVEYARD6") < 5000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Orkjaeger_MT_SindSchonDrin_Info()
{
	AI_Output(self, hero, "Info_Mod_Orkjaeger_MT_SindSchonDrin_11_00"); //Du kommst ein paar Minuten zu spät. Die Jungs sind bereits losgegangen. Wir passen auf, dass sich keiner von den Orks aus dem Staub machen will.
	AI_Output(self, hero, "Info_Mod_Orkjaeger_MT_SindSchonDrin_11_01"); //Tja, der ganze Spaß ohne uns.
	AI_Output(hero, self, "Info_Mod_Orkjaeger_MT_SindSchonDrin_15_02"); //Spaß?
	AI_Output(self, hero, "Info_Mod_Orkjaeger_MT_SindSchonDrin_11_03"); //Ach, die paar Grünhäute machen wir doch mit links alle. Nur dumme, stinkende Orks ...
	AI_Output(hero, self, "Info_Mod_Orkjaeger_MT_SindSchonDrin_15_04"); //Hmm, wenn du meinst ...

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Orkjaeger_MT_GetZombie_Hi (C_INFO)
{
	npc		= Mod_7245_SLD_Orkjaeger_MT;
	nr		= 1;
	condition	= Info_Mod_Orkjaeger_MT_GetZombie_Hi_Condition;
	information	= Info_Mod_Orkjaeger_MT_GetZombie_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hey Leute, macht dass ihr reinkommt.";
};

FUNC INT Info_Mod_Orkjaeger_MT_GetZombie_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Rod_OGY_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Orkjaeger_MT_GetZombie_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Orkjaeger_MT_GetZombie_Hi_15_00"); //Hey Leute, macht dass ihr reinkommt, drinnen könnten wir etwas Unterstützung brauchen.

	AI_StopProcessInfos	(self);
};