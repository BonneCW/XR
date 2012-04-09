// *****************
// B_MM_AssessDamage
// *****************

func void B_MM_AssessDamage ()
{
	B_Vergiftet (self);

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
			if (C_NpcIsHero(other))
			&& (DefenseBreak_Perk == TRUE)
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
			return;
		};
	};

	var C_Item rwp;
	rwp = Npc_GetReadiedWeapon(other);

	if (Hlp_IsItem(rwp, ItMw_Ritualdolch_Seuche) == TRUE)
	{
		self.aivar[AIV_Siechtum] = 50;
	};

	if (Npc_IsInState(other, ZS_Unconscious))
	{
		return;
	};

	if (C_NpcIsHero(other))
	&& (self.guild > GIL_SEPERATOR_HUM)
	{
		self.aivar[AIV_FLUGBLATTVERTEILT] = 1;
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
	&& (self.aivar[AIV_Blutet] == 0)
	{
		self.aivar[AIV_Blutet] = 20;
	};

	if (C_NpcIsHero(other))
	&& (Unsichtbarkeitsperk == TRUE)
	{		
		hero.flags = 0;

		Unsichtbarkeitsperk = FALSE;

		AI_Teleport	(hero, "PC_HERO");
	};

	if (CurrentLevel == ORCGRAVEYARD_ZEN)
	{
		if ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(UndeadOrcWarrior_Geiselwache_01))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(UndeadOrcWarrior_Geiselwache_02))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(UndeadOrcWarrior_Geiselwache_03))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(UndeadOrcWarrior_Geiselwache_04))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(UndeadOrcWarrior_Geiselwache_05))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(UndeadOrcWarrior_Geiselwache_06))
		|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_10033_ORC_UndeadShamane_OGY)))
		&& (Mod_NL_BarriereAttack == 0)
		&& (Mod_UOS_HolySpell == 0)
		{
			Mod_NL_UOS_Attack = 1;

			return;
		};
	};

	self.aivar[AIV_MM_PRIORITY] = PRIO_ATTACK;

	if (B_Knockout	(other, self))
	{
		Npc_SendPassivePerc	(self, PERC_ASSESSFIGHTSOUND, self, other);
		return;
	};

	if (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(WargTransform))
	&& (Mod_WM_Tiergestalt == 1)
	{
		Npc_ChangeAttribute	(other, ATR_HITPOINTS, 5);
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Wisp_Detector))
	&& (WispSearching == WispSearch_Fight)
	{
		if (other.guild > GIL_SEPERATOR_HUM)
		&& (other.guild != GIL_FRIENDLY_ORC)
		&& (other.guild != GIL_SHEEP)
		{
			Npc_ClearAIQueue	(self);
			Npc_SetTarget		(self, other);
			B_ClearPerceptions	(self);
			AI_StartState 		(self, ZS_MM_Attack, 0, "");
			return;
		};
	};
	
	// EXIT IF
	
	if (self.guild == GIL_STONEGUARDIAN)
	&& (self.aivar[AIV_EnemyOverride] == TRUE)
	{
		B_AWAKE_STONEGUARDIAN (self);
	};	
	
	// ----- wenn Monster Beute von Angreifer ------
	if (C_PredatorFoundPrey(other,self))
	{
		Npc_ClearAIQueue	(self);
		Npc_SetTarget 		(self, other);
		B_ClearPerceptions	(self);
		AI_StartState 		(self, ZS_MM_Flee, 0, "");	
		return;
	};

	// ------ wenn Monster im ZS_Attack ------
	if (Npc_IsInState(self,ZS_MM_Attack))
	{
		// EXIT IF...
	
		// ------ Partymember ignorieren Treffer vom Spieler im Kampf ------
		if (Npc_IsPlayer (other))
		&& (self.aivar[AIV_PARTYMEMBER] == TRUE)
		{
			return;
		};
		
		// ------ HACK: von Skelettmagier getroffene Skelette ignorieren Schaden ------
		if (self.aivar[AIV_MM_REAL_ID] == ID_SKELETON)
		&& (other.aivar[AIV_MM_REAL_ID] == ID_SKELETON_MAGE)
		{
			return;
		};
		
		
		// FUNC
		
		// ------ Wenn ich von jemand ANDEREM getroffen werde ------
		if (Hlp_GetInstanceID (other) != self.aivar[AIV_LASTTARGET])
		{
			if (self.aivar[AIV_HitByOtherNpc] == Hlp_GetInstanceID (other))
			{
				Npc_SetTarget (self, other); //Ziel wechseln, wenn zum zweiten Mal getroffen
			}
			else
			{
				self.aivar[AIV_HitByOtherNpc] = Hlp_GetInstanceID (other); //EIN Freischlag
			};
		};
			
		return;
	};
	
	
	// FUNC
	
	Npc_ClearAIQueue	(self);
	Npc_SetTarget		(self, other);
	B_ClearPerceptions	(self);
	AI_StartState		(self, ZS_MM_Attack, 0, "");
	return;
};


