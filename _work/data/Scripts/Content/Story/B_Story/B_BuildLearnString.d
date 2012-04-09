// *********************************************************
// B_BuildLearnString
// ------------------
// macht einen String aus übergebener Stringkonstante (Text) 
// und übergebenen Kosten
// *********************************************************

func string B_BuildLearnString (var string text, var int kosten)
{
	var string concatText;

	// ------ Beispiel: "Taschendiebstahl lernen. Kosten: 10 LP"
	concatText = ConcatStrings (text, 		PRINT_Kosten);				// ". Kosten: "
	concatText = ConcatStrings (concatText, IntToString(kosten));

	if (Mod_Schwierigkeit == 4)
	{
		concatText = ConcatStrings (concatText, " Gold");			// " LP"
	}
	else
	{
		concatText = ConcatStrings (concatText, PRINT_LP);			// " LP"
	};
	
	return concatText;
};

func string B_BuildLearnString_New (var string text, var int kosten, var int attribut)
{
	var string concatText;
	var int Unterschied;	

	// ------ Beispiel: "Taschendiebstahl lernen. Kosten: 10 LP"
	concatText = ConcatStrings (text, 		PRINT_Kosten);				// ". Kosten: "
	concatText = ConcatStrings (concatText, IntToString(kosten));
	concatText = ConcatStrings (concatText, PRINT_LP);						// " LP"

	concatText = concatStrings (concatText, "  (");

	if (attribut == ATR_STRENGTH)
	{
		concatText = concatStrings (concatText, IntToString((Mod_RealStrength - 10)));
	}
	else if (attribut == ATR_DEXTERITY)
	{
		concatText = concatStrings (concatText, IntToString((Mod_RealDexterity - 10)));
	}
	else
	{
		concatText = concatStrings (concatText, IntToString((Mod_RealMana - 10)));
	};

	concatText = concatStrings (concatText, ")");
	
	return concatText;
};




