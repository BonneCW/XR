INSTANCE Info_Mod_Rod_AtOGY (C_INFO)
{
	npc		= Mod_795_SLD_Rod_MT;
	nr		= 1;
	condition	= Info_Mod_Rod_AtOGY_Condition;
	information	= Info_Mod_Rod_AtOGY_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Rod_AtOGY_Condition()
{
	if (Npc_GetDistToWP(hero, "OW_PATH_198_ORCGRAVEYARD8") < 5000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rod_AtOGY_Info()
{
	if (Mod_Gilde != 19)
	{
		AI_Output(self, hero, "Info_Mod_Rod_AtOGY_06_00"); //Hey, du kannst erst in den Orkfriedhof, wenn du deiner von uns bist, ein Orkjäger. Ist nur was für ganze Kerle.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Rod_AtOGY_06_01"); //Hey, du kannst erst in den Orkfriedhof, wenn du mit Lee gesprochen hast. Geh lieber gleich zu ihm.
	};

	AI_StopProcessInfos	(self);
};