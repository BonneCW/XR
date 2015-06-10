// ************
// SPL_IceRain
// ************

const int SPL_Cost_IceRain			= 200;
const int SPL_Damage_IceRain 		= 400;


INSTANCE Spell_IceRain (C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level		= SPL_Damage_IceRain; 							
	damageType				= DAM_MAGIC;										
	targetCollectAlgo		= TARGET_COLLECT_NONE;
};

func int Spell_Logic_IceRain	(var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_IceRain)
	{		
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_IceRain()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_IceRain;
	};

	B_PrismaAdd(SPL_Damage_Icerain);
	
	self.aivar[AIV_SelectSpell] += 1;
};




