// ******************************
// ZS_Attack
// ---------
// Angreifen oder Fliehen
// wird durch B_Attack aufgerufen
// ******************************

func void B_AssessSurprise()
{
	Npc_SetTarget (self, other); //Ziel wechseln

	// ------ HACK: AR ändern wegen B_Says, mögl. GateGuards, mögl. Mörder, etc. -------
	self.aivar[AIV_ATTACKREASON] = AR_GuildEnemy;
};

func void ZS_Attack ()
{
	B_ClearPerceptions(self);

	Perception_Set_Minimal();				//alle diese Wahrnehmungen werden den ZS_Attack NICHT verlassen

	B_SetSchwierigkeit();

	// ------ lokale Wahrnehmung für verwandelten SC ------
	Npc_PercEnable (self, PERC_ASSESSSURPRISE , B_AssessSurprise);

	B_ValidateOther();
	self.aivar[AIV_LASTTARGET] = Hlp_GetInstanceID (other);

	//EXIT IF

	if (self.guild == GIL_DRAGON)
	&& (other.guild == GIL_GOBBO)
	{
		return;
	};

	// ------ NSC will fliehen ------
	if (C_WantToFlee (self, other))
	{
		Npc_ClearAIQueue	(self);
		B_ClearPerceptions	(self);
		Npc_SetTarget 		(self, other);
		AI_StartState 		(self, ZS_Flee, 0, "");
		return;
	};

	if ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_948_BDT_Esteban_MT))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_4072_BDT_Bandit_MT))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_4073_BDT_Bandit_MT))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_4074_BDT_Bandit_MT))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_4075_BDT_Bandit_MT)))
	&& ((Mod_Banditenueberfall_Esteban == 6)
	|| (Mod_Banditenueberfall_Esteban == 7))
	&& (C_NpcIsHero(other))
	{
		return;
	};

	if (Npc_GetDistToWP(self, "TOT") < 500)
	{
		return;
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_803_STT_Mud_MT))
	&& (other.guild > GIL_SEPERATOR_HUM)
	{
		return;
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7299_OUT_Hel_NW))
	&& (other.guild == GIL_ZOMBIE)
	{
		return;
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1974_MIL_Gidan_FI))
	{
		return;
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1981_Kolam_FI))
	{
		return;
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1141_GRD_Gardist_MT))
	{
		B_Attack	(Mod_1107_GRD_Jackal_MT, Mod_1141_GRD_Gardist_MT, AR_Kill, 0);
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1893_MIL_Miliz_NW))
	{
		B_Attack	(Mod_1894_MIL_Miliz_NW, hero, AR_GuildEnemy, 0);
	};

	// FUNC

	// ------ Nicht bei LOAD GAME ------
	if (self.aivar[AIV_LOADGAME] == FALSE)
	&& (!C_NpcIsSeelenpeiniger(self))
	{
		// ------ Grund des Angriffs nennen ------
		B_Say_AttackReason();
	};

	// ------ Die besten Waffen equippen ------
	if (Npc_IsInFightMode(self, FMODE_NONE))			// nur wenn self keine Waffe gezogen hat
	{
		AI_EquipBestRangedWeapon 	(self);
		AI_EquipBestMeleeWeapon 	(self);
	};

	AI_StandUp		(self);
	B_StopLookAt	(self);
	B_TurnToNpc		(self, other);
	AI_SetWalkmode 	(self, NPC_RUN);

	// ------ GuardPassage_Status resetten ------
	self.aivar[AIV_Guardpassage_Status]	= GP_NONE;

	// ------ Absolutionslevel initialisieren (bei LOC_NONE immer 0) ------
	self.aivar[AIV_LastAbsolutionLevel]	= B_GetCurrentAbsolutionLevel(self);

	// ------ Verfolgugsabbruch unwahr (resetten) ------
	self.aivar[AIV_PursuitEnd] = FALSE;

	// ------ Verfolgungs-Zwischendistanz-Ausrichutung ------
	self.aivar[AIV_StateTime] = 0;

	// ------ Nur einmal Wachen rufen (resetten) ------
	self.aivar[AIV_TAPOSITION] = 0;

	// ------ wie oft bin ich von Nicht-Target getroffen worden ------
	self.aivar[AIV_HitByOtherNpc] = 0;

	// ------ Für Magier ------
	self.aivar[AIV_SelectSpell] = 0; //Für Magier;

	if (self.aivar[AIV_FightDistCancel] < FIGHT_DIST_CANCEL)
	{
		self.aivar[AIV_FightDistCancel] = FIGHT_DIST_CANCEL;
	};
};

