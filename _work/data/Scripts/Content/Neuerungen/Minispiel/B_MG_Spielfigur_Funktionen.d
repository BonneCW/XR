FUNC VOID Button_Spielfigur_Enter(var int hndl) {
	Button_DeleteMouseover();

	var string tex;
	tex = View_GetTexture(Button_GetViewHandle(hndl));

	if (Hlp_StrCmp(tex, "MG_FIGUR_TROLL.TGA")) {
		Button_CreateMouseover("Gewinnt jeden Kampf, kann nicht übersprungen werden", Font_ScreenSmall);
	} else if (Hlp_StrCmp(tex, "MG_FIGUR_MINECRAWLERQUEEN.TGA")) {
		Button_CreateMouseover("Friert die Reihe vor sich für eine Runde ein", Font_ScreenSmall);
	} else if (Hlp_StrCmp(tex, "MG_FIGUR_HASE.TGA")) {
		Button_CreateMouseover("Kann Gegner (außer Troll) überspringen", Font_ScreenSmall);
	} else if (Hlp_StrCmp(tex, "MG_FIGUR_MEATBUG.TGA")) {
		Button_CreateMouseover("Verliert jeden Kampf", Font_ScreenSmall);
	} else if (Hlp_StrCmp(tex, "MG_FIGUR_BALROG.TGA")) {
		Button_CreateMouseover("Verbrennt Gegner auf den Feldern direkt rechts und links von sich", Font_ScreenSmall);
	} else if (Hlp_StrCmp(tex, "MG_FIGUR_GOBLIN.TGA")) {
		Button_CreateMouseover("Hinterlässt auf seinem ehemaligen Feld für eine Runde eine Mine", Font_ScreenSmall);
	};
};

FUNC VOID Button_Spielfigur_Leave(var int hndl) {
	Button_DeleteMouseover();
};

FUNC VOID Button_Spielfigur_Click(var int hndl) {
	var C_MG_SPIELFIGUR sf;
	sf = get(Button_GetUserData(hndl));

	if (MG_GameState == 3 && MG_Spieler01 == TRUE) {
		if (sf.owner == 0) {
			if (MEM_ReadStatArr(MG_EigeneFiguren2, sf.type - 1) == 1) {
				tempFigur = sf.type;

				B_MG_MarkStartReihe();
			};
		};
	} else if (MG_GameState == 4 && MG_Spieler01 == TRUE) {
		if (sf.owner == 0) {
			if (sf.Walked == FALSE) {
				tempFigur = sf.type;

				B_MG_SetPossibilities(sf);

				B_MG_MarkFelder();
			};
		};
	};
};

