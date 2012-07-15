// *********
// SPL_Charm
// *********

const int SPL_Cost_Charm		= 50;
const int SPL_Damage_Charm 		= 0;


INSTANCE Spell_Charm(C_Spell_Proto)
{
	time_per_mana			= 0;
	spelltype 				= SPELL_NEUTRAL;
	damage_per_level		= SPL_Damage_Charm;
	damageType				= DAM_MAGIC;						// war vorher DAM_FIRE
};

func int Spell_Logic_Charm(var int manaInvested)
{
	if ((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll)))
	|| (self.attribute[ATR_MANA] >= SPL_Cost_Charm)
	{
		//---STORY: Ignaz-Mission-----------------------------
		if (B_GetAivar(other, AIV_NpcSawPlayerCommit) != CRIME_NONE)
		&& (MIS_Ignaz_Charm == LOG_RUNNING)
		{
			Charm_Test = TRUE;
		};
		//----------------------------------------------------
			
		B_DeletePetzCrime (other); ///hat bei CRIME_NONE (oder keiner Home-Location) keine Auswirkungen
 		B_SetAivar(other, AIV_NpcSawPlayerCommit, CRIME_NONE);
 		B_SetAivar(other, AIV_LastFightAgainstPlayer, FIGHT_NONE);
 		
 		// ------ Opfer (other) ist nicht GILDEN-Hostile zu other ------
		if (Wld_GetGuildAttitude(other.guild, self.guild) != ATT_HOSTILE)
		{	
			// ------ ABER temp_hostile (d.h. hat gerade gegen den Spieler gekämpft) ------
			if (Npc_GetAttitude (other, self) == ATT_HOSTILE)
			{
				Npc_SetTempAttitude(other, Wld_GetGuildAttitude(other.guild, self.guild));
			};
		};

		if (Mod_SabitschTotPetze == 1)
		&& (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Mod_962_STT_Scatty_MT))
		{
			Mod_SabitschTotPetze == 0;
		};

		if (Npc_KnowsInfo(hero, Info_Mod_Boltan_TomKraut))
		{
			if (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Mil_332_Stadtwache))
			{
				Mod_SenyanTom_Kraut_Wache_01 = 1;
			};
			if (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Mil_333_Stadtwache))
			{
				Mod_SenyanTom_Kraut_Wache_02 = 1;
			};
			if (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Mod_598_MIL_Mika_NW))
			{
				Mod_SenyanTom_Kraut_Mika = 1;
			};
		};
 		
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Charm()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Charm;
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};