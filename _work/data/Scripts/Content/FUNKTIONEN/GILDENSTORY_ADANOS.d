FUNC VOID GILDENSTORY_ADANOS()
{
	// WM-Story

	if (CurrentLevel == NEWWORLD_ZEN)
	{
		// Reinigung der Böden I

		if (Mod_WM_BoedenAktiviert == 0)
		&& (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_03))
		{
			Wld_SendTrigger ("BODEN_01_FOG");
			Wld_SendTrigger ("BODEN_02_FOG");
			Wld_SendTrigger ("BODEN_03_FOG");
			Wld_SendTrigger ("BODEN_04_FOG");
			Wld_SendTrigger ("BODEN_05_FOG");
			Wld_SendTrigger ("BODEN_06_FOG");

			Mod_WM_BoedenAktiviert = 1;
		};

		if (Mod_WM_BoedenAktiviert == 1)
		&& (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_06))
		{
			Wld_SendTrigger ("BODEN_07_FOG");
			Wld_SendTrigger ("BODEN_08_FOG");
			Wld_SendTrigger ("BODEN_09_FOG");

			Mod_WM_BoedenAktiviert = 2;
		};

		if (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_06))
		{
			Wld_SendUnTrigger ("BODEN_01_FOG");
			Wld_SendUnTrigger ("BODEN_02_FOG");
			Wld_SendUnTrigger ("BODEN_03_FOG");
			Wld_SendUnTrigger ("BODEN_04_FOG");
			Wld_SendUnTrigger ("BODEN_05_FOG");
			Wld_SendUnTrigger ("BODEN_06_FOG");
		};
		if (Mod_WM_Boeden >= 9)
		{
			Wld_SendUnTrigger ("BODEN_07_FOG");
			Wld_SendUnTrigger ("BODEN_08_FOG");
			Wld_SendUnTrigger ("BODEN_09_FOG");
		};

		var string ReinigungsMeldung;

		if (Npc_GetDistToWP(hero, "WP_BODEN_01") < 600)
		&& (Npc_GetDistToItem(hero, ItMi_Wasserperle) < 1200)
		&& (WM_Boden_01 == FALSE)
		{
			WM_Boden_01 = TRUE;
			Wld_RemoveItem	(ItMi_Wasserperle);

			Wld_SendUnTrigger	("BODEN_01_FOG");

			if (Mod_WM_Boeden == 0)
			{
				Wld_InsertNpc	(WeakDemon, "WP_BODEN_01");
			}
			else if (Mod_WM_Boeden == 1)
			{
				Wld_InsertNpc	(DemonWolf, "WP_BODEN_01");
			};

			Mod_WM_Boeden += 1;

			ReinigungsMeldung = ConcatStrings(IntToString(Mod_WM_Boeden), " Böden gereinigt");

			if (Mod_WM_Boeden == 6)
			{
				B_LogEntry	(TOPIC_MOD_ADANOS_BOEDEN, "Ich habe alle Böden gereinigt und sollte nun zu Saturas zurück kehren.");
			};

			PrintScreen (ReinigungsMeldung, -1, YPOS_LevelUp, FONT_Screen, 2);
		};

		if (Npc_GetDistToWP(hero, "WP_BODEN_02") < 600)
		&& (Npc_GetDistToItem(hero, ItMi_Wasserperle) < 1200)
		&& (WM_Boden_02 == FALSE)
		{
			WM_Boden_02 = TRUE;
			Wld_RemoveItem	(ItMi_Wasserperle);

			Wld_SendUnTrigger	("BODEN_02_FOG");

			if (Mod_WM_Boeden == 0)
			{
				Wld_InsertNpc	(WeakDemon, "WP_BODEN_02");
			}
			else if (Mod_WM_Boeden == 1)
			{
				Wld_InsertNpc	(DemonWolf, "WP_BODEN_02");
			};

			Mod_WM_Boeden += 1;

			ReinigungsMeldung = ConcatStrings(IntToString(Mod_WM_Boeden), " Böden gereinigt");

			if (Mod_WM_Boeden == 6)
			{
				B_LogEntry	(TOPIC_MOD_ADANOS_BOEDEN, "Ich habe alle Böden gereinigt und sollte nun zu Saturas zurück kehren.");
			};

			PrintScreen (ReinigungsMeldung, -1, YPOS_LevelUp, FONT_Screen, 2);
		};

		if (Npc_GetDistToWP(hero, "WP_BODEN_03") < 600)
		&& (Npc_GetDistToItem(hero, ItMi_Wasserperle) < 1200)
		&& (WM_Boden_03 == FALSE)
		{
			WM_Boden_03 = TRUE;
			Wld_RemoveItem	(ItMi_Wasserperle);

			Wld_SendUnTrigger	("BODEN_03_FOG");

			if (Mod_WM_Boeden == 0)
			{
				Wld_InsertNpc	(WeakDemon, "WP_BODEN_03");
			}
			else if (Mod_WM_Boeden == 1)
			{
				Wld_InsertNpc	(DemonWolf, "WP_BODEN_03");
			};

			Mod_WM_Boeden += 1;

			ReinigungsMeldung = ConcatStrings(IntToString(Mod_WM_Boeden), " Böden gereinigt");

			if (Mod_WM_Boeden == 6)
			{
				B_LogEntry	(TOPIC_MOD_ADANOS_BOEDEN, "Ich habe alle Böden gereinigt und sollte nun zu Saturas zurück kehren.");
			};

			PrintScreen (ReinigungsMeldung, -1, YPOS_LevelUp, FONT_Screen, 2);
		};

		if (Npc_GetDistToWP(hero, "WP_BODEN_04") < 600)
		&& (Npc_GetDistToItem(hero, ItMi_Wasserperle) < 1200)
		&& (WM_Boden_04 == FALSE)
		{
			WM_Boden_04 = TRUE;
			Wld_RemoveItem	(ItMi_Wasserperle);

			Wld_SendUnTrigger	("BODEN_04_FOG");

			if (Mod_WM_Boeden == 0)
			{
				Wld_InsertNpc	(WeakDemon, "WP_BODEN_04");
			}
			else if (Mod_WM_Boeden == 1)
			{
				Wld_InsertNpc	(DemonWolf, "WP_BODEN_04");
			};

			Mod_WM_Boeden += 1;

			ReinigungsMeldung = ConcatStrings(IntToString(Mod_WM_Boeden), " Böden gereinigt");

			if (Mod_WM_Boeden == 6)
			{
				B_LogEntry	(TOPIC_MOD_ADANOS_BOEDEN, "Ich habe alle Böden gereinigt und sollte nun zu Saturas zurück kehren.");
			};

			PrintScreen (ReinigungsMeldung, -1, YPOS_LevelUp, FONT_Screen, 2);
		};

		if (Npc_GetDistToWP(hero, "WP_BODEN_05") < 600)
		&& (Npc_GetDistToItem(hero, ItMi_Wasserperle) < 1200)
		&& (WM_Boden_05 == FALSE)
		{
			WM_Boden_05 = TRUE;
			Wld_RemoveItem	(ItMi_Wasserperle);

			Wld_SendUnTrigger	("BODEN_05_FOG");

			if (Mod_WM_Boeden == 0)
			{
				Wld_InsertNpc	(WeakDemon, "WP_BODEN_05");
			}
			else if (Mod_WM_Boeden == 1)
			{
				Wld_InsertNpc	(DemonWolf, "WP_BODEN_05");
			};

			Mod_WM_Boeden += 1;

			ReinigungsMeldung = ConcatStrings(IntToString(Mod_WM_Boeden), " Böden gereinigt");

			if (Mod_WM_Boeden == 6)
			{
				B_LogEntry	(TOPIC_MOD_ADANOS_BOEDEN, "Ich habe alle Böden gereinigt und sollte nun zu Saturas zurück kehren.");
			};

			PrintScreen (ReinigungsMeldung, -1, YPOS_LevelUp, FONT_Screen, 2);
		};

		if (Npc_GetDistToWP(hero, "WP_BODEN_06") < 600)
		&& (Npc_GetDistToItem(hero, ItMi_Wasserperle) < 1200)
		&& (WM_Boden_06 == FALSE)
		{
			WM_Boden_06 = TRUE;
			Wld_RemoveItem	(ItMi_Wasserperle);

			Wld_SendUnTrigger	("BODEN_06_FOG");

			if (Mod_WM_Boeden == 0)
			{
				Wld_InsertNpc	(WeakDemon, "WP_BODEN_06");
			}
			else if (Mod_WM_Boeden == 1)
			{
				Wld_InsertNpc	(DemonWolf, "WP_BODEN_06");
			};

			Mod_WM_Boeden += 1;

			ReinigungsMeldung = ConcatStrings(IntToString(Mod_WM_Boeden), " Böden gereinigt");

			if (Mod_WM_Boeden == 6)
			{
				B_LogEntry	(TOPIC_MOD_ADANOS_BOEDEN, "Ich habe alle Böden gereinigt und sollte nun zu Saturas zurück kehren.");
			};

			PrintScreen (ReinigungsMeldung, -1, YPOS_LevelUp, FONT_Screen, 2);
		};

		if (Hlp_IsValidNpc(Bloodhound_Untier))
		&& (!Npc_IsDead(Bloodhound_Untier))
		{
			if (Npc_IsInFightMode (hero, FMODE_FIST))
			{
				Bloodhound_Untier.flags = 0;
			}
			else
			{
				Bloodhound_Untier.flags = 2;
			};
		};

		// Der verfluchte Novize

		if (Npc_HasItems(hero, ItMi_AbsorbKristall) == 1)
		&& (Mod_AbsorbKristall == FALSE)
		{
			Mod_AbsorbKristall = TRUE;

			B_LogEntry	(TOPIC_MOD_ADANOS_NOVIZE, "Ich habe tatsächlich das begehrte Artefakt gefunden.");
		};

		if (Hlp_IsValidNpc(Bloodhound_Untier))
		&& (Npc_IsDead(Bloodhound_Untier))
		&& (Mod_Untier_Tot == FALSE)
		&& (Mod_Cronos_Artefakt == 2)
		{
			Mod_Untier_Tot = TRUE;

			B_LogEntry	(TOPIC_MOD_ADANOS_NOVIZE, "Ha, der Bestie habe ich es gezeigt. Die wird niemanden mehr belästigen.");
		};

		// Reinigung der Böden II

		if (Npc_GetDistToWP(hero, "WP_BODEN_07") < 600)
		&& (Npc_GetDistToItem(hero, ItMi_Wasserperle) < 1200)
		&& (WM_Boden_07 == FALSE)
		{
			WM_Boden_07 = TRUE;
			Wld_RemoveItem	(ItMi_Wasserperle);

			Wld_SendUnTrigger	("BODEN_07_FOG");

			Mod_WM_Boeden_02 += 1;

			ReinigungsMeldung = ConcatStrings(IntToString(Mod_WM_Boeden_02), " Böden gereinigt");

			PrintScreen (ReinigungsMeldung, -1, YPOS_LevelUp, FONT_Screen, 2);
		};

		if (Npc_GetDistToWP(hero, "WP_BODEN_08") < 600)
		&& (Npc_GetDistToItem(hero, ItMi_Wasserperle) < 1200)
		&& (WM_Boden_08 == FALSE)
		{
			WM_Boden_08 = TRUE;
			Wld_RemoveItem	(ItMi_Wasserperle);

			Wld_SendUnTrigger	("BODEN_08_FOG");

			Mod_WM_Boeden_02 += 1;

			ReinigungsMeldung = ConcatStrings(IntToString(Mod_WM_Boeden_02), " Böden gereinigt");

			PrintScreen (ReinigungsMeldung, -1, YPOS_LevelUp, FONT_Screen, 2);
		};

		if (Npc_GetDistToWP(hero, "WP_BODEN_09") < 600)
		&& (Npc_GetDistToItem(hero, ItMi_Wasserperle) < 1200)
		&& (WM_Boden_09 == FALSE)
		{
			WM_Boden_09 = TRUE;
			Wld_RemoveItem	(ItMi_Wasserperle);

			Wld_SendUnTrigger	("BODEN_09_FOG");

			Mod_WM_Boeden_02 += 1;

			ReinigungsMeldung = ConcatStrings(IntToString(Mod_WM_Boeden_02), " Böden gereinigt");

			PrintScreen (ReinigungsMeldung, -1, YPOS_LevelUp, FONT_Screen, 2);
		};

		if (Mod_WM_Boeden == 7)
		&& (Mod_WM_Boeden_02 == 3)
		{
			Mod_WM_Boeden = 8;

			B_LogEntry	(TOPIC_MOD_ADANOS_BOEDEN, "So alle Böden entweiht, jetzt zu Saturas um meine Belohnung abzuholen.");
		};

		// Großes Unheil

		if (Mod_WM_Boeden == 9)
		&& (CurrentLevel == NEWWORLD_ZEN)
		&& (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Kap3))
		{
			Wld_SetTime(23,00);

			if (Wld_IsTime(22,00,04,00))
			{
				Mod_WM_Boeden = 10;

				// Bauern töten

				B_KillNpc	(Mod_1420_BAU_Bauer_NW);
				B_KillNpc	(Mod_1421_BAU_Bauer_NW);
				B_KillNpc	(Mod_767_BAU_Malak_NW);
				B_KillNpc	(Mod_107_BAU_Bengar_NW);
				B_KillNpc	(Mod_1416_BAU_Bauer_NW);
				B_KillNpc	(Mod_1417_BAU_Bauer_NW);
				B_KillNpc	(Mod_1418_BAU_Bauer_NW);
				B_KillNpc	(Mod_1419_BAU_Bauer_NW);
				B_KillNpc	(Mod_1422_BAU_Bauer_NW);
				B_KillNpc	(Schaeferhund_Malak);
				B_KillNpc	(Hammel_Bengar_01);
				B_KillNpc	(Sheep_Bengar_01);
				B_KillNpc	(Sheep_Bengar_02);
				B_KillNpc	(Sheep_Bengar_03);
				B_KillNpc	(Sheep_Bengar_04);
				B_KillNpc	(Sheep_Bengar_05);

				B_StartOtherRoutine	(Mod_108_BAU_Pardos_NW, "UNHEIL");

				B_StartOtherRoutine	(Mod_774_KDW_Saturas_NW, "UNHEIL");

				B_StartOtherRoutine	(Mod_1420_BAU_Bauer_NW, "KAMERATALK");
				B_StartOtherRoutine	(Mod_1421_BAU_Bauer_NW, "KAMERATALK");

				Wld_InsertNpc	(Balrog_Plateau, "WP_ADANOS_BALROG");

				Wld_SendTrigger	("EVT_KAMERA_BENGAR");

				CutsceneAn = TRUE;
			};
		};

		if (Mod_WM_Boeden == 10)
		{
			Mod_WM_KameraBengar_Counter += 1;

			if (Mod_WM_KameraBengar_Counter == 1)
			{
				if (Hlp_IsValidNpc(Mod_1420_BAU_Bauer_NW))
				{
					AI_DrawWeapon	(Mod_1420_BAU_Bauer_NW);
				};
				if (Hlp_IsValidNpc(Mod_1421_BAU_Bauer_NW))
				{
					AI_DrawWeapon	(Mod_1421_BAU_Bauer_NW);
				};

				if (Hlp_IsValidNpc(Mod_1420_BAU_Bauer_NW))
				{
					AI_GotoWP	(Mod_1420_BAU_Bauer_NW, "NW_FARM3_RUMBOLD");
				};
				if (Hlp_IsValidNpc(Mod_1421_BAU_Bauer_NW))
				{
					AI_GotoWP	(Mod_1421_BAU_Bauer_NW, "NW_FARM3_RUMBOLD");
				};
			};

			if (Mod_WM_KameraBengar_Counter == 6)
			{
				AI_Output(Mod_1420_BAU_Bauer_NW, NULL, "Info_Mod_Bauer_01_00"); //Ach du Scheiße!
			};

			if (Mod_WM_KameraBengar_Counter == 12)
			{
				Mod_WM_Boeden = 11;

				// Monster bei Balrog

				Wld_InsertNpc	(FireGolem_Balrog, "WP_ADANOS_BALROG");
				Wld_InsertNpc	(FireGolem_Balrog, "WP_ADANOS_BALROG");
				Wld_InsertNpc	(FireGolem_Balrog, "WP_ADANOS_BALROG");
				Wld_InsertNpc	(FireGolem_Balrog, "WP_ADANOS_BALROG");
				Wld_InsertNpc	(FireGolem_Balrog, "WP_ADANOS_BALROG");
				Wld_InsertNpc	(FireGolem_Balrog, "WP_ADANOS_BALROG");
				Wld_InsertNpc	(FireGolem_Balrog, "WP_ADANOS_BALROG");

				Wld_InsertNpc	(Feuerteufel_Balrog, "WP_ADANOS_BALROG");
				Wld_InsertNpc	(Feuerteufel_Balrog, "WP_ADANOS_BALROG");
				Wld_InsertNpc	(Feuerteufel_Balrog, "WP_ADANOS_BALROG");
				Wld_InsertNpc	(Feuerteufel_Balrog, "WP_ADANOS_BALROG");
				Wld_InsertNpc	(Feuerteufel_Balrog, "WP_ADANOS_BALROG");

				Wld_InsertNpc	(Demon_Balrog, "WP_ADANOS_BALROG");
				Wld_InsertNpc	(Demon_Balrog, "WP_ADANOS_BALROG");
				Wld_InsertNpc	(Demon_Balrog, "WP_ADANOS_BALROG");
				Wld_InsertNpc	(Demon_Balrog, "WP_ADANOS_BALROG");

				Wld_InsertNpc	(DemonLord_Balrog, "WP_ADANOS_BALROG");
				Wld_InsertNpc	(DemonLord_Balrog, "WP_ADANOS_BALROG");

				// Monster bei Gigant der Vorzeit

				Wld_InsertNpc	(GigantDerVorzeit, "NW_TO_PASS_01");

				Wld_InsertNpc	(DemonWolf_GigantDerVorzeit, "NW_TO_PASS_01");
				Wld_InsertNpc	(DemonWolf_GigantDerVorzeit, "NW_TO_PASS_01");
				Wld_InsertNpc	(DemonWolf_GigantDerVorzeit, "NW_TO_PASS_01");
				Wld_InsertNpc	(DemonWolf_GigantDerVorzeit, "NW_TO_PASS_01");
				Wld_InsertNpc	(DemonWolf_GigantDerVorzeit, "NW_TO_PASS_01");
				Wld_InsertNpc	(DemonWolf_GigantDerVorzeit, "NW_TO_PASS_01");
				Wld_InsertNpc	(DemonWolf_GigantDerVorzeit, "NW_TO_PASS_01");
				Wld_InsertNpc	(DemonWolf_GigantDerVorzeit, "NW_TO_PASS_01");
				Wld_InsertNpc	(DemonWolf_GigantDerVorzeit, "NW_TO_PASS_01");
				Wld_InsertNpc	(DemonWolf_GigantDerVorzeit, "NW_TO_PASS_01");
				Wld_InsertNpc	(DemonWolf_GigantDerVorzeit, "NW_TO_PASS_01");
				Wld_InsertNpc	(DemonWolf_GigantDerVorzeit, "NW_TO_PASS_01");
				Wld_InsertNpc	(DemonWolf_GigantDerVorzeit, "NW_TO_PASS_01");
				Wld_InsertNpc	(DemonWolf_GigantDerVorzeit, "NW_TO_PASS_01");
				Wld_InsertNpc	(DemonWolf_GigantDerVorzeit, "NW_TO_PASS_01");
				Wld_InsertNpc	(DemonWolf_GigantDerVorzeit, "NW_TO_PASS_01");

				Wld_InsertNpc	(Swampgolem_GigantDerVorzeit, "NW_TO_PASS_01");
				Wld_InsertNpc	(Swampgolem_GigantDerVorzeit, "NW_TO_PASS_01");
				Wld_InsertNpc	(Swampgolem_GigantDerVorzeit, "NW_TO_PASS_01");
				Wld_InsertNpc	(Swampgolem_GigantDerVorzeit, "NW_TO_PASS_01");
				Wld_InsertNpc	(Swampgolem_GigantDerVorzeit, "NW_TO_PASS_01");
				Wld_InsertNpc	(Swampgolem_GigantDerVorzeit, "NW_TO_PASS_01");
				Wld_InsertNpc	(Swampgolem_GigantDerVorzeit, "NW_TO_PASS_01");
				Wld_InsertNpc	(Swampgolem_GigantDerVorzeit, "NW_TO_PASS_01");
				Wld_InsertNpc	(Swampgolem_GigantDerVorzeit, "NW_TO_PASS_01");
				Wld_InsertNpc	(Swampgolem_GigantDerVorzeit, "NW_TO_PASS_01");
				Wld_InsertNpc	(Swampgolem_GigantDerVorzeit, "NW_TO_PASS_01");

				// Monster bei Diener des Bösen 1

				Wld_InsertNpc	(DienerDesBoesen_01, "NW_FARM4_WOOD_MONSTER_MORE_03");

				Wld_InsertNpc	(Zombie_DienerDesBoesen_01_01, "NW_FARM4_WOOD_MONSTER_MORE_03");
				Wld_InsertNpc	(Zombie_DienerDesBoesen_01_02, "NW_FARM4_WOOD_MONSTER_MORE_03");
				Wld_InsertNpc	(Zombie_DienerDesBoesen_01_03, "NW_FARM4_WOOD_MONSTER_MORE_03");
				Wld_InsertNpc	(Zombie_DienerDesBoesen_01_04, "NW_FARM4_WOOD_MONSTER_MORE_03");
				Wld_InsertNpc	(Zombie_DienerDesBoesen_01_05, "NW_FARM4_WOOD_MONSTER_MORE_03");
				Wld_InsertNpc	(Zombie_DienerDesBoesen_01_06, "NW_FARM4_WOOD_MONSTER_MORE_03");
				Wld_InsertNpc	(Zombie_DienerDesBoesen_01_07, "NW_FARM4_WOOD_MONSTER_MORE_03");
				Wld_InsertNpc	(Zombie_DienerDesBoesen_01_08, "NW_FARM4_WOOD_MONSTER_MORE_03");
				Wld_InsertNpc	(Zombie_DienerDesBoesen_01_09, "NW_FARM4_WOOD_MONSTER_MORE_03");
				Wld_InsertNpc	(Zombie_DienerDesBoesen_01_10, "NW_FARM4_WOOD_MONSTER_MORE_03");
				Wld_InsertNpc	(Zombie_DienerDesBoesen_01_11, "NW_FARM4_WOOD_MONSTER_MORE_03");
				Wld_InsertNpc	(Zombie_DienerDesBoesen_01_12, "NW_FARM4_WOOD_MONSTER_MORE_03");

				Wld_InsertNpc	(Skeleton_DienerDesBoesen_01_01, "NW_FARM4_WOOD_MONSTER_MORE_03");
				Wld_InsertNpc	(Skeleton_DienerDesBoesen_01_02, "NW_FARM4_WOOD_MONSTER_MORE_03");
				Wld_InsertNpc	(Skeleton_DienerDesBoesen_01_03, "NW_FARM4_WOOD_MONSTER_MORE_03");
				Wld_InsertNpc	(Skeleton_DienerDesBoesen_01_04, "NW_FARM4_WOOD_MONSTER_MORE_03");
				Wld_InsertNpc	(Skeleton_DienerDesBoesen_01_05, "NW_FARM4_WOOD_MONSTER_MORE_03");
				Wld_InsertNpc	(Skeleton_DienerDesBoesen_01_06, "NW_FARM4_WOOD_MONSTER_MORE_03");

				Wld_InsertNpc	(Skeleton_Lord_DienerDesBoesen_01_01, "NW_FARM4_WOOD_MONSTER_MORE_03");
				Wld_InsertNpc	(Skeleton_Lord_DienerDesBoesen_01_02, "NW_FARM4_WOOD_MONSTER_MORE_03");

				Wld_InsertNpc	(SkeletonMage_DienerDesBoesen_01_01, "NW_FARM4_WOOD_MONSTER_MORE_03");
				Wld_InsertNpc	(SkeletonMage_DienerDesBoesen_01_02, "NW_FARM4_WOOD_MONSTER_MORE_03");

				// Monster bei Diener des Bösen 2

				Wld_InsertNpc	(DienerDesBoesen_02, "NW_FARM2_TAVERNCAVE1_02");

				Wld_InsertNpc	(Zombie_DienerDesBoesen_02_01, "NW_FARM2_TAVERNCAVE1_02");
				Wld_InsertNpc	(Zombie_DienerDesBoesen_02_02, "NW_FARM2_TAVERNCAVE1_02");
				Wld_InsertNpc	(Zombie_DienerDesBoesen_02_03, "NW_FARM2_TAVERNCAVE1_02");
				Wld_InsertNpc	(Zombie_DienerDesBoesen_02_04, "NW_FARM2_TAVERNCAVE1_02");
				Wld_InsertNpc	(Zombie_DienerDesBoesen_02_05, "NW_FARM2_TAVERNCAVE1_02");
				Wld_InsertNpc	(Zombie_DienerDesBoesen_02_06, "NW_FARM2_TAVERNCAVE1_02");
				Wld_InsertNpc	(Zombie_DienerDesBoesen_02_07, "NW_FARM2_TAVERNCAVE1_02");
				Wld_InsertNpc	(Zombie_DienerDesBoesen_02_08, "NW_FARM2_TAVERNCAVE1_02");
				Wld_InsertNpc	(Zombie_DienerDesBoesen_02_09, "NW_FARM2_TAVERNCAVE1_02");
				Wld_InsertNpc	(Zombie_DienerDesBoesen_02_10, "NW_FARM2_TAVERNCAVE1_02");
				Wld_InsertNpc	(Zombie_DienerDesBoesen_02_11, "NW_FARM2_TAVERNCAVE1_02");
				Wld_InsertNpc	(Zombie_DienerDesBoesen_02_12, "NW_FARM2_TAVERNCAVE1_02");

				Wld_InsertNpc	(Skeleton_DienerDesBoesen_02_01, "NW_FARM2_TAVERNCAVE1_02");
				Wld_InsertNpc	(Skeleton_DienerDesBoesen_02_02, "NW_FARM2_TAVERNCAVE1_02");
				Wld_InsertNpc	(Skeleton_DienerDesBoesen_02_03, "NW_FARM2_TAVERNCAVE1_02");
				Wld_InsertNpc	(Skeleton_DienerDesBoesen_02_04, "NW_FARM2_TAVERNCAVE1_02");
				Wld_InsertNpc	(Skeleton_DienerDesBoesen_02_05, "NW_FARM2_TAVERNCAVE1_02");
				Wld_InsertNpc	(Skeleton_DienerDesBoesen_02_06, "NW_FARM2_TAVERNCAVE1_02");

				Wld_InsertNpc	(Skeleton_Lord_DienerDesBoesen_02_01, "NW_FARM2_TAVERNCAVE1_02");
				Wld_InsertNpc	(Skeleton_Lord_DienerDesBoesen_02_02, "NW_FARM2_TAVERNCAVE1_02");

				Wld_InsertNpc	(SkeletonMage_DienerDesBoesen_02_01, "NW_FARM2_TAVERNCAVE1_02");
				Wld_InsertNpc	(SkeletonMage_DienerDesBoesen_02_02, "NW_FARM2_TAVERNCAVE1_02");

				// Sonstige Monsterlein

				Wld_InsertNpc	(Zombie_Adanos_Pepe, "FP_SPECIALZOMBIE_ADANOS_01");

				// Hexen

				B_StartOtherRoutine	(Mod_783_BAU_Elena_NW, "HEXE");
				B_StartOtherRoutine	(Mod_104_BAU_Rega_NW, "HEXE");
				B_StartOtherRoutine	(Mod_1403_BAU_Baeuerin_NW, "HEXE");
				B_StartOtherRoutine	(Mod_528_SLD_Cord_NW, "HEXE");
				B_StartOtherRoutine	(Mod_793_BAU_Pepe_NW, "HEXE");

				// Blutkult

				Wld_InsertNpc	(Mod_7203_BK_Straschiduo_NW, "WP_BK_01");
				Wld_InsertNpc	(Mod_7244_BlutkultKrieger_NW, "WP_BK_01");
				Wld_InsertNpc	(Mod_7525_BlutkultKrieger_NW, "WP_BK_01");
				Wld_InsertNpc	(Mod_7526_BlutkultMagier_NW, "WP_BK_01");

				AI_Teleport	(hero, "EXIT_ADDON");

				CutsceneAn = FALSE;
			};
		};

		if (Mod_WM_Boeden == 12)
		{
			if ((Npc_GetDistToWP(hero, "NW_TO_PASS_01") < 2000)
			|| (Npc_GetDistToWP(hero, "WP_ADANOS_BALROG") < 2000))
			&& (Mod_WM_SawBigOne == FALSE)
			{
				Mod_WM_SawBigOne = TRUE;

				B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Ungetüme gigantischen Ausmaßes auf dem Weidenplateau. Das sollte Saturas interessieren.");
			};

			if ((Npc_GetDistToWP(hero, "NW_FARM4_WOOD_MONSTER_MORE_03") < 2000)
			|| (Npc_GetDistToWP(hero, "NW_FARM2_TAVERNCAVE1_02") < 2000))
			&& (Mod_WM_SawGraveOne == FALSE)
			{
				Mod_WM_SawGraveOne = TRUE;

				B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Horden von Untoten scheinen von ihnen vorangestellten Kreaturen angeführt zu werden.");
			};
		};

		if ((Mod_WM_Boeden == 14)
		|| (Mod_WM_Boeden == 13))
		&& (Mod_WM_Hexeninfos == 0)
		&& (Mod_HinweiseDerBauernZuHexen >= 4)
		&& (Mod_GenugBauernHinweise == 0)
		&& (B_GetAivar(hero, AIV_INVINCIBLE) == 0)
		{
			AI_StandUP	(hero);

			Npc_ClearAIQueue	(hero);

			AI_Output(hero, NULL, "Info_Mod_Hero_HexenInfos_15_00"); //Hmm, dass ist doch schon eine Häufung seltsamer Ereignisse. Vielleicht sollte ich Saturas darüber unterrichten.

			Mod_GenugBauernHinweise = 1;
			Mod_WM_Hexeninfos = 1;
		};

		if (Mod_HasBerserkScroll == 0)
		&& (Npc_HasItems(hero, ItSc_AuraBerserker) > 0)
		{
			Mod_HasBerserkScroll = 1;

			B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Hmm, nach dieser Spruchrolle sollte ich mal Saturas fragen.");
		};

		if (Mod_HasHexenScroll == 0)
		&& (Npc_HasItems(hero, ItSc_Verfluchen) > 0)
		&& (Npc_HasItems(hero, ItSc_TrfWoman) > 0)
		&& (Npc_HasItems(hero, ItSc_TrfWomanBack) > 0)
		{
			Mod_HasHexenScroll = 1;

			B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Was sind das für interessante Spruchrollen? Ich sollte mal Saturas dazu konsultieren.");
		};

		if (Mod_WM_PepeAtSheep == 0)
		&& (Npc_KnowsInfo(hero, Info_Mod_Elena_Hexenparty_08))
		{
			if (Hlp_IsValidNpc(Mod_793_BAU_Pepe_NW))
			&& (Npc_GetDistToWP(Mod_793_BAU_Pepe_NW, "NW_BIGFARM_SHEEP2_02") < 500)
			&& (Npc_GetDistToWP(hero, "NW_BIGFARM_SHEEP2_02") < 1000)
			{
				B_StartOtherRoutine	(Mod_793_BAU_Pepe_NW, "ATHOF");

				Mod_WM_PepeAtSheep = 1;
			};
		};

		if (Mod_WM_HexenVerwandlung == 1)
		{
			Mod_WM_HexenTrfCounter += 1;

			if (Mod_WM_HexenTrfCounter == 20)
			{
				Mod_WM_HexenVerwandlung = 2;
			};
		};

		if (Mod_WM_Hexenritual == 1)
		&& (Hlp_IsValidNpc(Mod_783_BAU_Elena_NW))
		&& (!Npc_IsInState(Mod_783_BAU_Elena_NW, ZS_Talk))
		{
			Mod_WM_Hexenritual_Counter += 1;

			if (Mod_WM_Hexenritual_Counter == 10)
			{
				Mod_WM_Hexenritual = 2;

				Mod_TrfWoman = 0;

				hero.attribute[ATR_STRENGTH] += 15;
				hero.attribute[ATR_DEXTERITY] -= 20;
				hero.attribute[ATR_HITPOINTS] += 40;
				hero.attribute[ATR_HITPOINTS_MAX] += 40;

				AI_UnequipArmor	(hero);

				Mdl_SetVisual (hero,"HUMANS.MDS");
				// ------ Visual ------ "body_Mesh",		bodyTex			SkinColor	headMesh,			faceTex,		teethTex,	armorInstance	
				Mdl_SetVisualBody (hero, "hum_body_naked0", 1,				0,			"Hum_Head_Fighter", 	FACE_N_Player,	0, 			NO_Armor);

				Mdl_RemoveOverlayMDS	(hero, "HUMANS_BABE.MDS");

				B_GivePlayerXP	(100);
			};
		};

		if (Mod_WM_HexenTot == 0)
		{
			if ((!Hlp_IsValidNpc(Mod_104_BAU_Rega_NW))
			|| (Npc_IsDead(Mod_104_BAU_Rega_NW)))
			&& ((!Hlp_IsValidNpc(Mod_783_BAU_Elena_NW))
			|| (Npc_IsDead(Mod_783_BAU_Elena_NW)))
			{
				B_KillNpc	(Mod_1403_BAU_Baeuerin_NW);

				Mod_WM_HexenTot = 1;

				Wld_SendTrigger	("BLUTKULTFLAMME");
			};

			if ((!Hlp_IsValidNpc(Mod_1403_BAU_Baeuerin_NW))
			|| (Npc_IsDead(Mod_1403_BAU_Baeuerin_NW)))
			&& ((!Hlp_IsValidNpc(Mod_783_BAU_Elena_NW))
			|| (Npc_IsDead(Mod_783_BAU_Elena_NW)))
			{
				B_KillNpc	(Mod_104_BAU_Rega_NW);

				Mod_WM_HexenTot = 1;

				Wld_SendTrigger	("BLUTKULTFLAMME");
			};

			if ((!Hlp_IsValidNpc(Mod_104_BAU_Rega_NW))
			|| (Npc_IsDead(Mod_104_BAU_Rega_NW)))
			&& ((!Hlp_IsValidNpc(Mod_1403_BAU_Baeuerin_NW))
			|| (Npc_IsDead(Mod_1403_BAU_Baeuerin_NW)))
			{
				B_KillNpc	(Mod_783_BAU_Elena_NW);

				Mod_WM_HexenTot = 1;

				Wld_SendTrigger	("BLUTKULTFLAMME");
			};

			if (Mod_WM_HexenTot == 1)
			{
				B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "So, diese magisch befähigten Weiber wären dann wohl Geschichte. Ich sollte es Saturas mitteilen.");

				B_RemoveNpc	(Mod_7198_HEX_AttraktiveFrau_NW);
			};
		};

		if (Npc_HasItems(hero, ItRu_Kontrolle_01) > 0)
		{
			Npc_RemoveInvItems	(hero, ItRu_Kontrolle_01, 1);
			CreateInvItems	(hero, ItRu_Kontrolle, 1);

			if (Mod_WM_HasRune == 0)
			{
				Mod_WM_HasRune = 1;

				B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Vielleicht kann Saturas mir mehr zu der Rune sagen, welche der Untote bei sich hatte.");
			};
		};

		if (Mod_WM_BlutkultTot == FALSE)
		&& (Mod_WM_BlutkultAttack == 1)
		{
			if (Npc_IsDead(Mod_7203_BK_Straschiduo_NW))
			&& (Npc_IsDead(Mod_7244_BlutkultKrieger_NW))
			&& (Npc_IsDead(Mod_7526_BlutkultMagier_NW))
			&& (Npc_IsDead(Mod_7525_BlutkultKrieger_NW))
			{
				Mod_WM_BlutkultTot = TRUE;

				if (!Npc_KnowsInfo(hero, Info_Mod_Cronos_Angriff_02))
				{
					B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Gut, die Blutkultfritzen wären Geschichte. Jetzt sollte ich Saturas von meinem Erfolg berichten.");
				};
			};
		};

		if (Npc_KnowsInfo(hero, Info_Mod_Cronos_Angriff_01))
		&& (Npc_IsDead(Balrog_Plateau))
		&& (Mod_WM_CronosAttack == 1)
		{
			Mod_WM_CronosAttack = 2;

			B_StartOtherRoutine	(Mod_1538_WKR_Wasserkrieger_NW, "GIGANT");
			B_StartOtherRoutine	(Mod_1530_WKR_Everaldo_NW, "GIGANT");
			B_StartOtherRoutine	(Mod_1539_WKR_Wasserkrieger_NW, "GIGANT");
			B_StartOtherRoutine	(Mod_1533_WKR_Salvador_NW, "GIGANT");
			B_StartOtherRoutine	(Mod_1537_WKR_Vanas_NW, "GIGANT");
			B_StartOtherRoutine	(Mod_1536_WKR_Roka_NW, "GIGANT");
			B_StartOtherRoutine	(Mod_1535_WKR_Wasserkrieger_NW, "GIGANT");
			B_StartOtherRoutine	(Mod_1534_WKR_Wasserkrieger_NW, "GIGANT");
			B_StartOtherRoutine	(Mod_1532_HTR_Ethan_NW, "GIGANT");
			B_StartOtherRoutine	(Mod_758_KDW_Cronos_NW, "GIGANT");

			if (Npc_KnowsInfo(hero, Info_Mod_Diego_PlateauAngriff))
			{
				B_StartOtherRoutine	(Mod_538_RDW_Diego_NW, "GIGANT");
			};

			B_StartOtherRoutine	(Mod_588_WNOV_Joe_NW, "GIGANT");
		};

		if (Npc_KnowsInfo(hero, Info_Mod_Cronos_Angriff_01))
		&& (Npc_IsDead(GigantDerVorzeit))
		&& (Mod_WM_CronosAttack == 2)
		{
			Mod_WM_CronosAttack = 3;

			B_StartOtherRoutine	(Mod_1538_WKR_Wasserkrieger_NW, "START");
			B_StartOtherRoutine	(Mod_1530_WKR_Everaldo_NW, "START");
			B_StartOtherRoutine	(Mod_1539_WKR_Wasserkrieger_NW, "START");
			B_StartOtherRoutine	(Mod_1533_WKR_Salvador_NW, "START");
			B_StartOtherRoutine	(Mod_1537_WKR_Vanas_NW, "START");
			B_StartOtherRoutine	(Mod_1536_WKR_Roka_NW, "START");
			B_StartOtherRoutine	(Mod_1535_WKR_Wasserkrieger_NW, "START");
			B_StartOtherRoutine	(Mod_1534_WKR_Wasserkrieger_NW, "START");
			B_StartOtherRoutine	(Mod_1532_HTR_Ethan_NW, "START");
			B_StartOtherRoutine	(Mod_588_WNOV_Joe_NW, "START");
		};

		if (Mod_WM_Boeden >= 11)
		&& (Npc_IsDead(Balrog_Plateau))
		&& (Npc_IsDead(GigantDerVorzeit))
		&& (!Npc_KnowsInfo(hero, Info_Mod_Cronos_Angriff_01))
		{
			Mod_WM_CronosAttack = 4;
		};

		if (Npc_KnowsInfo(hero, Info_Mod_Cronos_Angriff_01))
		&& (!Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_26))
		{
			if (Npc_IsDead(Mod_1538_WKR_Wasserkrieger_NW))
			{
				Mod_WM_Truppe_01 = 1;
			};

			if (Npc_IsDead(Mod_1530_WKR_Everaldo_NW))
			{
				Mod_WM_Truppe_02 = 1;
			};

			if (Npc_IsDead(Mod_1539_WKR_Wasserkrieger_NW))
			{
				Mod_WM_Truppe_03 = 1;
			};

			if (Npc_IsDead(Mod_1533_WKR_Salvador_NW))
			{
				Mod_WM_Truppe_04 = 1;
			};

			if (Npc_IsDead(Mod_1537_WKR_Vanas_NW))
			{
				Mod_WM_Truppe_05 = 1;
			};

			if (Npc_IsDead(Mod_1536_WKR_Roka_NW))
			{
				Mod_WM_Truppe_06 = 1;
			};

			if (Npc_IsDead(Mod_1535_WKR_Wasserkrieger_NW))
			{
				Mod_WM_Truppe_07 = 1;
			};

			if (Npc_IsDead(Mod_1534_WKR_Wasserkrieger_NW))
			{
				Mod_WM_Truppe_08 = 1;
			};

			if (Npc_IsDead(Mod_1532_HTR_Ethan_NW))
			{
				Mod_WM_Truppe_09 = 1;
			};

			if (Npc_IsDead(Mod_758_KDW_Cronos_NW))
			{
				Mod_WM_Truppe_10 = 1;
			};
		};

		if ((Mod_WM_Boeden == 14)
		|| (Mod_WM_Boeden == 13))
		&& (!Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_26))
		&& (Npc_IsDead(Balrog_Plateau))
		&& (Npc_IsDead(GigantDerVorzeit))
		&& (Mod_WM_CronosAttack < 3)
		{
			Mod_WM_CronosAttack = 3;

			B_StartOtherRoutine	(Mod_1538_WKR_Wasserkrieger_NW, "START");
			B_StartOtherRoutine	(Mod_1530_WKR_Everaldo_NW, "START");
			B_StartOtherRoutine	(Mod_1539_WKR_Wasserkrieger_NW, "START");
			B_StartOtherRoutine	(Mod_1533_WKR_Salvador_NW, "START");
			B_StartOtherRoutine	(Mod_1537_WKR_Vanas_NW, "START");
			B_StartOtherRoutine	(Mod_1536_WKR_Roka_NW, "START");
			B_StartOtherRoutine	(Mod_1535_WKR_Wasserkrieger_NW, "START");
			B_StartOtherRoutine	(Mod_1534_WKR_Wasserkrieger_NW, "START");
			B_StartOtherRoutine	(Mod_1532_HTR_Ethan_NW, "START");
			B_StartOtherRoutine	(Mod_758_KDW_Cronos_NW, "TOT");

			if (Npc_KnowsInfo(hero, Info_Mod_Diego_PlateauAngriff))
			{
				B_StartOtherRoutine	(Mod_538_RDW_Diego_NW, "START");
			};

			B_StartOtherRoutine	(Mod_588_WNOV_Joe_NW, "START");

			Mod_1538_WKR_Wasserkrieger_NW.aivar[AIV_PARTYMEMBER] = FALSE;
			Mod_1530_WKR_Everaldo_NW.aivar[AIV_PARTYMEMBER] = FALSE;
			Mod_1539_WKR_Wasserkrieger_NW.aivar[AIV_PARTYMEMBER] = FALSE;
			Mod_1533_WKR_Salvador_NW.aivar[AIV_PARTYMEMBER] = FALSE;
			Mod_1537_WKR_Vanas_NW.aivar[AIV_PARTYMEMBER] = FALSE;
			Mod_1536_WKR_Roka_NW.aivar[AIV_PARTYMEMBER] = FALSE;
			Mod_1535_WKR_Wasserkrieger_NW.aivar[AIV_PARTYMEMBER] = FALSE;
			Mod_1534_WKR_Wasserkrieger_NW.aivar[AIV_PARTYMEMBER] = FALSE;
			Mod_1532_HTR_Ethan_NW.aivar[AIV_PARTYMEMBER] = FALSE;
			Mod_758_KDW_Cronos_NW.aivar[AIV_PARTYMEMBER] = FALSE;

			if (Npc_KnowsInfo(hero, Info_Mod_Diego_PlateauAngriff))
			{
				Mod_538_RDW_Diego_NW.aivar[AIV_PARTYMEMBER] = FALSE;
			};

			Mod_588_WNOV_Joe_NW.aivar[AIV_PARTYMEMBER] = FALSE;
		};

		// Iwan, der Dämonenjäger

		if (Npc_HasItems(hero, ItAt_IwansKopf) == 1)
		&& (Npc_GetDistToWP(hero, "NW_CRYPT_IN_11") < 500)
		{
			Npc_RemoveInvItems	(hero, ItAt_IwansKopf, 1);

			Mod_WM_Iwan = 1;
		};

		// Wasilis Verbannung

		if (Mod_WM_WasiliQuest == 1)
		&& (Mod_WM_WasiliTag < Wld_GetDay()-1)
		&& (!Npc_IsInState(Mod_100_BAU_Wasili_NW, ZS_Talk))
		{
			B_StartOtherRoutine	(Mod_100_BAU_Wasili_NW, "VERBANNT");

			Mod_WM_WasiliQuest = 2;
		};

		if (Mob_HasItems("ONARSTRUHE", ItFo_OnarsSchnaps2) == 1)
		&& (Mod_WM_WasiliSchnaps == 0)
		{
			Mod_WM_WasiliSchnaps = 1;

			Mod_WM_WasiliTag = Wld_GetDay();
		};

		if (Mod_WM_WasiliSchnaps == 1)
		&& (Mod_WM_WasiliTag < Wld_GetDay())
		{
			Mod_WM_WasiliSchnaps = 2;
		};

		// Merkwürdige Höhlengeräusche

		if (Npc_GetDistToWP(hero, "NW_TROLLAREA_RUINS_CAVE_01") < 500)
		&& (Mod_WM_EthanQuest == 1)
		&& (Npc_KnowsInfo(hero, Info_Mod_Ethan_DungeonSounds_02))
		{
			Mod_WM_EthanQuest = 2;

			B_LogEntry	(TOPIC_MOD_ADANOS_ETHAN, "Nanu, was sind das für sonderbare Gestalten, welche die Felsen mit Spitzhacken bearbeiten? Darüber sollte ich Ethan unterrichten, sobald er wieder erwacht ist.");
		};

		// Nach der Hexenaffäre hängt man im Dialog fest

		if (Npc_KnowsInfo(hero, Info_Mod_AttraktiveFrau_Sex))
		&& (!Npc_IsInState(Mod_7198_HEX_AttraktiveFrau_NW, ZS_Talk))
		&& (Mod_WM_Verflucht == 0)
		&& (Mod_WM_HexenFluchBroken == 0)
		{
			Mod_WM_Verflucht = 1;

			Mod_WM_HexenFluchBroken = 1;

			Wld_SetTime (07,00);
		};

		// Blutkult greift den Held an

		if (Mod_WM_BlutkultAttack == 1)
		{
			if (B_GetAivar(hero, AIV_INVINCIBLE) == FALSE)
			{
				if (!Npc_IsDead(Mod_7203_BK_Straschiduo_NW))
				&& (!Npc_IsInState(Mod_7203_BK_Straschiduo_NW, ZS_Attack))
				{
					B_Attack	(Mod_7203_BK_Straschiduo_NW, hero, AR_GuildEnemy, 0);
				};
				if (!Npc_IsDead(Mod_7244_BlutkultKrieger_NW))
				&& (!Npc_IsInState(Mod_7244_BlutkultKrieger_NW, ZS_Attack))
				{
					B_Attack	(Mod_7244_BlutkultKrieger_NW, hero, AR_GuildEnemy, 0);
				};
				if (!Npc_IsDead(Mod_7525_BlutkultKrieger_NW))
				&& (!Npc_IsInState(Mod_7525_BlutkultKrieger_NW, ZS_Attack))
				{
					B_Attack	(Mod_7525_BlutkultKrieger_NW, hero, AR_GuildEnemy, 0);
				};
				if (!Npc_IsDead(Mod_7526_BlutkultMagier_NW))
				&& (!Npc_IsInState(Mod_7526_BlutkultMagier_NW, ZS_Attack))
				{
					B_Attack	(Mod_7526_BlutkultMagier_NW, hero, AR_GuildEnemy, 0);
				};
			};
		};

		// Hexen sterblich machen

		if (Mod_WM_Boeden >= 11)
		{
			Mod_783_BAU_Elena_NW.flags = 0;
			Mod_1403_BAU_Baeuerin_NW.flags = 0;
			Mod_104_BAU_Rega_NW.flags = 0;
		};

		// Angriff mit Cronos auf Plateau: Sollen erst nach Gespräch loslaufen

		if (Npc_KnowsInfo(hero, Info_Mod_Cronos_Angriff_01))
		&& (!Npc_IsInState(Mod_758_KDW_Cronos_NW, ZS_Talk))
		&& (Mod_WM_CronosAngriff == 0)
		{
			Mod_WM_CronosAngriff = 1;

			B_StartOtherRoutine	(Mod_1538_WKR_Wasserkrieger_NW, "BALROG");
			B_StartOtherRoutine	(Mod_1530_WKR_Everaldo_NW, "BALROG");
			B_StartOtherRoutine	(Mod_1539_WKR_Wasserkrieger_NW, "BALROG");
			B_StartOtherRoutine	(Mod_1533_WKR_Salvador_NW, "BALROG");
			B_StartOtherRoutine	(Mod_1537_WKR_Vanas_NW, "BALROG");
			B_StartOtherRoutine	(Mod_1536_WKR_Roka_NW, "BALROG");
			B_StartOtherRoutine	(Mod_1535_WKR_Wasserkrieger_NW, "BALROG");
			B_StartOtherRoutine	(Mod_1534_WKR_Wasserkrieger_NW, "BALROG");
			B_StartOtherRoutine	(Mod_1532_HTR_Ethan_NW, "BALROG");
			B_StartOtherRoutine	(Mod_758_KDW_Cronos_NW, "BALROG");

			if (Npc_KnowsInfo(hero, Info_Mod_Diego_PlateauAngriff))
			{
				B_StartOtherRoutine	(Mod_538_RDW_Diego_NW, "BALROG");
			};

			if (Npc_KnowsInfo(hero, Info_Mod_Joe_Wassersnapper))
			{
				B_StartOtherRoutine	(Mod_588_WNOV_Joe_NW, "BALROG");
			};
		};

		if (Npc_KnowsInfo(hero, Info_Mod_AttraktiveFrau_Sex))
		&& (Mod_WM_HexenSpruch == 0)
		&& (!Npc_IsInState(Mod_7198_HEX_AttraktiveFrau_NW, ZS_Talk))
		{
			Mod_WM_HexenSpruch = 1;

			AI_Output(hero, NULL, "Info_Mod_Hero_HexenSpruch_15_00"); //Verdammt, ich fühle mich gar nicht gut.
		};
		
		if (Npc_KnowsInfo(hero, Info_Mod_Wilderer_Hi))
		&& (!Npc_IsInState(Mod_7588_OUT_Wilderer_NW, ZS_Talk))
		&& (!Mod_BDS_FightStart) {
			Mod_BDS_FightStart = TRUE;

			Mod_7588_OUT_Wilderer_NW.aivar[AIV_Partymember] = FALSE;
			Mod_7587_OUT_Wilderer_NW.aivar[AIV_Partymember] = FALSE;
		};
	};

	// Aura des Berserkers - Wirkung

	if (Mod_AuraBerserker > 0)
	{
		Mod_AuraBerserker_Counter -= 1;

		if (Mod_AuraBerserker_Counter == 0)
		{
			if (Mod_AuraBerserker == 1)
			{
				B_RemoveAuraBerserker(hero);
			}
			else
			{
				B_RemoveAuraBerserker(hero);
				B_RemoveAuraBerserker(Mod_1538_WKR_Wasserkrieger_NW);
				B_RemoveAuraBerserker(Mod_1530_WKR_Everaldo_NW);
				B_RemoveAuraBerserker(Mod_1539_WKR_Wasserkrieger_NW);
				B_RemoveAuraBerserker(Mod_1533_WKR_Salvador_NW);
				B_RemoveAuraBerserker(Mod_1537_WKR_Vanas_NW);
				B_RemoveAuraBerserker(Mod_1536_WKR_Roka_NW);
				B_RemoveAuraBerserker(Mod_1535_WKR_Wasserkrieger_NW);
				B_RemoveAuraBerserker(Mod_1534_WKR_Wasserkrieger_NW);
				B_RemoveAuraBerserker(Mod_1532_HTR_Ethan_NW);
				B_RemoveAuraBerserker(Mod_758_KDW_Cronos_NW);

				if (Npc_KnowsInfo(hero, Info_Mod_Diego_PlateauAngriff))
				{
					B_RemoveAuraBerserker(Mod_538_RDW_Diego_NW);
				};

				if (Npc_KnowsInfo(hero, Info_Mod_Joe_Wassersnapper))
				{
					B_RemoveAuraBerserker(Mod_588_WNOV_Joe_NW);
				};
			};

			Mod_AuraBerserker = 0;
		};
	};

	if (CurrentLevel == ADDONWORLD_ZEN)
	{
		// Teleport beim Fokus einsetzen

		if (FokiEingesetzt == 2)
		&& (FokusBlockade == TRUE)
		&& (Mod_WM_FokusTeleport < 3)
		{
			Mod_WM_FokusTeleport += 1;

			B_SetAivar(hero, AIV_INVINCIBLE, FALSE);

			if (Mod_WM_FokusTeleport == 3)
			{
				AI_Teleport	(hero, "AW_CAVE_MENSCHENFRESSER_01");
			};
		};

		if (FokiEingesetzt == 4)
		&& (FokusBlockade == TRUE)
		&& (Mod_WM_FokusTeleport >= 3)
		&& (Mod_WM_FokusTeleport < 6)
		{
			Mod_WM_FokusTeleport += 1;

			B_SetAivar(hero, AIV_INVINCIBLE, FALSE);

			if (Mod_WM_FokusTeleport == 6)
			{
				AI_Teleport	(hero, "OBELISKSCHREIN_WP");
			};
		};
	};

	if (CurrentLevel == RELENDEL_ZEN)
	{
		// Eine Plage kommt selten alleine

		if (Mod_RattenQuest >= 3)
		&& (Mod_WM_Plage_PartRatte == 0)
		{
			Mod_WM_Plage_PartRatte = 1;

			B_LogEntry	(TOPIC_MOD_ADANOS_PLAGE, "Gut, das Rattenproblem wäre schon mal weitgehend geklärt.");
		};

		if (Mod_WM_UnheilFertig == 2)
		&& (Mod_WM_Plage_PartRatte == 1)
		&& (Mod_WM_Plage_PartHase == 1)
		&& (Mod_WM_Plage_PartInsekt == 1)
		{
			Mod_WM_UnheilFertig = 3;

			B_LogEntry	(TOPIC_MOD_ADANOS_PLAGE, "Damit wären die Ursachen der Plagen erschlossen und ich kann zu Saturas zurückkehren.");
		};

		if (Mod_WM_Rasend == 1)
		&& (Npc_KnowsInfo(hero, Info_Mod_Saturas_NW_Rasend))
		{
			Mod_WM_Rasend = 2;

			Wld_InsertNpc	(Monster_11038_Shivar_REL, "REL_SURFACE_097");
		};

		if (Npc_GetDistToNpc(hero, Monster_11038_Shivar_REL) < 5000)
		&& (Mod_HeroIstDemon == FALSE)
		&& (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Rasend02))
		&& (!Npc_KnowsInfo(hero, Info_Mod_Shivar_DemonsDead))
		{
			hero.attribute[ATR_STRENGTH] += 100;
			hero.attribute[ATR_DEXTERITY] -= 70;
			hero.attribute[ATR_HITPOINTS_MAX] += 400;
			hero.attribute[ATR_HITPOINTS] += 400;

			hero.protection[PROT_EDGE] += 100000;
			hero.protection[PROT_BLUNT] += 100000;
			hero.protection[PROT_POINT] += 100000;
			hero.protection[PROT_FIRE] += 100;
			hero.protection[PROT_MAGIC] += 100;

			hero.aivar[AIV_Damage] += 400;

			hero.damagetype = DAM_FIRE;

			AI_UnequipArmor	(hero);

			Mdl_SetVisualBody (hero, "hum_body_naked0", 18,				0,			"Hum_Head_Fighter", 	207,	0, 			NO_Armor);

			Wld_PlayEffect	("INFERNALFIRE", hero, hero, 0, 0, 0, FALSE);

			Mod_HeroIstDemon = TRUE;
			Mod_HeroDemonCounter = 99999;
		};

		if (Npc_GetDistToNpc(hero, Monster_11038_Shivar_REL) > 5000)
		&& (Mod_HeroIstDemon == TRUE)
		&& (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Rasend02))
		&& (!Npc_KnowsInfo(hero, Info_Mod_Saturas_NW_Rasend02))
		{
			Mod_HeroDemonCounter = 0;

			Wld_StopEffect	("INFERNALFIRE");
		};
	};

	if (CurrentLevel == EISGEBIET_ZEN)
	{
		if (Mod_WM_Rasend == 2)
		&& (Npc_KnowsInfo(hero, Info_Mod_Shivar_DemonsDead))
		{
			Mod_WM_Rasend = 3;

			Wld_InsertNpc	(Monster_11039_Shivar_EIS, "EIS_257");
			Wld_InsertNpc	(Monster_11040_Mahisha_EIS, "EIS_257");
			Wld_InsertNpc	(Monster_11041_Demon_EIS, "EIS_257");
			Wld_InsertNpc	(Monster_11042_Demon_EIS, "EIS_257");
			Wld_InsertNpc	(Monster_11043_Demon_EIS, "EIS_257");
			Wld_InsertNpc	(Monster_11044_Schrat_EIS, "EIS_257");
			Wld_InsertNpc	(Monster_11045_Schrat_EIS, "EIS_257");
			Wld_InsertNpc	(Monster_11046_Schrat_EIS, "EIS_257");
			Wld_InsertNpc	(Monster_11047_DemonWolf_EIS, "EIS_257");
			Wld_InsertNpc	(Monster_11048_DemonWolf_EIS, "EIS_257");
			Wld_InsertNpc	(Monster_11049_DemonWolf_EIS, "EIS_257");
			Wld_InsertNpc	(Monster_11050_Eisgolem_EIS, "EIS_257");
			Wld_InsertNpc	(Monster_11051_Eisgolem_EIS, "EIS_257");
			Wld_InsertNpc	(Monster_11052_Eisgolem_EIS, "EIS_257");
		};

		if (Npc_GetDistToNpc(hero, Monster_11039_Shivar_EIS) < 5000)
		&& (Mod_HeroIstDemon == FALSE)
		&& (Npc_KnowsInfo(hero, Info_Mod_Shivar_DemonsDead))
		&& (!Npc_KnowsInfo(hero, Info_Mod_Shivar_MahishaDead))
		{
			hero.attribute[ATR_STRENGTH] += 100;
			hero.attribute[ATR_DEXTERITY] -= 70;
			hero.attribute[ATR_HITPOINTS_MAX] += 400;
			hero.attribute[ATR_HITPOINTS] += 400;

			hero.protection[PROT_EDGE] += 100000;
			hero.protection[PROT_BLUNT] += 100000;
			hero.protection[PROT_POINT] += 100000;
			hero.protection[PROT_FIRE] += 100;
			hero.protection[PROT_MAGIC] += 100;

			hero.aivar[AIV_Damage] += 400;

			hero.damagetype = DAM_FIRE;

			AI_UnequipArmor	(hero);

			Mdl_SetVisualBody (hero, "hum_body_naked0", 18,				0,			"Hum_Head_Fighter", 	207,	0, 			NO_Armor);

			Wld_PlayEffect	("INFERNALFIRE", hero, hero, 0, 0, 0, FALSE);

			Mod_HeroIstDemon = TRUE;
			Mod_HeroDemonCounter = 99999;
		};

		if (Npc_GetDistToNpc(hero, Monster_11039_Shivar_EIS) > 5000)
		&& (Mod_HeroIstDemon == TRUE)
		&& (Npc_KnowsInfo(hero, Info_Mod_Shivar_DemonsDead))
		{
			Mod_HeroDemonCounter = 0;

			Wld_StopEffect	("INFERNALFIRE");
		};

		// Shivars Monster greifen erst an, wenn der Dialog vorbei ist

		if (Npc_KnowsInfo(hero, Info_Mod_Shivar_Eisgebiet))
		&& (!Npc_IsInState(Monster_11039_Shivar_EIS, ZS_Talk))
		&& (Mod_Shivar_EIS_Angriff == 0)
		{
			Mod_Shivar_EIS_Angriff = 1;

			B_StartOtherRoutine	(Monster_11039_Shivar_EIS, "ANGRIFF");
			B_StartOtherRoutine	(Monster_11041_Demon_EIS, "ANGRIFF");
			B_StartOtherRoutine	(Monster_11042_Demon_EIS, "ANGRIFF");
			B_StartOtherRoutine	(Monster_11043_Demon_EIS, "ANGRIFF");
			B_StartOtherRoutine	(Monster_11044_Schrat_EIS, "ANGRIFF");
			B_StartOtherRoutine	(Monster_11045_Schrat_EIS, "ANGRIFF");
			B_StartOtherRoutine	(Monster_11046_Schrat_EIS, "ANGRIFF");
		};
	};

	// Rune des Eisklinge - wirkung lässt nach 2 Min nach

	if (Mod_WM_Eisklinge_Counter > 0)
	&& (Mod_WM_Eisklinge == TRUE)
	{
		Mod_WM_Eisklinge_Counter -= 1;

		if (Mod_WM_Eisklinge_Counter == 0)
		{
			Mod_WM_Eisklinge = FALSE;
		};
	};
};