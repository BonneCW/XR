FUNC VOID MonsterCounter()
{
	var int l_menge;

	l_menge = ((Monster_Hat * 100)/(Monster_Max));

	if (l_menge <= 1)
	{
		PrintScreen	("l", 1, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 2, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 3, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 4, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 5, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 6, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 7, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 8, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 9, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 10, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 11, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 12, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 13, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 14, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 15, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 16, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 17, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 18, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 19, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 20, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 21, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 6, FONT_Monster, (1+anzeigebeschleuniger));
	}
	else if (l_menge <= 5)
	{
		PrintScreen	("l", 1, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 3, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 4, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 5, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 6, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 7, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 8, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 9, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 10, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 11, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 12, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 13, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 14, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 15, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 16, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 17, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 18, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 19, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 20, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 21, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 6, FONT_Monster, (1+anzeigebeschleuniger));
	}
	else if (l_menge <= (5*2))
	{
		PrintScreen	("l", 1, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 3, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 4, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 5, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 6, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 7, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 8, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 9, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 10, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 11, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 12, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 13, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 14, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 15, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 16, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 17, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 18, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 19, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 20, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 21, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 6, FONT_Monster, (1+anzeigebeschleuniger));
	}
	else if (l_menge <= (5*3))
	{
		PrintScreen	("l", 1, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 3, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 4, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 5, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 6, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 7, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 8, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 9, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 10, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 11, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 12, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 13, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 14, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 15, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 16, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 17, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 18, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 19, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 20, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 21, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 6, FONT_Monster, (1+anzeigebeschleuniger));
	}
	else if (l_menge <= (5*4))
	{
		PrintScreen	("l", 1, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 3, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 4, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 5, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 6, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 7, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 8, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 9, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 10, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 11, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 12, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 13, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 14, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 15, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 16, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 17, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 18, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 19, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 20, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 21, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 6, FONT_Monster, (1+anzeigebeschleuniger));
	}
	else if (l_menge <= (5*5))
	{
		PrintScreen	("l", 1, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 3, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 4, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 5, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 6, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 7, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 8, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 9, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 10, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 11, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 12, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 13, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 14, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 15, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 16, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 17, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 18, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 19, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 20, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 21, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 6, FONT_Monster, (1+anzeigebeschleuniger));
	}
	else if (l_menge <= (5*6))
	{
		PrintScreen	("l", 1, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 3, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 4, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 5, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 6, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 7, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 8, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 9, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 10, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 11, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 12, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 13, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 14, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 15, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 16, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 17, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 18, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 19, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 20, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 21, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 6, FONT_Monster, (1+anzeigebeschleuniger));
	}
	else if (l_menge <= (5*7))
	{
		PrintScreen	("l", 1, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 3, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 4, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 5, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 6, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 7, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 8, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 9, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 10, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 11, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 12, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 13, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 14, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 15, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 16, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 17, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 18, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 19, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 20, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 21, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 6, FONT_Monster, (1+anzeigebeschleuniger));
	}
	else if (l_menge <= (5*8))
	{
		PrintScreen	("l", 1, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 3, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 4, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 5, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 6, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 7, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 8, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 9, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 10, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 11, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 12, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 13, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 14, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 15, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 16, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 17, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 18, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 19, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 20, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 21, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 6, FONT_Monster, (1+anzeigebeschleuniger));
	}
	else if (l_menge <= (5*9))
	{
		PrintScreen	("l", 1, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 3, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 4, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 5, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 6, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 7, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 8, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 9, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 10, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 11, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 12, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 13, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 14, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 15, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 16, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 17, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 18, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 19, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 20, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 21, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 6, FONT_Monster, (1+anzeigebeschleuniger));
	}
	else if (l_menge <= (5*10))
	{
		PrintScreen	("l", 1, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 3, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 4, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 5, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 6, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 7, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 8, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 9, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 10, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 11, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 12, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 13, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 14, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 15, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 16, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 17, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 18, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 19, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 20, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 21, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 6, FONT_Monster, (1+anzeigebeschleuniger));
	}
	else if (l_menge <= (5*11))
	{
		PrintScreen	("l", 1, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 3, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 4, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 5, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 6, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 7, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 8, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 9, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 10, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 11, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 12, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 13, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 14, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 15, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 16, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 17, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 18, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 19, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 20, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 21, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 6, FONT_Monster, (1+anzeigebeschleuniger));
	}
	else if (l_menge <= (5*12))
	{
		PrintScreen	("l", 1, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 3, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 4, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 5, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 6, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 7, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 8, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 9, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 10, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 11, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 12, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 13, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 14, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 15, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 16, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 17, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 18, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 19, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 20, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 21, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 6, FONT_Monster, (1+anzeigebeschleuniger));
	}
	else if (l_menge <= (5*13))
	{
		PrintScreen	("l", 1, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 3, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 4, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 5, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 6, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 7, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 8, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 9, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 10, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 11, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 12, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 13, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 14, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 15, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 16, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 17, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 18, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 19, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 20, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 21, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 6, FONT_Monster, (1+anzeigebeschleuniger));
	}
	else if (l_menge <= (5*14))
	{
		PrintScreen	("l", 1, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 3, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 4, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 5, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 6, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 7, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 8, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 9, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 10, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 11, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 12, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 13, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 14, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 15, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 16, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 17, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 18, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 19, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 20, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 21, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 6, FONT_Monster, (1+anzeigebeschleuniger));
	}
	else if (l_menge <= (5*15))
	{
		PrintScreen	("l", 1, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 3, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 4, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 5, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 6, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 7, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 8, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 9, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 10, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 11, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 12, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 13, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 14, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 15, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 16, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 17, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 18, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 19, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 20, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 21, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 6, FONT_Monster, (1+anzeigebeschleuniger));
	}
	else if (l_menge <= (5*16))
	{
		PrintScreen	("l", 1, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 3, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 4, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 5, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 6, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 7, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 8, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 9, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 10, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 11, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 12, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 13, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 14, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 15, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 16, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 17, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 18, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 19, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 20, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 21, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 6, FONT_Monster, (1+anzeigebeschleuniger));
	}
	else if (l_menge <= (5*17))
	{	
		PrintScreen	("l", 1, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 3, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 4, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 5, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 6, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 7, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 8, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 9, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 10, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 11, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 12, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 13, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 14, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 15, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 16, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 17, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 18, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 19, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 20, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 21, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 6, FONT_Monster, (1+anzeigebeschleuniger));
	}
	else if (l_menge <= (5*18))
	{	
		PrintScreen	("l", 1, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 3, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 4, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 5, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 6, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 7, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 8, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 9, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 10, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 11, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 12, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 13, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 14, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 15, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 16, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 17, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 18, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 19, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 20, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 21, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 6, FONT_Monster, (1+anzeigebeschleuniger));
	}
	else if (l_menge <= (5*19))
	{
		PrintScreen	("l", 1, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 3, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 4, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 5, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 6, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 7, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 8, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 9, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 10, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 11, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 12, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 13, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 14, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 15, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 16, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 17, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 18, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 19, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 20, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("i", 21, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 6, FONT_Monster, (1+anzeigebeschleuniger));
	}
	else if (l_menge <= (5*20))
	{
		PrintScreen	("l", 1, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 3, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 4, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 5, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 6, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 7, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 8, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 9, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 10, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 11, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 12, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 13, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 14, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 15, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 16, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 17, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 18, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 19, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 20, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 21, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 6, FONT_Monster, (1+anzeigebeschleuniger));
	}
	else
	{
		PrintScreen	("l", 1, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 2, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 3, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 4, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 5, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 6, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 7, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 8, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 9, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 10, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 11, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 12, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 13, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 14, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 15, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 16, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 17, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 18, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 19, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 20, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	(".", 21, 6, FONT_Monster, (1+anzeigebeschleuniger));
		PrintScreen	("n", 22, 6, FONT_Monster, (1+anzeigebeschleuniger));
	};
};