var int MG_GameState;
var int MG_SiegState;

CLASS C_MG_SPIELFIGUR
{
	var int field; // damit die Position dem Monster bekannt ist
	var int owner; // damit ich weiß, zu wem das Monster gehört und in welche Richtung es muss
	var int direction; // Richtung, in die das Monster standardmäßig muss (1 für Spieler, -1 für Gegner)
	var int type;  // Monster-Art
	var int view; // View des Monsters
	var int left;
	var int right;
	var int front;
	var int back;
	var int walked;	// diese Runde schon gelaufen?
};

/** Konstruktor **/
 
instance C_MG_SPIELFIGUR@(C_MG_SPIELFIGUR) {
	var int xy;

	xy = Print_Screen[PS_Y]/12;

	C_MG_SPIELFIGUR@.view = View_CreatePxl(0, 0, xy, xy);
};
 
/** Destruktor **/
 
func void C_MG_SPIELFIGUR_Delete(var C_MG_SPIELFIGUR m) {
	View_Delete(m.view);
};

var C_MG_SPIELFIGUR Hero_MinecrawlerQueen;
var C_MG_SPIELFIGUR Hero_Troll;
var C_MG_SPIELFIGUR Hero_Hase;
var C_MG_SPIELFIGUR Hero_Meatbug;
var C_MG_SPIELFIGUR Hero_Stoneguardian;
var C_MG_SPIELFIGUR Hero_Bloodfly;
var C_MG_SPIELFIGUR Hero_Balrog;
var C_MG_SPIELFIGUR Hero_Snapper;
var C_MG_SPIELFIGUR Hero_Goblin;
var C_MG_SPIELFIGUR Hero_Schaf;

var C_MG_SPIELFIGUR Opp_MinecrawlerQueen;
var C_MG_SPIELFIGUR Opp_Troll;
var C_MG_SPIELFIGUR Opp_Hase;
var C_MG_SPIELFIGUR Opp_Meatbug;
var C_MG_SPIELFIGUR Opp_Stoneguardian;
var C_MG_SPIELFIGUR Opp_Bloodfly;
var C_MG_SPIELFIGUR Opp_Balrog;
var C_MG_SPIELFIGUR Opp_Snapper;
var C_MG_SPIELFIGUR Opp_Goblin;
var C_MG_SPIELFIGUR Opp_Schaf;

