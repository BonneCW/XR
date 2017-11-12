// ******************************************************************
// B_AssessMagic
// -------------
// Wahrnehmung ist für ALLE NSCs IMMER aktiv
// auch für den Spieler (s.u.)
// wir aufgerufen, sobald irgendein Spruch auf einen NSC wirkt
// setzt den NSC dan in den entsprechenden ZS
// die meisten Spells führen allerdings zu keinem ZS
// (sind unten nicht berücksichtigt)
// ------------------------------------------------------------------
// Beachtem: if (Npc_GetLastHitSpellID(self) == SPL_Sleep) funzt nicht,
// weil Sleep INSTANT wirkt (d.h. sofort SENDCAST zurückliefert)
// und beim Aufruf von B_AssessMagic NICHT mehr "Active" ist!
// ******************************************************************


func void B_AssessMagic ()
{
	self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
	
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(FireGolem_Griselda_01))
	&& (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(IceGolem_Griselda_01)) {
		B_MM_AssessDamage();
	};
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(IceGolem_Griselda_01))
	&& (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(FireGolem_Griselda_01)) {
		B_MM_AssessDamage();
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7314_Ziel_AW))
	{
		return;
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

	// ------ Bei ALLEN Spells. Damit andere NSCs den Angriff wahrnehmen können ------
	if (Npc_GetLastHitSpellCat(self) == SPELL_BAD)
	{
		Npc_SendPassivePerc	(self, PERC_ASSESSFIGHTSOUND, self, other);
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7265_GUR_BaalTavor_OGY))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7261_PSINOV_Novize_OGY))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7262_PSINOV_Novize_OGY))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7263_PSINOV_Novize_OGY))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7264_PSINOV_Novize_OGY))
	{
		return;
	};

	if (Npc_GetLastHitSpellID(self) == SPL_PalRepelEvil)
	|| (Npc_GetLastHitSpellID(self) == SPL_PalHolyBolt)
	{
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_7174_DEM_Randolph_NW))
		{
			Mod_Randolph_Started = 14;
		};
	};
	
