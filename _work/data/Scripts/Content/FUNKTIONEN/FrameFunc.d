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
		}
		else if (CurrentLevel != CurrentLevel2) // Levelwechsel
		{
			CurrentLevel = CurrentLevel2;
		}
		else	// Spielstand geladen
		{
		};
		CheckRespawns();

		CurrentLevel2 = 0;
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
		//B_SetAivar(hero, AIV_FernkampfHitZone, TARGET_RUMP);
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

			hero.attribute[ATR_HITPOINTS_MAX] += Mod_Prisma_Array[0] + Mod_Prisma_Array[1] + Mod_Prisma_Array[2];

			Mod_Prisma_Array[0] = 0;
			Mod_Prisma_Array[1] = 0;
			Mod_Prisma_Array[2] = 0;
			
			View_SetTexture(Mod_View_Prisma, "PRISMA_0.TGA");
		};
	};

	var int ActionKey; ActionKey = 0;
	var int ActionKey2; ActionKey2 = 0;

	if (STR_Len(Mod_ActionKey) >= 4)
	{
		ActionKey = B_GetIntOfHex(STR_SubStr(Mod_ActionKey, 0, 4));

		if (STR_Len(Mod_ActionKey) == 8)
		{
			ActionKey2 = B_GetIntOfHex(STR_SubStr(Mod_ActionKey, 4, 4));
		};
	};
	
	if (MEM_KeyState(ActionKey) == KEY_PRESSED)
	|| (MEM_KeyState(ActionKey2) == KEY_PRESSED)
	{
		var ocNpc her3; her3 = Hlp_GetNpc(hero);

		if (her3.focus_vob)
		{
			if (Hlp_StrCmp(her_focusMob._zCObject_objectName, "MOBNAME_SOJA") == TRUE)
			{
				if (Hlp_StrCmp(Npc_GetNearestWP(hero), "SOJA_01") && Mod_Soja_01 == 0) {
					AI_PlayAni(hero, "T_PLUNDER");
					var int sojaAmount1; sojaAmount1 = r_MinMax(1, 5);
					AI_PrintScreen(ConcatStrings(IntToString(sojaAmount1), " So-Ja-Schoten geerntet"), -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
					CreateInvItems(hero, ItMi_SojaSchote, sojaAmount1);
					Mod_Soja_01 = 1;
				} else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "SOJA_02") && Mod_Soja_02 == 0) {
					AI_PlayAni(hero, "T_PLUNDER");
					var int sojaAmount2; sojaAmount2 = r_MinMax(1, 5);
					AI_PrintScreen(ConcatStrings(IntToString(sojaAmount2), " So-Ja-Schoten geerntet"), -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
					CreateInvItems(hero, ItMi_SojaSchote, sojaAmount2);
					Mod_Soja_02 = 1;
				} else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "SOJA_03") && Mod_Soja_03 == 0) {
					AI_PlayAni(hero, "T_PLUNDER");
					var int sojaAmount3; sojaAmount3 = r_MinMax(1, 5);
					AI_PrintScreen(ConcatStrings(IntToString(sojaAmount3), " So-Ja-Schoten geerntet"), -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
					CreateInvItems(hero, ItMi_SojaSchote, sojaAmount3);
					Mod_Soja_03 = 1;
				} else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "SOJA_04") && Mod_Soja_04 == 0) {
					AI_PlayAni(hero, "T_PLUNDER");
					var int sojaAmount4; sojaAmount4 = r_MinMax(1, 5);
					AI_PrintScreen(ConcatStrings(IntToString(sojaAmount4), " So-Ja-Schoten geerntet"), -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
					CreateInvItems(hero, ItMi_SojaSchote, sojaAmount4);
					Mod_Soja_04 = 1;
				} else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "SOJA_05") && Mod_Soja_05 == 0) {
					AI_PlayAni(hero, "T_PLUNDER");
					var int sojaAmount5; sojaAmount5 = r_MinMax(1, 5);
					AI_PrintScreen(ConcatStrings(IntToString(sojaAmount5), " So-Ja-Schoten geerntet"), -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
					CreateInvItems(hero, ItMi_SojaSchote, sojaAmount5);
					Mod_Soja_05 = 1;
				} else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "SOJA_06") && Mod_Soja_06 == 0) {
					AI_PlayAni(hero, "T_PLUNDER");
					var int sojaAmount6; sojaAmount6 = r_MinMax(1, 5);
					AI_PrintScreen(ConcatStrings(IntToString(sojaAmount6), " So-Ja-Schoten geerntet"), -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
					CreateInvItems(hero, ItMi_SojaSchote, sojaAmount6);
					Mod_Soja_06 = 1;
				} else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "SOJA_07") && Mod_Soja_07 == 0) {
					AI_PlayAni(hero, "T_PLUNDER");
					var int sojaAmount7; sojaAmount7 = r_MinMax(1, 5);
					AI_PrintScreen(ConcatStrings(IntToString(sojaAmount7), " So-Ja-Schoten geerntet"), -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
					CreateInvItems(hero, ItMi_SojaSchote, sojaAmount7);
					Mod_Soja_07 = 1;
				} else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "SOJA_08") && Mod_Soja_08 == 0) {
					AI_PlayAni(hero, "T_PLUNDER");
					var int sojaAmount8; sojaAmount8 = r_MinMax(1, 5);
					AI_PrintScreen(ConcatStrings(IntToString(sojaAmount8), " So-Ja-Schoten geerntet"), -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
					CreateInvItems(hero, ItMi_SojaSchote, sojaAmount8);
					Mod_Soja_08 = 1;
				} else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "SOJA_09") && Mod_Soja_09 == 0) {
					AI_PlayAni(hero, "T_PLUNDER");
					var int sojaAmount9; sojaAmount9 = r_MinMax(1, 5);
					AI_PrintScreen(ConcatStrings(IntToString(sojaAmount9), " So-Ja-Schoten geerntet"), -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
					CreateInvItems(hero, ItMi_SojaSchote, sojaAmount9);
					Mod_Soja_09 = 1;
				} else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "SOJA_010") && Mod_Soja_010 == 0) {
					AI_PlayAni(hero, "T_PLUNDER");
					var int sojaAmount10; sojaAmount10 = r_MinMax(1, 5);
					AI_PrintScreen(ConcatStrings(IntToString(sojaAmount10), " So-Ja-Schoten geerntet"), -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
					CreateInvItems(hero, ItMi_SojaSchote, sojaAmount10);
					Mod_Soja_010 = 1;
				} else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "SOJA_011") && Mod_Soja_011 == 0) {
					AI_PlayAni(hero, "T_PLUNDER");
					var int sojaAmount11; sojaAmount11 = r_MinMax(1, 5);
					AI_PrintScreen(ConcatStrings(IntToString(sojaAmount11), " So-Ja-Schoten geerntet"), -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
					CreateInvItems(hero, ItMi_SojaSchote, sojaAmount11);
					Mod_Soja_011 = 1;
				} else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "SOJA_012") && Mod_Soja_012 == 0) {
					AI_PlayAni(hero, "T_PLUNDER");
					var int sojaAmount12; sojaAmount12 = r_MinMax(1, 5);
					AI_PrintScreen(ConcatStrings(IntToString(sojaAmount12), " So-Ja-Schoten geerntet"), -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
					CreateInvItems(hero, ItMi_SojaSchote, sojaAmount12);
					Mod_Soja_012 = 1;
				} else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "SOJA_013") && Mod_Soja_013 == 0) {
					AI_PlayAni(hero, "T_PLUNDER");
					var int sojaAmount13; sojaAmount13 = r_MinMax(1, 5);
					AI_PrintScreen(ConcatStrings(IntToString(sojaAmount13), " So-Ja-Schoten geerntet"), -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
					CreateInvItems(hero, ItMi_SojaSchote, sojaAmount13);
					Mod_Soja_013 = 1;
				} else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "SOJA_014") && Mod_Soja_014 == 0) {
					AI_PlayAni(hero, "T_PLUNDER");
					var int sojaAmount14; sojaAmount14 = r_MinMax(1, 5);
					AI_PrintScreen(ConcatStrings(IntToString(sojaAmount14), " So-Ja-Schoten geerntet"), -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
					CreateInvItems(hero, ItMi_SojaSchote, sojaAmount14);
					Mod_Soja_014 = 1;
				} else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "SOJA_015") && Mod_Soja_015 == 0) {
					AI_PlayAni(hero, "T_PLUNDER");
					var int sojaAmount15; sojaAmount15 = r_MinMax(1, 5);
					AI_PrintScreen(ConcatStrings(IntToString(sojaAmount15), " So-Ja-Schoten geerntet"), -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
					CreateInvItems(hero, ItMi_SojaSchote, sojaAmount15);
					Mod_Soja_015 = 1;
				} else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "SOJA_016") && Mod_Soja_016 == 0) {
					AI_PlayAni(hero, "T_PLUNDER");
					var int sojaAmount16; sojaAmount16 = r_MinMax(1, 5);
					AI_PrintScreen(ConcatStrings(IntToString(sojaAmount16), " So-Ja-Schoten geerntet"), -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
					CreateInvItems(hero, ItMi_SojaSchote, sojaAmount16);
					Mod_Soja_016 = 1;
				} else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "SOJA_017") && Mod_Soja_017 == 0) {
					AI_PlayAni(hero, "T_PLUNDER");
					var int sojaAmount17; sojaAmount17 = r_MinMax(1, 5);
					AI_PrintScreen(ConcatStrings(IntToString(sojaAmount17), " So-Ja-Schoten geerntet"), -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
					CreateInvItems(hero, ItMi_SojaSchote, sojaAmount17);
					Mod_Soja_017 = 1;
				} else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "SOJA_018") && Mod_Soja_018 == 0) {
					AI_PlayAni(hero, "T_PLUNDER");
					var int sojaAmount18; sojaAmount18 = r_MinMax(1, 5);
					AI_PrintScreen(ConcatStrings(IntToString(sojaAmount18), " So-Ja-Schoten geerntet"), -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
					CreateInvItems(hero, ItMi_SojaSchote, sojaAmount18);
					Mod_Soja_018 = 1;
				} else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "SOJA_019") && Mod_Soja_019 == 0) {
					AI_PlayAni(hero, "T_PLUNDER");
					var int sojaAmount19; sojaAmount19 = r_MinMax(1, 5);
					AI_PrintScreen(ConcatStrings(IntToString(sojaAmount19), " So-Ja-Schoten geerntet"), -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
					CreateInvItems(hero, ItMi_SojaSchote, sojaAmount19);
					Mod_Soja_019 = 1;
				} else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "SOJA_020") && Mod_Soja_020 == 0) {
					AI_PlayAni(hero, "T_PLUNDER");
					var int sojaAmount20; sojaAmount20 = r_MinMax(1, 5);
					AI_PrintScreen(ConcatStrings(IntToString(sojaAmount20), " So-Ja-Schoten geerntet"), -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
					CreateInvItems(hero, ItMi_SojaSchote, sojaAmount20);
					Mod_Soja_020 = 1;
				} else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "SOJA_021") && Mod_Soja_021 == 0) {
					AI_PlayAni(hero, "T_PLUNDER");
					var int sojaAmount21; sojaAmount21 = r_MinMax(1, 5);
					AI_PrintScreen(ConcatStrings(IntToString(sojaAmount21), " So-Ja-Schoten geerntet"), -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
					CreateInvItems(hero, ItMi_SojaSchote, sojaAmount21);
					Mod_Soja_021 = 1;
				} else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "SOJA_022") && Mod_Soja_022 == 0) {
					AI_PlayAni(hero, "T_PLUNDER");
					var int sojaAmount22; sojaAmount22 = r_MinMax(1, 5);
					AI_PrintScreen(ConcatStrings(IntToString(sojaAmount22), " So-Ja-Schoten geerntet"), -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
					CreateInvItems(hero, ItMi_SojaSchote, sojaAmount22);
					Mod_Soja_022 = 1;
				} else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "SOJA_023") && Mod_Soja_023 == 0) {
					AI_PlayAni(hero, "T_PLUNDER");
					var int sojaAmount23; sojaAmount23 = r_MinMax(1, 5);
					AI_PrintScreen(ConcatStrings(IntToString(sojaAmount23), " So-Ja-Schoten geerntet"), -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
					CreateInvItems(hero, ItMi_SojaSchote, sojaAmount23);
					Mod_Soja_023 = 1;
				} else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "SOJA_024") && Mod_Soja_024 == 0) {
					AI_PlayAni(hero, "T_PLUNDER");
					var int sojaAmount24; sojaAmount24 = r_MinMax(1, 5);
					AI_PrintScreen(ConcatStrings(IntToString(sojaAmount24), " So-Ja-Schoten geerntet"), -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
					CreateInvItems(hero, ItMi_SojaSchote, sojaAmount24);
					Mod_Soja_024 = 1;
				} else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "SOJA_025") && Mod_Soja_025 == 0) {
					AI_PlayAni(hero, "T_PLUNDER");
					var int sojaAmount25; sojaAmount25 = r_MinMax(1, 5);
					AI_PrintScreen(ConcatStrings(IntToString(sojaAmount25), " So-Ja-Schoten geerntet"), -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
					CreateInvItems(hero, ItMi_SojaSchote, sojaAmount25);
					Mod_Soja_025 = 1;
				} else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "SOJA_026") && Mod_Soja_026 == 0) {
					AI_PlayAni(hero, "T_PLUNDER");
					var int sojaAmount26; sojaAmount26 = r_MinMax(1, 5);
					AI_PrintScreen(ConcatStrings(IntToString(sojaAmount26), " So-Ja-Schoten geerntet"), -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
					CreateInvItems(hero, ItMi_SojaSchote, sojaAmount26);
					Mod_Soja_026 = 1;
				} else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "SOJA_027") && Mod_Soja_027 == 0) {
					AI_PlayAni(hero, "T_PLUNDER");
					var int sojaAmount27; sojaAmount27 = r_MinMax(1, 5);
					AI_PrintScreen(ConcatStrings(IntToString(sojaAmount27), " So-Ja-Schoten geerntet"), -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
					CreateInvItems(hero, ItMi_SojaSchote, sojaAmount27);
					Mod_Soja_027 = 1;
				} else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "SOJA_028") && Mod_Soja_028 == 0) {
					AI_PlayAni(hero, "T_PLUNDER");
					var int sojaAmount28; sojaAmount28 = r_MinMax(1, 5);
					AI_PrintScreen(ConcatStrings(IntToString(sojaAmount28), " So-Ja-Schoten geerntet"), -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
					CreateInvItems(hero, ItMi_SojaSchote, sojaAmount28);
					Mod_Soja_028 = 1;
				} else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "SOJA_029") && Mod_Soja_029 == 0) {
					AI_PlayAni(hero, "T_PLUNDER");
					var int sojaAmount29; sojaAmount29 = r_MinMax(1, 5);
					AI_PrintScreen(ConcatStrings(IntToString(sojaAmount29), " So-Ja-Schoten geerntet"), -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
					CreateInvItems(hero, ItMi_SojaSchote, sojaAmount29);
					Mod_Soja_029 = 1;
				} else if (Hlp_StrCmp(Npc_GetNearestWP(hero), "SOJA_030") && Mod_Soja_030 == 0) {
					AI_PlayAni(hero, "T_PLUNDER");
					var int sojaAmount30; sojaAmount30 = r_MinMax(1, 5);
					AI_PrintScreen(ConcatStrings(IntToString(sojaAmount30), " So-Ja-Schoten geerntet"), -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
					CreateInvItems(hero, ItMi_SojaSchote, sojaAmount30);
					Mod_Soja_030 = 1;
				} else {
					AI_PlayAni(hero, "T_PLUNDER");
					AI_PrintScreen("Nichts mehr zu holen", -1, YPOS_GoldGiven, FONT_ScreenSmall, 2);
				};
			};
		};
	};

	if (MEM_KeyState(KEY_8) == KEY_PRESSED)
	|| (MEM_KeyState(KEY_NUMPAD8) == KEY_PRESSED)
	{
		if (Mod_Erol_Fahrender == 5)
		{
			var ocNpc her31; her31 = Hlp_GetNpc(hero);

			if (her31.focus_vob)
			{
				if (Hlp_Is_oCMobContainer(her31.focus_vob))
				{
					var oCMobContainer her_focusMob2;
					MEM_AssignInst (her_focusMob2, her31.focus_vob);

					if (Hlp_StrCmp(her_focusMob2._zCObject_objectName, "XARDASOWTRUHE") == TRUE)
					{
						Mod_Erol_Fahrender = 6;

						Mod_XardasOWTower_Truhe = TRUE;

						B_LogEntry	(TOPIC_MOD_EROL_FEUERMAGIER, "Die Truhe sollte jetzt geöffnet werden können ...");
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

	if (Npc_HasItems(hero, ItMi_Focus_Pat_01) == 1) {
		Npc_RemoveInvItems	(hero, ItMi_Focus_Pat_01, 1);
		if (Mod_PAT_Focus_01 == 0) {
			Wld_InsertItem	(ItMi_Focus_Pat_01, "FP_ITEM_FOKUS_01");
		} else {
			CreateInvItems(hero, ItMi_Focus_Pat, 1);
		};
	};

	if (Npc_HasItems(hero, ItMi_Focus_Pat_02) == 1) {
		Npc_RemoveInvItems	(hero, ItMi_Focus_Pat_02, 1);
		if (Mod_PAT_Focus_02 == 0) {
			Wld_InsertItem	(ItMi_Focus_Pat_02, "FP_ITEM_FOKUS_02");
		} else {
			CreateInvItems(hero, ItMi_Focus_Pat, 1);
		};
	};

	if (Npc_HasItems(hero, ItMi_Focus_Pat_03) == 1) {
		Npc_RemoveInvItems	(hero, ItMi_Focus_Pat_03, 1);
		if (Mod_PAT_Focus_03 == 0) {
			Wld_InsertItem	(ItMi_Focus_Pat_03, "FP_ITEM_FOKUS_03");
		} else {
			CreateInvItems(hero, ItMi_Focus_Pat, 1);
		};
	};

	if (Npc_HasItems(hero, ItMi_Focus_Pat_04) == 1) {
		Npc_RemoveInvItems	(hero, ItMi_Focus_Pat_04, 1);
		if (Mod_PAT_Focus_04 == 0) {
			Wld_InsertItem	(ItMi_Focus_Pat_04, "FP_ITEM_FOKUS_04");
		} else {
			CreateInvItems(hero, ItMi_Focus_Pat, 1);
		};
	};

	if (Npc_HasItems(hero, ItMi_Focus_Pat_05) == 1) {
		Npc_RemoveInvItems	(hero, ItMi_Focus_Pat_05, 1);
		if (Mod_PAT_Focus_05 == 0) {
			Wld_InsertItem	(ItMi_Focus_Pat_05, "FP_ITEM_FOKUS_05");
		} else {
			CreateInvItems(hero, ItMi_Focus_Pat, 1);
		};
	};

	if (Npc_HasItems(hero, ItMi_Magieprisma_Fake) == 1)
	{
		Npc_RemoveInvItems	(hero, ItMi_Magieprisma_Fake, 1);

		Wld_InsertItem	(ItMi_Magieprisma_Fake,	"FP_ITEM_MAGIEPRISMA");

		Wld_PlayEffect ("SPELLFX_PRISMA", ItMi_Magieprisma_Fake, ItMi_Magieprisma_Fake, 0, 0, 0, FALSE);
	};
	
	if (Mod_Argez_Puzzle == 1) {
		Puzzle_Tick();
	};

	var int lastFocusItem;
	var int lastDivePickupTime;

	if (C_BodyStateContains (hero, BS_DIVE))
	{
		var oCNpc her;
		her = Hlp_GetNpc (hero);
		
		if (her.focus_vob)
		{
			lastFocusItem = her.focus_vob;
			var oCItem her_focusItem2;
			MEM_AssignInst (her_focusItem2, her.focus_vob);
			
			if (Hlp_IsValidItem (her_focusItem2))
			{
				if (Npc_GetDistToItem (hero, her_focusItem2) < 200)
				&& (lastDivePickupTime + 2 > TimeCounter_Real)
				{
					CreateInvItems (hero, her_focusItem2.instanz, her_focusItem2.amount); //amount beachten
					Wld_RemoveItem (her_focusItem2);
					
					var string str;	str = ConcatStrings (her_focusItem2.name, " aufgehoben!");
					PrintScreen (str, -1, -1, FONT_SCREENSMALL, 3);
					
					lastDivePickupTime = TimeCounter_Real;
				};
			};
		};
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
