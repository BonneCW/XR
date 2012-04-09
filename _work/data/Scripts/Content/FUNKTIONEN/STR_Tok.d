var string strtok_string;
var string strtok_retstring;
var int strtok_length;

FUNC INT STR_Tok_GetLength (var string s, var string tok, var int length)
{
	if (Hlp_StrCmp(s, "") != 0)
	{
		return 0;
	};

	var int i;
	i = 0;
	var int x;
	x = length;
	var int y;
	y = 0;
	var int tok_length;
	tok_length = STR_Len(tok);

	var int ptr; ptr = MEM_StackPos.position;

	if (y < tok_length)
	{	
		var int ptr2; ptr2 = MEM_StackPos.position;

		if (STR_GetCharAt(s, i) != STR_GetCharAt(tok, y))
		&& (i < length)
		{
			i += 1;

			MEM_StackPos.position = ptr2;
		};

		if (i < x)
		{
			x = i;
		};

		i = 0;
		y += 1;

		MEM_StackPos.position = ptr;
	};

	return x;
};

FUNC STRING STR_Tok (var string s, var string tok)
{
	if (Hlp_StrCmp(s, "NULL") != 0)
	{
		s = strtok_string;
	};

	var int strtok_stringlength;

	strtok_stringlength = STR_Len(s);

	if (strtok_stringlength > 0)
	{
		strtok_length = STR_Tok_GetLength(s, tok, strtok_stringlength);

		strtok_retstring = STR_SubStr(s, 0, strtok_length);

		strtok_string = STR_SubStr(s, strtok_length+1, strtok_stringlength);
	}
	else
	{
		strtok_retstring = "EOF";
	};

	return strtok_retstring;
};