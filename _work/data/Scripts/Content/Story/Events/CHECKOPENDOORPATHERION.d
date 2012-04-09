FUNC INT CHECKOPENDOORPATHERION ()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Aaron_Door))
	{
		return 1;
	}
	else
	{
		if (Npc_KnowsInfo(hero, Info_Mod_Aaron_Hexen))
		&& (CHECKOPENDOORPATHERION_OPENED == FALSE)
		{
			AI_PrintScreen	("Die Tür geht nicht auf", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

			B_LogEntry	(TOPIC_MOD_FM_HEXENQUEEN, "Ich kann die Tür nicht öffnen. Ich sollte Aaron darüber informieren.");

			CHECKOPENDOORPATHERION_OPENED = TRUE;
		}
		else if (CHECKOPENDOORPATHERION_OPENED == TRUE)
		{
			AI_PrintScreen	("Das geht nicht", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
		}
		else
		{
			AI_PrintScreen	("Ich bin noch nicht so weit", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
		};

		return 0;
	};
};