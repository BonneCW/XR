FUNC VOID SPECIALFUNC_01()
{
	if (CurrentLevel == NEWWORLD_ZEN)
	{
		// NL-Story: nach dem Gespräch mit Xardas Hero teleportieren und die ganzen Monster spawnen

		if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Drachen))
		&& (Hlp_IsValidNpc(Mod_513_DMB_Xardas_NW))
		&& (!Npc_IsInState(Mod_513_DMB_Xardas_NW, ZS_Talk))
		&& (Mod_NL_XardasTeleport == 0)
		{
			Mod_NL_XardasTeleport	= 1;

			AI_Teleport	(hero, "TAVERNE");

			// Neue Monster in Khorinis einfügen

			Wld_InsertNpc	(Kobold_11000_NW, "NW_TAVERNE_02");
			Wld_InsertNpc	(Knucker_11001_NW, "BIGFARM");
			Wld_InsertNpc	(Feuerdrache_11002_NW, "BIGFARM");
			Wld_InsertNpc	(Gnom_11005_NW, "BIGFARM");
			Wld_InsertNpc	(Kakos_11006_NW, "BIGFARM");
			Wld_InsertNpc	(Dragon_11009_NW, "BIGFARM");
			Wld_InsertNpc	(Kobold_11010_NW, "BIGFARM");

			// Kleindrachen bei Dragon

			Wld_InsertNpc	(Kleindrache, "FP_ROAM_KLEINDRACHE_01");
			Wld_InsertNpc	(Kleindrache, "FP_ROAM_KLEINDRACHE_02");
			Wld_InsertNpc	(Kleindrache, "FP_ROAM_KLEINDRACHE_03");
			Wld_InsertNpc	(Kleindrache, "FP_ROAM_KLEINDRACHE_04");
			Wld_InsertNpc	(Kleindrache, "FP_ROAM_KLEINDRACHE_05");
			Wld_InsertNpc	(Kleindrache, "FP_ROAM_KLEINDRACHE_06");
			Wld_InsertNpc	(Kleindrache, "FP_ROAM_KLEINDRACHE_07");
			Wld_InsertNpc	(Kleindrache, "FP_ROAM_KLEINDRACHE_08");

			// Kobolde bei Dragon

			Wld_InsertNpc	(Kobold, "FP_ROAM_KOBOLDE_01");
			Wld_InsertNpc	(Kobold, "FP_ROAM_KOBOLDE_02");
			Wld_InsertNpc	(Kobold, "FP_ROAM_KOBOLDE_03");
			Wld_InsertNpc	(Kobold, "FP_ROAM_KOBOLDE_04");
			Wld_InsertNpc	(Kobold, "FP_ROAM_KOBOLDE_05");
			Wld_InsertNpc	(Kobold, "FP_ROAM_KOBOLDE_06");
			Wld_InsertNpc	(Kobold, "FP_ROAM_KOBOLDE_07");
			Wld_InsertNpc	(Kobold, "FP_ROAM_KOBOLDE_08");
			Wld_InsertNpc	(Kobold, "FP_ROAM_KOBOLDE_09");
			Wld_InsertNpc	(Kobold, "FP_ROAM_KOBOLDE_10");
			Wld_InsertNpc	(Kobold, "FP_ROAM_KOBOLDE_11");
			Wld_InsertNpc	(Kobold, "FP_ROAM_KOBOLDE_12");
			Wld_InsertNpc	(Kobold, "FP_ROAM_KOBOLDE_13");

			// Schrats bei Dragon

			Wld_InsertNpc	(Schrat_11019_NW, "TAVERNE");
			Wld_InsertNpc	(Schrat_11020_NW, "TAVERNE");
			Wld_InsertNpc	(Schrat_11021_NW, "TAVERNE");
			Wld_InsertNpc	(Schrat_11022_NW, "TAVERNE");

			// Paladine vor Stadttor + Zombies

			B_StartOtherRoutine	(Mod_1243_RIT_Ritter_NW, "LICH");
			B_StartOtherRoutine	(Mod_1244_RIT_Ritter_NW, "LICH");
			B_StartOtherRoutine	(Mod_1245_RIT_Ritter_NW, "LICH");
			B_StartOtherRoutine	(Mod_1246_RIT_Ritter_NW, "LICH");
			B_StartOtherRoutine	(Mod_1247_RIT_Ritter_NW, "LICH");

			Wld_InsertNpc	(Zombie_Woman01, "NW_CITY_TO_FOREST_03");
			Wld_InsertNpc	(Zombie_Woman02, "NW_CITY_TO_FOREST_03");
			Wld_InsertNpc	(Zombie01, "NW_CITY_TO_FOREST_03");
			Wld_InsertNpc	(Zombie02, "NW_CITY_TO_FOREST_03");
			Wld_InsertNpc	(Zombie03, "NW_CITY_TO_FOREST_03");
			Wld_InsertNpc	(Zombie04, "NW_CITY_TO_FOREST_03");
			Wld_InsertNpc	(Zombie01, "NW_CITY_TO_FOREST_03");
			Wld_InsertNpc	(Zombie02, "NW_CITY_TO_FOREST_03");

			// Drei Paladine spawnen lassen

			Wld_InsertNpc	(Mod_7290_PAL_Athos_NW,	"TAVERNE");
			Wld_InsertNpc	(Mod_7291_PAL_Aramis_NW,	"TAVERNE");
			Wld_InsertNpc	(Mod_7292_PAL_Porthos_NW,	"TAVERNE");

			Wld_InsertNpc	(Skeleton_Lord, "NW_FARM2_TAVERNCAVE1_02");
			Wld_InsertNpc	(Skeleton_Lord, "NW_FARM2_TAVERNCAVE1_02");

			Wld_SendTrigger	("DRAGONSSCHATZ");
		};

		// Kristall des Feuers in Truhe spawnen, wenn der Hero nah genug dran ist

		if (Npc_GetDistToWP(hero, "NW_CITY_KANAL_ROOM_02_02") < 300)
		&& (Mod_PalaKristall == 0)
		{
			Mod_PalaKristall = 1;

			Mob_CreateItems	("MOB_FINGERS", Mod_PaladinKristall, 1);
		};

		var int randi;

		// Rübe ziehen bei Lobart

		if (Mod_LobartRuebinator < 2)
		{
			if (Npc_HasItems(hero, ItPl_Beet_Lobart_01) == 1)
			{
				if (NextRuebe != 1)
				{
					Wld_InsertItem	(ItPl_Beet_Lobart_01, "FP_ITEM_RUEBE_LOBART_01");
					Npc_RemoveInvItems	(hero, ItPl_Beet_Lobart_01, 1);

					Mod_LobartsRuebe01 += 1;

					if (Mod_LobartsRuebe01 == 1)
					{
						randi = Hlp_Random(3);

						if (randi == 0)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_01");
						}
						else if (randi == 1)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_02");
						}
						else if (randi == 2)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_03");
						};
					}
					else if (Mod_LobartsRuebe01 == 2)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE02");
					}
					else if (Mod_LobartsRuebe01 == 4)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE03");
					};
				}
				else
				{
					Npc_RemoveInvItems	(hero, ItPl_Beet_Lobart_01, 1);
					CreateInvItems	(hero, ItPl_Beet, 1);

					randi = Hlp_Random(3);

					if (randi == 0)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_01");
					}
					else if (randi == 1)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_02");
					}
					else if (randi == 2)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_03");
					};

					LobartsRuebe01 = 1;

					Mod_LobartsRuebenCounter += 1;

					Mod_LobartsRuebe01 = 0;
					Mod_LobartsRuebe02 = 0;
					Mod_LobartsRuebe03 = 0;
					Mod_LobartsRuebe04 = 0;
					Mod_LobartsRuebe05 = 0;
					Mod_LobartsRuebe06 = 0;
					Mod_LobartsRuebe07 = 0;
					Mod_LobartsRuebe08 = 0;
					Mod_LobartsRuebe09 = 0;
					Mod_LobartsRuebe10 = 0;
					Mod_LobartsRuebe11 = 0;
					Mod_LobartsRuebe12 = 0;
					Mod_LobartsRuebe13 = 0;
					Mod_LobartsRuebe14 = 0;
					Mod_LobartsRuebe15 = 0;
					Mod_LobartsRuebe16 = 0;
					Mod_LobartsRuebe17 = 0;
					Mod_LobartsRuebe18 = 0;
					Mod_LobartsRuebe19 = 0;
					Mod_LobartsRuebe20 = 0;

					if (Mod_LobartsRuebenCounter < 20)
					{
						B_GetNextRuebe();
					};
				};
			}
			else if (Npc_HasItems(hero, ItPl_Beet_Lobart_02) == 1)
			{
				if (NextRuebe != 2)
				{
					Wld_InsertItem	(ItPl_Beet_Lobart_02, "FP_ITEM_RUEBE_LOBART_02");
					Npc_RemoveInvItems	(hero, ItPl_Beet_Lobart_02, 1);

					Mod_LobartsRuebe02 += 1;

					if (Mod_LobartsRuebe02 == 1)
					{
						randi = Hlp_Random(3);

						if (randi == 0)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_01");
						}
						else if (randi == 1)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_02");
						}
						else if (randi == 2)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_03");
						};
					}
					else if (Mod_LobartsRuebe02 == 2)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE02");
					}
					else if (Mod_LobartsRuebe02 == 4)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE03");
					};
				}
				else
				{
					Npc_RemoveInvItems	(hero, ItPl_Beet_Lobart_02, 1);
					CreateInvItems	(hero, ItPl_Beet, 1);

					randi = Hlp_Random(3);

					if (randi == 0)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_01");
					}
					else if (randi == 1)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_02");
					}
					else if (randi == 2)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_03");
					};

					LobartsRuebe02 = 1;

					Mod_LobartsRuebenCounter += 1;

					Mod_LobartsRuebe02 = 0;
					Mod_LobartsRuebe02 = 0;
					Mod_LobartsRuebe03 = 0;
					Mod_LobartsRuebe04 = 0;
					Mod_LobartsRuebe05 = 0;
					Mod_LobartsRuebe06 = 0;
					Mod_LobartsRuebe07 = 0;
					Mod_LobartsRuebe08 = 0;
					Mod_LobartsRuebe09 = 0;
					Mod_LobartsRuebe10 = 0;
					Mod_LobartsRuebe11 = 0;
					Mod_LobartsRuebe12 = 0;
					Mod_LobartsRuebe13 = 0;
					Mod_LobartsRuebe14 = 0;
					Mod_LobartsRuebe15 = 0;
					Mod_LobartsRuebe16 = 0;
					Mod_LobartsRuebe17 = 0;
					Mod_LobartsRuebe18 = 0;
					Mod_LobartsRuebe19 = 0;
					Mod_LobartsRuebe20 = 0;

					if (Mod_LobartsRuebenCounter < 20)
					{
						B_GetNextRuebe();
					};
				};
			}
			else if (Npc_HasItems(hero, ItPl_Beet_Lobart_03) == 1)
			{
				if (NextRuebe != 3)
				{
					Wld_InsertItem	(ItPl_Beet_Lobart_03, "FP_ITEM_RUEBE_LOBART_03");
					Npc_RemoveInvItems	(hero, ItPl_Beet_Lobart_03, 1);

					Mod_LobartsRuebe03 += 1;

					if (Mod_LobartsRuebe03 == 1)
					{
						randi = Hlp_Random(3);

						if (randi == 0)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_01");
						}
						else if (randi == 1)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_02");
						}
						else if (randi == 2)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_03");
						};
					}
					else if (Mod_LobartsRuebe03 == 2)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE02");
					}
					else if (Mod_LobartsRuebe03 == 4)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE03");
					};
				}
				else
				{
					Npc_RemoveInvItems	(hero, ItPl_Beet_Lobart_03, 1);
					CreateInvItems	(hero, ItPl_Beet, 1);

					randi = Hlp_Random(3);

					if (randi == 0)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_01");
					}
					else if (randi == 1)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_02");
					}
					else if (randi == 2)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_03");
					};

					LobartsRuebe03 = 1;

					Mod_LobartsRuebenCounter += 1;

					Mod_LobartsRuebe03 = 0;
					Mod_LobartsRuebe02 = 0;
					Mod_LobartsRuebe03 = 0;
					Mod_LobartsRuebe04 = 0;
					Mod_LobartsRuebe05 = 0;
					Mod_LobartsRuebe06 = 0;
					Mod_LobartsRuebe07 = 0;
					Mod_LobartsRuebe08 = 0;
					Mod_LobartsRuebe09 = 0;
					Mod_LobartsRuebe10 = 0;
					Mod_LobartsRuebe11 = 0;
					Mod_LobartsRuebe12 = 0;
					Mod_LobartsRuebe13 = 0;
					Mod_LobartsRuebe14 = 0;
					Mod_LobartsRuebe15 = 0;
					Mod_LobartsRuebe16 = 0;
					Mod_LobartsRuebe17 = 0;
					Mod_LobartsRuebe18 = 0;
					Mod_LobartsRuebe19 = 0;
					Mod_LobartsRuebe20 = 0;

					if (Mod_LobartsRuebenCounter < 20)
					{
						B_GetNextRuebe();
					};
				};
			}
			else if (Npc_HasItems(hero, ItPl_Beet_Lobart_04) == 1)
			{
				if (NextRuebe != 4)
				{
					Wld_InsertItem	(ItPl_Beet_Lobart_04, "FP_ITEM_RUEBE_LOBART_04");
					Npc_RemoveInvItems	(hero, ItPl_Beet_Lobart_04, 1);

					Mod_LobartsRuebe04 += 1;

					if (Mod_LobartsRuebe04 == 1)
					{
						randi = Hlp_Random(3);

						if (randi == 0)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_01");
						}
						else if (randi == 1)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_02");
						}
						else if (randi == 2)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_03");
						};
					}
					else if (Mod_LobartsRuebe04 == 2)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE02");
					}
					else if (Mod_LobartsRuebe04 == 4)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE03");
					};
				}
				else
				{
					Npc_RemoveInvItems	(hero, ItPl_Beet_Lobart_04, 1);
					CreateInvItems	(hero, ItPl_Beet, 1);

					randi = Hlp_Random(3);

					if (randi == 0)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_01");
					}
					else if (randi == 1)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_02");
					}
					else if (randi == 2)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_03");
					};

					LobartsRuebe04 = 1;

					Mod_LobartsRuebenCounter += 1;

					Mod_LobartsRuebe04 = 0;
					Mod_LobartsRuebe02 = 0;
					Mod_LobartsRuebe03 = 0;
					Mod_LobartsRuebe04 = 0;
					Mod_LobartsRuebe05 = 0;
					Mod_LobartsRuebe06 = 0;
					Mod_LobartsRuebe07 = 0;
					Mod_LobartsRuebe08 = 0;
					Mod_LobartsRuebe09 = 0;
					Mod_LobartsRuebe10 = 0;
					Mod_LobartsRuebe11 = 0;
					Mod_LobartsRuebe12 = 0;
					Mod_LobartsRuebe13 = 0;
					Mod_LobartsRuebe14 = 0;
					Mod_LobartsRuebe15 = 0;
					Mod_LobartsRuebe16 = 0;
					Mod_LobartsRuebe17 = 0;
					Mod_LobartsRuebe18 = 0;
					Mod_LobartsRuebe19 = 0;
					Mod_LobartsRuebe20 = 0;

					if (Mod_LobartsRuebenCounter < 20)
					{
						B_GetNextRuebe();
					};
				};
			}
			else if (Npc_HasItems(hero, ItPl_Beet_Lobart_05) == 1)
			{
				if (NextRuebe != 5)
				{
					Wld_InsertItem	(ItPl_Beet_Lobart_05, "FP_ITEM_RUEBE_LOBART_05");
					Npc_RemoveInvItems	(hero, ItPl_Beet_Lobart_05, 1);

					Mod_LobartsRuebe05 += 1;

					if (Mod_LobartsRuebe05 == 1)
					{
						randi = Hlp_Random(3);

						if (randi == 0)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_01");
						}
						else if (randi == 1)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_02");
						}
						else if (randi == 2)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_03");
						};
					}
					else if (Mod_LobartsRuebe05 == 2)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE02");
					}
					else if (Mod_LobartsRuebe05 == 4)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE03");
					};
				}
				else
				{
					Npc_RemoveInvItems	(hero, ItPl_Beet_Lobart_05, 1);
					CreateInvItems	(hero, ItPl_Beet, 1);

					randi = Hlp_Random(3);

					if (randi == 0)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_01");
					}
					else if (randi == 1)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_02");
					}
					else if (randi == 2)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_03");
					};

					LobartsRuebe05 = 1;

					Mod_LobartsRuebenCounter += 1;

					Mod_LobartsRuebe05 = 0;
					Mod_LobartsRuebe02 = 0;
					Mod_LobartsRuebe03 = 0;
					Mod_LobartsRuebe04 = 0;
					Mod_LobartsRuebe05 = 0;
					Mod_LobartsRuebe06 = 0;
					Mod_LobartsRuebe07 = 0;
					Mod_LobartsRuebe08 = 0;
					Mod_LobartsRuebe09 = 0;
					Mod_LobartsRuebe10 = 0;
					Mod_LobartsRuebe11 = 0;
					Mod_LobartsRuebe12 = 0;
					Mod_LobartsRuebe13 = 0;
					Mod_LobartsRuebe14 = 0;
					Mod_LobartsRuebe15 = 0;
					Mod_LobartsRuebe16 = 0;
					Mod_LobartsRuebe17 = 0;
					Mod_LobartsRuebe18 = 0;
					Mod_LobartsRuebe19 = 0;
					Mod_LobartsRuebe20 = 0;

					if (Mod_LobartsRuebenCounter < 20)
					{
						B_GetNextRuebe();
					};
				};
			}
			else if (Npc_HasItems(hero, ItPl_Beet_Lobart_06) == 1)
			{
				if (NextRuebe != 6)
				{
					Wld_InsertItem	(ItPl_Beet_Lobart_06, "FP_ITEM_RUEBE_LOBART_06");
					Npc_RemoveInvItems	(hero, ItPl_Beet_Lobart_06, 1);

					Mod_LobartsRuebe06 += 1;

					if (Mod_LobartsRuebe06 == 1)
					{
						randi = Hlp_Random(3);

						if (randi == 0)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_01");
						}
						else if (randi == 1)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_02");
						}
						else if (randi == 2)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_03");
						};
					}
					else if (Mod_LobartsRuebe06 == 2)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE02");
					}
					else if (Mod_LobartsRuebe06 == 4)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE03");
					};
				}
				else
				{
					Npc_RemoveInvItems	(hero, ItPl_Beet_Lobart_06, 1);
					CreateInvItems	(hero, ItPl_Beet, 1);

					randi = Hlp_Random(3);

					if (randi == 0)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_01");
					}
					else if (randi == 1)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_02");
					}
					else if (randi == 2)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_03");
					};

					LobartsRuebe06 = 1;

					Mod_LobartsRuebenCounter += 1;

					Mod_LobartsRuebe06 = 0;
					Mod_LobartsRuebe02 = 0;
					Mod_LobartsRuebe03 = 0;
					Mod_LobartsRuebe04 = 0;
					Mod_LobartsRuebe05 = 0;
					Mod_LobartsRuebe06 = 0;
					Mod_LobartsRuebe07 = 0;
					Mod_LobartsRuebe08 = 0;
					Mod_LobartsRuebe09 = 0;
					Mod_LobartsRuebe10 = 0;
					Mod_LobartsRuebe11 = 0;
					Mod_LobartsRuebe12 = 0;
					Mod_LobartsRuebe13 = 0;
					Mod_LobartsRuebe14 = 0;
					Mod_LobartsRuebe15 = 0;
					Mod_LobartsRuebe16 = 0;
					Mod_LobartsRuebe17 = 0;
					Mod_LobartsRuebe18 = 0;
					Mod_LobartsRuebe19 = 0;
					Mod_LobartsRuebe20 = 0;

					if (Mod_LobartsRuebenCounter < 20)
					{
						B_GetNextRuebe();
					};
				};
			}
			else if (Npc_HasItems(hero, ItPl_Beet_Lobart_07) == 1)
			{
				if (NextRuebe != 7)
				{
					Wld_InsertItem	(ItPl_Beet_Lobart_07, "FP_ITEM_RUEBE_LOBART_07");
					Npc_RemoveInvItems	(hero, ItPl_Beet_Lobart_07, 1);

					Mod_LobartsRuebe07 += 1;

					if (Mod_LobartsRuebe07 == 1)
					{
						randi = Hlp_Random(3);

						if (randi == 0)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_01");
						}
						else if (randi == 1)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_02");
						}
						else if (randi == 2)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_03");
						};
					}
					else if (Mod_LobartsRuebe07 == 2)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE02");
					}
					else if (Mod_LobartsRuebe07 == 4)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE03");
					};
				}
				else
				{
					Npc_RemoveInvItems	(hero, ItPl_Beet_Lobart_07, 1);
					CreateInvItems	(hero, ItPl_Beet, 1);

					randi = Hlp_Random(3);

					if (randi == 0)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_01");
					}
					else if (randi == 1)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_02");
					}
					else if (randi == 2)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_03");
					};

					LobartsRuebe07 = 1;

					Mod_LobartsRuebenCounter += 1;

					Mod_LobartsRuebe07 = 0;
					Mod_LobartsRuebe02 = 0;
					Mod_LobartsRuebe03 = 0;
					Mod_LobartsRuebe04 = 0;
					Mod_LobartsRuebe05 = 0;
					Mod_LobartsRuebe06 = 0;
					Mod_LobartsRuebe07 = 0;
					Mod_LobartsRuebe08 = 0;
					Mod_LobartsRuebe09 = 0;
					Mod_LobartsRuebe10 = 0;
					Mod_LobartsRuebe11 = 0;
					Mod_LobartsRuebe12 = 0;
					Mod_LobartsRuebe13 = 0;
					Mod_LobartsRuebe14 = 0;
					Mod_LobartsRuebe15 = 0;
					Mod_LobartsRuebe16 = 0;
					Mod_LobartsRuebe17 = 0;
					Mod_LobartsRuebe18 = 0;
					Mod_LobartsRuebe19 = 0;
					Mod_LobartsRuebe20 = 0;

					if (Mod_LobartsRuebenCounter < 20)
					{
						B_GetNextRuebe();
					};
				};
			}
			else if (Npc_HasItems(hero, ItPl_Beet_Lobart_08) == 1)
			{
				if (NextRuebe != 8)
				{
					Wld_InsertItem	(ItPl_Beet_Lobart_08, "FP_ITEM_RUEBE_LOBART_08");
					Npc_RemoveInvItems	(hero, ItPl_Beet_Lobart_08, 1);

					Mod_LobartsRuebe08 += 1;

					if (Mod_LobartsRuebe08 == 1)
					{
						randi = Hlp_Random(3);

						if (randi == 0)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_01");
						}
						else if (randi == 1)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_02");
						}
						else if (randi == 2)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_03");
						};
					}
					else if (Mod_LobartsRuebe08 == 2)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE02");
					}
					else if (Mod_LobartsRuebe08 == 4)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE03");
					};
				}
				else
				{
					Npc_RemoveInvItems	(hero, ItPl_Beet_Lobart_08, 1);
					CreateInvItems	(hero, ItPl_Beet, 1);

					randi = Hlp_Random(3);

					if (randi == 0)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_01");
					}
					else if (randi == 1)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_02");
					}
					else if (randi == 2)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_03");
					};

					LobartsRuebe08 = 1;

					Mod_LobartsRuebenCounter += 1;

					Mod_LobartsRuebe08 = 0;
					Mod_LobartsRuebe02 = 0;
					Mod_LobartsRuebe03 = 0;
					Mod_LobartsRuebe04 = 0;
					Mod_LobartsRuebe05 = 0;
					Mod_LobartsRuebe06 = 0;
					Mod_LobartsRuebe07 = 0;
					Mod_LobartsRuebe08 = 0;
					Mod_LobartsRuebe09 = 0;
					Mod_LobartsRuebe10 = 0;
					Mod_LobartsRuebe11 = 0;
					Mod_LobartsRuebe12 = 0;
					Mod_LobartsRuebe13 = 0;
					Mod_LobartsRuebe14 = 0;
					Mod_LobartsRuebe15 = 0;
					Mod_LobartsRuebe16 = 0;
					Mod_LobartsRuebe17 = 0;
					Mod_LobartsRuebe18 = 0;
					Mod_LobartsRuebe19 = 0;
					Mod_LobartsRuebe20 = 0;

					if (Mod_LobartsRuebenCounter < 20)
					{
						B_GetNextRuebe();
					};
				};
			}
			else if (Npc_HasItems(hero, ItPl_Beet_Lobart_09) == 1)
			{
				if (NextRuebe != 9)
				{
					Wld_InsertItem	(ItPl_Beet_Lobart_09, "FP_ITEM_RUEBE_LOBART_09");
					Npc_RemoveInvItems	(hero, ItPl_Beet_Lobart_09, 1);

					Mod_LobartsRuebe09 += 1;

					if (Mod_LobartsRuebe09 == 1)
					{
						randi = Hlp_Random(3);

						if (randi == 0)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_01");
						}
						else if (randi == 1)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_02");
						}
						else if (randi == 2)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_03");
						};
					}
					else if (Mod_LobartsRuebe09 == 2)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE02");
					}
					else if (Mod_LobartsRuebe09 == 4)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE03");
					};
				}
				else
				{
					Npc_RemoveInvItems	(hero, ItPl_Beet_Lobart_09, 1);
					CreateInvItems	(hero, ItPl_Beet, 1);

					randi = Hlp_Random(3);

					if (randi == 0)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_01");
					}
					else if (randi == 1)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_02");
					}
					else if (randi == 2)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_03");
					};

					LobartsRuebe09 = 1;

					Mod_LobartsRuebenCounter += 1;

					Mod_LobartsRuebe09 = 0;
					Mod_LobartsRuebe02 = 0;
					Mod_LobartsRuebe03 = 0;
					Mod_LobartsRuebe04 = 0;
					Mod_LobartsRuebe05 = 0;
					Mod_LobartsRuebe06 = 0;
					Mod_LobartsRuebe07 = 0;
					Mod_LobartsRuebe08 = 0;
					Mod_LobartsRuebe09 = 0;
					Mod_LobartsRuebe10 = 0;
					Mod_LobartsRuebe11 = 0;
					Mod_LobartsRuebe12 = 0;
					Mod_LobartsRuebe13 = 0;
					Mod_LobartsRuebe14 = 0;
					Mod_LobartsRuebe15 = 0;
					Mod_LobartsRuebe16 = 0;
					Mod_LobartsRuebe17 = 0;
					Mod_LobartsRuebe18 = 0;
					Mod_LobartsRuebe19 = 0;
					Mod_LobartsRuebe20 = 0;

					if (Mod_LobartsRuebenCounter < 20)
					{
						B_GetNextRuebe();
					};
				};
			}
			else if (Npc_HasItems(hero, ItPl_Beet_Lobart_10) == 1)
			{
				if (NextRuebe != 10)
				{
					Wld_InsertItem	(ItPl_Beet_Lobart_10, "FP_ITEM_RUEBE_LOBART_10");
					Npc_RemoveInvItems	(hero, ItPl_Beet_Lobart_10, 1);

					Mod_LobartsRuebe10 += 1;

					if (Mod_LobartsRuebe10 == 1)
					{
						randi = Hlp_Random(3);

						if (randi == 0)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_01");
						}
						else if (randi == 1)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_02");
						}
						else if (randi == 2)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_03");
						};
					}
					else if (Mod_LobartsRuebe10 == 2)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE02");
					}
					else if (Mod_LobartsRuebe10 == 4)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE03");
					};
				}
				else
				{
					Npc_RemoveInvItems	(hero, ItPl_Beet_Lobart_10, 1);
					CreateInvItems	(hero, ItPl_Beet, 1);

					randi = Hlp_Random(3);

					if (randi == 0)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_01");
					}
					else if (randi == 1)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_02");
					}
					else if (randi == 2)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_03");
					};

					LobartsRuebe10 = 1;

					Mod_LobartsRuebenCounter += 1;

					Mod_LobartsRuebe10 = 0;
					Mod_LobartsRuebe02 = 0;
					Mod_LobartsRuebe03 = 0;
					Mod_LobartsRuebe04 = 0;
					Mod_LobartsRuebe05 = 0;
					Mod_LobartsRuebe06 = 0;
					Mod_LobartsRuebe07 = 0;
					Mod_LobartsRuebe08 = 0;
					Mod_LobartsRuebe09 = 0;
					Mod_LobartsRuebe10 = 0;
					Mod_LobartsRuebe11 = 0;
					Mod_LobartsRuebe12 = 0;
					Mod_LobartsRuebe13 = 0;
					Mod_LobartsRuebe14 = 0;
					Mod_LobartsRuebe15 = 0;
					Mod_LobartsRuebe16 = 0;
					Mod_LobartsRuebe17 = 0;
					Mod_LobartsRuebe18 = 0;
					Mod_LobartsRuebe19 = 0;
					Mod_LobartsRuebe20 = 0;

					if (Mod_LobartsRuebenCounter < 20)
					{
						B_GetNextRuebe();
					};
				};
			}
			else if (Npc_HasItems(hero, ItPl_Beet_Lobart_11) == 1)
			{
				if (NextRuebe != 11)
				{
					Wld_InsertItem	(ItPl_Beet_Lobart_11, "FP_ITEM_RUEBE_LOBART_11");
					Npc_RemoveInvItems	(hero, ItPl_Beet_Lobart_11, 1);

					Mod_LobartsRuebe11 += 1;

					if (Mod_LobartsRuebe11 == 1)
					{
						randi = Hlp_Random(3);

						if (randi == 0)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_01");
						}
						else if (randi == 1)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_02");
						}
						else if (randi == 2)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_03");
						};
					}
					else if (Mod_LobartsRuebe11 == 2)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE02");
					}
					else if (Mod_LobartsRuebe11 == 4)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE03");
					};
				}
				else
				{
					Npc_RemoveInvItems	(hero, ItPl_Beet_Lobart_11, 1);
					CreateInvItems	(hero, ItPl_Beet, 1);

					randi = Hlp_Random(3);

					if (randi == 0)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_01");
					}
					else if (randi == 1)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_02");
					}
					else if (randi == 2)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_03");
					};

					LobartsRuebe11 = 1;

					Mod_LobartsRuebenCounter += 1;

					Mod_LobartsRuebe11 = 0;
					Mod_LobartsRuebe02 = 0;
					Mod_LobartsRuebe03 = 0;
					Mod_LobartsRuebe04 = 0;
					Mod_LobartsRuebe05 = 0;
					Mod_LobartsRuebe06 = 0;
					Mod_LobartsRuebe07 = 0;
					Mod_LobartsRuebe08 = 0;
					Mod_LobartsRuebe09 = 0;
					Mod_LobartsRuebe10 = 0;
					Mod_LobartsRuebe11 = 0;
					Mod_LobartsRuebe12 = 0;
					Mod_LobartsRuebe13 = 0;
					Mod_LobartsRuebe14 = 0;
					Mod_LobartsRuebe15 = 0;
					Mod_LobartsRuebe16 = 0;
					Mod_LobartsRuebe17 = 0;
					Mod_LobartsRuebe18 = 0;
					Mod_LobartsRuebe19 = 0;
					Mod_LobartsRuebe20 = 0;

					if (Mod_LobartsRuebenCounter < 20)
					{
						B_GetNextRuebe();
					};
				};
			}
			else if (Npc_HasItems(hero, ItPl_Beet_Lobart_12) == 1)
			{
				if (NextRuebe != 12)
				{
					Wld_InsertItem	(ItPl_Beet_Lobart_12, "FP_ITEM_RUEBE_LOBART_12");
					Npc_RemoveInvItems	(hero, ItPl_Beet_Lobart_12, 1);

					Mod_LobartsRuebe12 += 1;

					if (Mod_LobartsRuebe12 == 1)
					{
						randi = Hlp_Random(3);

						if (randi == 0)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_01");
						}
						else if (randi == 1)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_02");
						}
						else if (randi == 2)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_03");
						};
					}
					else if (Mod_LobartsRuebe12 == 2)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE02");
					}
					else if (Mod_LobartsRuebe12 == 4)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE03");
					};
				}
				else
				{
					Npc_RemoveInvItems	(hero, ItPl_Beet_Lobart_12, 1);
					CreateInvItems	(hero, ItPl_Beet, 1);

					randi = Hlp_Random(3);

					if (randi == 0)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_01");
					}
					else if (randi == 1)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_02");
					}
					else if (randi == 2)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_03");
					};

					LobartsRuebe12 = 1;

					Mod_LobartsRuebenCounter += 1;

					Mod_LobartsRuebe12 = 0;
					Mod_LobartsRuebe02 = 0;
					Mod_LobartsRuebe03 = 0;
					Mod_LobartsRuebe04 = 0;
					Mod_LobartsRuebe05 = 0;
					Mod_LobartsRuebe06 = 0;
					Mod_LobartsRuebe07 = 0;
					Mod_LobartsRuebe08 = 0;
					Mod_LobartsRuebe09 = 0;
					Mod_LobartsRuebe10 = 0;
					Mod_LobartsRuebe11 = 0;
					Mod_LobartsRuebe12 = 0;
					Mod_LobartsRuebe13 = 0;
					Mod_LobartsRuebe14 = 0;
					Mod_LobartsRuebe15 = 0;
					Mod_LobartsRuebe16 = 0;
					Mod_LobartsRuebe17 = 0;
					Mod_LobartsRuebe18 = 0;
					Mod_LobartsRuebe19 = 0;
					Mod_LobartsRuebe20 = 0;

					if (Mod_LobartsRuebenCounter < 20)
					{
						B_GetNextRuebe();
					};
				};
			}
			else if (Npc_HasItems(hero, ItPl_Beet_Lobart_13) == 1)
			{
				if (NextRuebe != 13)
				{
					Wld_InsertItem	(ItPl_Beet_Lobart_13, "FP_ITEM_RUEBE_LOBART_13");
					Npc_RemoveInvItems	(hero, ItPl_Beet_Lobart_13, 1);

					Mod_LobartsRuebe13 += 1;

					if (Mod_LobartsRuebe13 == 1)
					{
						randi = Hlp_Random(3);

						if (randi == 0)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_01");
						}
						else if (randi == 1)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_02");
						}
						else if (randi == 2)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_03");
						};
					}
					else if (Mod_LobartsRuebe13 == 2)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE02");
					}
					else if (Mod_LobartsRuebe13 == 4)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE03");
					};
				}
				else
				{
					Npc_RemoveInvItems	(hero, ItPl_Beet_Lobart_13, 1);
					CreateInvItems	(hero, ItPl_Beet, 1);

					randi = Hlp_Random(3);

					if (randi == 0)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_01");
					}
					else if (randi == 1)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_02");
					}
					else if (randi == 2)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_03");
					};

					LobartsRuebe13 = 1;

					Mod_LobartsRuebenCounter += 1;

					Mod_LobartsRuebe13 = 0;
					Mod_LobartsRuebe02 = 0;
					Mod_LobartsRuebe03 = 0;
					Mod_LobartsRuebe04 = 0;
					Mod_LobartsRuebe05 = 0;
					Mod_LobartsRuebe06 = 0;
					Mod_LobartsRuebe07 = 0;
					Mod_LobartsRuebe08 = 0;
					Mod_LobartsRuebe09 = 0;
					Mod_LobartsRuebe10 = 0;
					Mod_LobartsRuebe11 = 0;
					Mod_LobartsRuebe12 = 0;
					Mod_LobartsRuebe13 = 0;
					Mod_LobartsRuebe14 = 0;
					Mod_LobartsRuebe15 = 0;
					Mod_LobartsRuebe16 = 0;
					Mod_LobartsRuebe17 = 0;
					Mod_LobartsRuebe18 = 0;
					Mod_LobartsRuebe19 = 0;
					Mod_LobartsRuebe20 = 0;

					if (Mod_LobartsRuebenCounter < 20)
					{
						B_GetNextRuebe();
					};
				};
			}
			else if (Npc_HasItems(hero, ItPl_Beet_Lobart_14) == 1)
			{
				if (NextRuebe != 14)
				{
					Wld_InsertItem	(ItPl_Beet_Lobart_14, "FP_ITEM_RUEBE_LOBART_14");
					Npc_RemoveInvItems	(hero, ItPl_Beet_Lobart_14, 1);

					Mod_LobartsRuebe14 += 1;

					if (Mod_LobartsRuebe14 == 1)
					{
						randi = Hlp_Random(3);

						if (randi == 0)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_01");
						}
						else if (randi == 1)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_02");
						}
						else if (randi == 2)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_03");
						};
					}
					else if (Mod_LobartsRuebe14 == 2)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE02");
					}
					else if (Mod_LobartsRuebe14 == 4)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE03");
					};
				}
				else
				{
					Npc_RemoveInvItems	(hero, ItPl_Beet_Lobart_14, 1);
					CreateInvItems	(hero, ItPl_Beet, 1);

					randi = Hlp_Random(3);

					if (randi == 0)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_01");
					}
					else if (randi == 1)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_02");
					}
					else if (randi == 2)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_03");
					};

					LobartsRuebe14 = 1;

					Mod_LobartsRuebenCounter += 1;

					Mod_LobartsRuebe14 = 0;
					Mod_LobartsRuebe02 = 0;
					Mod_LobartsRuebe03 = 0;
					Mod_LobartsRuebe04 = 0;
					Mod_LobartsRuebe05 = 0;
					Mod_LobartsRuebe06 = 0;
					Mod_LobartsRuebe07 = 0;
					Mod_LobartsRuebe08 = 0;
					Mod_LobartsRuebe09 = 0;
					Mod_LobartsRuebe10 = 0;
					Mod_LobartsRuebe11 = 0;
					Mod_LobartsRuebe12 = 0;
					Mod_LobartsRuebe13 = 0;
					Mod_LobartsRuebe14 = 0;
					Mod_LobartsRuebe15 = 0;
					Mod_LobartsRuebe16 = 0;
					Mod_LobartsRuebe17 = 0;
					Mod_LobartsRuebe18 = 0;
					Mod_LobartsRuebe19 = 0;
					Mod_LobartsRuebe20 = 0;

					if (Mod_LobartsRuebenCounter < 20)
					{
						B_GetNextRuebe();
					};
				};
			}
			else if (Npc_HasItems(hero, ItPl_Beet_Lobart_15) == 1)
			{
				if (NextRuebe != 15)
				{
					Wld_InsertItem	(ItPl_Beet_Lobart_15, "FP_ITEM_RUEBE_LOBART_15");
					Npc_RemoveInvItems	(hero, ItPl_Beet_Lobart_15, 1);

					Mod_LobartsRuebe15 += 1;

					if (Mod_LobartsRuebe15 == 1)
					{
						randi = Hlp_Random(3);

						if (randi == 0)
						{
						randi = Hlp_Random(3);

						if (randi == 0)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_01");
						}
						else if (randi == 1)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_02");
						}
						else if (randi == 2)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_03");
						};
						}
						else if (randi == 1)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_02");
						}
						else if (randi == 2)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_03");
						};
					}
					else if (Mod_LobartsRuebe15 == 2)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE02");
					}
					else if (Mod_LobartsRuebe15 == 4)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE03");
					};
				}
				else
				{
					Npc_RemoveInvItems	(hero, ItPl_Beet_Lobart_15, 1);
					CreateInvItems	(hero, ItPl_Beet, 1);

					randi = Hlp_Random(3);

					if (randi == 0)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_01");
					}
					else if (randi == 1)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_02");
					}
					else if (randi == 2)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_03");
					};

					LobartsRuebe15 = 1;

					Mod_LobartsRuebenCounter += 1;

					Mod_LobartsRuebe15 = 0;
					Mod_LobartsRuebe02 = 0;
					Mod_LobartsRuebe03 = 0;
					Mod_LobartsRuebe04 = 0;
					Mod_LobartsRuebe05 = 0;
					Mod_LobartsRuebe06 = 0;
					Mod_LobartsRuebe07 = 0;
					Mod_LobartsRuebe08 = 0;
					Mod_LobartsRuebe09 = 0;
					Mod_LobartsRuebe10 = 0;
					Mod_LobartsRuebe11 = 0;
					Mod_LobartsRuebe12 = 0;
					Mod_LobartsRuebe13 = 0;
					Mod_LobartsRuebe14 = 0;
					Mod_LobartsRuebe15 = 0;
					Mod_LobartsRuebe16 = 0;
					Mod_LobartsRuebe17 = 0;
					Mod_LobartsRuebe18 = 0;
					Mod_LobartsRuebe19 = 0;
					Mod_LobartsRuebe20 = 0;

					if (Mod_LobartsRuebenCounter < 20)
					{
						B_GetNextRuebe();
					};
				};
			}
			else if (Npc_HasItems(hero, ItPl_Beet_Lobart_16) == 1)
			{
				if (NextRuebe != 16)
				{
					Wld_InsertItem	(ItPl_Beet_Lobart_16, "FP_ITEM_RUEBE_LOBART_16");
					Npc_RemoveInvItems	(hero, ItPl_Beet_Lobart_16, 1);

					Mod_LobartsRuebe16 += 1;

					if (Mod_LobartsRuebe16 == 1)
					{
						randi = Hlp_Random(3);

						if (randi == 0)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_01");
						}
						else if (randi == 1)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_02");
						}
						else if (randi == 2)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_03");
						};
					}
					else if (Mod_LobartsRuebe16 == 2)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE02");
					}
					else if (Mod_LobartsRuebe16 == 4)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE03");
					};
				}
				else
				{
					Npc_RemoveInvItems	(hero, ItPl_Beet_Lobart_16, 1);
					CreateInvItems	(hero, ItPl_Beet, 1);

					randi = Hlp_Random(3);

					if (randi == 0)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_01");
					}
					else if (randi == 1)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_02");
					}
					else if (randi == 2)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_03");
					};

					LobartsRuebe16 = 1;

					Mod_LobartsRuebenCounter += 1;

					Mod_LobartsRuebe16 = 0;
					Mod_LobartsRuebe02 = 0;
					Mod_LobartsRuebe03 = 0;
					Mod_LobartsRuebe04 = 0;
					Mod_LobartsRuebe05 = 0;
					Mod_LobartsRuebe06 = 0;
					Mod_LobartsRuebe07 = 0;
					Mod_LobartsRuebe08 = 0;
					Mod_LobartsRuebe09 = 0;
					Mod_LobartsRuebe10 = 0;
					Mod_LobartsRuebe11 = 0;
					Mod_LobartsRuebe12 = 0;
					Mod_LobartsRuebe13 = 0;
					Mod_LobartsRuebe14 = 0;
					Mod_LobartsRuebe15 = 0;
					Mod_LobartsRuebe16 = 0;
					Mod_LobartsRuebe17 = 0;
					Mod_LobartsRuebe18 = 0;
					Mod_LobartsRuebe19 = 0;
					Mod_LobartsRuebe20 = 0;

					if (Mod_LobartsRuebenCounter < 20)
					{
						B_GetNextRuebe();
					};
				};
			}
			else if (Npc_HasItems(hero, ItPl_Beet_Lobart_17) == 1)
			{
				if (NextRuebe != 17)
				{
					Wld_InsertItem	(ItPl_Beet_Lobart_17, "FP_ITEM_RUEBE_LOBART_17");
					Npc_RemoveInvItems	(hero, ItPl_Beet_Lobart_17, 1);

					Mod_LobartsRuebe17 += 1;

					if (Mod_LobartsRuebe17 == 1)
					{
						randi = Hlp_Random(3);

						if (randi == 0)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_01");
						}
						else if (randi == 1)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_02");
						}
						else if (randi == 2)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_03");
						};
					}
					else if (Mod_LobartsRuebe17 == 2)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE02");
					}
					else if (Mod_LobartsRuebe17 == 4)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE03");
					};
				}
				else
				{
					Npc_RemoveInvItems	(hero, ItPl_Beet_Lobart_17, 1);
					CreateInvItems	(hero, ItPl_Beet, 1);

					randi = Hlp_Random(3);

					if (randi == 0)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_01");
					}
					else if (randi == 1)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_02");
					}
					else if (randi == 2)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_03");
					};

					LobartsRuebe17 = 1;

					Mod_LobartsRuebenCounter += 1;

					Mod_LobartsRuebe17 = 0;
					Mod_LobartsRuebe02 = 0;
					Mod_LobartsRuebe03 = 0;
					Mod_LobartsRuebe04 = 0;
					Mod_LobartsRuebe05 = 0;
					Mod_LobartsRuebe06 = 0;
					Mod_LobartsRuebe07 = 0;
					Mod_LobartsRuebe08 = 0;
					Mod_LobartsRuebe09 = 0;
					Mod_LobartsRuebe10 = 0;
					Mod_LobartsRuebe11 = 0;
					Mod_LobartsRuebe12 = 0;
					Mod_LobartsRuebe13 = 0;
					Mod_LobartsRuebe14 = 0;
					Mod_LobartsRuebe15 = 0;
					Mod_LobartsRuebe16 = 0;
					Mod_LobartsRuebe17 = 0;
					Mod_LobartsRuebe18 = 0;
					Mod_LobartsRuebe19 = 0;
					Mod_LobartsRuebe20 = 0;

					if (Mod_LobartsRuebenCounter < 20)
					{
						B_GetNextRuebe();
					};
				};
			}
			else if (Npc_HasItems(hero, ItPl_Beet_Lobart_18) == 1)
			{
				if (NextRuebe != 18)
				{
					Wld_InsertItem	(ItPl_Beet_Lobart_18, "FP_ITEM_RUEBE_LOBART_18");
					Npc_RemoveInvItems	(hero, ItPl_Beet_Lobart_18, 1);

					Mod_LobartsRuebe18 += 1;

					if (Mod_LobartsRuebe18 == 1)
					{
						randi = Hlp_Random(3);

						if (randi == 0)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_01");
						}
						else if (randi == 1)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_02");
						}
						else if (randi == 2)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_03");
						};
					}
					else if (Mod_LobartsRuebe18 == 2)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE02");
					}
					else if (Mod_LobartsRuebe18 == 4)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE03");
					};
				}
				else
				{
					Npc_RemoveInvItems	(hero, ItPl_Beet_Lobart_18, 1);
					CreateInvItems	(hero, ItPl_Beet, 1);

					randi = Hlp_Random(3);

					if (randi == 0)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_01");
					}
					else if (randi == 1)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_02");
					}
					else if (randi == 2)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_03");
					};

					LobartsRuebe18 = 1;

					Mod_LobartsRuebenCounter += 1;

					Mod_LobartsRuebe18 = 0;
					Mod_LobartsRuebe02 = 0;
					Mod_LobartsRuebe03 = 0;
					Mod_LobartsRuebe04 = 0;
					Mod_LobartsRuebe05 = 0;
					Mod_LobartsRuebe06 = 0;
					Mod_LobartsRuebe07 = 0;
					Mod_LobartsRuebe08 = 0;
					Mod_LobartsRuebe09 = 0;
					Mod_LobartsRuebe10 = 0;
					Mod_LobartsRuebe11 = 0;
					Mod_LobartsRuebe12 = 0;
					Mod_LobartsRuebe13 = 0;
					Mod_LobartsRuebe14 = 0;
					Mod_LobartsRuebe15 = 0;
					Mod_LobartsRuebe16 = 0;
					Mod_LobartsRuebe17 = 0;
					Mod_LobartsRuebe18 = 0;
					Mod_LobartsRuebe19 = 0;
					Mod_LobartsRuebe20 = 0;

					if (Mod_LobartsRuebenCounter < 20)
					{
						B_GetNextRuebe();
					};
				};
			}
			else if (Npc_HasItems(hero, ItPl_Beet_Lobart_19) == 1)
			{
				if (NextRuebe != 19)
				{
					Wld_InsertItem	(ItPl_Beet_Lobart_19, "FP_ITEM_RUEBE_LOBART_19");
					Npc_RemoveInvItems	(hero, ItPl_Beet_Lobart_19, 1);

					Mod_LobartsRuebe19 += 1;

					if (Mod_LobartsRuebe19 == 1)
					{
						randi = Hlp_Random(3);

						if (randi == 0)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_01");
						}
						else if (randi == 1)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_02");
						}
						else if (randi == 2)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_03");
						};
					}
					else if (Mod_LobartsRuebe19 == 2)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE02");
					}
					else if (Mod_LobartsRuebe19 == 4)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE03");
					};
				}
				else
				{
					Npc_RemoveInvItems	(hero, ItPl_Beet_Lobart_19, 1);
					CreateInvItems	(hero, ItPl_Beet, 1);

					randi = Hlp_Random(3);

					if (randi == 0)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_01");
					}
					else if (randi == 1)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_02");
					}
					else if (randi == 2)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_03");
					};

					LobartsRuebe19 = 1;

					Mod_LobartsRuebenCounter += 1;

					Mod_LobartsRuebe19 = 0;
					Mod_LobartsRuebe02 = 0;
					Mod_LobartsRuebe03 = 0;
					Mod_LobartsRuebe04 = 0;
					Mod_LobartsRuebe05 = 0;
					Mod_LobartsRuebe06 = 0;
					Mod_LobartsRuebe07 = 0;
					Mod_LobartsRuebe08 = 0;
					Mod_LobartsRuebe09 = 0;
					Mod_LobartsRuebe10 = 0;
					Mod_LobartsRuebe11 = 0;
					Mod_LobartsRuebe12 = 0;
					Mod_LobartsRuebe13 = 0;
					Mod_LobartsRuebe14 = 0;
					Mod_LobartsRuebe15 = 0;
					Mod_LobartsRuebe16 = 0;
					Mod_LobartsRuebe17 = 0;
					Mod_LobartsRuebe18 = 0;
					Mod_LobartsRuebe19 = 0;
					Mod_LobartsRuebe20 = 0;

					if (Mod_LobartsRuebenCounter < 20)
					{
						B_GetNextRuebe();
					};
				};
			}
			else if (Npc_HasItems(hero, ItPl_Beet_Lobart_20) == 1)
			{
				if (NextRuebe != 20)
				{
					Wld_InsertItem	(ItPl_Beet_Lobart_20, "FP_ITEM_RUEBE_LOBART_20");
					Npc_RemoveInvItems	(hero, ItPl_Beet_Lobart_20, 1);

					Mod_LobartsRuebe20 += 1;

					if (Mod_LobartsRuebe20 == 1)
					{
						randi = Hlp_Random(3);

						if (randi == 0)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_01");
						}
						else if (randi == 1)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_02");
						}
						else if (randi == 2)
						{
							B_Say_Overlay	(hero, NULL, "$RUEBE01_03");
						};
					}
					else if (Mod_LobartsRuebe20 == 2)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE02");
					}
					else if (Mod_LobartsRuebe20 == 4)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE03");
					};
				}
				else
				{
					Npc_RemoveInvItems	(hero, ItPl_Beet_Lobart_20, 1);
					CreateInvItems	(hero, ItPl_Beet, 1);

					randi = Hlp_Random(3);

					if (randi == 0)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_01");
					}
					else if (randi == 1)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_02");
					}
					else if (randi == 2)
					{
						B_Say_Overlay	(hero, NULL, "$RUEBE04_03");
					};

					LobartsRuebe20 = 1;

					Mod_LobartsRuebenCounter += 1;

					Mod_LobartsRuebe01 = 0;
					Mod_LobartsRuebe02 = 0;
					Mod_LobartsRuebe03 = 0;
					Mod_LobartsRuebe04 = 0;
					Mod_LobartsRuebe05 = 0;
					Mod_LobartsRuebe06 = 0;
					Mod_LobartsRuebe07 = 0;
					Mod_LobartsRuebe08 = 0;
					Mod_LobartsRuebe09 = 0;
					Mod_LobartsRuebe10 = 0;
					Mod_LobartsRuebe11 = 0;
					Mod_LobartsRuebe12 = 0;
					Mod_LobartsRuebe13 = 0;
					Mod_LobartsRuebe14 = 0;
					Mod_LobartsRuebe15 = 0;
					Mod_LobartsRuebe16 = 0;
					Mod_LobartsRuebe17 = 0;
					Mod_LobartsRuebe18 = 0;
					Mod_LobartsRuebe19 = 0;
					Mod_LobartsRuebe20 = 0;

					if (Mod_LobartsRuebenCounter < 20)
					{
						B_GetNextRuebe();
					};
				};
			};

			if (Mod_LobartsRuebenCounter == 20)
			{
				Mod_LobartRuebinator = 2;

				B_LogEntry	(TOPIC_MOD_RUEBENZIEHEN, "Ich habe endlich alle Rüben. Jetzt muss ich sie nur noch bei Lobart abliefern.");

				B_RaiseAttribute_Rest (hero, ATR_STRENGTH, 1);
			};
		};
	};

	if (CurrentLevel == ORCGRAVEYARD_ZEN)
	{
		// NL-Story: Gespräch mit dem Shamanen im Friedhof starten zwecks Fehlern bei anderen Fällen

		if (Mod_NL_UOS == 5)
		&& (B_GetAivar(hero, AIV_INVINCIBLE) == FALSE)
		&& (Hlp_IsValidNpc(Mod_10033_ORC_UndeadShamane_OGY))
		&& (Npc_GetDistToNpc(hero, Mod_10033_ORC_UndeadShamane_OGY) <= 600)
		{
			Npc_SendPassivePerc(hero, PERC_ASSESSTALK, Mod_10033_ORC_UndeadShamane_OGY, Mod_10033_ORC_UndeadShamane_OGY);
		};
	};

	// Rüstungen checken, damit Frau nur Frauenrüstungen und Mann nur Männerrüstungen trägt

	var C_Item CurArmorWomCheck;
	CurArmorWomCheck = Npc_GetEquippedArmor(hero);

	if (Npc_HasEquippedArmor(hero))
	{
		if ((Hlp_IsItem(CurArmorWomCheck, ItAr_Hexe) == TRUE)
		|| (Hlp_IsItem(CurArmorWomCheck, ItAr_VlkBabe_M) == TRUE))
		&& (Mod_TrfWoman == 0)
		{
			AI_UnEquipArmor	(hero);
		}
		else if (Hlp_IsItem(CurArmorWomCheck, ItAr_Hexe) == FALSE)
		&& (Hlp_IsItem(CurArmorWomCheck, ItAr_VlkBabe_M) == FALSE)
		&& (Mod_TrfWoman == 1)
		{
			AI_UnEquipArmor	(hero);
		};
	};

	if (CurrentLevel == MINENTAL_ZEN)
	{
		// Im Minental die Truhen füllen

		if (Mod_MT_TruhenVoll < 183)
		{
			Mod_MT_TruhenVoll += 1;

			if (Mod_MT_TruhenVoll < 10)
			{
				Mod_MT_GiveTruhe = concatStrings("TRUHE_MT_0", IntToString(Mod_MT_TruhenVoll));
			}
			else
			{
				Mod_MT_GiveTruhe = concatStrings("TRUHE_MT_", IntToString(Mod_MT_TruhenVoll));
			};

			B_TruheFuellen (Mod_MT_GiveTruhe);
		};
	};

	// Portalring entfernen

	if (Kapitel > 1)
	&& (Npc_HasItems(hero, ItMi_PortalRing_Addon) > 0)
	{
		Npc_RemoveInvItems	(hero, ItMi_PortalRing_Addon, Npc_HasItems(hero, ItMi_PortalRing_Addon));
	};

	if (CurrentLevel == ADDONWORLD_ZEN)
	{
		if (Mod_Echsis == 2)
		&& (Hlp_IsValidNpc(Mod_12002_DRA_Patroullie_AW))
		&& (!Npc_IsInState(Mod_12002_DRA_Patroullie_AW, ZS_Talk))
		{
			Mod_Echsis = 3;

			AI_Teleport	(hero, "BANDIT_CAMP_ROOF_02");
		};
	};

	Wld_SendTrigger	("SPECIALTRIGGER");
};