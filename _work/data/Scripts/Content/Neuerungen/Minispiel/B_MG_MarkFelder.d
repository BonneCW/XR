FUNC VOID B_MG_MarkFeld(var int x, var int y)
{
	var int ptr;
	ptr = MEM_ReadStatArr(MG_Spielfeld_Texturen, x+y*8);

	View_SetTexture (ptr, "MG_SPIELFELD_MARKIERT.TGA");
};

FUNC VOID B_MG_MarkFelder ()
{
	// Koordinaten ermitteln???

	var int x;
	var int y;

	x = 0;
	y = 0;

	var int i; i = 0;

	var int ptr; ptr = MEM_StackPos.position;

	if (i < 80)
	{
		if (MEM_ReadStatArr(MG_Spielfeld_Possibilities, i) == 1)
		{
			B_MG_MarkFeld(x, y);
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
};

FUNC VOID B_MG_MarkStartReihe ()
{
	// Koordinaten ermitteln???

	var int x;
	var int y;

	x = 0;
	y = 8;

	var int i; i = 64;

	var int ptr; ptr = MEM_StackPos.position;

	if (i < 72)
	{
		if (!B_MG_FeldBesetzt(0, x, y))
		{
			B_MG_MarkFeld(x, y);
		};

		x += 1;

		i += 1;

		MEM_StackPos.position = ptr;
	};
};

FUNC VOID B_MG_ResetStartReihe ()
{
	// Koordinaten ermitteln???

	var int x;
	var int y;

	x = 0;
	y = 8;

	var int i; i = 64;

	var int ptr; ptr = MEM_StackPos.position;

	if (i < 72)
	{
		var int ptr2;
		ptr2 = MEM_ReadStatArr(MG_Spielfeld_Texturen, x+y*8);

		View_SetTexture (ptr2, "MG_SPIELFELD.TGA");

		x += 1;

		i += 1;

		MEM_StackPos.position = ptr;
	};
};

FUNC VOID B_MG_ResetFelder ()
{
	// Koordinaten ermitteln???

	var int x;
	var int y;

	x = 0;
	y = 0;

	var int i; i = 0;

	var int ptr; ptr = MEM_StackPos.position;

	if (i < 80)
	{
		if (MEM_ReadStatArr(MG_Spielfeld_Possibilities, i) == 1)
		{
			var int ptr2;
			ptr2 = MEM_ReadStatArr(MG_Spielfeld_Texturen, x+y*8);

			if (i < 8) || (i >= 72)
			{
				View_SetTexture (ptr2, "MG_SPIELFELD_ZIEL.TGA");
			}
			else
			{
				View_SetTexture (ptr2, "MG_SPIELFELD.TGA");
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
};

FUNC VOID B_MG_SetPossibility(var int x, var int y)
{
	MEM_WriteStatArr(MG_Spielfeld_Possibilities, x+8*y, 1);
};

FUNC VOID B_MG_SetPossibilities (var C_MG_SPIELFIGUR sf)
{
	PrintDebug ("B_MG_KI: SetPossibilities");

	var int i; i = 0;

	var int ptr; ptr = MEM_StackPos.position;

	if (i < 80)
	{
		MEM_WriteStatArr(MG_Spielfeld_Possibilities, i, 0);

		i += 1;

		MEM_StackPos.position = ptr;
	};

	// Koordinaten ermitteln???

	var int x;
	var int y;

	y = sf.field/8;
	x = sf.field-(sf.field/8)*8;

	if (sf.front > 0)
	{
		if (sf.owner == 0)
		{
			if (y+sf.direction*sf.front < 9)
			&& (y+sf.direction*sf.front >= 0)
			&& (!B_MG_FeldBesetzt(sf.owner, x, y+sf.direction*sf.front))
			{
				B_MG_SetPossibility (x, y+sf.direction*sf.front);
			};

			if (sf.type == MG_FIGUR_HASE)
			|| (sf.type == MG_FIGUR_MEATBUG)
			{
				if (y+sf.direction*(sf.front+1) < 9)
				&& (y+sf.direction*(sf.front+1) >= 0)
				&& (!B_MG_FeldBesetzt(sf.owner, x, y+sf.direction*(sf.front+1)))
				{
					B_MG_SetPossibility (x, y+sf.direction*(sf.front+1));
				};
			};

			if (sf.type == MG_FIGUR_SNAPPER)
			{
				if (y-sf.front < 0)
				{
					B_MG_SetPossibility (x, 0);
				};
			};
		}
		else if (sf.owner == 1)
		{
			if (y+sf.direction*sf.front < 10)
			&& (y+sf.direction*sf.front >= 1)
			&& (!B_MG_FeldBesetzt(sf.owner, x, y+sf.direction*sf.front))
			{
				B_MG_SetPossibility (x, y+sf.direction*sf.front);
			};

			if (sf.type == MG_FIGUR_HASE)
			|| (sf.type == MG_FIGUR_MEATBUG)
			{
				if (y+sf.direction*(sf.front+1) < 10)
				&& (y+sf.direction*(sf.front+1) >= 1)
				&& (!B_MG_FeldBesetzt(sf.owner, x, y+sf.direction*(sf.front+1)))
				{
					B_MG_SetPossibility (x, y+sf.direction*(sf.front+1));
				};
			};

			if (sf.type == MG_FIGUR_SNAPPER)
			{
				if (y+sf.front >= 10)
				{
					B_MG_SetPossibility (x, 9);
				};
			};
		};
	};
	if (sf.back > 0)
	{
		if (sf.owner == 0)
		{
			if (y-sf.direction*sf.back < 9)
			&& (y-sf.direction*sf.back >= 0)
			&& (!B_MG_FeldBesetzt(sf.owner, x, y-sf.direction*sf.back))
			{
				B_MG_SetPossibility (x, y-sf.direction*sf.back);
			};

			if (sf.type == MG_FIGUR_SCHAF)
			{
				if (y-sf.direction*(sf.back+1) < 9)
				&& (y-sf.direction*(sf.back+1) >= 0)
				&& (!B_MG_FeldBesetzt(sf.owner, x, y-sf.direction*(sf.back+1)))
				{
					B_MG_SetPossibility (x, y-sf.direction*(sf.back+1));
				};
				if (y-sf.direction*(sf.back+2) < 9)
				&& (y-sf.direction*(sf.back+2) >= 0)
				&& (!B_MG_FeldBesetzt(sf.owner, x, y-sf.direction*(sf.back+2)))
				{
					B_MG_SetPossibility (x, y-sf.direction*(sf.back+2));
				};
			};

			if (sf.type == MG_FIGUR_MEATBUG)
			{
				if (y-sf.direction*sf.back+1 < 9)
				&& (y-sf.direction*sf.back+1 >= 0)
				&& (!B_MG_FeldBesetzt(sf.owner, x, y-sf.direction*(sf.back+1)))
				{
					B_MG_SetPossibility (x, y-sf.direction*(sf.back+1));
				};
			};
		}
		else if (sf.owner == 1)
		{
			if (y-sf.direction*sf.back < 10)
			&& (y-sf.direction*sf.back >= 1)
			&& (!B_MG_FeldBesetzt(sf.owner, x, y-sf.direction*sf.back))
			{
				B_MG_SetPossibility (x, y-sf.direction*sf.back);
			};

			if (sf.type == MG_FIGUR_SCHAF)
			{
				if (y-sf.direction*(sf.back+1) < 10)
				&& (y-sf.direction*(sf.back+1) >= 1)
				&& (!B_MG_FeldBesetzt(sf.owner, x, y-sf.direction*(sf.back+1)))
				{
					B_MG_SetPossibility (x, y-sf.direction*(sf.back+1));
				};
				if (y-sf.direction*(sf.back+2) < 10)
				&& (y-sf.direction*(sf.back+2) >= 1)
				&& (!B_MG_FeldBesetzt(sf.owner, x, y-sf.direction*(sf.back+2)))
				{
					B_MG_SetPossibility (x, y-sf.direction*(sf.back+2));
				};
			};

			if (sf.type == MG_FIGUR_MEATBUG)
			{
				if (y-sf.direction*sf.back+1 < 10)
				&& (y-sf.direction*sf.back+1 >= 1)
				&& (!B_MG_FeldBesetzt(sf.owner, x, y-sf.direction*(sf.back+1)))
				{
					B_MG_SetPossibility (x, y-sf.direction*(sf.back+1));
				};
			};
		};
	};
	if (sf.left > 0)
	{
		if (x-sf.direction*sf.left < 8)
		&& (x-sf.direction*sf.left >= 0)
		&& (!B_MG_FeldBesetzt(sf.owner, x-sf.direction*sf.left, y))
		{
			B_MG_SetPossibility (x-sf.direction*sf.left, y);
		};

		if (sf.type == MG_FIGUR_HASE)
		|| (sf.type == MG_FIGUR_MEATBUG)
		{
			if (x-sf.direction*(sf.left+1) < 8)
			&& (x-sf.direction*(sf.left+1) >= 0)
			&& (!B_MG_FeldBesetzt(sf.owner, x-sf.direction*(sf.left+1), y))
			{
				B_MG_SetPossibility (x-sf.direction*(sf.left+1), y);
			};
		};
	};
	if (sf.right > 0)
	{
		if (x+sf.direction*sf.right < 8)
		&& (x+sf.direction*sf.right >= 0)
		&& (!B_MG_FeldBesetzt(sf.owner, x+sf.direction*sf.right, y))
		{
			B_MG_SetPossibility (x+sf.direction*sf.right, y);
		};

		if (sf.type == MG_FIGUR_HASE)
		|| (sf.type == MG_FIGUR_MEATBUG)
		{
			if (x+sf.direction*(sf.right+1) < 8)
			&& (x+sf.direction*(sf.right+1) >= 0)
			&& (!B_MG_FeldBesetzt(sf.owner, x+sf.direction*(sf.right+1), y))
			{
				B_MG_SetPossibility (x+sf.direction*(sf.right+1), y);
			};
		};
	};

	if (sf.type == MG_FIGUR_BLOODFLY)
	{
		if (sf.owner == 1)
		{
			if (x+1 < 8)
			&& (y+1 < 10)
			&& (!B_MG_FeldBesetzt(sf.owner, x+1, y+1))
			{
				B_MG_SetPossibility (x+1, y+1);
			};
			if (x-1 >= 0)
			&& (y+1 < 10)
			&& (!B_MG_FeldBesetzt(sf.owner, x-1, y+1))
			{
				B_MG_SetPossibility (x-1, y+1);
			};
			if (x+1 < 8)
			&& (y-1 >= 1)
			&& (!B_MG_FeldBesetzt(sf.owner, x+1, y-1))
			{
				B_MG_SetPossibility (x+1, y-1);
			};
			if (x-1 >= 0)
			&& (y-1 >= 1)
			&& (!B_MG_FeldBesetzt(sf.owner, x-1, y-1))
			{
				B_MG_SetPossibility (x-1, y-1);
			};
		}
		else if (sf.owner == 0)
		{
			if (x+1 < 8)
			&& (y+1 < 9)
			&& (!B_MG_FeldBesetzt(sf.owner, x+1, y+1))
			{
				B_MG_SetPossibility (x+1, y+1);
			};
			if (x-1 >= 0)
			&& (y+1 < 9)
			&& (!B_MG_FeldBesetzt(sf.owner, x-1, y+1))
			{
				B_MG_SetPossibility (x-1, y+1);
			};
			if (x+1 < 8)
			&& (y-1 >= 0)
			&& (!B_MG_FeldBesetzt(sf.owner, x+1, y-1))
			{
				B_MG_SetPossibility (x+1, y-1);
			};
			if (x-1 >= 0)
			&& (y-1 >= 0)
			&& (!B_MG_FeldBesetzt(sf.owner, x-1, y-1))
			{
				B_MG_SetPossibility (x-1, y-1);
			};
		};
	};

	PrintDebug ("B_MG_KI: SetPossibilities Ende");
};

FUNC INT B_MG_GetPossibilities ()
{
	PrintDebug ("B_MG_KI: GetPossibilities");

	var int counter; counter = 0;
	var int i; i = 0;

	var int ptr; ptr = MEM_StackPos.position;

	if (i < 80)
	{
		if (MEM_ReadStatArr(MG_Spielfeld_Possibilities, i) == 1)
		{
			counter += 1;
		};

		i += 1;

		MEM_StackPos.position = ptr;
	};

	PrintDebug ("B_MG_KI: GetPossibilities Ende");

	PrintDebug (ConcatStrings("B_MG_KI: GetPossibilities Ende", IntToString(counter)));

	return counter;
};

FUNC INT B_MG_CanGoToField (var C_MG_SPIELFIGUR sf, var int x2, var int y2)
{
	var int x;
	var int y;

	y = sf.field/8;
	x = sf.field-(sf.field/8)*8;

	if (sf.front > 0)
	{
		if (y+sf.direction*sf.front == y2)
		&& (x == x2)
		{
			return TRUE;
		};

		if (sf.type == MG_FIGUR_HASE)
		|| (sf.type == MG_FIGUR_MEATBUG)
		{
			if (y+sf.direction*(sf.front+1) == y2)
			&& (x == x2)
			{
				return TRUE;
			};
		};
	};
	if (sf.back > 0)
	{
		if (y-sf.direction*sf.back == y2)
		&& (x == x2)
		{
			return TRUE;
		};

		if (sf.type == MG_FIGUR_SCHAF)
		{
			if (y-sf.direction*(sf.back+1) == y2)
			&& (x == x2)
			{
				return TRUE;
			};
			if (y-sf.direction*(sf.back+2) == y2)
			&& (x == x2)
			{
				return TRUE;
			};
		};

		if (sf.type == MG_FIGUR_MEATBUG)
		{
			if (y-sf.direction*(sf.back+1) == y2)
			&& (x == x2)
			{
				return TRUE;
			};
		};
	};
	if (sf.left > 0)
	{
		if (x-sf.direction*sf.left == x2)
		&& (y == y2)
		{
			return TRUE;
		};

		if (sf.type == MG_FIGUR_HASE)
		|| (sf.type == MG_FIGUR_MEATBUG)
		{
			if (x-sf.direction*(sf.left+1) == x2)
			&& (y == y2)
			{
				return TRUE;
			};
		};
	};
	if (sf.right > 0)
	{
		if (x+sf.direction*sf.right == x2)
		&& (y == y2)
		{
			return TRUE;
		};

		if (sf.type == MG_FIGUR_HASE)
		|| (sf.type == MG_FIGUR_MEATBUG)
		{
			if (x+sf.direction*(sf.right+1) == x2)
			&& (y == y2)
			{
				return TRUE;
			};
		};
	};

	if (sf.type == MG_FIGUR_BLOODFLY)
	{
		if (x+1 == x2)
		&& (y+1 == y2)
		{
			return TRUE;
		};
		if (x+1 == x2)
		&& (y-1 == y2)
		{
			return TRUE;
		};
		if (x-1 == x2)
		&& (y+1 == y2)
		{
			return TRUE;
		};
		if (x-1 == x2)
		&& (y-1 == y2)
		{
			return TRUE;
		};
	};

	return FALSE;
};