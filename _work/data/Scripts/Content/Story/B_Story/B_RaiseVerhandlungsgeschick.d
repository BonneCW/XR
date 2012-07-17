FUNC VOID B_RaiseHandelsgeschick (var int wert)
{
	var string Text;

	if (Mod_Verhandlungsgeschick+wert > 100)
	{
		Text = ConcatStrings("Handelsgeschick: +", IntToString(100-Mod_Verhandlungsgeschick));

		Mod_Verhandlungsgeschick = 100;
	}
	else
	{
		Text = ConcatStrings("Handelsgeschick: +", IntToString(wert));

		Mod_Verhandlungsgeschick += wert;
	};

	PrintScreen	(Text, -1, -1, FONT_SCREEN, 2);

	if (Mod_Verhandlungsgeschick == 100)
	{
		Npc_SetTalentSkill (hero, NPC_TALENT_HANDELN, 5);
	}
	else if (Mod_Verhandlungsgeschick > 74)
	{
		Npc_SetTalentSkill (hero, NPC_TALENT_HANDELN, 4);
	}
	else if (Mod_Verhandlungsgeschick > 49)
	{
		Npc_SetTalentSkill (hero, NPC_TALENT_HANDELN, 3);
	}
	else if (Mod_Verhandlungsgeschick > 29)
	{
		Npc_SetTalentSkill (hero, NPC_TALENT_HANDELN, 2);
	};
};
