// ***************
// SPL_SummonDragon
// ***************

const int SPL_Cost_SummonDragon		= 150;


INSTANCE Spell_SummonDragon (C_Spell_Proto)	//ehem. Spell_Dragon
{
	time_per_mana			= 0;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
};

func int Spell_Logic_SummonDragon(var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_SummonDragon)
	{	
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_SummonDragon()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_SummonDragon;
	};

	if (Npc_IsPlayer(self)) 
	{	
		if (Mod_Gilde == 8)
		{
			Wld_SpawnNpcRange 	(self, Summoned_DragonFire, 1, 1000);
		}
		else if (Mod_Gilde == 11)
		{
			Wld_SpawnNpcRange	(self, Summoned_DragonIce, 1, 1000);
		}
		else
		{
			Wld_SpawnNpcRange	(self, Summoned_Dragon_Black, 1, 1000);
		};
	}
	else if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_1775_DMB_Beschwoerer_PAT))
	{
		Wld_SpawnNpcRange (self, Dragon_Black, 1, 1000);

		Mod_HasSummonedDragon = TRUE;
	}
	else
	{
		Wld_SpawnNpcRange (self, Dragon_Swamp, 1, 1000);
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};


