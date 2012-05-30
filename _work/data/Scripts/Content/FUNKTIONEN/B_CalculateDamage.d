FUNC VOID B_CalculateDamage (var C_NPC opfer, var C_NPC taeter)
{
	if (!Hlp_IsValidNpc(opfer))
	{
		return;
	};

	if (!Hlp_IsValidNpc(taeter))
	{
		return;
	};

	var int damage;
	damage = 0;

	var int armor;
	armor = 0;

	var int critChance;
	critChance = 0;

	var int damageType;
	damageType = 0;

	var C_ITEM rwp;

	if ((taeter.guild < GIL_SEPERATOR_HUM)
	|| (taeter.guild == GIL_SKELETON)
	|| (taeter.guild == GIL_ORC)
	|| (taeter.guild == GIL_SUMMONED_SKELETON)
	|| (taeter.guild == GIL_FRIENDLY_ORC)
	|| (taeter.guild == GIL_UNDEADORC)
	|| (taeter.guild == GIL_DRACONIAN))
	&& (Npc_HasReadiedWeapon(taeter))
	{
		rwp = Npc_GetReadiedWeapon(taeter);
		damageType = rwp.damagetype;
		damage = rwp.damageTotal;

		if (Npc_IsInFightMode(taeter, FMODE_MELEE))
		{
			if (rwp.cond_atr[2] == ATR_DEXTERITY)
			{
				damage += (taeter.attribute[ATR_DEXTERITY]+taeter.attribute[ATR_STRENGTH])/2;
			}
			else
			{
				damage += taeter.attribute[ATR_STRENGTH];
			};
		}
		else if (Npc_IsInFightMode(taeter, FMODE_FAR))
		{
			if (C_ItmHasFlag(rwp, ITEM_CROSSBOW))
			{
				damage += (taeter.attribute[ATR_DEXTERITY]+taeter.attribute[ATR_STRENGTH])/2;
			}
			else
			{
				damage += taeter.attribute[ATR_DEXTERITY];
			};

			if (rwp.munition == ItRw_SprengstoffArrow)
			|| (rwp.munition == ItRw_SprengstoffBolt)
			{
				damageType = 0; // Rüstung wird ignoriert
			}
			else if (rwp.munition == ItRw_Addon_FireArrow)
			|| (rwp.munition == ItRw_Addon_FireBolt)
			{
				damageType = DAM_FIRE; // Schadenstyp ist Feuer, so macht man noch Schaden gegen Alraune und Apfelbaum
			}
			else if (Hlp_IsItem(rwp, ItRw_Geisterbogen) == TRUE)
			{
				damageType = DAM_MAGIC;
			};
		};

		if ((C_ItmHasFlag(rwp, ITEM_SWD))
		|| (C_ItmHasFlag(rwp, ITEM_AXE)))
		{
			if (r_max(99) < taeter.HitChance[NPC_TALENT_1H])
			{
				critChance = 1;
			};
		}
		else if ((C_ItmHasFlag(rwp, ITEM_2HD_SWD))
		|| (C_ItmHasFlag(rwp, ITEM_2HD_AXE)))
		{
			if (Hlp_GetInstanceID(taeter) == Hlp_GetInstanceID(PC_Hero))
			&& (ZweihandAlsEinhand_Perk == TRUE)
			{
				if (r_max(99) < taeter.HitChance[NPC_TALENT_1H])
				{
					critChance = 1;
				};
			}
			else
			{
				if (r_max(99) < taeter.HitChance[NPC_TALENT_2H])
				{
					critChance = 1;
				};
			};
		}
		else if (r_max(99) < taeter.HitChance[NPC_TALENT_BOW])
		&& (C_ItmHasFlag(rwp, ITEM_BOW))
		{
			critChance = 1;
		}
		else if (r_max(99) < taeter.HitChance[NPC_TALENT_CROSSBOW])
		&& (C_ItmHasFlag(rwp, ITEM_CROSSBOW))
		{
			critChance = 1;
		};
	}
	else // Faustkampf oder Monster
	{
		damageType = taeter.damagetype;
		damage = taeter.attribute[ATR_STRENGTH];

		if (r_max(99) < taeter.attribute[ATR_DEXTERITY])
		&& (taeter.guild > GIL_SEPERATOR_HUM)
		{
			critChance = 1;
		}
		else if (r_max(99) < (taeter.HitChance[NPC_TALENT_1H]+taeter.HitChance[NPC_TALENT_2H])/2)
		&& (taeter.guild < GIL_SEPERATOR_HUM)
		{
			critChance = 1;
		};

		if (Hlp_GetInstanceID(taeter) == Hlp_GetInstanceID(PC_Hero))
		&& (Mod_TrollRing == TRUE)
		{
			damage += 120;
		};
	};

	// Wenn von hinten angegriffen, Schaden verdoppeln

	if (!Npc_CanSeeNpc(opfer, taeter))
	{
		damage = damage*2;
	};

	// Rüstungsschutz vom Schaden abziehen

	if (damageType == DAM_BLUNT)
	{
		if (opfer.protection[PROT_BLUNT] != -1)
		{
			armor = opfer.protection[PROT_BLUNT]/1000;
		};
	}
	else if (damageType == DAM_EDGE)
	{
		if (opfer.protection[PROT_EDGE] != -1)
		{
			armor = opfer.protection[PROT_EDGE]/1000;
		};
	}
	else if (damageType == DAM_POINT)
	{
		if (opfer.protection[PROT_POINT] != -1)
		{
			armor = opfer.protection[PROT_POINT]/1000;
		};
	}
	else if (damageType == DAM_MAGIC)
	{
		armor = opfer.protection[PROT_MAGIC];
	}
	else if (damageType == DAM_FIRE)
	{
		armor = opfer.protection[PROT_FIRE];
	};

	if (opfer.aivar[AIV_Siechtum] > 0)
	&& (opfer.guild > GIL_SEPERATOR_HUM)
	&& (opfer.guild != GIL_ORC)
	&& (opfer.guild != GIL_FRIENDLY_ORC)
	&& (opfer.guild != GIL_DRACONIAN)
	{
		armor = (2*armor)/5;
	};

	// Bei Rüstungswert 1 ist armor = 0

	if (armor == 1)
	{
		armor = 0;
	};

	if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Monster_11067_Talos_EIS))
	{
		if (Npc_IsInFightMode(taeter, FMODE_FIST))
		{
			damage -= 20;
		}
		else
		{
			damage = 0;
		};
	}
	else
	{
		damage -= armor;
	};

	if (armor == -1)
	{
		damage = 0;
	};

	if (critChance == 0)
	{
		damage = damage/10;
	};

	// Hier kommt dann noch Spezialschaden dazu (Klaue, Hammer usw.)

	if (Hlp_IsValidItem(rwp))
	{
		damage += B_BeliarsWeaponSpecialDamage	(taeter, opfer);
		damage += B_UrizielsSpecialDamage	(taeter, opfer);
		damage += B_AdanosStabSpecialDamage	(taeter, opfer);
		damage += B_HolyHammerSpecialDamage	(taeter, opfer);
		damage += B_Pfeile			(taeter, opfer);
	};

	if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(hero))
	{
		if (BoeserBlickAbwender_Equipped)
		{
			if (taeter.guild == GIL_DEMON)
			|| (C_NpcIsUndead(taeter))
			{
				damage -= 20;

				B_MagicHurtNpc	(opfer, taeter, 20);
			};
		};
	};

	// Weniger Schaden als min. Schaden => auf min. Schaden setzen

	if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Monster_11067_Talos_EIS))
	{
		if (Npc_IsInFightMode(taeter, FMODE_FIST))
		{			
			if (damage < 5)
			{
				damage = 5;
			};
		}
		else
		{
			damage = 0;
		};
	}
	else
	{
		if (damage < 5)
		&& (armor != -1)
		{
			damage = 5;
		};
	};

	if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(PC_Hero))
	{
		if (Mod_Dornenguertel)
		{
			var int dornendam;
			dornendam = 80 - taeter.protection[PROT_EDGE]/1000;

			if (dornendam < 5)
			{
				dornendam = 5;
			};

			B_MagicHurtNpc	(opfer, taeter, dornendam);

			if (r_max(99) < 10)
			{
				taeter.aivar[AIV_Blutet] = 10;
			};
		};
	};

	// Wenn Hero geschossen hat, dann zurücksetzen

	if (Hlp_GetInstanceID(taeter) == Hlp_GetInstanceID(PC_Hero))
	{
		if (Npc_HasReadiedRangedWeapon(hero))
		{
			var int chanceBonus;
			chanceBonus = 0;

			if (rwp.munition == ItRw_PraezisionsArrow)
			|| (rwp.munition == ItRw_PraezisionsBolt)
			{
				chanceBonus += 5;
			};

			if (Npc_GetDistToNpc(taeter, opfer) < 1000)
			{
				chancebonus += (10-(Npc_GetDistToNpc(taeter, opfer)/100))*4;
			};

			if (rwp.munition == ItRw_SprengstoffArrow)
			|| (rwp.munition == ItRw_SprengstoffBolt)
			{
				if (opfer.guild > GIL_SEPERATOR_HUM)
				&& (opfer.aivar[AIV_Trefferzone] == 0)
				{
					opfer.aivar[AIV_Trefferzone] = 2;
				};
			};

			if (CurrentTarget == TARGET_RUMP)
			{
				if (r_max(99) < (10-chanceBonus))
				{
					damage = 0;
				}
				else
				{
					if (opfer.guild > GIL_SEPERATOR_HUM)
					&& (opfer.aivar[AIV_Trefferzone] == 0)
					{
						opfer.aivar[AIV_Trefferzone] = 1;
					};
				};
			}
			else if (CurrentTarget == TARGET_LEFTLEG)
			|| (CurrentTarget == TARGET_RIGHTLEG)
			{
				if (r_max(99) < (40-chanceBonus))
				{
					damage = 0;
				}
				else
				{
					// Schaden bleibt, dafür langsamer

					Npc_ClearAIQueue	(opfer);
					AI_StandUP	(opfer);

					AI_StartState	(opfer, ZS_MagicMiniFreeze, 0, "");
				};
			}
			else if (CurrentTarget == TARGET_RIGHTARM)
			|| (CurrentTarget == TARGET_LEFTARM)
			{
				if (r_max(99) < (40-chanceBonus))
				{
					damage = 0;
				}
				else
				{
					// Schaden bleibt, dafür weniger Schaden

					opfer.attribute[ATR_STRENGTH] -= opfer.attribute[ATR_STRENGTH]/10;
				};
			}
			else if (CurrentTarget == TARGET_HEAD)
			{
				if (r_max(99) < (60-chanceBonus)/(1+Mod_KritischerTrefferRing))
				{
					damage = 0;
				}
				else
				{
					damage += (damage*25)/10;

					if (opfer.guild > GIL_SEPERATOR_HUM)
					&& (opfer.aivar[AIV_Trefferzone] == 0)
					{
						opfer.aivar[AIV_Trefferzone] = 1;
					};
				};
			};

			var int rangeBonus;
			rangeBonus = 0;

			if (rwp.munition == ItRw_PraezisionsArrow)
			|| (rwp.munition == ItRw_PraezisionsBolt)
			{
				rangeBonus += 1000;

				damage -= (damage*10)/100;
			};

			if (rwp.munition == ItRw_SprengstoffArrow)
			|| (rwp.munition == ItRw_SprengstoffBolt)
			{
				rangeBonus -= 2000;

				damage += (damage*50)/100;
			};

			if (Npc_GetHeightToNpc(taeter, opfer) > 200)
			{
				rangeBonus += (Npc_GetHeightToNpc(taeter, opfer)/100)*2;
			};

			if (Npc_GetDistToNpc(taeter, opfer) > (rwp.range+rangeBonus))
			{
				return;
			};

			if (rwp.munition == ItRw_WiderhakenArrow)
			|| (rwp.munition == ItRw_WiderhakenBolt)
			{
				if (r_max(99) < 10)
				{
					return;
				};
			};

			if (rwp.munition == ItRw_RueckverwandlungsArrow)
			|| (rwp.munition == ItRw_RueckverwandlungsBolt)
			{
				if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Warg_Atalante))
				{
					B_RemoveNpc	(Warg_Atalante);

					Wld_InsertNpc	(Mod_7678_OUT_Atalante_NW, "NW_FOREST_PATH_31_NAVIGATION3");
				};
			};

			if (Hlp_IsItem(rwp, ItRw_Geisterbogen) == TRUE)
			&& (C_NpcIsUndead(opfer))
			{
				damage += damage/2;
			};

			//CurrentTarget = TARGET_RUMP; // nicht mehr zurücksetzen
		};

		if (Mod_NL_DrachensudIntus == 1)
		&& (hero.attribute[ATR_MANA] > 20)
		{
			damage += 25;
		};

		if (Mod_GottDamage > 0)
		&& (opfer.aivar[AIV_AttackReason] != AR_NONE)
		{
			damage += Mod_GottDamage;
		};

		if (Npc_HasReadiedMeleeWeapon(hero))
		{
			if (Hlp_IsItem(rwp, ItMw_Orkschlaechter) == TRUE)
			&& (C_NpcIsOrc(opfer))
			{
				damage += 50;
			};
				
			if (opfer.guild > GIL_SEPERATOR_HUM)
			&& (opfer.aivar[AIV_Trefferzone] == 0)
			{
				opfer.aivar[AIV_Trefferzone] = 1;
			};

			if (Hlp_IsItem(rwp, ItMw_Chemo) == TRUE)
			{
				if (opfer.guild == GIL_BLOODFLY)
				|| (opfer.guild == GIL_MINECRAWLER)
				|| (opfer.guild == GIL_GIANT_BUG)
				{
					damage += 100;
				};
				if (opfer.guild == GIL_GIANT_RAT)
				|| (opfer.guild == GIL_SWAMPSHARK)
				{
					damage += 50;
				};
			};

			if (Hlp_IsItem(rwp, ItMw_FeurigerHammer) == TRUE)
			{
				damage += 3;
			};

			if (Mod_Tiergift > 0)
			{
				if (opfer.aivar[AIV_MM_REAL_ID] != ID_BLOODFLY)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_SPIDER)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_MINECRAWLER)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_MINECRAWLERWARRIOR)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_MINECRAWLERQUEEN)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_SWAMPDRONE)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_ZOMBIE)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_SKELETON)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_SKELETONLORD)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_SKELETON_MAGE)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_GOBBO_SKELETON)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_UNDEADORCWARRIOR)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_DEMON)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_DEMON_LORD)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_DRAGON_ROCK)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_DRAGON_FIRE)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_DRAGON_ICE)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_DRAGON_SWAMP)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_DRAGON_UNDEAD)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_DRAGON_BLACK)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_KOBOLD)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_GIGANTDERVORZEIT)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_BALROG)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_GARGOYLE)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_UNDEADSWAMPSHARK)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_LINDWURM)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_FIREWARAN)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_STONEGUARDIAN)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_SLEEPER)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_ALRAUNE)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_APFELBAUM)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_WISP)
				&& (opfer.guild != GIL_STONEGOLEM)
				&& (opfer.guild != GIL_FIREGOLEM)
				&& (opfer.guild != GIL_ICEGOLEM)
				&& (opfer.guild != GIL_SWAMPGOLEM)
				&& (Hlp_GetInstanceID(opfer) != Hlp_GetInstanceID(Schattenlord_877_Urnol))
				&& (Hlp_GetInstanceID(opfer) != Hlp_GetInstanceID(Schattenlord_999_Urnol))
				&& (Hlp_GetInstanceID(opfer) != Hlp_GetInstanceID(Schattenlord_542_Urnol))
				&& (Hlp_GetInstanceID(opfer) != Hlp_GetInstanceID(Mod_7036_NONE_Pilger_NW))
				&& (Hlp_GetInstanceID(opfer) != Hlp_GetInstanceID(Mod_7659_OUT_Magier_REL))
				{
					opfer.aivar[AIV_Tiergift] += 10;
					Mod_Tiergift -= 1;
				};
			};

			if (Mod_Gewaechsgift > 0)
			{
				if (opfer.aivar[AIV_MM_REAL_ID] != ID_ZOMBIE)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_SKELETON)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_SKELETONLORD)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_SKELETON_MAGE)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_GOBBO_SKELETON)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_UNDEADORCWARRIOR)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_DEMON)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_DEMON_LORD)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_DRAGON_ROCK)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_DRAGON_FIRE)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_DRAGON_ICE)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_DRAGON_SWAMP)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_DRAGON_UNDEAD)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_DRAGON_BLACK)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_KOBOLD)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_GIGANTDERVORZEIT)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_BALROG)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_GARGOYLE)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_UNDEADSWAMPSHARK)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_LINDWURM)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_FIREWARAN)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_STONEGUARDIAN)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_SLEEPER)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_ALRAUNE)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_APFELBAUM)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_WISP)
				&& (opfer.guild != GIL_STONEGOLEM)
				&& (opfer.guild != GIL_FIREGOLEM)
				&& (opfer.guild != GIL_ICEGOLEM)
				&& (opfer.guild != GIL_SWAMPGOLEM)
				&& (Hlp_GetInstanceID(opfer) != Hlp_GetInstanceID(Schattenlord_877_Urnol))
				&& (Hlp_GetInstanceID(opfer) != Hlp_GetInstanceID(Schattenlord_999_Urnol))
				&& (Hlp_GetInstanceID(opfer) != Hlp_GetInstanceID(Schattenlord_542_Urnol))
				&& (Hlp_GetInstanceID(opfer) != Hlp_GetInstanceID(Mod_7036_NONE_Pilger_NW))
				&& (Hlp_GetInstanceID(opfer) != Hlp_GetInstanceID(Mod_7659_OUT_Magier_REL))
				{
					opfer.aivar[AIV_Pflanzengift] += 16;
					Mod_Gewaechsgift -= 1;
				};
			};

			if (Hlp_IsItem(rwp, ItMw_Ritualdolch_Gift) == TRUE)
			{
				if (opfer.aivar[AIV_MM_REAL_ID] != ID_BLOODFLY)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_SPIDER)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_MINECRAWLER)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_MINECRAWLERWARRIOR)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_MINECRAWLERQUEEN)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_SWAMPDRONE)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_ZOMBIE)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_SKELETON)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_SKELETONLORD)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_SKELETON_MAGE)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_GOBBO_SKELETON)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_UNDEADORCWARRIOR)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_DEMON)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_DEMON_LORD)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_DRAGON_ROCK)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_DRAGON_FIRE)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_DRAGON_ICE)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_DRAGON_SWAMP)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_DRAGON_UNDEAD)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_DRAGON_BLACK)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_KOBOLD)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_GIGANTDERVORZEIT)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_BALROG)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_GARGOYLE)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_UNDEADSWAMPSHARK)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_LINDWURM)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_FIREWARAN)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_STONEGUARDIAN)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_SLEEPER)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_ALRAUNE)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_APFELBAUM)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_WISP)
				&& (opfer.guild != GIL_STONEGOLEM)
				&& (opfer.guild != GIL_FIREGOLEM)
				&& (opfer.guild != GIL_ICEGOLEM)
				&& (opfer.guild != GIL_SWAMPGOLEM)
				&& (Hlp_GetInstanceID(opfer) != Hlp_GetInstanceID(Schattenlord_877_Urnol))
				&& (Hlp_GetInstanceID(opfer) != Hlp_GetInstanceID(Schattenlord_999_Urnol))
				&& (Hlp_GetInstanceID(opfer) != Hlp_GetInstanceID(Schattenlord_542_Urnol))
				&& (Hlp_GetInstanceID(opfer) != Hlp_GetInstanceID(Mod_7036_NONE_Pilger_NW))
				&& (Hlp_GetInstanceID(opfer) != Hlp_GetInstanceID(Mod_7659_OUT_Magier_REL))
				{
					opfer.aivar[AIV_Tiergift] += 6;
				};

				if (opfer.aivar[AIV_MM_REAL_ID] != ID_ZOMBIE)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_SKELETON)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_SKELETONLORD)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_SKELETON_MAGE)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_GOBBO_SKELETON)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_UNDEADORCWARRIOR)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_DEMON)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_DEMON_LORD)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_DRAGON_ROCK)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_DRAGON_FIRE)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_DRAGON_ICE)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_DRAGON_SWAMP)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_DRAGON_UNDEAD)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_DRAGON_BLACK)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_KOBOLD)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_GIGANTDERVORZEIT)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_BALROG)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_GARGOYLE)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_UNDEADSWAMPSHARK)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_LINDWURM)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_FIREWARAN)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_STONEGUARDIAN)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_SLEEPER)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_ALRAUNE)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_APFELBAUM)
				&& (opfer.aivar[AIV_MM_REAL_ID] != ID_WISP)
				&& (opfer.guild != GIL_STONEGOLEM)
				&& (opfer.guild != GIL_FIREGOLEM)
				&& (opfer.guild != GIL_ICEGOLEM)
				&& (opfer.guild != GIL_SWAMPGOLEM)
				&& (Hlp_GetInstanceID(opfer) != Hlp_GetInstanceID(Schattenlord_877_Urnol))
				&& (Hlp_GetInstanceID(opfer) != Hlp_GetInstanceID(Schattenlord_999_Urnol))
				&& (Hlp_GetInstanceID(opfer) != Hlp_GetInstanceID(Schattenlord_542_Urnol))
				&& (Hlp_GetInstanceID(opfer) != Hlp_GetInstanceID(Mod_7036_NONE_Pilger_NW))
				&& (Hlp_GetInstanceID(opfer) != Hlp_GetInstanceID(Mod_7659_OUT_Magier_REL))
				{
					opfer.aivar[AIV_Pflanzengift] += 8;
				};
			};

			if ((Hlp_IsItem(rwp, ItMw_Ritualdolch_Blut) == TRUE)
			|| (Hlp_IsItem(rwp, ItMw_1H_Common_01_StarkBonusMeisterschmied) == TRUE)
			|| (Hlp_IsItem(rwp, ItMw_1H_Common_01_StarkMeisterschmied) == TRUE)
			|| (Hlp_IsItem(rwp, ItMw_1H_Common_01_BonusMeisterschmied) == TRUE)
			|| (Hlp_IsItem(rwp, ItMw_1H_Common_01_Meisterschmied) == TRUE)
			|| (Hlp_IsItem(rwp, ItMw_Schwert1_StarkBonusMeisterschmied) == TRUE)
			|| (Hlp_IsItem(rwp, ItMw_Schwert1_StarkMeisterschmied) == TRUE)
			|| (Hlp_IsItem(rwp, ItMw_Schwert1_BonusMeisterschmied) == TRUE)
			|| (Hlp_IsItem(rwp, ItMw_Schwert1_Meisterschmied) == TRUE)
			|| (Hlp_IsItem(rwp, ItMw_Rubinklinge_StarkBonusMeisterschmied) == TRUE)
			|| (Hlp_IsItem(rwp, ItMw_Rubinklinge_StarkMeisterschmied) == TRUE)
			|| (Hlp_IsItem(rwp, ItMw_Rubinklinge_BonusMeisterschmied) == TRUE)
			|| (Hlp_IsItem(rwp, ItMw_Rubinklinge_Meisterschmied) == TRUE)
			|| (Hlp_IsItem(rwp, ItMw_ElBastardo_StarkBonusMeisterschmied) == TRUE)
			|| (Hlp_IsItem(rwp, ItMw_ElBastardo_StarkMeisterschmied) == TRUE)
			|| (Hlp_IsItem(rwp, ItMw_ElBastardo_BonusMeisterschmied) == TRUE)
			|| (Hlp_IsItem(rwp, ItMw_ElBastardo_Meisterschmied) == TRUE))
			&& (opfer.guild != GIL_SKELETON)
			&& (opfer.guild != GIL_STONEGUARDIAN)
			&& (opfer.guild != GIL_GOBBO_SKELETON)
			&& (opfer.guild != GIL_SKELETON_MAGE)
			&& (opfer.guild != GIL_SHADOWBEAST_SKELETON)
			&& (opfer.guild != GIL_STONEGOLEM)
			&& (opfer.guild != GIL_ICEGOLEM)
			&& (opfer.guild != GIL_FIREGOLEM)
			&& (opfer.aivar[AIV_MM_REAL_ID] != ID_ZOMBIE)
			&& (opfer.aivar[AIV_MM_REAL_ID] != ID_SKELETONLORD)
			&& (opfer.aivar[AIV_MM_REAL_ID] != ID_SKELETON_MAGE)
			&& (opfer.aivar[AIV_MM_REAL_ID] != ID_UNDEADORCWARRIOR)
			&& (opfer.aivar[AIV_MM_REAL_ID] != ID_GIGANTDERVORZEIT)
			&& (opfer.aivar[AIV_MM_REAL_ID] != ID_BALROG)
			&& (opfer.aivar[AIV_MM_REAL_ID] != ID_GARGOYLE)
			&& (opfer.aivar[AIV_MM_REAL_ID] != ID_UNDEADSWAMPSHARK)
			&& (opfer.aivar[AIV_MM_REAL_ID] != ID_STONEGUARDIAN)
			&& (opfer.aivar[AIV_MM_REAL_ID] != ID_SLEEPER)
			&& (opfer.aivar[AIV_MM_REAL_ID] != ID_ALRAUNE)
			&& (opfer.aivar[AIV_MM_REAL_ID] != ID_APFELBAUM)
			&& (opfer.aivar[AIV_MM_REAL_ID] != ID_WISP)
			&& (opfer.aivar[AIV_Blutet] == 0)
			{
				opfer.aivar[AIV_Blutet] = 10;
			};

			if (Hlp_IsItem(rwp, ItMw_Ritualdolch_Frost) == TRUE)
			{
				damage += 10;

				if (r_max(99) <= 5)
				{
					AI_StartState	(opfer, ZS_MagicFreeze, 0, "");
					Wld_PlayEffect	("spellFX_Freeze", opfer, opfer, 0, 0, 0, FALSE);
				};
			};

			if (Hlp_IsItem(rwp, ItMw_1H_Blessed_01) == TRUE)
			|| (Hlp_IsItem(rwp, ItMw_2H_Blessed_01) == TRUE)
			{
				if (opfer.guild == GIL_DEMON)
				|| (C_NpcIsUndead(opfer))
				{
					damage += damage/30;
				};
			};

			if (Hlp_IsItem(rwp, ItMw_1H_Blessed_02) == TRUE)
			|| (Hlp_IsItem(rwp, ItMw_2H_Blessed_02) == TRUE)
			{
				if (opfer.guild == GIL_DEMON)
				|| (C_NpcIsUndead(opfer))
				{
					damage += damage/40;
				};
			};

			if (Hlp_IsItem(rwp, ItMw_1H_Blessed_03) == TRUE)
			|| (Hlp_IsItem(rwp, ItMw_2H_Blessed_03) == TRUE)
			{
				if (opfer.guild == GIL_DEMON)
				|| (C_NpcIsUndead(opfer))
				{
					damage += damage/50;
				};
			};

			if (Hlp_IsItem(rwp, ItMw_Hueterklinge_1H) == TRUE)
			|| (Hlp_IsItem(rwp, ItMw_Hueterklinge_2H) == TRUE)
			{
				if (opfer.guild == GIL_SWAMPSHARK)
				|| (opfer.guild == GIL_DRACONIAN)
				|| (opfer.aivar[AIV_MM_REAL_ID] == ID_SWAMPDRONE)
				|| (opfer.guild == GIL_SWAMPGOLEM)
				|| (opfer.aivar[AIV_MM_REAL_ID] == ID_SWAMPRAT)
				{
					damage += 30;
				};
			};
		};

		if (Mod_NL_DrachensudIntus == 1)
		&& (hero.attribute[ATR_MANA] > 20)
		{
			damage += 25;
		};

		if (Mod_WM_Eisklinge == TRUE)
		{
			if (Mod_Gilde == 17)
			{
				damage += 10;

				if (r_max(99) <= 6)
				{
					AI_StartState	(opfer, ZS_MagicFreeze, 0, "");
					Wld_PlayEffect	("spellFX_Freeze", opfer, opfer, 0, 0, 0, FALSE);
				};
			}
			else if (Mod_Gilde == 18)
			{
				damage += 20;

				if (r_max(99) <= 12)
				{
					AI_StartState	(opfer, ZS_MagicFreeze, 0, "");
					Wld_PlayEffect	("spellFX_Freeze", opfer, opfer, 0, 0, 0, FALSE);
				};
			};
		};

		if (Orktoeter_Perk == TRUE)
		&& ((opfer.guild == GIL_ORC)
		|| (opfer.guild == GIL_FRIENDLY_ORC))
		{
			damage += 50;
		};

		if (Menschtoeter_Perk == TRUE)
		&& (opfer.guild < GIL_SEPERATOR_HUM)
		{
			damage += 50;
		};

		if (Mod_VersengungRing == 1)
		{
			damage += 5;
		};
	};

	if (Mod_GottBeliar > 0)
	&& ((taeter.guild == GIL_SUMMONED_GOBBO_SKELETON)	
	|| (taeter.guild == GIL_SUMMONED_WOLF)	
	|| (taeter.guild == GIL_SUMMONED_SKELETON)	
	|| (taeter.guild == GIL_SUMMONED_GOLEM)	
	|| (taeter.guild == GIL_SUMMONED_DEMON)	
	|| (taeter.guild == GIL_SUMMONEDGUARDIAN)	
	|| (taeter.guild == GIL_SUMMONEDZOMBIE))
	{
		damage += Mod_GottBeliar;
	};

	if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Dragon_Undead))
	{
		if (B_HolyHammerSpecialDamage (taeter, opfer) == 0)
		{
			damage = 0;
		};
	};

	if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Fake_Hero))
	{
		if (B_AdanosStabSpecialDamage (taeter, opfer) == 0)
		{
			damage = 0;
		};
	};

	if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Schattenlord_999_Urnol))
	{
		if (B_BeliarsWeaponSpecialDamage (taeter, opfer) == 0)
		{
			damage = 0;
		};
	};

	if (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Erzguardian))
	|| (Hlp_GetInstanceID(opfer) == Hlp_GetInstanceID(Erzguardian_Special_01))
	{
		if (Npc_HasReadiedWeapon(taeter))
		{
			if (Hlp_IsItem(rwp, ItMw_GranmarKeule) == FALSE)
			&& (Hlp_IsItem(rwp, ItMw_ErzKeule) == FALSE)
			{
				damage = 0;
			};
		}
		else
		{
			damage = 0;
		};
	};

	if (damage >= opfer.attribute[ATR_HITPOINTS])
	&& (C_DropUnconscious2(opfer, taeter))
	{
		//damage = opfer.attribute[ATR_HITPOINTS] - 2;
	};

	if (Hlp_GetInstanceID(taeter) == Hlp_GetInstanceID(PC_Hero))
	&& (opfer.aivar[AIV_Partymember] == TRUE)
	{
		damage = 0;
	};

	if (Hlp_GetInstanceID(taeter) == Hlp_GetInstanceID(Xeres_01))
	&& (Npc_IsInState(hero, ZS_MagicFreeze))
	{
		damage = 999999;
	};

	if (damage > 0)
	{
		if (Npc_HasReadiedRangedWeapon(taeter))
		{
			if (rwp.munition == ItRw_SprengstoffArrow)
			|| (rwp.munition == ItRw_SprengstoffBolt)
			{
				Wld_PlayEffect ("spellFX_Firestorm_COLLIDE", opfer, opfer, 0, 0, 0, FALSE);
			}
			else if (Mod_VersengungRing == 1)
			&& (Hlp_GetInstanceID(taeter) == Hlp_GetInstanceID(PC_Hero))
			{
				Wld_PlayEffect ("spellFX_Firestorm_COLLIDE", opfer, opfer, 0, 0, 0, FALSE);
			};
		}
		else if (Mod_VersengungRing == 1)
		&& (Hlp_GetInstanceID(taeter) == Hlp_GetInstanceID(PC_Hero))
		{
			Wld_PlayEffect ("spellFX_Firestorm_COLLIDE", opfer, opfer, 0, 0, 0, FALSE);
		};

		if (Hlp_GetInstanceID(taeter) == Hlp_GetInstanceID(Xeres_02))
		{
			taeter.attribute[ATR_HITPOINTS] += damage/20; // 5% des Schadens kommen an HP dazu
		};
	};	

	B_MagicHurtNpc	(taeter, opfer, damage);
};