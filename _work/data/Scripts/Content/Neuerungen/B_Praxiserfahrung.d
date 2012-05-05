FUNC VOID B_Praxiserfahrung(var C_NPC oth, var C_NPC slf)
{
	if (slf.flags == 2)
	|| (slf.aivar[AIV_Partymember] == TRUE)
	{
		return;
	};

	if (Hlp_GetInstanceID(oth) != Hlp_GetInstanceID(PC_Hero))
	{
		return;
	};

	if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(PC_Hero))
	&& (!playerIsTransformed)
	{
		if (Mod_Staerke_Praxis_Next == 0)
		{
			Mod_Staerke_Praxis_Next = 100;
		};

		if (Mod_Geschick_Praxis_Next == 0)
		{
			Mod_Geschick_Praxis_Next = 100;
		};

		if (Mod_Mana_Praxis_Next == 0)
		{
			Mod_Mana_Praxis_Next = 100;
		};

		if (Mod_Einhand_Praxis_Next == 0)
		{
			Mod_Einhand_Praxis_Next = 100;
		};

		if (Mod_Zweihand_Praxis_Next == 0)
		{
			Mod_Zweihand_Praxis_Next = 100;
		};

		if (Mod_Bogen_Praxis_Next == 0)
		{
			Mod_Bogen_Praxis_Next = 100;
		};

		if (Mod_Armbrust_Praxis_Next == 0)
		{
			Mod_Armbrust_Praxis_Next = 100;
		};

		if (Npc_IsInFightMode (hero, FMODE_MELEE))
		{
			if (Mod_Schwierigkeit != 4)
			{
				Mod_Staerke_Praxis += 3;
			}
			else
			{
				Mod_Staerke_Praxis += 6;
				Mod_Geschick_Praxis += 2;
			};

			//PrintScreen	("Nahkampf!", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
		}
		else if (Npc_IsInFightMode (hero, FMODE_FAR))
		{
			if (Mod_Schwierigkeit != 4)
			{
				Mod_Geschick_Praxis += 3;
			}
			else
			{
				Mod_Geschick_Praxis += 6;
				Mod_Staerke_Praxis += 2;
			};

			//PrintScreen	("Fernkampf!", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
		}
		else if (Npc_IsInFightMode (hero, FMODE_MAGIC))
		{
			if (Mod_Schwierigkeit != 4)
			{
				Mod_Mana_Praxis += 3;
			}
			else
			{
				Mod_Mana_Praxis += 6;
			};

			//PrintScreen	("Magiekampf!", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
		}
		else if (Npc_IsInFightMode (hero, FMODE_FIST))
		{
			if (Mod_Schwierigkeit != 4)
			{
				Mod_Staerke_Praxis += 5;
			}
			else
			{
				Mod_Staerke_Praxis += 10;
			};

			//PrintScreen	("Faustkampf!", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
		};
				
		if (Mod_Geschick_Praxis >= Mod_Geschick_Praxis_Next)
		{
			Mod_Geschick_Praxis_Level += 1;

			hero.attribute[ATR_DEXTERITY] += 1;

			AI_PrintScreen	("+1 Geschick durch Praxiserfahrung", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

			Mod_Geschick_Praxis -= Mod_Geschick_Praxis_Next;
			Mod_Geschick_Praxis_Next += 50;
		}
		else if (Mod_Staerke_Praxis >= Mod_Staerke_Praxis_Next)
		{
			Mod_Staerke_Praxis_Level += 1;

			hero.attribute[ATR_STRENGTH] += 1;

			AI_PrintScreen	("+1 Stärke durch Praxiserfahrung", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

			Mod_Staerke_Praxis -= Mod_Staerke_Praxis_Next;
			Mod_Staerke_Praxis_Next += 50;
		}
		else if (Mod_Mana_Praxis >= Mod_Mana_Praxis_Next)
		{
			Mod_Mana_Praxis_Level += 1;

			hero.attribute[ATR_MANA_MAX] += 2;

			AI_PrintScreen	("+2 Mana durch Praxiserfahrung", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

			Mod_Mana_Praxis -= Mod_Mana_Praxis_Next;
			Mod_Mana_Praxis_Next += 50;
		};

		if (Mod_Schwierigkeit == 4)
		{
			var C_Item CW;
			CW = Npc_GetReadiedWeapon(hero);

			if (C_ItmHasFlag(CW, ITEM_SWD))
			|| (C_ItmHasFlag(CW, ITEM_AXE))
			{
				Mod_Einhand_Praxis += 4;
			}
			else if (C_ItmHasFlag(CW, ITEM_2HD_SWD))
			|| (C_ItmHasFlag(CW, ITEM_2HD_AXE))		
			{
				Mod_Zweihand_Praxis += 4;
			}
			else if (C_ItmHasFlag(CW, ITEM_BOW))
			{
				Mod_Bogen_Praxis += 8;
			}
			else if (C_ItmHasFlag(CW, ITEM_CROSSBOW))
			{
				Mod_Armbrust_Praxis += 8;
			};

			if (Mod_Zweihand_Praxis >= Mod_Zweihand_Praxis_Next)
			{
				Mod_Zweihand_Praxis_Level += 1;

				B_RaiseFightTalent(hero, NPC_TALENT_2H, 1);

				AI_PrintScreen	("+1 Zweihand durch Praxiserfahrung", -1, YPOS_ItemGiven+5, FONT_ScreenSmall, 2);

				Mod_Zweihand_Praxis -= Mod_Zweihand_Praxis_Next;
				Mod_Zweihand_Praxis_Next += 50;
			}
			else if (Mod_Einhand_Praxis >= Mod_Einhand_Praxis_Next)
			{
				Mod_Einhand_Praxis_Level += 1;

				B_RaiseFightTalent(hero, NPC_TALENT_1H, 1);

				AI_PrintScreen	("+1 Einhand durch Praxiserfahrung", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

				Mod_Einhand_Praxis -= Mod_Einhand_Praxis_Next;
				Mod_Einhand_Praxis_Next += 50;
			}
			else if (Mod_Bogen_Praxis >= Mod_Bogen_Praxis_Next)
			{
				Mod_Bogen_Praxis_Level += 1;

				B_RaiseFightTalent(hero, NPC_TALENT_BOW, 1);

				AI_PrintScreen	("+1 Bogen durch Praxiserfahrung", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

				Mod_Bogen_Praxis -= Mod_Bogen_Praxis_Next;
				Mod_Bogen_Praxis_Next += 50;
			}
			else if (Mod_Armbrust_Praxis >= Mod_Armbrust_Praxis_Next)
			{
				Mod_Armbrust_Praxis_Level += 1;

				B_RaiseFightTalent(hero, NPC_TALENT_CROSSBOW, 1);

				AI_PrintScreen	("+1 Armbrust durch Praxiserfahrung", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

				Mod_Armbrust_Praxis -= Mod_Armbrust_Praxis_Next;
				Mod_Armbrust_Praxis_Next += 50;
			};
		};
	};
};