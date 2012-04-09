// ***********
// SPL_GolemIceCube
// ***********

const int	SPL_Cost_GolemIceCube			=	0;
const int   SPL_FREEZE_DAMAGE		 	=	2;		// IceCube, IceWave
const int	SPL_TIME_FREEZE				=	19;		// IceCube, IceWave

//Achtung: wenn bei FREEZE (19) die Werte geändert werden, muß auch die Lebensdauer der PFX angepasst werden

INSTANCE Spell_GolemIceCube (C_Spell_Proto)
{
	time_per_mana			= 0;					//Wert wird nicht gebraucht - INSTANT-Spell
	damage_per_level 		= 60;					//Schaden wird im ZS_MagicFreeze angegeben!
};

func int Spell_Logic_GolemIceCube (var int manaInvested) //Parameter wird hier nicht gebraucht
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{	
		
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_GolemIceCube)
	{		
		
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_GolemIceCube()
{
	self.aivar[AIV_SelectSpell] += 1;
};
