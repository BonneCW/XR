func void DP_Say (var string text, var int anzahl)
{
	var int laberzahl;
	laberzahl = Hlp_Random(anzahl)+1; // grad so viele wies gibt
	var string labertext;
	labertext = ConcatStrings(text, IntToString(laberzahl));
	B_Say_Overlay(self, NULL, labertext);
};