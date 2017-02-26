// ********************
// Alle Teleport Spells
// ********************

const int SPL_Cost_Teleport		= 5;
var int AUFSUCHENACHSEELENSTEINE;

// ****************************************
// Print, wenn im falschen Level aktiviert
// ****************************************

func void B_PrintTeleportTooFarAway (var int Level)
{
	if (Level != CurrentLevel)
	{
		PrintScreen	(PRINT_TeleportTooFarAway ,-1,YPOS_LevelUp,FONT_ScreenSmall,2);
	};
};

// ------ Instanz für alle Teleport-Spells ------
INSTANCE Spell_Teleport (C_Spell_Proto)
{
	time_per_mana			= 0;
	spelltype 				= SPELL_NEUTRAL;
	targetCollectAlgo		= TARGET_COLLECT_CASTER;
	canTurnDuringInvest		= 0;
	targetCollectRange		= 0;
	targetCollectAzi		= 0;
	targetCollectElev		= 0;
};



// ------ zum Paladin-Secret ------
func int Spell_Logic_PalTeleportSecret (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	&& ((CurrentLevel == RELENDEL_ZEN)
	|| (CurrentLevel == MINENTAL_ZEN))
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_PalTeleportSecret()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "GOTODRACHENTAL");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

var int TooLessMana;

