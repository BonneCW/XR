FUNC VOID B_TruheFuellen (var string FuellTruhe)
{
	// Gold

	if (Hlp_Random(100) < 50)
	{
		Mob_CreateItems	(FuellTruhe, ItMi_Gold, Hlp_Random(150));
	};

	// Erzbrocken

	if (Hlp_Random(100) < 50)
	{
		Mob_CreateItems	(FuellTruhe, ItMi_Nugget, Hlp_Random(5));
	};

	// Goldbrocken

	if (Hlp_Random(100) < 50)
	{
		Mob_CreateItems	(FuellTruhe, ItMi_GoldNugget_Addon, Hlp_Random(6));
	};

	// Dietriche

	if (Hlp_Random(100) < 50)
	{
		Mob_CreateItems	(FuellTruhe, ItKe_Lockpick, Hlp_Random(10));
	};

	// Sumpfkraut Stängel

	if (Hlp_Random(100) < 50)
	{
		Mob_CreateItems	(FuellTruhe, ItMi_Joint, Hlp_Random(8));
	};

	// Blutfliegenstachel

	if (Hlp_Random(100) < 20)
	{
		Mob_CreateItems	(FuellTruhe, ItAt_Sting, Hlp_Random(2));
	};

	// Mana Essenz

	if (Hlp_Random(100) < 35)
	{
		Mob_CreateItems	(FuellTruhe, ItPo_Mana_01, Hlp_Random(5));
	};

	// Mana Extrakt

	if (Hlp_Random(100) < 25)
	{
		Mob_CreateItems	(FuellTruhe, ItPo_Mana_02, Hlp_Random(3));
	};

	// Mana Elixier

	if (Hlp_Random(100) < 15)
	{
		Mob_CreateItems	(FuellTruhe, ItPo_Mana_03, Hlp_Random(1));
	};

	// Essenz der Heilung

	if (Hlp_Random(100) < 35)
	{
		Mob_CreateItems	(FuellTruhe, ItPo_Health_01, Hlp_Random(5));
	};

	// Extrakt der Heilung

	if (Hlp_Random(100) < 25)
	{
		Mob_CreateItems	(FuellTruhe, ItPo_Health_02, Hlp_Random(3));
	};

	// Elixier der Heilung

	if (Hlp_Random(100) < 15)
	{
		Mob_CreateItems	(FuellTruhe, ItPo_Health_03, Hlp_Random(1));
	};

	// Fackeln

	if (Hlp_Random(100) < 50)
	{
		Mob_CreateItems	(FuellTruhe, ItLsTorch, Hlp_Random(3));
	};
};