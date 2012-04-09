FUNC VOID B_Betrunken()
{
	if (Betrunken_Level == 0)
	{
		BetrunkenBei = 4;
	};

	DrinkTimeLast = 0;
	DrinkTime = 0;

	DrinkCounter = 240;

	HatNichtsMehrGetrunken = FALSE;

	if (HatGetrunken >= BetrunkenBei)
	{
		BetrunkenBei += 1;

		NeuBetrunken = 1;

		Betrunken_Level += 1;

		Mod_Betrunken = 1;

		HatGetrunken = 0;
	};
};