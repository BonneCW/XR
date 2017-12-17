// ******************
// SPL_EnergyBall	//k3 - Beliars Rage
// ******************

const int SPL_Cost_EnergyBall 		= 100;
const int SPL_Damage_EnergyBall 	= 200;

INSTANCE Spell_EnergyBall (C_Spell_Proto)
{							
	time_per_mana			= 0;
	damage_per_level		= SPL_Damage_EnergyBall;
	damageType				= DAM_MAGIC;	
	targetCollectAlgo		= TARGET_COLLECT_FOCUS_FALLBACK_NONE;
	canTurnDuringInvest     = TRUE;
	canChangeTargetDuringInvest      = TRUE;
};

func int Spell_Logic_EnergyBall (var int manaInvested) //Parameter wird hier nicht gebraucht
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_EnergyBall)
	&& (Mod_GottStatus < 5)
	{		
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Energyball()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_EnergyBall;
	};

	B_PrismaAdd(SPL_Damage_EnergyBall);

	if (Mod_PrismaRitual_ZuLangsam == 1)
	{
		Mod_PrismaRitual_ZuLangsam = 0;

		Wld_PlayEffect ("SPELLFX_PRISMA", ItMi_Magieprisma_Fake, ItMi_Magieprisma_Fake, 0, 0, 0, FALSE);
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};
