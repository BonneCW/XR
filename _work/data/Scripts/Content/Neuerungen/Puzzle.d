var int Puzzle_ActiveHndl;
var int Puzzle_LastMouseX;
var int Puzzle_LastMouseY;
var int Puzzle_DiffFromMouseX;
var int Puzzle_DiffFromMouseY;
var int Puzzle_Active;

FUNC VOID PuzzleButton_Click(var int hndl) {
	if (Puzzle_ActiveHndl != 0) {
		if (Puzzle_ActiveHndl == hndl) {
			Puzzle_ActiveHndl = 0;
		};
		Puzzle_Active = TRUE;
		return;
	};
	if (Puzzle_Active) {
		return;
	};
	Puzzle_ActiveHndl = hndl;
	var _Button btn; btn = get(Puzzle_ActiveHndl);
	Puzzle_LastMouseX = Cursor_X;
	Puzzle_LastMouseY = Cursor_Y;
	Puzzle_DiffFromMouseX = Cursor_X - Print_ToPixel(btn.posX, PS_X);
	Puzzle_DiffFromMouseY = Cursor_Y - Print_ToPixel(btn.posY, PS_Y);
};

FUNC VOID Puzzle_Tick() {
	Puzzle_Active = FALSE;
	if (Puzzle_ActiveHndl != 0) {
		if (Cursor_X != Puzzle_LastMouseX || Cursor_Y != Puzzle_LastMouseY) {
			var _Button btn; btn = get(Puzzle_ActiveHndl);
			Button_Move(Puzzle_ActiveHndl, Cursor_X - Puzzle_DiffFromMouseX, Cursor_Y - Puzzle_DiffFromMouseY);
			Puzzle_LastMouseX = Cursor_X;
			Puzzle_LastMouseY = Cursor_Y;
		};
	} else {
		var int PuzzleAccepted;
		PuzzleAccepted = FALSE;
		var _Button btn2;
		btn2 = get(Mod_Uriziel_Piece1);
		var int Piece1X; Piece1X = Print_Screen[PS_X] / 2 - 77;
		var int Piece1Y; Piece1Y = Print_Screen[PS_Y] / 2 - 410;
		if (Print_ToPixel(btn2.posX, PS_X) >= Piece1X - 15 && Print_ToPixel(btn2.posX, PS_X) <= Piece1X + 15 && Print_ToPixel(btn2.posY, PS_Y) >= Piece1Y - 15 && Print_ToPixel(btn2.posY, PS_Y) <= Piece1Y + 15) {
			PuzzleAccepted = TRUE;
		};
		if (PuzzleAccepted == FALSE) {
			return;
		};
		
		PuzzleAccepted = FALSE;
		btn2 = get(Mod_Uriziel_Piece2);
		var int Piece2X; Piece2X = Print_Screen[PS_X] / 2 - 119;
		var int Piece2Y; Piece2Y = Print_Screen[PS_Y] / 2 - 360;
		if (Print_ToPixel(btn2.posX, PS_X) >= Piece2X - 15 && Print_ToPixel(btn2.posX, PS_X) <= Piece2X + 15 && Print_ToPixel(btn2.posY, PS_Y) >= Piece2Y - 15 && Print_ToPixel(btn2.posY, PS_Y) <= Piece2Y + 15) {
			PuzzleAccepted = TRUE;
		};
		if (PuzzleAccepted == FALSE) {
			return;
		};
		
		PuzzleAccepted = FALSE;
		btn2 = get(Mod_Uriziel_Piece3);
		var int Piece3X; Piece3X = Print_Screen[PS_X] / 2 - 22;
		var int Piece3Y; Piece3Y = Print_Screen[PS_Y] / 2 - 333;
		if (Print_ToPixel(btn2.posX, PS_X) >= Piece3X - 15 && Print_ToPixel(btn2.posX, PS_X) <= Piece3X + 15 && Print_ToPixel(btn2.posY, PS_Y) >= Piece3Y - 15 && Print_ToPixel(btn2.posY, PS_Y) <= Piece3Y + 15) {
			PuzzleAccepted = TRUE;
		};
		if (PuzzleAccepted == FALSE) {
			return;
		};
		
		PuzzleAccepted = FALSE;
		btn2 = get(Mod_Uriziel_Piece4);
		var int Piece4X; Piece4X = Print_Screen[PS_X] / 2 + 3;
		var int Piece4Y; Piece4Y = Print_Screen[PS_Y] / 2 - 170;
		if (Print_ToPixel(btn2.posX, PS_X) >= Piece4X - 15 && Print_ToPixel(btn2.posX, PS_X) <= Piece4X + 15 && Print_ToPixel(btn2.posY, PS_Y) >= Piece4Y - 15 && Print_ToPixel(btn2.posY, PS_Y) <= Piece4Y + 15) {
			PuzzleAccepted = TRUE;
		};
		if (PuzzleAccepted == FALSE) {
			return;
		};
		
		PuzzleAccepted = FALSE;
		btn2 = get(Mod_Uriziel_Piece5);
		var int Piece5X; Piece5X = Print_Screen[PS_X] / 2 - 57;
		var int Piece5Y; Piece5Y = Print_Screen[PS_Y] / 2 - 132;
		if (Print_ToPixel(btn2.posX, PS_X) >= Piece5X - 15 && Print_ToPixel(btn2.posX, PS_X) <= Piece5X + 15 && Print_ToPixel(btn2.posY, PS_Y) >= Piece5Y - 15 && Print_ToPixel(btn2.posY, PS_Y) <= Piece5Y + 15) {
			PuzzleAccepted = TRUE;
		};
		if (PuzzleAccepted == FALSE) {
			return;
		};
		
		PuzzleAccepted = FALSE;
		btn2 = get(Mod_Uriziel_Piece6);
		var int Piece6X; Piece6X = Print_Screen[PS_X] / 2 + 52;
		var int Piece6Y; Piece6Y = Print_Screen[PS_Y] / 2 + 96;
		if (Print_ToPixel(btn2.posX, PS_X) >= Piece6X - 15 && Print_ToPixel(btn2.posX, PS_X) <= Piece6X + 15 && Print_ToPixel(btn2.posY, PS_Y) >= Piece6Y - 15 && Print_ToPixel(btn2.posY, PS_Y) <= Piece6Y + 15) {
			PuzzleAccepted = TRUE;
		};
		if (PuzzleAccepted == FALSE) {
			return;
		};
		
		PuzzleAccepted = FALSE;
		btn2 = get(Mod_Uriziel_Piece7);
		var int Piece7X; Piece7X = Print_Screen[PS_X] / 2 + 32;
		var int Piece7Y; Piece7Y = Print_Screen[PS_Y] / 2 + 156;
		if (Print_ToPixel(btn2.posX, PS_X) >= Piece7X - 15 && Print_ToPixel(btn2.posX, PS_X) <= Piece7X + 15 && Print_ToPixel(btn2.posY, PS_Y) >= Piece7Y - 15 && Print_ToPixel(btn2.posY, PS_Y) <= Piece7Y + 15) {
			PuzzleAccepted = TRUE;
		};
		if (PuzzleAccepted == FALSE) {
			return;
		};
		
		PuzzleAccepted = FALSE;
		btn2 = get(Mod_Uriziel_Piece8);
		var int Piece8X; Piece8X = Print_Screen[PS_X] / 2 + 85;
		var int Piece8Y; Piece8Y = Print_Screen[PS_Y] / 2 + 249;
		if (Print_ToPixel(btn2.posX, PS_X) >= Piece8X - 15 && Print_ToPixel(btn2.posX, PS_X) <= Piece8X + 15 && Print_ToPixel(btn2.posY, PS_Y) >= Piece8Y - 15 && Print_ToPixel(btn2.posY, PS_Y) <= Piece8Y + 15) {
			PuzzleAccepted = TRUE;
		};
		if (PuzzleAccepted == FALSE) {
			return;
		};
		Mod_Argez_Puzzle = 2;
		B_GivePlayerXP(500);
		View_Delete(Mod_Uriziel_Background);
		View_Delete(Mod_Uriziel_Frame);
		Button_Delete(Mod_Uriziel_Piece1);
		Button_Delete(Mod_Uriziel_Piece2);
		Button_Delete(Mod_Uriziel_Piece3);
		Button_Delete(Mod_Uriziel_Piece4);
		Button_Delete(Mod_Uriziel_Piece5);
		Button_Delete(Mod_Uriziel_Piece6);
		Button_Delete(Mod_Uriziel_Piece7);
		Button_Delete(Mod_Uriziel_Piece8);
	};
};
