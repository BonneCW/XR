FUNC VOID B_EXPVerteiler (var C_NPC slf, var C_NPC oth)
{
	// Weder Spieler, noch Partymember, noch Boss, noch mal draufgeschlagen

	if (!Npc_IsPlayer(oth))
	&& (!C_NpcIsBossmonster(slf))
	&& (slf.aivar[AIV_FLUGBLATTVERTEILT] == 0)
	&& (oth.aivar[AIV_Partymember] == FALSE)
	{
		return;
	};

	if (FinsternisPanzerhandschuh_Equipped)
	&& (Wld_IsTime(22,00,05,00))
	{
		Wld_SpawnNpcRange (slf, Summoned_Harpie, 1, 300);
	};

	// Schafe, Fleischwanzen und Ratten geben immer 5 XP

	if ((slf.aivar[AIV_VictoryXPGiven] == FALSE)	
	|| (slf.aivar[AIV_VictoryXPGiven] == -1))
	&& ((slf.guild == GIL_SHEEP)
	|| (slf.guild == GIL_MEATBUG))
	{
		B_GivePlayerXP (5);

		slf.aivar[AIV_VictoryXPGiven] = TRUE;
	};

	// Im Schläfertempel ist auch noch alles festgeschrieben

	if (slf.aivar[AIV_VictoryXPGiven] == FALSE)
	&& (HeroIstKeinZombie == FALSE)
	&& (CurrentLevel == ORCTEMPEL_ZEN)
	{
		if (slf.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLER)
		{
			B_GivePlayerXP	(15);
		}
		else if (slf.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLERWARRIOR)
		{
			B_GivePlayerXP	(20);
		}
		else if (slf.aivar[AIV_MM_REAL_ID] == ID_ZOMBIE)
		{
			B_GivePlayerXP	(20);
		};

		slf.aivar[AIV_VictoryXPGiven] = TRUE;
	};

	// respawnte Gegner geben immer nur 10 XP

	if (slf.aivar[AIV_VictoryXPGiven] == -1)
	{
		B_GivePlayerXP	(10);

		slf.aivar[AIV_VictoryXPGiven] = TRUE;
	};

	// Bei eigenen Kills, Kills beschworener Monster oder wenn der Gegner Boss ist oder ich mal draufgehauen habe, gibt's volle XP
	
	if ((Npc_IsPlayer(oth))
	|| (oth.guild == GIL_SUMMONED_GOBBO_SKELETON)	
	|| (oth.guild == GIL_SUMMONED_WOLF)	
	|| (oth.guild == GIL_SUMMONED_SKELETON)	
	|| (oth.guild == GIL_SUMMONED_GOLEM)	
	|| (oth.guild == GIL_SUMMONED_DEMON)	
	|| (oth.guild == GIL_SUMMONEDGUARDIAN)	
	|| (oth.guild == GIL_SUMMONEDZOMBIE)
	|| (C_NpcIsBossmonster(slf))
	|| (slf.aivar[AIV_FLUGBLATTVERTEILT] == 1))
	&& (slf.aivar[AIV_VictoryXPGiven] == FALSE)							
	{
		B_GivePlayerXP (slf.level * XP_PER_VICTORY);	

		slf.aivar[AIV_VictoryXPGiven] = TRUE;
	};
	
	if (oth.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (slf.aivar[AIV_VictoryXPGiven] == FALSE)						
	{
		B_GivePlayerXP (slf.level * XP_PER_VICTORY / 2);

		slf.aivar[AIV_VictoryXPGiven] = TRUE;
	};
};