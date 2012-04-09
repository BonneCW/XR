FUNC VOID B_Reg_DienerDesBoesen_01(var C_NPC RegNpc)
{
	if (!Npc_IsDead(RegNpc))
	&& (Mod_WM_HexenTot == 0)
	{
		if (RegNpc.attribute[ATR_HITPOINTS] < RegNpc.attribute[ATR_HITPOINTS_MAX])
		{
			RegNpc.attribute[ATR_HITPOINTS] += 1;

			RegNpc.aivar[AIV_Damage] += 1;
		};

		if (Mod_DienerDesBoesen_01_Healer >= 10)
		{
			if ((RegNpc.attribute[ATR_HITPOINTS_MAX] * 3 / 4) > RegNpc.attribute[ATR_HITPOINTS])
			{
				RegNpc.attribute[ATR_HITPOINTS] += 100;

				RegNpc.aivar[AIV_Damage] += 100;

				if (RegNpc.attribute[ATR_HITPOINTS] > RegNpc.attribute[ATR_HITPOINTS_MAX])
				{
					RegNpc.attribute[ATR_HITPOINTS] = RegNpc.attribute[ATR_HITPOINTS_MAX];

					RegNpc.aivar[AIV_Damage] = RegNpc.attribute[ATR_HITPOINTS_MAX];
				};

				Mod_DienerDesBoesen_01_Healer = 0;
			};
		};
	};
};

FUNC VOID B_Reg_DienerDesBoesen_02(var C_NPC RegNpc)
{
	if (!Npc_IsDead(RegNpc))
	&& (Mod_WM_HexenTot == 0)
	{
		if (RegNpc.attribute[ATR_HITPOINTS] < RegNpc.attribute[ATR_HITPOINTS_MAX])
		{
			RegNpc.attribute[ATR_HITPOINTS] += 1;

			RegNpc.aivar[AIV_Damage] += 1;
		};

		if (Mod_DienerDesBoesen_02_Healer >= 10)
		{
			if ((RegNpc.attribute[ATR_HITPOINTS_MAX] * 3 / 4) > RegNpc.attribute[ATR_HITPOINTS])
			{
				RegNpc.attribute[ATR_HITPOINTS] += 100;

				RegNpc.aivar[AIV_Damage] += 100;

				if (RegNpc.attribute[ATR_HITPOINTS] > RegNpc.attribute[ATR_HITPOINTS_MAX])
				{
					RegNpc.attribute[ATR_HITPOINTS] = RegNpc.attribute[ATR_HITPOINTS_MAX];

					RegNpc.aivar[AIV_Damage] = RegNpc.attribute[ATR_HITPOINTS_MAX];
				};

				Mod_DienerDesBoesen_02_Healer = 0;
			};
		};
	};
};

