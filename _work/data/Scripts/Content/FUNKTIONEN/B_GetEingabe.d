var int GetInput;	// Wird grad Eingabe gemacht oder nicht?

FUNC VOID B_StartEingabe ()
{
	eingabe = "";

	GetInput = 1;
};

FUNC VOID B_EndEingabe ()
{
	GetInput = 0;
};

FUNC STRING B_GetEingabe (var string EingabeString)
{
	var int EingabeLaenge;
	EingabeLaenge = STR_Len(EingabeString);

	if (MEM_KeyState(KEY_LSHIFT) == KEY_HOLD)
	|| (MEM_KeyState(KEY_RSHIFT) == KEY_HOLD)
	{
		if (MEM_KeyState(KEY_Q) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "Q");
		}
		else if (MEM_KeyState(KEY_W) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "W");
		}
		else if (MEM_KeyState(KEY_E) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "E");
		}
		else if (MEM_KeyState(KEY_R) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "R");
		}
		else if (MEM_KeyState(KEY_T) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "T");
		}
		else if (MEM_KeyState(KEY_Y) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "Z");
		}
		else if (MEM_KeyState(KEY_U) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "U");
		}
		else if (MEM_KeyState(KEY_I) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "I");
		}
		else if (MEM_KeyState(KEY_O) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "O");
		}
		else if (MEM_KeyState(KEY_P) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "P");
		}
		else if (MEM_KeyState(KEY_A) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "A");
		}
		else if (MEM_KeyState(KEY_S) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "S");
		}
		else if (MEM_KeyState(KEY_D) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "D");
		}
		else if (MEM_KeyState(KEY_F) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "F");
		}
		else if (MEM_KeyState(KEY_G) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "G");
		}
		else if (MEM_KeyState(KEY_H) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "H");
		}
		else if (MEM_KeyState(KEY_J) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "J");
		}
		else if (MEM_KeyState(KEY_K) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "K");
		}
		else if (MEM_KeyState(KEY_L) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "L");
		}
		else if (MEM_KeyState(KEY_Z) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "Y");
		}
		else if (MEM_KeyState(KEY_X) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "X");
		}
		else if (MEM_KeyState(KEY_C) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "C");
		}
		else if (MEM_KeyState(KEY_V) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "V");
		}
		else if (MEM_KeyState(KEY_B) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "B");
		}
		else if (MEM_KeyState(KEY_N) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "N");
		}
		else if (MEM_KeyState(KEY_M) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "M");
		}
		else if (MEM_KeyState(KEY_SPACE) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "_");
		}
		else if (MEM_KeyState(KEY_BACK) == KEY_PRESSED)
		{
			EingabeString = STR_SubStr(EingabeString, 0, EingabeLaenge-1);
		};
	}
	else
	{
		if (MEM_KeyState(KEY_Q) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "q");
		}
		else if (MEM_KeyState(KEY_W) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "w");
		}
		else if (MEM_KeyState(KEY_E) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "e");
		}
		else if (MEM_KeyState(KEY_R) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "r");
		}
		else if (MEM_KeyState(KEY_T) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "t");
		}
		else if (MEM_KeyState(KEY_Y) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "z");
		}
		else if (MEM_KeyState(KEY_U) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "u");
		}
		else if (MEM_KeyState(KEY_I) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "i");
		}
		else if (MEM_KeyState(KEY_O) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "o");
		}
		else if (MEM_KeyState(KEY_P) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "p");
		}
		else if (MEM_KeyState(KEY_A) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "a");
		}
		else if (MEM_KeyState(KEY_S) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "s");
		}
		else if (MEM_KeyState(KEY_D) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "d");
		}
		else if (MEM_KeyState(KEY_F) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "f");
		}
		else if (MEM_KeyState(KEY_G) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "g");
		}
		else if (MEM_KeyState(KEY_H) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "h");
		}
		else if (MEM_KeyState(KEY_J) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "j");
		}
		else if (MEM_KeyState(KEY_K) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "k");
		}
		else if (MEM_KeyState(KEY_L) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "l");
		}
		else if (MEM_KeyState(KEY_Z) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "y");
		}
		else if (MEM_KeyState(KEY_X) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "x");
		}
		else if (MEM_KeyState(KEY_C) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "c");
		}
		else if (MEM_KeyState(KEY_V) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "v");
		}
		else if (MEM_KeyState(KEY_B) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "b");
		}
		else if (MEM_KeyState(KEY_N) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "n");
		}
		else if (MEM_KeyState(KEY_M) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "m");
		}
		else if (MEM_KeyState(KEY_SPACE) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "_");
		}
		else if (MEM_KeyState(KEY_0) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "0");
		}
		else if (MEM_KeyState(KEY_1) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "1");
		}
		else if (MEM_KeyState(KEY_2) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "2");
		}
		else if (MEM_KeyState(KEY_3) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "3");
		}
		else if (MEM_KeyState(KEY_4) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "4");
		}
		else if (MEM_KeyState(KEY_5) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "5");
		}
		else if (MEM_KeyState(KEY_6) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "6");
		}
		else if (MEM_KeyState(KEY_7) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "7");
		}
		else if (MEM_KeyState(KEY_8) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "8");
		}
		else if (MEM_KeyState(KEY_9) == KEY_PRESSED)
		{
			EingabeString = ConcatStrings(EingabeString, "9");
		}
		else if (MEM_KeyState(KEY_BACK) == KEY_PRESSED)
		{
			EingabeString = STR_SubStr(EingabeString, 0, EingabeLaenge-1);
		}
		else if (MEM_KeyState(KEY_DELETE) == KEY_PRESSED)
		{
			EingabeString = "";
		};
	};

	return EingabeString;
};