// ********************
// ZS_MM_Attack
// ------------
// für Monster und Orks
// ********************

func void B_MM_AssessSurprise()
{
	Npc_SetTarget (self, other); //Ziel wechseln
};


func void ZS_MM_Attack ()
{
	B_ClearPerceptions(self);

	Npc_SetPercTime 	(self, 1); 

	B_SetSchwierigkeit();
	
	Npc_PercEnable		(self, PERC_ASSESSBODY			, 	B_MM_AssessBody);	//wenn Monster in Attack leckeren Body wittert
		
	Npc_PercEnable		(self, PERC_ASSESSMAGIC			,  	B_AssessMagic); 			//selbe Rkt wie Humans
	Npc_PercEnable		(self, PERC_ASSESSDAMAGE		,	B_MM_AssessDamage);
	Npc_PercEnable		(self, PERC_ASSESSWARN			, 	B_MM_AssessWarn);
	
	// ------ lokale Wahrnehmung für verwandelten SC ------
	Npc_PercEnable (self, PERC_ASSESSSURPRISE , B_MM_AssessSurprise);

	B_ValidateOther();

	// EXIT IF...
	
	// ------ Schafe fliehen immer ------
	if (self.guild == GIL_SHEEP)
	{
		Npc_ClearAIQueue 	(self);
		B_ClearPerceptions 	(self);
		Npc_SetTarget		(self, other);
		AI_StartState 		(self, ZS_MM_Flee, 0, "");
		return; 
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Schattensnapper))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Feuersnapper))
	{
		if (Bosskampf_Pass_NW == 0)
		{
			Bosskampf_Pass_NW = 1;

			Wld_SendTrigger	("BOSSKAMPF_PASS");
		};
	};
	
	// FUNC
		
	AI_StandUp		(self);
	AI_SetWalkmode 	(self, NPC_RUN);
	
	// ------ Hilfe anfordern ------
	Npc_SendPassivePerc	(self, PERC_ASSESSWARN,	other, self); //Opfer,Täter	
	
	// ------ init aivars -------
	self.aivar[AIV_PursuitEnd] = FALSE;
	self.aivar[AIV_StateTime] = 0;
	self.aivar[AIV_HitByOtherNpc] = 0;
	self.aivar[AIV_SelectSpell] = 0; //Für Magier
	self.aivar[AIV_TAPOSITION] = 0; //für Regeneration
};