func int ZS_Attack_Loop()
{
	Mod_KampfLaeuft = TRUE;

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PC_SEELE))
	&& (seele_unterwegs==TRUE)
	{
		if (self.attribute[ATR_MANA] < SPL_Cost_Concussionbolt)
		{
	 		B_SoulTalk();
		};
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_10048_Orc_Poloch_MT)) {
		if (Mod_PolochTretor == 3)
		|| (Mod_Poloch_Beat) {
			return LOOP_END;
		};
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_10049_Orc_Tretor_MT)) {
		if (Mod_PolochTretor == 3)
		|| (Mod_Tretor_Beat) {
			return LOOP_END;
		};
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7352_OUT_Trador_TUG))
	&& (other.guild == GIL_STONEGOLEM)
	{
		return LOOP_END;
	};

	// ----- NICHT unten, sonst bei LOAD Game other trotz B_ValidateOther verloren! Warum??? -----
	if (!Npc_GetTarget (self)) // other = target
	{
		return LOOP_END;
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Monster_11038_Shivar_REL))
	&& (C_NpcIsHero(other))
	&& (Mod_HeroIstDemon == TRUE)
	&& (self.aivar [AIV_ATTACKREASON] == AR_NONE)
	{
		return LOOP_END;
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Monster_11039_Shivar_EIS))
	&& (C_NpcIsHero(other))
	&& (Mod_HeroIstDemon == TRUE)
	&& (self.aivar [AIV_ATTACKREASON] == AR_NONE)
	{
		return LOOP_END;
	};

	if ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Monster_11057_Mutantengolem_AW))
	|| (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Monster_11057_Mutantengolem_AW)))
	&& ((Mod_Mutantengolem == 2)
	|| (Mod_Mutantengolem == 3))
	{
		return LOOP_END;
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_939_PIR_Owen_AW))
	&& (other.guild == GIL_STRF)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Owen_Befreiung))
	{
		return LOOP_END;
	};

	// EXIT LOOP IF...

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Monster_11038_Shivar_REL))
	&& (C_NpcIsHero(other))
	&& (Mod_ShivarLieb == 1)
	{
		return LOOP_END;
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Monster_11039_Shivar_EIS))
	&& (C_NpcIsHero(other))
	&& (Mod_ShivarLieb == 1)
	{
		return LOOP_END;
	};

	if (Mod_MitLawrenceGesprochen == 11)
	&& (Npc_IsInState(Mod_591_NONE_Larius_NW, ZS_Attack))
	{
		if (!Npc_IsInState(Mod_1730_MIL_Lawrence_NW, ZS_ATTACK))
		{
			B_Attack	(Mod_1730_MIL_Lawrence_NW, hero, AR_GuildEnemy, 0);
		};
		if (!Npc_IsInState(Mod_594_NONE_Lutero_NW, ZS_ATTACK))
		{
			B_Attack	(Mod_594_NONE_Lutero_NW, hero, AR_GuildEnemy, 0);
		};
	};

	if (self.guild == GIL_DRAGON)
	&& (other.guild == GIL_GOBBO)
	{
		return LOOP_END;
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7299_OUT_Hel_NW))
	&& (other.guild == GIL_ZOMBIE)
	{
		return LOOP_END;
	};

	if ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_948_BDT_Esteban_MT))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_4072_BDT_Bandit_MT))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_4073_BDT_Bandit_MT))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_4074_BDT_Bandit_MT))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_4075_BDT_Bandit_MT)))
	&& ((Mod_Banditenueberfall_Esteban == 6)
	|| (Mod_Banditenueberfall_Esteban == 7))
	&& (C_NpcIsHero(other))
	{
		return LOOP_END;
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7368_JG_Jaeger_NW))
	&& (C_NpcIsDown(Mod_7106_ASS_Ramsi_NW))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Ramsi_KeilerFleischWeg))
	{
		B_StartOtherRoutine	(self, "FLUCHT");
		return LOOP_END;
	};

	// Begleiter und deren Monster greifen sich weder gegenseitig noch den Held an

	if (CurrentLevel == TUGETTSO_ZEN)
	&& (self.guild == other.guild)
	{
		return LOOP_END;
	};

	if (self.aivar[AIV_Partymember] == TRUE)
	&& (other.aivar[AIV_Partymember] == TRUE)
	{
		return LOOP_END;
	};

	if (self.aivar[AIV_Partymember] == TRUE)
	&& (C_NpcIsHero(other))
	{
		return LOOP_END;
	};

	if (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Mod_1974_MIL_Gidan_FI))
	&& (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Sleeper))
	&& (other.attribute[ATR_HITPOINTS] < other.attribute[ATR_HITPOINTS_MAX])
	{
		return LOOP_END;
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7174_DEM_Randolph_NW))
	&& (Mod_Randolph_Started == 14)
	{
		return LOOP_END;
	};

	// ------ Kampfabbruch, wenn zu weit weg ------
	if (Npc_GetDistToNpc (self, other) > self.aivar[AIV_FightDistCancel])
	{
		Npc_ClearAIQueue(self);
		AI_StandUp		(self);
		self.aivar[AIV_PursuitEnd] = TRUE;
		return LOOP_END;
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Drach_WerBistDu))
	&& (GardeBeliars_1989_Drach.attribute[ATR_HITPOINTS] < (GardeBeliars_1989_Drach.attribute[ATR_HITPOINTS_MAX]/2))
	&& (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(GardeBeliars_1989_Drach))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Drach_AtAlmanach))
	{
		Npc_ClearAIQueue(self);
		AI_StandUp		(self);

		AI_StandUp	(hero);

		self.aivar[AIV_PursuitEnd] = TRUE;
		return LOOP_END;
	};


	// ------ Gegner wird schon zu lange verfolgt ------
	if (Npc_GetStateTime (self) > self.aivar[AIV_MM_FollowTime])
	&& (self.aivar[AIV_PursuitEnd] == FALSE)
	{
		Npc_ClearAIQueue(self);
		AI_StandUp		(self);
		self.aivar[AIV_PursuitEnd] = TRUE;
		self.aivar[AIV_Dist] = Npc_GetDistToNpc(self, other);
		self.aivar[AIV_StateTime] = Npc_GetStateTime (self);

		// ------ Einen Spruch aufsagen ------
		if (other.guild < GIL_SEPERATOR_HUM) //NICHT bei Monstern oder bei verwandeltem SC
		&& (!C_NpcIsSeelenpeiniger(self))
		{
			B_Say (self, other,	"$RUNCOWARD");
		};
	};

	// ------ Warten, ob Feind auch wirklich flieht ------
	if (self.aivar[AIV_PursuitEnd] == TRUE)
	{
		// ------ weit genug weg ------
		if (Npc_GetDistToNpc (self, other) > (self.senses_range))
		{
			return LOOP_END;
		};

		// ------ einmal pro Sekunde ------
		if (Npc_GetStateTime (self) > self.aivar[AIV_StateTime])
		{
			// ------ Feind kommt zurück ODER bleibt stehen ------
			if (Npc_GetDistToNpc(self, other) < self.aivar[AIV_Dist])
			|| ( (!C_BodyStateContains(other,BS_RUN)) && (!C_BodyStateContains(other, BS_JUMP)) )
			{
				self.aivar[AIV_PursuitEnd] = FALSE;
				Npc_SetStateTime (self, 0);
				self.aivar[AIV_StateTime] = 0;
				// --> und weiter im Text!
			}
			else
			{
				B_TurnToNpc (self, other);
				self.aivar[AIV_Dist] = Npc_GetDistToNpc(self, other);
				self.aivar[AIV_StateTime] = Npc_GetStateTime (self);
			};
		};

		return LOOP_CONTINUE;
	};

	// ------ wenn Absolutionslevel im Kampf > als beim Kampf-start --> Abbruch ------
	if (B_GetCurrentAbsolutionLevel(self) > self.aivar[AIV_LastAbsolutionLevel])
	{
		Npc_ClearAIQueue(self);
		AI_StandUp		(self);
		return LOOP_END;
	};

	// ------ Gegner geht ins Wasser und ich will nicht schwimmen ------
	if (C_BodyStateContains(other,BS_SWIM) || C_BodyStateContains(other,BS_DIVE))
	&& (self.aivar[AIV_MM_FollowInWater] == FALSE)
	{
		Npc_ClearAIQueue(self);
		AI_StandUp		(self);
		self.aivar[AIV_PursuitEnd] = TRUE;
		return LOOP_END;
	};

	if (self.guild == GIL_DRACONIAN)
	&& (other.guild == GIL_SWAMPSHARK)
	{
		return LOOP_END;
	};


	// LOOP FUNC

	// ------ Vor Attacke kurz warten (bei Angriff aus Dialog) ------
	if (self.aivar[AIV_WaitBeforeAttack] >= 1) //nur einmal
	{
		AI_Wait (self, 0.8);
		self.aivar[AIV_WaitBeforeAttack] = 0;
	};

	// ------ Wenn Max-Entfernung zum WP angegeben ------
	if (self.aivar[AIV_MaxDistToWp] > 0)
	{
		if (Npc_GetDistToWP(self, self.wp) > self.aivar[AIV_MaxDistToWp])
		&& (Npc_GetDistToWP(other, self.wp) > self.aivar[AIV_MaxDistToWp])
		{
			self.fight_tactic = FAI_NAILED;
		}
		else //einer von beiden nah genug am self.wp
		{
			self.fight_tactic = self.aivar[AIV_OriginalFightTactic];
		};
	};

	// ------ Verfolgungstimer resetten ------
	if ( (!C_BodyStateContains(other,BS_RUN)) && (!C_BodyStateContains(other, BS_JUMP)) )
	{
		Npc_SetStateTime (self, 0);
	};

	// ------ ggf. Wachen rufen ------
	if (Npc_GetStateTime (self) > 2)
	&& (self.aivar[AIV_TAPOSITION] == 0)
	{
		B_CallGuards();
		self.aivar[AIV_TAPOSITION] = 1;
	};

	// ------ Nochmal bei Verfolgung Wachen rufen ------
	if (Npc_GetStateTime (self) > 8)
	&& (self.aivar[AIV_TAPOSITION] == 1)
	{
		B_CallGuards();
		self.aivar[AIV_TAPOSITION] = 2;
	};

	// ------ ggf. Munition generieren ------
	B_CreateAmmo(self);							//muß VOR SelectWeapon kommen, weil sonst Bogen bei fehlender Muni nicht gezogen wird

	// ------ immer volles MANA ------
	//wird in B_ReadySpell gemacht

	// ------ Waffe ziehen oder wechseln ------
	B_SelectWeapon (self, other);				//Waffe oder Spell ziehen

	// ------ ATTACK ------
	if ((Hlp_IsValidNpc(other))
	&& (C_NpcIsDown(other) == FALSE))
	{
		if (B_GetAivar(other, AIV_INVINCIBLE) == FALSE) // Nur NSCs angreifen, die NICHT im Talk sind
		{
												//führt Angriff mit Waffe oder Spell aus (Aktion wird durch FAI bestimmt)
			AI_Attack (self);		 			//In der Funktion, in der AI_Attack aufgerufen wird DARF KEIN AI_ Befehl VOR AI_Attack kommen, da sonst AI_Attack ignoriert wird
												//(AI-Attack funktioniert NUR, wenn die AIqueue leer ist!)
		}
		else
		{
			Npc_ClearAIQueue(self); //killt den letzten AI_Attack-Befehl, verhindert z.B. stumpfes weiterrennen.
		};

		self.aivar[AIV_LASTTARGET] = Hlp_GetInstanceID (other);

		return LOOP_CONTINUE;
	}
	else //target ungültig (tot) oder down		// falls NPC_GetTarget(self) == FALSE --> other hier automatisch gelöscht
	{
		// ------ noch in der Queue befindliche Attacks löschen ------
		Npc_ClearAIQueue(self);

		// ------ wenn Spieler niedergeschlagen, temp_att (upset) resetten ------
		if (Hlp_IsValidNpc(other))
		&& (Npc_IsPlayer(other))
		&& (C_NpcIsDown(other))
		{
			Npc_SetTempAttitude(self, Npc_GetPermAttitude(self,hero));
		};

		// ------ NUR neues Ziel wählen, wenn AR NICHT Kill ------
		if (self.aivar [AIV_ATTACKREASON] != AR_KILL)
		{
			Npc_PerceiveAll	(self);					// nötig, da Npc_GetNextTarget() auf der Liste der zuletzt Wahrgenommenen VOBs beruht, und das kann hier schon ne Weile her sein, denn ZS_Attack hat keine aktiven Wahrnehmungen

			if (!Npc_GetNextTarget (self))
			{
				return LOOP_END;
			};
		};

		// ----- ist neues Ziel gefunden, in Reichweite, nicht down, nicht im Dialog, nicht FakeBandit und ich selbst Bandit? Dann neues Ziel, sonst End ------
		if (Hlp_IsValidNpc(other))
		&& (!C_NpcIsDown(other))
		&& ((Npc_GetDistToNpc(self, other) < PERC_DIST_INTERMEDIAT) || (Npc_IsPlayer(other)) ) //Bei Nicht-Player Enemies nur auf 1000m reagieren (sonst PERC_DIST_ACTIVE_MAX)
		&& (Npc_GetHeightToNpc(self, other) < PERC_DIST_HEIGHT)
		&& (B_GetAivar(other, AIV_INVINCIBLE) == FALSE)
		&& (!( C_PlayerIsFakeBandit(self, other) && (self.guild == GIL_BDT) ) )
		{
			if (Wld_GetGuildAttitude(self.guild, other.guild) == ATT_HOSTILE)
			{
				self.aivar[AIV_ATTACKREASON] = AR_GuildEnemy;

				// BUGFIX: Nicht, wenn verwandelt
				if (C_NpcIsHero(other))
				{
					self.aivar[AIV_LastPlayerAR] = AR_GuildEnemy;
					B_SetAivar(self, AIV_LastFightAgainstPlayer, FIGHT_CANCEL);
					self.aivar[AIV_LastFightComment] = FALSE;
				};
			}
			else if (Npc_GetAttitude(self, other) == ATT_HOSTILE) //Temp hostile (upset) zum Spieler
			// UND Npc_IsPlayer(other), weil ich NUR zum Player Temp_Att haben kann!
			{
				self.aivar[AIV_ATTACKREASON] = self.aivar[AIV_LastPlayerAR];
			};

			return LOOP_CONTINUE;
		}
		else 									// wenn false, wird other gelöscht!
		{
			Npc_ClearAIQueue(self);

			if (B_GetAivar(self, AIV_LastFightAgainstPlayer) == FIGHT_CANCEL)
			&& (self.aivar[AIV_LASTTARGET] != Hlp_GetInstanceID (hero)) //letztes Ziel NICHT Player
			{
				self.aivar[AIV_LastFightComment] = TRUE; //kein Kommentar abegeben
			};

			return LOOP_END;
		};
	};
};

