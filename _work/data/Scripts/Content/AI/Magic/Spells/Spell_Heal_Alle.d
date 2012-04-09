// ****************
// Alle Heal Spells
// ****************

const int SPL_Cost_PalLightHeal		= 10;
const int SPL_Cost_PalMediumHeal	= 20;
const int SPL_Cost_PalFullHeal		= 30;
const int SPL_Cost_LightHeal		= 10;
const int SPL_Cost_MediumHeal		= 20;
const int SPL_Cost_FullHeal			= 30;

const int SPL_Heal_PalLightHeal		= 200;
const int SPL_Heal_PalMediumHeal	= 400;
const int SPL_Heal_PalFullHeal		= 800;

const int SPL_Heal_LightHeal		= 200;
const int SPL_Heal_MediumHeal		= 400;
const int SPL_Heal_FullHeal			= 800;

// ------ Instanz für alle normalen Heal-Sprüche ------
instance Spell_Heal (C_Spell_Proto)
{
	time_per_mana			= 0;
	spelltype 				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_CASTER;
	canTurnDuringInvest		= 0;
};


// ------ Instanz für alle Paladin Heal-Sprüche ------
instance Spell_PalHeal (C_Spell_Proto)
{
	time_per_mana			= 0;
	spelltype 				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_CASTER;
	canTurnDuringInvest		= 0;
};


