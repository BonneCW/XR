// ************
// SPL_Telekinese
// ************

const int SPL_Cost_Telekinese		= 5;
const int SPL_Damage_Telekinese 	= 0;


INSTANCE Spell_Telekinese (C_Spell_Proto)
{
	time_per_mana			= 0;
	damage_per_level		= SPL_Damage_Telekinese;
	damageType				= DAM_MAGIC;
	spelltype 				= SPELL_NEUTRAL;
};

func int Spell_Logic_Telekinese (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self)
	&& (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	&& ((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Mod_575_NONE_Fenia_NW))
	|| (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Mod_577_NONE_Garvell_NW)))
	{	
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

func void Spell_Cast_Telekinese()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Telekinese;
	};

	if (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Mod_575_NONE_Fenia_NW))
	{
		Mod_Garvell_Fenia = 2;

		AI_GotoNpc	(Mod_575_NONE_Fenia_NW, hero);

		CreateInvItems	(hero, ItSc_Telekinese, 1);
	}
	else if (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Mod_577_NONE_Garvell_NW))
	{
		Mod_Garvell_Fenia = 3;

		B_GiveInvItems	(other, hero, ItMi_Gold, 100);

		B_GivePlayerXP	(100);

		B_LogEntry	(TOPIC_MOD_GARVELL_FENIA, "Das sollte ihm eine Lehre sein.");
	};

	self.aivar[AIV_SelectSpell] += 1;
};
