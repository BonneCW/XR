// ****************
// SPL_Hagel	/K3
// ****************

const int SPL_Cost_Hagel 	= 100;
const int SPL_Damage_Hagel 	= 15;


INSTANCE Spell_Hagel  (C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level		= SPL_Damage_Hagel; 							
	damageType				= DAM_MAGIC;										
	targetCollectAlgo		= TARGET_COLLECT_NONE;
	spelltype 				= SPELL_NEUTRAL;
};

func int Spell_Logic_Hagel	(var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Hagel)
	{		
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Hagel()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Hagel;
	};

	if (Mod_WM_HexenHagel == 0)
	{
		if (Npc_GetDistToWP(hero, "NW_BIGFARM_FIELD_01") < 500)
		{
			if (Wld_IsTime(07,00,22,00))
			{
				Mod_WM_HexenHagel = 1;
			}
			else
			{
				Mod_WM_HexenHagel = 2;
			};
		}
		else
		{
			Mod_WM_HexenHagel = 2;
		};

		B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "Ich habe die Spruchrolle angewendet.");
	};

	B_PrismaAdd(SPL_Damage_Hagel);
	
	self.aivar[AIV_SelectSpell] += 1;
};