FUNC VOID C_MG_SPIELFIGUR_SetType(var C_MG_SPIELFIGUR sf, var int type, var int owner)
{
	sf.type = type;

	PrintDebug ("B_MG_InitialiseFeld: Type geht");

	PrintDebug (ConcatStrings("B_MG_InitialiseFeld: View-Handle: ", IntToString(sf.view)));

	var int xy; // x/y-Größe der Felder, da quadratisch

	xy = Print_Screen[PS_Y]/12;

	sf.view = View_CreatePxl(0, 0, xy, xy);

	xy = Print_Screen[PS_Y]/10; // y-Auflösung ist kleiner als x, deswegen geht das

	// Start-X ermitteln

	var int x;
	var int y;

	y = xy;

	if (owner == 0)
	{
		x = Print_Screen[PS_X]/2-6*xy;

		sf.direction = -1;
	}
	else
	{
		x = Print_Screen[PS_X]/2+5*xy;

		sf.direction = 1;
	};

	PrintDebug ("B_MG_InitialiseFeld: Dir geht");

	sf.owner = owner;

	PrintDebug ("B_MG_InitialiseFeld: Owner geht");

	if (type == MG_FIGUR_MINECRAWLERQUEEN)
	{
		sf.left = 1;
		sf.right = 1;

		if (owner == 0)
		{
			View_SetTexture (sf.view, "MG_FIGUR_MINECRAWLERQUEEN.TGA");
		}
		else
		{
			View_SetTexture (sf.view, "MG_FIGUR_MINECRAWLERQUEEN2.TGA");
		};

		View_MovePxl (sf.view, x+xy, y+2*xy);
	}
	else if (type == MG_FIGUR_TROLL)
	{
		sf.left = 1;
		sf.right = 1;

		if (owner == 0)
		{
			View_SetTexture (sf.view, "MG_FIGUR_TROLL.TGA");
		}
		else
		{
			View_SetTexture (sf.view, "MG_FIGUR_TROLL2.TGA");
		};

		View_MovePxl (sf.view, x+xy, y+4*xy);
	}
	else if (type == MG_FIGUR_HASE)
	{
		sf.left = 1;
		sf.right = 1;
		sf.front = 1;

		if (owner == 0)
		{
			View_SetTexture (sf.view, "MG_FIGUR_HASE.TGA");
		}
		else
		{
			View_SetTexture (sf.view, "MG_FIGUR_HASE2.TGA");
		};

		View_MovePxl (sf.view, x, y+2*xy);
	}
	else if (type == MG_FIGUR_MEATBUG)
	{
		sf.left = 1;
		sf.right = 1;
		sf.front = 1;
		sf.back = 1;

		if (owner == 0)
		{
			View_SetTexture (sf.view, "MG_FIGUR_MEATBUG.TGA");
		}
		else
		{
			View_SetTexture (sf.view, "MG_FIGUR_MEATBUG2.TGA");
		};

		View_MovePxl (sf.view, x, y+xy);
	}
	else if (type == MG_FIGUR_STONEGUARDIAN)
	{
		sf.left = 1;
		sf.right = 1;
		sf.front = 1;
		sf.back = 1;

		if (owner == 0)
		{
			View_SetTexture (sf.view, "MG_FIGUR_STONEGUARDIAN.TGA");
		}
		else
		{
			View_SetTexture (sf.view, "MG_FIGUR_STONEGUARDIAN2.TGA");
		};

		View_MovePxl (sf.view, x+xy, y+3*xy);
	}
	else if (type == MG_FIGUR_BLOODFLY)
	{
		if (owner == 0)
		{
			View_SetTexture (sf.view, "MG_FIGUR_BLOODFLY.TGA");
		}
		else
		{
			View_SetTexture (sf.view, "MG_FIGUR_BLOODFLY2.TGA");
		};

		View_MovePxl (sf.view, x, y);
	}
	else if (type == MG_FIGUR_BALROG)
	{
		sf.front = 1;
		sf.back = 1;

		if (owner == 0)
		{
			View_SetTexture (sf.view, "MG_FIGUR_BALROG.TGA");
		}
		else
		{
			View_SetTexture (sf.view, "MG_FIGUR_BALROG2.TGA");
		};

		View_MovePxl (sf.view, x+xy, y);
	}
	else if (type == MG_FIGUR_SNAPPER)
	{
		sf.front = 3;
		sf.back = 1;

		if (owner == 0)
		{
			View_SetTexture (sf.view, "MG_FIGUR_SNAPPER.TGA");
		}
		else
		{
			View_SetTexture (sf.view, "MG_FIGUR_SNAPPER2.TGA");
		};

		View_MovePxl (sf.view, x, y+4*xy);
	}
	else if (type == MG_FIGUR_GOBLIN)
	{
		sf.left = 1;
		sf.right = 1;
		sf.front = 1;

		if (owner == 0)
		{
			View_SetTexture (sf.view, "MG_FIGUR_GOBLIN.TGA");
		}
		else
		{
			View_SetTexture (sf.view, "MG_FIGUR_GOBLIN2.TGA");
		};

		View_MovePxl (sf.view, x+xy, y+xy);
	}
	else if (type == MG_FIGUR_SCHAF)
	{
		sf.left = 1;
		sf.right = 1;
		sf.front = 1;
		sf.back = 1;

		if (owner == 0)
		{
			View_SetTexture (sf.view, "MG_FIGUR_SCHAF.TGA");
		}
		else
		{
			View_SetTexture (sf.view, "MG_FIGUR_SCHAF2.TGA");
		};

		View_MovePxl (sf.view, x, y+3*xy);
	};

	View_Open(sf.view);

	PrintDebug ("B_MG_InitialiseFeld: View_Open geht");
};

