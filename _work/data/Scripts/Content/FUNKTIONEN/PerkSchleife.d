var int SlowmotionCooldown;
var int AusdauerCooldown;

FUNC VOID PerkSchleife()
{
	// Dummheit
	
	if (Betrunken_Level >= 4)
	&& (Dummheit_Perk == FALSE)
	{
		Dummheit_Perk = TRUE;

		PrintScreen	("Durch übermäßigen Alkoholkonsum bist du abhängig und dumm geworden", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
	};

	if (Dummheit_Perk == TRUE)
	{
		DrinkTime += 1;

		if (DrinkTime == 100)
		{
			PrintScreen	("Du brauchst dringend Alkohol!", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
		};

		if ((DrinkTime - 120) > DrinkTimeLast)
		&& (DrinkTime < 600)
		{
			hero.attribute[ATR_HITPOINTS] -= 5;

			hero.aivar[AIV_Damage] -= 5;
		};

		if (DrinkTime == 600)
		{
			//DrinkTime = 0;
			//DrinkTimeLast = 0;

			PrintScreen	("Du hast deine Sucht überwunden!", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

			HatNichtsMehrGetrunken = TRUE;

			DrinkLastTime_Day = Wld_GetDay();
		};

		if ((DrinkLastTime_Day + 3) < Wld_GetDay())
		&& (DrinkTime > 600)
		&& (HatNichtsMehrGetrunken == TRUE)
		{
			PrintScreen	("Du bist nun endgültig geheilt!", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

			Dummheit_Perk = FALSE;

			Betrunken_Level = 0;

			B_GivePlayerXP	(250);
		};
	};

	// Ewige Nacht

	if (EwigeNacht_Perk == TRUE)
	{
		if (IstNacht == FALSE)
		&& (Wld_IsTime(06,00,20,00))
		{
			Wld_SetTime	(20,00);

			PrintScreen ("Durch den Perk wird es Nacht", -1, YPOS_LevelUp, FONT_Screen, 2);

			Wld_PlayEffect("BLACK_SCREEN", hero, hero, 0, 0, 0, TRUE);

			IstNacht = TRUE;
		};

		if (Wld_IsTime(05,30,06,00))
		&& (IstNacht == TRUE)
		{
			Wld_SetTime	(20,00);

			PrintScreen ("Durch den Perk bleibt es Nacht", -1, YPOS_LevelUp, FONT_Screen, 2);

			Wld_PlayEffect("BLACK_SCREEN", hero, hero, 0, 0, 0, TRUE);
		};
	};

	// Slowmotion

	if (Slowmotion_Perk == TRUE)
	{
		SlowMotion();

		SlowMotionCooldown += 1;

		if (BT_on == TRUE)
		{

			if (SlowmotionCooldown >= 10)
			{
				Slowmotiontime -= 1;

				if (Slowmotiontime < 0)
				{
					Slowmotiontime = 0;
				};

				if (Slowmotiontime == 0)
				{
					Wld_StopEffect("SLOW_MOTION_1");
					Wld_StopEffect("SLOW_MOTION_2");
					Wld_StopEffect("SLOW_MOTION_3");
					Wld_StopEffect("SLOW_MOTION_4");
					Wld_StopEffect("SLOW_MOTION_5");
					Wld_StopEffect("SLOW_MOTION_6");

					BT_on = FALSE;
				};

				SlowmotionCooldown = 0;
			};
		}
		else
		{
			if (SlowmotionCooldown >= 30)
			{
				if (Slowmotiontime < Slowmotiontime_Max)
				{
					SlowMotionTime += 1;
				};

				if (Slowmotiontime > Slowmotiontime_Max)
				{
					Slowmotiontime = Slowmotiontime_MAX;
				};

				SlowmotionCooldown = 0;
			};
		};
	};

	// Sprinten

	if (Sprinten_Perk == TRUE)
	{
		Ausdauerbalken();

		AusdauerCooldown += 1;

		if (Sprintet_Gerade == TRUE)
		{
			if (AusdauerCooldown >= 10)
			{
				Sprint_Ausdauer -= 1;

				if (Sprint_Ausdauer < 0)
				{
					Sprint_Ausdauer = 0;
				};

				if (Sprint_Ausdauer == 0)
				{
					Mdl_RemoveOverlayMDS (hero, "HUMANS_FLEE.MDS");

					Sprintet_Gerade = FALSE;
				};

				AusdauerCooldown = 0;
			};
		}
		else
		{
			if (AusdauerCooldown >= 30)
			{
				if (Sprint_Ausdauer < Sprint_Ausdauer_MAX)
				{
					Sprint_Ausdauer += 1;
				};

				if (Sprint_Ausdauer > Sprint_Ausdauer_MAX)
				{
					Sprint_Ausdauer = Sprint_Ausdauer_MAX;
				};

				AusdauerCooldown = 0;
			};
		};
	};

	// Regenerationen

	if (HP_Perk == TRUE)
	&& (hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	&& (!Npc_IsDead(hero))
	{
		HP_Reg = ((hero.attribute[ATR_STRENGTH]+hero.attribute[ATR_DEXTERITY])*hero.level);

		HP_Reg = HP_Reg / 2000;

		if (HP_Reg < 1)
		{
			HP_Reg = 1;
		};

		hero.attribute[ATR_HITPOINTS] += HP_Reg;

		hero.aivar[AIV_Damage] = hero.attribute[ATR_HITPOINTS];

		if (hero.attribute[ATR_HITPOINTS] > hero.attribute[ATR_HITPOINTS_MAX])
		{
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];

			hero.aivar[AIV_Damage] = hero.attribute[ATR_HITPOINTS_MAX];
		};
	};

	if (Mana_Perk == TRUE)
	&& (hero.attribute[ATR_MANA] < hero.attribute[ATR_MANA_MAX])
	{
		Mana_Reg = hero.attribute[ATR_MANA_MAX]*((hero.level));

		Mana_Reg = Mana_Reg / 2000;

		if (Mana_Reg < 1)
		{
			Mana_Reg = 1;
		};

		hero.attribute[ATR_MANA] += Mana_Reg;

		if (hero.attribute[ATR_MANA] > hero.attribute[ATR_MANA_MAX])
		{
			hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];
		};
	};

	// Verwandlung Frau

	if (Mod_TrfWoman == 1)
	{
		Mod_TrfWoman_Time -= 1;

		if (Mod_TrfWoman_Time == 0)
		{
			Mod_TrfWoman = 0;

			hero.attribute[ATR_STRENGTH] += 15;
			hero.attribute[ATR_DEXTERITY] -= 20;
			hero.attribute[ATR_HITPOINTS] += 40;
			hero.attribute[ATR_HITPOINTS_MAX] += 40;

			hero.aivar[AIV_Damage] += 40;

			AI_UnequipArmor	(hero);

			Mdl_SetVisual (hero,"HUMANS.MDS");
			// ------ Visual ------ "body_Mesh",		bodyTex			SkinColor	headMesh,			faceTex,		teethTex,	armorInstance	
			Mdl_SetVisualBody (hero, "hum_body_naked0", 1,				0,			"Hum_Head_Fighter", 	FACE_N_Player,	0, 			NO_Armor);

			Mdl_RemoveOverlayMDS	(hero, "HUMANS_BABE.MDS");
		};
	};

	// Verwandlung Halbinfernalischer

	if (Mod_HeroIstDemon == TRUE)
	{
		Mod_HeroDemonCounter -= 1;

		if (Mod_HeroDemonCounter <= 0)
		{
			Mod_HeroIstDemon = FALSE;

			hero.attribute[ATR_STRENGTH] -= 100;
			hero.attribute[ATR_DEXTERITY] += 70;
			hero.attribute[ATR_HITPOINTS] -= 400;
			hero.attribute[ATR_HITPOINTS_MAX] -= 400;

			hero.aivar[AIV_Damage] -= 400;

			hero.protection[PROT_EDGE] -= 100000;
			hero.protection[PROT_BLUNT] -= 100000;
			hero.protection[PROT_POINT] -= 100000;
			hero.protection[PROT_FIRE] -= 100;
			hero.protection[PROT_MAGIC] -= 100;

			hero.damagetype = DAM_BLUNT;

			AI_UnequipArmor	(hero);

			Wld_StopEffect	("INFERNALFIRE");

			Mdl_SetVisual (hero,"HUMANS.MDS");
			// ------ Visual ------ "body_Mesh",		bodyTex			SkinColor	headMesh,			faceTex,		teethTex,	armorInstance	
			Mdl_SetVisualBody (hero, "hum_body_naked0", 1,				0,			"Hum_Head_Fighter", 	FACE_N_Player,	0, 			NO_Armor);
		};
	};

	// Verwandlung Skelett

	if (Mod_TrfSkeleton2 == 1)
	{
		Mod_TrfSkeleton2_Time -= 1;

		if (Mod_TrfSkeleton2_Time == 0)
		{
			Mod_TrfSkeleton2 = 0;

			AI_UnequipArmor	(hero);

			Mdl_SetVisualBody (hero, "hum_body_naked0", 1,				0,			"Hum_Head_Fighter", 	FACE_N_Player,	0, 			NO_Armor);

			if (Mod_Gilde == 1)
			|| (Mod_Gilde == 2)
			|| (Mod_Gilde == 3)
			{
				hero.guild = GIL_PAL;
			}
			else if (Mod_Gilde == 4)
			|| (Mod_Gilde == 5)
			|| (Mod_Gilde == 19)
			{
				hero.guild = GIL_MIL;
			}
			else if (Mod_Gilde == 6)
			|| (Mod_Gilde == 7)
			|| (Mod_Gilde == 8)
			{
				hero.guild = GIL_VLK;
			}
			else if (Mod_Gilde == 9)
			|| (Mod_Gilde == 10)
			|| (Mod_Gilde == 11)
			|| (Mod_Gilde == 17)
			|| (Mod_Gilde == 18)
			{
				hero.guild = GIL_NOV;
			}
			else if (Mod_Gilde == 12)
			|| (Mod_Gilde == 13)
			|| (Mod_Gilde == 14)
			|| (Mod_Gilde == 15)
			|| (Mod_Gilde == 16)
			{
				hero.guild = GIL_KDF;
			};

			playerIsTransformed = FALSE;
		};
	};

	if (Mod_FolgsamkeitSnapper_Intus == TRUE)
	{
		Mod_FolgsamkeitSnapper_Time -= 1;

		if (Mod_FolgsamkeitSnapper_Time == 0)
		{
			hero.attribute[ATR_STRENGTH] -= 20;
			hero.attribute[ATR_DEXTERITY] -= 20;

			hero.protection[PROT_EDGE] -= 30000;
			hero.protection[PROT_BLUNT] -= 30000;
			hero.protection[PROT_POINT] -= 30000;
			hero.protection[PROT_MAGIC] -= 30;
			hero.protection[PROT_FIRE] -= 30;

			AI_UnequipArmor	(hero);

			Mdl_SetVisualBody (hero, "hum_body_naked0", 1,				0,			"Hum_Head_Fighter", 	FACE_N_Player,	0, 			NO_Armor);

			if (Mod_Gilde == 1)
			|| (Mod_Gilde == 2)
			|| (Mod_Gilde == 3)
			{
				hero.guild = GIL_PAL;
			}
			else if (Mod_Gilde == 4)
			|| (Mod_Gilde == 5)
			|| (Mod_Gilde == 19)
			{
				hero.guild = GIL_MIL;
			}
			else if (Mod_Gilde == 6)
			|| (Mod_Gilde == 7)
			|| (Mod_Gilde == 8)
			{
				hero.guild = GIL_VLK;
			}
			else if (Mod_Gilde == 9)
			|| (Mod_Gilde == 10)
			|| (Mod_Gilde == 11)
			|| (Mod_Gilde == 17)
			|| (Mod_Gilde == 18)
			{
				hero.guild = GIL_NOV;
			}
			else if (Mod_Gilde == 12)
			|| (Mod_Gilde == 13)
			|| (Mod_Gilde == 14)
			|| (Mod_Gilde == 15)
			|| (Mod_Gilde == 16)
			{
				hero.guild = GIL_KDF;
			};

			Mod_FolgsamkeitSnapper_Intus = FALSE;
		};
	};

	// Ring der Verschleierung

	if (Mod_Verschleierung == 1)
	&& (Unsichtbarkeitsperk == TRUE)
	{
		Npc_ChangeAttribute(hero, ATR_MANA, hero.attribute[ATR_MANA_MAX]/20);

		if (hero.attribute[ATR_MANA] < 5)
		{
			Mod_Verschleierung = 0;

			hero.flags = 0;

			Unsichtbarkeitsperk = FALSE;

			AI_Teleport	(hero, "PC_HERO");
		};
	};

	if (Mod_Dornenguertel)
	{
		if (TimeCounter_Real%4 == 0)
		{
			B_MagicHurtNpc	(hero, hero, 1);
		};
	};

	if (Mod_HeilungRing)
	{
		if (hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
		{
			hero.attribute[ATR_HITPOINTS] += 1;
			hero.aivar[AIV_Damage] = hero.attribute[ATR_HITPOINTS];
		};
	};

	if (Mod_WillenskraftRing)
	{
		if (hero.attribute[ATR_MANA] < hero.attribute[ATR_MANA_MAX])
		{
			hero.attribute[ATR_MANA] += 1;
		};
	};

	// Kampfperks

	Kampfperks();

};