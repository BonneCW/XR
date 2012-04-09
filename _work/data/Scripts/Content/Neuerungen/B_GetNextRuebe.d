FUNC VOID B_GetNextRuebe()
{
	var int Randi;
	Randi = Hlp_Random(20);

	if (Randi == 0)
	&& (LobartsRuebe01 == 0)
	{
		NextRuebe = 1;
	}
	else if (Randi == 1)
	&& (LobartsRuebe02 == 0)
	{
		NextRuebe = 2;
	}
	else if (Randi == 2)
	&& (LobartsRuebe03 == 0)
	{
		NextRuebe = 3;
	}
	else if (Randi == 3)
	&& (LobartsRuebe04 == 0)
	{
		NextRuebe = 4;
	}
	else if (Randi == 4)
	&& (LobartsRuebe05 == 0)
	{
		NextRuebe = 5;
	}
	else if (Randi == 5)
	&& (LobartsRuebe06 == 0)
	{
		NextRuebe = 6;
	}
	else if (Randi == 6)
	&& (LobartsRuebe07 == 0)
	{
		NextRuebe = 7;
	}
	else if (Randi == 7)
	&& (LobartsRuebe08 == 0)
	{
		NextRuebe = 8;
	}
	else if (Randi == 8)
	&& (LobartsRuebe09 == 0)
	{
		NextRuebe = 9;
	}
	else if (Randi == 9)
	&& (LobartsRuebe10 == 0)
	{
		NextRuebe = 10;
	}
	else if (Randi == 10)
	&& (LobartsRuebe11 == 0)
	{
		NextRuebe = 11;
	}
	else if (Randi == 11)
	&& (LobartsRuebe12 == 0)
	{
		NextRuebe = 12;
	}
	else if (Randi == 12)
	&& (LobartsRuebe13 == 0)
	{
		NextRuebe = 13;
	}
	else if (Randi == 13)
	&& (LobartsRuebe14 == 0)
	{
		NextRuebe = 14;
	}
	else if (Randi == 14)
	&& (LobartsRuebe15 == 0)
	{
		NextRuebe = 15;
	}
	else if (Randi == 15)
	&& (LobartsRuebe16 == 0)
	{
		NextRuebe = 16;
	}
	else if (Randi == 16)
	&& (LobartsRuebe17 == 0)
	{
		NextRuebe = 17;
	}
	else if (Randi == 17)
	&& (LobartsRuebe18 == 0)
	{
		NextRuebe = 18;
	}
	else if (Randi == 18)
	&& (LobartsRuebe19 == 0)
	{
		NextRuebe = 19;
	}
	else if (Randi == 19)
	&& (LobartsRuebe20 == 0)
	{
		NextRuebe = 20;
	}
	else
	{
		B_GetNextRuebe();
	};
};