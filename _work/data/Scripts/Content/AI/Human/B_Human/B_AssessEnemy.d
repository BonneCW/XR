// ********************************************************************************
// B_AssessEnemy
// -------------
// Wenn NSC einen aNSC (oder Monster) sieht(!), zu dem er GILDEN(!)-Att_Hostile hat
// Hier wird davon ausgegangen,dass other auf JEDEN FALL ein Enemy ist!
// NSC geht in ZS_Attack (dort wird auf evtl. Flucht gecheckt)
// Reichweite: PERC_DIST_ACTIVE_MAX
// AssessEnemy wird NACH AssessPlayer gecheckt
// ********************************************************************************

func int B_AssessEnemy()
{
	// EXIT IF...

	B_Vergiftet (self);

	if (B_GetAivar(other, AIV_INVINCIBLE) == TRUE)
	|| (B_GetAivar(self, AIV_INVINCIBLE) == TRUE)
	{
		return FALSE;
	};

	if (self.guild == GIL_STRF)
	&& (other.guild == GIL_STRF) {
		return FALSE;
	};
	
	if (CurrentLevel == HALLUZINATION_ZEN)
	&& (self.guild > GIL_SEPERATOR_HUM) {
		return FALSE;
	};
	
	if (CurrentLevel == EISGEBIET_ZEN) {
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7643_HEX_Griselda_EIS))
		&& (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(hero))
		&& (playerIsTransformed) {
			return FALSE;
		};
	};
	
	if (Mod_XW_Kap6_Scene01_Counter > 0 && Mod_XW_Kap6_Scene01_Counter < 45) {
		return FALSE;
	};
	
	if (Kapitel >= 6 && Hlp_GetInstanceID(self) == Hlp_GetInstanceID(PC_Friend_XW)) {
		return FALSE;
	};

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
					return FALSE;
				};
			}
			else if (Npc_GetWalkMode(hero) == NPC_WALK)
			{
				if (Npc_GetDistToNpc(self, hero) > 300)
				{
					return FALSE;
				};
			}
			else
			{
				if (Npc_GetDistToNpc(self, hero) > 400)
				{
					return FALSE;
				};
			};
		};
	};
		
	// ------- TESTMODE: Levelinspektor wird ignoriert ------
	var C_NPC PCL; PCL = Hlp_GetNpc(PC_Levelinspektor);
	if (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(PCL))
	{
		return FALSE;
	};

	if (CurrentLevel == MINENTAL_ZEN)
	{
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Monster_11058_Demon_MT))
		&& (!Npc_KnowsInfo(hero, Info_Mod_DemonChromanin_Hi))
		{
			return FALSE;
		};

		if (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Gobbo_Fester_04))
		{
			return FALSE;
		};

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_948_BDT_Esteban_MT))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_4072_BDT_Bandit_MT))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_4073_BDT_Bandit_MT))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_4074_BDT_Bandit_MT))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_4075_BDT_Bandit_MT))
		{
			if (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Mod_7326_VLK_Haendler_MT))
			|| (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Mod_7327_VLK_Haendler_MT))
			{
				if (Mod_Banditenueberfall_Esteban == 6)
				|| (Mod_Banditenueberfall_Esteban == 7)
				{
					B_Attack	(self, other, AR_Kill, 0);

					return TRUE;
				};
			};
		};
	};

	if (CurrentLevel == NEWWORLD_ZEN)
	{
		if (Hlp_StrCmp(self.name, "Minenzwerg"))
		|| (Hlp_StrCmp(other.name, "Minenzwerg"))
		{
			return FALSE;
		};

		if (C_NpcIsSeelenpeiniger(self))
		&& (C_NpcIsHero(other))
		{
			if (Mod_HQ_SPGesehen == FALSE)
			{
				Mod_HQ_SPGesehen = TRUE;

				B_LogEntry	(TOPIC_MOD_DAEMONISCH, "Scheiße, was sind denn das für schwarze Schattenviecher ...");
			};

			B_Attack	(self, other, AR_GuildEnemy, 0);
			return TRUE;
		};

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7299_OUT_Hel_NW))
		&& (other.guild > GIL_SEPERATOR_HUM)
		{
			return FALSE;
		};

		if ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Kleindrache))
		|| (self.aivar[AIV_MM_REAL_ID] == ID_KOBOLD)
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Schrat_11011_NW))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Schrat_11019_NW))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Schrat_11020_NW))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Schrat_11021_NW))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Schrat_11022_NW))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Feuerdrache_11002_NW))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Knucker_11001_NW))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Giftdrache_11004_NW)))
		&& (Mod_NL_HasKamm >= 3)
		{
			self.flags = 0;
			B_Attack	(self, other, AR_GuildEnemy, 0);
			return TRUE;
		};

		if (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Minenzwerg_01))
		|| (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Minenzwerg_02))
		|| (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Minenzwerg_03))
		|| (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Minenzwerg_04))
		{
			return FALSE;
		};

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Kobold_11000_NW))
		&& (Mod_NL_Siegelbuch > 5)
		{
			return FALSE;
		};

		if (self.aivar[AIV_MM_REAL_ID] == ID_KOBOLD)
		&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Kobold_11000_NW))
		&& (Mod_NL_HasKamm < 3)
		{
			return FALSE;
		};

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_534_KDF_Milten_NW))
		&& (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Troll_Black))
		{
			return FALSE;
		};

		if (Mod_Edgor_SchafeSchlachten == 1)
		|| (Mod_Edgor_SchafeSchlachten == 2)
		{
			if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_946_BDT_Edgor_NW))
			{
				if (Npc_GetDistToNpc(Mod_946_BDT_Edgor_NW, Sheep_Bengar_01) < 1000)
				&& (!Npc_IsDead(Sheep_Bengar_01))
				{
					B_Attack	(Mod_946_BDT_Edgor_NW, Sheep_Bengar_01, AR_Kill, 0);
					return TRUE;
				}
				else if (Npc_GetDistToNpc(Mod_946_BDT_Edgor_NW, Sheep_Bengar_02) < 1000)
				&& (!Npc_IsDead(Sheep_Bengar_02))
				{
					B_Attack	(Mod_946_BDT_Edgor_NW, Sheep_Bengar_02, AR_Kill, 0);
					return TRUE;
				}
				else if (Npc_GetDistToNpc(Mod_946_BDT_Edgor_NW, Sheep_Bengar_03) < 1000)
				&& (!Npc_IsDead(Sheep_Bengar_03))
				{
					B_Attack	(Mod_946_BDT_Edgor_NW, Sheep_Bengar_03, AR_Kill, 0);
					return TRUE;
				}
				else if (Npc_GetDistToNpc(Mod_946_BDT_Edgor_NW, Sheep_Bengar_04) < 1000)
				&& (!Npc_IsDead(Sheep_Bengar_04))
				{
					B_Attack	(Mod_946_BDT_Edgor_NW, Sheep_Bengar_04, AR_Kill, 0);
					return TRUE;
				}
				else if (Npc_GetDistToNpc(Mod_946_BDT_Edgor_NW, Sheep_Bengar_05) < 1000)
				&& (!Npc_IsDead(Sheep_Bengar_05))
				{
					B_Attack	(Mod_946_BDT_Edgor_NW, Sheep_Bengar_05, AR_Kill, 0);
					return TRUE;
				}
				else if (Npc_GetDistToNpc(Mod_946_BDT_Edgor_NW, Hammel_Bengar_01) < 1000)
				&& (!Npc_IsDead(Hammel_Bengar_01))
				{
					B_Attack	(Mod_946_BDT_Edgor_NW, Hammel_Bengar_01, AR_Kill, 0);
					return TRUE;
				}
				else if (Npc_GetDistToNpc(Mod_946_BDT_Edgor_NW, Schaeferhund_Malak) < 1000)
				&& (!Npc_IsDead(Schaeferhund_Malak))
				{
					B_Attack	(Mod_946_BDT_Edgor_NW, Schaeferhund_Malak, AR_Kill, 0);
					return TRUE;
				};

				if (other.aivar[AIV_MM_REAL_ID] == ID_SHEEP)
				|| (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Schaeferhund_Malak))
				|| (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Mod_767_BAU_Malak_NW))
				{
					B_Attack	(Mod_946_BDT_Edgor_NW, other, AR_Kill, 0);
					return TRUE;
				};
			};
			if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_952_BDT_Franco_NW))
			{
				if (Npc_GetDistToNpc(Mod_952_BDT_Franco_NW, Sheep_Bengar_01) < 1000)
				&& (!Npc_IsDead(Sheep_Bengar_01))
				{
					B_Attack	(Mod_952_BDT_Franco_NW, Sheep_Bengar_01, AR_Kill, 0);
					return TRUE;
				}
				else if (Npc_GetDistToNpc(Mod_952_BDT_Franco_NW, Sheep_Bengar_02) < 1000)
				&& (!Npc_IsDead(Sheep_Bengar_02))
				{
					B_Attack	(Mod_952_BDT_Franco_NW, Sheep_Bengar_02, AR_Kill, 0);
					return TRUE;
				}
				else if (Npc_GetDistToNpc(Mod_952_BDT_Franco_NW, Sheep_Bengar_03) < 1000)
				&& (!Npc_IsDead(Sheep_Bengar_03))
				{
					B_Attack	(Mod_952_BDT_Franco_NW, Sheep_Bengar_03, AR_Kill, 0);
					return TRUE;
				}
				else if (Npc_GetDistToNpc(Mod_952_BDT_Franco_NW, Sheep_Bengar_04) < 1000)
				&& (!Npc_IsDead(Sheep_Bengar_04))
				{
					B_Attack	(Mod_952_BDT_Franco_NW, Sheep_Bengar_04, AR_Kill, 0);
					return TRUE;
				}
				else if (Npc_GetDistToNpc(Mod_952_BDT_Franco_NW, Sheep_Bengar_05) < 1000)
				&& (!Npc_IsDead(Sheep_Bengar_05))
				{
					B_Attack	(Mod_952_BDT_Franco_NW, Sheep_Bengar_05, AR_Kill, 0);
					return TRUE;
				}
				else if (Npc_GetDistToNpc(Mod_952_BDT_Franco_NW, Hammel_Bengar_01) < 1000)
				&& (!Npc_IsDead(Hammel_Bengar_01))
				{
					B_Attack	(Mod_952_BDT_Franco_NW, Hammel_Bengar_01, AR_Kill, 0);
					return TRUE;
				}
				else if (Npc_GetDistToNpc(Mod_952_BDT_Franco_NW, Schaeferhund_Malak) < 1000)
				&& (!Npc_IsDead(Schaeferhund_Malak))
				{
					B_Attack	(Mod_952_BDT_Franco_NW, Schaeferhund_Malak, AR_Kill, 0);
					return TRUE;
				};

				if (other.aivar[AIV_MM_REAL_ID] == ID_SHEEP)
				|| (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Schaeferhund_Malak))
				|| (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Mod_767_BAU_Malak_NW))
				{
					B_Attack	(Mod_952_BDT_Franco_NW, other, AR_Kill, 0);
					return TRUE;
				};
			};
		};

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Schattenwolf_Elena))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Schattenwolf_Rega))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Schattenwolf_Magd))
		{
			if (other.aivar[AIV_MM_REAL_ID] == ID_SHEEP)
			|| (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Schaeferhund_Pepe))
			{
				B_Attack	(self, other, AR_None, 0);
				return TRUE;
			};
		};
	};

	if (CurrentLevel == DRAGONISLAND_ZEN)
	{
		if ((other.guild == GIL_DEMON)
		|| (self.guild == GIL_DEMON))
		&& (!Npc_KnowsInfo(hero, Info_Mod_Demonlord_IR_Hi))
		{
			return FALSE;
		};
	};

	if (CurrentLevel == ADDONWORLD_ZEN)
	{
		if ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Monster_11057_Mutantengolem_AW))
		|| (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Monster_11057_Mutantengolem_AW)))
		&& ((Mod_Mutantengolem == 2)
		|| (Mod_Mutantengolem == 3))
		{
			return FALSE;
		};
	};

	if (CurrentLevel == RELENDEL_ZEN)
	{
		if (other.aivar[AIV_MM_REAL_ID] == ID_Insekt)
		&& (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(Mod_7385_OUT_August_REL))
		&& (!Npc_KnowsInfo(hero, Info_Mod_Axon_Plagenquest))
		{
			return FALSE;
		};

		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7405_OUT_Cirio_REL))
		&& (other.guild == GIL_GIANT_RAT)
		{
			return FALSE;
		};
	};

	if (CurrentLevel == FREEMINE_ZEN)
	{
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Gormgniez_11007_FM))
		{
			return FALSE;
		};
	};

	if (self.guild == GIL_DRACONIAN)
	&& (other.guild == GIL_SWAMPSHARK)
	{
		return FALSE;
	};

	if (other.aivar[AIV_MM_REAL_ID] == ID_KOBOLD)
	&& (Mod_NL_HasKamm < 3)
	{
		return FALSE;
	};

	if (CurrentLevel == DIEINSEL_ZEN)
	{
		if (C_NpcIsHero(other))
		&& (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1552_SKE_Skelett_DI))
		&& (!Npc_KnowsInfo(hero, Info_Mod_Skelett_Hi))
		{
			return FALSE;
		};
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Dschinn_11012_FM))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Dschinn_11013_OM))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Dschinn_11014_VM))
	{
		return FALSE;
	};

	if (C_NpcIsHero(other))
	&& (Unsichtbarkeitsperk == TRUE)
	{
		return FALSE;
	};

	if (CurrentLevel == OLDMINE_ZEN)
	{
		if (Npc_KnowsInfo(hero, Info_Mod_Oric_AtAustausch))
		&& (self.npctype == NPCTYPE_om_schwarzerkrieger)
		&& (other.npctype != NPCTYPE_om_schwarzerkrieger)
		{
			B_Attack	(self, other, AR_GuildEnemy, 0);
			return TRUE;
		};

		if (C_NpcIsSeelenpeiniger(self))
		&& (C_NpcIsHero(other))
		{
			B_Attack	(self, other, AR_GuildEnemy, 0);
			return TRUE;
		};
	};

	if (CurrentLevel == ORCGRAVEYARD_ZEN)
	{
		if ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(UndeadOrcWarrior_Geiselwache_01))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(UndeadOrcWarrior_Geiselwache_02))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(UndeadOrcWarrior_Geiselwache_03))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(UndeadOrcWarrior_Geiselwache_04))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(UndeadOrcWarrior_Geiselwache_05))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(UndeadOrcWarrior_Geiselwache_06))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7261_PSINOV_Novize_OGY))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7262_PSINOV_Novize_OGY))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7263_PSINOV_Novize_OGY))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7264_PSINOV_Novize_OGY))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_10033_ORC_UndeadShamane_OGY))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7265_GUR_BaalTavor_OGY)))
		&& (Mod_NL_BarriereAttack == 0)
		{
			return FALSE;
		};
	};

	if (self.aivar[AIV_MM_REAL_ID] == ID_SCHAEFERHUND)
	{
		return FALSE;
	};

	if (other.guild == GIL_STONEGUARDIAN)
	{
		return FALSE;
	};

	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_NpcIsHero(other))
	{
		return FALSE;
	};

	if (C_NpcIsHero(other))
	&& (C_NpcIsAdanosStoryMonster(self))
	&& (Mod_WM_Kontrolled > 0)
	{
		return FALSE;
	};

	if (self.guild == GIL_DMT)
	&& (CurrentLevel == FLIEGENDEINSEL_ZEN)
	{
		return FALSE;
	};

	//ADDON>
	// ------- NoFightParker NPC kloppt sich nur mit Monstern oder dem Player, wird auch nie angegriffen ------
	if ((Hlp_GetInstanceID(other) != Hlp_GetInstanceID(hero))
		&& (other.guild < GIL_SEPERATOR_HUM)
		&& (	(self.aivar[AIV_NoFightParker] == TRUE)
			|| 	(other.aivar[AIV_NoFightParker] == TRUE)))
		|| ((other.guild > GIL_SEPERATOR_HUM) && (other.aivar[AIV_NoFightParker] == TRUE))//Monster mit AIV_NoFightParker = TRUE werden auch ignoriert
	{
		return FALSE;
	};
		
	//--------Feind wird toleriert --------
	if (C_OtherIsToleratedEnemy(self, other)) 
	{
		if (self.aivar[AIV_OrkUluMulu] == FALSE)
		{
			AI_TurnToNpc(self, other);
			AI_PlayAni	(self, "T_ANGRY");

			self.aivar[AIV_OrkUluMulu] = TRUE;
		};

		return FALSE;
	};
	
	//ADDON<
	
	// ------ Gegner im Wasser ------
	if (C_BodyStateContains(other,BS_SWIM) || C_BodyStateContains(other,BS_DIVE))
	&& (self.aivar[AIV_MM_FollowInWater] == FALSE)
	{
		return FALSE;
	};
	
	// ------- Burgzinnenwachen sollen sich nicht zu Tode stürzen, etc. ------
	if (Npc_GetHeightToNpc(self, other) > PERC_DIST_HEIGHT)
	{
		return FALSE;
	};
	
	// ------- für Party-NSCs -------
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if (Npc_GetDistToNpc (self, other) > 1500) //Sollen nicht so weit weg angreifen
		{
			return FALSE;
		};
		
		if (!Npc_CanSeeNpc (self, other))
		{	
			return FALSE;
		};
	};
	
	// ------- Verkleidete Banditen -----------
	if (C_PlayerisFakeBandit(self,other))
	&& (self.guild == GIL_BDT)
	{
		return FALSE;
	};
	
	// ------- OVERRIDE für Enemies, die noch vorher quatschen sollen ------
	if ( (self.aivar[AIV_EnemyOverride] == TRUE) || (other.aivar[AIV_EnemyOverride] == TRUE) )
	&& (other.guild < GIL_SEPERATOR_HUM)
	{
		return FALSE;
	};
	
	// ------- Sicherheitsabfrage (B_AssessEnemy wird auch von anderen Funktionen aufgerufen, nicht nur über Wahrnehmung) ------
	if (Npc_GetAttitude (self, other) != ATT_HOSTILE)
	{
		return FALSE;
	};
	
	if (C_NpcIsGateGuard(self))
	{
		return FALSE;
	};
	
	// ------ Npctype_Friend ignoriert den Spieler-Enemy ------
	if ( Npc_IsPlayer(other) && (self.npctype == NPCTYPE_FRIEND) ) 
	{
		return FALSE;
	};
	
	// ------ ich bin nicht GILDEN-Hostile zu other ------
	if (Wld_GetGuildAttitude(self.guild, other.guild) != ATT_HOSTILE)
	{
		// ------ ABER ich bin temp_hostile (d.h. hab gerade gegen den Spieler gekämpft) ------
		if (Npc_GetAttitude (self, other) == ATT_HOSTILE)
		// -------------------------
		// && Npc_IsPlayer(other) - auskommentiert, weil ich NUR zum Player Temp_Att haben kann ------
		// ------ NICHT direkt nach ZS-Attack-Abbruch reagieren ------
		&& ( (Npc_GetStateTime(self) > 2) || Npc_IsInState(self, ZS_ObservePlayer) )
		// ------ Kampf nur fortsetzen, wenn Spieler näher als 10m ------
		&& (Npc_GetDistToNpc(self,other) <= PERC_DIST_INTERMEDIAT)
		{
			B_Attack (self, other, self.aivar[AIV_LastPlayerAR], 0);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};

	
	// FUNC
		
	B_Attack (self, other, AR_GuildEnemy, 0);
	return TRUE;
};


	