//###	Addon ###	
	
	// ------ Whirlwind ------
	if (Npc_GetLastHitSpellID(self) == SPL_Whirlwind)
	{
		Npc_ClearAIQueue	(self);
		B_ClearPerceptions	(self);
		AI_StartState		(self, ZS_Whirlwind, 0, "");
		return;
	};
	
	// ------ Pyrokinesis ------
	if (Npc_GetLastHitSpellID(self) == SPL_PYROKINESIS_g1)
	{
		PrintDebugNpc		(PD_MAGIC, "...Pyrokinesis");	
		Npc_ClearAIQueue	(self);
		Npc_PercDisable		(self,	PERC_ASSESSCASTER);

		//	Damit andere NSCs den Angriff wahrnehmen können
		Npc_SendPassivePerc	(self,	PERC_ASSESSFIGHTSOUND, self, other);
		if ( !Npc_IsDead(self) && !Npc_IsInState(self,ZS_Unconscious))
		{
			PrintDebugNpc	(PD_MAGIC,	"...weder bewußtlos noch tot!" );	
			AI_StartState	(self,	ZS_Pyrokinesis, 0, "");
		};

		if (self.guild > GIL_SEPERATOR_HUM)
		&& (self.aivar[AIV_Trefferzone] == 0)
		{
			self.aivar[AIV_Trefferzone] = 2;
		};

		if (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(hero))
		&& (Npc_HasItems(hero, ItMi_KristallPrisma) == 1)
		{
			Mod_KristallPrisma_Absorbiert += 1;

			if (Mod_KristallPrisma_Absorbiert == 30)
			{
				Npc_RemoveInvItems	(hero, ItMi_KristallPrisma, 1);
				CreateInvItems	(hero, ItRu_KristallPrisma, 1);
			};
		};
	
		return;
	};
	
	// ------ Seelenraub ------
	if (Npc_GetLastHitSpellID(self) == SPL_Seelenraub)
	{
	    	Npc_ClearAIQueue (self);
	    	B_ClearPerceptions(self);
	    	AI_StartState(self, ZS_Seelenraub, 0, "");
	    	return;
	};
	// ---- Icelance ---
	// ---- Thunderstorm ----
	// ---- Geyser ----
	// ---- Waterfist ----
	// ---- SuckEnergy ----
	if (Npc_GetLastHitSpellID(self) == SPL_SuckEnergy)
	{
		Npc_ClearAIQueue	(self);
		B_ClearPerceptions	(self);
		AI_StartState		(self, ZS_SuckEnergy, 0, "");
		return;
	};
	if (Npc_GetLastHitSpellID(self) == SPL_BeliarCity)
	{
		Npc_ClearAIQueue	(self);
		B_ClearPerceptions	(self);
		AI_StartState		(self, ZS_BeliarCity, 0, "");
		return;
	};
	// ---- GreenTentacle ----
	if (Npc_GetLastHitSpellID(self) == SPL_Greententacle)	
	{
		Npc_ClearAIQueue	(self);
		B_ClearPerceptions	(self);
		AI_StartState	(self, ZS_Greententacle, 0, "");
		return;
		
	};
	// ---- GreenTentacle ----
	if (Npc_GetLastHitSpellID(self) == SPL_Laehmen)	
	{
		Npc_ClearAIQueue	(self);
		B_ClearPerceptions	(self);
		AI_StartState	(self, ZS_Laehmen, 0, "");
		return;
		
	};
	// ---- SummonGuardian ----
	// ---- Swarm ----
	if (Npc_GetLastHitSpellID(self) == SPL_Swarm)
	{
		Npc_ClearAIQueue	(self);
		B_ClearPerceptions	(self);
		AI_StartState		(self, ZS_Swarm, 0, "");
		return;
	};
	// ---- SummonZombie ----
	// ---- Skull ----
	
	var C_ITEM arm;
	arm = Npc_GetEquippedArmor(self);

	// ------ IceCube, IceWave ------
	if (Npc_GetLastHitSpellID(self) == SPL_IceCube)
	|| (Npc_GetLastHitSpellID(self) == SPL_IceWave)
	|| (Npc_GetLastHitSpellID(self) == SPL_IceRain)
	{
		if (C_NpcIsHero(self))
		&& ((Mod_SLD_WaermeRing == 1)
		|| (Mod_GuertelDerBewaehrung == 1))
		{
		}
		else if (C_NpcIsHero(self))
		&& (Mod_BalrogHeart == TRUE)
		&& (Npc_GetLastHitSpellID(self) == SPL_IceCube)
		{
		}
		else if (Hlp_IsItem(arm, ItAr_BDT_XL) == TRUE)
		|| (Hlp_IsItem(arm, ItAr_Maxim) == TRUE)
		{
		}
		else
		{
			Npc_ClearAIQueue	(self);
			B_ClearPerceptions	(self);
			AI_StartState		(self, ZS_MagicFreeze, 0, "");
			return;
		};
	};
	
	// ------ ChargeZap ------
	if (Npc_GetLastHitSpellID(self) == SPL_ChargeZap)
	{
		Npc_ClearAIQueue	(self);
		B_ClearPerceptions	(self);
		AI_StartState		(self, ZS_ShortZapped, 0, "");
		return;
	};
	
	/*// ------ ChargeZap ------
	if (Npc_GetLastHitSpellID(self) == SPL_EarthquakeNew)
	{
		Npc_ClearAIQueue	(self);
		B_ClearPerceptions	(self);
		B_MagicHurtNpc	(other, self, SPL_DAMAGE_EARTHQUAKENEW);
		return;
	};*/

	// ------ Fear ------
	if (Npc_GetLastHitSpellID(self) == SPL_Fear)	
	{
		Npc_ClearAIQueue	(self);
		B_ClearPerceptions	(self);
		Npc_SetTarget		(self,	other);
			
		if (self.guild < GIL_SEPERATOR_HUM)
		&& (self.guild != GIL_KDF)
		&& (self.guild != GIL_PAL)
		{
			//AI_StartState	(self, ZS_Flee, 0, "");
			AI_StartState	(self, ZS_MagicFlee, 0, "");
			return;
		}
		else if (self.guild > GIL_SEPERATOR_HUM)
		&& (self.guild != GIL_DRAGON)
		&& (self.guild != GIL_TROLL)
		&& (self.guild != GIL_STONEGOLEM)
		&& (self.guild != GIL_ICEGOLEM)
		&& (self.guild != GIL_FIREGOLEM)
		{
			AI_StartState	(self, ZS_MM_Flee, 0, "");
			return;
		};
	};
	
	// Firespells senden ein ASSESSMAGIC bei Kollision
	if (Npc_GetLastHitSpellID(self) == SPL_Firerain)		
	{	
		Npc_ClearAIQueue	(self);
		//B_ClearPerceptions	(self);	//Sonst reagiert der NPC nicht!
		AI_StartState(self, ZS_MagicBurnShort, 0, "");

		if (self.guild > GIL_SEPERATOR_HUM)
		&& (self.aivar[AIV_Trefferzone] == 0)
		{
			self.aivar[AIV_Trefferzone] = 2;
		};

		if (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(hero))
		&& (Npc_HasItems(hero, ItMi_KristallPrisma) == 1)
		{
			Mod_KristallPrisma_Absorbiert += 1;

			if (Mod_KristallPrisma_Absorbiert == 30)
			{
				Npc_RemoveInvItems	(hero, ItMi_KristallPrisma, 1);
				CreateInvItems	(hero, ItRu_KristallPrisma, 1);
			};
		};

		return;
	};

	if (Npc_GetLastHitSpellID(self) == SPL_Hagel)		
	{	
		Npc_ClearAIQueue	(self);
		//B_ClearPerceptions	(self);	//Sonst reagiert der NPC nicht!
		AI_StartState(self, ZS_Flee, 0, "");
		return;
	};
	
	// Restliche Feuerspells müssen auch versengen
	if (Npc_GetLastHitSpellID(self) == SPL_Firebolt)		
	|| (Npc_GetLastHitSpellID(self) == SPL_InstantFireball)
	|| (Npc_GetLastHitSpellID(self) == SPL_Firestorm)
	|| (Npc_GetLastHitSpellID(self) == SPL_PYrokinesis)
	{	
		if (self.guild > GIL_SEPERATOR_HUM)
		&& (self.aivar[AIV_Trefferzone] == 0)
		{
			self.aivar[AIV_Trefferzone] = 2;
		};

		if (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(hero))
		&& (Npc_HasItems(hero, ItMi_KristallPrisma) == 1)
		{
			Mod_KristallPrisma_Absorbiert += 1;

			if (Mod_KristallPrisma_Absorbiert == 30)
			{
				Npc_RemoveInvItems	(hero, ItMi_KristallPrisma, 1);
				CreateInvItems	(hero, ItRu_KristallPrisma, 1);
			};
		};

		return;
	};
		
};

// ***************************************************
// Anmeldung der AssessMagic-Wahrnehmung beim Spieler
// (auch wenn der Spieler NICHT zustandsgesteuert ist)
// Spieler hat also IMMER PERC_ASSESSMAGIC aktiv
// ***************************************************

const func PLAYER_PERC_ASSESSMAGIC = B_AssessMagic; 	
