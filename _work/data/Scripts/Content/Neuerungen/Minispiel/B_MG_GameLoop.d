// Game-Loop, am besten per FrameFunction

FUNC VOID B_MG_GameLoop() {
	var int xy2;
	var int xy; // x/y-Größe der Felder, da quadratisch

	// Start-X ermitteln

	var int x;
	var int y;
	
	var int msg;
	var Spine_Message smsg;

	if (MG_GameState == 0) { // hier werden nur das Feld und alle Variablen initialisiert
		B_MG_InitialiseFeld();

		MG_Spieler01 = FALSE;
		MG_Spieler02 = FALSE;

		Cursor_Show();
		Cursor_NoEngine = 1;

		MG_GameState = 1;
	} else if (MG_GameState == 1) { // auswürfeln, wer das Spiel beginnt
		if (MG_CurrentOpp == MG_GEGNER_ONLINE) {
			var string username; username = Spine_GetCurrentUsername();
			var string name; name = Spine_GetPlayerUsername(0);
			if (Hlp_StrCmp(name, username)) {
				Online_Host = TRUE;
				
				MG_Starter = r_max(1);
				
				var int msgPtr; msgPtr = Spine_CreateMessage(SPINE_MESSAGETYPE_INT);
				var Spine_IntMessage sendStarterMsg; sendStarterMsg = MEM_PtrToInst(msgPtr);
				sendStarterMsg.userType = MSGTYPE_STARTER;
				sendStarterMsg.param = (MG_Starter + 1) % 2;
				
				Spine_SendMessage(msgPtr);

				MG_GameState = 2;
			} else {
				Online_Host = FALSE;
				
				msg = Spine_ReceiveMessage();

				if (MP_TimeOut >= 10) {
					MG_CurrentOpp = MG_GEGNER_FALLBACK;
				};

				MP_TimeOut += 1;

				if (msg > 0) {
					smsg = MEM_PtrToInst(msg);
					if (smsg.userType == MSGTYPE_STARTER) {
						var Spine_IntMessage starterMsg; starterMsg = MEM_PtrToInst(msg);
						MG_Starter = starterMsg.param;

						MG_GameState = 2;

						MP_TimeOut = 0;
					};
					Spine_DeleteMessage(msg);
				};
			};
		} else {
			MG_Starter = r_max(1);

			MG_GameState = 2;
		};
	} else if (MG_GameState == 2) { // Figuren setzen (Start)
		if (MG_Starter == 0) {
			MG_Spieler01 = TRUE;
		} else {
			MG_Spieler02 = TRUE;
		};

		MG_GameState = 3;
	} else if (MG_GameState == 3) { // Figuren setzen (Loop)
		if (MG_Spieler01 == TRUE) {
			if (MEM_KeyState(MOUSE_BUTTONLEFT) == KEY_PRESSED) {
				// Koordinaten ermitteln

				xy = Print_Screen[PS_Y]/12;
				xy2 = Print_Screen[PS_Y]/10;

				y = xy2;
				x = Print_Screen[PS_X]/2-6*xy2;

				if (tempFigur != 0) {
					xy = Print_Screen[PS_Y]/10;

					if (Cursor_X >= Print_Screen[PS_X]/2-4*xy)
					&& (Cursor_X < Print_Screen[PS_X]/2+4*xy) {
						y = CURSOR_Y/xy;
						x = (CURSOR_X-(Print_Screen[PS_X]/2-4*xy))/xy;

						if (y != 8) {
							return;
						};

						if (B_MG_FeldBesetzt(0, x, y)) {
							return;
						};
						
						if (MG_CurrentOpp == MG_GEGNER_ONLINE) {
							var int placementMsgPtr; placementMsgPtr = Spine_CreateMessage(SPINE_MESSAGETYPE_INT3);
							var Spine_Int3Message sendPlacementMsg; sendPlacementMsg = MEM_PtrToInst(placementMsgPtr);
							sendPlacementMsg.userType = MSGTYPE_PLACEMENT;
							sendPlacementMsg.param1 = x;
							sendPlacementMsg.param2 = 9 - y;
							sendPlacementMsg.param3 = tempFigur;
							
							Spine_SendMessage(placementMsgPtr);
						};

						if (tempFigur == MG_FIGUR_TROLL) {
							C_MG_SPIELFIGUR_WalkToField(Hero_Troll, x + y * 8);

							MEM_WriteStatArr(MG_EigeneFiguren, MG_Own_Counter, MG_FIGUR_TROLL);
						} else if (tempFigur == MG_FIGUR_MINECRAWLERQUEEN) {
							C_MG_SPIELFIGUR_WalkToField(Hero_MINECRAWLERQUEEN, x + y * 8);

							MEM_WriteStatArr(MG_EigeneFiguren, MG_Own_Counter, MG_FIGUR_MINECRAWLERQUEEN);
						} else if (tempFigur == MG_FIGUR_SCHAF) {
							C_MG_SPIELFIGUR_WalkToField(Hero_SCHAF, x + y * 8);

							MEM_WriteStatArr(MG_EigeneFiguren, MG_Own_Counter, MG_FIGUR_SCHAF);
						} else if (tempFigur == MG_FIGUR_BALROG) {
							C_MG_SPIELFIGUR_WalkToField(Hero_BALROG, x + y * 8);

							MEM_WriteStatArr(MG_EigeneFiguren, MG_Own_Counter, MG_FIGUR_BALROG);
						} else if (tempFigur == MG_FIGUR_GOBLIN) {
							C_MG_SPIELFIGUR_WalkToField(Hero_GOBLIN, x + y * 8);

							MEM_WriteStatArr(MG_EigeneFiguren, MG_Own_Counter, MG_FIGUR_GOBLIN);
						} else if (tempFigur == MG_FIGUR_MEATBUG) {
							C_MG_SPIELFIGUR_WalkToField(Hero_MEATBUG, x + y * 8);

							MEM_WriteStatArr(MG_EigeneFiguren, MG_Own_Counter, MG_FIGUR_MEATBUG);
						} else if (tempFigur == MG_FIGUR_HASE) {
							C_MG_SPIELFIGUR_WalkToField(Hero_HASE, x + y * 8);

							MEM_WriteStatArr(MG_EigeneFiguren, MG_Own_Counter, MG_FIGUR_HASE);
						} else if (tempFigur == MG_FIGUR_SNAPPER) {
							C_MG_SPIELFIGUR_WalkToField(Hero_SNAPPER, x + y * 8);

							MEM_WriteStatArr(MG_EigeneFiguren, MG_Own_Counter, MG_FIGUR_SNAPPER);
						} else if (tempFigur == MG_FIGUR_BLOODFLY) {
							C_MG_SPIELFIGUR_WalkToField(Hero_BLOODFLY, x + y * 8);

							MEM_WriteStatArr(MG_EigeneFiguren, MG_Own_Counter, MG_FIGUR_BLOODFLY);
						} else if (tempFigur == MG_FIGUR_STONEGUARDIAN) {
							C_MG_SPIELFIGUR_WalkToField(Hero_STONEGUARDIAN, x + y * 8);

							MEM_WriteStatArr(MG_EigeneFiguren, MG_Own_Counter, MG_FIGUR_STONEGUARDIAN);
						};

						MEM_WriteStatArr(MG_EigeneFiguren2, tempFigur - 1, 0);

						MG_Own_Counter += 1;

						tempFigur = 0;

						MG_Spieler01 = FALSE;
						MG_Spieler02 = TRUE;

						B_MG_ResetStartReihe();
					};
				};
			} else if (MEM_KeyState(MOUSE_BUTTONRIGHT) == KEY_PRESSED) {
				tempFigur = 0;

				B_MG_ResetStartReihe();
			};
		} else {
			if (MG_CurrentOpp == MG_GEGNER_ONLINE) {
				msg = Spine_ReceiveMessage();

				if (MP_TimeOut >= 60) {
					MG_CurrentOpp = MG_GEGNER_FALLBACK;
				};

				MP_TimeOut += 1;

				if (msg > 0) {
					smsg = MEM_PtrToInst(msg);
					if (smsg.userType == MSGTYPE_PLACEMENT) {
						var Spine_Int3Message placementMsg; placementMsg = MEM_PtrToInst(msg);
						x = placementMsg.param1;
						y = placementMsg.param2;
						tempFigur = placementMsg.param3;

						if (tempFigur == MG_FIGUR_TROLL) {
							C_MG_SPIELFIGUR_WalkToField(Opp_Troll, x + y * 8);

							MEM_WriteStatArr(MG_GegnerFiguren, MG_Opp_Counter, MG_FIGUR_TROLL);
						} else if (tempFigur == MG_FIGUR_MINECRAWLERQUEEN) {
							C_MG_SPIELFIGUR_WalkToField(Opp_MINECRAWLERQUEEN, x + y * 8);

							MEM_WriteStatArr(MG_GegnerFiguren, MG_Opp_Counter, MG_FIGUR_MINECRAWLERQUEEN);
						} else if (tempFigur == MG_FIGUR_SCHAF) {
							C_MG_SPIELFIGUR_WalkToField(Opp_SCHAF, x + y * 8);

							MEM_WriteStatArr(MG_GegnerFiguren, MG_Opp_Counter, MG_FIGUR_SCHAF);
						} else if (tempFigur == MG_FIGUR_BALROG) {
							C_MG_SPIELFIGUR_WalkToField(Opp_BALROG, x + y * 8);

							MEM_WriteStatArr(MG_GegnerFiguren, MG_Opp_Counter, MG_FIGUR_BALROG);
						} else if (tempFigur == MG_FIGUR_GOBLIN) {
							C_MG_SPIELFIGUR_WalkToField(Opp_GOBLIN, x + y * 8);

							MEM_WriteStatArr(MG_GegnerFiguren, MG_Opp_Counter, MG_FIGUR_GOBLIN);
						} else if (tempFigur == MG_FIGUR_MEATBUG) {
							C_MG_SPIELFIGUR_WalkToField(Opp_MEATBUG, x + y * 8);

							MEM_WriteStatArr(MG_GegnerFiguren, MG_Opp_Counter, MG_FIGUR_MEATBUG);
						} else if (tempFigur == MG_FIGUR_HASE) {
							C_MG_SPIELFIGUR_WalkToField(Opp_HASE, x + y * 8);

							MEM_WriteStatArr(MG_GegnerFiguren, MG_Opp_Counter, MG_FIGUR_HASE);
						} else if (tempFigur == MG_FIGUR_SNAPPER) {
							C_MG_SPIELFIGUR_WalkToField(Opp_SNAPPER, x + y * 8);

							MEM_WriteStatArr(MG_GegnerFiguren, MG_Opp_Counter, MG_FIGUR_SNAPPER);
						} else if (tempFigur == MG_FIGUR_BLOODFLY) {
							C_MG_SPIELFIGUR_WalkToField(Opp_BLOODFLY, x + y * 8);

							MEM_WriteStatArr(MG_GegnerFiguren, MG_Opp_Counter, MG_FIGUR_BLOODFLY);
						} else if (tempFigur == MG_FIGUR_STONEGUARDIAN) {
							C_MG_SPIELFIGUR_WalkToField(Opp_STONEGUARDIAN, x + y * 8);

							MEM_WriteStatArr(MG_GegnerFiguren, MG_Opp_Counter, MG_FIGUR_STONEGUARDIAN);
						};

						MG_Opp_Counter += 1;

						tempFigur = 0;

						MG_Spieler01 = TRUE;
						MG_Spieler02 = FALSE;

						MP_TimeOut = 0;
					};
					Spine_DeleteMessage(msg);
				};
			} else {
				var int ptr; ptr = MEM_StackPos.position;

				y = 1;
				x = r_max(7);

				if (B_MG_FeldBesetzt(1, x, y)) {
					MEM_StackPos.position = ptr;
				};

				if (MG_CurrentOpp == MG_GEGNER_RUEDIGER) {
					if (MG_Opp_Counter == 0) {
						tempFigur = MG_FIGUR_SCHAF;
					} else if (MG_Opp_Counter == 1) {
						tempFigur = MG_FIGUR_STONEGUARDIAN;
					} else if (MG_Opp_Counter == 2) {
						tempFigur = MG_FIGUR_HASE;
					} else if (MG_Opp_Counter == 3) {
						tempFigur = MG_FIGUR_BLOODFLY;
					} else if (MG_Opp_Counter == 4) {
						tempFigur = MG_FIGUR_TROLL;
					};
				} else if (MG_CurrentOpp == MG_GEGNER_SPIELER_ORLAN) {
					if (MG_Opp_Counter == 0) {
						tempFigur = MG_FIGUR_SCHAF;
					} else if (MG_Opp_Counter == 1) {
						tempFigur = MG_FIGUR_SNAPPER;
					} else if (MG_Opp_Counter == 2) {
						tempFigur = MG_FIGUR_HASE;
					} else if (MG_Opp_Counter == 3) {
						tempFigur = MG_FIGUR_BLOODFLY;
					} else if (MG_Opp_Counter == 4) {
						tempFigur = MG_FIGUR_MEATBUG;
					};
				} else if (MG_CurrentOpp == MG_GEGNER_FALLBACK) {
					var int loop; loop = MEM_StackPos.position;
					tempFigur = r_MinMax(1, 11);
					if (IsFigureInUse(tempFigur)) {
						MEM_StackPos.position = loop;
					};
				};

				if (tempFigur == MG_FIGUR_TROLL) {
					C_MG_SPIELFIGUR_WalkToField(Opp_Troll, x + y * 8);

					MEM_WriteStatArr(MG_GegnerFiguren, MG_Opp_Counter, MG_FIGUR_TROLL);
				} else if (tempFigur == MG_FIGUR_MINECRAWLERQUEEN) {
					C_MG_SPIELFIGUR_WalkToField(Opp_MINECRAWLERQUEEN, x + y * 8);

					MEM_WriteStatArr(MG_GegnerFiguren, MG_Opp_Counter, MG_FIGUR_MINECRAWLERQUEEN);
				} else if (tempFigur == MG_FIGUR_SCHAF) {
					C_MG_SPIELFIGUR_WalkToField(Opp_SCHAF, x + y * 8);

					MEM_WriteStatArr(MG_GegnerFiguren, MG_Opp_Counter, MG_FIGUR_SCHAF);
				} else if (tempFigur == MG_FIGUR_BALROG) {
					C_MG_SPIELFIGUR_WalkToField(Opp_BALROG, x + y * 8);

					MEM_WriteStatArr(MG_GegnerFiguren, MG_Opp_Counter, MG_FIGUR_BALROG);
				} else if (tempFigur == MG_FIGUR_GOBLIN) {
					C_MG_SPIELFIGUR_WalkToField(Opp_GOBLIN, x + y * 8);

					MEM_WriteStatArr(MG_GegnerFiguren, MG_Opp_Counter, MG_FIGUR_GOBLIN);
				} else if (tempFigur == MG_FIGUR_MEATBUG) {
					C_MG_SPIELFIGUR_WalkToField(Opp_MEATBUG, x + y * 8);

					MEM_WriteStatArr(MG_GegnerFiguren, MG_Opp_Counter, MG_FIGUR_MEATBUG);
				} else if (tempFigur == MG_FIGUR_HASE) {
					C_MG_SPIELFIGUR_WalkToField(Opp_HASE, x + y * 8);

					MEM_WriteStatArr(MG_GegnerFiguren, MG_Opp_Counter, MG_FIGUR_HASE);
				} else if (tempFigur == MG_FIGUR_SNAPPER) {
					C_MG_SPIELFIGUR_WalkToField(Opp_SNAPPER, x + y * 8);

					MEM_WriteStatArr(MG_GegnerFiguren, MG_Opp_Counter, MG_FIGUR_SNAPPER);
				} else if (tempFigur == MG_FIGUR_BLOODFLY) {
					C_MG_SPIELFIGUR_WalkToField(Opp_BLOODFLY, x + y * 8);

					MEM_WriteStatArr(MG_GegnerFiguren, MG_Opp_Counter, MG_FIGUR_BLOODFLY);
				} else if (tempFigur == MG_FIGUR_STONEGUARDIAN) {
					C_MG_SPIELFIGUR_WalkToField(Opp_STONEGUARDIAN, x + y * 8);

					MEM_WriteStatArr(MG_GegnerFiguren, MG_Opp_Counter, MG_FIGUR_STONEGUARDIAN);
				};

				MG_Opp_Counter += 1;

				tempFigur = 0;

				MG_Spieler01 = TRUE;
				MG_Spieler02 = FALSE;
			};
		};

		if (MG_Own_Counter == 5)
		&& (MG_Opp_Counter == 5) {
			MG_GameState = 4;

			tempFigur = 0;

			B_MG_ResetWalks(0);
			B_MG_ResetWalks(1);
		};
	} else if (MG_GameState == 4) { // das eigentliche Spiel
		if (MG_Spieler01 == TRUE) {
			if (MEM_KeyState(MOUSE_BUTTONLEFT) == KEY_PRESSED) {
				if (tempFigur != 0) {
					xy = Print_Screen[PS_Y]/10;

					if (Cursor_X >= Print_Screen[PS_X]/2-4*xy)
					&& (Cursor_X < Print_Screen[PS_X]/2+4*xy) {
						y = CURSOR_Y/xy;
						x = (CURSOR_X-(Print_Screen[PS_X]/2-4*xy))/xy;

						if (y >= 10)
						|| (x >= 8) {
							return;
						};

						if (MEM_ReadStatArr(MG_Spielfeld_Possibilities, x+8*y) == 0) {
							return;
						};
						
						if (MG_CurrentOpp == MG_GEGNER_ONLINE) {
							var int movementMsgPtr; movementMsgPtr = Spine_CreateMessage(SPINE_MESSAGETYPE_INT3);
							var Spine_Int3Message sendMovementMsg; sendMovementMsg = MEM_PtrToInst(movementMsgPtr);
							sendMovementMsg.userType = MSGTYPE_MOVE;
							sendMovementMsg.param1 = x;
							sendMovementMsg.param2 = 9 - y;
							sendMovementMsg.param3 = tempFigur;
							
							Spine_SendMessage(movementMsgPtr);
						};

						if (tempFigur == MG_FIGUR_TROLL) {
							C_MG_SPIELFIGUR_WalkToField(Hero_Troll, x+8*y);
						} else if (tempFigur == MG_FIGUR_Minecrawlerqueen) {
							C_MG_SPIELFIGUR_WalkToField(Hero_Minecrawlerqueen, x+8*y);
						} else if (tempFigur == MG_FIGUR_Schaf) {
							C_MG_SPIELFIGUR_WalkToField(Hero_Schaf, x+8*y);
						} else if (tempFigur == MG_FIGUR_Hase) {
							C_MG_SPIELFIGUR_WalkToField(Hero_Hase, x+8*y);
						} else if (tempFigur == MG_FIGUR_Meatbug) {
							C_MG_SPIELFIGUR_WalkToField(Hero_Meatbug, x+8*y);
						} else if (tempFigur == MG_FIGUR_Goblin) {
							C_MG_SPIELFIGUR_WalkToField(Hero_Goblin, x+8*y);
						} else if (tempFigur == MG_FIGUR_Snapper) {
							C_MG_SPIELFIGUR_WalkToField(Hero_Snapper, x+8*y);
						} else if (tempFigur == MG_FIGUR_Stoneguardian) {
							C_MG_SPIELFIGUR_WalkToField(Hero_Stoneguardian, x+8*y);
						} else if (tempFigur == MG_FIGUR_Balrog) {
							C_MG_SPIELFIGUR_WalkToField(Hero_Balrog, x+8*y);
						} else if (tempFigur == MG_FIGUR_Bloodfly) {
							C_MG_SPIELFIGUR_WalkToField(Hero_Bloodfly, x+8*y);
						};

						B_MG_ResetFelder();

						tempFigur = 0;
					};
				};
			} else if (MEM_KeyState(MOUSE_BUTTONRIGHT) == KEY_PRESSED) {
				tempFigur = 0;

				B_MG_ResetFelder();
			};

			if (!B_MG_StillWalks()) {
				MG_Spieler01 = FALSE;
				MG_Spieler02 = TRUE;

				B_MG_ResetWalks(0);
				
				if (MG_CurrentOpp == MG_GEGNER_ONLINE) {
					var int finishedMovementMsgPtr; finishedMovementMsgPtr = Spine_CreateMessage(SPINE_MESSAGETYPE_BASE);
					var Spine_Message sendFinishedMovementMsg; sendFinishedMovementMsg = MEM_PtrToInst(finishedMovementMsgPtr);
					sendFinishedMovementMsg.userType = MSGTYPE_FINISHEDMOVE;
					
					Spine_SendMessage(finishedMovementMsgPtr);
				};
			};
		} else {
			if (MG_CurrentOpp == MG_GEGNER_ONLINE) {
				msg = Spine_ReceiveMessage();

				if (MP_TimeOut >= 60) {
					MG_CurrentOpp = MG_GEGNER_FALLBACK;
					MG_Opp_Index = 0;
				};

				MP_TimeOut += 1;

				if (msg > 0) {
					smsg = MEM_PtrToInst(msg);
					if (smsg.userType == MSGTYPE_MOVE) {
						var Spine_Int3Message movementMsg; movementMsg = MEM_PtrToInst(msg);
						x = movementMsg.param1;
						y = movementMsg.param2;
						tempFigur = movementMsg.param3;

						if (tempFigur == MG_FIGUR_TROLL) {
							C_MG_SPIELFIGUR_WalkToField(Opp_Troll, x + y * 8);
						} else if (tempFigur == MG_FIGUR_MINECRAWLERQUEEN) {
							C_MG_SPIELFIGUR_WalkToField(Opp_MINECRAWLERQUEEN, x + y * 8);
						} else if (tempFigur == MG_FIGUR_SCHAF) {
							C_MG_SPIELFIGUR_WalkToField(Opp_SCHAF, x + y * 8);
						} else if (tempFigur == MG_FIGUR_BALROG) {
							C_MG_SPIELFIGUR_WalkToField(Opp_BALROG, x + y * 8);
						} else if (tempFigur == MG_FIGUR_GOBLIN) {
							C_MG_SPIELFIGUR_WalkToField(Opp_GOBLIN, x + y * 8);
						} else if (tempFigur == MG_FIGUR_MEATBUG) {
							C_MG_SPIELFIGUR_WalkToField(Opp_MEATBUG, x + y * 8);
						} else if (tempFigur == MG_FIGUR_HASE) {
							C_MG_SPIELFIGUR_WalkToField(Opp_HASE, x + y * 8);
						} else if (tempFigur == MG_FIGUR_SNAPPER) {
							C_MG_SPIELFIGUR_WalkToField(Opp_SNAPPER, x + y * 8);
						} else if (tempFigur == MG_FIGUR_BLOODFLY) {
							C_MG_SPIELFIGUR_WalkToField(Opp_BLOODFLY, x + y * 8);
						} else if (tempFigur == MG_FIGUR_STONEGUARDIAN) {
							C_MG_SPIELFIGUR_WalkToField(Opp_STONEGUARDIAN, x + y * 8);
						};

						MP_TimeOut = 0;
					} else if (smsg.userType == MSGTYPE_FINISHEDMOVE) {
						MG_Opp_Index = 0;

						MG_Spieler01 = TRUE;
						MG_Spieler02 = FALSE;

						B_MG_MarkToWalk();
						B_MG_ResetWalks(1);

						MP_TimeOut = 0;
					};
					Spine_DeleteMessage(msg);
				};
			} else {
				if (MG_Opp_Time >= TimeCounter_Real - 2) {
					return;
				};

				if (MG_Opp_Index < 5) {
					MG_Opp_Time = TimeCounter_Real;

					var int counter;
					counter = 0;

					var int j;
					var int loop2;

					if (MEM_ReadStatArr(MG_GegnerFiguren, MG_Opp_Index) == MG_FIGUR_BLOODFLY) {
						B_MG_SetPossibilities(Opp_Bloodfly);

						counter = B_MG_GetPossibilities();

						if (counter == 0) {
							MG_Opp_Index += 1;

							return;
						} else if (counter == 1) {
							j = 0;

							loop2 = MEM_StackPos.position;

							if (j < 80) {
								if (MEM_ReadStatArr(MG_Spielfeld_Possibilities, j) == 1) {
									C_MG_SPIELFIGUR_WalkToField(Opp_Bloodfly, j);

									MG_Opp_Index += 1;

									return;
								};

								j += 1;

								MEM_StackPos.position = loop2;
							};
						} else {
							B_MG_WalkToBestPossibility(Opp_Bloodfly);

							MG_Opp_Index += 1;

							return;
						};
					} else if (MEM_ReadStatArr(MG_GegnerFiguren, MG_Opp_Index) == MG_FIGUR_Schaf) {
						B_MG_SetPossibilities(Opp_Schaf);

						counter = B_MG_GetPossibilities();

						if (counter == 0) {
							MG_Opp_Index += 1;

							return;
						} else if (counter == 1) {
							j = 0;

							loop2 = MEM_StackPos.position;

							if (j < 80) {
								if (MEM_ReadStatArr(MG_Spielfeld_Possibilities, j) == 1) {
									C_MG_SPIELFIGUR_WalkToField(Opp_Schaf, j);

									MG_Opp_Index += 1;

									return;
								};

								j += 1;

								MEM_StackPos.position = loop2;
							};
						} else {
							B_MG_WalkToBestPossibility(Opp_Schaf);

							MG_Opp_Index += 1;

							return;
						};
					} else if (MEM_ReadStatArr(MG_GegnerFiguren, MG_Opp_Index) == MG_FIGUR_Hase) {
						B_MG_SetPossibilities(Opp_Hase);

						counter = B_MG_GetPossibilities();

						if (counter == 0) {
							MG_Opp_Index += 1;

							return;
						} else if (counter == 1) {
							j = 0;

							loop2 = MEM_StackPos.position;

							if (j < 80) {
								if (MEM_ReadStatArr(MG_Spielfeld_Possibilities, j) == 1) {
									C_MG_SPIELFIGUR_WalkToField(Opp_Hase, j);

									MG_Opp_Index += 1;

									return;
								};

								j += 1;

								MEM_StackPos.position = loop2;
							};
						} else {
							B_MG_WalkToBestPossibility(Opp_Hase);

							MG_Opp_Index += 1;

							return;
						};
					} else if (MEM_ReadStatArr(MG_GegnerFiguren, MG_Opp_Index) == MG_FIGUR_Meatbug) {
						B_MG_SetPossibilities(Opp_Meatbug);

						counter = B_MG_GetPossibilities();

						if (counter == 0) {
							MG_Opp_Index += 1;

							return;
						} else if (counter == 1) {
							j = 0;

							loop2 = MEM_StackPos.position;

							if (j < 80) {
								if (MEM_ReadStatArr(MG_Spielfeld_Possibilities, j) == 1) {
									C_MG_SPIELFIGUR_WalkToField(Opp_Meatbug, j);

									MG_Opp_Index += 1;

									return;
								};

								j += 1;

								MEM_StackPos.position = loop2;
							};
						} else {
							B_MG_WalkToBestPossibility(Opp_Meatbug);

							MG_Opp_Index += 1;

							return;
						};
					} else if (MEM_ReadStatArr(MG_GegnerFiguren, MG_Opp_Index) == MG_FIGUR_Goblin) {
						B_MG_SetPossibilities(Opp_Goblin);

						counter = B_MG_GetPossibilities();

						if (counter == 0) {
							MG_Opp_Index += 1;

							return;
						} else if (counter == 1) {
							j = 0;

							loop2 = MEM_StackPos.position;

							if (j < 80) {
								if (MEM_ReadStatArr(MG_Spielfeld_Possibilities, j) == 1) {
									C_MG_SPIELFIGUR_WalkToField(Opp_Goblin, j);

									MG_Opp_Index += 1;

									return;
								};

								j += 1;

								MEM_StackPos.position = loop2;
							};
						} else {
							B_MG_WalkToBestPossibility(Opp_Goblin);

							MG_Opp_Index += 1;

							return;
						};
					} else if (MEM_ReadStatArr(MG_GegnerFiguren, MG_Opp_Index) == MG_FIGUR_Snapper) {
						B_MG_SetPossibilities(Opp_Snapper);

						counter = B_MG_GetPossibilities();

						if (counter == 0) {
							MG_Opp_Index += 1;

							return;
						} else if (counter == 1) {
							j = 0;

							loop2 = MEM_StackPos.position;

							if (j < 80) {
								if (MEM_ReadStatArr(MG_Spielfeld_Possibilities, j) == 1) {
									C_MG_SPIELFIGUR_WalkToField(Opp_Snapper, j);

									MG_Opp_Index += 1;

									return;
								};

								j += 1;

								MEM_StackPos.position = loop2;
							};
						} else {
							B_MG_WalkToBestPossibility(Opp_Snapper);

							MG_Opp_Index += 1;

							return;
						};
					} else if (MEM_ReadStatArr(MG_GegnerFiguren, MG_Opp_Index) == MG_FIGUR_Troll) {
						B_MG_SetPossibilities(Opp_Troll);

						counter = B_MG_GetPossibilities();

						if (counter == 0) {
							MG_Opp_Index += 1;

							return;
						} else if (counter == 1) {
							j = 0;

							loop2 = MEM_StackPos.position;

							if (j < 80) {
								if (MEM_ReadStatArr(MG_Spielfeld_Possibilities, j) == 1) {
									C_MG_SPIELFIGUR_WalkToField(Opp_Troll, j);

									MG_Opp_Index += 1;

									return;
								};

								j += 1;

								MEM_StackPos.position = loop2;
							};
						} else {
							B_MG_WalkToBestPossibility(Opp_Troll);

							MG_Opp_Index += 1;

							return;
						};
					} else if (MEM_ReadStatArr(MG_GegnerFiguren, MG_Opp_Index) == MG_FIGUR_Minecrawlerqueen) {
						B_MG_SetPossibilities(Opp_Minecrawlerqueen);

						counter = B_MG_GetPossibilities();

						if (counter == 0) {
							MG_Opp_Index += 1;

							return;
						} else if (counter == 1) {
							j = 0;

							loop2 = MEM_StackPos.position;

							if (j < 80) {
								if (MEM_ReadStatArr(MG_Spielfeld_Possibilities, j) == 1) {
									C_MG_SPIELFIGUR_WalkToField(Opp_Minecrawlerqueen, j);

									MG_Opp_Index += 1;

									return;
								};

								j += 1;

								MEM_StackPos.position = loop2;
							};
						} else {
							B_MG_WalkToBestPossibility(Opp_Minecrawlerqueen);

							MG_Opp_Index += 1;

							return;
						};
					} else if (MEM_ReadStatArr(MG_GegnerFiguren, MG_Opp_Index) == MG_FIGUR_Balrog) {
						B_MG_SetPossibilities(Opp_Balrog);

						counter = B_MG_GetPossibilities();

						if (counter == 0) {
							MG_Opp_Index += 1;

							return;
						} else if (counter == 1) {
							j = 0;

							loop2 = MEM_StackPos.position;

							if (j < 80) {
								if (MEM_ReadStatArr(MG_Spielfeld_Possibilities, j) == 1) {
									C_MG_SPIELFIGUR_WalkToField(Opp_Balrog, j);

									MG_Opp_Index += 1;

									return;
								};

								j += 1;

								MEM_StackPos.position = loop2;
							};
						} else {
							B_MG_WalkToBestPossibility(Opp_Balrog);

							MG_Opp_Index += 1;

							return;
						};
					} else if (MEM_ReadStatArr(MG_GegnerFiguren, MG_Opp_Index) == MG_FIGUR_Stoneguardian) {
						B_MG_SetPossibilities(Opp_Stoneguardian);

						counter = B_MG_GetPossibilities();

						if (counter == 0) {
							MG_Opp_Index += 1;

							return;
						} else if (counter == 1) {
							j = 0;

							loop2 = MEM_StackPos.position;

							if (j < 80) {
								if (MEM_ReadStatArr(MG_Spielfeld_Possibilities, j) == 1) {
									C_MG_SPIELFIGUR_WalkToField(Opp_Stoneguardian, j);

									MG_Opp_Index += 1;

									return;
								};

								j += 1;

								MEM_StackPos.position = loop2;
							};
						} else {
							B_MG_WalkToBestPossibility(Opp_Stoneguardian);

							MG_Opp_Index += 1;

							return;
						};
					} else {
						MG_Opp_Index += 1;

						return;
					};
				} else {
					MG_Opp_Index = 0;

					MG_Spieler01 = TRUE;
					MG_Spieler02 = FALSE;

					B_MG_MarkToWalk();
					B_MG_ResetWalks(1);
				};
			};
		};
	} else if (MG_GameState == 5) { // Spiel beenden
		B_MG_Cleanup();

		if (Mod_Maussteuerung) {
			Cursor_NoEngine = 1;
		};

		FF_Remove(B_MG_GameLoop);

		MG_GameState = 0;
	};
};
