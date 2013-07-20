instance Mein_Schleifen_Trigger (oCTriggerScript);

FUNC VOID ChangeStatusMenu (var string field, var string text)
{
	//Ein Menüitem holen:
	var zCMenuItem itm;
	var int itmPtr; itmPtr = MEM_GetMenuItemByString (field);
	
	if (itmPtr)
	{
		//Menüitem gefunden.
		MEM_AssignInst (itm, itmPtr);
		
		if (itm.m_pInnerWindow)
		{
			//Das Menüitem hat gerade ein InnerWindow (zeigt etwas an)
			var zCView innerView;
			MEM_AssignInst (innerView, itm.m_pInnerWindow);
			
			if (innerView.textLines_next)
			{
				//Das Innerwindow hat (mindestens) eine Zeile, nehme die erste.
				var zCList listele;
				MEM_AssignInst (listele, innerView.textLines_next);
				
				var zCViewText firstLine;
				MEM_AssignInst (firstLine, listele.data);
				
				//Statt "gildenlos" steht in jedem Frame ein anderer Zufallsstring dort.	
				firstLine.text = text;
			}
			else
			{
				PrintDebug("no Text"); //tritt hier nicht auf.
			};
		}
		else
		{
			PrintDebug ("no inner Window"); //tritt auf, falls das Charaktermenü gerade nicht offen ist.
		};
	}
	else
	{
		PrintDebug ("no Item"); //tritt auf, falls das Charaktermenü noch nicht offen war.
	};
};

var int ExpBar;
var int FutterBar;

