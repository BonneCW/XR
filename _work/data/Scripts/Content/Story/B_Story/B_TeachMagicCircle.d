// ******************
// B_TeachMagicCircle
// ******************

func int B_TeachMagicCircle (var C_NPC slf, var C_NPC oth, var int circle)
{
	// ------ Kosten festlegen ------
	var int kosten;
	kosten = B_GetLearnCostTalent(oth, NPC_TALENT_MAGE, circle);
	
	
	// EXIT IF...
	
	// ------ falscher Parameter ------
	if (circle < 1) || (circle > 6)
	{
		Print ("*** ERROR: Wrong Parameter ***");
		return FALSE;
	};
	
	// ------ Player hat zu wenig Lernpunkte ------
	if (oth.lp < kosten)
	&& (Mod_Schwierigkeit != 4)
	{
		PrintScreen	(PRINT_NotEnoughLP, -1, -1, FONT_Screen, 2);
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
	
	// ------ Kreis setzen ------
	Npc_SetTalentSkill (oth, NPC_TALENT_MAGE, circle);
	Log_CreateTopic (TOPIC_TalentMagicCircle,LOG_NOTE);
	B_LogEntry (TOPIC_TalentMagicCircle,"Die mir zugängliche magischen Runen sind in Kreise eingeteilt. Einen Spruch mit einem höheren Kreis als ich gemeistert habe, kann ich nicht verwenden."); 
	
	// ------ 1. Kreis ------
	if (circle == 1)
	{
		if (Mod_Gilde == 12)
		|| (Mod_Gilde == 13)
		|| (Mod_Gilde == 14)
		|| (Mod_Gilde == 15)
		|| (Mod_Gilde == 16)
		{
			PrintScreen	(PRINT_LearnCircle_1, -1, -1, FONT_Screen, 2);
			B_LogEntry (TOPIC_TalentMagicCircle,"Die Sprüche des 1. Kreises sind: Licht, Energie stehlen, leichte Wunden heilen und Wolf rufen.");
			return TRUE;
		}
		else if (Mod_Gilde == 6)
		|| (Mod_Gilde == 7)
		|| (Mod_Gilde == 8)
		{
			PrintScreen	(PRINT_LearnCircle_1, -1, -1, FONT_Screen, 2);
			B_LogEntry (TOPIC_TalentMagicCircle,"Die Sprüche des 1. Kreises sind: Licht, Feuerpfeil und leichte Wunden heilen.");
			return TRUE;
		}
		else
		{
			PrintScreen	(PRINT_LearnCircle_1, -1, -1, FONT_Screen, 2);
			B_LogEntry (TOPIC_TalentMagicCircle,"Die Sprüche des 1. Kreises sind: Licht, Blitz, Eispfeil und leichte Wunden heilen.");
			return TRUE;
		};
	};
	
	// ------ 2. Kreis ------
	if (circle == 2)
	{
		if (Mod_Gilde == 12)
		|| (Mod_Gilde == 13)
		|| (Mod_Gilde == 14)
		|| (Mod_Gilde == 15)
		|| (Mod_Gilde == 16)
		{
			PrintScreen	(PRINT_LearnCircle_2, -1, -1, FONT_Screen, 2);
			B_LogEntry (TOPIC_TalentMagicCircle,"Die Sprüche des 2. Kreises sind: Goblinskelett erschaffen.");
			return TRUE;
		}
		else if (Mod_Gilde == 6)
		|| (Mod_Gilde == 7)
		|| (Mod_Gilde == 8)
		{
			PrintScreen	(PRINT_LearnCircle_2, -1, -1, FONT_Screen, 2);
			B_LogEntry (TOPIC_TalentMagicCircle,"Die Sprüche des 2. Kreises sind: Feuerball.");
			return TRUE;
		}
		else
		{
			PrintScreen	(PRINT_LearnCircle_2, -1, -1, FONT_Screen, 2);
			B_LogEntry (TOPIC_TalentMagicCircle,"Die Sprüche des 2. Kreises sind: Eisball und Eislanze.");
			return TRUE;
		};
	};
	
	// ------ 3. Kreis ------
	if (circle == 3)
	{
		if (Mod_Gilde == 13)
		|| (Mod_Gilde == 14)
		{
			PrintScreen	(PRINT_LearnCircle_3, -1, -1, FONT_Screen, 2);
			B_LogEntry (TOPIC_TalentMagicCircle,"Die Sprüche des 3. Kreises sind: mittlere Wunden heilen, Skelett erschaffen, Wächter erschaffen und Beliars Zorn.");
			return TRUE;
		}
		else if (Mod_Gilde == 7)
		|| (Mod_Gilde == 8)
		{
			PrintScreen	(PRINT_LearnCircle_3, -1, -1, FONT_Screen, 2);
			B_LogEntry (TOPIC_TalentMagicCircle,"Die Sprüche des 3. Kreises sind: mittlere Wunden heilen und Kleiner Feuersturm.");
			return TRUE;
		}
		else
		{
			PrintScreen	(PRINT_LearnCircle_3, -1, -1, FONT_Screen, 2);
			B_LogEntry (TOPIC_TalentMagicCircle,"Die Sprüche des 3. Kreises sind: mittlere Wunden heilen, Kugelblitz, Geysir, Unwetter und Eisblock.");
			return TRUE;
		};
	};
	
	// ------ 4. Kreis ------
	if (circle == 4)
	{
		if (Mod_Gilde == 13)
		|| (Mod_Gilde == 14)
		{
			PrintScreen	(PRINT_LearnCircle_4, -1, -1, FONT_Screen, 2);
			B_LogEntry (TOPIC_TalentMagicCircle,"Die Sprüche des 4. Kreises sind: Golem erschaffen, Untote vernichten und Zombie erschaffen.");
			return TRUE;
		}
		else if (Mod_Gilde == 7)
		|| (Mod_Gilde == 8)
		{
			PrintScreen	(PRINT_LearnCircle_4, -1, -1, FONT_Screen, 2);
			B_LogEntry (TOPIC_TalentMagicCircle,"Die Sprüche des 4. Kreises sind: Untote vernichten und Grosser Feuerball.");
			return TRUE;
		}
		else
		{
			PrintScreen	(PRINT_LearnCircle_4, -1, -1, FONT_Screen, 2);
			B_LogEntry (TOPIC_TalentMagicCircle,"Die Sprüche des 4. Kreises sind: Blitzschlag und Wasserfaust.");
			return TRUE;
		};
	};
	
	// ------ 5. Kreis ------
	if (circle == 5)
	{
		if (Mod_Gilde == 14)
		{
			PrintScreen	(PRINT_LearnCircle_5, -1, -1, FONT_Screen, 2);
			B_LogEntry (TOPIC_TalentMagicCircle,"Die Sprüche des 5. Kreises sind: Schrei der Toten, Dämon beschwören und schwere Wunden heilen.");
			return TRUE;
		}
		else if (Mod_Gilde == 8)
		{
			PrintScreen	(PRINT_LearnCircle_5, -1, -1, FONT_Screen, 2);
			B_LogEntry (TOPIC_TalentMagicCircle,"Die Sprüche des 5. Kreises sind: Grosser Feuersturm und schwere Wunden heilen.");
			return TRUE;
		}
		else
		{
			PrintScreen	(PRINT_LearnCircle_5, -1, -1, FONT_Screen, 2);
			B_LogEntry (TOPIC_TalentMagicCircle,"Die Sprüche des 5. Kreises sind: Eiswelle und schwere Wunden heilen.");
			return TRUE;
		};
	};
	
	// ------ 6. Kreis ------
	if (circle == 6)
	{
		if (Mod_Gilde == 14)
		{
			PrintScreen	(PRINT_LearnCircle_6, -1, -1, FONT_Screen, 2);
			B_LogEntry (TOPIC_TalentMagicCircle,"Die Sprüche des 6. Kreises sind: Todeshauch und Armee der Finsternis.");
			return TRUE;
		}
		else if (Mod_Gilde == 8)
		{
			PrintScreen	(PRINT_LearnCircle_6, -1, -1, FONT_Screen, 2);
			B_LogEntry (TOPIC_TalentMagicCircle,"Die Sprüche des 6. Kreises sind: Feuerregen, Monster schrumpfen und Heiliges Geschoss.");
			return TRUE;
		}
		else
		{
			PrintScreen	(PRINT_LearnCircle_6, -1, -1, FONT_Screen, 2);
			B_LogEntry (TOPIC_TalentMagicCircle,"Die Sprüche des 6. Kreises sind: Eisregen und Monster schrumpfen.");
			return TRUE;
		};
	};

	Mod_Circle	=	circle;
};