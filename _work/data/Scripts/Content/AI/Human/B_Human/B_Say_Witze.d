var int Mod_Smalltalk_Witze;
var int Mod_Smalltalk_Witze_Randi;
var C_NPC Witzer01;
var C_NPC Witzer02;

FUNC VOID B_Say_Smalltalk_Witze ()
{
	if (Mod_Smalltalk_Witze_Randi == 0)
	{
		Mod_Smalltalk_Witze_Randi = Hlp_Random(10)+1;

		Mod_Smalltalk_Witze = 0;
	};

	// Zuweisen der NPCs

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1301_SLD_Organisator_MT))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1302_SLD_Organisator_MT))
	{
		Witzer01 = Hlp_GetNpc(Mod_1301_SLD_Organisator_MT);
		Witzer02 = Hlp_GetNpc(Mod_1302_SLD_Organisator_MT);
	};

	// Je nach Random-Witz dann erzählen

	if (Mod_Smalltalk_Witze_Randi == 1)
	{
		if (Mod_Smalltalk_Witze == 0)
		{
			B_Say	(Witzer01, Witzer02, "$WITZ_01_01");

			Mod_Smalltalk_Witze = 1;
		}
		else if (Mod_Smalltalk_Witze == 1)
		{
			B_Say	(Witzer01, Witzer02, "$WITZ_01_02");

			Mod_Smalltalk_Witze = 2;
		}
		else if (Mod_Smalltalk_Witze == 2)
		{
			B_Say	(Witzer01, Witzer02, "$WITZ_01_03");

			Mod_Smalltalk_Witze = 3;
		}
		else if (Mod_Smalltalk_Witze == 3)
		{
			B_Say	(Witzer01, Witzer02, "$WITZ_01_04");

			Mod_Smalltalk_Witze = 4;
		}
		else if (Mod_Smalltalk_Witze == 4)
		{
			B_Say	(Witzer01, Witzer02, "$WITZ_01_05");

			Mod_Smalltalk_Witze = 5;
		}
		else if (Mod_Smalltalk_Witze == 5)
		{
			B_Say	(Witzer01, Witzer02, "$WITZ_01_06");

			Mod_Smalltalk_Witze = 0;
			Mod_Smalltalk_Witze_Randi = 0;
		};
	}
	else if (Mod_Smalltalk_Witze_Randi == 2)
	{
		if (Mod_Smalltalk_Witze == 0)
		{
			B_Say	(Witzer02, Witzer01, "$WITZ_02_01");

			Mod_Smalltalk_Witze = 0;
			Mod_Smalltalk_Witze_Randi = 0;
		};
	}
	else if (Mod_Smalltalk_Witze_Randi == 3)
	{
		if (Mod_Smalltalk_Witze == 0)
		{
			B_Say	(Witzer01, Witzer02, "$WITZ_03_01");

			Mod_Smalltalk_Witze = 1;
		}
		else if (Mod_Smalltalk_Witze == 1)
		{
			B_Say	(Witzer01, Witzer02, "$WITZ_03_02");

			Mod_Smalltalk_Witze = 0;
			Mod_Smalltalk_Witze_Randi = 0;
		};
	}
	else if (Mod_Smalltalk_Witze_Randi == 4)
	{
		if (Mod_Smalltalk_Witze == 0)
		{
			B_Say	(Witzer02, Witzer01, "$WITZ_04_01");

			Mod_Smalltalk_Witze = 1;
		}
		else if (Mod_Smalltalk_Witze == 1)
		{
			B_Say	(Witzer02, Witzer01, "$WITZ_04_02");

			Mod_Smalltalk_Witze = 2;
		}
		else if (Mod_Smalltalk_Witze == 2)
		{
			B_Say	(Witzer02, Witzer01, "$WITZ_04_03");

			Mod_Smalltalk_Witze = 3;
		}
		else if (Mod_Smalltalk_Witze == 3)
		{
			B_Say	(Witzer02, Witzer01, "$WITZ_04_04");

			Mod_Smalltalk_Witze = 4;
		}
		else if (Mod_Smalltalk_Witze == 4)
		{
			B_Say	(Witzer02, Witzer01, "$WITZ_04_05");

			Mod_Smalltalk_Witze = 5;
		}
		else if (Mod_Smalltalk_Witze == 5)
		{
			B_Say	(Witzer02, Witzer01, "$WITZ_04_03");

			Mod_Smalltalk_Witze = 6;
		}
		else if (Mod_Smalltalk_Witze == 6)
		{
			B_Say	(Witzer02, Witzer01, "$WITZ_04_06");

			Mod_Smalltalk_Witze = 7;
		}
		else if (Mod_Smalltalk_Witze == 7)
		{
			B_Say	(Witzer02, Witzer01, "$WITZ_04_07");

			Mod_Smalltalk_Witze = 8;
		}
		else if (Mod_Smalltalk_Witze == 8)
		{
			B_Say	(Witzer02, Witzer01, "$WITZ_04_08");

			Mod_Smalltalk_Witze = 9;
		}
		else if (Mod_Smalltalk_Witze == 9)
		{
			B_Say	(Witzer02, Witzer01, "$WITZ_04_09");

			Mod_Smalltalk_Witze = 10;
		}
		else if (Mod_Smalltalk_Witze == 10)
		{
			B_Say	(Witzer02, Witzer01, "$WITZ_04_10");

			Mod_Smalltalk_Witze = 0;
			Mod_Smalltalk_Witze_Randi = 0;
		};
	}
	else if (Mod_Smalltalk_Witze_Randi == 5)
	{
		if (Mod_Smalltalk_Witze == 0)
		{
			B_Say	(Witzer01, Witzer02, "$WITZ_05_01");

			Mod_Smalltalk_Witze = 1;
		}
		else if (Mod_Smalltalk_Witze == 1)
		{
			B_Say	(Witzer01, Witzer02, "$WITZ_05_02");

			Mod_Smalltalk_Witze = 2;
		}
		else if (Mod_Smalltalk_Witze == 2)
		{
			B_Say	(Witzer01, Witzer02, "$WITZ_05_03");

			Mod_Smalltalk_Witze = 3;
		}
		else if (Mod_Smalltalk_Witze == 3)
		{
			B_Say	(Witzer01, Witzer02, "$WITZ_05_04");

			Mod_Smalltalk_Witze = 0;
			Mod_Smalltalk_Witze_Randi = 0;
		};
	}
	else if (Mod_Smalltalk_Witze_Randi == 6)
	{
		if (Mod_Smalltalk_Witze == 0)
		{
			B_Say	(Witzer02, Witzer01, "$WITZ_06_01");

			Mod_Smalltalk_Witze = 1;
		}
		else if (Mod_Smalltalk_Witze == 1)
		{
			B_Say	(Witzer02, Witzer01, "$WITZ_06_02");

			Mod_Smalltalk_Witze = 0;
			Mod_Smalltalk_Witze_Randi = 0;
		};
	}
	else if (Mod_Smalltalk_Witze_Randi == 7)
	{
		if (Mod_Smalltalk_Witze == 0)
		{
			B_Say	(Witzer01, Witzer02, "$WITZ_07_01");

			Mod_Smalltalk_Witze = 1;
		}
		else if (Mod_Smalltalk_Witze == 1)
		{
			B_Say	(Witzer01, Witzer02, "$WITZ_07_02");

			Mod_Smalltalk_Witze = 0;
			Mod_Smalltalk_Witze_Randi = 0;
		};
	}
	else if (Mod_Smalltalk_Witze_Randi == 8)
	{
		if (Mod_Smalltalk_Witze == 0)
		{
			B_Say	(Witzer02, Witzer01, "$WITZ_08_01");

			Mod_Smalltalk_Witze = 1;
		}
		else if (Mod_Smalltalk_Witze == 1)
		{
			B_Say	(Witzer02, Witzer01, "$WITZ_08_02");

			Mod_Smalltalk_Witze = 0;
			Mod_Smalltalk_Witze_Randi = 0;
		};
	}
	else if (Mod_Smalltalk_Witze_Randi == 9)
	{
		if (Mod_Smalltalk_Witze == 0)
		{
			B_Say	(Witzer01, Witzer02, "$WITZ_09_01");

			Mod_Smalltalk_Witze = 1;
		}
		else if (Mod_Smalltalk_Witze == 1)
		{
			B_Say	(Witzer01, Witzer02, "$WITZ_09_02");

			Mod_Smalltalk_Witze = 0;
			Mod_Smalltalk_Witze_Randi = 0;
		};
	}
	else if (Mod_Smalltalk_Witze_Randi == 10)
	{
		if (Mod_Smalltalk_Witze == 0)
		{
			B_Say	(Witzer02, Witzer01, "$WITZ_10_01");

			Mod_Smalltalk_Witze = 1;
		}
		else if (Mod_Smalltalk_Witze == 1)
		{
			B_Say	(Witzer01, Witzer02, "$WITZ_10_02");

			Mod_Smalltalk_Witze = 2;
		}
		else if (Mod_Smalltalk_Witze == 2)
		{
			B_Say	(Witzer02, Witzer01, "$WITZ_10_03");

			Mod_Smalltalk_Witze = 3;
		}
		else if (Mod_Smalltalk_Witze == 3)
		{
			B_Say	(Witzer02, Witzer01, "$WITZ_10_04");

			Mod_Smalltalk_Witze = 3;
		}
		else if (Mod_Smalltalk_Witze == 4)
		{
			B_Say	(Witzer02, Witzer01, "$WITZ_10_05");

			Mod_Smalltalk_Witze = 3;
		}
		else if (Mod_Smalltalk_Witze == 5)
		{
			B_Say	(Witzer02, Witzer01, "$WITZ_10_06");

			Mod_Smalltalk_Witze = 3;
		}
		else if (Mod_Smalltalk_Witze == 6)
		{
			B_Say	(Witzer02, Witzer01, "$WITZ_10_07");

			Mod_Smalltalk_Witze = 3;
		}
		else if (Mod_Smalltalk_Witze == 7)
		{
			B_Say	(Witzer02, Witzer01, "$WITZ_10_08");

			Mod_Smalltalk_Witze = 3;
		}
		else if (Mod_Smalltalk_Witze == 8)
		{
			B_Say	(Witzer02, Witzer01, "$WITZ_10_09");

			Mod_Smalltalk_Witze = 3;
		}
		else if (Mod_Smalltalk_Witze == 9)
		{
			B_Say	(Witzer01, Witzer02, "$WITZ_10_10");

			Mod_Smalltalk_Witze = 0;
			Mod_Smalltalk_Witze_Randi = 0;
		};
	};
};