FUNC VOID SpecialGegner()
{
	if (CurrentLevel == MINENTAL_ZEN)
	{
		// Oschust, der Böse

		if (Hlp_IsValidNpc(Mod_7175_BDT_Oschust_MT))
		{
			if (Npc_KnowsInfo(hero, Info_Mod_Oschust_BadOne_You))
			&& (Mod_7175_BDT_Oschust_MT.attribute [ATR_HITPOINTS] < Mod_7175_BDT_Oschust_MT.attribute[ATR_HITPOINTS_MAX])
			&& (!Npc_IsDead(Mod_7175_BDT_Oschust_MT))
			{
				Mod_7175_BDT_Oschust_MT.attribute[ATR_HITPOINTS] += 2;

				Mod_7175_BDT_Oschust_MT.aivar[AIV_Damage] += 2;

				if (Mod_7175_BDT_Oschust_MT.attribute[ATR_HITPOINTS] > Mod_7175_BDT_Oschust_MT.attribute[ATR_HITPOINTS_MAX])
				{
					Mod_7175_BDT_Oschust_MT.attribute[ATR_HITPOINTS] = Mod_7175_BDT_Oschust_MT.attribute[ATR_HITPOINTS_MAX];

					Mod_7175_BDT_Oschust_MT.aivar[AIV_Damage] = Mod_7175_BDT_Oschust_MT.attribute[ATR_HITPOINTS_MAX];
				};
			};
		};
	};

	if (CurrentLevel == NEWWORLD_ZEN)
	{
		// Gigant der Vorzeit

		if (Hlp_IsValidNpc(GigantDerVorzeit))
		{
			if (Mod_WM_Boeden >= 11)
			&& (!Npc_IsDead(GigantDerVorzeit))
			{
				var int SaveGigantHP;
				SaveGigantHP = GigantDerVorzeit.attribute[ATR_HITPOINTS_MAX] - GigantDerVorzeit.attribute[ATR_HITPOINTS];

				if (Mod_WM_BlutkultTot == 1)
				&& (Npc_HasItems(hero, ItMi_AbsorbKristall2) == 1)
				{
					GigantDerVorzeit.attribute[ATR_STRENGTH] = 225;

					if (SaveGigantHP >= 675)
					{
						SaveGigantHP = 0;
					};

					GigantDerVorzeit.attribute[ATR_HITPOINTS] = 675-SaveGigantHP;
					GigantDerVorzeit.attribute[ATR_HITPOINTS_MAX] = 675;
					GigantDerVorzeit.protection[PROT_EDGE] = 62000;
					GigantDerVorzeit.protection[PROT_BLUNT] = 62000;
					GigantDerVorzeit.protection[PROT_MAGIC] = 42;
					GigantDerVorzeit.protection[PROT_FIRE] = 55;
					GigantDerVorzeit.protection[PROT_POINT] = -1;

					GigantDerVorzeit.aivar[AIV_Damage] = 675-SaveGigantHP;
				}
				else if (Mod_WM_BlutkultTot == 1)
				|| (Npc_HasItems(hero, ItMi_AbsorbKristall2) == 1)
				{
					GigantDerVorzeit.attribute[ATR_STRENGTH] = 450;

					if (SaveGigantHP >= 1350)
					{
						SaveGigantHP = 0;
					};

					GigantDerVorzeit.attribute[ATR_HITPOINTS] = 1350-SaveGigantHP;
					GigantDerVorzeit.attribute[ATR_HITPOINTS_MAX] = 1350;
					GigantDerVorzeit.protection[PROT_EDGE] = 125000;
					GigantDerVorzeit.protection[PROT_BLUNT] = 125000;
					GigantDerVorzeit.protection[PROT_MAGIC] = 85;
					GigantDerVorzeit.protection[PROT_FIRE] = 110;
					GigantDerVorzeit.protection[PROT_POINT] = -1;

					GigantDerVorzeit.aivar[AIV_Damage] = 1350-SaveGigantHP;
				}
				else
				{
					GigantDerVorzeit.attribute[ATR_STRENGTH] = 900;

					if (SaveGigantHP >= 2700)
					{
						SaveGigantHP = 0;
					};

					GigantDerVorzeit.attribute[ATR_HITPOINTS_MAX] = 2700;
					GigantDerVorzeit.attribute[ATR_HITPOINTS] = 2700-SaveGigantHP;
					GigantDerVorzeit.protection[PROT_EDGE] = 250000;
					GigantDerVorzeit.protection[PROT_BLUNT] = 250000;
					GigantDerVorzeit.protection[PROT_MAGIC] = 170;
					GigantDerVorzeit.protection[PROT_FIRE] = 220;
					GigantDerVorzeit.protection[PROT_POINT] = -1;

					GigantDerVorzeit.aivar[AIV_Damage] = 2700-SaveGigantHP;
				};
			};
		};

		// Balrog

		if (Hlp_IsValidNpc(Balrog_Plateau))
		{
			if (Mod_WM_Boeden >= 11)
			&& (!Npc_IsDead(Balrog_Plateau))
			{
				var int SaveBalrogHP;
				SaveBalrogHP = Balrog_Plateau.attribute[ATR_HITPOINTS_MAX] - Balrog_Plateau.attribute[ATR_HITPOINTS];

				if (Mod_WM_BlutkultTot == 1)
				&& (Npc_HasItems(hero, ItMi_AbsorbKristall2) == 1)
				{
					Balrog_Plateau.attribute[ATR_STRENGTH] = 150;

					if (SaveBalrogHP >= 450)
					{
						SaveBalrogHP = 0;
					};

					Balrog_Plateau.attribute[ATR_HITPOINTS] = 450-SaveBalrogHP;
					Balrog_Plateau.attribute[ATR_HITPOINTS_MAX] = 450;
					Balrog_Plateau.protection[PROT_EDGE] = 62000;
					Balrog_Plateau.protection[PROT_BLUNT] = 62000;
					Balrog_Plateau.protection[PROT_MAGIC] = 50;
					Balrog_Plateau.protection[PROT_FIRE] = -1;
					Balrog_Plateau.protection[PROT_POINT] = -1;

					Balrog_Plateau.aivar[AIV_Damage] = 450-SaveBalrogHP;
				}
				else if (Mod_WM_BlutkultTot == 1)
				|| (Npc_HasItems(hero, ItMi_AbsorbKristall2) == 1)
				{
					Balrog_Plateau.attribute[ATR_STRENGTH] = 300;

					if (SaveBalrogHP >= 900)
					{
						SaveBalrogHP = 0;
					};

					Balrog_Plateau.attribute[ATR_HITPOINTS] = 900-SaveBalrogHP;
					Balrog_Plateau.attribute[ATR_HITPOINTS_MAX] = 900;
					Balrog_Plateau.protection[PROT_EDGE] = 125000;
					Balrog_Plateau.protection[PROT_BLUNT] = 125000;
					Balrog_Plateau.protection[PROT_MAGIC] = 100;
					Balrog_Plateau.protection[PROT_FIRE] = -1;
					Balrog_Plateau.protection[PROT_POINT] = -1;

					Balrog_Plateau.aivar[AIV_Damage] = 900-SaveBalrogHP;
				}
				else
				{
					Balrog_Plateau.attribute[ATR_STRENGTH] = 600;

					if (SaveBalrogHP >= 1800)
					{
						SaveBalrogHP = 0;
					};

					Balrog_Plateau.attribute[ATR_HITPOINTS_MAX] = 1800;
					Balrog_Plateau.attribute[ATR_HITPOINTS] = 1800-SaveBalrogHP;
					Balrog_Plateau.protection[PROT_EDGE] = 250000;
					Balrog_Plateau.protection[PROT_BLUNT] = 250000;
					Balrog_Plateau.protection[PROT_MAGIC] = 200;
					Balrog_Plateau.protection[PROT_FIRE] = -1;
					Balrog_Plateau.protection[PROT_POINT] = -1;

					Balrog_Plateau.aivar[AIV_Damage] = 1800-SaveBalrogHP;
				};
			};
		};

		// DienerDesBoesen_01

		if (Hlp_IsValidNpc(DienerDesBoesen_01))
		{
			if (Mod_WM_Boeden >= 11)
			&& (!Npc_IsDead(DienerDesBoesen_01))
			{
				var int SaveDienerDesBoesen_01HP;
				SaveDienerDesBoesen_01HP = DienerDesBoesen_01.attribute[ATR_HITPOINTS_MAX] - DienerDesBoesen_01.attribute[ATR_HITPOINTS];

				if (Mod_WM_BlutkultTot == 1)
				&& (Npc_HasItems(hero, ItMi_AbsorbKristall2) == 1)
				{
					DienerDesBoesen_01.attribute[ATR_STRENGTH] = 120;

					if (SaveDienerDesBoesen_01HP >= 125)
					{
						SaveDienerDesBoesen_01HP = 0;
					};

					DienerDesBoesen_01.attribute[ATR_HITPOINTS] = 125-SaveDienerDesBoesen_01HP;
					DienerDesBoesen_01.attribute[ATR_HITPOINTS_MAX] = 125;
					DienerDesBoesen_01.protection[PROT_EDGE] = 25000;
					DienerDesBoesen_01.protection[PROT_BLUNT] = 25000;
					DienerDesBoesen_01.protection[PROT_MAGIC] = 25;
					DienerDesBoesen_01.protection[PROT_FIRE] = 25;
					DienerDesBoesen_01.protection[PROT_POINT] = 37000;

					DienerDesBoesen_01.aivar[AIV_Damage] = 125-SaveDienerDesBoesen_01HP;
				}
				else if (Mod_WM_BlutkultTot == 1)
				|| (Npc_HasItems(hero, ItMi_AbsorbKristall2) == 1)
				{
					DienerDesBoesen_01.attribute[ATR_STRENGTH] = 120;

					if (SaveDienerDesBoesen_01HP >= 250)
					{
						SaveDienerDesBoesen_01HP = 0;
					};

					DienerDesBoesen_01.attribute[ATR_HITPOINTS] = 250-SaveDienerDesBoesen_01HP;
					DienerDesBoesen_01.attribute[ATR_HITPOINTS_MAX] = 250;
					DienerDesBoesen_01.protection[PROT_EDGE] = 50000;
					DienerDesBoesen_01.protection[PROT_BLUNT] = 50000;
					DienerDesBoesen_01.protection[PROT_MAGIC] = 50;
					DienerDesBoesen_01.protection[PROT_FIRE] = 50;
					DienerDesBoesen_01.protection[PROT_POINT] = 75000;

					DienerDesBoesen_01.aivar[AIV_Damage] = 250-SaveDienerDesBoesen_01HP;
				}
				else
				{
					DienerDesBoesen_01.attribute[ATR_STRENGTH] = 120;

					if (SaveDienerDesBoesen_01HP >= 500)
					{
						SaveDienerDesBoesen_01HP = 0;
					};

					DienerDesBoesen_01.attribute[ATR_HITPOINTS_MAX] = 500;
					DienerDesBoesen_01.attribute[ATR_HITPOINTS] = 500-SaveDienerDesBoesen_01HP;
					DienerDesBoesen_01.protection[PROT_EDGE] = 100000;
					DienerDesBoesen_01.protection[PROT_BLUNT] = 100000;
					DienerDesBoesen_01.protection[PROT_MAGIC] = 100;
					DienerDesBoesen_01.protection[PROT_FIRE] = 100;
					DienerDesBoesen_01.protection[PROT_POINT] = 150000;

					DienerDesBoesen_01.aivar[AIV_Damage] = 500-SaveDienerDesBoesen_01HP;
				};

				Mod_DienerDesBoesen_01_Healer += 1;

				B_Reg_DienerDesBoesen_01 (Zombie_DienerDesBoesen_01_01);
				B_Reg_DienerDesBoesen_01 (Zombie_DienerDesBoesen_01_02);
				B_Reg_DienerDesBoesen_01 (Zombie_DienerDesBoesen_01_03);
				B_Reg_DienerDesBoesen_01 (Zombie_DienerDesBoesen_01_04);
				B_Reg_DienerDesBoesen_01 (Zombie_DienerDesBoesen_01_05);
				B_Reg_DienerDesBoesen_01 (Zombie_DienerDesBoesen_01_06);
				B_Reg_DienerDesBoesen_01 (Zombie_DienerDesBoesen_01_07);
				B_Reg_DienerDesBoesen_01 (Zombie_DienerDesBoesen_01_08);
				B_Reg_DienerDesBoesen_01 (Zombie_DienerDesBoesen_01_09);
				B_Reg_DienerDesBoesen_01 (Zombie_DienerDesBoesen_01_10);
				B_Reg_DienerDesBoesen_01 (Zombie_DienerDesBoesen_01_11);
				B_Reg_DienerDesBoesen_01 (Zombie_DienerDesBoesen_01_12);
				B_Reg_DienerDesBoesen_01 (Skeleton_DienerDesBoesen_01_01);
				B_Reg_DienerDesBoesen_01 (Skeleton_DienerDesBoesen_01_02);
				B_Reg_DienerDesBoesen_01 (Skeleton_DienerDesBoesen_01_03);
				B_Reg_DienerDesBoesen_01 (Skeleton_DienerDesBoesen_01_04);
				B_Reg_DienerDesBoesen_01 (Skeleton_DienerDesBoesen_01_05);
				B_Reg_DienerDesBoesen_01 (Skeleton_DienerDesBoesen_01_06);
				B_Reg_DienerDesBoesen_01 (SkeletonMage_DienerDesBoesen_01_01);
				B_Reg_DienerDesBoesen_01 (SkeletonMage_DienerDesBoesen_01_02);
				B_Reg_DienerDesBoesen_01 (Skeleton_Lord_DienerDesBoesen_01_01);
				B_Reg_DienerDesBoesen_01 (Skeleton_Lord_DienerDesBoesen_01_02);
			};
		};

		// DienerDesBoesen_02

		if (Hlp_IsValidNpc(DienerDesBoesen_02))
		{
			if (Mod_WM_Boeden >= 11)
			&& (!Npc_IsDead(DienerDesBoesen_02))
			{
				var int SaveDienerDesBoesen_02HP;
				SaveDienerDesBoesen_02HP = DienerDesBoesen_02.attribute[ATR_HITPOINTS_MAX] - DienerDesBoesen_02.attribute[ATR_HITPOINTS];

				if (Mod_WM_BlutkultTot == 1)
				&& (Npc_HasItems(hero, ItMi_AbsorbKristall2) == 1)
				{
					DienerDesBoesen_02.attribute[ATR_STRENGTH] = 120;

					if (SaveDienerDesBoesen_02HP >= 125)
					{
						SaveDienerDesBoesen_02HP = 0;
					};

					DienerDesBoesen_02.attribute[ATR_HITPOINTS] = 125-SaveDienerDesBoesen_02HP;
					DienerDesBoesen_02.attribute[ATR_HITPOINTS_MAX] = 125;
					DienerDesBoesen_02.protection[PROT_EDGE] = 25000;
					DienerDesBoesen_02.protection[PROT_BLUNT] = 25000;
					DienerDesBoesen_02.protection[PROT_MAGIC] = 25;
					DienerDesBoesen_02.protection[PROT_FIRE] = 25;
					DienerDesBoesen_02.protection[PROT_POINT] = 37000;

					DienerDesBoesen_02.aivar[AIV_Damage] = 125-SaveDienerDesBoesen_02HP;
				}
				else if (Mod_WM_BlutkultTot == 1)
				|| (Npc_HasItems(hero, ItMi_AbsorbKristall2) == 1)
				{
					DienerDesBoesen_02.attribute[ATR_STRENGTH] = 120;

					if (SaveDienerDesBoesen_02HP >= 250)
					{
						SaveDienerDesBoesen_02HP = 0;
					};

					DienerDesBoesen_02.attribute[ATR_HITPOINTS] = 250-SaveDienerDesBoesen_02HP;
					DienerDesBoesen_02.attribute[ATR_HITPOINTS_MAX] = 250;
					DienerDesBoesen_02.protection[PROT_EDGE] = 50000;
					DienerDesBoesen_02.protection[PROT_BLUNT] = 50000;
					DienerDesBoesen_02.protection[PROT_MAGIC] = 50;
					DienerDesBoesen_02.protection[PROT_FIRE] = 50;
					DienerDesBoesen_02.protection[PROT_POINT] = 75000;

					DienerDesBoesen_02.aivar[AIV_Damage] = 250-SaveDienerDesBoesen_02HP;
				}
				else
				{
					DienerDesBoesen_02.attribute[ATR_STRENGTH] = 120;

					if (SaveDienerDesBoesen_02HP >= 500)
					{
						SaveDienerDesBoesen_02HP = 0;
					};

					DienerDesBoesen_02.attribute[ATR_HITPOINTS_MAX] = 500;
					DienerDesBoesen_02.attribute[ATR_HITPOINTS] = 500-SaveDienerDesBoesen_02HP;
					DienerDesBoesen_02.protection[PROT_EDGE] = 100000;
					DienerDesBoesen_02.protection[PROT_BLUNT] = 100000;
					DienerDesBoesen_02.protection[PROT_MAGIC] = 100;
					DienerDesBoesen_02.protection[PROT_FIRE] = 100;
					DienerDesBoesen_02.protection[PROT_POINT] = 150000;

					DienerDesBoesen_02.aivar[AIV_Damage] = 500-SaveDienerDesBoesen_02HP;
				};

				Mod_DienerDesBoesen_02_Healer += 1;

				B_Reg_DienerDesBoesen_02 (Zombie_DienerDesBoesen_02_01);
				B_Reg_DienerDesBoesen_02 (Zombie_DienerDesBoesen_02_02);
				B_Reg_DienerDesBoesen_02 (Zombie_DienerDesBoesen_02_03);
				B_Reg_DienerDesBoesen_02 (Zombie_DienerDesBoesen_02_04);
				B_Reg_DienerDesBoesen_02 (Zombie_DienerDesBoesen_02_05);
				B_Reg_DienerDesBoesen_02 (Zombie_DienerDesBoesen_02_06);
				B_Reg_DienerDesBoesen_02 (Zombie_DienerDesBoesen_02_07);
				B_Reg_DienerDesBoesen_02 (Zombie_DienerDesBoesen_02_08);
				B_Reg_DienerDesBoesen_02 (Zombie_DienerDesBoesen_02_09);
				B_Reg_DienerDesBoesen_02 (Zombie_DienerDesBoesen_02_10);
				B_Reg_DienerDesBoesen_02 (Zombie_DienerDesBoesen_02_11);
				B_Reg_DienerDesBoesen_02 (Zombie_DienerDesBoesen_02_12);
				B_Reg_DienerDesBoesen_02 (Skeleton_DienerDesBoesen_02_01);
				B_Reg_DienerDesBoesen_02 (Skeleton_DienerDesBoesen_02_02);
				B_Reg_DienerDesBoesen_02 (Skeleton_DienerDesBoesen_02_03);
				B_Reg_DienerDesBoesen_02 (Skeleton_DienerDesBoesen_02_04);
				B_Reg_DienerDesBoesen_02 (Skeleton_DienerDesBoesen_02_05);
				B_Reg_DienerDesBoesen_02 (Skeleton_DienerDesBoesen_02_06);
				B_Reg_DienerDesBoesen_02 (SkeletonMage_DienerDesBoesen_02_01);
				B_Reg_DienerDesBoesen_02 (SkeletonMage_DienerDesBoesen_02_02);
				B_Reg_DienerDesBoesen_02 (Skeleton_Lord_DienerDesBoesen_02_01);
				B_Reg_DienerDesBoesen_02 (Skeleton_Lord_DienerDesBoesen_02_02);
			};
		};

		// Blutgolem

		if (Hlp_IsValidNpc(Blutgolem))
		{
			if (!Npc_IsDead(Blutgolem))
			&& (!Npc_IsDead(hero))
			{
				Blutgolem.attribute[ATR_HITPOINTS] += 5;
				hero.attribute[ATR_HITPOINTS] -= 5;

				Blutgolem.aivar[AIV_Damage] += 5;
				hero.aivar[AIV_Damage] -= 5;

				if (Blutgolem.attribute[ATR_HITPOINTS] > Blutgolem.attribute[ATR_HITPOINTS_MAX])
				{
					Blutgolem.attribute[ATR_HITPOINTS] = Blutgolem.attribute[ATR_HITPOINTS_MAX];

					Blutgolem.aivar[AIV_Damage] = Blutgolem.attribute[ATR_HITPOINTS_MAX];
				};
			};
		};
	};

	if (CurrentLevel == ADDONWORLD_ZEN)
	{
		if (Hlp_IsValidNpc(Blutgolem_02))
		{
			if (!Npc_IsDead(Blutgolem_02))
			&& (!Npc_IsDead(hero))
			{
				Blutgolem_02.attribute[ATR_HITPOINTS] += 5;
				hero.attribute[ATR_HITPOINTS] -= 5;

				Blutgolem_02.aivar[AIV_Damage] += 5;
				hero.aivar[AIV_Damage] -= 5;

				if (Blutgolem_02.attribute[ATR_HITPOINTS] > Blutgolem_02.attribute[ATR_HITPOINTS_MAX])
				{
					Blutgolem_02.attribute[ATR_HITPOINTS] = Blutgolem_02.attribute[ATR_HITPOINTS_MAX];

					Blutgolem_02.aivar[AIV_Damage] = Blutgolem_02.attribute[ATR_HITPOINTS_MAX];
				};
			};
		};

		if (Hlp_IsValidNpc(Blutgolem_03))
		{
			if (!Npc_IsDead(Blutgolem_03))
			&& (!Npc_IsDead(hero))
			{
				Blutgolem_03.attribute[ATR_HITPOINTS] += 5;
				hero.attribute[ATR_HITPOINTS] -= 5;

				Blutgolem_03.aivar[AIV_Damage] += 5;
				hero.aivar[AIV_Damage] -= 5;

				if (Blutgolem_03.attribute[ATR_HITPOINTS] > Blutgolem_03.attribute[ATR_HITPOINTS_MAX])
				{
					Blutgolem_03.attribute[ATR_HITPOINTS] = Blutgolem_03.attribute[ATR_HITPOINTS_MAX];

					Blutgolem_03.aivar[AIV_Damage] = Blutgolem_03.attribute[ATR_HITPOINTS_MAX];
				};
			};
		};
	};

	if (CurrentLevel == EISGEBIET_ZEN)
	{
		if (Hlp_IsValidNpc(Monster_11068_Eisriese_EIS))
		{
			if (!Npc_IsDead(Monster_11068_Eisriese_EIS))
			&& (!Npc_IsDead(hero))
			{
				//if (Npc_GetDistToNpc(hero, Monster_11068_Eisriese_EIS) < 2000) // lieber WP, sonst evtl. auch an anderen Stellen
				if (Npc_GetDistToWP(hero, "EISRIESE_01") < 2000)
				{
					if (Mod_SLD_WaermeRing == 0)
					&& (Mod_GuertelDerBewaehrung == 0)
					{
						Npc_ClearAIQueue	(hero);
						B_ClearPerceptions	(hero);
						AI_StartState		(hero, ZS_MagicFreeze, 0, "");
						Wld_PlayEffect	("spellFX_Freeze", hero, hero, 0, 0, 0, FALSE);
					};
				}
				else if (Npc_GetDistToWP(hero, "EISRIESE_01") < 4000)
				{
					Autosave_Counter = Mod_Autosave*600;
				};
			};
		};
	};
};