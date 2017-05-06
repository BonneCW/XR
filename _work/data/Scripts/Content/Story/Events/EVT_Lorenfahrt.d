FUNC VOID LoreWP(var string wp) {
	VAR oCNpc her;
    her = Hlp_GetNpc (PC_HERO);
    VAR zCWaypoint meinWp;
    MEM_AssignInst (meinWp, SearchWaypointByName(wp));
    her._zCVob_trafoObjToWorld[3] = meinWp.pos[0];
    her._zCVob_trafoObjToWorld[7] = mkf(roundf(meinWp.pos[1]) + 200);
    her._zCVob_trafoObjToWorld[11] = meinWp.pos[2];
	
	hero.wp = wp;
	AI_AlignToWp(hero);

	AI_PlayAni	(hero, "T_STAND_2_SIT");
};

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

		LoreWP	("LORENFAHRT_01");

		LoreRelendel = 1;
	};
};

FUNC VOID LOREREL_LETSGO_S1 ()
{
	if (LoreRelendel == 0)
	{
		AI_UseMob	(hero, "VWHEEL", -1);

		LoreWP	("LORENFAHRT_01");

		LoreRelendel = 1;
	};
};

FUNC VOID LOREKHO_LETSGO_S0 ()
{
	if (LoreKhorinis == 0)
	{
		AI_UseMob	(hero, "VWHEEL", -1);

		LoreWP	("LORENFAHRT_01");

		LoreKhorinis = 1;
	};
};

FUNC VOID LOREKHO_LETSGO_S1 ()
{
	if (LoreKhorinis == 0)
	{
		AI_UseMob	(hero, "VWHEEL", -1);

		LoreWP	("LORENFAHRT_01");

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

		LoreWP	("LORE_MINE_01");

		LoreEisgebietMine01 = 1;
	};
};

FUNC VOID LOREEISMINE01_LETSGO_S1 ()
{
	if (LoreEisgebietMine01 == 0)
	{
		AI_UseMob	(hero, "VWHEEL", -1);

		LoreWP	("LORE_MINE_01");

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

		LoreWP	("LORE_MINE_03");

		LoreEisgebietMine01 = 4;
	};
};

FUNC VOID LOREEISMINE02_LETSGO_S1 ()
{
	if (LoreEisgebietMine01 == 3)
	{
		AI_UseMob	(hero, "VWHEEL", -1);

		LoreWP	("LORE_MINE_03");

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

		LoreWP	("LORE_SW_01");

		LoreEisgebietSW01 = 1;
	};
};

FUNC VOID LOREEISSW01_LETSGO_S1 ()
{
	if (LoreEisgebietSW01 == 0)
	{
		AI_UseMob	(hero, "VWHEEL", -1);

		LoreWP	("LORE_SW_01");

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

		LoreWP	("LORE_SW_03");

		LoreEisgebietSW01 = 4;
	};
};

FUNC VOID LOREEISSW02_LETSGO_S1 ()
{
	if (LoreEisgebietSW01 == 3)
	{
		AI_UseMob	(hero, "VWHEEL", -1);

		LoreWP	("LORE_SW_03");

		LoreEisgebietSW01 = 4;
	};
};