FUNC VOID SlowMotion()
{
	var int l_menge;
	l_menge= (slowmotiontime_max/20);

	if (slowmotiontime <=1)
	{
		PrintScreen	("l", 70, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 71, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 72, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 73, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 74, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 75, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 76, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 77, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 78, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 79, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 80, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 81, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 82, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 83, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 84, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 85, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 86, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 87, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 88, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 89, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 90, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("n", 91, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
	}
	else if (slowmotiontime <= l_menge)
	{
		PrintScreen	("l", 70, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 71, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 72, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 73, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 74, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 75, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 76, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 77, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 78, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 79, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 80, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 81, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 82, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 83, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 84, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 85, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 86, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 87, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 88, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 89, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 90, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("n", 91, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
	}
	else if (slowmotiontime <= (l_menge*2))
	{
		PrintScreen	("l", 70, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 71, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 72, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 73, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 74, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 75, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 76, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 77, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 78, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 79, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 80, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 81, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 82, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 83, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 84, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 85, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 86, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 87, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 88, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 89, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 90, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("n", 91, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
	}
	else if (slowmotiontime <= (l_menge*3))
	{
		PrintScreen	("l", 70, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 71, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 72, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 73, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 74, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 75, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 76, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 77, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 78, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 79, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 80, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 81, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 82, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 83, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 84, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 85, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 86, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 87, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 88, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 89, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 90, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("n", 91, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
	}
	else if (slowmotiontime <= (l_menge*4))
	{
		PrintScreen	("l", 70, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 71, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 72, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 73, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 74, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 75, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 76, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 77, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 78, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 79, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 80, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 81, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 82, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 83, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 84, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 85, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 86, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 87, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 88, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 89, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 90, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("n", 91, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
	}
	else if (slowmotiontime <= (l_menge*5))
	{
		PrintScreen	("l", 70, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 71, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 72, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 73, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 74, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 75, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 76, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 77, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 78, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 79, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 80, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 81, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 82, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 83, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 84, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 85, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 86, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 87, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 88, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 89, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 90, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("n", 91, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
	}
	else if (slowmotiontime <= (l_menge*6))
	{
		PrintScreen	("l", 70, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 71, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 72, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 73, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 74, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 75, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 76, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 77, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 78, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 79, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 80, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 81, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 82, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 83, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 84, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 85, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 86, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 87, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 88, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 89, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 90, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("n", 91, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
	}
	else if (slowmotiontime <= (l_menge*7))
	{
		PrintScreen	("l", 70, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 71, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 72, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 73, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 74, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 75, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 76, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 77, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 78, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 79, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 80, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 81, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 82, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 83, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 84, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 85, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 86, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 87, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 88, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 89, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 90, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("n", 91, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
	}
	else if (slowmotiontime <= (l_menge*8))
	{
		PrintScreen	("l", 70, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 71, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 72, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 73, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 74, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 75, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 76, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 77, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 78, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 79, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 80, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 81, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 82, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 83, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 84, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 85, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 86, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 87, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 88, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 89, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 90, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("n", 91, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
	}
	else if (slowmotiontime <= (l_menge*9))
	{
		PrintScreen	("l", 70, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 71, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 72, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 73, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 74, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 75, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 76, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 77, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 78, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 79, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 80, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 81, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 82, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 83, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 84, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 85, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 86, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 87, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 88, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 89, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 90, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("n", 91, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
	}
	else if (slowmotiontime <= (l_menge*10))
	{
		PrintScreen	("l", 70, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 71, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 72, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 73, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 74, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 75, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 76, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 77, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 78, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 79, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 80, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 81, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 82, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 83, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 84, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 85, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 86, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 87, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 88, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 89, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 90, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("n", 91, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
	}
	else if (slowmotiontime <= (l_menge*11))
	{
		PrintScreen	("l", 70, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 71, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 72, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 73, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 74, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 75, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 76, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 77, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 78, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 79, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 80, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 81, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 82, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 83, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 84, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 85, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 86, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 87, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 88, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 89, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 90, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("n", 91, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
	}
	else if (slowmotiontime <= (l_menge*12))
	{
		PrintScreen	("l", 70, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 71, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 72, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 73, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 74, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 75, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 76, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 77, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 78, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 79, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 80, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 81, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 82, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 83, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 84, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 85, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 86, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 87, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 88, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 89, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 90, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("n", 91, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
	}
	else if (slowmotiontime <= (l_menge*13))
	{
		PrintScreen	("l", 70, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 71, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 72, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 73, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 74, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 75, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 76, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 77, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 78, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 79, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 80, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 81, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 82, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 83, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 84, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 85, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 86, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 87, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 88, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 89, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 90, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("n", 91, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
	}
	else if (slowmotiontime <= (l_menge*14))
	{
		PrintScreen	("l", 70, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 71, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 72, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 73, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 74, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 75, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 76, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 77, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 78, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 79, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 80, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 81, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 82, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 83, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 84, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 85, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 86, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 87, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 88, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 89, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 90, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("n", 91, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
	}
	else if (slowmotiontime <= (l_menge*15))
	{
		PrintScreen	("l", 70, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 71, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 72, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 73, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 74, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 75, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 76, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 77, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 78, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 79, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 80, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 81, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 82, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 83, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 84, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 85, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 86, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 87, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 88, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 89, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 90, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("n", 91, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
	}
	else if (slowmotiontime <= (l_menge*16))
	{
		PrintScreen	("l", 70, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 71, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 72, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 73, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 74, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 75, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 76, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 77, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 78, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 79, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 80, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 81, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 82, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 83, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 84, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 85, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 86, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 87, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 88, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 89, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 90, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("n", 91, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
	}
	else if (slowmotiontime <= (l_menge*17))
	{	
		PrintScreen	("l", 70, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 71, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 72, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 73, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 74, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 75, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 76, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 77, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 78, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 79, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 80, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 81, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 82, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 83, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 84, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 85, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 86, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 87, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 88, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 89, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 90, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("n", 91, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
	}
	else if (slowmotiontime <= (l_menge*18))
	{	
		PrintScreen	("l", 70, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 71, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 72, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 73, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 74, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 75, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 76, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 77, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 78, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 79, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 80, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 81, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 82, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 83, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 84, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 85, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 86, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 87, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 88, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 89, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 90, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("n", 91, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
	}
	else if (slowmotiontime <= (l_menge*19))
	{
		PrintScreen	("l", 70, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 71, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 72, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 73, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 74, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 75, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 76, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 77, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 78, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 79, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 80, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 81, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 82, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 83, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 84, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 85, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 86, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 87, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 88, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 89, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("i", 90, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("n", 91, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
	}
	else if (slowmotiontime <= (l_menge*20))
	{
		PrintScreen	("l", 70, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 71, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 72, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 73, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 74, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 75, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 76, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 77, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 78, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 79, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 80, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 81, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 82, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 83, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 84, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 85, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 86, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 87, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 88, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 89, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 90, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("n", 91, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
	}
	else
	{
		PrintScreen	("l", 70, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 71, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 72, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 73, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 74, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 75, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 76, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 77, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 78, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 79, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 80, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 81, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 82, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 83, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 84, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 85, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 86, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 87, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 88, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 89, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	(".", 90, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
		PrintScreen	("n", 91, 3, FONT_slowm, (1+anzeigebeschleuniger+Slowmotionbonus));
	};
};