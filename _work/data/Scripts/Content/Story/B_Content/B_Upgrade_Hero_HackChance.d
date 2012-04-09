FUNC VOID B_Upgrade_ErzHackChance (var int Wert)
{
	var string concatText;

	concatText = ConcatStrings (PRINT_ADDON_HACKCHANCE, IntToString(Wert));
	concatText = ConcatStrings (concatText, ")");
	PrintScreen	(concatText, -1, 34, FONT_ScreenSmall, 2);
	
	ErzHackChance += Wert;

	if (ErzHackchance > 100)
	{
		ErzHackChance = 100;
	};

	if (ErzHackChance < 20) 
	{
		Npc_SetTalentSkill (hero, NPC_TALENT_ERZHACKEN, 0);
	}
	else if (ErzHackChance < 40) 
	{
		Npc_SetTalentSkill (hero, NPC_TALENT_ERZHACKEN, 1);
	}
	else if (ErzHackChance < 55) 
	{
		Npc_SetTalentSkill (hero, NPC_TALENT_ERZHACKEN, 2);
	}
	else if (ErzHackChance < 75) 
	{
		Npc_SetTalentSkill (hero, NPC_TALENT_ERZHACKEN, 3);
	}
	else if (ErzHackChance < 90) 
	{
		Npc_SetTalentSkill (hero, NPC_TALENT_ERZHACKEN, 4);
	}
	else if (ErzHackChance < 98) 
	{
		Npc_SetTalentSkill (hero, NPC_TALENT_ERZHACKEN, 5);
	}
	else
	{
		Npc_SetTalentSkill (hero, NPC_TALENT_ERZHACKEN, 6);
	};
	
	Snd_Play ("Geldbeutel");
	
};
