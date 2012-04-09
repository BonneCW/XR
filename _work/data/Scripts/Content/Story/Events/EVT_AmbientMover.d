FUNC VOID AMBIENTMOVER_XARDAS_ZAUN_01 ()
{
	if (Hlp_Random(100) < 10)
	{
		Wld_SendTrigger	("EVT_ZAUN_XARDAS_01");
	};
};