func int ZS_MM_Attack_Loop()
{
	Mod_KampfLaeuft = TRUE;
	
	if (!Npc_GetTarget (self))
	{
		return LOOP_END;
	};

	B_Vergiftet (self);

	if (self.guild > GIL_SEPERATOR_HUM)
	&& (self.guild == other.guild)
	&& (!C_NpcIsHero(other))
	{
		return LOOP_END;
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Bloodhound_Untier))
	{
		if (Mod_Untier_Frisst > 0)
		{
			return LOOP_END;
		};
	};

	if ((self.guild == GIL_ZOMBIE)
	|| (self.guild == GIL_FRIENDLY_ORC)
	|| (self.guild == GIL_UNDEADORC))
	&& ((other.guild == GIL_ZOMBIE)
	|| (other.guild == GIL_FRIENDLY_ORC)
	|| (other.guild == GIL_UNDEADORC))
	{
		return LOOP_END;
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Kleindrache))
	&& (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Kobold))
	{
		return LOOP_END;
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Kobold))
	&& (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Kleindrache))
	{
		return LOOP_END;
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Gobbo_Matrone))
	&& (self.attribute[ATR_MANA] >= 25)
	&& (r_max(99) < 10)
	{
		AI_Wait(self, 3);

		self.attribute[ATR_MANA] -= 25;

		Wld_SpawnNpcRange	(self, Gobbo_Matrone_Summoned, 1, 500);

		return LOOP_CONTINUE;
	};

	if (Npc_IsPlayer(other))
	&& (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Xeres_01))
	{
		if (hero.attribute[ATR_HITPOINTS] == 1)
		&& (Mod_TeleportZuFestung == 1)
		{	
			AI_Teleport(hero, "LOCATION_19_03_PATH_RUIN7");
			B_LogEntry	(TOPIC_MOD_XERES, "Xeres hat mich wieder besiegt obwohl ich die Klaue Beliars bei mir hatte.");
			Npc_RemoveInvItems	(hero, ItAm_Xardas_SchutzVorXeres, 1);
		};
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Icegolem_Griselda_01))
	{
		if (Npc_GetDistToNpc(self, hero) < Npc_GetDistToNpc(self, Firegolem_Griselda_01))
		{
			Npc_SetTarget (self, hero);

			if (!Npc_GetTarget (self))
			{
				return LOOP_END;
			};
		}
		else
		{
			Npc_SetTarget (self, Firegolem_Griselda_01);

			if (!Npc_GetTarget (self))
			{
				return LOOP_END;
			};
		};
	};
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Firegolem_Griselda_01))
	{
		if (Npc_GetDistToNpc(self, hero) < Npc_GetDistToNpc(self, Icegolem_Griselda_01))
		{
			Npc_SetTarget (self, hero);

			if (!Npc_GetTarget (self))
			{
				return LOOP_END;
			};
		}
		else
		{
			Npc_SetTarget (self, Icegolem_Griselda_01);

			if (!Npc_GetTarget (self))
			{
				return LOOP_END;
			};
		};
	};
		
	//ADDON<
		
	// EXIT LOOP IF...
	
	// ------ Kampfabbruch, wenn zu weit weg ------
	if (Npc_GetDistToNpc (self, other) > FIGHT_DIST_CANCEL)
	{
		Npc_ClearAIQueue(self);
		AI_StandUp		(self);
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
			
		AI_PlayAni		(self, "T_WARN"); 	//nochmal zum Abschied Drohen
	};
	
	// ------ Warten, ob Feind auch wirklich flieht ------
	if (self.aivar[AIV_PursuitEnd] == TRUE)
	{
		// ------ weit genug weg ------
		if (Npc_GetDistToNpc (self, other) > self.senses_range)
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
				AI_TurnToNpc (self, other);
				self.aivar[AIV_Dist] = Npc_GetDistToNpc(self, other);
				self.aivar[AIV_StateTime] = Npc_GetStateTime (self);
			};
		};
		
		return LOOP_CONTINUE;
	};
	
	// ------ Gegner geht ins Wasser und ich will nicht schwimmen ------
	if (C_BodyStateContains(other,BS_SWIM) || C_BodyStateContains(other,BS_DIVE))
	&& (self.aivar[AIV_MM_FollowInWater] == FALSE)
	{
		Npc_ClearAIQueue(self);
		AI_StandUp		(self);
		return LOOP_END;
	};
	
	
	// LOOP FUNC
	
	// ------ Vor Attacke kurz warten (bei Angriff aus Dialog) ------
	if (self.aivar[AIV_WaitBeforeAttack] == 1) //nur einmal
	{
		AI_Wait (self, 0.8);
		self.aivar[AIV_WaitBeforeAttack] = 0;
	};
	
	// ------ Summon Time ------
	var int bonustime;
	bonustime = 0;

	if (Mod_SphericRing)
	{
		bonustime = 120;
	};

	if (self.level == 0)
	{
		if (Npc_GetStateTime (self) > self.aivar[AIV_StateTime])
		{
			self.aivar[AIV_SummonTime] += 1;
		
			self.aivar[AIV_StateTime] = Npc_GetStateTime (self);
		};
		
		if (Mod_Circle	<	6)
		&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Wisp_Detector))
		&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Wisp_Helper))
		&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Begleiterwolf))
		&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Summoned_Harpie))
		{
			if (Mod_Circle	==	1)
			|| (Mod_Circle	==	0)
			{
				if (self.aivar[AIV_SummonTime] >= MONSTER_SUMMON_TIME_CIRCLE_1+bonustime)
				{
					 Npc_ChangeAttribute (self, ATR_HITPOINTS, -self.attribute[ATR_HITPOINTS_MAX]);
				};
			}
			else if (Mod_Circle	==	2)
			{
				if (self.aivar[AIV_SummonTime] >= MONSTER_SUMMON_TIME_CIRCLE_2+bonustime)
				{
					 Npc_ChangeAttribute (self, ATR_HITPOINTS, -self.attribute[ATR_HITPOINTS_MAX]);
				};
			}
			else if (Mod_Circle	==	3)
			{
				if (self.aivar[AIV_SummonTime] >= MONSTER_SUMMON_TIME_CIRCLE_3+bonustime)
				{
					 Npc_ChangeAttribute (self, ATR_HITPOINTS, -self.attribute[ATR_HITPOINTS_MAX]);
				};
			}
			else if (Mod_Circle	==	4)
			{
				if (self.aivar[AIV_SummonTime] >= MONSTER_SUMMON_TIME_CIRCLE_4+bonustime)
				{
					 Npc_ChangeAttribute (self, ATR_HITPOINTS, -self.attribute[ATR_HITPOINTS_MAX]);
				};
			}
			else if (Mod_Circle	==	5)
			{
				if (self.aivar[AIV_SummonTime] >= MONSTER_SUMMON_TIME_CIRCLE_5+bonustime)
				{
					 Npc_ChangeAttribute (self, ATR_HITPOINTS, -self.attribute[ATR_HITPOINTS_MAX]);
				};
			};
		}
		else if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Summoned_Harpie))
		{
			self.aivar[AIV_SummonTime] += Npc_GetStateTime(self);

			if (self.aivar[AIV_SummonTime] >= 120)
			{
				 Npc_ChangeAttribute (self, ATR_HITPOINTS, -self.attribute[ATR_HITPOINTS_MAX]);
			};

			Npc_SetStateTime (self, 0);
		};
	};

	// ------ Verfolgungstimer resetten ------
	if ( (!C_BodyStateContains(other,BS_RUN)) && (!C_BodyStateContains(other,BS_JUMP)) )
	&& (Npc_GetStateTime (self) > 0)
	{
		Npc_SetStateTime (self, 0);
		self.aivar[AIV_StateTime] = 0;
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
	
	// ------ MonsterMage zieht Spruch / Orc zieht Waffe ------
	if (C_NpcIsMonsterMage(self))
	|| (self.guild == GIL_SKELETON)
	|| (self.guild == GIL_SUMMONED_SKELETON)
	|| (self.guild > GIL_SEPERATOR_ORC)
	|| (self.aivar[AIV_MM_REAL_ID] == ID_KOBOLD)
	|| (self.aivar[AIV_MM_REAL_ID] == ID_ORCWARRIORCROSSBOW)
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(MinecrawlerQueen))
	{
		B_CreateAmmo	(self);	//ggf. Muni generieren
		Npc_ChangeAttribute	(self, ATR_MANA, ATR_MANA_MAX); //immer volles MANA
		B_SelectWeapon 	(self, other);
	};
	
	// ------ ATTACK ------	
	if (Hlp_IsValidNpc(other)) 				// wenn target da ist, ist hier auch other valid
	&& (!C_NpcIsDown(other)) 				// sonst "attackiert" der NPC ein z.B. totes Opfer weiter
	{
		if (B_GetAivar(other, AIV_INVINCIBLE) == FALSE) 	// Nur NSCs angreifen, die NICHT im Talk sind
		{
			AI_Attack (self); 	//In der Funktion, in der AI_Attack aufgerufen wird DARF KEIN AI_ Befehl VOR AI_Attack kommen, da sonst AI_Attack ignoriert wird
								//(AI-Attack funktioniert NUR, wenn die AIqueue leer ist!)
		}
		else
		{
			Npc_ClearAIQueue(self); //killt den letzten AI_Attack-Befehl, verhindert z.B. stumpfes weiterrennen.
		};
		
		self.aivar[AIV_LASTTARGET] = Hlp_GetInstanceID (other);
		
		return LOOP_CONTINUE;
	}
	else 										// NPC_GetTarget(self) == FALSE, also tot - other hier automatisch gelöscht
	{
		// ------ Monster auf der Jagd --> Beute fressen kommt VOR NextTarget ------
		if (self.aivar[AIV_MM_PRIORITY] == PRIO_EAT)
		&& (C_WantToEat (self, other))
		{
			Npc_ClearAIQueue(self);
			AI_StandUp		(self);
			return LOOP_END;
		};
		
		// ------ Monster NICHT auf der Jagd - weitere Feinde Attacken ------
		Npc_PerceiveAll	(self);					// nötig, da Npc_GetNextTarget() auf der Liste der zuletzt Wahrgenommenen VOBs beruht, und das kann hier schon ne Weile her sein, denn ZS_Attack hat keine aktiven Wahrnehmungen

		if (!Npc_GetNextTarget(self))
		{
			return LOOP_END;
		};				// wenn True, wird hier target neu ermittelt (NUR die zu denen ich Hostile bin!)
		
		// ----- ist neues Ziel gefunden, in Reichweite, nicht down, nicht im Dialog? Dann neues Ziel, sonst End ------
		if (Hlp_IsValidNpc(other))
		&& (!C_NpcIsDown(other))
		&& ( (Npc_GetDistToNpc(self, other) < PERC_DIST_INTERMEDIAT) || (Npc_IsPlayer(other)) ) //Bei Nicht-Player Enemies nur auf 1000m reagieren (sonst ACTIVE_MAX)
		&& (B_GetAivar(other, AIV_INVINCIBLE) == FALSE)
		{
			self.aivar[AIV_LASTTARGET] = Hlp_GetInstanceID (other);
			return LOOP_CONTINUE;
		}
		else 									// wenn false, wird other gelöscht!
		{
			Npc_ClearAIQueue(self);
			AI_StandUp		(self);
			return LOOP_END;
		};
	};
};

func void ZS_MM_Attack_End ()
{
	// ------ other wieder holen, ist hier auf jeden Fall gelöscht! ------
	other = Hlp_GetNpc(self.aivar[AIV_LASTTARGET]);

	// ------ MonsterMage steckt Spruch weg / Orc steckt Waffe weg ------
	if (C_NpcIsMonsterMage(self))
	|| (self.guild == GIL_SKELETON)
	|| (self.guild == GIL_SUMMONED_SKELETON)
	|| (self.guild > GIL_SEPERATOR_ORC)
	{
		AI_RemoveWeapon (self);
	};
			
	// ------ Beute fressen ------
	if (Npc_IsDead(other))
	&& (C_WantToEat (self, other))					
	{
		Npc_ClearAIQueue(self);
		AI_StartState 	(self, ZS_MM_EatBody, 0, "");
		return;
	};
};