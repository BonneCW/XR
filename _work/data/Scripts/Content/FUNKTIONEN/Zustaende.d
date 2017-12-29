var int VergiftetCounter;
var int FliegenpilzCounter;
var C_ITEM CurrentArmor;

FUNC VOID Zustaende()
{
	var int Random;

	var int GiftChance;

	GiftChance = 0;

	var int armor;

	armor = ((hero.protection[PROT_EDGE] + hero.protection[PROT_POINT])/1000) + hero.protection[PROT_FIRE] + hero.protection[PROT_MAGIC];

	armor = armor/4;

	if (KE == 0)
	{
		GiftChance = 100;	// 100 %
	}
	else if (KE == 1)
	{
		GiftChance = 80;	// - 20 %
	}
	else if (KE == 2)
	{
		GiftChance = 60;	// 100 %
	}
	else if (KE == 3)
	{
		GiftChance = 40;	// 100 %
	}
	else if (KE == 4)
	{
		GiftChance = 20;	// 100 %
	};

	if (Npc_HasEquippedArmor(hero))
	&& (Mod_Nackt)
	&& (!playerIsTransformed)
	{
		hero.protection[PROT_EDGE] -= 1000;
		hero.protection[PROT_BLUNT] -= 1000;
		hero.protection[PROT_POINT] -= 1000;

		Mod_Nackt = FALSE;
	};

	if (!Npc_HasEquippedArmor(hero))
	&& (!Mod_Nackt)
	&& (!playerIsTransformed)
	{
		hero.protection[PROT_EDGE] += 1000;
		hero.protection[PROT_BLUNT] += 1000;
		hero.protection[PROT_POINT] += 1000;

		Mod_Nackt = TRUE;
	};

	GiftChance = GiftChance - ((GiftChance*armor)/100);

	// Schwimmt bzw. Taucht der Hero?

	if (C_BodyStateContains(hero, BS_SWIM))
	|| (C_BodyStateContains(hero, BS_DIVE))
	{
		Mod_Schwimmpraxis += 1;

		Mod_SchwimmTauchCounter += 1;

		if (Mod_Schwimmpraxis == 500)
		{
			hero.attribute[ATR_STRENGTH] += 1;

			AI_PrintScreen	("+1 Stärke durch viel Schwimmen", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

			Mod_Schwimmpraxis = 0;
		};

		// Im Eisgebiet führt es zu einer Erkältung

		if (CurrentLevel == EISGEBIET_ZEN)
		&& (Erkaeltung == FALSE)
		&& (Mod_SLD_WaermeRing == 0)
		{
			var C_Item itm; itm = Npc_GetEquippedArmor(hero);
			if (!Hlp_IsValidItem(itm)) {
				Spine_UnlockAchievement(SPINE_ACHIEVEMENT_72);
			};
			if (Eistaucher >= 5)
			{
				Eistaucher = 0;

				if (Hlp_Random(100) < GiftChance)
				{
					Erkaeltung = TRUE;

					HatErstesMalNiesen = FALSE;

					Erkaeltungsdauer = 0;

					// Zeit festlegen

					if (Krankheit == 0)
					{
						Erkaeltung_Stufe01 = 1200;
					}
					else if (Krankheit == 1)
					{
						Erkaeltung_Stufe01 = 1080;
					}
					else if (Krankheit == 2)
					{
						Erkaeltung_Stufe01 = 972;
					}
					else if (Krankheit == 3)
					{
						Erkaeltung_Stufe01 = 874;
					}
					else if (Krankheit == 4)
					{
						Erkaeltung_Stufe01 = 787;
					};

					// Mali festlegen und die Start-Mali gleich abziehen

					if (KE == 0)
					{
						Erkaeltung_Stufe01_HP = 40;
						Erkaeltung_Stufe01_MANA = 20;
						Erkaeltung_Stufe01_STR = 15;
						Erkaeltung_Stufe01_DEX = 15;
					}
					else if (KE == 1)
					{
						Erkaeltung_Stufe01_HP = 32;
						Erkaeltung_Stufe01_MANA = 16;
						Erkaeltung_Stufe01_STR = 12;
						Erkaeltung_Stufe01_DEX = 12;
					}
					else if (KE == 2)
					{
						Erkaeltung_Stufe01_HP = 26;
						Erkaeltung_Stufe01_MANA = 13;
						Erkaeltung_Stufe01_STR = 10;
						Erkaeltung_Stufe01_DEX = 10;
					}
					else if (KE == 3)
					{
						Erkaeltung_Stufe01_HP = 20;
						Erkaeltung_Stufe01_MANA = 10;
						Erkaeltung_Stufe01_STR = 8;
						Erkaeltung_Stufe01_DEX = 8;
					}
					else if (KE == 4)
					{
						Erkaeltung_Stufe01_HP = 16;
						Erkaeltung_Stufe01_MANA = 8;
						Erkaeltung_Stufe01_STR = 6;
						Erkaeltung_Stufe01_DEX = 6;
					};
				};
			};

			Eistaucher += 1;
		};
	};

	// Held ist erkältet

	if (Erkaeltung == TRUE)
	{
		var int Randomizer;

		if (Erkaeltungsdauer == 0)
		{
			AI_PrintScreen	("Ich habe mir eine Erkältung eingefangen", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

			hero.attribute[ATR_HITPOINTS] -= Erkaeltung_Stufe01_HP;
			hero.attribute[ATR_HITPOINTS_MAX] -= Erkaeltung_Stufe01_HP;
			hero.attribute[ATR_MANA] -= Erkaeltung_Stufe01_Mana;
			hero.attribute[ATR_MANA_MAX] -= Erkaeltung_Stufe01_Mana;
			hero.attribute[ATR_STRENGTH] -= Erkaeltung_Stufe01_Str;
			hero.attribute[ATR_DEXTERITY] -= Erkaeltung_Stufe01_Dex;

			hero.aivar[AIV_Damage] -= Erkaeltung_Stufe01_HP;
		};

		if (C_BodyStateContains(hero, BS_STAND))
		|| (C_BodyStateContains(hero, BS_WALK))
		|| (C_BodyStateContains(hero, BS_RUN))
		{
			if (HatErstesMalNiesen == FALSE)
			{
				HatErstesMalNiesen = TRUE;

				AI_StandUp (hero);
	
				Randomizer = Hlp_Random(2);

				if (Randomizer == 1)
				{
					AI_PlayAni	(hero, "T_NIESEN");
				}
				else
				{
					AI_PlayAni	(hero, "T_NIESEN2");
				};
			}
			else
			{
				Randomizer = Hlp_Random(300);

				if (Randomizer == 184)
				{
					AI_StandUp (hero);
	
					AI_PlayAni	(hero, "T_NIESEN");
				}
				else if (Randomizer == 99)
				{
					AI_StandUp (hero);
	
					AI_PlayAni	(hero, "T_NIESEN2");
				};
			};
		};

		if (Erkaeltungsdauer >= Erkaeltung_Stufe01)
		{
			AI_PrintScreen	("Die Erkältung ist vorüber", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

			hero.attribute[ATR_HITPOINTS_MAX] += Erkaeltung_Stufe01_HP;
			hero.attribute[ATR_HITPOINTS] += Erkaeltung_Stufe01_HP;
			hero.attribute[ATR_MANA_MAX] += Erkaeltung_Stufe01_Mana;
			hero.attribute[ATR_MANA] += Erkaeltung_Stufe01_Mana;
			hero.attribute[ATR_STRENGTH] += Erkaeltung_Stufe01_Str;
			hero.attribute[ATR_DEXTERITY] += Erkaeltung_Stufe01_Dex;

			hero.aivar[AIV_Damage] += Erkaeltung_Stufe01_HP;

			Erkaeltung = FALSE;

			Erkaeltungsdauer = 0;

			Eistaucher = 0;

			KErkaeltung += 1;

			if (KErkaeltung == 3)
			|| (KErkaeltung == 10)
			|| (KErkaeltung == 20)
			|| (KErkaeltung == 40)
			{
				KE += 1;

				if (KE == 4)
				{
					PrintScreen	("Du hast die höchste Widerstandkraft gegenüber Hauch der Pestilenz erreicht.", -1, -1, FONT_SCREEN, 2);
				};

				if (Krankheit < 4)
				{
					Krankheit += 1;

					PrintScreen	("Deine Resistenzen gegenüber Erkrankungen sind gestiegen.", -1, -1, FONT_SCREEN, 2);
				};
			};
		};

		Erkaeltungsdauer += 1;
	};

	// Esssystem

	if (Mod_Esssystem == TRUE)
	&& (HeroIsTKeinZombie == TRUE)
	{
		if (Npc_IsInFightMode (hero, FMODE_MELEE))
		|| (Npc_IsInFightMode (hero, FMODE_FIST))
		|| (Npc_IsInFightMode (hero, FMODE_FAR))
		|| (Npc_IsInFightMode (hero, FMODE_MAGIC))
		{
			Mod_NichtsGegessenCounter += 4;
		}
		else if (Npc_IsInFightMode (hero, FMODE_NONE))
		{
			if (C_BodyStateContains(hero, BS_STAND))
			{
				Mod_NichtsGegessenCounter += 1;
			}
			else
			{
				Mod_NichtsGegessenCounter += 2;
			};
		};

		if (Mod_NichtsGegessenCounter >= 20)
		{
			Mod_EssPunkte -= 1;

			Mod_NichtsGegessenCounter = 0;
		};

		//EssBalken();

		if (Mod_EssPunkte == 25)
		&& (Mod_NichtsGegessenCounter == 0)
		{
			AI_PrintScreen	("Puh, langsam krieg' ich Hunger!", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

			AI_StandUp	(hero);

			AI_PlayAni	(hero, "T_HUNGER");
		};

		if (Mod_EssPunkte == 15)
		&& (Mod_NichtsGegessenCounter == 0)
		{
			AI_PrintScreen	("Ich muss jetzt was essen!", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

			AI_StandUp	(hero);

			AI_PlayAni	(hero, "T_HUNGER");
		};

		if (Mod_EssPunkte == 5)
		&& (Mod_NichtsGegessenCounter == 0)
		{
			AI_PrintScreen	("Wenn ich nicht gleich etwas esse, kippe ich um!", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

			AI_StandUp	(hero);

			AI_PlayAni	(hero, "T_HUNGER");
		};

		if (Mod_EssPunkte == 0)
		&& (Mod_NichtsGegessenCounter == 0)
		{
			Wld_PlayEffect("BLACK_SCREEN", hero, hero, 0, 0, 0, TRUE);
			hero.attribute[ATR_HITPOINTS_MAX] -= 10;
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
			PC_Sleep	(8);
			AI_PlayAni (hero,	"T_STAND_2_VICTIM_SLE");
			AI_PlayAni		(hero, "T_VICTIM_SLE_2_STAND" );
			Mod_EssPunkte = 300;

			hero.aivar[AIV_Damage] = hero.attribute[ATR_HITPOINTS_MAX];

			Mod_EssKo += 1;
		};

	};
	
	// Betrunken

	if (Mod_Betrunken == 1)
	&& (NeuBetrunken == 1)
	{
		Mod_OverlayMDS_Wait = 0;
		NeuBetrunken = 0;
		Mdl_RemoveOverlayMDS	(hero, "HUMANS_DRUNKEN.MDS");
	};

	if (Mod_Betrunken == 1)
	&& (!Npc_IsInFightMode(hero, FMODE_NONE))
	{
		AI_RemoveWeapon	(hero);
	};

	Mod_OverlayMDS_Wait += Betrunken_Level;

	if (Mod_OverlayMDS_Wait == 1)
	&& (Mod_Betrunken == 1)
	{
		Mdl_ApplyOverlayMDS	(hero, "HUMANS_DRUNKEN.MDS");
	};

	if (Mod_OverlayMDS_Wait >= 301)
	&& (Mod_Betrunken == 1)
	{
		Mdl_RemoveOverlayMDS	(hero, "HUMANS_DRUNKEN.MDS");
		Mod_Betrunken = 0;
	};

	// Alkohol abbauen

	if (DrinkCounter > 0)
	{
		DrinkCounter -= 1;

		if (DrinkCounter == 0)
		{
			if (HatGetrunken > 0)
			{
				HatGetrunken -= 1;
			};

			DrinkCounter = 120;
		};
	};

	// Vergiftung

	if (HeroIstVergiftet == 1)
	&& (Hero.attribute[ATR_HITPOINTS] > 0)
	{
		VergiftetCounter += 1;

		if (VergiftetCounter == 100)
		{
			hero.attribute[ATR_HITPOINTS] -= 1;

			hero.aivar[AIV_Damage] -= 1;

			VergiftetCounter = 0;
		};
	};

	// Fliegenpilz-Gift

	if (Mod_Fliegenpilzgift == 1)
	&& (Mod_Fliegenpilzgift_Counter < 120)
	{
		Mod_Fliegenpilzgift_Counter += 1;
	};

	if (Mod_Fliegenpilzgift_Counter == 120)
	&& (Mod_Fliegenpilzgift == 1)
	{
		if (Mod_Fliegenpilzgift_MSG == 0)
		{
			Mod_Fliegenpilzgift_MSG = 1;

			PrintScreen ("Das Gift des Pilzes beginnt zu wirken!", -1, YPOS_LevelUp, FONT_Screen, 2);

			if (FliegenpilzGift_FirstTime == 0)
			{
				FliegenpilzGift_FirstTime = 1;

				PrintScreen ("Es gibt sicherlich ein Gegengift bei einem Heiler oder einm Händler ...", -1, YPOS_LevelUp-5, FONT_Screen, 2);
			};
		};
			
		Mod_Fliegenpilzgift = 2;

		if (Pilzgift == 0)
		{
			GGPi_Fliegenpilz_Time = 180;
		}
		else if (Pilzgift == 1)
		{
			GGPi_Fliegenpilz_Time = 135;
		}
		else if (Pilzgift == 2)
		{
			GGPi_Fliegenpilz_Time = 90;
		}
		else if (Pilzgift == 3)
		{
			GGPi_Fliegenpilz_Time = 45;
		};

		if (Gewaechsgift == 0)
		{
			GGPi_Fliegenpilz_Damage = 1000;
		}
		else if (Gewaechsgift == 1)
		{
			GGPi_Fliegenpilz_Damage = 900;
		}
		else if (Gewaechsgift == 2)
		{
			GGPi_Fliegenpilz_Damage = 800;
		}
		else if (Gewaechsgift == 3)
		{
			GGPi_Fliegenpilz_Damage = 700;
		};
	};

	// Gift

	if (Mod_FungoGift == 1)
	&& (Mod_FungoGift_Counter > 0)
	{
		Mod_Fungogift_Counter -= 1;

		if (hero.attribute[ATR_HITPOINTS] > 0)
		{
			hero.attribute[ATR_HITPOINTS] -= 1;

			hero.aivar[AIV_Damage] -= 1;
		};
		if (hero.attribute[ATR_MANA] > 0)
		{
			hero.attribute[ATR_MANA] -= 1;
		};

		if (Mod_FungoGift_Counter == 0)
		{
			Mod_FungoGift = 0;
		};
	};

	if (Mod_MithridaGift == 1)
	&& (Mod_MithridaGift_Counter > 0)
	{
		Mod_MithridaGift_Counter -= 1;

		if (hero.attribute[ATR_HITPOINTS] > 0)
		{
			hero.attribute[ATR_HITPOINTS] -= 2;

			hero.aivar[AIV_Damage] -= 2;
		};

		if (Mod_MithridaGift_Counter == 0)
		{
			Mod_MithridaGift = 0;
		};
	};

	if (Mod_PonzolaGift == 1)
	&& (Mod_PonzolaGift_Counter > 0)
	{
		Mod_Ponzolagift_Counter -= 1;

		if (hero.attribute[ATR_MANA] > 0)
		{
			hero.attribute[ATR_MANA] -= 5;
		};

		if (Mod_PonzolaGift_Counter == 0)
		{
			Mod_PonzolaGift = 0;
		};
	};

	if (Mod_VenenaGift == 1)
	&& (Mod_VenenaGift_Counter > 0)
	{
		Mod_Venenagift_Counter -= 1;

		if (hero.attribute[ATR_HITPOINTS] > 0)
		{
			hero.attribute[ATR_HITPOINTS] -= 5;

			hero.aivar[AIV_Damage] -= 5;
		};

		if (Mod_VenenaGift_Counter == 0)
		{
			Mod_VenenaGift = 0;
		};
	};

	if (Mod_PianteGift == 1)
	&& (Mod_PianteGift_Counter > 0)
	{
		Mod_Piantegift_Counter -= 1;

		if (hero.attribute[ATR_HITPOINTS] > 0)
		{
			hero.attribute[ATR_HITPOINTS] -= 3;

			hero.aivar[AIV_Damage] -= 3;
		};
		if (hero.attribute[ATR_MANA] > 0)
		{
			hero.attribute[ATR_MANA] -= 1;
		};

		if (Mod_PianteGift_Counter == 0)
		{
			Mod_PianteGift = 0;
		};
	};

	

	// Rüstungscheck wegen Eiswelt

	CurrentArmor = Npc_GetEquippedArmor(hero);

	if (!Npc_HasEquippedArmor(hero))
	{
		if (CurrentLevel == EISGEBIET_ZEN)
		&& (Erkaeltung == FALSE)
		&& (!playerIsTransformed)
		{
			if (Eistaucher >= 20)
			{
				Eistaucher = 0;

				if (Hlp_Random(100) < GiftChance)
				{
					Erkaeltung = TRUE;

					HatErstesMalNiesen = FALSE;

					Erkaeltungsdauer = 0;

					// Zeit festlegen

					if (Krankheit == 0)
					{
						Erkaeltung_Stufe01 = 1200;
					}
					else if (Krankheit == 1)
					{
						Erkaeltung_Stufe01 = 1080;
					}
					else if (Krankheit == 2)
					{
						Erkaeltung_Stufe01 = 972;
					}
					else if (Krankheit == 3)
					{
						Erkaeltung_Stufe01 = 874;
					}
					else if (Krankheit == 4)
					{
						Erkaeltung_Stufe01 = 787;
					};

					// Mali festlegen und die Start-Mali gleich abziehen

					if (KE == 0)
					{
						Erkaeltung_Stufe01_HP = 40;
						Erkaeltung_Stufe01_MANA = 20;
						Erkaeltung_Stufe01_STR = 15;
						Erkaeltung_Stufe01_DEX = 15;
					}
					else if (KE == 1)
					{
						Erkaeltung_Stufe01_HP = 32;
						Erkaeltung_Stufe01_MANA = 16;
						Erkaeltung_Stufe01_STR = 12;
						Erkaeltung_Stufe01_DEX = 12;
					}
					else if (KE == 2)
					{
						Erkaeltung_Stufe01_HP = 26;
						Erkaeltung_Stufe01_MANA = 13;
						Erkaeltung_Stufe01_STR = 10;
						Erkaeltung_Stufe01_DEX = 10;
					}
					else if (KE == 3)
					{
						Erkaeltung_Stufe01_HP = 20;
						Erkaeltung_Stufe01_MANA = 10;
						Erkaeltung_Stufe01_STR = 8;
						Erkaeltung_Stufe01_DEX = 8;
					}
					else if (KE == 4)
					{
						Erkaeltung_Stufe01_HP = 16;
						Erkaeltung_Stufe01_MANA = 8;
						Erkaeltung_Stufe01_STR = 6;
						Erkaeltung_Stufe01_DEX = 6;
					};
				};
			};

			Eistaucher += 1;
		};
	};

	// Kontrollerune

	if (Mod_WM_Kontrolled > 0)
	{
		Mod_WM_Kontrolled -= 1;
	};

	// Herkulesstängel

	if (Mod_HasHerkulesIntus > 0)
	{
		Mod_HasHerkulesIntus -= 1;

		if (Mod_HasHerkulesIntus == 0)
		{
			Mdl_RemoveOverlayMDS	(hero, "HUMANS_SPRINT.MDS");

			hero.attribute[ATR_STRENGTH] -= 20;

			Mod_AfterHerkulesIntus = 300;
		};
	};

	if (Mod_AfterHerkulesIntus > 0)
	{
		if (Mod_AfterHerkulesIntus == 300)
		{
			hero.attribute[ATR_HITPOINTS] -= 40;
			hero.attribute[ATR_HITPOINTS_MAX] -= 40;
			hero.attribute[ATR_MANA] -= 20;
			hero.attribute[ATR_MANA_MAX] -= 20;
			hero.attribute[ATR_STRENGTH] -= 15;
			hero.attribute[ATR_DEXTERITY] -= 15;

			hero.aivar[AIV_Damage] -= 40;

			Mdl_RemoveOverlayMDS	(hero, "HUMANS_DRUNKEN.MDS");
		};

		Mod_AfterHerkulesIntus -= 1;

		if (Mod_AfterHerkulesIntus == 0)
		{
			Mdl_RemoveOverlayMDS	(hero, "HUMANS_DRUNKEN.MDS");

			hero.attribute[ATR_HITPOINTS_MAX] += 40;
			hero.attribute[ATR_HITPOINTS] += 40;
			hero.attribute[ATR_MANA_MAX] += 20;
			hero.attribute[ATR_MANA] += 20;
			hero.attribute[ATR_STRENGTH] += 15;
			hero.attribute[ATR_DEXTERITY] += 15;

			hero.aivar[AIV_Damage] += 40;
		};
	};

	// Purpurmond

	if (Mod_Purpurmond_Intus == 1)
	{
		Mod_Purpurmond_Intus_Time -= 1;

		if (Mod_Purpurmond_Intus_Time == 0)
		{
			hero.attribute[ATR_STRENGTH] += 10;
			hero.attribute[ATR_DEXTERITY] += 10;
			hero.attribute[ATR_MANA_MAX] += 10;
			hero.attribute[ATR_MANA] += 10;

			Mod_Purpurmond_Intus = 0;
		};
	};

	// Kristall der Prismen

	if (Mod_KristallPrisma == 0)
	&& (Npc_HasItems(hero, ItMi_KristallPrisma) == 1)
	{
		Mod_KristallPrisma = 1;

		hero.protection[PROT_MAGIC] += 30;
		hero.protection[PROT_FIRE] += 30;
	};

	if (Mod_KristallPrisma == 1)
	&& (Npc_HasItems(hero, ItMi_KristallPrisma) == 0)
	{
		Mod_KristallPrisma = 0;

		hero.protection[PROT_MAGIC] -= 30;
		hero.protection[PROT_FIRE] -= 30;
	};

	// Regenerationstrank

	if (Mod_Regenerationstrank_Counter > 0)
	{
		Mod_Regenerationstrank_Counter -= 1;

		hero.attribute[ATR_HITPOINTS] += hero.attribute[ATR_HITPOINTS_MAX]/50;

		if (hero.attribute[ATR_HITPOINTS] > hero.attribute[ATR_HITPOINTS_MAX])
		{
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		};

		hero.aivar[AIV_Damage] = hero.attribute[ATR_HITPOINTS];

		hero.attribute[ATR_MANA] += hero.attribute[ATR_MANA_MAX]/50;

		if (hero.attribute[ATR_MANA] > hero.attribute[ATR_MANA_MAX])
		{
			hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];
		};
	};
};