// ------ SPL_PalLightHeal -------
func int Spell_Logic_PalLightHeal (var int manaInvested)
{	
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_PalLightHeal)
	{		
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

// ------ SPL_PalMediumHeal -------
func int Spell_Logic_PalMediumHeal (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_PalMediumHeal)
	{	
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};


// ------ PalFullHeal -------
func int Spell_Logic_PalFullHeal (var int manaInvested)
{

	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_PalFullHeal)
	{		
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};


// ------ SPL_LightHeal -------
func int Spell_Logic_LightHeal (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_LightHeal)
	{		
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

// ------ SPL_MediumHeal -------
func int Spell_Logic_MediumHeal (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_MediumHeal)
	{	
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};


// ------ SPL_FullHeal -------
func int Spell_Logic_FullHeal (var int manaInvested)
{	
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{	
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_FullHeal)
	{		
		return SPL_SENDCAST;
	}
	else //nicht genug Mana
	{
		return SPL_SENDSTOP;
	};
};

FUNC VOID B_Heilzauber (var C_NPC healed, var int value)
{
	if (!Hlp_IsValidNpc(healed))
	{
		return;
	};

	if (Npc_IsDead(healed))
	{
		return;
	};

	Npc_ChangeAttribute	(healed, ATR_HITPOINTS, value);

	healed.aivar[AIV_Damage] = healed.attribute[ATR_HITPOINTS];
};

func void Spell_Cast_Heal()
{	
	if (Mod_WM_Iwan == 1)
	&& (Mod_Extension_Angelegt == 1)
	&& (Npc_GetDistToWP(hero, "NW_CRYPT_IN_11") < 500)
	{
		Wld_InsertNpc	(Mod_7206_NONE_Iwan_NW, "NW_CRYPT_IN_11");

		Mod_WM_Iwan = 2;
	};

	if ( Npc_GetActiveSpell(self) == SPL_LightHeal		)	
	{	
		if (Npc_GetActiveSpellIsScroll(self))
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
		}
		else
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_LightHeal;
		};

		Npc_ChangeAttribute	(self,ATR_HITPOINTS, +SPL_Heal_LightHeal);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		if (Mod_Extension_Angelegt == 1)
		&& (CurrentLevel == ORCCITY_ZEN)
		{
			B_Heilzauber	(Mod_7179_BDT_Bandit_OC, SPL_Heal_LightHeal);
			B_Heilzauber	(Mod_7186_BDT_Morgahard_OC, SPL_Heal_LightHeal);
			B_Heilzauber	(Mod_7185_BDT_Bandit_OC, SPL_Heal_LightHeal);
			B_Heilzauber	(Mod_7184_BDT_Esteban_OC, SPL_Heal_LightHeal);
			B_Heilzauber	(Mod_7183_BDT_Miguel_OC, SPL_Heal_LightHeal);
			B_Heilzauber	(Mod_7182_BDT_Juan_OC, SPL_Heal_LightHeal);
			B_Heilzauber	(Mod_7181_BDT_Logan_OC, SPL_Heal_LightHeal);
			B_Heilzauber	(Mod_7180_BDT_Skinner_OC, SPL_Heal_LightHeal);
		};

		return;
	};
	
	if ( Npc_GetActiveSpell(self) == SPL_MediumHeal		)	
	{	
		if (Npc_GetActiveSpellIsScroll(self))
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
		}
		else
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_MediumHeal;		
		};
		Npc_ChangeAttribute	(self,ATR_HITPOINTS, +SPL_Heal_MediumHeal);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		if (Mod_Extension_Angelegt == 1)
		&& (CurrentLevel == ORCCITY_ZEN)
		{
			B_Heilzauber	(Mod_7179_BDT_Bandit_OC, SPL_Heal_MediumHeal);
			B_Heilzauber	(Mod_7186_BDT_Morgahard_OC, SPL_Heal_MediumHeal);
			B_Heilzauber	(Mod_7185_BDT_Bandit_OC, SPL_Heal_MediumHeal);
			B_Heilzauber	(Mod_7184_BDT_Esteban_OC, SPL_Heal_MediumHeal);
			B_Heilzauber	(Mod_7183_BDT_Miguel_OC, SPL_Heal_MediumHeal);
			B_Heilzauber	(Mod_7182_BDT_Juan_OC, SPL_Heal_MediumHeal);
			B_Heilzauber	(Mod_7181_BDT_Logan_OC, SPL_Heal_MediumHeal);
			B_Heilzauber	(Mod_7180_BDT_Skinner_OC, SPL_Heal_MediumHeal);
		};

		if (CurrentLevel == NEWWORLD_ZEN)
		&& (Npc_KnowsInfo(hero, Info_Mod_Cronos_Angriff_01))
		&& (!Npc_KnowsInfo(hero, Info_Mod_Cronos_Angriff_02))
		&& (Npc_KnowsInfo(hero, Info_Mod_Saturas_AW_Member_22))
		&& (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Mod_758_KDW_Cronos_NW))
		{
			B_Heilzauber	(hero, SPL_Heal_MediumHeal);
			B_Heilzauber	(Mod_1538_WKR_Wasserkrieger_NW, SPL_Heal_MediumHeal);
			B_Heilzauber	(Mod_1530_WKR_Everaldo_NW, SPL_Heal_MediumHeal);
			B_Heilzauber	(Mod_1539_WKR_Wasserkrieger_NW, SPL_Heal_MediumHeal);
			B_Heilzauber	(Mod_1533_WKR_Salvador_NW, SPL_Heal_MediumHeal);
			B_Heilzauber	(Mod_1537_WKR_Vanas_NW, SPL_Heal_MediumHeal);
			B_Heilzauber	(Mod_1536_WKR_Roka_NW, SPL_Heal_MediumHeal);
			B_Heilzauber	(Mod_1535_WKR_Wasserkrieger_NW, SPL_Heal_MediumHeal);
			B_Heilzauber	(Mod_1534_WKR_Wasserkrieger_NW, SPL_Heal_MediumHeal);
			B_Heilzauber	(Mod_1532_HTR_Ethan_NW, SPL_Heal_MediumHeal);
			B_Heilzauber	(Mod_538_RDW_Diego_NW, SPL_Heal_MediumHeal);
			B_Heilzauber	(Mod_588_WNOV_Joe_NW, SPL_Heal_MediumHeal);
		};

		return;
	};
	
	if ( Npc_GetActiveSpell(self) == SPL_FullHeal		)	
	{	
		if (Npc_GetActiveSpellIsScroll(self))
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
		}
		else
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_FullHeal;
		};
		Npc_ChangeAttribute	(self,ATR_HITPOINTS, + SPL_Heal_FullHeal);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];

		if (Mod_Extension_Angelegt == 1)
		&& (CurrentLevel == ORCCITY_ZEN)
		{
			B_Heilzauber	(Mod_7179_BDT_Bandit_OC, SPL_Heal_FullHeal);
			B_Heilzauber	(Mod_7186_BDT_Morgahard_OC, SPL_Heal_FullHeal);
			B_Heilzauber	(Mod_7185_BDT_Bandit_OC, SPL_Heal_FullHeal);
			B_Heilzauber	(Mod_7184_BDT_Esteban_OC, SPL_Heal_FullHeal);
			B_Heilzauber	(Mod_7183_BDT_Miguel_OC, SPL_Heal_FullHeal);
			B_Heilzauber	(Mod_7182_BDT_Juan_OC, SPL_Heal_FullHeal);
			B_Heilzauber	(Mod_7181_BDT_Logan_OC, SPL_Heal_FullHeal);
			B_Heilzauber	(Mod_7180_BDT_Skinner_OC, SPL_Heal_FullHeal);
		};

		return;
	};

	self.aivar[AIV_SelectSpell] += 1;
};

func void Spell_Cast_PalHeal()
{
	if ( Npc_GetActiveSpell(self) == SPL_PalLightHeal		)	
	{	
		if (Npc_GetActiveSpellIsScroll(self))
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
		}
		else
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_PalLightHeal;
		};
		Npc_ChangeAttribute	(self,ATR_HITPOINTS, +SPL_Heal_PalLightHeal);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
		return;
	};
	
	if ( Npc_GetActiveSpell(self) == SPL_PalMediumHeal		)	
	{	
		if (Npc_GetActiveSpellIsScroll(self))
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
		}
		else
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_PalMediumHeal;		
		};
		Npc_ChangeAttribute	(self,ATR_HITPOINTS, +SPL_Heal_PalMediumHeal);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
		return;
	};
	
	if ( Npc_GetActiveSpell(self) == SPL_PalFullHeal		)	
	{	
		if (Npc_GetActiveSpellIsScroll(self))
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
		}
		else
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_PalFullHeal;		
		};
		Npc_ChangeAttribute	(self,ATR_HITPOINTS, +SPL_Heal_PalFullHeal);

		self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
		return;
	};
	
	self.aivar[AIV_SelectSpell] += 1;
};
