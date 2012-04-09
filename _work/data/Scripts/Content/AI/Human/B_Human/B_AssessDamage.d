// ****************************************************************
// B_AssessDamage
// --------------
// wird durchWahrnehmung PERC_AssessDamage ÜBERALL her aufgerufen
// (also auch aus ZS_Attack, AR kann sich allerdings NICHT ändern!)
// ****************************************************************

func void B_AssessDamage ()
{
	B_Vergiftet (self);

	if (self.attribute[ATR_HITPOINTS] == 1)
	&& (C_DropUnconscious())
	{
		return;
	};

	if (self.aivar[AIV_Damage] == self.attribute[ATR_HITPOINTS]+1)
	{
		self.attribute[ATR_HITPOINTS] += 1;

		B_CalculateDamage	(self, other);
	}
	else	// Kein Schaden genommen, später hier DefenseBreak ergänzen
	{
		if (self.aivar[AIV_Damage] == self.attribute[ATR_HITPOINTS])
		&& (self.flags != 2)
		{
			if (C_CanDefenseBreak(other))
			&& (Hlp_Random(100) < 15)
			{
				B_CalculateDamage(self, other);
			}
			else if (Npc_IsInFightMode(other, FMODE_FAR))
			{
				B_CalculateDamage(self, other);
			}
			else
			{
				return;
			};
		}
		else
		{
			self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
			
			if (self.flags != 2)
			{
				return;
			};
		};
	};

	if (C_NpcIsHero(other))
	&& (Unsichtbarkeitsperk == TRUE)
	{		
		hero.flags = 0;

		Unsichtbarkeitsperk = FALSE;

		AI_Teleport	(hero, "PC_HERO");
	};

	if (CurrentLevel == MINENTAL_ZEN)
	{
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Xeres_01))
		{
			Mod_XeresGetroffen += 1;

			if (Mod_XeresGetroffen == 2)
			{
				B_Say_Overlay (hero, NULL, "$XERESISTIMMORTAL");

				B_LogEntry	(TOPIC_MOD_XERES, "Ich kann Xeres' keinen Schaden zufügen. Ich sollte lieber verschwinden und Xardas aufsuchen.");
			};
		};

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_803_STT_Mud_MT))
		&& (C_NpcIsHero(other))
		{
			B_StartOtherRoutine	(self, "START");
			return;
		};

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_10032_ORC_UndeadShamane_MT))
		{
			return;
		};

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1874_HMG_Makanius_MT))
		&& (C_NpcIsHero(other))
		&& (Npc_KnowsInfo(hero, Info_Mod_Makanius_Lockvogel))
		&& (!Npc_KnowsInfo(hero, Info_Mod_Makanius_Armor))
		{
			B_Attack	(Mod_7065_DMR_Daemonenritter_MT, hero, AR_Kill, 0);

			return;
		};

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_4015_SNOV_BesessenerNovize_MT))
		{
			return;
		};
	};

	if (CurrentLevel == DIEINSEL_ZEN)
	{
		if (C_ScHasReadiedGeisterschwert())
		&& (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1553_PIR_GEISTERPIRAT_DI))
		{
			if (Hlp_Random(1000) > 100)
			{
				self.attribute[ATR_HitPoints] -= self.attribute[ATR_HitPoints_MAX] / 10; 
			}
			else
			{
				self.attribute[ATR_HITPOINTS] -= self.attribute[ATR_HITPOINTS_MAX] / 2;
			};

			if (self.attribute[ATR_HITPOINTS] == 1)
			{
				self.attribute[ATR_HITPOINTS] = 0;
			};

			self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
		};
	};

	if (CurrentLevel == NEWWORLD_ZEN)
	{
		if (Mod_WM_BlutkultTot == FALSE)
		&& (Mod_WM_BlutkultAttack == 0)
		{
			if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7203_BK_Straschiduo_NW))
			|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7244_BlutkultKrieger_NW))
			|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7526_BlutkultMagier_NW))
			|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7525_BlutkultKrieger_NW))
			{
				Mod_WM_BlutkultAttack = 1;
			};
		};

		if (self.id == 7323)
		|| (self.id == 7324)
		|| (self.id == 7325)
		|| (self.id == 7437)
		|| (self.id == 7438)
		|| (self.id == 7439)
		|| (self.id == 7440)
		|| (self.id == 7441)
		{
			return;
		};

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7036_NONE_Pilger_NW))
		{
			return;
		};

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(HeroBot_NW))
		{
			B_MagicHurtNpc	(self, other, 20);

			if (Mod_PAL_HeroBot == 1)
			&& (C_NpcIsHero(other))
			&& (Npc_KnowsInfo(hero, Info_Mod_HeroBot_Gelaber))
			{
				Mod_PAL_HeroBot = 2;
			};

			return;
		};		

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Kobold_11010_NW))
		{
			return;
		};
	};

	if (CurrentLevel == ADDONWORLD_ZEN)
	{
		if (C_NpcIsHero(other))
		&& (self.guild == GIL_DRACONIAN)
		{
			Mod_Echsis = 1;
		};

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7314_Ziel_AW))
		{
			return;
		};
	};

	if (CurrentLevel == ORCTEMPEL_ZEN)
	{
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Monster_11055_Skelett_OT))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Monster_11056_Skelett_OT))
		{
			return;
		};
	};

	if (C_NpcIsHero(other))
	&& (self.guild > GIL_SEPERATOR_HUM)
	{
		self.aivar[AIV_FLUGBLATTVERTEILT] = 1;
	};

	if (CurrentLevel == FREEMINE_ZEN)
	{
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Gormgniez_11007_FM))
		{
			return;
		};
	};

	if (CurrentLevel == ORCGRAVEYARD_ZEN)
	{
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7265_GUR_BaalTavor_OGY))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7261_PSINOV_Novize_OGY))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7262_PSINOV_Novize_OGY))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7263_PSINOV_Novize_OGY))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7264_PSINOV_Novize_OGY))
		{
			return;
		};

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_10033_ORC_UndeadShamane_OGY))
		{
			return;
		};
	};

	if (RingDerBosheit_Equipped == 1)
	&& (C_NpcIsHero(other))
	&& (self.guild != GIL_SKELETON)
	&& (self.guild != GIL_STONEGUARDIAN)
	&& (self.guild != GIL_GOBBO_SKELETON)
	&& (self.guild != GIL_SKELETON_MAGE)
	&& (self.guild != GIL_SHADOWBEAST_SKELETON)
	&& (self.guild != GIL_STONEGOLEM)
	&& (self.guild != GIL_ICEGOLEM)
	&& (self.guild != GIL_FIREGOLEM)
	&& (Hlp_Random(100) < 20)
	&& (self.aivar[AIV_AttackReason] != AR_NONE)
	&& (Self.aivar[AIV_Blutet] == 0)
	{
		self.aivar[AIV_Blutet] = 20;
	};

	if (CurrentLevel == FLIEGENDEINSEL_ZEN)
	{
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1974_MIL_Gidan_FI))
		&& (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Sleeper))
		{
			return;
		};

		if (self.guild == GIL_DMT)
		{
			return;
		};
	};

	if (B_Knockout	(other, self))
	{
		return;
	};

	if (Npc_IsInState(self, ZS_Knockout))
	{
		return;
	};

	if (Npc_IsInState(self, ZS_Betrunken))
	{
		AI_StartState	(self, ZS_Knockout, 0, "");

		return;
	};	
	
	// AIVARS

	if (CurrentLevel == XERESWELT_ZEN)
	{
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Xeres_02))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Xeres_03))
		{
			if (self.attribute[ATR_HITPOINTS] == 1)
			{
				self.attribute[ATR_HITPOINTS] = 0;
			};
		};
	};

	if (self.aivar[AIV_ArenaFight] == AF_AFTER)
	{
		self.aivar[AIV_ArenaFight] = AF_AFTER_PLUS_DAMAGE;
	};
	
	if self.aivar [AIV_EnemyOverride] == TRUE
	{
		
	};
	// ------ Wenn NSC im ZS_Attack ------
	if (Npc_IsInState(self,ZS_Attack))
	{
		// EXIT IF...
		
		// ------ Freunde ignorieren Treffer vom Spieler im Kampf ------
		if (Npc_IsPlayer (other))
		&& (self.npctype == NPCTYPE_FRIEND)
		{
			return;
		};
		
		// ------ Partymember ignorieren Treffer vom Spieler im Kampf ------
		if (Npc_IsPlayer (other))
		&& (self.aivar[AIV_PARTYMEMBER] == TRUE)
		{
			return;
		};
		
		// FUNC
		
		// ------ Wenn ich von jemand ANDEREM getroffen werde ------
		if (Hlp_GetInstanceID (other) != self.aivar[AIV_LASTTARGET])
		{
			// ------ NEUER Angreifer ist NPC ODER zum zweiten MAl (von Hero) getroffen ------
			if (self.aivar[AIV_HitByOtherNpc] == Hlp_GetInstanceID (other))
			|| (Hlp_GetInstanceID(other) != Hlp_GetInstanceID(hero)) 
			{
				Npc_SetTarget (self, other); //Ziel wechseln
			}
			else //NEUER Angreifer ist hero und trifft zum ersten mal
			{
				self.aivar[AIV_HitByOtherNpc] = Hlp_GetInstanceID (other); //EIN Freischlag
			};
		};
			
		return;
	};
	
	
	// EXIT IF
	
	// ------ NSC ist ENEMY ----- 
	if (B_AssessEnemy())
	{
		return;
	};
	
	// ------ Egill/Enim NSCs (Story-Angreifer) ------
	if (!Npc_IsPlayer(other))
	&& (other.aivar[AIV_ATTACKREASON] == AR_NONE)
	{
		B_Attack (self, other, AR_NONE, 0);		//angreifen oder fliehen
		return;
	};
		
	// ------ Spieler hat mit NK-Waffe angegriffen ------
	if (Npc_IsInFightMode (other, FMODE_MELEE))
	|| (Npc_IsInFightMode (other, FMODE_FIST))
	|| (Npc_IsInFightMode (other, FMODE_NONE)) //oder Waffe wieder weggesteckt (nicht ermittelbar)
	{
		// ------ NSC ist freundlich ODER npctype_friend ------
		if (Npc_GetAttitude (self, other) == ATT_FRIENDLY)
		|| ( (self.npctype == NPCTYPE_FRIEND) && Npc_IsPlayer(other) )
		{
			// ------- nur wenn ich zum ERSTEN Mal geschlagen werde -------
			if (!Npc_IsInState(self, ZS_ReactToDamage))
			{
				Npc_ClearAIQueue	(self);
				B_ClearPerceptions	(self);							//schaltet alle Wahrnehmungen ab - so kann keine später priorisierte diesen Stateaufruf verhindern (s. z.B. AssessFightSound + AssessDamage)
				AI_StartState		(self, ZS_ReactToDamage, 0, "");
				return;												//im unterern B_Attack wird ein ClearQueue aufgerufen, der den AI_StartState direkt wieder aus der queue löscht
																	// - sicherheithalber bei allen AI_StartState-Aufrufen return anfügen
			};
		};
	};

	Npc_SendPassivePerc	(self, PERC_ASSESSFIGHTSOUND, self, other);	
	
	// FUNC
	
	B_Attack (self, other, AR_ReactToDamage, 0);		//angreifen oder fliehen
	return;
};