FUNC VOID C_MG_SPIELFIGUR_SetType(var C_MG_SPIELFIGUR sf, var int type, var int owner, var int hndl) {
	sf.type = type;

	var int xy; // x/y-Größe der Felder, da quadratisch

	xy = Print_Screen[PS_Y]/12;

	sf.button = Button_CreatePxl(0, 0, xy, xy, "Default.tga", Button_Spielfigur_Enter, Button_Spielfigur_Leave, Button_Spielfigur_Click);
	Button_SetUserData(sf.button, hndl);

	xy = Print_Screen[PS_Y]/10; // y-Auflösung ist kleiner als x, deswegen geht das

	// Start-X ermitteln

	var int x;
	var int y;

	y = xy;

	if (owner == 0) {
		x = Print_Screen[PS_X] / 2 - 6 * xy;

		sf.direction = -1;
	} else {
		x = Print_Screen[PS_X] / 2 + 4 * xy;

		sf.direction = 1;
	};

	sf.owner = owner;

	if (type == MG_FIGUR_MINECRAWLERQUEEN) {
		sf.left = 1;
		sf.right = 1;

		if (owner == 0) {
			Button_SetTexture (sf.button, "MG_FIGUR_MINECRAWLERQUEEN.TGA");
		} else {
			Button_SetTexture (sf.button, "MG_FIGUR_MINECRAWLERQUEEN2.TGA");
		};

		Button_Move (sf.button, x+xy, y+2*xy);
	} else if (type == MG_FIGUR_TROLL) {
		sf.left = 1;
		sf.right = 1;

		if (owner == 0) {
			Button_SetTexture (sf.button, "MG_FIGUR_TROLL.TGA");
		} else {
			Button_SetTexture (sf.button, "MG_FIGUR_TROLL2.TGA");
		};

		Button_Move (sf.button, x+xy, y+4*xy);
	} else if (type == MG_FIGUR_HASE) {
		sf.left = 1;
		sf.right = 1;
		sf.front = 1;

		if (owner == 0) {
			Button_SetTexture (sf.button, "MG_FIGUR_HASE.TGA");
		} else {
			Button_SetTexture (sf.button, "MG_FIGUR_HASE2.TGA");
		};

		Button_Move (sf.button, x, y+2*xy);
	} else if (type == MG_FIGUR_MEATBUG) {
		sf.left = 1;
		sf.right = 1;
		sf.front = 1;
		sf.back = 1;

		if (owner == 0) {
			Button_SetTexture (sf.button, "MG_FIGUR_MEATBUG.TGA");
		} else {
			Button_SetTexture (sf.button, "MG_FIGUR_MEATBUG2.TGA");
		};

		Button_Move (sf.button, x, y+xy);
	} else if (type == MG_FIGUR_STONEGUARDIAN) {
		sf.left = 1;
		sf.right = 1;
		sf.front = 1;
		sf.back = 1;

		if (owner == 0) {
			Button_SetTexture (sf.button, "MG_FIGUR_STONEGUARDIAN.TGA");
		} else {
			Button_SetTexture (sf.button, "MG_FIGUR_STONEGUARDIAN2.TGA");
		};

		Button_Move (sf.button, x+xy, y+3*xy);
	} else if (type == MG_FIGUR_BLOODFLY) {
		if (owner == 0) {
			Button_SetTexture (sf.button, "MG_FIGUR_BLOODFLY.TGA");
		} else {
			Button_SetTexture (sf.button, "MG_FIGUR_BLOODFLY2.TGA");
		};

		Button_Move (sf.button, x, y);
	} else if (type == MG_FIGUR_BALROG) {
		sf.front = 1;
		sf.back = 1;

		if (owner == 0) {
			Button_SetTexture (sf.button, "MG_FIGUR_BALROG.TGA");
		} else {
			Button_SetTexture (sf.button, "MG_FIGUR_BALROG2.TGA");
		};

		Button_Move (sf.button, x+xy, y);
	} else if (type == MG_FIGUR_SNAPPER) {
		sf.front = 3;
		sf.back = 1;

		if (owner == 0) {
			Button_SetTexture (sf.button, "MG_FIGUR_SNAPPER.TGA");
		} else {
			Button_SetTexture (sf.button, "MG_FIGUR_SNAPPER2.TGA");
		};

		Button_Move (sf.button, x, y+4*xy);
	} else if (type == MG_FIGUR_GOBLIN) {
		sf.left = 1;
		sf.right = 1;
		sf.front = 1;

		if (owner == 0) {
			Button_SetTexture (sf.button, "MG_FIGUR_GOBLIN.TGA");
		} else {
			Button_SetTexture (sf.button, "MG_FIGUR_GOBLIN2.TGA");
		};

		Button_Move (sf.button, x+xy, y+xy);
	} else if (type == MG_FIGUR_SCHAF) {
		sf.left = 1;
		sf.right = 1;
		sf.front = 1;
		sf.back = 1;

		if (owner == 0) {
			Button_SetTexture (sf.button, "MG_FIGUR_SCHAF.TGA");
		} else {
			Button_SetTexture (sf.button, "MG_FIGUR_SCHAF2.TGA");
		};

		Button_Move (sf.button, x, y+3*xy);
	};

	Button_Show(sf.button);
};

FUNC VOID B_MG_Schmeissen (var int field, var int owner) {
	var int temp;
	temp = MEM_ReadStatArr(MG_Spielfeld_Figur, field);
	var int hndl;
	var C_MG_SPIELFIGUR tmp;
	var int j; j = 0;
	var int i; i = 0;
	var int ptr;

	if (owner == 0) {
		ptr = MEM_StackPos.position;

		if (i < 5) {
			if (MEM_ReadStatArr(MG_EigeneFiguren, i) == temp) {
				MEM_WriteStatArr(MG_EigeneFiguren, i, 0);
			};

			i += 1;

			MEM_StackPos.position = ptr;
		};

		ptr = MEM_StackPos.position;

		if (j < 10) {
			hndl = MEM_ReadStatArr(MG_EigeneFiguren3, j);

			if (Hlp_IsValidHandle(hndl)) {
				tmp = get(hndl);

				if (tmp.type == temp) {
					delete(MEM_ReadStatArr(MG_EigeneFiguren3, j));
	
					MEM_WriteStatArr(MG_EigeneFiguren3, j, 0);
				};
			};

			j += 1;

			MEM_StackPos.position = ptr;
		};
	} else {
		ptr = MEM_StackPos.position;

		if (i < 5) {
			if (MEM_ReadStatArr(MG_GegnerFiguren, i) == temp) {
				MEM_WriteStatArr(MG_GegnerFiguren, i, 0);
			};

			i += 1;

			MEM_StackPos.position = ptr;
		};

		ptr = MEM_StackPos.position;

		if (j < 10) {
			hndl = MEM_ReadStatArr(MG_GegnerFiguren3, j);

			if (Hlp_IsValidHandle(hndl)) {
				tmp = get(hndl);

				if (tmp.type == temp) {
					delete(MEM_ReadStatArr(MG_GegnerFiguren3, j));

					MEM_WriteStatArr(MG_GegnerFiguren3, j, 0);
				};
			};

			j += 1;

			MEM_StackPos.position = ptr;
		};
	};

	MEM_WriteStatArr(MG_Spielfeld, field, 0);
	MEM_WriteStatArr(MG_Spielfeld_Figur, field, 0);
};

