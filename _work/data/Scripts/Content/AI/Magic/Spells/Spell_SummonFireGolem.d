// ***************
// SPL_SummonFireGolem
// ***************

const int SPL_Cost_SummonFireGolem		= 80;


INSTANCE Spell_SummonFireGolem (C_Spell_Proto)	//ehem. Spell_Golem
{
	time_per_mana			= 0;
	spelltype 				= SPELL_BAD;
	targetCollectAlgo		= TARGET_COLLECT_NONE;
};

func int Spell_Logic_SummonFireGolem (var int manaInvested)
{	
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_SummonFireGolem / 2))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_SummonFireGolem)
	{
		if (C_NpcIsHero(self))
		{
			if (hero.guild == GIL_KDF)
			|| (Spheric_Manifestion == 1)
			{	
				return SPL_SENDCAST;
			}
			else
			{
				return SPL_SENDSTOP;
			};
		}
		else
		{
			return SPL_SENDCAST;
		};
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
	
};

func void Spell_Cast_SummonFireGolem()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_SummonFireGolem / 2;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_SummonFireGolem;
	};
	
	if (Npc_IsPlayer(self)) 
	{		
		Wld_SpawnNpcRange( self,Summoned_FireGolem,1,500);
	}
	else
	{
		Wld_SpawnNpcRange( self,FireGolem,1,500);
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};
