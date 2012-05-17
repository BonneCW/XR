FUNC VOID EVT_GIFTKRATER()
{
	var int GiftChance;

	GiftChance = 0;

	Print ("Gift");

	if (!Npc_IsPlayer(self))
	{
		return;
	};

	if (GGD_Giftkrater_Time == 0)
	{
		// Wahrscheinlichkeit, eine Vergiftung zu erleiden

		if (Gift == 0)
		{
			GiftChance = 100; //100%
		}
		else if (Gift == 1)
		{
			GiftChance = 85; //- 15%
		}
		else if (Gift == 2)
		{
			GiftChance = 72; //nochmal -15% vom Rest
		}
		else if (Gift == 3)
		{
			GiftChance = 61; //nochmal -15% vom Rest
		};

		if (Hlp_Random(100) < GiftChance)
		{
			// Zeit erhöhen

			if (Giftdampf == 0)
			{
				GGD_Giftkrater_Time += 10;
			}
			else if (Giftdampf == 1) // 20% weniger
			{
				GGD_Giftkrater_Time += 8;
			}
			else if (Giftdampf == 2) // 40% weniger
			{
				GGD_Giftkrater_Time += 6;
			}
			else if (Giftdampf == 3) // 60% weniger
			{
				GGD_Giftkrater_Time += 4;
			}
			else if (Giftdampf == 4) // 80% weniger
			{
				GGD_Giftkrater_Time += 2;
			};

			// neuer Schaden

			if (Giftdampf == 0)
			{
				GGD_Giftkrater_Damage = 20;
			}
			else if (Giftdampf == 1) // 10% weniger
			{
				GGD_Giftkrater_Damage = 18;
			}
			else if (Giftdampf == 2) // noch mal 10% weniger
			{
				GGD_Giftkrater_Damage = 16;
			}
			else if (Giftdampf == 3) // und noch mal 10% weniger
			{
				GGD_Giftkrater_Damage = 14;
			}
			else if (Giftdampf == 4) // und noch mal 10% weniger
			{
				GGD_Giftkrater_Damage = 13;
			};
		};
	};
};