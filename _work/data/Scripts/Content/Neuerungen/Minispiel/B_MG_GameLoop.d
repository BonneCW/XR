// Game-Loop, am besten per FrameFunction

var int temp;


FUNC VOID B_MG_GameLoop()
{
	var int xy2;
	var int xy; // x/y-Größe der Felder, da quadratisch

	// Start-X ermitteln

	var int x;
	var int y;

	if (MG_GameState == 0) // hier werden nur das Feld und alle Variablen initialisiert
	{
		B_MG_InitialiseFeld();

		MG_Spieler01 = FALSE;
		MG_Spieler02 = FALSE;

		Cursor_Show();
		Cursor_NoEngine = 1;

		MG_GameState = 1;
	}
	else if (MG_GameState == 1) // auswürfeln, wer das Spiel beginnt
	{
		var int MG_Starter;
		MG_Starter = r_max(1);

		MG_GameState = 2;
	}
	else if (MG_GameState == 2) // Figuren setzen (Start)
	{
		if (MG_Starter == 0)
		{
			MG_Spieler01 = TRUE;
		}
		else
		{
			MG_Spieler02 = TRUE;
		};

		MG_GameState = 3;
	}
	else if (MG_GameState == 3) // Figuren setzen (Loop)
	{
		if (MG_Spieler01 == TRUE)
		{
			// ToDo: Setzen der Figuren und switchen
			
			if (MEM_KeyState(MOUSE_BUTTONLEFT) == KEY_PRESSED)
			{
				// Koordinaten ermitteln

				xy = Print_Screen[PS_Y]/12;
				xy2 = Print_Screen[PS_Y]/10;

				y = xy2;
				x = Print_Screen[PS_X]/2-6*xy2;

				if (temp == 0)
				{
					if (PlayerHas_Troll)
					&& (Cursor_X >= x+xy2)
					&& (Cursor_X < x+xy2+xy)
					&& (Cursor_Y >= y+4*xy2)
					&& (Cursor_Y < y+4*xy2+xy)
					&& (MEM_ReadStatArr(MG_EigeneFiguren2, 1) == 1)
					{
						temp = MG_FIGUR_TROLL;
					}
					else if (PlayerHas_MINECRAWLERQUEEN)
					&& (Cursor_X >= x+xy2)
					&& (Cursor_X < x+xy2+xy)
					&& (Cursor_Y >= y+2*xy2)
					&& (Cursor_Y < y+2*xy2+xy)
					&& (MEM_ReadStatArr(MG_EigeneFiguren2, 0) == 1)
					{
						temp = MG_FIGUR_MINECRAWLERQUEEN;
					}
					else if (PlayerHas_HASE)
					&& (Cursor_X >= x)
					&& (Cursor_X < x+xy)
					&& (Cursor_Y >= y+4*xy2)
					&& (Cursor_Y < y+4*xy2+xy)
					&& (MEM_ReadStatArr(MG_EigeneFiguren2, 5) == 1)
					{
						temp = MG_FIGUR_HASE;
					}
					else if (PlayerHas_MEATBUG)
					&& (Cursor_X >= x)
					&& (Cursor_X < x+xy)
					&& (Cursor_Y >= y+xy2)
					&& (Cursor_Y < y+xy2+xy)
					&& (MEM_ReadStatArr(MG_EigeneFiguren2, 6) == 1)
					{
						temp = MG_FIGUR_MEATBUG;
					}
					else if (PlayerHas_STONEGUARDIAN)
					&& (Cursor_X >= x+xy2)
					&& (Cursor_X < x+xy2+xy)
					&& (Cursor_Y >= y+3*xy2)
					&& (Cursor_Y < y+3*xy2+xy)
					&& (MEM_ReadStatArr(MG_EigeneFiguren2, 9) == 1)
					{
						temp = MG_FIGUR_STONEGUARDIAN;
					}
					else if (PlayerHas_BLOODFLY)
					&& (Cursor_X >= x)
					&& (Cursor_X < x+xy)
					&& (Cursor_Y >= y)
					&& (Cursor_Y < y+xy)
					&& (MEM_ReadStatArr(MG_EigeneFiguren2, 8) == 1)
					{
						temp = MG_FIGUR_BLOODFLY;
					}
					else if (PlayerHas_BALROG)
					&& (Cursor_X >= x+xy2)
					&& (Cursor_X < x+xy2+xy)
					&& (Cursor_Y >= y)
					&& (Cursor_Y < y+xy)
					&& (MEM_ReadStatArr(MG_EigeneFiguren2, 7) == 1)
					{
						temp = MG_FIGUR_BALROG;
					}
					else if (PlayerHas_SNAPPER)
					&& (Cursor_X >= x)
					&& (Cursor_X < x+xy)
					&& (Cursor_Y >= y+4*xy2)
					&& (Cursor_Y < y+4*xy2+xy)
					&& (MEM_ReadStatArr(MG_EigeneFiguren2, 3) == 1)
					{
						temp = MG_FIGUR_SNAPPER;
					}
					else if (PlayerHas_GOBLIN)
					&& (Cursor_X >= x+xy2)
					&& (Cursor_X < x+xy2+xy)
					&& (Cursor_Y >= y+xy2)
					&& (Cursor_Y < y+xy2+xy)
					&& (MEM_ReadStatArr(MG_EigeneFiguren2, 4) == 1)
					{
						temp = MG_FIGUR_GOBLIN;
					}
					else if (PlayerHas_SCHAF)
					&& (Cursor_X >= x)
					&& (Cursor_X < x+xy)
					&& (Cursor_Y >= y+3*xy2)
					&& (Cursor_Y < y+3*xy2+xy)
					&& (MEM_ReadStatArr(MG_EigeneFiguren2, 2) == 1)
					{
						temp = MG_FIGUR_SCHAF;
					};

					if (temp != 0)
					{
						B_MG_MarkStartReihe();
					};
				}
				else
				{
					xy = Print_Screen[PS_Y]/10;

					if (Cursor_X >= Print_Screen[PS_X]/2-4*xy)
					&& (Cursor_X < Print_Screen[PS_X]/2+4*xy)
					{
						y = CURSOR_Y/xy;
						x = (CURSOR_X-(Print_Screen[PS_X]/2-4*xy))/xy;

						if (y != 8)
						{
							return;
						};

						if (B_MG_FeldBesetzt(0, x, y))
						{
							return;
						};

						if (temp == MG_FIGUR_TROLL)
						{
							C_MG_SPIELFIGUR_WalkToField(Hero_Troll, x+y*8);

							MEM_WriteStatArr(MG_EigeneFiguren2, 1, 0);

							MEM_WriteStatArr(MG_EigeneFiguren, MG_Own_Counter, MG_FIGUR_TROLL);
						}
						else if (temp == MG_FIGUR_MINECRAWLERQUEEN)
						{
							C_MG_SPIELFIGUR_WalkToField(Hero_MINECRAWLERQUEEN, x+y*8);

							MEM_WriteStatArr(MG_EigeneFiguren2, 0, 0);

							MEM_WriteStatArr(MG_EigeneFiguren, MG_Own_Counter, MG_FIGUR_MINECRAWLERQUEEN);
						}
						else if (temp == MG_FIGUR_SCHAF)
						{
							C_MG_SPIELFIGUR_WalkToField(Hero_SCHAF, x+y*8);

							MEM_WriteStatArr(MG_EigeneFiguren2, 2, 0);

							MEM_WriteStatArr(MG_EigeneFiguren, MG_Own_Counter, MG_FIGUR_SCHAF);
						}
						else if (temp == MG_FIGUR_BALROG)
						{
							C_MG_SPIELFIGUR_WalkToField(Hero_BALROG, x+y*8);

							MEM_WriteStatArr(MG_EigeneFiguren2, 7, 0);

							MEM_WriteStatArr(MG_EigeneFiguren, MG_Own_Counter, MG_FIGUR_BALROG);
						}
						else if (temp == MG_FIGUR_GOBLIN)
						{
							C_MG_SPIELFIGUR_WalkToField(Hero_GOBLIN, x+y*8);

							MEM_WriteStatArr(MG_EigeneFiguren2, 4, 0);

							MEM_WriteStatArr(MG_EigeneFiguren, MG_Own_Counter, MG_FIGUR_GOBLIN);
						}
						else if (temp == MG_FIGUR_MEATBUG)
						{
							C_MG_SPIELFIGUR_WalkToField(Hero_MEATBUG, x+y*8);

							MEM_WriteStatArr(MG_EigeneFiguren2, 6, 0);

							MEM_WriteStatArr(MG_EigeneFiguren, MG_Own_Counter, MG_FIGUR_MEATBUG);
						}
						else if (temp == MG_FIGUR_HASE)
						{
							C_MG_SPIELFIGUR_WalkToField(Hero_HASE, x+y*8);

							MEM_WriteStatArr(MG_EigeneFiguren2, 5, 0);

							MEM_WriteStatArr(MG_EigeneFiguren, MG_Own_Counter, MG_FIGUR_HASE);
						}
						else if (temp == MG_FIGUR_SNAPPER)
						{
							C_MG_SPIELFIGUR_WalkToField(Hero_SNAPPER, x+y*8);

							MEM_WriteStatArr(MG_EigeneFiguren2, 3, 0);

							MEM_WriteStatArr(MG_EigeneFiguren, MG_Own_Counter, MG_FIGUR_SNAPPER);
						}
						else if (temp == MG_FIGUR_BLOODFLY)
						{
							C_MG_SPIELFIGUR_WalkToField(Hero_BLOODFLY, x+y*8);

							MEM_WriteStatArr(MG_EigeneFiguren2, 8, 0);

							MEM_WriteStatArr(MG_EigeneFiguren, MG_Own_Counter, MG_FIGUR_BLOODFLY);
						}
						else if (temp == MG_FIGUR_STONEGUARDIAN)
						{
							C_MG_SPIELFIGUR_WalkToField(Hero_STONEGUARDIAN, x+y*8);

							MEM_WriteStatArr(MG_EigeneFiguren2, 9, 0);

							MEM_WriteStatArr(MG_EigeneFiguren, MG_Own_Counter, MG_FIGUR_STONEGUARDIAN);
						};

						MG_Own_Counter += 1;

						temp = 0;

						MG_Spieler01 = FALSE;
						MG_Spieler02 = TRUE;

						B_MG_ResetStartReihe();
					};
				};
			}
			else if (MEM_KeyState(MOUSE_BUTTONRIGHT) == KEY_PRESSED)
			{
				temp = 0;

				B_MG_ResetStartReihe();
			};
		}
		else
		{
			var int ptr; ptr = MEM_StackPos.position;

			y = 1;
			x = r_max(7);

			if (B_MG_FeldBesetzt(1, x, y))
			{
				MEM_StackPos.position = ptr;
			};

			if (MG_CurrentOpp == MG_GEGNER_RUEDIGER)
			{
				if (MG_Opp_Counter == 0)
				{
					temp = MG_FIGUR_SCHAF;
				}
				else if (MG_Opp_Counter == 1)
				{
					temp = MG_FIGUR_STONEGUARDIAN;
				}
				else if (MG_Opp_Counter == 2)
				{
					temp = MG_FIGUR_HASE;
				}
				else if (MG_Opp_Counter == 3)
				{
					temp = MG_FIGUR_BLOODFLY;
				}
				else if (MG_Opp_Counter == 4)
				{
					temp = MG_FIGUR_TROLL;
				};
			};

			if (temp == MG_FIGUR_TROLL)
			{
				C_MG_SPIELFIGUR_WalkToField(Opp_Troll, x+y*8);

				MEM_WriteStatArr(MG_GegnerFiguren, MG_Opp_Counter, MG_FIGUR_TROLL);
			}
			else if (temp == MG_FIGUR_MINECRAWLERQUEEN)
			{
				C_MG_SPIELFIGUR_WalkToField(Opp_MINECRAWLERQUEEN, x+y*8);

				MEM_WriteStatArr(MG_GegnerFiguren, MG_Opp_Counter, MG_FIGUR_MINECRAWLERQUEEN);
			}
			else if (temp == MG_FIGUR_SCHAF)
			{
				C_MG_SPIELFIGUR_WalkToField(Opp_SCHAF, x+y*8);

				MEM_WriteStatArr(MG_GegnerFiguren, MG_Opp_Counter, MG_FIGUR_SCHAF);
			}
			else if (temp == MG_FIGUR_BALROG)
			{
				C_MG_SPIELFIGUR_WalkToField(Opp_BALROG, x+y*8);

				MEM_WriteStatArr(MG_GegnerFiguren, MG_Opp_Counter, MG_FIGUR_BALROG);
			}
			else if (temp == MG_FIGUR_GOBLIN)
			{
				C_MG_SPIELFIGUR_WalkToField(Opp_GOBLIN, x+y*8);

				MEM_WriteStatArr(MG_GegnerFiguren, MG_Opp_Counter, MG_FIGUR_GOBLIN);
			}
			else if (temp == MG_FIGUR_MEATBUG)
			{
				C_MG_SPIELFIGUR_WalkToField(Opp_MEATBUG, x+y*8);

				MEM_WriteStatArr(MG_GegnerFiguren, MG_Opp_Counter, MG_FIGUR_MEATBUG);
			}
			else if (temp == MG_FIGUR_HASE)
			{
				C_MG_SPIELFIGUR_WalkToField(Opp_HASE, x+y*8);

				MEM_WriteStatArr(MG_GegnerFiguren, MG_Opp_Counter, MG_FIGUR_HASE);
			}
			else if (temp == MG_FIGUR_SNAPPER)
			{
				C_MG_SPIELFIGUR_WalkToField(Opp_SNAPPER, x+y*8);

				MEM_WriteStatArr(MG_GegnerFiguren, MG_Opp_Counter, MG_FIGUR_SNAPPER);
			}
			else if (temp == MG_FIGUR_BLOODFLY)
			{
				C_MG_SPIELFIGUR_WalkToField(Opp_BLOODFLY, x+y*8);

				MEM_WriteStatArr(MG_GegnerFiguren, MG_Opp_Counter, MG_FIGUR_BLOODFLY);
			}
			else if (temp == MG_FIGUR_STONEGUARDIAN)
			{
				C_MG_SPIELFIGUR_WalkToField(Opp_STONEGUARDIAN, x+y*8);

				MEM_WriteStatArr(MG_GegnerFiguren, MG_Opp_Counter, MG_FIGUR_STONEGUARDIAN);
			};

			MG_Opp_Counter += 1;

			temp = 0;

			MG_Spieler01 = TRUE;
			MG_Spieler02 = FALSE;
		};

		if (MG_Own_Counter == 5)
		&& (MG_Opp_Counter == 5)
		{
			MG_GameState = 4;

			temp = 0;

			B_MG_ResetWalks(0);
			B_MG_ResetWalks(1);
		};
	}
	else if (MG_GameState == 4) // das eigentliche Spiel
	{
		if (MG_Spieler01 == TRUE)
		{
			// ToDo: Alle Figuren verrutschen, also prüfen, welche noch nicht gerutscht sind und so und bei allen dann switchen

			if (MEM_KeyState(MOUSE_BUTTONLEFT) == KEY_PRESSED)
			{
				if (temp == 0)
				{
					xy = Print_Screen[PS_Y]/10;

					if (Cursor_X >= Print_Screen[PS_X]/2-4*xy)
					&& (Cursor_X < Print_Screen[PS_X]/2+4*xy)
					{
						y = CURSOR_Y/xy;
						x = (CURSOR_X-(Print_Screen[PS_X]/2-4*xy))/xy;

						if (y >= 10)
						|| (x >= 8)
						{
							return;
						};

						if (!B_MG_FeldBesetzt(0, x, y))
						{
							return;
						};

						temp = MEM_ReadStatArr(MG_Spielfeld_Figur, x+8*y);

						// Hier noch walked-Variable prüfen, Figur darf pro Zug nur ein Mal Laufen

						if (temp == MG_FIGUR_TROLL)
						{
							if (Hero_Troll.walked == TRUE)
							{
								temp = 0;

								return;
							};

							B_MG_SetPossibilities(Hero_Troll);
						}
						else if (temp == MG_FIGUR_Minecrawlerqueen)
						{
							if (Hero_Minecrawlerqueen.walked == TRUE)
							{
								temp = 0;

								return;
							};

							B_MG_SetPossibilities(Hero_Minecrawlerqueen);
						}
						else if (temp == MG_FIGUR_Schaf)
						{
							if (Hero_Schaf.walked == TRUE)
							{
								temp = 0;

								return;
							};

							B_MG_SetPossibilities(Hero_Schaf);
						}
						else if (temp == MG_FIGUR_Hase)
						{
							if (Hero_Hase.walked == TRUE)
							{
								temp = 0;

								return;
							};
	
							B_MG_SetPossibilities(Hero_Hase);
						}
						else if (temp == MG_FIGUR_Meatbug)
						{
							if (Hero_Meatbug.walked == TRUE)
							{
								temp = 0;

								return;
							};

							B_MG_SetPossibilities(Hero_Meatbug);
						}
						else if (temp == MG_FIGUR_Goblin)
						{
							if (Hero_Goblin.walked == TRUE)
							{
								temp = 0;

								return;
							};

							B_MG_SetPossibilities(Hero_Goblin);
						}
						else if (temp == MG_FIGUR_Snapper)
						{
							if (Hero_Snapper.walked == TRUE)
							{
								temp = 0;

								return;
							};

							B_MG_SetPossibilities(Hero_Snapper);
						}
						else if (temp == MG_FIGUR_Stoneguardian)
						{
							if (Hero_Stoneguardian.walked == TRUE)
							{
								temp = 0;

								return;
							};

							B_MG_SetPossibilities(Hero_Stoneguardian);
						}
						else if (temp == MG_FIGUR_Balrog)
						{
							if (Hero_Balrog.walked == TRUE)
							{
								temp = 0;

								return;
							};

							B_MG_SetPossibilities(Hero_Balrog);
						}
						else if (temp == MG_FIGUR_Bloodfly)
						{
							if (Hero_Bloodfly.walked == TRUE)
							{
								temp = 0;

								return;
							};

							B_MG_SetPossibilities(Hero_Bloodfly);
						};

						B_MG_MarkFelder();
					};
				}
				else
				{
					xy = Print_Screen[PS_Y]/10;

					if (Cursor_X >= Print_Screen[PS_X]/2-4*xy)
					&& (Cursor_X < Print_Screen[PS_X]/2+4*xy)
					{
						y = CURSOR_Y/xy;
						x = (CURSOR_X-(Print_Screen[PS_X]/2-4*xy))/xy;

						if (y >= 10)
						|| (x >= 8)
						{
							return;
						};

						if (MEM_ReadStatArr(MG_Spielfeld_Possibilities, x+8*y) == 0)
						{
							return;
						};

						if (temp == MG_FIGUR_TROLL)
						{
							C_MG_SPIELFIGUR_WalkToField(Hero_Troll, x+8*y);
						}
						else if (temp == MG_FIGUR_Minecrawlerqueen)
						{
							C_MG_SPIELFIGUR_WalkToField(Hero_Minecrawlerqueen, x+8*y);
						}
						else if (temp == MG_FIGUR_Schaf)
						{
							C_MG_SPIELFIGUR_WalkToField(Hero_Schaf, x+8*y);
						}
						else if (temp == MG_FIGUR_Hase)
						{
							C_MG_SPIELFIGUR_WalkToField(Hero_Hase, x+8*y);
						}
						else if (temp == MG_FIGUR_Meatbug)
						{
							C_MG_SPIELFIGUR_WalkToField(Hero_Meatbug, x+8*y);
						}
						else if (temp == MG_FIGUR_Goblin)
						{
							C_MG_SPIELFIGUR_WalkToField(Hero_Goblin, x+8*y);
						}
						else if (temp == MG_FIGUR_Snapper)
						{
							C_MG_SPIELFIGUR_WalkToField(Hero_Snapper, x+8*y);
						}
						else if (temp == MG_FIGUR_Stoneguardian)
						{
							C_MG_SPIELFIGUR_WalkToField(Hero_Stoneguardian, x+8*y);
						}
						else if (temp == MG_FIGUR_Balrog)
						{
							C_MG_SPIELFIGUR_WalkToField(Hero_Balrog, x+8*y);
						}
						else if (temp == MG_FIGUR_Bloodfly)
						{
							C_MG_SPIELFIGUR_WalkToField(Hero_Bloodfly, x+8*y);
						};

						B_MG_ResetFelder();

						temp = 0;
					};
				};
			}
			else if (MEM_KeyState(MOUSE_BUTTONRIGHT) == KEY_PRESSED)
			{
				temp = 0;

				B_MG_ResetFelder();
			};

			if (!B_MG_StillWalks())
			{
				MG_Spieler01 = FALSE;
				MG_Spieler02 = TRUE;

				B_MG_ResetWalks(0);
			};
		}
		else
		{
			var int i; i = 0;

			var int loop; loop = MEM_StackPos.position;

			if (i < 5)
			{
				var int counter;
				counter = 0;

				var int j;
				var int loop2;

				if (MEM_ReadStatArr(MG_GegnerFiguren, i) == MG_FIGUR_BLOODFLY)
				{
					B_MG_SetPossibilities(Opp_Bloodfly);

					counter = B_MG_GetPossibilities();

					if (counter == 0)
					{
						i += 1;

						MEM_StackPos.position = loop;
					}
					else if (counter == 1)
					{
						j = 0;

						loop2 = MEM_StackPos.position;

						if (j < 80)
						{
							if (MEM_ReadStatArr(MG_Spielfeld_Possibilities, j) == 1)
							{
								C_MG_SPIELFIGUR_WalkToField(Opp_Bloodfly, j);

								i += 1;

								MEM_StackPos.position = loop;
							};

							j += 1;

							MEM_StackPos.position = loop2;
						};
					}
					else
					{
						B_MG_WalkToBestPossibility(Opp_Bloodfly);

						i += 1;

						MEM_StackPos.position = loop;
					};
				}
				else if (MEM_ReadStatArr(MG_GegnerFiguren, i) == MG_FIGUR_Schaf)
				{
					B_MG_SetPossibilities(Opp_Schaf);

					counter = B_MG_GetPossibilities();

					if (counter == 0)
					{
						i += 1;

						MEM_StackPos.position = loop;
					}
					else if (counter == 1)
					{
						j = 0;

						loop2 = MEM_StackPos.position;

						if (j < 80)
						{
							if (MEM_ReadStatArr(MG_Spielfeld_Possibilities, j) == 1)
							{
								C_MG_SPIELFIGUR_WalkToField(Opp_Schaf, j);

								i += 1;

								MEM_StackPos.position = loop;
							};

							j += 1;

							MEM_StackPos.position = loop2;
						};
					}
					else
					{
						B_MG_WalkToBestPossibility(Opp_Schaf);

						i += 1;

						MEM_StackPos.position = loop;
					};
				}
				else if (MEM_ReadStatArr(MG_GegnerFiguren, i) == MG_FIGUR_Hase)
				{
					B_MG_SetPossibilities(Opp_Hase);

					counter = B_MG_GetPossibilities();

					if (counter == 0)
					{
						i += 1;

						MEM_StackPos.position = loop;
					}
					else if (counter == 1)
					{
						j = 0;

						loop2 = MEM_StackPos.position;

						if (j < 80)
						{
							if (MEM_ReadStatArr(MG_Spielfeld_Possibilities, j) == 1)
							{
								C_MG_SPIELFIGUR_WalkToField(Opp_Hase, j);

								i += 1;

								MEM_StackPos.position = loop;
							};

							j += 1;

							MEM_StackPos.position = loop2;
						};
					}
					else
					{
						B_MG_WalkToBestPossibility(Opp_Hase);

						i += 1;

						MEM_StackPos.position = loop;
					};
				}
				else if (MEM_ReadStatArr(MG_GegnerFiguren, i) == MG_FIGUR_Meatbug)
				{
					B_MG_SetPossibilities(Opp_Meatbug);

					counter = B_MG_GetPossibilities();

					if (counter == 0)
					{
						i += 1;

						MEM_StackPos.position = loop;
					}
					else if (counter == 1)
					{
						j = 0;

						loop2 = MEM_StackPos.position;

						if (j < 80)
						{
							if (MEM_ReadStatArr(MG_Spielfeld_Possibilities, j) == 1)
							{
								C_MG_SPIELFIGUR_WalkToField(Opp_Meatbug, j);

								i += 1;

								MEM_StackPos.position = loop;
							};

							j += 1;

							MEM_StackPos.position = loop2;
						};
					}
					else
					{
						B_MG_WalkToBestPossibility(Opp_Meatbug);

						i += 1;

						MEM_StackPos.position = loop;
					};
				}
				else if (MEM_ReadStatArr(MG_GegnerFiguren, i) == MG_FIGUR_Goblin)
				{
					B_MG_SetPossibilities(Opp_Goblin);

					counter = B_MG_GetPossibilities();

					if (counter == 0)
					{
						i += 1;

						MEM_StackPos.position = loop;
					}
					else if (counter == 1)
					{
						j = 0;

						loop2 = MEM_StackPos.position;

						if (j < 80)
						{
							if (MEM_ReadStatArr(MG_Spielfeld_Possibilities, j) == 1)
							{
								C_MG_SPIELFIGUR_WalkToField(Opp_Goblin, j);

								i += 1;

								MEM_StackPos.position = loop;
							};

							j += 1;

							MEM_StackPos.position = loop2;
						};
					}
					else
					{
						B_MG_WalkToBestPossibility(Opp_Goblin);

						i += 1;

						MEM_StackPos.position = loop;
					};
				}
				else if (MEM_ReadStatArr(MG_GegnerFiguren, i) == MG_FIGUR_Snapper)
				{
					B_MG_SetPossibilities(Opp_Snapper);

					counter = B_MG_GetPossibilities();

					if (counter == 0)
					{
						i += 1;

						MEM_StackPos.position = loop;
					}
					else if (counter == 1)
					{
						j = 0;

						loop2 = MEM_StackPos.position;

						if (j < 80)
						{
							if (MEM_ReadStatArr(MG_Spielfeld_Possibilities, j) == 1)
							{
								C_MG_SPIELFIGUR_WalkToField(Opp_Snapper, j);

								i += 1;

								MEM_StackPos.position = loop;
							};

							j += 1;

							MEM_StackPos.position = loop2;
						};
					}
					else
					{
						B_MG_WalkToBestPossibility(Opp_Snapper);

						i += 1;

						MEM_StackPos.position = loop;
					};
				}
				else if (MEM_ReadStatArr(MG_GegnerFiguren, i) == MG_FIGUR_Troll)
				{
					B_MG_SetPossibilities(Opp_Troll);

					counter = B_MG_GetPossibilities();

					if (counter == 0)
					{
						i += 1;

						MEM_StackPos.position = loop;
					}
					else if (counter == 1)
					{
						j = 0;

						loop2 = MEM_StackPos.position;

						if (j < 80)
						{
							if (MEM_ReadStatArr(MG_Spielfeld_Possibilities, j) == 1)
							{
								C_MG_SPIELFIGUR_WalkToField(Opp_Troll, j);

								i += 1;

								MEM_StackPos.position = loop;
							};

							j += 1;

							MEM_StackPos.position = loop2;
						};
					}
					else
					{
						B_MG_WalkToBestPossibility(Opp_Troll);

						i += 1;

						MEM_StackPos.position = loop;
					};
				}
				else if (MEM_ReadStatArr(MG_GegnerFiguren, i) == MG_FIGUR_Minecrawlerqueen)
				{
					B_MG_SetPossibilities(Opp_Minecrawlerqueen);

					counter = B_MG_GetPossibilities();

					if (counter == 0)
					{
						i += 1;

						MEM_StackPos.position = loop;
					}
					else if (counter == 1)
					{
						j = 0;

						loop2 = MEM_StackPos.position;

						if (j < 80)
						{
							if (MEM_ReadStatArr(MG_Spielfeld_Possibilities, j) == 1)
							{
								C_MG_SPIELFIGUR_WalkToField(Opp_Minecrawlerqueen, j);

								i += 1;

								MEM_StackPos.position = loop;
							};

							j += 1;

							MEM_StackPos.position = loop2;
						};
					}
					else
					{
						B_MG_WalkToBestPossibility(Opp_Minecrawlerqueen);

						i += 1;

						MEM_StackPos.position = loop;
					};
				}
				else if (MEM_ReadStatArr(MG_GegnerFiguren, i) == MG_FIGUR_Balrog)
				{
					B_MG_SetPossibilities(Opp_Balrog);

					counter = B_MG_GetPossibilities();

					if (counter == 0)
					{
						i += 1;

						MEM_StackPos.position = loop;
					}
					else if (counter == 1)
					{
						j = 0;

						loop2 = MEM_StackPos.position;

						if (j < 80)
						{
							if (MEM_ReadStatArr(MG_Spielfeld_Possibilities, j) == 1)
							{
								C_MG_SPIELFIGUR_WalkToField(Opp_Balrog, j);

								i += 1;

								MEM_StackPos.position = loop;
							};

							j += 1;

							MEM_StackPos.position = loop2;
						};
					}
					else
					{
						B_MG_WalkToBestPossibility(Opp_Balrog);

						i += 1;

						MEM_StackPos.position = loop;
					};
				}
				else if (MEM_ReadStatArr(MG_GegnerFiguren, i) == MG_FIGUR_Stoneguardian)
				{
					B_MG_SetPossibilities(Opp_Stoneguardian);

					counter = B_MG_GetPossibilities();

					if (counter == 0)
					{
						i += 1;

						MEM_StackPos.position = loop;
					}
					else if (counter == 1)
					{
						j = 0;

						loop2 = MEM_StackPos.position;

						if (j < 80)
						{
							if (MEM_ReadStatArr(MG_Spielfeld_Possibilities, j) == 1)
							{
								C_MG_SPIELFIGUR_WalkToField(Opp_Stoneguardian, j);

								i += 1;

								MEM_StackPos.position = loop;
							};

							j += 1;

							MEM_StackPos.position = loop2;
						};
					}
					else
					{
						B_MG_WalkToBestPossibility(Opp_Stoneguardian);

						i += 1;

						MEM_StackPos.position = loop;
					};
				}
				else
				{
					i += 1;

					MEM_StackPos.position = loop;
				};
			};

			MG_Spieler01 = TRUE;
			MG_Spieler02 = FALSE;

			B_MG_ResetWalks(1);
		};
	}
	else if (MG_GameState == 5) // Spiel beenden
	{
		B_MG_Cleanup();

		if (Mod_Maussteuerung)
		{
			Cursor_NoEngine = 1;
		};

		FF_Remove(B_MG_GameLoop);

		MG_GameState = 0;
	};
};