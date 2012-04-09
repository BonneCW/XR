FUNC VOID Ausdauerbalken()
{
	var int l_menge;

	if (Sprint_Ausdauer_MAX > 0)
	{
		l_menge = (Sprint_Ausdauer * 100)/(Sprint_Ausdauer_MAX);
	};

	if (l_menge <= 1)
	{
		PrintScreen	("l", 1, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 2, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 3, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 4, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 5, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 6, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 7, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 8, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 9, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 10, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 11, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 12, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 13, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 14, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 15, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 16, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 17, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 18, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 19, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 20, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 21, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
	}
	else if (l_menge <= 5)
	{
		PrintScreen	("l", 1, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 3, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 4, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 5, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 6, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 7, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 8, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 9, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 10, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 11, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 12, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 13, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 14, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 15, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 16, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 17, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 18, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 19, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 20, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 21, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
	}
	else if (l_menge <= (5*2))
	{
		PrintScreen	("l", 1, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 3, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 4, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 5, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 6, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 7, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 8, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 9, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 10, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 11, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 12, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 13, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 14, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 15, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 16, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 17, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 18, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 19, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 20, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 21, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
	}
	else if (l_menge <= (5*3))
	{
		PrintScreen	("l", 1, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 3, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 4, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 5, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 6, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 7, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 8, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 9, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 10, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 11, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 12, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 13, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 14, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 15, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 16, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 17, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 18, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 19, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 20, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 21, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
	}
	else if (l_menge <= (5*4))
	{
		PrintScreen	("l", 1, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 3, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 4, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 5, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 6, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 7, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 8, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 9, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 10, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 11, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 12, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 13, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 14, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 15, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 16, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 17, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 18, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 19, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 20, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 21, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
	}
	else if (l_menge <= (5*5))
	{
		PrintScreen	("l", 1, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 3, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 4, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 5, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 6, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 7, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 8, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 9, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 10, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 11, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 12, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 13, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 14, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 15, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 16, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 17, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 18, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 19, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 20, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 21, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
	}
	else if (l_menge <= (5*6))
	{
		PrintScreen	("l", 1, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 3, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 4, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 5, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 6, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 7, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 8, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 9, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 10, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 11, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 12, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 13, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 14, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 15, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 16, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 17, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 18, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 19, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 20, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 21, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
	}
	else if (l_menge <= (5*7))
	{
		PrintScreen	("l", 1, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 3, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 4, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 5, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 6, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 7, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 8, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 9, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 10, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 11, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 12, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 13, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 14, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 15, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 16, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 17, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 18, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 19, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 20, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 21, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
	}
	else if (l_menge <= (5*8))
	{
		PrintScreen	("l", 1, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 3, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 4, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 5, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 6, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 7, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 8, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 9, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 10, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 11, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 12, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 13, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 14, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 15, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 16, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 17, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 18, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 19, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 20, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 21, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
	}
	else if (l_menge <= (5*9))
	{
		PrintScreen	("l", 1, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 3, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 4, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 5, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 6, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 7, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 8, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 9, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 10, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 11, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 12, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 13, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 14, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 15, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 16, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 17, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 18, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 19, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 20, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 21, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
	}
	else if (l_menge <= (5*10))
	{
		PrintScreen	("l", 1, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 3, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 4, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 5, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 6, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 7, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 8, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 9, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 10, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 11, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 12, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 13, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 14, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 15, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 16, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 17, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 18, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 19, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 20, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 21, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
	}
	else if (l_menge <= (5*11))
	{
		PrintScreen	("l", 1, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 3, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 4, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 5, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 6, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 7, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 8, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 9, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 10, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 11, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 12, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 13, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 14, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 15, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 16, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 17, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 18, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 19, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 20, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 21, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
	}
	else if (l_menge <= (5*12))
	{
		PrintScreen	("l", 1, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 3, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 4, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 5, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 6, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 7, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 8, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 9, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 10, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 11, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 12, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 13, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 14, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 15, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 16, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 17, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 18, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 19, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 20, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 21, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
	}
	else if (l_menge <= (5*13))
	{
		PrintScreen	("l", 1, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 3, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 4, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 5, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 6, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 7, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 8, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 9, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 10, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 11, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 12, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 13, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 14, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 15, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 16, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 17, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 18, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 19, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 20, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 21, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
	}
	else if (l_menge <= (5*14))
	{
		PrintScreen	("l", 1, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 3, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 4, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 5, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 6, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 7, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 8, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 9, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 10, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 11, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 12, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 13, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 14, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 15, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 16, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 17, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 18, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 19, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 20, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 21, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
	}
	else if (l_menge <= (5*15))
	{
		PrintScreen	("l", 1, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 3, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 4, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 5, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 6, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 7, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 8, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 9, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 10, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 11, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 12, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 13, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 14, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 15, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 16, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 17, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 18, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 19, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 20, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 21, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
	}
	else if (l_menge <= (5*16))
	{
		PrintScreen	("l", 1, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 3, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 4, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 5, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 6, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 7, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 8, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 9, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 10, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 11, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 12, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 13, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 14, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 15, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 16, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 17, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 18, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 19, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 20, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 21, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
	}
	else if (l_menge <= (5*17))
	{	
		PrintScreen	("l", 1, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 3, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 4, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 5, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 6, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 7, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 8, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 9, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 10, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 11, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 12, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 13, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 14, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 15, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 16, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 17, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 18, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 19, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 20, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 21, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
	}
	else if (l_menge <= (5*18))
	{	
		PrintScreen	("l", 1, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 3, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 4, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 5, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 6, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 7, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 8, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 9, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 10, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 11, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 12, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 13, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 14, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 15, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 16, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 17, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 18, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 19, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 20, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 21, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
	}
	else if (l_menge <= (5*19))
	{
		PrintScreen	("l", 1, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 3, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 4, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 5, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 6, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 7, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 8, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 9, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 10, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 11, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 12, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 13, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 14, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 15, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 16, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 17, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 18, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 19, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 20, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("i", 21, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
	}
	else if (l_menge <= (5*20))
	{
		PrintScreen	("l", 1, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 3, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 4, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 5, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 6, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 7, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 8, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 9, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 10, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 11, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 12, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 13, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 14, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 15, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 16, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 17, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 18, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 19, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 20, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 21, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
	}
	else
	{
		PrintScreen	("l", 1, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 3, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 4, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 5, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 6, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 7, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 8, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 9, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 10, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 11, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 12, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 13, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 14, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 15, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 16, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 17, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 18, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 19, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 20, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	(".", 21, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 10, FONT_Ausdauer, (1+anzeigebeschleuniger));
	};
};