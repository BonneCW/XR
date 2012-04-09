FUNC VOID LORERELS ()
{
	if (LoreRelendel == 1)
	{
		AI_Wait	(hero, 10);

		LoreRelendel = 2;

		Wld_SendTrigger	("EVT_LORENFAHRT");
	};
};

FUNC VOID LOREKHOS ()
{
	if (LoreKhorinis == 1)
	{
		AI_Wait	(hero, 10);

		LoreKhorinis = 2;

		Wld_SendTrigger	("EVT_LORENFAHRT");
	};
};

FUNC VOID LOREREL_LETSGO_S0 ()
{
	if (LoreRelendel == 0)
	{
		AI_UseMob	(hero, "VWHEEL", -1);

		AI_GotoWP	(hero, "LORENFAHRT_01");

		AI_PlayAni	(hero, "T_STAND_2_SIT");

		LoreRelendel = 1;
	};
};

FUNC VOID LOREREL_LETSGO_S1 ()
{
	if (LoreRelendel == 0)
	{
		AI_UseMob	(hero, "VWHEEL", -1);

		AI_GotoWP	(hero, "LORENFAHRT_01");

		AI_PlayAni	(hero, "T_STAND_2_SIT");

		LoreRelendel = 1;
	};
};

FUNC VOID LOREKHO_LETSGO_S0 ()
{
	if (LoreKhorinis == 0)
	{
		AI_UseMob	(hero, "VWHEEL", -1);

		AI_GotoWP	(hero, "LORENFAHRT_01");

		AI_PlayAni	(hero, "T_STAND_2_SIT");

		LoreKhorinis = 1;
	};
};

FUNC VOID LOREKHO_LETSGO_S1 ()
{
	if (LoreKhorinis == 0)
	{
		AI_UseMob	(hero, "VWHEEL", -1);

		AI_GotoWP	(hero, "LORENFAHRT_01");

		AI_PlayAni	(hero, "T_STAND_2_SIT");

		LoreKhorinis = 1;
	};
};

FUNC VOID LOREEISMINE01 ()
{
	if (LoreEisgebietMine01 == 1)
	{
		AI_Wait	(hero, 10);

		LoreEisgebietMine01 = 2;

		Wld_SendTrigger	("EVT_LORENFAHRT_MINE");
	};
};

FUNC VOID LOREEISMINE01_LETSGO_S0 ()
{
	if (LoreEisgebietMine01 == 0)
	{
		AI_UseMob	(hero, "VWHEEL", -1);

		AI_GotoWP	(hero, "LORE_MINE_01");

		AI_PlayAni	(hero, "T_STAND_2_SIT");

		LoreEisgebietMine01 = 1;
	};
};

FUNC VOID LOREEISMINE01_LETSGO_S1 ()
{
	if (LoreEisgebietMine01 == 0)
	{
		AI_UseMob	(hero, "VWHEEL", -1);

		AI_GotoWP	(hero, "LORE_MINE_01");

		AI_PlayAni	(hero, "T_STAND_2_SIT");

		LoreEisgebietMine01 = 1;
	};
};

FUNC VOID LOREEISMINE02 ()
{
	if (LoreEisgebietMine01 == 4)
	{
		AI_Wait	(hero, 10);

		LoreEisgebietMine01 = 5;

		Wld_SendTrigger	("EVT_LORENFAHRT_MINE");
	};
};

FUNC VOID LOREEISMINE02_LETSGO_S0 ()
{
	if (LoreEisgebietMine01 == 3)
	{
		AI_UseMob	(hero, "VWHEEL", -1);

		AI_GotoWP	(hero, "LORE_MINE_03");

		AI_PlayAni	(hero, "T_STAND_2_SIT");

		LoreEisgebietMine01 = 4;
	};
};

FUNC VOID LOREEISMINE02_LETSGO_S1 ()
{
	if (LoreEisgebietMine01 == 3)
	{
		AI_UseMob	(hero, "VWHEEL", -1);

		AI_GotoWP	(hero, "LORE_MINE_03");

		AI_PlayAni	(hero, "T_STAND_2_SIT");

		LoreEisgebietMine01 = 4;
	};
};

FUNC VOID LOREEISSW01 ()
{
	if (LoreEisgebietSW01 == 1)
	{
		AI_Wait	(hero, 10);

		LoreEisgebietSW01 = 2;

		Wld_SendTrigger	("EVT_LORENFAHRT_SW");
	};
};

FUNC VOID LOREEISSW01_LETSGO_S0 ()
{
	if (LoreEisgebietSW01 == 0)
	{
		AI_UseMob	(hero, "VWHEEL", -1);

		AI_GotoWP	(hero, "LORE_SW_01");

		AI_PlayAni	(hero, "T_STAND_2_SIT");

		LoreEisgebietSW01 = 1;
	};
};

FUNC VOID LOREEISSW01_LETSGO_S1 ()
{
	if (LoreEisgebietSW01 == 0)
	{
		AI_UseMob	(hero, "VWHEEL", -1);

		AI_GotoWP	(hero, "LORE_SW_01");

		AI_PlayAni	(hero, "T_STAND_2_SIT");

		LoreEisgebietSW01 = 1;
	};
};

FUNC VOID LOREEISSW02 ()
{
	if (LoreEisgebietSW01 == 4)
	{
		AI_Wait	(hero, 10);

		LoreEisgebietSW01 = 5;

		Wld_SendTrigger	("EVT_LORENFAHRT_SW");
	};
};

FUNC VOID LOREEISSW02_LETSGO_S0 ()
{
	if (LoreEisgebietSW01 == 3)
	{
		AI_UseMob	(hero, "VWHEEL", -1);

		AI_GotoWP	(hero, "LORE_SW_03");

		AI_PlayAni	(hero, "T_STAND_2_SIT");

		LoreEisgebietSW01 = 4;
	};
};

FUNC VOID LOREEISSW02_LETSGO_S1 ()
{
	if (LoreEisgebietSW01 == 3)
	{
		AI_UseMob	(hero, "VWHEEL", -1);

		AI_GotoWP	(hero, "LORE_SW_03");

		AI_PlayAni	(hero, "T_STAND_2_SIT");

		LoreEisgebietSW01 = 4;
	};
};