// ******************
// SPL_GolemGeyser	K3
// ******************

const int SPL_Cost_GolemGeyser 				= 0;
const int SPL_Damage_GolemGeyser 			= 150; 


INSTANCE Spell_GolemGeyser	(C_Spell_Proto)
{							
	time_per_mana			= 0;
	damage_per_level		= SPL_Damage_GolemGeyser;
	damageType				= DAM_MAGIC;
};

func int Spell_Logic_GolemGeyser (var int manaInvested) //Parameter wird hier nicht gebraucht
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_GolemGeyser)
	{		
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_GolemGeyser()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_GolemGeyser;
	};

	B_PrismaAdd(SPL_Damage_GolemGeyser);
	
	self.aivar[AIV_SelectSpell] += 1;
};
