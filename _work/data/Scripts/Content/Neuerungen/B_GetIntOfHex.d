FUNC INT _B_GetIntOfStr(var string s)
{
	if (Hlp_StrCmp(s, "0"))
	{
		return 0;
	}
	else if (Hlp_StrCmp(s, "1"))
	{
		return 1;
	}
	else if (Hlp_StrCmp(s, "2"))
	{
		return 2;
	}
	else if (Hlp_StrCmp(s, "3"))
	{
		return 3;
	}
	else if (Hlp_StrCmp(s, "4"))
	{
		return 4;
	}
	else if (Hlp_StrCmp(s, "5"))
	{
		return 5;
	}
	else if (Hlp_StrCmp(s, "6"))
	{
		return 6;
	}
	else if (Hlp_StrCmp(s, "7"))
	{
		return 7;
	}
	else if (Hlp_StrCmp(s, "8"))
	{
		return 8;
	}
	else if (Hlp_StrCmp(s, "9"))
	{
		return 9;
	}
	else if (Hlp_StrCmp(s, "a"))
	{
		return 10;
	}
	else if (Hlp_StrCmp(s, "b"))
	{
		return 11;
	}
	else if (Hlp_StrCmp(s, "c"))
	{
		return 12;
	}
	else if (Hlp_StrCmp(s, "d"))
	{
		return 13;
	}
	else if (Hlp_StrCmp(s, "e"))
	{
		return 14;
	}
	else if (Hlp_StrCmp(s, "f"))
	{
		return 15;
	};
};

FUNC INT B_GetIntOfHex(var string s)
{
	
	return 16*_B_GetIntOfStr(STR_SubStr(s, 0, 1)) + _B_GetIntOfStr(STR_SubStr(s, 1, 1));
};