func void ZS_Attack_End ()
{
	// ------ other wieder holen, ist hier auf jeden Fall gelöscht! ------
	other = Hlp_GetNpc(self.aivar[AIV_LASTTARGET]);

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7368_JG_Jaeger_NW))
	{
		return;
	};

	// ----- Nachbereitung bei Verfolgungsabbruch ------
	if (self.aivar[AIV_PursuitEnd] == TRUE)
	{
		// ------ TEMP_Hostile zum Player (NSC ist "upset") ------
		// BUGFIX: Nicht, wenn verwandelt
		if (Hlp_IsValidNpc(other))
		&& (C_NpcIsHero (other))
		&& (self.npctype != NPCTYPE_FRIEND)
		{
			Npc_SetTempAttitude(self, ATT_HOSTILE);
		};

		// ------- Arenafight Ende -------
		if (self.aivar[AIV_ArenaFight] == AF_RUNNING)
		{
			self.aivar[AIV_ArenaFight] = AF_AFTER;
		};
	};

	// ------ Kampf zuende ------
	if (self.aivar[AIV_PursuitEnd] == FALSE)
	&& (!C_NpcIsSeelenpeiniger(self))
	{
		// ------ wenn Spieler während der Verfolgung Absolution erlangt hat ------
		if (B_GetCurrentAbsolutionLevel(self) > self.aivar[AIV_LastAbsolutionLevel])
		{
			B_Say (self, other , "$WISEMOVE");
		}
		else //Normales Kampfende
		{
			B_Say_AttackEnd();
		};
	};

	if (self.npctype == NPCTYPE_MT_GARDIST)
	&& (self.aivar[AIV_AttackReason] == AR_KILL)
	{
		self.aivar[AIV_AttackReason] = AR_NONE;

		B_SetAttitude(self, ATT_FRIENDLY);
	};

	// ------ mein Gegner vom Spieler getötet ------
	if (other.aivar[AIV_KilledByPlayer] == TRUE)
	&& (Wld_GetGuildAttitude(self.guild, hero.guild) != ATT_HOSTILE)
	{
		B_SetAttitude(self, ATT_FRIENDLY);
	};

	// ------ Finishing Move ------
	if (Npc_IsInState (other, ZS_Unconscious))
	&& (C_NpcHasAttackReasonToKill (self))
	{
		B_FinishingMove (self, other);
	};

	// ------ Waffe weg -------
	if (self.aivar[AIV_ATTACKREASON] != AR_BERSERK)
	{
		AI_RemoveWeapon (self);
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1872_NONE_Unbekannt_MT))
	&& (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Mod_1871_TPL_GorKaranto_MT))
	&& (Mod_GorKarantoSchwach == TRUE)
	{
		B_LogEntry	(TOPIC_MOD_AL_ARENA, "Er kämpft wirklich nicht sehr gut, aber er hat den Templer Gor Karanto trotzdem leicht besiegt. Ich glaube, ich sehe mir mal an, wie er sich gegen mich schlägt.");

		Mod_GorKarantoSchwach = 2;

		B_StartOtherRoutine	(self, "START");
		B_StartOtherRoutine	(other, "START");

		return;
	};

	// ------ Plündern ------
	if (C_NpcIsDown(other))
	&& (C_WantToRansack(self))
	&& ((B_GetAivar(other, AIV_RANSACKED) == FALSE) || C_NpcRansacksAlways(self) )
	&& (Npc_GetDistToNpc(self, other) < PERC_DIST_INTERMEDIAT)
	&& (self.aivar[AIV_ATTACKREASON] != AR_BERSERK)
	{
		// ------ Opfer wird markiert, damit nur EINER plündert - abgefragt vor Aufruf von ZS_RansackBody -------
		B_SetAivar(other, AIV_RANSACKED, TRUE);						//FALSE gesetzt in ZS_Unconcious_End und ZS_Dead

		if (other.guild < GIL_SEPERATOR_HUM)
		&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_7106_ASS_Ramsi_NW))
		{
			AI_StartState (self, ZS_RansackBody, 0, "");

			return;
		}
		else if (other.guild > GIL_SEPERATOR_HUM)
		|| ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7106_ASS_Ramsi_NW))
		&& (Npc_HasItems(other, ItFo_MuttonRaw) >= 0))
		{
			// ------ AlliJack nimmt Fleisch ------
			AI_StartState (self, ZS_GetMeat, 0, "");
			return;
		};
	};

	if (self.aivar[AIV_ATTACKREASON] == AR_BERSERK)
	{
		AI_StartState	(self, ZS_Wahnsinn, 0, "");
		return;
	};

	// ------ NSC heilt sich ------
	if (self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX]))
	{
		AI_StartState	(self, ZS_HealSelf, 0, "");
		return;
	};
};