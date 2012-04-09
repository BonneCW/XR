FUNC VOID EVT_TRIGGER_HEBELPROB_FUNC_S0 ()
{
	Mod_IR_HebelProb2 += 1;

	if (Mod_IR_HebelProb2 == 2)
	{
		B_Say_Overlay	(hero, NULL, "$IRDORATHHEBELPROBLEM");
	};
};

FUNC VOID EVT_TRIGGER_HEBELPROB_FUNC_S1 ()
{
	Mod_IR_HebelProb2 += 1;

	if (Mod_IR_HebelProb2 == 2)
	{
		B_Say_Overlay	(hero, NULL, "$IRDORATHHEBELPROBLEM");
	};
};