// ****************
// Alle AuraBerserker Spells
// ****************

FUNC VOID B_SetAuraBerserker (var C_NPC Berserker)
{
	if (!Npc_IsDead(Berserker))
	{
		Berserker.attribute[ATR_STRENGTH] += 50;
		Berserker.attribute[ATR_HITPOINTS_MAX] += 200;
		Berserker.attribute[ATR_HITPOINTS] += 200;
		Berserker.protection[PROT_EDGE] += 100000;
		Berserker.protection[PROT_BLUNT] += 100000;
		Berserker.protection[PROT_POINT] += 100000;
		Berserker.protection[PROT_FIRE] += 100;
		Berserker.protection[PROT_MAGIC] += 100;

		Berserker.aivar[AIV_Damage] = Berserker.attribute[ATR_HITPOINTS];
	};
};

FUNC VOID B_RemoveAuraBerserker (var C_NPC Berserker)
{
	if (!Npc_IsDead(Berserker))
	{
		Berserker.attribute[ATR_STRENGTH] -= 50;
		Berserker.attribute[ATR_HITPOINTS_MAX] -= 200;

		if (Berserker.attribute[ATR_HITPOINTS] <= 200)
		{
			Berserker.attribute[ATR_HITPOINTS] = 1;
		}
		else
		{
			Berserker.attribute[ATR_HITPOINTS] -= 200;
		};

		Berserker.aivar[AIV_Damage] = Berserker.attribute[ATR_HITPOINTS];

		Berserker.protection[PROT_EDGE] -= 100000;
		Berserker.protection[PROT_BLUNT] -= 100000;
		Berserker.protection[PROT_POINT] -= 100000;
		Berserker.protection[PROT_FIRE] -= 100;
		Berserker.protection[PROT_MAGIC] -= 100;
	};
};

const int SPL_Cost_AuraBerserker		= 10;

// ------ Instanz für alle normalen AuraBerserker-Sprüche ------
instance Spell_AuraBerserker (C_Spell_Proto)
{
	time_per_mana			= 0;
	spelltype 				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_CASTER;
	canTurnDuringInvest		= 0;
};

func int Spell_Logic_AuraBerserker (var int manaInvested)
{	
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_AuraBerserker)
	{		
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_AuraBerserker()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_AuraBerserker;
	};

	if (C_NpcIsHero(self))
	{
		Mod_AuraBerserker = 1;
		Mod_AuraBerserker_Counter = 120;

		B_SetAuraBerserker(hero);
	}
	else
	{
		Mod_AuraBerserker = 2;
		Mod_AuraBerserker_Counter = 120;

		B_SetAuraBerserker(hero);
		B_SetAuraBerserker(Mod_1538_WKR_Wasserkrieger_NW);
		B_SetAuraBerserker(Mod_1530_WKR_Everaldo_NW);
		B_SetAuraBerserker(Mod_1539_WKR_Wasserkrieger_NW);
		B_SetAuraBerserker(Mod_1533_WKR_Salvador_NW);
		B_SetAuraBerserker(Mod_1537_WKR_Vanas_NW);
		B_SetAuraBerserker(Mod_1536_WKR_Roka_NW);
		B_SetAuraBerserker(Mod_1535_WKR_Wasserkrieger_NW);
		B_SetAuraBerserker(Mod_1534_WKR_Wasserkrieger_NW);
		B_SetAuraBerserker(Mod_1532_HTR_Ethan_NW);
		B_SetAuraBerserker(Mod_758_KDW_Cronos_NW);

		if (Npc_KnowsInfo(hero, Info_Mod_Diego_PlateauAngriff))
		{
			B_SetAuraBerserker(Mod_538_RDW_Diego_NW);
		};

		if (Npc_KnowsInfo(hero, Info_Mod_Joe_Wassersnapper))
		{
			B_SetAuraBerserker(Mod_588_WNOV_Joe_NW);
		};

		Mod_Cronos_UsedBerserker = 1;
	};

	return;
	
	self.aivar[AIV_SelectSpell] += 1;
};