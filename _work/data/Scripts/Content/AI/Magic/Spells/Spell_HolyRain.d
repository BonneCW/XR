// ************
// SPL_HolyRain
// ************

const int SPL_Cost_HolyRain			= 100;
const int SPL_Damage_HolyRain 		= 9999;


INSTANCE Spell_HolyRain (C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level		= SPL_Damage_HolyRain; 							
	damageType				= DAM_MAGIC;										
	targetCollectAlgo		= TARGET_COLLECT_NONE;
	targetCollectType		= TARGET_TYPE_ORCS|TARGET_TYPE_UNDEAD;
};

func int Spell_Logic_HolyRain	(var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	&& (Npc_GetDistToWP(hero, "GRYD_054") < 700)
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_HolyRain)
	&& (Npc_GetDistToWP(hero, "GRYD_054") < 700)
	{		
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_HolyRain()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_HolyRain;
	};

	B_PrismaAdd(SPL_Damage_HolyRain);

	Mod_UOS_HolySpell = 1;
	
	self.aivar[AIV_SelectSpell] += 1;
};