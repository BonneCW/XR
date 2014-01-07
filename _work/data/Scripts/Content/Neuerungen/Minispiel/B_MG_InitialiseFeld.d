// Initialisiert das Spielfeld
//	1. Leeres Belegungsarray
//	2. Felder alle erstellen

FUNC VOID B_MG_InitialiseFeld()
{
	Print_GetScreenSize();

	MG_Spielbrett = View_CreatePxl(0, 0, Print_Screen[PS_X], Print_Screen[PS_Y]);
	View_SetTexture(MG_Spielbrett, "SPIELBRETT.TGA");
	View_Open(MG_Spielbrett);

	var int i; i = 0;
	var int ptr; ptr = MEM_StackPos.position;

	if (i < 80)
	{
		MEM_WriteStatArr(MG_Spielfeld, i, 0);
		MEM_WriteStatArr(MG_Spielfeld_Texturen, i, 0);
		MEM_WriteStatArr(MG_Spielfeld_Figur, i, 0);
		MEM_WriteStatArr(MG_Spielfeld_Possibilities, i, 0);

		i += 1;

		MEM_StackPos.position = ptr;
	};

	MG_Opp_Counter = 0;
	MG_Own_Counter = 0;

	var int xy; // x/y-Größe der Felder, da quadratisch

	xy = Print_Screen[PS_Y]/10; // y-Auflösung ist kleiner als x, deswegen geht das

	// Start-X ermitteln

	var int x;
	var int y;

	y = 0;

	x = Print_Screen[PS_X]/2-4*xy;

	i = 0;

	ptr = MEM_StackPos.position;

	if (i < 80)
	{
		var int temp;
		temp = View_CreatePxl(x, y, x+xy, y+xy);

		if ((i < 8) || (i >= 72))
		{
			View_SetTexture(temp, "MG_SPIELFELD_ZIEL.TGA");
		}
		else
		{
			View_SetTexture(temp, "MG_SPIELFELD.TGA");
		};

		View_Open(temp);

		MEM_WriteStatArr(MG_Spielfeld_Texturen, i, temp);

		x += xy;

		if ((i+1)%8 == 0)
		{
			x = Print_Screen[PS_X]/2-4*xy;

			y += xy;
		};

		i += 1;

		MEM_StackPos.position = ptr;
	};

	// Figuren erstellen

	var int MyFigurHndl;

	if (PlayerHas_MinecrawlerQueen)
	{
		MyFigurHndl = new(C_MG_SPIELFIGUR@);

		Hero_MinecrawlerQueen = get(MyFigurHndl);

		C_MG_SPIELFIGUR_SetType(Hero_MinecrawlerQueen, MG_FIGUR_MINECRAWLERQUEEN, 0, MyFigurHndl);

		MEM_WriteStatArr(MG_EigeneFiguren2, MG_FIGUR_MINECRAWLERQUEEN - 1, 1);
		MEM_WriteStatArr(MG_EigeneFiguren3, MG_FIGUR_MINECRAWLERQUEEN - 1, MyFigurHndl);
	};
	if (PlayerHas_Troll)
	{
		MyFigurHndl = new(C_MG_SPIELFIGUR@);

		Hero_Troll = get(MyFigurHndl);

		C_MG_SPIELFIGUR_SetType(Hero_Troll, MG_FIGUR_Troll, 0, MyFigurHndl);

		MEM_WriteStatArr(MG_EigeneFiguren2, MG_FIGUR_Troll - 1, 1);
		MEM_WriteStatArr(MG_EigeneFiguren3, MG_FIGUR_Troll - 1, MyFigurHndl);
	};
	if (PlayerHas_Schaf)
	{
		MyFigurHndl = new(C_MG_SPIELFIGUR@);

		Hero_Schaf = get(MyFigurHndl);

		C_MG_SPIELFIGUR_SetType(Hero_Schaf, MG_FIGUR_Schaf, 0, MyFigurHndl);

		MEM_WriteStatArr(MG_EigeneFiguren2, MG_FIGUR_Schaf - 1, 1);
		MEM_WriteStatArr(MG_EigeneFiguren3, MG_FIGUR_Schaf - 1, MyFigurHndl);
	};
	if (PlayerHas_Snapper)
	{
		MyFigurHndl = new(C_MG_SPIELFIGUR@);

		Hero_Snapper = get(MyFigurHndl);

		C_MG_SPIELFIGUR_SetType(Hero_Snapper, MG_FIGUR_Snapper, 0, MyFigurHndl);

		MEM_WriteStatArr(MG_EigeneFiguren2, MG_FIGUR_Snapper - 1, 1);
		MEM_WriteStatArr(MG_EigeneFiguren3, MG_FIGUR_Snapper - 1, MyFigurHndl);
	};
	if (PlayerHas_Goblin)
	{
		MyFigurHndl = new(C_MG_SPIELFIGUR@);

		Hero_Goblin = get(MyFigurHndl);

		C_MG_SPIELFIGUR_SetType(Hero_Goblin, MG_FIGUR_Goblin, 0, MyFigurHndl);

		MEM_WriteStatArr(MG_EigeneFiguren2, MG_FIGUR_Goblin - 1, 1);
		MEM_WriteStatArr(MG_EigeneFiguren3, MG_FIGUR_Goblin - 1, MyFigurHndl);
	};
	if (PlayerHas_Hase)
	{
		MyFigurHndl = new(C_MG_SPIELFIGUR@);

		Hero_Hase = get(MyFigurHndl);

		C_MG_SPIELFIGUR_SetType(Hero_Hase, MG_FIGUR_Hase, 0, MyFigurHndl);

		MEM_WriteStatArr(MG_EigeneFiguren2, MG_FIGUR_Hase - 1, 1);
		MEM_WriteStatArr(MG_EigeneFiguren3, MG_FIGUR_Hase - 1, MyFigurHndl);
	};
	if (PlayerHas_Meatbug)
	{
		MyFigurHndl = new(C_MG_SPIELFIGUR@);

		Hero_Meatbug = get(MyFigurHndl);

		C_MG_SPIELFIGUR_SetType(Hero_Meatbug, MG_FIGUR_Meatbug, 0, MyFigurHndl);

		MEM_WriteStatArr(MG_EigeneFiguren2, MG_FIGUR_Meatbug - 1, 1);
		MEM_WriteStatArr(MG_EigeneFiguren3, MG_FIGUR_Meatbug - 1, MyFigurHndl);
	};
	if (PlayerHas_Balrog)
	{
		MyFigurHndl = new(C_MG_SPIELFIGUR@);

		Hero_Balrog = get(MyFigurHndl);

		C_MG_SPIELFIGUR_SetType(Hero_Balrog, MG_FIGUR_Balrog, 0, MyFigurHndl);

		MEM_WriteStatArr(MG_EigeneFiguren2, MG_FIGUR_Balrog - 1, 1);
		MEM_WriteStatArr(MG_EigeneFiguren3, MG_FIGUR_Balrog - 1, MyFigurHndl);
	};
	if (PlayerHas_Bloodfly)
	{
		MyFigurHndl = new(C_MG_SPIELFIGUR@);

		Hero_Bloodfly = get(MyFigurHndl);

		C_MG_SPIELFIGUR_SetType(Hero_Bloodfly, MG_FIGUR_Bloodfly, 0, MyFigurHndl);

		MEM_WriteStatArr(MG_EigeneFiguren2, MG_FIGUR_Bloodfly - 1, 1);
		MEM_WriteStatArr(MG_EigeneFiguren3, MG_FIGUR_Bloodfly - 1, MyFigurHndl);
	};
	if (PlayerHas_Stoneguardian)
	{
		MyFigurHndl = new(C_MG_SPIELFIGUR@);

		Hero_Stoneguardian = get(MyFigurHndl);

		C_MG_SPIELFIGUR_SetType(Hero_Stoneguardian, MG_FIGUR_Stoneguardian, 0, MyFigurHndl);

		MEM_WriteStatArr(MG_EigeneFiguren2, MG_FIGUR_Stoneguardian - 1, 1);
		MEM_WriteStatArr(MG_EigeneFiguren3, MG_FIGUR_Stoneguardian - 1, MyFigurHndl);
	};
	if (MG_CurrentOpp == MG_GEGNER_RUEDIGER)
	{
		MyFigurHndl = new(C_MG_SPIELFIGUR@);

		Opp_Bloodfly = get(MyFigurHndl);

		C_MG_SPIELFIGUR_SetType(Opp_Bloodfly, MG_FIGUR_Bloodfly, 1, MyFigurHndl);
		MEM_WriteStatArr(MG_GegnerFiguren3, 0, MyFigurHndl);

		MyFigurHndl = new(C_MG_SPIELFIGUR@);

		Opp_Schaf = get(MyFigurHndl);

		C_MG_SPIELFIGUR_SetType(Opp_Schaf, MG_FIGUR_Schaf, 1, MyFigurHndl);
		MEM_WriteStatArr(MG_GegnerFiguren3, 1, MyFigurHndl);

		MyFigurHndl = new(C_MG_SPIELFIGUR@);

		Opp_Hase = get(MyFigurHndl);

		C_MG_SPIELFIGUR_SetType(Opp_Hase, MG_FIGUR_Hase, 1, MyFigurHndl);
		MEM_WriteStatArr(MG_GegnerFiguren3, 2, MyFigurHndl);

		MyFigurHndl = new(C_MG_SPIELFIGUR@);

		Opp_Stoneguardian = get(MyFigurHndl);

		C_MG_SPIELFIGUR_SetType(Opp_Stoneguardian, MG_FIGUR_Stoneguardian, 1, MyFigurHndl);
		MEM_WriteStatArr(MG_GegnerFiguren3, 3, MyFigurHndl);

		MyFigurHndl = new(C_MG_SPIELFIGUR@);

		Opp_Troll = get(MyFigurHndl);

		C_MG_SPIELFIGUR_SetType(Opp_Troll, MG_FIGUR_Troll, 1, MyFigurHndl);
		MEM_WriteStatArr(MG_GegnerFiguren3, 4, MyFigurHndl);
	}
	else if (MG_CurrentOpp == MG_GEGNER_SPIELER_ORLAN)
	{
		MyFigurHndl = new(C_MG_SPIELFIGUR@);

		Opp_Bloodfly = get(MyFigurHndl);

		C_MG_SPIELFIGUR_SetType(Opp_Bloodfly, MG_FIGUR_Bloodfly, 1, MyFigurHndl);
		MEM_WriteStatArr(MG_GegnerFiguren3, 0, MyFigurHndl);

		MyFigurHndl = new(C_MG_SPIELFIGUR@);

		Opp_Schaf = get(MyFigurHndl);

		C_MG_SPIELFIGUR_SetType(Opp_Schaf, MG_FIGUR_Schaf, 1, MyFigurHndl);
		MEM_WriteStatArr(MG_GegnerFiguren3, 1, MyFigurHndl);

		MyFigurHndl = new(C_MG_SPIELFIGUR@);

		Opp_Hase = get(MyFigurHndl);

		C_MG_SPIELFIGUR_SetType(Opp_Hase, MG_FIGUR_Hase, 1, MyFigurHndl);
		MEM_WriteStatArr(MG_GegnerFiguren3, 2, MyFigurHndl);

		MyFigurHndl = new(C_MG_SPIELFIGUR@);

		Opp_Meatbug = get(MyFigurHndl);

		C_MG_SPIELFIGUR_SetType(Opp_Meatbug, MG_FIGUR_Meatbug, 1, MyFigurHndl);
		MEM_WriteStatArr(MG_GegnerFiguren3, 3, MyFigurHndl);

		MyFigurHndl = new(C_MG_SPIELFIGUR@);

		Opp_Snapper = get(MyFigurHndl);

		C_MG_SPIELFIGUR_SetType(Opp_Snapper, MG_FIGUR_Snapper, 1, MyFigurHndl);
		MEM_WriteStatArr(MG_GegnerFiguren3, 4, MyFigurHndl);
	};
};