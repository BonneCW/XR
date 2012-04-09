//-------- Spell Commands --------
// SPL_DONTINVEST 		= 	0;		// Es können keine weiteren Manapunkte investiert werden. Erst durch CTRL loslassen geht der Spell ab
// SPL_RECEIVEINVEST	= 	1;		// Wirkung durchgeführt, es können weitere Invest kommen, zB.bei Heal nach jedem Pöppel
// SPL_SENDCAST			= 	2;		// Starte den Zauber-Effekt (wie CTRL loslassen), automatischer Abbruch
// SPL_SENDSTOP			= 	3;		// Beende Zauber ohne Effekt
// SPL_NEXTLEVEL		=	4;		// setze den Spruch auf den nächsten Level

const int   SPL_TEXT_PYROKINESIS_DAMAGE_PER_SEC		=	50;	// Pyrokinesis

INSTANCE Spell_Pyrokinesis_g1(C_Spell_Proto)
{
	time_per_mana			= 250;
	damage_per_level		= 0;					//	Wird nicht benutzt, da Aufrechterhaltungs-Spruch! Damage-Angabe in zs_Pyro
	spelltype 				= SPELL_BAD;
	damageType				= DAM_MAGIC;
	targetCollectAlgo		= TARGET_COLLECT_FOCUS;
	targetCollectRange		= 1000;					// 10m
	targetCollectType		= TARGET_TYPE_NPCS;
};

func int Spell_Logic_Pyrokinesis_g1	(var int manaInvested)
{
	PrintDebugNpc		(PD_MAGIC,	"Spell_Logic_Pyrokinesis_g1");

	if (Npc_IsDead(other))
	|| (Npc_IsInState(other,ZS_Unconscious))
	|| (self.attribute[ATR_MANA] < 5)
	{
		return SPL_SENDSTOP;
	};

	self.attribute[ATR_MANA] -= 5;

	return SPL_NEXTLEVEL;
	
};