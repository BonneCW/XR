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
		Print ("BLEDNOSC: Zly parametr ***");
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
	B_LogEntry (TOPIC_TalentMagicCircle,"Dostepne dla mnie magiczne runy dziela sie na kregi. Nie moge uzyc powiedzenia z wyzszym kólkiem niz ja opanowalem."); 
	
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
			B_LogEntry (TOPIC_TalentMagicCircle,"Przyslowia 1. Kregi to: Swiatlo, kradziez energii, gojace sie lekkie rany i wolajace wilka.");
			return TRUE;
		}
		else if (Mod_Gilde == 6)
		|| (Mod_Gilde == 7)
		|| (Mod_Gilde == 8)
		{
			PrintScreen	(PRINT_LearnCircle_1, -1, -1, FONT_Screen, 2);
			B_LogEntry (TOPIC_TalentMagicCircle,"Przyslowia 1. Kregi to: swiatlo, strzalka ognia i lekkie rany goja sie.");
			return TRUE;
		}
		else
		{
			PrintScreen	(PRINT_LearnCircle_1, -1, -1, FONT_Screen, 2);
			B_LogEntry (TOPIC_TalentMagicCircle,"Przyslowia 1. Kregi to: swiatlo, piorun, strzalka lodowa i lekkie rany goja sie.");
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
			B_LogEntry (TOPIC_TalentMagicCircle,"Przyslowia 2. Kregi to: utworzony szkielet Goblina.");
			return TRUE;
		}
		else if (Mod_Gilde == 6)
		|| (Mod_Gilde == 7)
		|| (Mod_Gilde == 8)
		{
			PrintScreen	(PRINT_LearnCircle_2, -1, -1, FONT_Screen, 2);
			B_LogEntry (TOPIC_TalentMagicCircle,"Przyslowia 2. Kola to: Fireball.");
			return TRUE;
		}
		else
		{
			PrintScreen	(PRINT_LearnCircle_2, -1, -1, FONT_Screen, 2);
			B_LogEntry (TOPIC_TalentMagicCircle,"Przyslowia 2. Kregi to: Pilka lodowa i lanca lodowa.");
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
			B_LogEntry (TOPIC_TalentMagicCircle,"Przyslowia 3. Kregi to: leczyc srednie rany, tworzyc szkielet, tworzyc opiekunów i gniew Beliara.");
			return TRUE;
		}
		else if (Mod_Gilde == 7)
		|| (Mod_Gilde == 8)
		{
			PrintScreen	(PRINT_LearnCircle_3, -1, -1, FONT_Screen, 2);
			B_LogEntry (TOPIC_TalentMagicCircle,"Przyslowia 3. Kregi to: srednio zabliznione rany i mala burza pozarowa.");
			return TRUE;
		}
		else
		{
			PrintScreen	(PRINT_LearnCircle_3, -1, -1, FONT_Screen, 2);
			B_LogEntry (TOPIC_TalentMagicCircle,"Przyslowia 3. Kregi to: gojenie sie srednich ran, uderzenie pocisku, gejzer, burza i blokada lodowa.");
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
			B_LogEntry (TOPIC_TalentMagicCircle,"Przyslowia 4. Kregi to: stworzyc Golem, zniszczyc nieumarle i stworzyc zombie.");
			return TRUE;
		}
		else if (Mod_Gilde == 7)
		|| (Mod_Gilde == 8)
		{
			PrintScreen	(PRINT_LearnCircle_4, -1, -1, FONT_Screen, 2);
			B_LogEntry (TOPIC_TalentMagicCircle,"Przyslowia 4. Kregi to: Zniszczenie nieumarlych i Big Fireball.");
			return TRUE;
		}
		else
		{
			PrintScreen	(PRINT_LearnCircle_4, -1, -1, FONT_Screen, 2);
			B_LogEntry (TOPIC_TalentMagicCircle,"Przyslowia 4. Kregi to: uderzenie pioruna i piesc wody.");
			return TRUE;
		};
	};
	
	// ------ 5. Kreis ------
	if (circle == 5)
	{
		if (Mod_Gilde == 14)
		{
			PrintScreen	(PRINT_LearnCircle_5, -1, -1, FONT_Screen, 2);
			B_LogEntry (TOPIC_TalentMagicCircle,"");
			return TRUE;
		}
		else if (Mod_Gilde == 8)
		{
			PrintScreen	(PRINT_LearnCircle_5, -1, -1, FONT_Screen, 2);
			B_LogEntry (TOPIC_TalentMagicCircle,"Mówienia 5. Kregi to: Duze burze pozarowe i ciezkie rany goja sie.");
			return TRUE;
		}
		else
		{
			PrintScreen	(PRINT_LearnCircle_5, -1, -1, FONT_Screen, 2);
			B_LogEntry (TOPIC_TalentMagicCircle,"Mówienia 5. Kregi to: fala lodowa i ciezkie rany goja sie.");
			return TRUE;
		};
	};
	
	// ------ 6. Kreis ------
	if (circle == 6)
	{
		if (Mod_Gilde == 14)
		{
			PrintScreen	(PRINT_LearnCircle_6, -1, -1, FONT_Screen, 2);
			B_LogEntry (TOPIC_TalentMagicCircle,"");
			return TRUE;
		}
		else if (Mod_Gilde == 8)
		{
			PrintScreen	(PRINT_LearnCircle_6, -1, -1, FONT_Screen, 2);
			B_LogEntry (TOPIC_TalentMagicCircle,"Mówienia 6. Kregi to: deszcz ognia, potwory kurcza sie, pocisk swiety.");
			return TRUE;
		}
		else
		{
			PrintScreen	(PRINT_LearnCircle_6, -1, -1, FONT_Screen, 2);
			B_LogEntry (TOPIC_TalentMagicCircle,"Mówienia 6. Kregi to: Lodowy deszcz i potwory kurcza sie.");
			return TRUE;
		};
	};

	Mod_Circle	=	circle;
};
