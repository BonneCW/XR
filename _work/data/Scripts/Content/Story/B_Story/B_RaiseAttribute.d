// ****************
// B_RaiseAttribute
// ****************

// ---------------------------------------
func void B_RaiseRealAttributeLearnCounter (var C_NPC oth, var int attrib, var int points)
{
	if 	(attrib == ATR_STRENGTH)	{	Mod_RealStrength	=	Mod_RealStrength + points;	}
	else if (attrib == ATR_DEXTERITY)	{	Mod_RealDexterity	=	Mod_RealDexterity + points;	}
	else if (attrib == ATR_MANA_MAX)	{	Mod_RealMana		=	Mod_RealMana + points;	};
};

// ---------------------------------------
func void B_RaiseAttribute (var C_NPC oth, var int attrib, var int points)
{
	var string concatText;
	
	// ------ STR steigern ------
	if (attrib == ATR_STRENGTH)			
	{	
		oth.attribute[ATR_STRENGTH] = oth.attribute[ATR_STRENGTH] + points;				//bzw. Npc_ChangeAttribute (oth, attrib, points);
		
		concatText = ConcatStrings(PRINT_LearnSTR, IntToString(points));
		PrintScreen	(concatText, -1, -1, FONT_SCREEN, 2);
	};
	
	// ------ DEX steigern ------
	if (attrib == ATR_DEXTERITY)			
	{	
		oth.attribute[ATR_DEXTERITY] = oth.attribute[ATR_DEXTERITY] + points;

		concatText = ConcatStrings(PRINT_LearnDEX, IntToString(points));
		PrintScreen	(concatText, -1, -1, FONT_SCREEN, 2);
	};
	
	// ------ MANA_MAX steigern ------
	if (attrib == ATR_MANA_MAX)			
	{	
		oth.attribute[ATR_MANA_MAX] = oth.attribute[ATR_MANA_MAX] + points;

		concatText = ConcatStrings(PRINT_LearnMANA_MAX, IntToString(points));
		PrintScreen	(concatText, -1, -1, FONT_SCREEN, 2);
	};
	
	// ------ HITPOINTS_MAX steigern ------
	if (attrib == ATR_HITPOINTS_MAX)			
	{	
		oth.attribute[ATR_HITPOINTS_MAX] = oth.attribute[ATR_HITPOINTS_MAX] + points;

		concatText = ConcatStrings(PRINT_Learnhitpoints_MAX, IntToString(points));
		PrintScreen	(concatText, -1, -1, FONT_SCREEN, 2);

		HP_Heilknospe = hero.attribute[ATR_HITPOINTS_MAX] / 5;
	};
	
	B_RaiseRealAttributeLearnCounter (oth, attrib, points);
};

func void B_RaiseAttribute_Rest (var C_NPC oth, var int attrib, var int points)
{
	var string concatText;
	
	// ------ STR steigern ------
	if (attrib == ATR_STRENGTH)			
	{	
		oth.attribute[ATR_STRENGTH] = oth.attribute[ATR_STRENGTH] + points;				//bzw. Npc_ChangeAttribute (oth, attrib, points);
		
		concatText = ConcatStrings(PRINT_LearnSTR, IntToString(points));
		PrintScreen	(concatText, -1, -1, FONT_SCREEN, 2);
	};
	
	// ------ DEX steigern ------
	if (attrib == ATR_DEXTERITY)			
	{	
		oth.attribute[ATR_DEXTERITY] = oth.attribute[ATR_DEXTERITY] + points;

		concatText = ConcatStrings(PRINT_LearnDEX, IntToString(points));
		PrintScreen	(concatText, -1, -1, FONT_SCREEN, 2);
	};
	
	// ------ MANA_MAX steigern ------
	if (attrib == ATR_MANA_MAX)			
	{	
		oth.attribute[ATR_MANA_MAX] = oth.attribute[ATR_MANA_MAX] + points;

		concatText = ConcatStrings(PRINT_LearnMANA_MAX, IntToString(points));
		PrintScreen	(concatText, -1, -1, FONT_SCREEN, 2);
	};
	
	// ------ HITPOINTS_MAX steigern ------
	if (attrib == ATR_HITPOINTS_MAX)			
	{	
		oth.attribute[ATR_HITPOINTS_MAX] = oth.attribute[ATR_HITPOINTS_MAX] + points;

		concatText = ConcatStrings(PRINT_Learnhitpoints_MAX, IntToString(points));
		PrintScreen	(concatText, -1, -1, FONT_SCREEN, 2);

		HP_Heilknospe = hero.attribute[ATR_HITPOINTS_MAX] / 5;
	};
};