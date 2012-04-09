FUNC VOID EVT_ALRAUNENFALLE_FUNC()
{
	if (Mod_AlraunenFalle == 0)
	{
		Wld_SendTrigger	("EVT_ALRAUNENFALLE");
	};
};