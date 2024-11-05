// *******************************************************
// B_AssessPlayer
// --------------
// Aufgerufen durch aktive Wahrnehmung PERC_ASSESSPLAYER.
// Spieler wurde GESEHEN (Humans haben keinen sense_smell)
// Reichweite: PERC_DIST_ACTIVE_MAX
// *******************************************************

func void B_AssessPlayer ()
{
	// EXIT IF

	B_Vergiftet (self);

	if (Wld_IsTime(21,00,05,00))
	&& (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(hero))
	{
		if (!HeroAtLight)
		{
			HeroAtLight = 1 + C_HeroAtLight(); // sekündlich checken, ob Held in der Nähe einer Lampe ist
		};

		if (HeroAtLight == 1)
		{
			if (Npc_GetWalkMode(hero) == NPC_SNEAK)
			{
				if (Npc_GetDistToNpc(self, hero) > 200)
				{
					return;
				};
			}
			else if (Npc_GetWalkMode(hero) == NPC_WALK)
			{
				if (Npc_GetDistToNpc(self, hero) > 300)
				{
					return;
				};
			}
			else
			{
				if (Npc_GetDistToNpc(self, hero) > 400)
				{
					return;
				};
			};
		};
	};

	if (C_NpcIsHero(other))
	&& (Unsichtbarkeitsperk == TRUE)
	{
		return;
	};

	if (CurrentLevel == HALLUZINATION_ZEN)
	&& (self.guild > GIL_SEPERATOR_HUM)	{
		return;
	};

	if (CurrentLevel == EISGEBIET_ZEN) {
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7643_HEX_Griselda_EIS))
		&& (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(hero))
		&& (playerIsTransformed) {
			return;
		};

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Monster_11039_Shivar_EIS))
		&& (other.guild == GIL_DEMON) {
			B_Attack	(self, other, AR_None, 0);
			return;
		};

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Monster_11039_Shivar_EIS))
		&& (C_NpcIsHero(other))
		&& (Mod_HeroIstDemon == FALSE) {
			B_Attack	(self, hero, AR_None, 0);
			return;
		} else if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Monster_11039_Shivar_EIS))
		&& (C_NpcIsHero(other))
		&& (Mod_HeroIstDemon == TRUE) {
			Npc_SetTempAttitude (self, ATT_FRIENDLY);
		};
	};

	var C_Item itm;
	var C_Item Weapon;

	Weapon = Npc_GetEquippedMeleeWeapon(other);

	if (CurrentLevel == NEWWORLD_ZEN)
	{
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_753_NOV_Ulf_NW))
		&& (Mod_HQ_Daemonisch_SP_01 == 2)
		&& (C_NpcIsHero(other))
		&& (Mod_HQ_Daemonisch == 5)
		{
			B_Attack	(self, other, AR_None, 0);
			return;
		};

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_541_NONE_Till_NW))
		&& (Mod_HQ_Daemonisch_SP_02 == 2)
		&& (C_NpcIsHero(other))
		&& (Mod_HQ_Daemonisch == 5)
		{
			B_Attack	(self, other, AR_None, 0);
			return;
		};

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_754_NONE_Valentino_NW))
		&& (Mod_HQ_Daemonisch_SP_03 == 2)
		&& (C_NpcIsHero(other))
		&& (Mod_HQ_Daemonisch == 5)
		{
			B_Attack	(self, other, AR_None, 0);
			return;
		};

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7368_JG_Jaeger_NW))
		&& (B_GetAivar(other, AIV_INVINCIBLE) == FALSE)
		&& (!C_NpcIsDown(Mod_7106_ASS_Ramsi_NW))
		{
			B_Attack	(self, Mod_7106_ASS_Ramsi_NW, AR_NONE, 0);
			return;
		};

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7366_JG_Jaeger_NW))
		&& (B_GetAivar(other, AIV_INVINCIBLE) == FALSE)
		{
			B_Attack	(self, hero, AR_NONE, 0);
			return;
		};

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7368_JG_Jaeger_NW))
		&& (C_NpcIsDown(Mod_7106_ASS_Ramsi_NW))
		&& (!Npc_KnowsInfo(hero, Info_Mod_Ramsi_KeilerFleischWeg))
		{
			B_StartOtherRoutine	(self, "FLUCHT");
			return;
		};

		if ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1969_BDT_Bandit_NW))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1970_BDT_Bandit_NW))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1971_BDT_Bandit_NW)))
		{
			B_Attack	(self, other, AR_Kill, 0);
			return;
		};

		if ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_783_BAU_Elena_NW))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_104_BAU_Rega_NW))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1403_BAU_Baeuerin_NW)))
		&& (Npc_GetDistToWP(hero, "NW_BIGFARM_FOREST_08") < 1000)
		&& (((Mod_TrfWoman == 0)
		&& (Mod_WM_Hexenritual == 0))
		|| (Mod_HexenAttack == 1))
		{
			B_Attack	(self, other, AR_Kill, 0);
			return;
		};

		if ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7026_OUT_Entfuehrer_NW))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7027_OUT_Entfuehrer_NW))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7028_OUT_Entfuehrer_NW))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7029_OUT_Entfuehrer_NW))
		|| ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7030_OUT_Entfuehrer_NW))
		&& (Npc_GetDistToWP(self, "NW_CITY_JAEGER_13") < 300))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7031_OUT_Entfuehrer_NW))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7032_OUT_Entfuehrer_NW)))
		{
			if (C_NpcIsHero(other))
			&& (Npc_GetDistToNpc(self, hero) < 700)
			{
				B_Attack	(self, hero, AR_GuildEnemy, 0);
			};
		};
	};

	if (Mod_IsRabbit == 1)
	{
		return;
	};

	if (CurrentLevel == RELENDEL_ZEN)
	{
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7531_JG_Wilderer_REL))
		&& (Mod_IstKeiler == 1)
		&& (Npc_IsPlayer(other))
		&& (Mod_WildererFlucht == 0)
		{
			B_StartOtherRoutine	(self, "FLUCHT");

			Mod_WildererFlucht = 1;

			return;
		};

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Monster_11038_Shivar_REL))
		&& (other.guild == GIL_DEMON)
		{
			B_Attack	(self, other, AR_None, 0);
			return;
		};

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Monster_11038_Shivar_REL))
		&& (C_NpcIsHero(other))
		&& (Mod_HeroIstDemon == FALSE)
		{
			B_Attack	(self, hero, AR_None, 0);
			return;
		}
		else if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Monster_11038_Shivar_REL))
		&& (C_NpcIsHero(other))
		&& (Mod_HeroIstDemon == TRUE)
		{
			Npc_SetTempAttitude (self, ATT_FRIENDLY);
		};
	};

	if (self.guild == GIL_DRACONIAN)
	&& (C_NpcIsHero(other))
	&& (Mod_Echsis == 1)
	{
		B_Attack	(self, other, AR_GuildEnemy, 0);
		return;
	};

	if ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Kleindrache))
	|| (self.aivar[AIV_MM_REAL_ID] == ID_KOBOLD)
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Schrat_11011_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Schrat_11019_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Schrat_11020_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Schrat_11021_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Schrat_11022_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Feuerdrache_11002_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Knucker_11001_NW)))
	&& (Npc_KnowsInfo(hero, Info_Mod_Dragon_Kamm))
	{
		self.flags = 0;
		B_Attack	(self, other, AR_GuildEnemy, 0);
		return;
	};

	if (CurrentLevel == ORCGRAVEYARD_ZEN)
	{
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_10033_ORC_UndeadShamane_OGY))
		&& (C_NpcIsHero(other))
		&& ((Npc_GetDistToWP(self, "GRYD_020") < 500)
		|| (Npc_GetDistToWP(self, "GRYD_048") < 500))
		{
			B_Attack	(self, hero, AR_None, 0);
			return;
		};

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_10033_ORC_UndeadShamane_OGY))
		{
			return;
		};
	};

	if (Hlp_IsValidItem(weapon))
	{
		if (((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_518_SMK_Scar_MT))
		&& (Hlp_IsItem(Weapon, Scars_Schwert) == TRUE))
		|| (((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_525_SLD_Lee_MT))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_6006_SLD_Lee_GDG)))
		&& (Hlp_IsItem(Weapon, Lees_Axt) == TRUE))
		|| ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_966_GRD_Thorus_MT))
		&& (Hlp_IsItem(Weapon, Thorus_Schwert) == TRUE))
		|| ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1105_EBR_Arto_MT))
		&& (Hlp_IsItem(Weapon, Artos_Schwert) == TRUE))
		|| (((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_520_DMR_Raven_MT))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_6001_DMR_Raven_GDG)))
		&& (Hlp_IsItem(Weapon, Rabenrecht) == TRUE))
		|| ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1106_EBR_Bartholo_MT))
		&& (Hlp_IsItem(Weapon, Prankenhieb) == TRUE)))
		{
			B_Attack (self, other, AR_Theft, 0);
			return;
		};
	};

	if (self.aivar[AIV_IgnoresArmor] == FALSE)
	{
		self.aivar[AIV_IgnoresArmor] = TRUE;
	};

	var C_Item RuessiCheck;
	RuessiCheck = Npc_GetEquippedArmor(hero);

	if (C_NpcIsHero(other))
	&& ((self.npctype == NPCTYPE_MT_TEMPLER)
	|| (self.npctype == NPCTYPE_MT_SUMPFNOVIZE))
	&& (Hlp_IsItem(RuessiCheck, ItAr_Sumpfkraut) == TRUE)
	{
		AI_StartState	(self, ZS_ObservePlayer, 0, "");
		return;
	};

	if (C_NpcIsHero(other))
	&& ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7203_BK_Straschiduo_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7244_BlutkultKrieger_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7525_BlutkultKrieger_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7526_BlutkultMagier_NW)))
	&& ((Hlp_IsItem(RuessiCheck, ItAr_KDW_L_Addon) == TRUE)
	|| (Hlp_IsItem(RuessiCheck, ITAR_WKR_S) == TRUE)
	|| (Hlp_IsItem(RuessiCheck, ITAR_Wassernovize1) == TRUE)
	|| (Hlp_IsItem(RuessiCheck, ITAR_WNOV_S) == TRUE)
	|| (Hlp_IsItem(RuessiCheck, ITAR_KDW_H) == TRUE)
	|| (Hlp_IsItem(RuessiCheck, ITAR_WKR_H) == TRUE))
	{
		Mod_WM_BlutkultAttack = 1;
	};

	if (self.npctype == NPCTYPE_MT_GARDIST)
	&& (C_NpcIsHero(other))
	&& ((Hlp_IsItem(RuessiCheck, ItAr_SLD_Logan) == TRUE)
	|| (Hlp_IsItem(RuessiCheck, ItAr_SLD_L) == TRUE)
	|| (Hlp_IsItem(RuessiCheck, ItAr_SLD_M) == TRUE)
	|| (Hlp_IsItem(RuessiCheck, ItAr_SLD_H) == TRUE)
	|| (Hlp_IsItem(RuessiCheck, ItAr_SLD_H2) == TRUE)
	|| (Hlp_IsItem(RuessiCheck, ItAr_DJG_L) == TRUE)
	|| (Hlp_IsItem(RuessiCheck, ItAr_DJG_M) == TRUE)
	|| (Hlp_IsItem(RuessiCheck, ItAr_DJG_H) == TRUE))
	&& (Mod_Spell_BeliarCity == FALSE)
	{
		B_Attack (self, hero, AR_Kill, 0);
		return;
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1520_TB_Totenbeschwoerer_AW))
	&& (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(hero))
	{
		B_Attack (self, other, AR_GuildEnemy, 0);
		return;
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1553_PIR_GEISTERPIRAT_DI))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Xeres_01))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Schattenlord_877_Urnol))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Schattenlord_542_Urnol))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1774_KDF_Orakel_PAT))
	{
		self.flags = 2;
	};

	if ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_4028_Schlaeger_01_NW))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_4029_Schlaeger_02_NW)))
	&& (C_NpcIsHero(other))
	{
		B_Attack	(self, other, AR_GuildEnemy, 0);
		return;
	};

	if (CurrentLevel == MINENTAL_ZEN)
	{
		if ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1110_GRD_Cutter_MT))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_943_GRD_Bloodwyn_MT)))
		&& (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(hero))
		&& (Npc_CanSeeNpc (self, hero))
		&& (Wld_IsTime	(02,00,03,00))
		&& (Mod_PDV_Fisk_Infos == 2)
		{
			AI_TurnToNpc	(self, hero);

			if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1110_GRD_Cutter_MT))
			{
				AI_Output(self, hero, "Info_Mod_Cutter_Erwischt_08_00"); //Verdammt, weg hier!
			}
			else
			{
				AI_Output(self, hero, "Info_Mod_Bloodwyn_Erwischt_04_00"); //Verdammt, weg hier!
			};

			B_StartOtherRoutine	(Mod_1110_GRD_Cutter_MT, "FLUCHT");
			B_StartOtherRoutine	(Mod_943_GRD_Bloodwyn_MT, "FLUCHT");

			B_LogEntry	(TOPIC_MOD_PDV, "Bloodwyn und Cutter sind also die Schuldigen. Das wird Thorus sicher interessieren.");

			Mod_PDV_Fisk_Infos = 3;
		};
	};

	if (C_IsBandit(self))
	{
		if (!Npc_KnowsInfo(hero, Info_Mod_Dexter_Alissandro))
		&& (!Npc_KnowsInfo(hero, Info_Mod_Sancho_Parole))
		&& (!Npc_KnowsInfo(hero, Info_Mod_Sancho_Dam3))
		{
			B_Attack	(self, hero, AR_Kill, 0);
		}
		else
		{
			B_SetAttitude (self, ATT_FRIENDLY);
		};
	};

	if (CurrentLevel == DIEINSEL_ZEN)
	{
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1553_PIR_GEISTERPIRAT_DI))
		{
			B_Attack(self, hero, AR_GuildEnemy, 0);
			return;
		};
	};

	if (CurrentLevel == XERESWELT_ZEN)
	{
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Xeres_03))
		{
			if (Hlp_IsValidNpc(PC_Friend_XW))
			{
				if (Npc_IsDead(PC_Friend_XW))
				{
					B_Attack(self, hero, AR_GuildEnemy, 0);
					self.flags = 0;
					return;
				};
			};
		};

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PC_Friend_XW))
		&& (Mod_Argez_PrepareToDie)
		{
			self.flags = 0;
		};

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Xeres_02))
		{
			self.flags = 0;
		};
	};

	// ------- TESTMODE: Levelinspektor wird ignoriert ------
	var C_NPC PCL; PCL = Hlp_GetNpc(PC_Levelinspektor);
	if (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(PCL))
	{
		return;
	};

	// ------ SC im Dialog ------
	if (B_GetAivar(other, AIV_INVINCIBLE) == TRUE)
	{
		return;
	};

	// ------ Ignorieren, wenn SC tot, ohnmächtig oder in magischem Schlaf ------
	if (C_NpcIsDown (other))
	{
		return;
	};

	itm = Npc_GetEquippedArmor(other);

	if (self.guild == GIL_KDF)
	&& (CurrentLevel == PATHERION_ZEN)
	&& (Mod_Enter_PAT_Second == FALSE)
	{
		B_Attack	(self, other, AR_Kill, 0);
		return;
	}
	else if (self.guild == GIL_KDF)
	&& (CurrentLevel == PATHERION_ZEN)
	&& (Mod_Enter_PAT_Second == TRUE)
	{
		B_SetAttitude (self, ATT_FRIENDLY);
	};

	if (Kapitel < 4)
	{
		if (((self.guild == GIL_MIL)
		|| (C_NpcIsBandit(self)))
		&& ((Hlp_IsItem(itm, ITAR_MIL_L) == TRUE)
		|| (Hlp_IsItem(itm, ITAR_MIL_M) == TRUE)
		|| (Hlp_IsItem(itm, ITAR_PAL_M) == TRUE)
		|| (Hlp_IsItem(itm, ITAR_PAL_H) == TRUE)
		|| (Hlp_IsItem(itm, ITAR_PAL_TIGER) == TRUE)
		|| (Hlp_IsItem(itm, ITAR_MIL_s2) == TRUE)))
		{
			// FUNC

			if (Mod_Spell_BeliarCity == FALSE)
			{
				B_Attack (self, other, AR_Kill, 0);
				return;
			};
		}
		else if (self.guild == GIL_PAL)
		&& ((Hlp_IsItem(itm, ITAR_SLD_L) == TRUE)
		|| (Hlp_IsItem(itm, ITAR_SLD_M) == TRUE)
		|| (Hlp_IsItem(itm, ITAR_SLD_H) == TRUE)
		|| (Hlp_IsItem(itm, ITAR_DJG_L) == TRUE)
		|| (Hlp_IsItem(itm, ITAR_DJG_M) == TRUE)
		|| (Hlp_IsItem(itm, ITAR_DJG_H) == TRUE)
		|| (Hlp_IsItem(itm, ITAR_DRACHENTROLL) == TRUE)
		|| (Hlp_IsItem(itm, ITAR_DJG_BABE) == TRUE)
		|| (Hlp_IsItem(itm, ITAR_XARDAS) == TRUE)
		|| (Hlp_IsItem(itm, Schwarzmagierrobe) == TRUE)
		|| (Hlp_IsItem(itm, ITAR_RAVEN_ADDON) == TRUE)
		|| (Hlp_IsItem(itm, ITAR_NOV_DMB_01) == TRUE)
		|| (Hlp_IsItem(itm, ITAR_SNOV_S) == TRUE)
		|| (Hlp_IsItem(itm, ITAR_SKR_s) == TRUE)
		|| (Hlp_IsItem(itm, ITAR_SNOV_L) == TRUE)
		|| (Hlp_IsItem(itm, ITAR_BDT_M_01) == TRUE)
		|| (Hlp_IsItem(itm, ITAR_BDT_H_01) == TRUE))
		{
			if (Mod_Spell_BeliarCity == FALSE)
			{
				B_Attack (self, other, AR_Kill, 0);
				return;
			};
		}
		else if (self.guild == GIL_VLK)
		&& ((Hlp_IsItem(itm, ITAR_XARDAS) == TRUE)
		|| (Hlp_IsItem(itm, Schwarzmagierrobe) == TRUE)
		|| (Hlp_IsItem(itm, ITAR_RAVEN_ADDON) == TRUE)
		|| (Hlp_IsItem(itm, ITAR_NOV_DMB_01) == TRUE)
		|| (Hlp_IsItem(itm, ITAR_SNOV_L) == TRUE)
		|| (Hlp_IsItem(itm, ITAR_SNOV_S) == TRUE)
		|| (Hlp_IsItem(itm, ITAR_SKR_s) == TRUE))
		{
			if (Mod_Spell_BeliarCity == FALSE)
			{
				B_Attack (self, other, AR_Kill, 0);
				return;
			};
		}
		else if (self.guild == GIL_KDF)
		&& ((Hlp_IsItem(itm, ITAR_NOV_L) == TRUE)
		|| (Hlp_IsItem(itm, ITAR_NOV_M) == TRUE)
		|| (Hlp_IsItem(itm, ITAR_KDF_L) == TRUE)
		|| (Hlp_IsItem(itm, ITAR_KDF_H) == TRUE)
		|| (Hlp_IsItem(itm, ITAR_KDF_L_FEUER) == TRUE)
		|| (Hlp_IsItem(itm, ITAR_KDF_VERYHIGH) == TRUE))
		{
			if (Mod_Spell_BeliarCity == FALSE)
			{
				B_Attack (self, other, AR_Kill, 0);
				return;
			};
		}
		else if (((self.guild == GIL_OUT)
		|| (self.guild == GIL_DMT))
		&& ((self.npctype == NPCTYPE_MT_GARDIST)
		|| (self.npctype == NPCTYPE_MT_SCHATTEN)
		|| (self.npctype == NPCTYPE_MT_BUDDLER)))
		&& ((Hlp_IsItem(itm, ITAR_SLD_L) == TRUE)
		|| (Hlp_IsItem(itm, ITAR_SLD_M) == TRUE)
		|| (Hlp_IsItem(itm, ITAR_SLD_S) == TRUE)
		|| (Hlp_IsItem(itm, ITAR_SLD_H) == TRUE)
		|| (Hlp_IsItem(itm, ITAR_OJG_S) == TRUE)
		|| (Hlp_IsItem(itm, ITAR_DJG_L) == TRUE)
		|| (Hlp_IsItem(itm, ITAR_DJG_M) == TRUE)
		|| (Hlp_IsItem(itm, ITAR_DJG_H) == TRUE))
		{
			if (Mod_Spell_BeliarCity == FALSE)
			{
				B_Attack (self, other, AR_Kill, 0);
				return;
			};
		}
		else
		{
			//B_SetAttitude (self, ATT_FRIENDLY);
		};
	};

	if ((self.guild == GIL_OUT)
	&& ((self.npctype == NPCTYPE_MT_GARDIST)
	|| (self.npctype == NPCTYPE_MT_SCHATTEN)
	|| (self.npctype == NPCTYPE_MT_BUDDLER)))
	&& ((Hlp_IsItem(itm, ITAR_SLD_L) == TRUE)
	|| (Hlp_IsItem(itm, ITAR_SLD_M) == TRUE)
	|| (Hlp_IsItem(itm, ITAR_SLD_S) == TRUE)
	|| (Hlp_IsItem(itm, ITAR_SLD_H) == TRUE)
	|| (Hlp_IsItem(itm, ITAR_OJG_S) == TRUE)
	|| (Hlp_IsItem(itm, ITAR_DJG_L) == TRUE)
	|| (Hlp_IsItem(itm, ITAR_DJG_M) == TRUE)
	|| (Hlp_IsItem(itm, ITAR_DJG_H) == TRUE))
	{
		B_Attack (self, hero, AR_Kill, 0);
		return;
	};

	// ------ Spieler ist in ein Monster verwandelt ------
	// ACHTUNG: NSCs haben noch Perm_Attitude zu verwandeltem Player, die Guild-Attitude overridet (d.h. sie sind i.d.R. neutral), weswegen AssessEnemy nicht greift
	if (other.guild > GIL_SEPERATOR_HUM)
	{
		if (C_NpcIsGateGuard (self)) //Wachen müssen auch freudliches/neutrales SC-Monster aufhalten
		{
			AI_StandUpQuick	(self);									//B_Attack hat nur normalen AI_StandUp
			B_Attack (self, other, AR_MonsterCloseToGate, 0);		//angreifen oder fliehen
			return;
		}
		else if (Wld_GetGuildAttitude(self.guild, other.guild) == ATT_HOSTILE)
		{
			// ------ Angriff, mit folgenden Ausnahmen ------
			if (self.aivar[AIV_PARTYMEMBER] == FALSE)
			&& (self.npctype != NPCTYPE_FRIEND)
			{
				B_Attack (self, other, AR_GuildEnemy, 0);
				return;
			};
		};
	};

	// ------ Spieler ist Enemy ------
	if (B_AssessEnemy())
	{
		return;
	};
	// -------- Spieler hat Banditen Rüstung an ------
	if (C_PlayerIsFakeBandit (self,other)
	&& (self.guild != GIL_BDT))
	{
		B_Attack (self,other,AR_GuildEnemy,0);
	};

	// ------ Spieler ist Mörder ------
	if (B_GetPlayerCrime(self) == CRIME_MURDER)
	&& (C_WantToAttackMurder(self, other))
	&& (Npc_GetDistToNpc(self, other) <= PERC_DIST_INTERMEDIAT)
	{
		B_Attack (self, other, AR_HumanMurderedHuman, 0);
		return;
	};

	// ------ SC ist in einem Portalraum, der mir oder meinen Freuden gehört ------
	if (B_AssessEnterRoom())
	{
		return;
	};

	// ------ SC hat irgendeine Waffe bereit -------
	if (B_AssessDrawWeapon())
	{
		return;
	}
	else //FLAG freimachen
	{
		Player_DrawWeaponComment = FALSE;
	};

	// ------ SC schleicht -------
	if (C_BodyStateContains(other, BS_SNEAK))
	{
		if (!Npc_IsInState(self, ZS_ObservePlayer))
		&& (C_WantToReactToSneaker(self, other))
    		{
			Npc_ClearAIQueue	(self);
			B_ClearPerceptions	(self);
			AI_StartState 		(self, ZS_ObservePlayer, 1, "");
			return;
    		};
	}
	else //FLAG freimachen
	{
		if (!C_BodyStateContains(other,BS_STAND)) //+++HACK+++ Sneak-Stand ist KEIN BS_Sneak!
		{
			Player_SneakerComment = FALSE;
		};
	};

	// FLAG freimachen
	if (!C_BodyStateContains(other, BS_LIE))
	{
		Player_GetOutOfMyBedComment = FALSE;
	};


	// FUNC

	//------------------------------------
	//Joly: ImportantInfos für AmbientDMT!

	//------------------------------------

	// ------ Hat NSC Important Info für Spieler? Auch GUARDPASSAGE ------
	if (Npc_GetDistToNpc(self,other) <= PERC_DIST_DIALOG)
	&& (Npc_CheckInfo (self, 1))	//REIHENFOLGE nicht vertauschen! (Check ist dahingehend buggy (darf nicht als erste Abfrage in &&-verknüpfter If-Abfrage stehen))
	{
		// ------ Gate Guards labern IMMER an ------
		if (C_NpcIsGateGuard(self))
		{
			B_SetAivar(self, AIV_NpcStartedTalk, TRUE);

			B_AssessTalk();
			return;
		}
		else //alle anderen NSCs
		{
			// ------- Spieler fällt, schwimmt und taucht NICHT ------
			if (!C_BodyStateContains(other, BS_FALL))
			&& (!C_BodyStateContains(other, BS_SWIM))
			&& (!C_BodyStateContains(other, BS_DIVE))
			// ------- und NUR, wenn keine CRIME vorliegt -------
			&& (B_GetPlayerCrime(self) == CRIME_NONE)
			// ------- und NUR, wenn NSC KEINEN RefuseTalk hat ------
			&& (C_RefuseTalk(self,other) == FALSE)
			// ------- Will ich die FakeArmor kommentieren? ---
			&& (C_PlayerHasFakeGuild (self,other) == FALSE)
			{
				B_SetAivar(self, AIV_NpcStartedTalk, TRUE);

				B_AssessTalk();
				return;
			};
		};
	};

	// ------ sonst den Spieler einfach grüßen (wenn ich ihm entgegenkomme) ------
	if (C_BodyStateContains(self, BS_WALK))
	&& (Npc_GetDistToNpc(self,other) <= PERC_DIST_DIALOG)			// Npc_CanSeeNpc hier sowieso == TRUE; sonst keine ASSESSPLAYER-Wahrnehmung
	&& (Npc_RefuseTalk(other) == FALSE)		//Damit kein Gruß-Maschinengewehr losgeht
	&& (!C_NpcIsGateGuard (self))	//GateGuards benutzen RefuseTalk-Counter, um zu verhindern, daß der Spieler von hinten kommend auch angequatscht wird
	&& (C_PlayerHasFakeGuild (self,other) == FALSE)
	&& (!C_NpcIsSeelenpeiniger(self))
	{
		B_LookAtNpc 			(self, other);
		B_Say_GuildGreetings 	(self, other);
		B_StopLookAt 			(self);
		Npc_SetRefuseTalk(other,20); //BEACHTEN: other ist Spieler!
	};

	// ------ GuardPassage AIVAR des Spielers resetten ------
	if (C_NpcIsGateGuard (self))
	&& (Npc_GetDistToNpc (self, other) > PERC_DIST_DIALOG)
	{
		self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	};

	return;
};