FUNC VOID B_MG_Schmeissen (var int field, var int owner)
{
	var int temp;
	temp = MEM_ReadStatArr(MG_Spielfeld_Figur, field);
	var int hndl;
	var C_MG_SPIELFIGUR tmp;
	var int j; j = 0;
	var int i; i = 0;
	var int ptr;

	if (owner == 0)
	{
		ptr = MEM_StackPos.position;

		if (i < 5)
		{
			if (MEM_ReadStatArr(MG_EigeneFiguren, i) == temp)
			{
				MEM_WriteStatArr(MG_EigeneFiguren, i, 0);
			};

			i += 1;

			MEM_StackPos.position = ptr;
		};

		ptr = MEM_StackPos.position;

		if (j < 10)
		{
			hndl = MEM_ReadStatArr(MG_EigeneFiguren3, j);

			if (Hlp_IsValidHandle(hndl))
			{
				tmp = get(hndl);

				if (tmp.type == temp)
				{
					delete(MEM_ReadStatArr(MG_EigeneFiguren3, j));
	
					MEM_WriteStatArr(MG_EigeneFiguren3, j, 0);
				};
			};

			j += 1;

			MEM_StackPos.position = ptr;
		};
	}
	else
	{
		ptr = MEM_StackPos.position;

		if (i < 5)
		{
			if (MEM_ReadStatArr(MG_GegnerFiguren, i) == temp)
			{
				MEM_WriteStatArr(MG_GegnerFiguren, i, 0);
			};

			i += 1;

			MEM_StackPos.position = ptr;
		};

		ptr = MEM_StackPos.position;

		if (j < 10)
		{
			hndl = MEM_ReadStatArr(MG_GegnerFiguren3, j);

			if (Hlp_IsValidHandle(hndl))
			{
				tmp = get(hndl);

				if (tmp.type == temp)
				{
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

FUNC VOID C_MG_SPIELFIGUR_WalkToField(var C_MG_SPIELFIGUR sf, var int field)
{
	var int x;
	var int y;

	var int x_alt;
	var int y_alt;

	x = field-(field/8)*8;
	y = field/8;

	x_alt = sf.field-(sf.field/8)*8;
	y_alt = sf.field/8;

	var int i;

	if (x != x_alt)
	{
		i = x_alt;

		if (x > x_alt)
		{
			i += 1;
		}
		else
		{
			i -= 1;
		};
	}
	else if (y != y_alt)
	{
		i = y_alt;

		if (y > y_alt)
		{
			i += 1;
		}
		else
		{
			i -= 1;
		};
	};

	var int loop; loop = MEM_StackPos.position;

	if ((x != x_alt) && (y == y_alt) && (x != i))
	{
		if (B_MG_FeldBesetzt((sf.owner+1)%2, i, y))
		{
			if (sf.type == MG_FIGUR_MEATBUG)
			{
				if (MEM_ReadStatArr(MG_Spielfeld_Figur, y*8+i) != MG_FIGUR_MEATBUG)
				{
					B_MG_Schmeissen(sf.field, sf.owner);

					return;
				};
			};

			if (MEM_ReadStatArr(MG_Spielfeld_Figur, y*8+i) == MG_FIGUR_TROLL)
			{
				if (sf.type != MG_FIGUR_HASE)
				{
					B_MG_Schmeissen(sf.field, sf.owner);

					return;
				}
				else
				{
					if (x > x_alt)
					{
						i += 1;
					}
					else
					{
						i -= 1;
					};

					MEM_StackPos.position = loop;
				};
			};

			B_MG_Schmeissen(y*8+i, (sf.owner+1)%2);
		};

		if (x > x_alt)
		{
			i += 1;
		}
		else
		{
			i -= 1;
		};

		MEM_StackPos.position = loop;
	}
	else if ((y != y_alt) && (x == x_alt) && (y != i))
	{
		if (B_MG_FeldBesetzt((sf.owner+1)%2, x, i))
		{
			if (sf.type == MG_FIGUR_MEATBUG)
			{
				if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) != MG_FIGUR_MEATBUG)
				{
					B_MG_Schmeissen(sf.field, sf.owner);

					return;
				};
			};

			if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_TROLL)
			{
				if (sf.type != MG_FIGUR_HASE)
				{
					B_MG_Schmeissen(sf.field, sf.owner);

					return;
				}
				else
				{
					if (y > y_alt)
					{
						i += 1;
					}
					else
					{
						i -= 1;
					};

					MEM_StackPos.position = loop;
				};
			};

			B_MG_Schmeissen(i*8+x, (sf.owner+1)%2);
		};

		if (y > y_alt)
		{
			i += 1;
		}
		else
		{
			i -= 1;
		};

		MEM_StackPos.position = loop;
	};

	if (B_MG_FeldBesetzt((sf.owner+1)%2, x, y))
	{
		if (sf.type == MG_FIGUR_MEATBUG)
		{
			if (MEM_ReadStatArr(MG_Spielfeld_Figur, field) != MG_FIGUR_MEATBUG)
			{
				B_MG_Schmeissen(sf.field, sf.owner);

				return;
			};
		};

		if (MEM_ReadStatArr(MG_Spielfeld_Figur, field) == MG_FIGUR_TROLL)
		{
			B_MG_Schmeissen(sf.field, sf.owner);

			return;
		};

		B_MG_Schmeissen(field, (sf.owner+1)%2);
	};

	if (sf.type == MG_FIGUR_BALROG)
	{
		if (B_MG_FeldBesetzt((sf.owner+1)%2, x+1, y))
		{
			B_MG_Schmeissen(field+1, (sf.owner+1)%2);
		};
		if (B_MG_FeldBesetzt((sf.owner+1)%2, x-1, y))
		{
			B_MG_Schmeissen(field-1, (sf.owner+1)%2);
		};
	};

	if (sf.type == MG_FIGUR_MINECRAWLERQUEEN)
	{
		i = y;
		loop = MEM_StackPos.position;

		if (B_MG_FeldBesetzt((sf.owner+1)%2, x, i))
		{
			if (sf.owner == 0)
			{
				if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_MEATBUG)
				{
					Hero_Meatbug.walked = TRUE;
				}
				else if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_HASE)
				{
					Hero_Hase.walked = TRUE;
				}
				else if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_MINECRAWLERQUEEN)
				{
					Hero_Minecrawlerqueen.walked = TRUE;
				}
				else if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_TROLL)
				{
					Hero_Troll.walked = TRUE;
				}
				else if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_BALROG)
				{
					Hero_Balrog.walked = TRUE;
				}
				else if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_SCHAF)
				{
					Hero_Schaf.walked = TRUE;
				}
				else if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_SNAPPER)
				{
					Hero_Snapper.walked = TRUE;
				}
				else if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_BLOODFLY)
				{
					Hero_Bloodfly.walked = TRUE;
				}
				else if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_GOBLIN)
				{
					Hero_Goblin.walked = TRUE;
				}
				else if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_STONEGUARDIAN)
				{
					Hero_Stoneguardian.walked = TRUE;
				};
			}
			else if (sf.owner == 1)
			{
				if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_MEATBUG)
				{
					Opp_Meatbug.walked = TRUE;
				}
				else if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_HASE)
				{
					Opp_Hase.walked = TRUE;
				}
				else if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_MINECRAWLERQUEEN)
				{
					Opp_Minecrawlerqueen.walked = TRUE;
				}
				else if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_TROLL)
				{
					Opp_Troll.walked = TRUE;
				}
				else if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_BALROG)
				{
					Opp_Balrog.walked = TRUE;
				}
				else if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_SCHAF)
				{
					Opp_Schaf.walked = TRUE;
				}
				else if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_SNAPPER)
				{
					Opp_Snapper.walked = TRUE;
				}
				else if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_BLOODFLY)
				{
					Opp_Bloodfly.walked = TRUE;
				}
				else if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_GOBLIN)
				{
					Opp_Goblin.walked = TRUE;
				}
				else if (MEM_ReadStatArr(MG_Spielfeld_Figur, i*8+x) == MG_FIGUR_STONEGUARDIAN)
				{
					Opp_Stoneguardian.walked = TRUE;
				};
			};
		};

		if (sf.owner == 0)
		&& (i > 0)
		{
			i -= 1;

			MEM_StackPos.position = loop;
		}
		else if (sf.owner == 1)
		&& (i < 9)
		{
			i += 1;

			MEM_StackPos.position = loop;
		};
	};

	if ((field < 8) || (field >= 72))
	{
		MG_GameState = 5;

		if (sf.owner == 0)
		{
			PrintScreen	("SIEG", 5, 25, FONT_SCREEN, 2);

			MG_SiegState = 1;
		}
		else
		{
			PrintScreen	("NIEDERLAGE", 5, 25, FONT_SCREEN, 2);

			MG_SiegState = 2;
		};
	};

	MEM_WriteStatArr(MG_Spielfeld, sf.field, 0);
	MEM_WriteStatArr(MG_Spielfeld_Figur, sf.field, 0);

	sf.field = field;

	MEM_WriteStatArr(MG_Spielfeld, sf.field, sf.owner+1);
	MEM_WriteStatArr(MG_Spielfeld_Figur, sf.field, sf.type);

	var int xy; // x/y-Größe der Felder, da quadratisch

	xy = Print_Screen[PS_Y]/10; // y-Auflösung ist kleiner als x, deswegen geht das

	// Start-X ermitteln
	x = Print_Screen[PS_X]/2-4*xy;
	y = 0;

	var int ptr; ptr = MEM_StackPos.position;

	if (field > 0)
	{
		x += xy;

		if (x >= Print_Screen[PS_X]/2+4*xy)
		{
			x = Print_Screen[PS_X]/2-4*xy;

			y += xy;
		};

		field -= 1;

		MEM_StackPos.position = ptr;
	};

	var zCView v;
	v = View_Get(sf.view);

	x = x-v.pposx;
	y = y-v.pposy;

	var int temp;
	temp = Print_Screen[PS_Y]/12;

	temp = xy-temp;
	temp = temp/2;

	x = x+temp;
	y = y+temp;

	View_MovePxl(sf.view, x, y);

	sf.walked = TRUE;
};