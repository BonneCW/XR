// ************************
// B_TeachPlayerTalentRunes
// ************************

func int B_TeachPlayerTalentScrolls (var C_NPC slf, var C_NPC oth, var int spell)
{
	// ------ Kosten festlegen ------
	var int kosten;
	kosten = B_GetLearnCostTalent(oth, NPC_TALENT_SCROLLS, spell);
	
	
	//EXIT IF...
	
	// ------ Player hat zu wenig Lernpunkte ------
	if (oth.lp < kosten)
	&& (Mod_Schwierigkeit != 4)
	{
		PrintScreen	(PRINT_NotEnoughLearnPoints, -1,-1, FONT_ScreenSmall ,2);
		B_Say (slf, oth, "$NOLEARNNOPOINTS");
		
		return FALSE;
	}
	else if (Npc_HasItems(hero, ItMi_Gold) < kosten)
	&& (Mod_Schwierigkeit == 4)
	{
		PrintScreen	(PRINT_NotEnoughGold, -1, -1, FONT_Screen, 2);
		B_Say (slf, oth, "$NOLEARNGOLD");
		
		return FALSE;
	};
	
			
	// FUNC
				
	// ------ Lernpunkte abziehen ------	
	if (Mod_Schwierigkeit != 4)
	{
		oth.lp = oth.lp - kosten;
	}
	else
	{
		Npc_RemoveInvItems	(hero, ItMi_Gold, kosten);
	};
	
	Log_CreateTopic (TOPIC_TalentScrolls,LOG_NOTE);
	B_LogEntry (TOPIC_TalentScrolls,"Um eine Spruchrolle herzustellen benötige ich als Grundlage eine Rune der Magierichtung, optimalerweise des Zaubers, den ich als Spruchrolle herstellen will, die Zutaten für die Spruchrolle, ein Blatt Papier und einen leeren Runenstein als Transfermedium. Will ich stärkere Spruchrollen herstellen, für die ich keine Rune besitze, so benötigte ich ebenfalls das Wissen und die Zutaten für die schwächeren Zauber, bis ich eine Rune habe.");
	
	PrintScreen			(PRINT_LearnScrolls, -1, -1, FONT_Screen, 2);
	
	// ------ bei jeder Rune: Runen-Talent lernen (programmvariable, wird nur zur Ausgabe in StatusScreen benutzt) ------
	Npc_SetTalentSkill 	(oth, NPC_TALENT_SCROLLS, 1);
	return TRUE;
};