FUNC VOID C_MG_SPIELFIGUR_WalkToField(var C_MG_SPIELFIGUR sf, var int field) {
	var int x;
	var int y;

	var int x_alt;
	var int y_alt;

	x = field-(field/8)*8;
	y = field/8;

	x_alt = sf.field-(sf.field/8)*8;
	y_alt = sf.field/8;

	var int i;

	if (x != x_alt) {
		i = x_alt;

		if (x > x_alt) {
			i += 1;
		} else {
			i -= 1;
		};
	} else if (y != y_alt) {
		i = y_alt;

		if (y > y_alt) {
			i += 1;
		} else {
			i -= 1;
		};
	};

	var int loop; loop = MEM_StackPos.position;

	if ((x != x_alt) && (y == y_alt) && (x != i)) {
		if (B_MG_FeldBesetzt((sf.owner+1)%2, i, y)) {
			if (sf.type == MG_FIGUR_MEATBUG) {
				if (MEM_ReadStatArr(MG_Spielfeld_Figur, y*8+i) != MG_FIGUR_MEATBUG) {
					B_MG_Schmeissen(sf.field, sf.owner);

					return;
				};
			};

			if (MEM_ReadStatArr(MG_Spielfeld_Figur, y*8+i) == MG_FIGUR_TROLL) {
				B_MG_Schmeissen(sf.field, sf.owner);

				return;
			};

			B_MG_Schmeissen(y*8+i, (sf.owner+1)%2);
		};

		if (x > x_alt) {
			i += 1;
		} else {
			i -= 1;
		};

		MEM_StackPos.position = loop;
	} else if ((y != y_alt) && (x == x_alt) && (y != i)) {
		if (B_MG_FeldBesetzt((sf.owner+1)%2, x, i)) {
			if (sf.type == MG_FIGUR_MEATBUG) {
				if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) != MG_FIGUR_MEATBUG) {
					B_MG_Schmeissen(sf.field, sf.owner);

					return;
				};
			};

			if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_TROLL) {
				if (sf.type != MG_FIGUR_HASE) {
					B_MG_Schmeissen(sf.field, sf.owner);

					return;
				} else {
					if (y > y_alt) {
						i += 1;
					} else {
						i -= 1;
					};

					MEM_StackPos.position = loop;
				};
			};

			B_MG_Schmeissen(i*8+x, (sf.owner+1)%2);
		};

		if (y > y_alt) {
			i += 1;
		} else {
			i -= 1;
		};

		MEM_StackPos.position = loop;
	};

	if (B_MG_FeldBesetzt((sf.owner+1)%2, x, y)) {
		if (sf.type == MG_FIGUR_MEATBUG) {
			if (MEM_ReadStatArr(MG_Spielfeld_Figur, field) != MG_FIGUR_MEATBUG) {
				B_MG_Schmeissen(sf.field, sf.owner);

				return;
			};
		};

		if (MEM_ReadStatArr(MG_Spielfeld_Figur, field) == MG_FIGUR_TROLL) {
			B_MG_Schmeissen(sf.field, sf.owner);

			return;
		};

		B_MG_Schmeissen(field, (sf.owner+1)%2);
	};

	if (sf.type == MG_FIGUR_BALROG) {
		if (B_MG_FeldBesetzt((sf.owner+1)%2, x+1, y)) {
			B_MG_Schmeissen(field+1, (sf.owner+1)%2);
		};
		if (B_MG_FeldBesetzt((sf.owner+1)%2, x-1, y)) {
			B_MG_Schmeissen(field-1, (sf.owner+1)%2);
		};
	};

	if (sf.type == MG_FIGUR_MINECRAWLERQUEEN) {
		i = y;
		loop = MEM_StackPos.position;

		if (B_MG_FeldBesetzt((sf.owner+1)%2, x, i)) {
			if (sf.owner == 0) {
				if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_MEATBUG) {
					Hero_Meatbug.walked = TRUE;
				} else if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_HASE) {
					Hero_Hase.walked = TRUE;
				} else if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_MINECRAWLERQUEEN) {
					Hero_Minecrawlerqueen.walked = TRUE;
				} else if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_TROLL) {
					Hero_Troll.walked = TRUE;
				} else if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_BALROG) {
					Hero_Balrog.walked = TRUE;
				} else if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_SCHAF) {
					Hero_Schaf.walked = TRUE;
				} else if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_SNAPPER) {
					Hero_Snapper.walked = TRUE;
				} else if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_BLOODFLY) {
					Hero_Bloodfly.walked = TRUE;
				} else if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_GOBLIN) {
					Hero_Goblin.walked = TRUE;
				} else if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_STONEGUARDIAN) {
					Hero_Stoneguardian.walked = TRUE;
				};
			} else if (sf.owner == 1) {
				if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_MEATBUG) {
					Opp_Meatbug.walked = TRUE;
				} else if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_HASE) {
					Opp_Hase.walked = TRUE;
				} else if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_MINECRAWLERQUEEN) {
					Opp_Minecrawlerqueen.walked = TRUE;
				} else if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_TROLL) {
					Opp_Troll.walked = TRUE;
				} else if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_BALROG) {
					Opp_Balrog.walked = TRUE;
				} else if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_SCHAF) {
					Opp_Schaf.walked = TRUE;
				} else if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_SNAPPER) {
					Opp_Snapper.walked = TRUE;
				} else if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_BLOODFLY) {
					Opp_Bloodfly.walked = TRUE;
				} else if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_GOBLIN) {
					Opp_Goblin.walked = TRUE;
				} else if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_STONEGUARDIAN) {
					Opp_Stoneguardian.walked = TRUE;
				};
			};
		};

		if (sf.owner == 0)
		&& (i > 0) {
			i -= 1;

			MEM_StackPos.position = loop;
		} else if (sf.owner == 1)
		&& (i < 9) {
			i += 1;

			MEM_StackPos.position = loop;
		};
	};

	if ((field < 8) || (field >= 72)) {
		MG_GameState = 5;

		if (sf.owner == 0) {
			PrintScreen	("SIEG", 5, 25, FONT_SCREEN, 2);

			MG_SiegState = 1;
		} else {
			PrintScreen	("NIEDERLAGE", 5, 25, FONT_SCREEN, 2);

			MG_SiegState = 2;
		};
	};

	MEM_WriteStatArr(MG_Spielfeld, sf.field, 0);
	MEM_WriteStatArr(MG_Spielfeld_Figur, sf.field, 0);
	
	var int fieldPtr;
	fieldPtr = MEM_ReadStatArr(MG_Spielfeld_Texturen, sf.field);
	View_SetTexture (fieldPtr, "MG_SPIELFELD.TGA");

	sf.field = field;

	MEM_WriteStatArr(MG_Spielfeld, sf.field, sf.owner+1);
	MEM_WriteStatArr(MG_Spielfeld_Figur, sf.field, sf.type);

	var int xy; // x/y-Größe der Felder, da quadratisch

	xy = Print_Screen[PS_Y]/10; // y-Auflösung ist kleiner als x, deswegen geht das

	// Start-X ermitteln
	x = Print_Screen[PS_X]/2-4*xy;
	y = 0;

	var int ptr; ptr = MEM_StackPos.position;

	if (field > 0) {
		x += xy;

		if (x >= Print_Screen[PS_X]/2+4*xy) {
			x = Print_Screen[PS_X]/2-4*xy;

			y += xy;
		};

		field -= 1;

		MEM_StackPos.position = ptr;
	};

	var zCView v;
	v = Button_GetView(sf.button);

	x = x-v.pposx;
	y = y-v.pposy;

	var int temp;
	temp = Print_Screen[PS_Y]/12;

	temp = xy-temp;
	temp = temp/2;

	x = x+temp;
	y = y+temp;

	Button_MoveTo(sf.button, x, y);

	sf.walked = TRUE;
};

FUNC INT IsFigureInUse(var int figure) {
	var int result; result = FALSE;
	var int i; i = 0;
	var int ptr; ptr = MEM_StackPos.position;
	var int storedFigure;
	storedFigure = MEM_ReadStatArr(MG_GegnerFiguren, i);
	if (figure == storedFigure) {
		result = TRUE;
	} else {
		i += 1;
		if (i < MG_Opp_Counter) {
			MEM_StackPos.position = ptr;
		};
	};
	return result;
};

FUNC INT IsOwnFigureInUse(var int figure) {
	var int result; result = FALSE;
	var int i; i = 0;
	var int ptr; ptr = MEM_StackPos.position;
	var int storedFigure;
	storedFigure = MEM_ReadStatArr(MG_EigeneFiguren, i);
	if (figure == storedFigure) {
		result = TRUE;
	} else {
		i += 1;
		if (i < MG_Opp_Counter) {
			MEM_StackPos.position = ptr;
		};
	};
	return result;
};
