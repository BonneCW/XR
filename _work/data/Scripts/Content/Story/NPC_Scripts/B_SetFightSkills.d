// ************************************************************
// B_SetFightSkills
// ----------------
// B_AddFightSkill setzt Talent-Ani abhängig von TrefferChance%
// ************************************************************

func void B_SetFightSkills (var C_NPC slf, var int percent)
{
	// Es wird auf alle FightSkills percent ADDIERT (Skills sind in Npc_Default auf 0 initialisiert)

	B_RaiseFightTalent (slf, NPC_TALENT_1H, 		percent);
	B_RaiseFightTalent (slf, NPC_TALENT_2H, 		percent);
	B_RaiseFightTalent (slf, NPC_TALENT_BOW, 		percent);
	B_RaiseFightTalent (slf, NPC_TALENT_CROSSBOW,	percent);

	if (percent >= 60)
	{
		if (slf.aivar[AIV_MagicUser] == MAGIC_ALWAYS)
		{
			Mdl_ApplyOverlayMds	(slf, "HUMANS_STABST2.MDS");
		}
		else
		{
			Mdl_ApplyOverlayMds	(slf, "HUMANS_2HST2.MDS");
		};

		Mdl_ApplyOverlayMds	(slf, "HUMANS_1HST2.MDS");
		Mdl_ApplyOverlayMds	(slf, "HUMANS_BOWT2.MDS");
		Mdl_ApplyOverlayMds	(slf, "HUMANS_CBOWT2.MDS");
	}
	else if (percent >= 30)
	{
		if (slf.aivar[AIV_MagicUser] == MAGIC_ALWAYS)
		{
			Mdl_ApplyOverlayMds	(slf, "HUMANS_STABST1.MDS");
		}
		else
		{
			Mdl_ApplyOverlayMds	(slf, "HUMANS_2HST1.MDS");
		};

		Mdl_ApplyOverlayMds	(slf, "HUMANS_1HST1.MDS");
		Mdl_ApplyOverlayMds	(slf, "HUMANS_BOWT1.MDS");
		Mdl_ApplyOverlayMds	(slf, "HUMANS_CBOWT1.MDS");
	}
	else
	{
		if (slf.aivar[AIV_MagicUser] == MAGIC_ALWAYS)
		{
			Mdl_ApplyOverlayMds	(slf, "HUMANS_STABST0.MDS");
		};
	};
};
