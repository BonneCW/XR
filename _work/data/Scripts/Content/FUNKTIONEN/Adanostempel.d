FUNC VOID B_BodenfallenAuslosen (var int Reihe)
{
	var int Randi;

	if (Reihe == 1)
	{
		Randi = r_max(2);

		if (Randi == 0)
		&& (ATFeld01 == 0)
		&& (ATFeld01+ATFeld02+ATFeld03 < 2)
		{
			ATFeld01 = 1;

			B_BodenfallenAuslosen (1);
		}
		else if (Randi == 1)
		&& (ATFeld02 == 0)
		&& (ATFeld01+ATFeld02+ATFeld03 < 2)
		{
			ATFeld02 = 1;

			B_BodenfallenAuslosen (1);
		}
		else if (Randi == 2)
		&& (ATFeld03 == 0)
		&& (ATFeld01+ATFeld02+ATFeld03 < 2)
		{
			ATFeld03 = 1;

			B_BodenfallenAuslosen (1);
		}
		else
		{
			if (ATFeld01 == 1)
			{
				ATFeld04 = 1;
			}
			else if (ATFeld02 == 1)
			{
				ATFeld05 = 1;
			}
			else if (ATFeld03 == 1)
			{
				ATFeld06 = 1;
			};

			B_BodenfallenAuslosen (2);
		};
	}
	else if (Reihe == 2)
	{
		Randi = r_max(2);

		if (Randi == 0)
		&& (ATFeld04 == 0)
		&& (ATFeld04+ATFeld05+ATFeld06 < 2)
		{
			ATFeld04 = 1;

			B_BodenfallenAuslosen (2);
		}
		else if (Randi == 1)
		&& (ATFeld05 == 0)
		&& (ATFeld04+ATFeld05+ATFeld06 < 2)
		{
			ATFeld05 = 1;

			B_BodenfallenAuslosen (2);
		}
		else if (Randi == 2)
		&& (ATFeld06 == 0)
		&& (ATFeld04+ATFeld05+ATFeld06 < 2)
		{
			ATFeld06 = 1;

			B_BodenfallenAuslosen (2);
		}
		else
		{
			if (ATFeld04 == 1)
			{
				ATFeld07 = 1;
			}
			else if (ATFeld05 == 1)
			{
				ATFeld08 = 1;
			}
			else if (ATFeld06 == 1)
			{
				ATFeld09 = 1;
			};

			B_BodenfallenAuslosen (3);
		};
	}
	else if (Reihe == 3)
	{
		Randi = r_max(2);

		if (Randi == 0)
		&& (ATFeld07 == 0)
		&& (ATFeld07+ATFeld08+ATFeld09 < 2)
		{
			ATFeld07 = 1;

			B_BodenfallenAuslosen (3);
		}
		else if (Randi == 1)
		&& (ATFeld08 == 0)
		&& (ATFeld07+ATFeld08+ATFeld09 < 2)
		{
			ATFeld08 = 1;

			B_BodenfallenAuslosen (3);
		}
		else if (Randi == 2)
		&& (ATFeld09 == 0)
		&& (ATFeld07+ATFeld08+ATFeld09 < 2)
		{
			ATFeld09 = 1;

			B_BodenfallenAuslosen (3);
		}
		else
		{
			if (ATFeld07 == 1)
			{
				ATFeld10 = 1;
			}
			else if (ATFeld08 == 1)
			{
				ATFeld11 = 1;
			}
			else if (ATFeld09 == 1)
			{
				ATFeld12 = 1;
			};

			B_BodenfallenAuslosen (4);
		};
	}
	else if (Reihe == 4)
	{
		Randi = r_max(2);

		if (Randi == 0)
		&& (ATFeld10 == 0)
		{
			ATFeld10 = 1;

			B_BodenfallenAuslosen (4);
		}
		else if (Randi == 1)
		&& (ATFeld11 == 0)
		{
			ATFeld11 = 1;

			B_BodenfallenAuslosen (4);
		}
		else if (Randi == 2)
		&& (ATFeld12 == 0)
		{
			ATFeld12 = 1;

			B_BodenfallenAuslosen (4);
		}
		else
		{
			Mod_AdanostempelBodenfalle = 1;
			return;
		};
	};
};

FUNC VOID Adanostempel ()
{
	// Bodenfalle

	if (Mod_AdanostempelBodenfalle == 0)
	{
		B_BodenfallenAuslosen (1);
	};
};

FUNC VOID ATFELD01_FUNC ()
{
	if (ATFeld01 == 0)
	{
		Wld_SendTrigger	("EVT_ADANOS_ROOM03_TRAPPLATE_02");
	};
};

FUNC VOID ATFELD02_FUNC ()
{
	if (ATFeld02 == 0)
	{
		Wld_SendTrigger	("EVT_ADANOS_ROOM03_TRAPPLATE_01");
	};
};

FUNC VOID ATFELD03_FUNC ()
{
	if (ATFeld03 == 0)
	{
		Wld_SendTrigger	("EVT_ADANOS_ROOM03_TRAPPLATE_05");
	};
};

FUNC VOID ATFELD04_FUNC ()
{
	if (ATFeld04 == 0)
	{
		Wld_SendTrigger	("EVT_ADANOS_ROOM03_TRAPPLATE_09");
	};
};

FUNC VOID ATFELD05_FUNC ()
{
	if (ATFeld05 == 0)
	{
		Wld_SendTrigger	("EVT_ADANOS_ROOM03_TRAPPLATE_08");
	};
};

FUNC VOID ATFELD06_FUNC ()
{
	if (ATFeld06 == 0)
	{
		Wld_SendTrigger	("EVT_ADANOS_ROOM03_TRAPPLATE_06");
	};
};

FUNC VOID ATFELD07_FUNC ()
{
	if (ATFeld07 == 0)
	{
		Wld_SendTrigger	("EVT_ADANOS_ROOM03_TRAPPLATE_10");
	};
};

FUNC VOID ATFELD08_FUNC ()
{
	if (ATFeld08 == 0)
	{
		Wld_SendTrigger	("EVT_ADANOS_ROOM03_TRAPPLATE_04");
	};
};

FUNC VOID ATFELD09_FUNC ()
{
	if (ATFeld09 == 0)
	{
		Wld_SendTrigger	("EVT_ADANOS_ROOM03_TRAPPLATE_03");
	};
};

FUNC VOID ATFELD10_FUNC ()
{
	if (ATFeld10 == 0)
	{
		Wld_SendTrigger	("EVT_ADANOS_ROOM03_TRAPPLATE_11");
	};
};

FUNC VOID ATFELD11_FUNC ()
{
	if (ATFeld11 == 0)
	{
		Wld_SendTrigger	("EVT_ADANOS_ROOM03_TRAPPLATE_12");
	};
};

FUNC VOID ATFELD12_FUNC ()
{
	if (ATFeld12 == 0)
	{
		Wld_SendTrigger	("EVT_ADANOS_ROOM03_TRAPPLATE_13");
	};
};