// Beste Möglichkeit für Laufwege ermitteln und rucken

FUNC VOID B_MG_WalkToBestPossibility(var C_MG_SPIELFIGUR sf)
{
	PrintDebug ("B_MG_KI: WalkToBestPossibility");

	var int optimum; optimum = -1;
	var int optx; optx = -1;
	var int opty; opty = -1;
	var int optschmiss; optschmiss = -1;
	var int optcounter;

	if (sf.type == MG_FIGUR_TROLL)
	{
		optcounter = -1;
	}
	else
	{
		optcounter = 1000;
	};

	var int x; x = 0;
	var int y; y = 0;

	var int i; i = 0;
	var int ptr; ptr = MEM_StackPos.position;

	if (i < 80)
	{
		if (MEM_ReadStatArr(MG_Spielfeld_Possibilities, i) == 1)
		{
			var int counter; counter = 0;
			var int schmiss; schmiss = 0;

			if (B_MG_FeldBesetzt((sf.owner+1)%2, x, y))
			&& (MEM_ReadStatArr(MG_Spielfeld_Figur, i) != MG_FIGUR_TROLL)
			{
				schmiss = 1;
			};

			var int j; j = 0;
			var int loop; loop = MEM_StackPos.position;

			if (j < 5)
			{
				if (MEM_ReadStatArr(MG_EigeneFiguren, j) > 0)
				{
					var int temp;
					temp = MEM_ReadStatArr(MG_EigeneFiguren, j);

					if (temp == MG_FIGUR_TROLL)
					{
						if (B_MG_CanGoToField(Hero_Troll, x, y))
						{
							counter += 1;
						};
					}
					else if (temp == MG_FIGUR_Minecrawlerqueen)
					{
						if (B_MG_CanGoToField(Hero_Minecrawlerqueen, x, y))
						{
							counter += 1;
						};
					}
					else if (temp == MG_FIGUR_Schaf)
					{
						if (B_MG_CanGoToField(Hero_Schaf, x, y))
						{
							counter += 1;
						};
					}
					else if (temp == MG_FIGUR_Hase)
					{
						if (B_MG_CanGoToField(Hero_Hase, x, y))
						{
							counter += 1;
						};
					}
					else if (temp == MG_FIGUR_Meatbug)
					{
						if (B_MG_CanGoToField(Hero_Meatbug, x, y))
						{
							if (sf.type == MG_FIGUR_MEATBUG) // Nur Fleischwanze muss vor meinen Fleischwanzen Angst haben
							{
								counter += 1;
							};
						};
					}
					else if (temp == MG_FIGUR_Bloodfly)
					{
						if (B_MG_CanGoToField(Hero_Bloodfly, x, y))
						{
							counter += 1;
						};
					}
					else if (temp == MG_FIGUR_Stoneguardian)
					{
						if (B_MG_CanGoToField(Hero_Stoneguardian, x, y))
						{
							counter += 1;
						};
					}
					else if (temp == MG_FIGUR_Snapper)
					{
						if (B_MG_CanGoToField(Hero_Snapper, x, y)) // Snapper überspringt zwei Felder, die müssen gecheckt werden
						|| (B_MG_CanGoToField(Hero_Snapper, x, y-1))
						|| (B_MG_CanGoToField(Hero_Snapper, x, y-2))
						{
							counter += 1;
						};
					}
					else if (temp == MG_FIGUR_Balrog)
					{
						if (B_MG_CanGoToField(Hero_Balrog, x, y)) // Balrog auch links und rechts checken
						|| (B_MG_CanGoToField(Hero_Balrog, x+1, y))
						|| (B_MG_CanGoToField(Hero_Balrog, x-1, y))
						{
							counter += 1;
						};
					}
					else if (temp == MG_FIGUR_Goblin)
					{
						if (B_MG_CanGoToField(Hero_Goblin, x, y))
						{
							counter += 1;
						};
					};
				};

				j += 1;

				MEM_StackPos.position = loop;
			};

			if (counter < optcounter)
			&& (sf.type != MG_FIGUR_TROLL)
			{
				if ((counter > 0) || (y > opty))
				{
					optimum = i;
					optx = x;
					opty = y;
					optcounter = counter;
					optschmiss = schmiss;
				};
			}
			else if (counter == optcounter)
			&& (sf.type != MG_FIGUR_TROLL)
			{
				if (schmiss > optschmiss)
				{
					optimum = i;
					optx = x;
					opty = y;
					optcounter = counter;
					optschmiss = schmiss;
				}
				else if ((schmiss == optschmiss) && (y > opty))
				{
					optimum = i;
					optx = x;
					opty = y;
					optcounter = counter;
					optschmiss = schmiss;
				};
			}
			else if (counter >= optcounter)
			&& (sf.type == MG_FIGUR_TROLL)
			{
				if ((counter > 0) || (y > opty))
				{
					optimum = i;
					optx = x;
					opty = y;
					optcounter = counter;
					optschmiss = schmiss;
				};
			};
		};

		x += 1;

		if (x >= 8)
		{
			x = 0;
			y += 1;
		};

		i += 1;

		MEM_StackPos.position = ptr;
	};

	C_MG_SPIELFIGUR_WalkToField(sf, optimum);

	PrintDebug ("B_MG_KI: WalkToBestPossibility Ende");
};