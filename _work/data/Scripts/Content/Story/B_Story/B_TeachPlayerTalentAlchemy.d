// **************************
// B_TeachPlayerTalentAlchemy
// **************************

func int B_TeachPlayerTalentAlchemy (var C_NPC slf, var C_NPC oth, var int potion)
{
	// ------ Kosten festlegen ------
	var int kosten;
	kosten = B_GetLearnCostTalent(oth, NPC_TALENT_ALCHEMY, potion);
	
	
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
	
	Log_CreateTopic (TOPIC_TalentAlchemy,LOG_NOTE);
	B_LogEntry (TOPIC_TalentAlchemy,"Um einen Trank zu brauen, brauche ich einen leere Laborflasche und die jeweilig benötigten Zutaten für den gewünschten Trank. Mit diese Zutaten kann man an einem Alchemietisch den gewünschten Trank herstellen."); 
	
	// ------ Trank brauen lernen ------
	if (potion == POTION_Health_01)		{	PLAYER_TALENT_ALCHEMY[POTION_Health_01] 	= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Zutaten ´ESSENZ DER HEILUNG´: 2 Heilpflanzen und 1 Feldknöterich."); };
	
	if (potion == POTION_Health_02)		{	PLAYER_TALENT_ALCHEMY[POTION_Health_02] 	= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Zutaten ´EXTRAKT DER HEILUNG´: 2 Heilkräuter und 1 Feldknöterich.");  };
	
	if (potion == POTION_Health_03)		{	PLAYER_TALENT_ALCHEMY[POTION_Health_03] 	= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Zutaten ´ELIXIER DER HEILUNG´: 2 Heilwurzel und 1 Feldknöterich.");  };
	
	if (potion == POTION_Mana_01)		{	PLAYER_TALENT_ALCHEMY[POTION_Mana_01] 		= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Zutaten ´MANA ESSENZ´: 2 Feuernesseln und 1 Feldknöterich.");  };
	
	if (potion == POTION_Mana_02)		{	PLAYER_TALENT_ALCHEMY[POTION_Mana_02] 		= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Zutaten ´MANA EXTRAKT´: 2 Feuerkraut und 1 Feldknöterich.");  };
	
	if (potion == POTION_Mana_03)		{	PLAYER_TALENT_ALCHEMY[POTION_Mana_03] 		= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Zutaten ´MANA ELIXIER´: 2 Feuerwurzel und 1 Feldknöterich");  };
	
	if (potion == POTION_Speed)			{	PLAYER_TALENT_ALCHEMY[POTION_Speed] 		= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Zutaten ´TRANK DER GESCHWINDIGKEIT´: 1 Snapperkraut und 1 Feldknöterich");  };
	
	if (potion == POTION_Perm_STR)		{	PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] 		= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Zutaten ´Elixier der Stärke´: 1 Drachenwurzel und 1 Kronstöckel.");  };
	
	if (potion == POTION_Perm_DEX)		{	PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] 		= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Zutaten ´ELIXIER DER GESCHICKLICHKEIT´: 1 Goblinbeere und 1 Kronstöckel.");  };
	
	if (potion == POTION_Perm_Mana)		{	PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] 	= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Zutaten ´ELIXIER DES GEISTES´: 1 Feuerwurzel und 1 Kronstöckel.");  };
	
	if (potion == POTION_Perm_Health)	{	PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] 	= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Zutaten ´ELIXIER DES LEBENS´: 1 Heilwurzel und 1 Kronstöckel.");  };
	
	if (potion == POTION_AdanosWohltat)	{	PLAYER_TALENT_ALCHEMY[POTION_AdanosWohltat] 	= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Zutaten ´ADANOS WOHLTAT´: 1 Leichte Wundheilung, 1 Trollkirsche, 1 Kronstöckel, 5 Feuernesseln und 4 Heilpflanzen.");  };

	if (potion == POTION_Health_05)		{	PLAYER_TALENT_ALCHEMY[POTION_Health_05] 	= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Zutaten ´TRANK DER SCHNELLEN HEILUNG´: 3 Heilpflanzen und 1 Wasser."); };

	if (potion == POTION_Health_06)		{	PLAYER_TALENT_ALCHEMY[POTION_Health_06] 	= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Zutaten ´LEICHTER HEILTRANK´: 4 Heilpflanzen und 1 Wacholder."); };

	if (potion == POTION_Health_07)		{	PLAYER_TALENT_ALCHEMY[POTION_Health_07] 	= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Zutaten ´TRANK DER LEICHTEN HEILUNG´: 2 Heilkräuter und 1 Wacholder."); };
	
	if (potion == POTION_Mana_05)		{	PLAYER_TALENT_ALCHEMY[POTION_Mana_05] 		= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Zutaten ´LEICHTER MANATRANK´: 3 Feuernesseln und 1 Alkohol");  };
	
	if (potion == POTION_Mana_06)		{	PLAYER_TALENT_ALCHEMY[POTION_Mana_06] 		= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Zutaten ´TRANK DES LEICHTEN MANA´: 2 Feuerwurzel und 1 Alkohol");  };
	
	if (potion == POTION_GiftNeutralisierer)		{	PLAYER_TALENT_ALCHEMY[POTION_GiftNeutralisierer] 		= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Zutaten ´TRANK DER TEMPORÄREN GIFTIMMUNITÄT´: 3 Winterrute, 2 Heilknospe, 1 Zwillingsdorn");  };
	
	if (potion == POTION_Gift)		{	PLAYER_TALENT_ALCHEMY[POTION_Gift] 		= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Zutaten ´MISCHGIFT´: 5 Blutfliegenstachel, 5 Fliegenpilze, 5 Höllenpilze, 1 Laborwasserflasche [ergibt zwei Flaschen]");  };
	
	if (potion == POTION_Gegengift)		{	PLAYER_TALENT_ALCHEMY[POTION_Gegengift] 		= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Zutaten ´GEGENGIFT´: 1 Elixier der Heilung, 1 Heilknospe, 2 Feldknöterich");  };
	
	if (potion == POTION_Genesung)		{	PLAYER_TALENT_ALCHEMY[POTION_Genesung] 		= TRUE;	
	B_LogEntry(TOPIC_TalentAlchemy,"Zutaten ´TRANK DER GENESUNG´: 1 Extrakt der Heilung, 1 Wacholder, 4 Heilpflanzen, 1 Feldknöterich");  };

	PrintScreen			(PRINT_LearnAlchemy, -1, -1, FONT_Screen, 2);
	
	// ------ bei jedem Trank: Alchemy-Talent lernen (programmvariable, wird nur zur Ausgabe in StatusScreen benutzt) ------
	Npc_SetTalentSkill 	(oth, NPC_TALENT_ALCHEMY, 1);
	
	return TRUE;
};