// ------ zum Paladin-Secret ------
func int Spell_Logic_TeleportOT (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	&& (HeroIstKeinZombie == TRUE)
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	&& (HeroIstKeinZombie == TRUE)
	{
		return SPL_SENDCAST;
	}
	else
	{
		if (TooLessMana == FALSE)
		{
			TooLessMana = TRUE;

			B_LogEntry	(TOPIC_MOD_ANFANG, "Dumm gelaufen. Als einfacher Zombie verfüge ich nicht über die magische Befähigung die Spruchrolle zu nutzen. Was jetzt?");
		};
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportOT()
{
	B_PrintTeleportTooFarAway (ORCTEMPEL_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	//Npc_RemoveInvItems	(hero, ItWr_ZombieToHuman, 1);
	Npc_RemoveInvItems	(hero, ItFoMuttonZombie, Npc_HasItems(hero, ItFoMuttonZombie));
	Npc_RemoveInvItems	(hero, ItLsTorch, Npc_HasItems(hero, ItLsTorch));

	AI_Teleport		(self, "OT2NW");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};


// ------ zur Hafen-Stadt ------
func int Spell_Logic_TeleportSeaport (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	&& (Npc_GetDistToWP(hero, "NW_CANTHARINSEL_08") > 10000)
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	&& (Npc_GetDistToWP(hero, "NW_CANTHARINSEL_08") > 10000)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportSeaport()
{
	B_PrintTeleportTooFarAway (NEWWORLD_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "HAFEN");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

// ------ zum Kloster ------
func int Spell_Logic_TeleportMonastery (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	&& (Npc_GetDistToWP(hero, "NW_CANTHARINSEL_08") > 10000)
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	&& (Npc_GetDistToWP(hero, "NW_CANTHARINSEL_08") > 10000)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportMonastery()
{
	B_PrintTeleportTooFarAway (NEWWORLD_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "KLOSTER");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

// ------ zum Kloster ------
func int Spell_Logic_Teleport_Pat (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	&& (Npc_GetDistToWP(hero, "NW_CANTHARINSEL_08") > 10000)
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	&& (Npc_GetDistToWP(hero, "NW_CANTHARINSEL_08") > 10000)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_Teleport_Pat()
{
	B_PrintTeleportTooFarAway (NEWWORLD_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "WAYTOPAT");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

// ------ zum Bauernhof ------
func int Spell_Logic_TeleportFarm (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	&& (Npc_GetDistToWP(hero, "NW_CANTHARINSEL_08") > 10000)
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	&& (Npc_GetDistToWP(hero, "NW_CANTHARINSEL_08") > 10000)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportFarm()
{
	B_PrintTeleportTooFarAway (NEWWORLD_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "BIGFARM");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

// ------ zu Xardas ------
func int Spell_Logic_TeleportXardas (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	&& (Npc_GetDistToWP(hero, "NW_CANTHARINSEL_08") > 10000)
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	&& (Npc_GetDistToWP(hero, "NW_CANTHARINSEL_08") > 10000)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportXardas()
{
	B_PrintTeleportTooFarAway (NEWWORLD_ZEN);

	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "XARDAS"); 
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

// ------ zum Pass in der NW ------
func int Spell_Logic_TeleportPassNW (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	&& (Npc_GetDistToWP(hero, "NW_CANTHARINSEL_08") > 10000)
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	&& (Npc_GetDistToWP(hero, "NW_CANTHARINSEL_08") > 10000)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportPassNW()
{
	B_PrintTeleportTooFarAway (NEWWORLD_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "LEVELCHANGE");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

// ------ zum Pass in der OW ------
func int Spell_Logic_TeleportPassOW (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};


func void Spell_Cast_TeleportPassOW()
{
	B_PrintTeleportTooFarAway (MINENTAL_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "SPAWN_MOLERAT02_SPAWN01");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

// ------ zum Old Camp ------
func int Spell_Logic_TeleportOC (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportOC()
{
	B_PrintTeleportTooFarAway (OLDWORLD_ZEN);

	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "OC_MAGE_CENTER");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

// ------ in den OW Dämonentower ------
func int Spell_Logic_TeleportOWDemonTower (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportOWDemonTower()
{
	B_PrintTeleportTooFarAway (MINENTAL_ZEN);

	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "DT_E3_03");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

// ------ Zur Taverne ------
func int Spell_Logic_TeleportTaverne (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	&& (Npc_GetDistToWP(hero, "NW_CANTHARINSEL_08") > 10000)
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	&& (Npc_GetDistToWP(hero, "NW_CANTHARINSEL_08") > 10000)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportTaverne ()
{
	B_PrintTeleportTooFarAway (NEWWORLD_ZEN);

	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "NW_TAVERNE_04");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};
func int Spell_Logic_TeleportDemonTower (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportDemonTower ()
{
	B_PrintTeleportTooFarAway (MINENTAL_ZEN);

	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "DT_E2_06");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};
func int Spell_Logic_TeleportPsicamp (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportPsicamp ()
{
	B_PrintTeleportTooFarAway (MINENTAL_ZEN);

	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "PSI_START");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};
func int Spell_Logic_TeleportOldcamp (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	&& (CurrentLevel == MINENTAL_ZEN)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportOldcamp ()
{
	B_PrintTeleportTooFarAway (MINENTAL_ZEN);

	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "OCC_CHAPEL_UPSTAIRS");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};
func int Spell_Logic_TeleportNewcamp (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportNewcamp ()
{
	B_PrintTeleportTooFarAway (MINENTAL_ZEN);

	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "NC_KDW_CAVE_CENTER");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};
func int Spell_Logic_Teleport4 (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	&& (Npc_GetDistToWP(self, "GRYD_060")>600)
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	&& (Npc_GetDistToWP(self, "GRYD_060")<600)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_Teleport4 ()
{
	B_PrintTeleportTooFarAway (ORCGRAVEYARD_ZEN);

	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "GRYD_072");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};
func int Spell_Logic_TeleportSektis (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	&& (Npc_GetDistToWP(self, "NW_LIGHTHOUSE_IN_01A") < 300)
	&& (CurrentLevel == NEWWORLD_ZEN)
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	&& (Npc_GetDistToWP(self, "NW_LIGHTHOUSE_IN_01A") < 300)
	&& (CurrentLevel == NEWWORLD_ZEN)
	{
		return SPL_SENDCAST;
	}
	else if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	&& (CurrentLevel == FLIEGENDEINSEL_ZEN)
	&& (FI_Story == 10)
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	&& (CurrentLevel == FLIEGENDEINSEL_ZEN)
	&& (FI_Story == 10)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportSektis ()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	if (CurrentLevel == NEWWORLD_ZEN)
	{
		AI_Teleport		(self, "WP_NW_ERFINDER");

		B_SetTopicStatus	(TOPIC_MOD_MILIZ_GIDAN, LOG_SUCCESS);
	}
	else if (CurrentLevel == FLIEGENDEINSEL_ZEN)
	{
		AI_Teleport	(self, "WAYTONW");
	};

	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

func int Spell_Logic_Teleport5 (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	&& (Npc_GetDistToWP(hero, "NW_CANTHARINSEL_08") > 10000)
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	&& (Npc_GetDistToWP(hero, "NW_CANTHARINSEL_08") > 10000)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_Teleport5 ()
{
	B_PrintTeleportTooFarAway (NEWWORLD_ZEN);

	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "NW_SHRINE_01");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

func int Spell_Logic_TeleportPatBack (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	&& (Npc_GetDistToWP(self, "WP_PAT_START") < 1000)
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	&& (Npc_GetDistToWP(self, "WP_PAT_START") < 1000)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportPatBack ()
{
	B_PrintTeleportTooFarAway (PATHERION_ZEN);

	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "WP_PAT_BACK");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

// ------ zum Kloster ------
func int Spell_Logic_Teleport_Pat_01 (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_Teleport_Pat_01()
{
	B_PrintTeleportTooFarAway (PATHERION_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "WP_PAT_START");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};


// ------ zum Kloster ------
func int Spell_Logic_Teleport_Pat_02 (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_Teleport_Pat_02()
{
	B_PrintTeleportTooFarAway (PATHERION_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "WP_PAT_WEG_182");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

func int Spell_Logic_TeleportBergwelt (var int manaInvested)
{
	if (CurrentLevel != ADDONWORLD_ZEN) {
		return SPL_SENDSTOP;
	} else if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportBergwelt()
{
	B_PrintTeleportTooFarAway (ADDONWORLD_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "WP_AW_TELEPORTBERGWELT2");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

func int Spell_Logic_TeleportVorAL (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportVorAL()
{
	B_PrintTeleportTooFarAway (MINENTAL_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "OC_ROUND_1");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

func int Spell_Logic_TeleportXD (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportXD()
{
	B_PrintTeleportTooFarAway (NEWWORLD_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "WP_TO_XD");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

func int Spell_Logic_Teleport_Eisgebiet (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	&& (CurrentLevel == MINENTAL_ZEN)
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	&& (CurrentLevel == MINENTAL_ZEN)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_Teleport_Eisgebiet()
{
	B_PrintTeleportTooFarAway (MINENTAL_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "WP_TO_EIS");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

func int Spell_Logic_TeleportEisSH (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportEisSH()
{
	B_PrintTeleportTooFarAway (EISGEBIET_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "EIS_03");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

func int Spell_Logic_TeleportBeliarOut (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportBeliarOut()
{
	B_PrintTeleportTooFarAway (ADDONWORLD_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "ADW_PORTALTEMPEL_TELEPORTSTATION");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );

	B_StartOtherRoutine	(Mod_678_DMB_Xardas_AW, "PRESTART");
};

func int Spell_Logic_TeleportBergfestung (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportBergfestung()
{
	B_PrintTeleportTooFarAway (MINENTAL_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "LOCATION_19_03_PATH_RUIN9");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

func int Spell_Logic_TeleportBeliarfestung (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportBeliarfestung()
{
	B_PrintTeleportTooFarAway (MINENTAL_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "PALTOBURG_2");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

func int Spell_Logic_TeleportKlosterruine (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportKlosterruine()
{
	B_PrintTeleportTooFarAway (MINENTAL_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "VMG_22");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

func int Spell_Logic_TeleportSonnenkreis (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	&& (Npc_GetDistToWP(hero, "NW_CANTHARINSEL_08") > 10000)
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	&& (Npc_GetDistToWP(hero, "NW_CANTHARINSEL_08") > 10000)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportSonnenkreis()
{
	B_PrintTeleportTooFarAway (NEWWORLD_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "NW_TROLLAREA_RITUALPATH_01");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

func int Spell_Logic_TeleportObelisk (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self)
	&& (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	&& ((CurrentLevel == NEWWORLD_ZEN)
	|| (CurrentLevel == MINENTAL_ZEN)
	|| (CurrentLevel == ADDONWORLD_ZEN)
	|| (CurrentLevel == PATHERION_ZEN)
	|| (CurrentLevel == RELENDEL_ZEN)
	|| (CurrentLevel == EISGEBIET_ZEN)
	&& (Npc_GetDistToWP(hero, "NW_CANTHARINSEL_08") > 10000)
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	&& ((CurrentLevel == NEWWORLD_ZEN)
	|| (CurrentLevel == MINENTAL_ZEN)
	|| (CurrentLevel == ADDONWORLD_ZEN)
	|| (CurrentLevel == PATHERION_ZEN)
	|| (CurrentLevel == RELENDEL_ZEN)
	|| (CurrentLevel == EISGEBIET_ZEN))
	&& (Npc_GetDistToWP(hero, "NW_CANTHARINSEL_08") > 10000)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportObelisk()
{
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
	
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	
	if  (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		B_SetAivar(self, AIV_INVINCIBLE, TRUE);
		PLAYER_MOBSI_PRODUCTION	=	MOBSI_TeleportObelisk;
		Ai_ProcessInfos (her);
	};
};

func int Spell_Logic_TeleportKhorata (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportKhorata()
{
	B_PrintTeleportTooFarAway (RELENDEL_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	if ((Mod_Leonhard_Endres == 0)
	|| (Npc_KnowsInfo(hero, Info_Mod_Leonhard_Endres)))
	&& ((Kapitel < 3)
	|| (Npc_KnowsInfo(hero, Info_Mod_August_Unruhen)))
	{
		AI_Teleport	(hero, "REL_CITY_089");
	}
	else
	{
		AI_Teleport	(hero, "REL_CITY_001");
	};

	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

func int Spell_Logic_TeleportTorgan (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportTorgan()
{
	B_PrintTeleportTooFarAway (MINENTAL_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "WP_MT_JAEGERLAGER_01");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

func int Spell_Logic_TeleportRELBauernhof (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportRELBauernhof()
{
	B_PrintTeleportTooFarAway (RELENDEL_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "REL_SURFACE_041");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

func int Spell_Logic_TeleportRELPass (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportRELPass()
{
	B_PrintTeleportTooFarAway (RELENDEL_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "REL_008");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

func int Spell_Logic_TeleportRELRaeuber (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportRELRaeuber()
{
	B_PrintTeleportTooFarAway (RELENDEL_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "REL_SURFACE_044");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

func int Spell_Logic_TeleportRELSee (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportRELSee()
{
	B_PrintTeleportTooFarAway (RELENDEL_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "REL_SURFACE_002");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

func int Spell_Logic_TeleportWaldis (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportWaldis()
{
	B_PrintTeleportTooFarAway (MINENTAL_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "WP_MT_JAEGERLAGER_01");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

func int Spell_Logic_TeleportWaldiPlattform (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	&& (Npc_GetDistToWP(hero, "WP_OM_HOEHLE_09") < 300)
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	&& (Npc_GetDistToWP(hero, "WP_OM_HOEHLE_09") < 300)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportWaldiPlattform()
{
	B_PrintTeleportTooFarAway (MINENTAL_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	Wld_InsertNpc	(Lesser_Skeleton, "MAGICTOWER_COR");
	Wld_InsertNpc	(Lesser_Skeleton, "MAGICTOWER_SAT");
	Wld_InsertNpc	(Skeleton, "MAGICTOWER_02");
	Wld_InsertNpc	(Skeleton, "MAGICTOWER_03_MOVEMENT");
	Wld_InsertNpc	(Skeleton, "MAGICTOWER_03_MOVEMENT_2");

	Wld_InsertNpc	(Mod_7434_DMT_Suchender_MT, "MAGICTOWER_03_MOVEMENT_2");

	Wld_InsertItem	(ItWr_JGSuchenderNotiz, "FP_ITEM_JGSUCHENDERNOTIZ");

	AI_Teleport		(hero, "MT03");
	AI_PlayAni		(hero, "T_HEASHOOT_2_STAND" );
};

func int Spell_Logic_TeleportRELHofstaat (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportRELHofstaat()
{
	B_PrintTeleportTooFarAway (RELENDEL_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "REL_246");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

func int Spell_Logic_TeleportOrkfriedhof (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportOrkfriedhof()
{
	B_PrintTeleportTooFarAway (MINENTAL_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport		(self, "OW_PATH_198_ORCGRAVEYARD8");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

func int Spell_Logic_TeleportGenn (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportGenn()
{
	B_PrintTeleportTooFarAway (TUGETTSO_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport	(self, "TUG_03");

	Mod_VMG_Pruefung_Teleport = 1;
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

func int Spell_Logic_TeleportRELMoor (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportRELMoor()
{
	B_PrintTeleportTooFarAway (RELENDEL_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport	(self, "REL_MOOR_017");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

func int Spell_Logic_Teleport_Banditenlager (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_Teleport_Banditenlager()
{
	B_PrintTeleportTooFarAway (MINENTAL_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport	(self, "LOCATION_11_06");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

func int Spell_Logic_Teleport_Gelato (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_Teleport_Gelato()
{
	B_PrintTeleportTooFarAway (EISGEBIET_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport	(self, "EISFESTUNG_24");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

func int Spell_Logic_Teleport_UW (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_Teleport_UW()
{
	B_PrintTeleportTooFarAway (NEWWORLD_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport	(self, "EISFESTUNG_24");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

func int Spell_Logic_TeleportGDG (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport)
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportGDG()
{
	B_PrintTeleportTooFarAway (GDG_WORLD_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport	(self, "LGR_EINGANG_01");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );
};

func int Spell_Logic_TeleportArgezToSaturas (var int manaInvested)
{
	if (Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_Cost_Scroll) && Npc_GetDistToNpc(hero, PC_Friend_NW) < 1000 && Npc_KnowsInfo(hero, Info_Mod_Argez_NW_LosZuSaturas))
	{
		return SPL_SENDCAST;
	}
	else if (self.attribute[ATR_MANA] >= SPL_Cost_Teleport && Npc_GetDistToNpc(hero, PC_Friend_NW) < 1000 && Npc_KnowsInfo(hero, Info_Mod_Argez_NW_LosZuSaturas))
	{
		return SPL_SENDCAST;
	};
	
	return SPL_NEXTLEVEL;
};

func void Spell_Cast_TeleportArgezToSaturas()
{
	B_PrintTeleportTooFarAway (NEWWORLD_ZEN);
	
	if (Npc_GetActiveSpellIsScroll(self))
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Scroll;
	}
	else
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_Cost_Teleport;
	};

	AI_Teleport	(self, "NW_TROLLAREA_PORTALTEMPEL_40");
	AI_PlayAni		(self, "T_HEASHOOT_2_STAND" );

	AI_Teleport	(PC_Friend_NW, "NW_TROLLAREA_PORTALTEMPEL_40");
	B_StartOtherRoutine	(PC_Friend_NW, "FOLLOWTOSATURAS");
	AI_Teleport	(PC_Friend_NW, "NW_TROLLAREA_PORTALTEMPEL_40");
};


// ----- neu 1.21 Verteiler für die Cast-Funcs -------
func void Spell_Cast_Teleport()
{
	if (Npc_GetActiveSpell(self) == SPL_PalTeleportSecret	)	{	Spell_Cast_PalTeleportSecret	(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportOT	)	{	Spell_Cast_TeleportOT	(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportEisSH	)	{	Spell_Cast_TeleportEisSH	(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportSeaport		)	{	Spell_Cast_TeleportSeaport		(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportMonastery	)	{	Spell_Cast_TeleportMonastery	(); };
	if (Npc_GetActiveSpell(self) == SPL_Teleport_Pat	)	{	Spell_Cast_Teleport_Pat	(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportFarm		)	{	Spell_Cast_TeleportFarm			(); };
	if (Npc_GetActiveSpell(self) == SPL_Teleport_Eisgebiet		)	{	Spell_Cast_Teleport_Eisgebiet			(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportXardas		)	{	Spell_Cast_TeleportXardas		(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportPassNW		)	{	Spell_Cast_TeleportPassNW		(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportPassOW		)	{	Spell_Cast_TeleportPassOW		(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportBergwelt		)	{	Spell_Cast_TeleportBergwelt		(); };
	if (Npc_GetActiveSpell(self) == SPL_Teleport_Pat_01	)	{	Spell_Cast_Teleport_Pat_01	(); };
	if (Npc_GetActiveSpell(self) == SPL_Teleport_Pat_02	)	{	Spell_Cast_Teleport_Pat_02	(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportOC			)	{	Spell_Cast_TeleportOC			(); };
	if (Npc_GetActiveSpell(self) == SPL_Teleport4		)	{	Spell_Cast_Teleport4		(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportSektis		)	{	Spell_Cast_TeleportSektis		(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportPatBack		)	{	Spell_Cast_TeleportPatBack		(); };
	if (Npc_GetActiveSpell(self) == SPL_Teleport5			)	{	Spell_Cast_Teleport5			(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportOWDemonTower)	{	Spell_Cast_TeleportOWDemonTower (); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportTaverne		)	{	Spell_Cast_TeleportTaverne		(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportDemonTower			)	{	Spell_Cast_TeleportDemonTower			(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportPsicamp)	{	Spell_Cast_TeleportPsicamp (); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportOldcamp		)	{	Spell_Cast_TeleportOldcamp		(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportVorAL		)	{	Spell_Cast_TeleportVorAL		(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportXD		)	{	Spell_Cast_TeleportXD		(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportNewcamp			)	{	Spell_Cast_TeleportNewcamp					(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportBeliarOut)	{	Spell_Cast_TeleportBeliarOut(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportBergfestung)	{	Spell_Cast_TeleportBergfestung(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportKlosterruine)	{	Spell_Cast_TeleportKlosterruine(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportSonnenkreis)	{	Spell_Cast_TeleportSonnenkreis(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportObelisk)	{	Spell_Cast_TeleportObelisk(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportKhorata)	{	Spell_Cast_TeleportKhorata(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportTorgan)	{	Spell_Cast_TeleportTorgan(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportRELBauernhof)	{	Spell_Cast_TeleportRELBauernhof(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportRELPass)	{	Spell_Cast_TeleportRELPass(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportRELRaeuber)	{	Spell_Cast_TeleportRELRaeuber(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportRELSee)	{	Spell_Cast_TeleportRELSee(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportWaldis)	{	Spell_Cast_TeleportWaldis(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportWaldiPlattform)	{	Spell_Cast_TeleportWaldiPlattform(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportRELHofstaat)	{	Spell_Cast_TeleportRELHofstaat(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportOrkfriedhof)	{	Spell_Cast_TeleportOrkfriedhof(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportGenn)	{	Spell_Cast_TeleportGenn(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportRELMoor)	{	Spell_Cast_TeleportRELMoor(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportBanditenlager)	{	Spell_Cast_Teleport_Banditenlager(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportGelato)	{	Spell_Cast_Teleport_Gelato(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportUW)	{	Spell_Cast_Teleport_UW(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportGDG)	{	Spell_Cast_TeleportGDG(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportBeliarfestung)	{	Spell_Cast_TeleportBeliarfestung(); };
	if (Npc_GetActiveSpell(self) == SPL_TeleportArgezToSaturas)	{	Spell_Cast_TeleportArgezToSaturas(); };

};