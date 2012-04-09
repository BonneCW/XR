FUNC VOID NewMagic()
{
	if (Seele_unterwegs == TRUE)
	{
		if (Npc_GetDistToNpc (PC_seele, hero) > 1800)
		{
			B_KillNpc(hero);
			B_KillNpc(PC_seele);
		};

		PC_Seele.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX];

		if (PC_Seele.attribute[ATR_HITPOINTS] > hero.attribute[ATR_HITPOINTS])
		{
			PC_Seele.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS];
			PC_Seele.aivar[AIV_Damage] = hero.attribute[ATR_HITPOINTS];
		}
		else if (hero.attribute[ATR_HITPOINTS] > PC_Seele.attribute[ATR_HITPOINTS])
		{
			hero.attribute[ATR_HITPOINTS] = PC_Seele.attribute[ATR_HITPOINTS];
			hero.aivar[AIV_Damage] = PC_Seele.attribute[ATR_HITPOINTS];
		};

		PC_Seele.attribute[ATR_MANA_MAX] = hero.attribute[ATR_MANA_MAX];

		if (Npc_IsInFightMode(PC_Seele, FMODE_MAGIC))
		|| (Npc_IsInFightMode(hero, FMODE_MAGIC))
		{
			if (PC_Seele.attribute[ATR_MANA] > hero.attribute[ATR_MANA])
			{
				PC_Seele.attribute[ATR_MANA] = hero.attribute[ATR_MANA];
			}
			else if (hero.attribute[ATR_MANA] > PC_Seele.attribute[ATR_MANA])
			{
				hero.attribute[ATR_MANA] = PC_Seele.attribute[ATR_MANA];
			};
		}
		else
		{
			if (PC_Seele.attribute[ATR_MANA] < hero.attribute[ATR_MANA])
			{
				PC_Seele.attribute[ATR_MANA] = hero.attribute[ATR_MANA];
			}
			else if (hero.attribute[ATR_MANA] < PC_Seele.attribute[ATR_MANA])
			{
				hero.attribute[ATR_MANA] = PC_Seele.attribute[ATR_MANA];
			};
		};
	};

	// Aura des Frostes

	if (Mod_AuraFrost_Counter > 0)
	{
		if (Mod_AuraFrost%5 == 0)
		{
			Wld_PlayEffect("spellFX_BlueGlow",  hero, hero, 0, 0, 0, FALSE );
		};

		if (hero.attribute[ATR_HITPOINTS] > 1)
		{
			hero.attribute[ATR_HITPOINTS] -= 1;

			hero.aivar[AIV_Damage] = hero.attribute[ATR_HITPOINTS];
		};

		if (Mod_AuraFrost_Counter == 1)
		{
			Mod_AuraFrost = 0;
		};

		Mod_AuraFrost_Counter -= 1;
	};

	// Aura des Verbrennens

	if (Mod_AuraFeuer_Counter > 0)
	{
		if (Mod_AuraFeuer%5 == 0)
		{
			Wld_PlayEffect("spellFX_RedGlow",  hero, hero, 0, 0, 0, FALSE );
		};

		if (hero.attribute[ATR_HITPOINTS] > 1)
		{
			hero.attribute[ATR_HITPOINTS] -= 1;

			hero.aivar[AIV_Damage] = hero.attribute[ATR_HITPOINTS];
		};

		if (Mod_AuraFeuer_Counter == 1)
		{
			Mod_AuraFeuer = 0;
		};

		Mod_AuraFeuer_Counter -= 1;
	};

	// Aura der Heilung

	if (Mod_AuraHeilung_Counter > 0)
	{
		hero.attribute[ATR_HITPOINTS] += hero.attribute[ATR_HITPOINTS_MAX]/10;

		if (hero.attribute[ATR_HITPOINTS] > hero.attribute[ATR_HITPOINTS_MAX])
		{
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		};

		hero.aivar[AIV_Damage] = hero.attribute[ATR_HITPOINTS];

		if (CurrentLevel == NEWWORLD_ZEN)
		{
			if (Mod_WM_Iwan == 1)
			&& (Npc_GetDistToWP(hero, "NW_CRYPT_IN_11") < 500)
			{
				Wld_InsertNpc	(Mod_7206_NONE_Iwan_NW, "NW_CRYPT_IN_11");

				Mod_WM_Iwan = 2;
			};
		};

		if (Mod_AuraHeilung_Counter == 1)
		{
			Mod_AuraHeilung = 0;
		};
		Mod_AuraHeilung_Counter -= 1;
	};
};