FUNC VOID FRAMEFUNC ()
{
	// Es wird gleich MEM_Timer genutzt, der muss initialisiert sein
	MEM_InitGlobalInst();

	// Triggernachricht senden
	Wld_SendTrigger ("FRAMETRIGGER"); //ruft meineSchleifenFunktion auf

	// Balken anzeigen

	if (Mod_EXP_Anzeige)
	{
		if(!Hlp_IsValidHandle(ExpBar)) {
			ExpBar = Bar_Create(ExpBalken);
		};

		// Der Rest ist wohl selbsterklärend:

		Bar_SetMax(ExpBar, hero.exp_next - EXP_LastLevel);
		Bar_SetValue(ExpBar, hero.exp - EXP_LastLevel);
	}
	else
	{
		if (Hlp_IsValidHandle(ExpBar))
		{
			Bar_Delete(ExpBar);
			ExpBar = 0;
		};
	};

	if (Mod_Esssystem)
	{
		if(!Hlp_IsValidHandle(FutterBar)) {
			FutterBar = Bar_Create(NahrungsBalken);
		};

		// Der Rest ist wohl selbsterklärend:

		Bar_SetValue(FutterBar, Mod_EssPunkte);
	}
	else
	{
		if (Hlp_IsValidHandle(FutterBar))
		{
			Bar_Delete(FutterBar);
			FutterBar = 0;
		};
	};


	// Funktionsteil

	if (CurrentLevel2 != 0)
	{
		MEM_InitAll();

		if (CurrentLevel == 0) // Erster Spielstart
		{
			CurrentLevel = CurrentLevel2;

			Offline_Modus = FALSE;
			ValidateUserPasswort = 0;

			Mod_SavegameImport = STR_ToInt(MEM_GetGothOpt("XERES", "savegame"));

			if (Mod_SavegameImport == 1)
			{
				// Sachen importieren

				Mod_Import_Ghorim = SavegameImport ("\saves_Xeres\Import", "GHORIM_KICKHARLOK", 0, 0);
				Mod_Import_Thorus = SavegameImport ("\saves_Xeres\Import", "THORUS_MORDRAGKO", 0, 0);
				Mod_Import_Mordrag = SavegameImport ("\saves_Xeres\Import", "MORDRAGKO_HAUAB", 0, 0);
				Mod_Import_Fremde = SavegameImport ("\saves_Xeres\Import", "RIDDLE6", 0, 0);
				Mod_Import_Dusty = SavegameImport ("\saves_Xeres\Import", "BAALTONDRAL_GETNEWGUY", 0, 0);
				Mod_Import_PDV = SavegameImport ("\saves_Xeres\Import", "LARES_BRINGLISTBACK", 0, 0);
				Mod_Import_Dexter = SavegameImport ("\saves_Xeres\Import", "DEXTER_GETKALOMSRECIPE", 0, 0);
				Mod_Import_Snaf = SavegameImport ("\saves_Xeres\Import", "SNAF_ZUTATEN", 0, 0);
				Mod_Import_AL = SavegameImport ("\saves_Xeres\Import", "DIA_GOMEZ_DABEI", 1, 0);
				Mod_Import_NL = SavegameImport ("\saves_Xeres\Import", "ORG_801_LARES_GOTOKALOM", 1, 0);
				Mod_Import_SL = SavegameImport ("\saves_Xeres\Import", "GUR_1201_CORKALOM_JOINPSI2", 1, 0);
			}
			else
			{
				// Sachen setzen

				Mod_Import_Ghorim = -1;
				Mod_Import_Thorus = -1;
				Mod_Import_Mordrag = -1;
				Mod_Import_Fremde = -1;
				Mod_Import_Dusty = -1;
				Mod_Import_PDV = -1;
				Mod_Import_Dexter = -1;
				Mod_Import_Snaf = -1;
				Mod_Import_AL = -1;
				Mod_Import_NL = -1;
				Mod_Import_SL = -1;
			};
		}
		else if (CurrentLevel != CurrentLevel2) // Levelwechsel
		{
			CurrentLevel = CurrentLevel2;
		}
		else	// Spielstand geladen
		{
			Offline_Modus = FALSE;
			ValidateUserPasswort = 1;

			Mod_OnlineMode = 0;

			if (STR_ToInt(online_playtime_s) > 0)
			{
				CURL_Send(ConcatStrings(ConcatStrings(ConcatStrings("http://www.teutonicteam.de/gomon/tauschen/actualizePlaytime.php?name=", username), "&game=4&time="), online_playtime_s));
			};

			online_playtime = 0;
		};

		CurrentLevel2 = 0;
	};

	if (GetInput)
	{
		if (MEM_KeyState(KEY_RETURN) == KEY_PRESSED)
		{
			B_EndEingabe();

			if (STR_Len(username) == 0)
			{
				PrintScreen	("Bitte Username eingeben", -1, 45, FONT_SCREEN, 1);

				username = eingabe;
			}
			else if (STR_Len(passwort) == 0)
			{
				PrintScreen	("Bitte Passwort eingeben", -1, 45, FONT_SCREEN, 1);

				passwort = eingabe;
			};
		}
		else
		{
			if (STR_Len(username) == 0)
			{
				PrintScreen	("Bitte Username eingeben", -1, 45, FONT_SCREEN, 1);

				eingabe = B_GetEingabe(eingabe);
			}
			else if (STR_Len(passwort) == 0)
			{
				PrintScreen	("Bitte Passwort eingeben", -1, 45, FONT_SCREEN, 1);

				eingabe = B_GetEingabe(eingabe);
			};
		};

		PrintScreen	(eingabe, -1, -1, FONT_SCREENSMALL, 1);
	};

	ChangeStatusMenu ("MENU_ITEM_ARMOR_1", IntToString(hero.protection[PROT_BLUNT]/1000));
	ChangeStatusMenu ("MENU_ITEM_ARMOR_2", IntToString(hero.protection[PROT_POINT]/1000));
	ChangeStatusMenu ("MENU_ITEM_GIFT_WERT", IntToString(Gift));
	ChangeStatusMenu ("MENU_ITEM_KRANKHEIT_WERT", IntToString(Krankheit));
	ChangeStatusMenu ("MENU_ITEM_TALENT_21_SKILL", ConcatStrings(IntToString(Mod_Verhandlungsgeschick), " %"));

	if (Mod_Schwierigkeit == 4)
	{
		ChangeStatusMenu ("MENU_ITEM_LEARN_TITLE", "");
		ChangeStatusMenu ("MENU_ITEM_LEARN", "");
	};

	Npc_GetTarget(hero);

	if (Hlp_IsValidNpc(other))
	{
		if (Npc_IsAiming(hero, other))
		&& (Npc_IsInFightMode(hero, FMODE_FAR))
		{
			if (B_GetAivar(hero, AIV_FernkampfHitZone) == TARGET_RUMP)
			{
				PrintScreen	("Körper", -1, 20, FONT_SCREEN, 1);
			}
			else if (B_GetAivar(hero, AIV_FernkampfHitZone) == TARGET_LEFTLEG)
			{
				PrintScreen	("Linkes Bein", -1, 20, FONT_SCREEN, 1);
			}
			else if (B_GetAivar(hero, AIV_FernkampfHitZone) == TARGET_RIGHTLEG)
			{
				PrintScreen	("Rechtes Bein", -1, 20, FONT_SCREEN, 1);
			}
			else if (B_GetAivar(hero, AIV_FernkampfHitZone) == TARGET_LEFTARM)
			{
				PrintScreen	("Linker Arm", -1, 20, FONT_SCREEN, 1);
			}
			else if (B_GetAivar(hero, AIV_FernkampfHitZone) == TARGET_RIGHTARM)
			{
				PrintScreen	("Rechter Arm", -1, 20, FONT_SCREEN, 1);
			}
			else if (B_GetAivar(hero, AIV_FernkampfHitZone) == TARGET_HEAD)
			{
				PrintScreen	("Kopf", -1, 20, FONT_SCREEN, 1);
			};

			if (MEM_KeyState(KEY_NUMPAD1) == KEY_PRESSED)
			{
				B_SetAivar(hero, AIV_FernkampfHitZone, TARGET_LEFTLEG);
			}
			else if (MEM_KeyState(KEY_NUMPAD4) == KEY_PRESSED)
			{
				B_SetAivar(hero, AIV_FernkampfHitZone, TARGET_LEFTARM);
			}
			else if (MEM_KeyState(KEY_NUMPAD6) == KEY_PRESSED)
			{
				B_SetAivar(hero, AIV_FernkampfHitZone, TARGET_RIGHTARM);
			}
			else if (MEM_KeyState(KEY_NUMPAD8) == KEY_PRESSED)
			{
				B_SetAivar(hero, AIV_FernkampfHitZone, TARGET_HEAD);
			}
			else if (MEM_KeyState(KEY_NUMPAD3) == KEY_PRESSED)
			{
				B_SetAivar(hero, AIV_FernkampfHitZone, TARGET_RIGHTLEG);
			}
			else if (MEM_KeyState(KEY_NUMPAD5) == KEY_PRESSED)
			{
				B_SetAivar(hero, AIV_FernkampfHitZone, TARGET_RUMP);
			};
		}
		else
		{
			//B_SetAivar(hero, AIV_FernkampfHitZone, TARGET_RUMP;
		};

		var string OppState;
		OppState = "";

		if (other.aivar[AIV_Blutet] > 0)
		{
			OppState = ConcatStrings(OppState, "A ");
		};

		if (!Hlp_StrCmp(OppState, ""))
		{
			PrintScreen	(OppState, -1, 5, FONT_STATUS, 1);
		};
	}
	else
	{
		B_SetAivar(hero, AIV_FernkampfHitZone, TARGET_RUMP);
	};

	FrameCounter += 1;

	// Verwandlung in Skelett wie andere rückgängig machen

	if (Mod_TrfSkeleton2 == 1)
	{
		if (MEM_KeyState(KEY_RETURN) == KEY_PRESSED)
		{
			Mod_TrfSkeleton2_Time = 1;
		};
	};

	// F8 zählen

	/*if (MEM_GAME.game_testmode == 1)
	{
		if (MEM_KeyState(KEY_F8) == KEY_PRESSED)
		|| (MEM_KeyState(KEY_F8) == KEY_HOLD)
		{
			if (TimeCounter_Real > CurrentF8Time)
			{
				MaxF8Time += 1;

				CurrentF8Time = TimeCounter_Real;
			};
		};
	};*/

	var int PrismaKey; PrismaKey = 0;
	var int PrismaKey2; PrismaKey2 = 0;

	if (STR_Len(Mod_PrismaKey) >= 4)
	{
		PrismaKey = B_GetIntOfHex(STR_SubStr(Mod_PrismaKey, 0, 4));

		if (STR_Len(Mod_PrismaKey) == 8)
		{
			PrismaKey2 = B_GetIntOfHex(STR_SubStr(Mod_PrismaKey, 4, 4));
		};
	};

	if (MEM_KeyState(PrismaKey) == KEY_PRESSED)
	|| (MEM_KeyState(PrismaKey2) == KEY_PRESSED)
	{
		if (Mod_PrismaAngelegt == 1)
		{
			var ocNpc her2; her2 = Hlp_GetNpc(hero);

			if (her2.focus_vob)
			{
				if (Hlp_Is_oCMobContainer(her2.focus_vob))
				{
					var oCMobContainer her_focusMob;
					MEM_AssignInst (her_focusMob, her2.focus_vob);

					if (Hlp_StrCmp(her_focusMob._zCObject_objectName, "FOKUSTRUHE_KLOSTER") == TRUE)
					&& (Mod_Prisma_Array[2] > 0)
					{
						Mod_Prisma_KlosterFokus = TRUE;

						PrintScreen	("Schutzzauber der Truhe ist gebrochen", -1, -1, FONT_SCREEN, 2);
					};
				}
				else
				{
					var ocItem her_focusItem;
					MEM_AssignInst (her_focusItem, her2.focus_vob);

					if (Hlp_IsValidItem(her_focusItem))
					{
						if (Hlp_StrCmp(her_focusItem._zCObject_objectName, "ITMI_FOCUS_TROLL") == TRUE)
						&& (Mod_Prisma_Array[2] > 0)
						{
							Mod_Prisma_TrollFokus = TRUE;

							PrintScreen	("Schutzzauber des Fokus ist gebrochen", -1, -1, FONT_SCREEN, 2);
						};
					};
				};
			};


			DoForSphere(B_KillWithPrisma);

			hero.attribute[ATR_HITPOINTS_MAX] += Mod_Prisma_Array[0] + Mod_Prisma_Array[1] + Mod_Prisma_Array[2] + Mod_Prisma_Array[3];

			Mod_Prisma_Array[0] = 0;
			Mod_Prisma_Array[1] = 0;
			Mod_Prisma_Array[2] = 0;
			Mod_Prisma_Array[3] = 0;
		};
	};

	if (MEM_KeyState(KEY_8) == KEY_PRESSED)
	{
		if (Mod_Erol_Fahrender == 5)
		{
			var ocNpc her3; her3 = Hlp_GetNpc(hero);

			if (her3.focus_vob)
			{
				if (Hlp_Is_oCMobContainer(her3.focus_vob))
				{
					var oCMobContainer her_focusMob2;
					MEM_AssignInst (her_focusMob2, her3.focus_vob);

					if (Hlp_StrCmp(her_focusMob2._zCObject_objectName, "XARDASOWTRUHE") == TRUE)
					{
						Mod_Erol_Fahrender = 6;

						Mod_XardasOWTower_Truhe = TRUE;
					};
				};
			};
		};
	};

	if (Npc_HasItems(hero, ItMi_Focus_Troll) == 1)
	&& (Mod_Prisma_TrollFokus == 0)
	{
		Npc_RemoveInvItems	(hero, ItMi_Focus_Troll, 1);

		Wld_InsertItem	(ItMi_Focus_Troll, "FP_ITEM_FOKUS_TROLL");
	};

	if (Npc_HasItems(hero, ItMi_Focus_Pat_01) == 1)
	&& (Mod_PAT_Focus_01 == 0)
	{
		Npc_RemoveInvItems	(hero, ItMi_Focus_Pat_01, 1);

		Wld_InsertItem	(ItMi_Focus_Pat_01, "FP_ITEM_FOKUS_01");
	};

	if (Npc_HasItems(hero, ItMi_Focus_Pat_02) == 1)
	&& (Mod_PAT_Focus_02 == 0)
	{
		Npc_RemoveInvItems	(hero, ItMi_Focus_Pat_02, 1);

		Wld_InsertItem	(ItMi_Focus_Pat_02, "FP_ITEM_FOKUS_02");
	};

	if (Npc_HasItems(hero, ItMi_Focus_Pat_03) == 1)
	&& (Mod_PAT_Focus_03 == 0)
	{
		Npc_RemoveInvItems	(hero, ItMi_Focus_Pat_03, 1);

		Wld_InsertItem	(ItMi_Focus_Pat_03, "FP_ITEM_FOKUS_03");
	};

	if (Npc_HasItems(hero, ItMi_Focus_Pat_04) == 1)
	&& (Mod_PAT_Focus_04 == 0)
	{
		Npc_RemoveInvItems	(hero, ItMi_Focus_Pat_04, 1);

		Wld_InsertItem	(ItMi_Focus_Pat_04, "FP_ITEM_FOKUS_04");
	};

	if (Npc_HasItems(hero, ItMi_Focus_Pat_05) == 1)
	&& (Mod_PAT_Focus_05 == 0)
	{
		Npc_RemoveInvItems	(hero, ItMi_Focus_Pat_05, 1);

		Wld_InsertItem	(ItMi_Focus_Pat_05, "FP_ITEM_FOKUS_05");
	};

	if (Npc_HasItems(hero, ItMi_Magieprisma_Fake) == 1)
	{
		Npc_RemoveInvItems	(hero, ItMi_Magieprisma_Fake, 1);

		Wld_InsertItem	(ItMi_Magieprisma_Fake,	"FP_ITEM_MAGIEPRISMA");

		Wld_PlayEffect ("SPELLFX_PRISMA", ItMi_Magieprisma_Fake, ItMi_Magieprisma_Fake, 0, 0, 0, FALSE);
	};

	ObserveConsole();
	ShowBars();

	// Pfeile bleiben in Welt stecken

	ZaphodPfeilExchange();

	SPECIALFUNC();

	// Triggerscript holen:
	var int ptr; ptr = MEM_SearchVobByName ("FRAMETRIGGER");
	MEM_AssignInst (Mein_Schleifen_Trigger, ptr);
	
	Mein_Schleifen_Trigger._zCVob_nextOnTimer = MEM_Timer.totalTimeFloat; //wäre eigentlich jetzt schon wieder dran, wird aber erst im nächsten Frame bemerkt
};
