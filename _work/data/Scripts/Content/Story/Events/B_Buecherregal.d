var int BuecherRegal_01;
var int BuecherRegal_02;
var int BuecherRegal_03;
var int BuecherRegal_04;
var int BuecherRegal_05;
var int BuecherRegal_06;
var int BuecherRegal_07;

FUNC VOID B_FindItem_BuecherRegal ()
{
	var int rnd;
	rnd = Hlp_Random(1);

	if (rnd == 0)
	{
		CreateInvItems	(hero, ItWr_Paper, 1);

		Print	("1 Blatt Papier gefunden");

		B_Say_Overlay	(hero, NULL, "$BUECHERREGALFINDPAPER");
	}
	else if (rnd == 1)
	{
		CreateInvItems	(hero, ItWr_Paper, 1);

		Print	("1 Blatt Papier gefunden");

		B_Say_Overlay	(hero, NULL, "$BUECHERREGALFINDPAPER");
	}
	else
	{
		B_Say_Overlay	(hero, NULL, "$BUECHERREGALNOTHING");
	};
};

FUNC VOID B_BUECHERREGAL_01_S1 ()
{
	if (BuecherRegal_01 == 0)
	{
		BuecherRegal_01 = 1;

		B_FindItem_BuecherRegal();
	}
	else
	{
		B_Say_Overlay	(hero, NULL, "$BUECHERREGALNO");
	};

	AI_Wait	(hero, 20);

	AI_UseMob	(hero, "BOOKSHELF", -1);
};

FUNC VOID B_BUECHERREGAL_02_S1 ()
{
	if (BuecherRegal_02 == 0)
	{
		BuecherRegal_02 = 1;

		B_FindItem_BuecherRegal();
	}
	else
	{
		B_Say_Overlay	(hero, NULL, "$BUECHERREGALNO");
	};

	AI_Wait	(hero, 20);

	AI_UseMob	(hero, "BOOKSHELF", -1);
};

FUNC VOID B_BUECHERREGAL_03_S1 ()
{
	if (BuecherRegal_03 == 0)
	{
		BuecherRegal_03 = 1;

		B_FindItem_BuecherRegal();
	}
	else
	{
		B_Say_Overlay	(hero, NULL, "$BUECHERREGALNO");
	};

	AI_Wait	(hero, 20);

	AI_UseMob	(hero, "BOOKSHELF", -1);
};

FUNC VOID B_BUECHERREGAL_04_S1 ()
{
	if (BuecherRegal_04 == 0)
	{
		BuecherRegal_04 = 1;

		B_FindItem_BuecherRegal();
	}
	else
	{
		B_Say_Overlay	(hero, NULL, "$BUECHERREGALNO");
	};

	AI_Wait	(hero, 20);

	AI_UseMob	(hero, "BOOKSHELF", -1);
};

FUNC VOID B_BUECHERREGAL_05_S1 ()
{
	if (BuecherRegal_05 == 0)
	{
		BuecherRegal_05 = 1;

		B_FindItem_BuecherRegal();
	}
	else
	{
		B_Say_Overlay	(hero, NULL, "$BUECHERREGALNO");
	};

	AI_Wait	(hero, 20);

	AI_UseMob	(hero, "BOOKSHELF", -1);
};

FUNC VOID B_BUECHERREGAL_06_S1 ()
{
	if (BuecherRegal_06 == 0)
	{
		BuecherRegal_06 = 1;

		B_FindItem_BuecherRegal();
	}
	else
	{
		B_Say_Overlay	(hero, NULL, "$BUECHERREGALNO");
	};

	AI_Wait	(hero, 20);

	AI_UseMob	(hero, "BOOKSHELF", -1);
};

FUNC VOID B_BUECHERREGAL_07_S1 ()
{
	if (BuecherRegal_07 == 0)
	{
		BuecherRegal_07 = 1;

		Print ("Alte Notiz gefunden");

		CreateInvItems	(hero, ItWr_ErolNotiz4, 1);
	}
	else
	{
		B_Say_Overlay	(hero, NULL, "$BUECHERREGALNO");
	};

	AI_Wait	(hero, 20);

	AI_UseMob	(hero, "BOOKSHELF", -1);
};