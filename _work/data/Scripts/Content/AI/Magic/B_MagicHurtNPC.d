//////////////////////////////////////////////////////////////////////////
//	B_MagicHurtNpc
//	==============
//	Verwundet den NSC und berücksichtigt dabei den magischen Rüstschutz
//	'self' ist der Täter, other der zu verwundende NSC
//////////////////////////////////////////////////////////////////////////
func void B_MagicHurtNpc (var C_NPC slf, var C_NPC oth, var int damage) {
	if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(hero)) {
		//Bloodsplat(damage);
		Spine_DoDamageVibration(damage);
	};

	if (oth.flags != 2) {
		if (damage >= oth.attribute[ATR_HITPOINTS]) {
			if (C_DropUnconscious2(oth, slf)) {
				oth.attribute[ATR_HITPOINTS] = 2;

				return;
			} else {
				Npc_ClearAIQueue	(oth);
				AI_StandUPQuick	(oth);

				Npc_ChangeAttribute (oth, ATR_HITPOINTS, -damage);
			};
		} else {
			if (oth.attribute[ATR_HITPOINTS] == 1) {
			} else {
				Npc_ChangeAttribute (oth, ATR_HITPOINTS, -damage);
			};
		};

		oth.aivar[AIV_Damage] = oth.attribute[ATR_HITPOINTS];
	} else {
		if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Sleeper)) {
			oth.attribute[ATR_HITPOINTS] -= damage;

			oth.aivar[AIV_Damage] = oth.attribute[ATR_HITPOINTS];
		};
	};
	
	// ------ XP HIER vergeben (ZS_Dead kennt den other nicht mehr) ------
	if (Npc_IsDead(oth)) {
		B_EXPVerteiler (oth, slf);
	};

	if (oth.aivar[AIV_VictoryXPGiven] == TRUE) {
		B_PraxisErfahrung(slf, oth);

		oth.aivar[AIV_VictoryXPGiven] = 2;
	};
};
