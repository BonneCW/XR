// Hier wird geprüft, ob das Feld noch frei ist

FUNC INT B_MG_FeldBesetzt(var int owner, var int x, var int y) {
	if ((x < 0) || (x >= 8)) {
		return FALSE;
	};

	if ((y < 0) || (y >= 10)) {
		return FALSE;
	};

	if (x+8*y >= 80) {
		return TRUE;
	};

	if (x+8*y < 0) {
		return TRUE;
	};

	if (MEM_ReadStatArr(MG_Spielfeld, x+8*y) == owner+1) { // Feld an der Stelle entspricht dem owner, dann ist das Feld nicht passierbar
		return TRUE;
	};

	return FALSE;
};