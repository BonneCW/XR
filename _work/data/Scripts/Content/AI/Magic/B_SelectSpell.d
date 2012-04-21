// *************************************************************
// B_SelectSpell
// -------------
// Magieauswahl für Menschen und Monster
// Wenn Auswahlkriterien erfüllt (je nach Gilde unterschiedlich)
// --> TRUE, sonst FALSE
// Humans zaubern nur als KdF, PAL oder DMT
// *************************************************************

func int B_SelectSpell (var C_NPC slf, var C_NPC oth)
{	
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(PC_SEELE))
	{
		if (Npc_HasItems (slf, ItRu_Concussionbolt) == 0)
		{
			CreateInvItems (slf, ItRu_Concussionbolt, 1);
		};

		B_ReadySpell (slf, SPL_Concussionbolt, SPL_Cost_Concussionbolt);

		return TRUE;
	};

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1520_TB_Totenbeschwoerer_AW))
	{
		if (Npc_HasItems(slf, ItRu_SummonZombieArmy) == 0)
		{
			CreateInvItems (slf, ItRu_SummonZombieArmy, 1);
		};

		B_ReadySpell (slf, SPL_SummonZombieArmy, SPL_Cost_SummonZombieArmy);

		return TRUE;
	};

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7651_OUT_Suchender_REL))
	{
		if (Npc_HasItems(slf, ItRu_FireRain) == 0)
		{
			CreateInvItems (slf, ItRu_FireRain, 1);
		};

		B_ReadySpell (slf, SPL_FireRain, SPL_Cost_FireRain);

		return TRUE;
	};

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7630_RIT_Trent_VM))
	&& (Mod_KG_TrentLicht == FALSE)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Trent_VM_AfterQueen))
	{
		if (Npc_HasItems(slf, ItRu_PalLight) == 0)
		{
			CreateInvItems (slf, ItRu_PalLight, 1);
		};

		B_ReadySpell (slf, SPL_PalLight, SPL_Cost_PalLight);

		return TRUE;
	};

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(PC_Friend_NW))
	&& (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Zombie_Argez))
	{
		if (Npc_HasItems(slf, ItRu_ArgezVision) == 0)
		{
			CreateInvItems (slf, ItRu_ArgezVision, 1);
		};

		B_ReadySpell (slf, SPL_ArgezVision, SPL_Cost_ArgezVision);

		if (hero.protection[PROT_MAGIC] > -1)
		{
			Mod_Save_HeroArmor_Argez = hero.protection[PROT_MAGIC];

			hero.protection[PROT_MAGIC] = -1;
		};

		return TRUE;
	};

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(PC_Friend_Dummy))
	&& (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Zombie_Argez))
	{
		if (Npc_HasItems(slf, ItRu_ArgezVision) == 0)
		{
			CreateInvItems (slf, ItRu_ArgezVision, 1);
		};

		B_ReadySpell (slf, SPL_ArgezVision, SPL_Cost_ArgezVision);

		return TRUE;
	};

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(MinecrawlerQueen))
	//&& (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
	{
		if (Npc_HasItems(slf, ItRu_Spucke) == 0)
		{
			CreateInvItems (slf, ItRu_Spucke, 1);
		};

		B_ReadySpell (slf, SPL_Spucke, SPL_Cost_Spucke);

		return TRUE;
	};

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Lich_11008_NW))
	{
		if (Npc_HasItems(slf, ItRu_InstantFireball) == 0)
		{
			CreateInvItems (slf, ItRu_InstantFireball, 1);
		};

		B_ReadySpell (slf, SPL_InstantFireball, SPL_Cost_InstantFireball);

		return TRUE;
	};

	if (Mod_HQ_Daemonisch == 5)
	&& (C_NpcIsHero(oth))
	{
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_753_NOV_Ulf_NW))
		&& (Mod_HQ_Daemonisch_SP_01 == 2)
		{
			if (Npc_HasItems(slf, ItRu_Sleep) == 0)
			{
				CreateInvItems (slf, ItRu_Sleep, 1);
			};

			B_ReadySpell (slf, SPL_Sleep, SPL_Cost_Sleep);

			return TRUE;
		}
		else if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_541_NONE_Till_NW))
		&& (Mod_HQ_Daemonisch_SP_02 == 2)
		{
			if (Npc_HasItems(slf, ItRu_Sleep) == 0)
			{
				CreateInvItems (slf, ItRu_Sleep, 1);
			};

			B_ReadySpell (slf, SPL_Sleep, SPL_Cost_Sleep);

			return TRUE;
		}
		else if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_754_NONE_Valentino_NW))
		&& (Mod_HQ_Daemonisch_SP_03 == 2)
		{
			if (Npc_HasItems(slf, ItRu_Sleep) == 0)
			{
				CreateInvItems (slf, ItRu_Sleep, 1);
			};

			B_ReadySpell (slf, SPL_Sleep, SPL_Cost_Sleep);

			return TRUE;
		};
	};

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Kobold_11000_NW))
	{
		if (Npc_HasItems(slf, ItRu_Sleep) == 0)
		{
			CreateInvItems (slf, ItRu_Sleep, 1);
		};

		B_ReadySpell (slf, SPL_Sleep, SPL_Cost_Sleep);

		return TRUE;
	};

	if (slf.aivar[AIV_MM_REAL_ID] == ID_KOBOLD)
	{
		if (Npc_HasItems(slf, ItRu_InstantFireball) == 0)
		{
			CreateInvItems (slf, ItRu_InstantFireball, 1);
		};

		B_ReadySpell (slf, SPL_InstantFireball, SPL_Cost_InstantFireball);

		return TRUE;
	};

	// Untote Novizen

	if (slf.npctype == NPCTYPE_UNTOTERNOVIZE)
	{
		if (slf.attribute[ATR_MANA] >= SPL_Cost_InstantFireball)
		&& (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			if (Npc_HasItems (slf, ItRu_InstantFireball) == 0)
			{
				CreateInvItems (slf, ItRu_InstantFireball, 1);
			};

			B_ReadySpell (slf, SPL_InstantFireball, SPL_Cost_InstantFireball);
		}
		else
		{
			return FALSE;
		};

		return TRUE;
	};

	// Untote Magier

	if (slf.npctype == NPCTYPE_UNTOTERMAGIER)
	{
		if (slf.attribute[ATR_MANA] >= SPL_Cost_ChargeFireball)
		&& (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			if (Npc_HasItems (slf, ItRu_ChargeFireball) == 0)
			{
				CreateInvItems (slf, ItRu_ChargeFireball, 1);
			};

			B_ReadySpell (slf, SPL_ChargeFireball, SPL_Cost_ChargeFireball);
		}
		else
		{
			return FALSE;
		};

		return TRUE;
	};

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_10033_ORC_UndeadShamane_OGY))
	{
		if (Npc_HasItems(slf, ItRu_Zap) == 0)
		{
			CreateInvItems (slf, ItRu_Zap, 1);
		};

		if (Mod_NL_UOS_Casting < 3)
		&& (Npc_GetDistToWP(self, "GRYD_020") < 1000)
		{
			B_ReadySpell (slf, SPL_Zap, SPL_Cost_Zap);

			return TRUE;
		}
		else if (Mod_NL_UOS_Casting == 3)
		&& (Npc_GetDistToWP(self, "GRYD_020") < 1000)
		{
			B_StartOtherRoutine	(self, "SECOND");

			AI_Teleport	(self, "GRYD_048");

			Mod_NL_UOS = 3;

			return FALSE;
		}
		else if (Mod_NL_UOS_Casting < 6)
		&& (Npc_GetDistToWP(self, "GRYD_048") < 1000)
		{
			B_ReadySpell (slf, SPL_Zap, SPL_Cost_Zap);

			return TRUE;
		}
		else if (Mod_NL_UOS_Casting == 6)
		&& (Npc_GetDistToWP(self, "GRYD_048") < 1000)
		{
			B_StartOtherRoutine	(self, "LAST");

			AI_Teleport	(self, "GRYD_087");

			Mod_NL_UOS = 4;

			return FALSE;
		}
		else
		{
			B_ReadySpell (slf, SPL_Zap, SPL_Cost_Zap);

			return TRUE;
		};
	};

	// Baal Lukor im Orkfriedhof

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7266_GUR_BaalLukor_OGY))
	{
		if (slf.attribute[ATR_HITPOINTS] < (slf.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (slf.attribute[ATR_MANA] >= SPL_Cost_MediumHeal)
		{
			if (Npc_HasItems(slf, ItRu_MediumHeal) == 0)
			{
				CreateInvItems	(slf, ItRu_MediumHeal, 1);
			};

			B_ReadySpell (slf, SPL_MediumHeal, SPL_Cost_MediumHeal);
		}
		else if (slf.attribute[ATR_MANA] >= SPL_Cost_Windfist)
		&& (slf.attribute[ATR_HITPOINTS] >= (self.attribute[ATR_HITPOINTS_MAX] / 4))
		{
			if (Npc_HasItems (slf, ItRu_Windfist) == 0)
			{
				CreateInvItems (slf, ItRu_Windfist, 1);
			};

			B_ReadySpell (slf, SPL_Windfist, SPL_Cost_Windfist);
		}
		else
		{
			return FALSE;
		};

		return TRUE;
	};

	// Hexen, wenn sie Hexen sind

	if ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_783_BAU_Elena_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_104_BAU_Rega_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1403_BAU_Baeuerin_NW)))
	&& (Mod_WM_Boeden >= 11)
	{
		if (slf.attribute[ATR_HITPOINTS] < (slf.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (slf.attribute[ATR_MANA] >= SPL_Cost_MediumHeal)
		{
			if (Npc_HasItems(slf, ItRu_MediumHeal) == 0)
			{
				CreateInvItems	(slf, ItRu_MediumHeal, 1);
			};

			B_ReadySpell (slf, SPL_MediumHeal, SPL_Cost_MediumHeal);
		}
		else if (slf.attribute[ATR_MANA] >= SPL_Cost_Blutopfer)
		&& (slf.attribute[ATR_HITPOINTS] >= (self.attribute[ATR_HITPOINTS_MAX] / 4))
		{
			if (Npc_HasItems (slf, ItRu_BeliarsRage) == 0)
			{
				CreateInvItems (slf, ItRu_BeliarsRage, 1);
			};

			B_ReadySpell (slf, SPL_EnergyBall, SPL_Cost_EnergyBall);
		}
		else
		{
			return FALSE;
		};

		return TRUE;
	};

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7174_DEM_Randolph_NW))
	{
		if (Mod_Randolph_Started == 11)
		&& (slf.aivar[AIV_ATTACKREASON] == AR_Kill)
		{
			if (Npc_HasItems(slf, ItSc_Laehmen) == 0)
			{
				CreateInvItems (slf, ItSc_Laehmen, 1);
			};

			B_ReadySpell (slf, SPL_Laehmen, SPL_Cost_Scroll);

			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};

	// Kreis 1: Neol und Anor

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1625_VMG_Neol_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1628_VMG_Anor_MT))
	{
		if (slf.attribute[ATR_HITPOINTS] < (slf.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (slf.attribute[ATR_MANA] >= SPL_Cost_LightHeal)
		{
			if (Npc_HasItems(slf, ItRu_LightHeal) == 0)
			{
				CreateInvItems	(slf, ItRu_LightHeal, 1);
			};

			B_ReadySpell (slf, SPL_LightHeal, SPL_Cost_LightHeal);
		}
		else if (slf.attribute[ATR_MANA] >= SPL_Cost_SummonGoblinSkeleton)
		&& (slf.attribute[ATR_HITPOINTS] >= (self.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (slf.aivar[AIV_SelectSpell] == 0)
		{
			if (Npc_HasItems (slf, ItRu_SumGobSkel) == 0)
			{
				CreateInvItems (slf, ItRu_SumGobSkel, 1);
			};

			B_ReadySpell (slf, SPL_SummonGoblinSkeleton, SPL_Cost_SummonGoblinSkeleton);
		}
		else
		{
			return FALSE;
		};

		return TRUE;
	};

	// Kreis 2: Furt, Hermy und Genn

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1626_VMG_Furt_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1959_VMG_Genn_TUG))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_4020_VMG_Hermy_MT))
	{
		if (slf.attribute[ATR_HITPOINTS] < (slf.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (slf.attribute[ATR_MANA] >= SPL_Cost_LightHeal)
		{
			if (Npc_HasItems(slf, ItRu_LightHeal) == 0)
			{
				CreateInvItems	(slf, ItRu_LightHeal, 1);
			};

			B_ReadySpell (slf, SPL_LightHeal, SPL_Cost_LightHeal);
		}
		else if (slf.attribute[ATR_MANA] >= SPL_Cost_Waterfist)
		&& (slf.attribute[ATR_HITPOINTS] >= (self.attribute[ATR_HITPOINTS_MAX] / 4))
		{
			if (Npc_HasItems (slf, ItRu_Waterfist) == 0)
			{
				CreateInvItems (slf, ItRu_Waterfist, 1);
			};

			B_ReadySpell (slf, SPL_Waterfist, SPL_Cost_Waterfist);
		}
		else
		{
			return FALSE;
		};

		return TRUE;
	};

	// Kreis 3: Thorge und Albert

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1960_VMG_Thorge_TUG))
	{
		if (slf.attribute[ATR_HITPOINTS] < (slf.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (slf.attribute[ATR_MANA] >= SPL_Cost_MediumHeal)
		{
			if (Npc_HasItems(slf, ItRu_MediumHeal) == 0)
			{
				CreateInvItems	(slf, ItRu_MediumHeal, 1);
			};

			B_ReadySpell (slf, SPL_MediumHeal, SPL_Cost_MediumHeal);
		}
		else if (slf.attribute[ATR_MANA] >= SPL_Cost_SummonSkeleton)
		&& (slf.attribute[ATR_HITPOINTS] >= (self.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (Mod_Thorge_SkeleTte == 0)
		{
			if (Npc_HasItems (slf, ItRu_SumSkel) == 0)
			{
				CreateInvItems (slf, ItRu_SumSkel, 1);
			};

			B_ReadySpell (slf, SPL_SummonSkeleton, SPL_Cost_SummonSkeleton);
		}
		else
		{
			return FALSE;
		};

		return TRUE;
	};

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7178_VMG_Albert_OC))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1958_VMG_Albert_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1957_VMG_Thorge_MT))
	{
		if (slf.attribute[ATR_HITPOINTS] < (slf.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (slf.attribute[ATR_MANA] >= SPL_Cost_MediumHeal)
		{
			if (Npc_HasItems(slf, ItRu_MediumHeal) == 0)
			{
				CreateInvItems	(slf, ItRu_MediumHeal, 1);
			};

			B_ReadySpell (slf, SPL_MediumHeal, SPL_Cost_MediumHeal);
		}
		else if (slf.attribute[ATR_MANA] >= SPL_Cost_SummonSkeleton)
		&& (slf.attribute[ATR_HITPOINTS] >= (self.attribute[ATR_HITPOINTS_MAX] / 4))
		{
			if (Npc_HasItems (slf, ItRu_SumSkel) == 0)
			{
				CreateInvItems (slf, ItRu_SumSkel, 1);
			};

			B_ReadySpell (slf, SPL_SummonSkeleton, SPL_Cost_SummonSkeleton);
		}
		else
		{
			return FALSE;
		};

		return TRUE;
	};

	// Kreis 4: Turendil

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1955_VMG_Turendil_MT))
	{
		if (slf.attribute[ATR_HITPOINTS] < (slf.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (slf.attribute[ATR_MANA] >= SPL_Cost_FullHeal)
		{
			if (Npc_HasItems(slf, ItRu_FullHeal) == 0)
			{
				CreateInvItems	(slf, ItRu_FullHeal, 1);
			};

			B_ReadySpell (slf, SPL_FullHeal, SPL_Cost_FullHeal);
		}
		else if (slf.attribute[ATR_MANA] >= SPL_Cost_SummonGolem)
		&& (slf.attribute[ATR_HITPOINTS] >= (self.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (slf.aivar[AIV_SelectSpell] == 0)
		{
			if (Npc_HasItems (slf, ItRu_SumGol) == 0)
			{
				CreateInvItems (slf, ItRu_SumGol, 1);
			};

			B_ReadySpell (slf, SPL_SummonGolem, SPL_Cost_SummonGolem);
		}
		else
		{
			return FALSE;
		};

		return TRUE;
	};

	// Kreis 5: Faice

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_4019_VMG_Faice_MT))
	{
		if (slf.attribute[ATR_HITPOINTS] < (slf.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (slf.attribute[ATR_MANA] >= SPL_Cost_FullHeal)
		{
			if (Npc_HasItems(slf, ItRu_FullHeal) == 0)
			{
				CreateInvItems	(slf, ItRu_FullHeal, 1);
			};

			B_ReadySpell (slf, SPL_FullHeal, SPL_Cost_FullHeal);
		}
		else if (slf.attribute[ATR_MANA] >= SPL_Cost_SummonDemon)
		&& (slf.attribute[ATR_HITPOINTS] >= (self.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (slf.aivar[AIV_SelectSpell] == 0)
		{
			if (Npc_HasItems (slf, ItRu_SumDemon) == 0)
			{
				CreateInvItems (slf, ItRu_SumDemon, 1);
			};

			B_ReadySpell (slf, SPL_SummonDemon, SPL_Cost_SummonDemon);
		}
		else
		{
			return FALSE;
		};

		return TRUE;
	};

	// Balrog und Lindwurm

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Balrog))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Lindwurm))
	{
		if (slf.attribute[ATR_MANA] >= SPL_Cost_Firestorm)
		&& (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			if (Npc_HasItems (slf, ItRu_Firestorm) == 0)
			{
				CreateInvItems (slf, ItRu_Firestorm, 1);
			};

			B_ReadySpell (slf, SPL_Firestorm, SPL_Cost_Firestorm);

			return TRUE;
		};
	};

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_4015_SNOV_BesessenerNovize_MT))
	{
		if (Npc_HasItems(slf, ItSc_TrfMeatbug) == 0)
		{
			CreateInvItems (slf, ItSc_TrfMeatbug, 1);
		};

		B_ReadySpell (slf, SPL_TrfMeatbug, SPL_Cost_TrfMeatbug);

		return TRUE;
	};

	if (Mod_TemplerBeiThorus == 6)
	&& (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1106_EBR_Bartholo_MT))
	{
		if (Npc_HasItems (slf, ItRu_Windfist) == 0)
		{
			CreateInvItems (slf, ItRu_Windfist, 1);
		};

		B_ReadySpell (slf, SPL_Windfist, SPL_Cost_Windfist);

		return TRUE;
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Kalom_KeinZombie))
	&& (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7021_GUR_CorKalom_OT))
	{
		if (Npc_HasItems (slf, ItRu_SumSkel) == 0)
		{
			CreateInvItems (slf, ItRu_SumSkel, 1);
		};

		B_ReadySpell (slf, SPL_SummonSkeleton, SPL_Cost_SummonSkeleton);

		return TRUE;
	};

	// Cronos bei WM-Story Endkampf

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_758_KDW_Cronos_NW))
	&& (Npc_KnowsInfo(hero, Info_Mod_Cronos_Angriff_01))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Cronos_Angriff_02))
	{
		if ((slf.attribute[ATR_HITPOINTS] < (slf.attribute[ATR_HITPOINTS_MAX] / 4))
		|| (((Mod_1538_WKR_Wasserkrieger_NW.attribute[ATR_HITPOINTS] < (Mod_1538_WKR_Wasserkrieger_NW.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (!Npc_IsDead(Mod_1538_WKR_Wasserkrieger_NW)))
		|| ((Mod_1530_WKR_Everaldo_NW.attribute[ATR_HITPOINTS] < (Mod_1530_WKR_Everaldo_NW.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (!Npc_IsDead(Mod_1530_WKR_Everaldo_NW)))
		|| ((Mod_1539_WKR_Wasserkrieger_NW.attribute[ATR_HITPOINTS] < (Mod_1539_WKR_Wasserkrieger_NW.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (!Npc_IsDead(Mod_1539_WKR_Wasserkrieger_NW)))
		|| ((Mod_1533_WKR_Salvador_NW.attribute[ATR_HITPOINTS] < (Mod_1533_WKR_Salvador_NW.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (!Npc_IsDead(Mod_1533_WKR_Salvador_NW)))
		|| ((Mod_1537_WKR_Vanas_NW.attribute[ATR_HITPOINTS] < (Mod_1537_WKR_Vanas_NW.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (!Npc_IsDead(Mod_1537_WKR_Vanas_NW)))
		|| ((Mod_1536_WKR_Roka_NW.attribute[ATR_HITPOINTS] < (Mod_1536_WKR_Roka_NW.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (!Npc_IsDead(Mod_1536_WKR_Roka_NW)))
		|| ((Mod_1535_WKR_Wasserkrieger_NW.attribute[ATR_HITPOINTS] < (Mod_1535_WKR_Wasserkrieger_NW.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (!Npc_IsDead(Mod_1535_WKR_Wasserkrieger_NW)))
		|| ((Mod_1534_WKR_Wasserkrieger_NW.attribute[ATR_HITPOINTS] < (Mod_1534_WKR_Wasserkrieger_NW.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (!Npc_IsDead(Mod_1534_WKR_Wasserkrieger_NW)))
		|| ((Mod_1532_HTR_Ethan_NW.attribute[ATR_HITPOINTS] < (Mod_1532_HTR_Ethan_NW.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (!Npc_IsDead(Mod_1532_HTR_Ethan_NW)))
		|| ((hero.attribute[ATR_HITPOINTS] < (hero.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (!Npc_IsDead(hero)))
		|| ((Mod_538_RDW_Diego_NW.attribute[ATR_HITPOINTS] < (Mod_538_RDW_Diego_NW.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (!Npc_IsDead(Mod_538_RDW_Diego_NW))
		&& (Npc_KnowsInfo(hero, Info_Mod_Diego_PlateauAngriff)))
		|| ((Mod_588_WNOV_Joe_NW.attribute[ATR_HITPOINTS] < (Mod_588_WNOV_Joe_NW.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (!Npc_IsDead(Mod_588_WNOV_Joe_NW))
		&& (Npc_KnowsInfo(hero, Info_Mod_Joe_Wassersnapper))))
		&& (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_22)))
		&& (slf.attribute[ATR_MANA] >= SPL_Cost_MediumHeal)
		{
			if (Npc_HasItems(slf, ItRu_MediumHeal) == 0)
			{
				CreateInvItems	(slf, ItRu_MediumHeal, 1);
			};

			B_ReadySpell (slf, SPL_MediumHeal, SPL_Cost_MediumHeal);
		}
		else if (slf.attribute[ATR_MANA] >= SPL_Cost_AuraBerserker)
		&& (slf.attribute[ATR_HITPOINTS] >= (self.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (Npc_GetDistToWP(slf, "WP_ADANOS_BALROG") < 2000)
		&& (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_16))
		&& (Mod_Cronos_UsedBerserker == 0)
		{
			if (Npc_HasItems (slf, ItSc_AuraBerserker) == 0)
			{
				CreateInvItems (slf, ItSc_AuraBerserker, 1);
			};

			B_ReadySpell (slf, SPL_Icelance, SPL_Cost_Icelance);
		}
		else if (slf.attribute[ATR_MANA] >= SPL_Cost_Icelance)
		&& (slf.attribute[ATR_HITPOINTS] >= (self.attribute[ATR_HITPOINTS_MAX] / 4))
		{
			if (Npc_HasItems (slf, ItRu_Icelance) == 0)
			{
				CreateInvItems (slf, ItRu_Icelance, 1);
			};

			B_ReadySpell (slf, SPL_Icelance, SPL_Cost_Icelance);
		}
		else
		{
			return FALSE;
		};

		return TRUE;
	};

	//Feuer Novize

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_556_NOV_Theodor_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_724_NOV_Mattheus_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_753_NOV_Ulf_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_913_NOV_Agon_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_914_NOV_Babo_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_915_NOV_Dyrian_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_916_NOV_Garwig_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_919_NOV_Igaraz_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_923_NOV_Opolos_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7435_NOV_Novize_MT))
	|| (slf.npctype == NPCTYPE_NW_FEUERNOVIZE)
	{
		if (slf.attribute[ATR_HITPOINTS] < (slf.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (slf.attribute[ATR_MANA] >= SPL_Cost_LightHeal)
		&& (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			if (Npc_HasItems(slf, ItRu_LightHeal) == 0)
			{
				CreateInvItems	(slf, ItRu_LightHeal, 1);
			};

			B_ReadySpell (slf, SPL_LightHeal, SPL_Cost_LightHeal);
		}
		else if (slf.attribute[ATR_MANA] >= SPL_Cost_Firebolt)
		&& (slf.attribute[ATR_HITPOINTS] >= (self.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			if (Npc_HasItems (slf, ItRu_Firebolt) == 0)
			{
				CreateInvItems (slf, ItRu_Firebolt, 1);
			};

			B_ReadySpell (slf, SPL_Firebolt, SPL_Cost_Firebolt);
		}
		else
		{
			return FALSE;
		};

		return TRUE;
	};

	// Feuermagier

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_534_KDF_Milten_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_523_KDF_Daron_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_554_KDF_Parlan_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_917_KDF_Gorax_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_918_KDF_Hyglas_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_921_KDF_Marduk_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_922_KDF_Neoras_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_920_KDF_Isgaroth_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7443_KDF_Milten_IR))
	|| ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1771_KDF_Aaron_PAT))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Aaron_KillTojan)))
	|| (self.npctype == NPCTYPE_PAT_FEUERMAGIER)
	{
		if (slf.attribute[ATR_HITPOINTS] < (slf.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (slf.attribute[ATR_MANA] >= SPL_Cost_MediumHeal)
		&& (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			if (Npc_HasItems(slf, ItRu_MediumHeal) == 0)
			{
				CreateInvItems	(slf, ItRu_MediumHeal, 1);
			};

			B_ReadySpell (slf, SPL_MediumHeal, SPL_Cost_MediumHeal);
		}
		else if (slf.attribute[ATR_MANA] >= SPL_Cost_InstantFireball)
		&& (slf.attribute[ATR_HITPOINTS] >= (self.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			if (Npc_HasItems (slf, ItRu_InstantFireBall) == 0)
			{
				CreateInvItems (slf, ItRu_InstantFireBall, 1);
			};

			B_ReadySpell (slf, SPL_InstantFireball, SPL_Cost_InstantFireBall);
		}
		else
		{
			return FALSE;
		};

		return TRUE;
	};

	if ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1771_KDF_Aaron_PAT))
	&& (Npc_KnowsInfo(hero, Info_Mod_Aaron_KillTojan)))
	{
		if (slf.attribute[ATR_HITPOINTS] < (slf.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (slf.attribute[ATR_MANA] >= SPL_Cost_FullHeal)
		&& (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			if (Npc_HasItems(slf, ItRu_FullHeal) == 0)
			{
				CreateInvItems	(slf, ItRu_FullHeal, 1);
			};

			B_ReadySpell (slf, SPL_FullHeal, SPL_Cost_FullHeal);
		}
		else if (slf.attribute[ATR_MANA] >= SPL_Cost_Firestorm)
		&& (slf.attribute[ATR_HITPOINTS] >= (self.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			if (Npc_HasItems (slf, ItRu_Pyrokinesis) == 0)
			{
				CreateInvItems (slf, ItRu_Pyrokinesis, 1);
			};

			B_ReadySpell (slf, SPL_PYROKINESIS, SPL_Cost_Firestorm);
		}
		else
		{
			return FALSE;
		};

		return TRUE;
	};
		

	// Ordenspriester

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_551_KDF_Pyrokar_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_552_KDF_Serpentes_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_553_KDF_Ulthar_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_925_KDF_Talamon_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_6002_KDF_Pyrokar_GDG))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_6009_KDF_Ulthar_GDG))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_6011_KDF_Serpentes_GDG))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1746_KDF_Tojan_PAT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1747_KDF_Furgas_PAT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1770_KDF_Faros_PAT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1772_KDF_Gizar_PAT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1773_KDF_Nagon_PAT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1857_KDF_Magier_PAT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1739_KDF_Ordenspriester_PAT))
	|| (self.npctype == npctype_pat_ordenspriester)
	|| (self.npctype == npctype_pat_ordenspriester_mauer)
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1738_KDF_Velario_PAT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1768_KDF_Magier_PAT))
	{
		if (slf.attribute[ATR_HITPOINTS] < (slf.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (slf.attribute[ATR_MANA] >= SPL_Cost_FullHeal)
		&& (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			if (Npc_HasItems(slf, ItRu_FullHeal) == 0)
			{
				CreateInvItems	(slf, ItRu_FullHeal, 1);
			};

			B_ReadySpell (slf, SPL_FullHeal, SPL_Cost_FullHeal);
		}
		else if (slf.attribute[ATR_MANA] >= SPL_Cost_ChargeFireball)
		&& (slf.attribute[ATR_HITPOINTS] >= (self.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			if (Npc_HasItems (slf, ItRu_ChargeFireball) == 0)
			{
				CreateInvItems (slf, ItRu_ChargeFireball, 1);
			};

			B_ReadySpell (slf, SPL_ChargeFireball, SPL_Cost_ChargeFireball);
		}
		else
		{
			return FALSE;
		};

		return TRUE;
	};
		

	// Hexen

	if (self.npctype == npctype_pat_hexe)
	{
		if (slf.attribute[ATR_HITPOINTS] < (slf.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (slf.attribute[ATR_MANA] >= SPL_Cost_FullHeal)
		{
			if (Npc_HasItems(slf, ItRu_FullHeal) == 0)
			{
				CreateInvItems	(slf, ItRu_FullHeal, 1);
			};

			B_ReadySpell (slf, SPL_FullHeal, SPL_Cost_FullHeal);
		}
		else if (slf.attribute[ATR_MANA] >= SPL_Cost_Blutopfer)
		&& (slf.attribute[ATR_HITPOINTS] >= (self.attribute[ATR_HITPOINTS_MAX] / 4))
		{
			if (Npc_HasItems (slf, ItRu_Blutopfer) == 0)
			{
				CreateInvItems (slf, ItRu_Blutopfer, 1);
			};

			B_ReadySpell (slf, SPL_Blutopfer, SPL_Cost_Blutopfer);
		}
		else
		{
			return FALSE;
		};

		return TRUE;
	};

	// Wasser Novize

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_588_WNOV_Joe_NW))
	//|| (slf.npctype == NPCTYPE_NW_WASSERNOVIZE)
	{
		if (slf.attribute[ATR_HITPOINTS] < (slf.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (slf.attribute[ATR_MANA] >= SPL_Cost_LightHeal)
		&& (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			if (Npc_HasItems(slf, ItRu_LightHeal) == 0)
			{
				CreateInvItems	(slf, ItRu_LightHeal, 1);
			};

			B_ReadySpell (slf, SPL_LightHeal, SPL_Cost_LightHeal);
		}
		else if (slf.attribute[ATR_MANA] >= SPL_Cost_Icebolt)
		&& (slf.attribute[ATR_HITPOINTS] >= (self.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			if (Npc_HasItems (slf, ItRu_Icebolt) == 0)
			{
				CreateInvItems (slf, ItRu_Icebolt, 1);
			};

			B_ReadySpell (slf, SPL_Icebolt, SPL_Cost_Icebolt);
		}
		else
		{
			return FALSE;
		};

		return TRUE;
	};

	// Wassermagier

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_758_KDW_Cronos_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_768_KDW_Merdarion_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_769_KDW_Nefarius_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_771_KDW_Riordian_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_9001_KDW_Cronos_AW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_9002_KDW_Nefarius_AW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_9003_KDW_Riordian_AW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_9004_KDW_Merdarion_AW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1554_KDW_Jones_DI))
	{
		if (slf.attribute[ATR_HITPOINTS] < (slf.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (slf.attribute[ATR_MANA] >= SPL_Cost_MediumHeal)
		&& (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			if (Npc_HasItems(slf, ItRu_MediumHeal) == 0)
			{
				CreateInvItems	(slf, ItRu_MediumHeal, 1);
			};

			B_ReadySpell (slf, SPL_MediumHeal, SPL_Cost_MediumHeal);
		}
		else if (slf.attribute[ATR_MANA] >= SPL_Cost_Icelance)
		&& (slf.attribute[ATR_HITPOINTS] >= (self.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			if (Npc_HasItems (slf, ItRu_Icelance) == 0)
			{
				CreateInvItems (slf, ItRu_Icelance, 1);
			};

			B_ReadySpell (slf, SPL_Icelance, SPL_Cost_Icelance);
		}
		else
		{
			return FALSE;
		};

		return TRUE;
	};

	// Richter

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_524_KDW_Vatras_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_774_KDW_Saturas_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_6003_KDW_Saturas_GDG))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_6010_KDW_Vatras_GDG))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_9000_KDW_Saturas_AW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7449_KDW_Vatras_IR))
	{
		if (slf.attribute[ATR_HITPOINTS] < (slf.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (slf.attribute[ATR_MANA] >= SPL_Cost_FullHeal)
		&& (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			if (Npc_HasItems(slf, ItRu_FullHeal) == 0)
			{
				CreateInvItems	(slf, ItRu_FullHeal, 1);
			};

			B_ReadySpell (slf, SPL_FullHeal, SPL_Cost_FullHeal);
		}
		else if (slf.attribute[ATR_MANA] >= SPL_Cost_LightningFlash)
		&& (slf.attribute[ATR_HITPOINTS] >= (self.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			if (Npc_HasItems (slf, ItRu_LightningFlash) == 0)
			{
				CreateInvItems (slf, ItRu_LightningFlash, 1);
			};

			B_ReadySpell (slf, SPL_LightningFlash, SPL_Cost_LightningFlash);
		}
		else
		{
			return FALSE;
		};

		return TRUE;
	};

	// Schwarzer Novize

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1030_SNOV_Abdi_MT))
	|| (slf.npctype == NPCTYPE_NW_SCHWARZERNOVIZE)
	{
		if (slf.attribute[ATR_HITPOINTS] < (slf.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (slf.attribute[ATR_MANA] >= SPL_Cost_LightHeal)
		&& (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			if (Npc_HasItems(slf, ItRu_LightHeal) == 0)
			{
				CreateInvItems	(slf, ItRu_LightHeal, 1);
			};

			B_ReadySpell (slf, SPL_LightHeal, SPL_Cost_LightHeal);
		}
		else if (slf.attribute[ATR_MANA] >= SPL_Cost_SuckEnergy)
		&& (slf.attribute[ATR_HITPOINTS] >= (self.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			if (Npc_HasItems (slf, ItRu_SuckEnergy) == 0)
			{
				CreateInvItems (slf, ItRu_SuckEnergy, 1);
			};

			B_ReadySpell (slf, SPL_SuckEnergy, SPL_Cost_SuckEnergy);
		}
		else
		{
			return FALSE;
		};

		return TRUE;
	};

	// Schwarzmagier

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_515_KDS_Myxir_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7448_KDS_Myxir_IR))
	|| (slf.npctype == NPCTYPE_PAT_SCHWARZERMAGIER)
	{
		if (slf.attribute[ATR_HITPOINTS] < (slf.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (slf.attribute[ATR_MANA] >= SPL_Cost_MediumHeal)
		&& (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			if (Npc_HasItems(slf, ItRu_MediumHeal) == 0)
			{
				CreateInvItems	(slf, ItRu_MediumHeal, 1);
			};

			B_ReadySpell (slf, SPL_MediumHeal, SPL_Cost_MediumHeal);
		}
		else if (slf.attribute[ATR_MANA] >= SPL_Cost_EnergyBall)
		&& (slf.attribute[ATR_HITPOINTS] >= (self.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			if (Npc_HasItems (slf, ItRu_BeliarsRage) == 0)
			{
				CreateInvItems (slf, ItRu_BeliarsRage, 1);
			};

			B_ReadySpell (slf, SPL_EnergyBall, SPL_Cost_EnergyBall);
		}
		else
		{
			return FALSE;
		};

		return TRUE;
	};

	// Dämonenbeschwörer

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_473_DMB_Andokai_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_513_DMB_Xardas_NW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_514_DMB_Karras_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_678_DMB_Xardas_AW))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_680_DMB_Xardas_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_843_DMB_Xardas_GDG))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_6007_DMB_Andokai_GDG))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_6008_DMB_Karras_GDG))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1896_DMB_Karras_MT))
	{
		if (slf.attribute[ATR_HITPOINTS] < (slf.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (slf.attribute[ATR_MANA] >= SPL_Cost_FullHeal)
		&& (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			if (Npc_HasItems(slf, ItRu_FullHeal) == 0)
			{
				CreateInvItems	(slf, ItRu_FullHeal, 1);
			};

			B_ReadySpell (slf, SPL_FullHeal, SPL_Cost_FullHeal);
		}
		else if (slf.attribute[ATR_MANA] >= SPL_Cost_BreathOfDeath)
		&& (slf.attribute[ATR_HITPOINTS] >= (self.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			if (Npc_HasItems (slf, ItRu_BreathOfDeath) == 0)
			{
				CreateInvItems (slf, ItRu_BreathOfDeath, 1);
			};

			B_ReadySpell (slf, SPL_BreathOfDeath, SPL_Cost_BreathOfDeath);
		}
		else
		{
			return FALSE;
		};

		return TRUE;
	};

	// Dämonenbeschwörer 2

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1775_DMB_Beschwoerer_PAT))
	{
		if (Mod_HasSummonedDragon == FALSE)
		{
			if (Npc_HasItems(slf, ItRu_SumDragon) == 0)
			{
				CreateInvItems	(slf, ItRu_SumDragon, 1);
			};

			B_ReadySpell (slf, SPL_SummonDragon, SPL_Cost_SummonDragon);
		}
		else if (slf.attribute[ATR_HITPOINTS] < (slf.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (slf.attribute[ATR_MANA] >= SPL_Cost_FullHeal)
		&& (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			if (Npc_HasItems(slf, ItRu_FullHeal) == 0)
			{
				CreateInvItems	(slf, ItRu_FullHeal, 1);
			};

			B_ReadySpell (slf, SPL_FullHeal, SPL_Cost_FullHeal);
		}
		/*else if (slf.attribute[ATR_MANA] >= SPL_Cost_BreathOfDeath)
		&& (slf.attribute[ATR_HITPOINTS] >= (self.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			if (Npc_HasItems (slf, ItRu_BreathOfDeath) == 0)
			{
				CreateInvItems (slf, ItRu_BreathOfDeath, 1);
			};

			B_ReadySpell (slf, SPL_BreathOfDeath, SPL_Cost_BreathOfDeath);
		}*/
		else
		{
			return FALSE;
		};

		return TRUE;
	};

	// Gurus

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_2007_GUR_BaalOrun_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_2004_GUR_BaalNamib_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_2005_GUR_CorCadar_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_2006_GUR_BaalTyon_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_2003_GUR_BaalTondral_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_2013_PSINOV_Joru_MT))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7457_GUR_BaalNamib_IR))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1116_PSINOV_Caine_MT))
	{
		if (slf.attribute[ATR_HITPOINTS] < (slf.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (slf.attribute[ATR_MANA] >= SPL_Cost_FullHeal)
		&& (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			if (Npc_HasItems(slf, ItRu_FullHeal) == 0)
			{
				CreateInvItems	(slf, ItRu_FullHeal, 1);
			};

			B_ReadySpell (slf, SPL_FullHeal, SPL_Cost_FullHeal);
		}
		else if (slf.attribute[ATR_MANA] >= SPL_Cost_Windfist)
		&& (slf.attribute[ATR_HITPOINTS] >= (self.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			if (Npc_HasItems (slf, ItRu_Windfist) == 0)
			{
				CreateInvItems (slf, ItRu_Windfist, 1);
			};

			B_ReadySpell (slf, SPL_Windfist, SPL_Cost_Windfist);
		}
		else
		{
			CreateInvItem	(self, ItPo_Mana_Addon_04);
			B_UseItem	(self, ItPo_Mana_Addon_04);
		};

		return TRUE;
	};

	// Priester

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1951_Priester_NW))
	{
		if (slf.attribute[ATR_HITPOINTS] < (slf.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (slf.attribute[ATR_MANA] >= SPL_Cost_MediumHeal)
		&& (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		{
			if (Npc_HasItems(slf, ItRu_MediumHeal) == 0)
			{
				CreateInvItems	(slf, ItRu_MediumHeal, 1);
			};

			B_ReadySpell (slf, SPL_MediumHeal, SPL_Cost_MediumHeal);
		}
		else if (slf.attribute[ATR_MANA] >= SPL_Cost_Firestorm)
		&& (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		&& (slf.attribute[ATR_HITPOINTS] >= (self.attribute[ATR_HITPOINTS_MAX] / 4))
		{
			if (Npc_HasItems (slf, ItRu_Firestorm) == 0)
			{
				CreateInvItems (slf, ItRu_Firestorm, 1);
			};

			B_ReadySpell (slf, SPL_Firestorm, SPL_Cost_Firestorm);
		}
		else
		{
			return FALSE;
		};

		return TRUE;
	};

	// Ryan

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_1942_Ryan_NW))
	{
		if (slf.attribute[ATR_HITPOINTS] < (slf.attribute[ATR_HITPOINTS_MAX] / 4))
		&& (slf.attribute[ATR_MANA] >= SPL_Cost_FullHeal)
		{
			if (Npc_HasItems(slf, ItRu_FullHeal) == 0)
			{
				CreateInvItems	(slf, ItRu_FullHeal, 1);
			};

			B_ReadySpell (slf, SPL_FullHeal, SPL_Cost_FullHeal);
		}
		else if (slf.attribute[ATR_HITPOINTS] >= (self.attribute[ATR_HITPOINTS_MAX] / 4))
		{
			if (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
			{
				if (slf.attribute[ATR_MANA] >= SPL_Cost_Icelance)
				{
					if (Npc_HasItems (slf, ItRu_Icelance) == 0)
					{
						CreateInvItems (slf, ItRu_Icelance, 1);
					};

					B_ReadySpell (slf, SPL_Icelance, SPL_Cost_Icelance);
				};
			}
			else
			{
				if (slf.attribute[ATR_MANA] >= SPL_Cost_InstantFireball)
				{
					if (Npc_HasItems (slf, ItRu_InstantFireball) == 0)
					{
						CreateInvItems (slf, ItRu_InstantFireball, 1);
					};

					B_ReadySpell (slf, SPL_InstantFireball, SPL_Cost_InstantFireball);
				};
			};
		}
		else
		{
			return FALSE;
		};

		return TRUE;
	};


	// ------ Skelett Magier ------
	if (slf.guild == GIL_SKELETON_MAGE)
	{
		if (Npc_HasItems (slf, ItRu_SumSkel) == 0)
		{
			CreateInvItems (slf, ItRu_SumSkel, 1);
		};
		
		if (Npc_HasItems (slf, ItRu_IceCube) == 0)
		{
			CreateInvItems (slf, ItRu_IceCube, 1);
		};
		
		if (Npc_HasItems (slf, ItRu_Icebolt) == 0)
		{
			CreateInvItems (slf, ItRu_Icebolt, 1);
		};
		
			// ------ Spruchzyklus bei SUMMON beginnen ------
			if (slf.aivar[AIV_SelectSpell] >= 6)
			{
				slf.aivar[AIV_SelectSpell] = 1;
			};
		
		if (!Npc_IsInState (oth, ZS_MagicFreeze))
		&& (slf.aivar[AIV_SelectSpell] == 0)
		{
			B_ReadySpell (slf, SPL_IceCube,	SPL_Cost_IceCube);
			return TRUE;
		}
		/*else if (slf.aivar[AIV_SelectSpell] == 1)
		{
			B_ReadySpell (slf, SPL_SummonSkeleton, SPL_Cost_SummonSkeleton);
			return TRUE;
		}*/
		else
		{
			B_ReadySpell (slf, SPL_Icelance, SPL_Cost_Icelance);
			return TRUE;
		};
	};
	
	// ------ Eisgolem ------
	if (slf.guild == GIL_ICEGOLEM)
	|| ((slf.guild == GIL_SUMMONED_GOLEM)
	&& (slf.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_ICEGOLEM))
	{
		if (Npc_HasItems (slf, ItRu_InstantIceball) == 0)
		{
			CreateInvItems (slf, ItRu_InstantIceball, 1);
		};
		
		if ((Npc_GetDistToNpc(slf,oth) < FIGHT_DIST_MELEE) 
		|| (Npc_IsInState (oth, ZS_MagicFreeze)))
		&& (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Icegolem_Griselda_01))
		{
			return FALSE; //Nahkampfangriff
		}
		else
		{
			B_ReadySpell (slf, SPL_InstantIceball,	SPL_Cost_InstantIceball);
			return TRUE;
			
		};
	};
	
	// ------ Feuergolem ------
	if ((slf.guild == GIL_FIREGOLEM)
	&& (slf.aivar[AIV_MM_REAL_ID] != ID_BALROG))
	|| ((slf.guild == GIL_SUMMONED_GOLEM)
	&& (slf.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_FIREGOLEM))
	{
		if (Npc_HasItems (slf, ItRu_InstantFireball) == 0)
		{
			CreateInvItems (slf, ItRu_InstantFireball, 1);
		};
		
		if (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_MELEE)
		|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Firegolem_Griselda_01))
		{
			B_ReadySpell (slf, SPL_InstantFireball,	SPL_Cost_InstantFireball);
			return TRUE;
		}
		else
		{
			return FALSE; //Nahkampfangriff
		};
	};
	

	// ------ Sumpfdrache ------
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Wasserdrache_11054_DT))
	{
		if (Npc_HasItems (slf, ItRu_Waterfist) == 0)
		{
			CreateInvItems (slf, ItRu_Waterfist, 1);
		};
		
		if (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_DRAGON_MAGIC)
		{
			B_ReadySpell (slf, SPL_Waterfist, SPL_Cost_Waterfist);
			return TRUE;
		}
		else
		{
			return FALSE; //Nahkampfangriff
		};
	};
	

	// ------ Sumpfdrache ------
	if (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_SWAMP)
	{
		if (Npc_HasItems (slf, ItRu_InstantFireball) == 0)
		{
			CreateInvItems (slf, ItRu_InstantFireball, 1);
		};
		
		if (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_DRAGON_MAGIC)
		{
			B_ReadySpell (slf, SPL_InstantFireball, SPL_Cost_InstantFireball);
			return TRUE;
		}
		else
		{
			return FALSE; //Nahkampfangriff
		};
	};
	
	// ------ Felsdrache ------
	if (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ROCK)
	|| (slf.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_STONEDRAGON)
	{
		if (Npc_HasItems (slf, ItRu_InstantFireball) == 0)
		{
			CreateInvItems (slf, ItRu_InstantFireball, 1);
		};
		
		if (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_DRAGON_MAGIC)
		{
			B_ReadySpell (slf, SPL_InstantFireball, SPL_Cost_InstantFireball);
			return TRUE;
		}
		else
		{
			return FALSE; //Nahkampfangriff
		};
	};
	
	// ------ Feuerdrache ------
	if (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_FIRE)
	|| (slf.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_FIREDRAGON)
	{
		if (Npc_HasItems (slf, ItRu_InstantFireball) == 0)
		{
			CreateInvItems (slf, ItRu_InstantFireball, 1);
		};
		
		if (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_DRAGON_MAGIC)
		{
			B_ReadySpell (slf, SPL_InstantFireball, SPL_Cost_InstantFireball);
			return TRUE;
		}
		else
		{
			return FALSE; //Nahkampfangriff
		};
	};
	
	// ------ Eisdrache ------
	if (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ICE)
	|| (slf.aivar[AIV_MM_REAL_ID] == ID_SUMMONED_ICEDRAGON)
	{

		if (Npc_HasItems (slf, ItRu_InstantIceball) == 0)
		{
			CreateInvItems (slf, ItRu_InstantIceball, 1);
		};
		
		if (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_DRAGON_MAGIC)
		{
			B_ReadySpell (slf, SPL_InstantIceball, SPL_Cost_InstantIceball);
			return TRUE;
		}
		else
		{
			return FALSE; //Nahkampfangriff
		};
	};
	
	// ------ Untoter Drache (ENDGEGNER) ------
	if (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD)
	{
		Npc_ClearAIQueue(self);
		if (Npc_HasItems (slf, ItRu_Deathball) == 0)
		{
			CreateInvItems (slf, ItRu_Deathball, 1);
		};
		
		if (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_DRAGON_MAGIC)
		&& (slf.attribute[ATR_MANA] >= SPL_Cost_Deathball)
		{
			B_ReadySpell (slf, SPL_Deathball, SPL_Cost_Deathball);	
			return TRUE;
		}
		else
		{
			if (Npc_HasItems (slf, ItRu_SummonGeist) == 0)
			{
				CreateInvItems (slf, ItRu_SummonGeist, 1);
			};

			if (Hlp_Random(100) < 25)
			&& (slf.attribute[ATR_MANA] >= SPL_Cost_SummonGeist)
			{
				B_ReadySpell (slf, SPL_SummonGeist, SPL_Cost_SummonGeist);	
				return TRUE;
			};

			return FALSE; //Nahkampfangriff
		};
	};

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Xeres_02))
	{
		if (Mod_Xeres_Kampfphase == 1)
		{
			if (Npc_HasItems(slf, ItRu_SummonGeist) == 0)
			{
				CreateInvItems	(slf, ItRu_SummonGeist, 1);
			};

			if (Mod_Xeres_Geister < 20)
			{
				B_ReadySpell (slf, SPL_SummonGeist, SPL_Cost_SummonGeist);
				return TRUE;
			}
			else
			{
				Npc_ClearAIQueue	(self);
				AI_StandUp	(self);
			};
		}
		else if (Mod_Xeres_Kampfphase == 2)
		{
			if (self.attribute[ATR_HITPOINTS] >= self.attribute[ATR_HITPOINTS_MAX]/2)
			{
				return FALSE;
			}
			else
			{
				if (Npc_HasItems(slf, ItRu_Giftteppich) == 0)
				{
					CreateInvItems	(slf, ItRu_Giftteppich, 1);
				};

				if (Mod_XW_Kap6 == 9)
				{
					if (Npc_GetDistToWP(hero, "ARENA_01") < 1000)
					{
						AI_PlayAni	(hero, "T_EXPLOSION");
					};

					B_ReadySpell (slf, SPL_Giftteppich, SPL_Cost_Giftteppich);
					return TRUE;
				}
				else
				{
					Npc_ClearAIQueue	(self);
					AI_StandUp	(self);
				};
			};
		}
		else if (Mod_Xeres_Kampfphase == 3)
		{
			if (Npc_HasItems(slf, ItRu_InstantFireball) == 0)
			{
				CreateInvItems	(slf, ItRu_InstantFireball, 1);
			};

			if (!Npc_IsDead(Mod_7765_SLD_Gorn_XW))
			{
				B_ReadySpell (slf, SPL_InstantFireball, SPL_Cost_InstantFireball);
				return TRUE;
			}
			else
			{
				Npc_ClearAIQueue	(self);
				AI_StandUp	(self);
			};
		};
	};
	
	// ------ Ork Schamane ------
	if (slf.aivar[AIV_MM_REAL_ID] == ID_ORCSHAMAN)
	{
		if (Npc_HasItems (slf, ItRu_InstantFireball) == 0)
		{
			CreateInvItems (slf, ItRu_InstantFireball, 1);
		};
				
		B_ReadySpell (slf, SPL_InstantFireball, SPL_Cost_InstantFireball);
		return TRUE;
	};

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Orc_Priest_1))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Orc_Priest_2))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Orc_Priest_3))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Orc_Priest_4))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Orc_Priest_5))
	{
		if (Npc_HasItems (slf, ItRu_BreathofDeath) == 0)
		{
			CreateInvItems (slf, ItRu_BreathofDeath, 1);
		};
				
		B_ReadySpell (slf, SPL_BreathofDeath, SPL_Cost_BreathofDeath);
		return TRUE;
	};
	
	return FALSE; //alle anderen Gilden		
};   
