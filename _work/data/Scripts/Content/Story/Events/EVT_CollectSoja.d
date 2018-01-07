FUNC INT COLLECTSOJA() {
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
	return FALSE;
};
