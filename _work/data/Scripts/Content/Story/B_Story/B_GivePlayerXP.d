// **************
// B_GivePlayerXP
// **************

var int bonuspercent;

func void B_GivePlayerXP (var int add_xp)
{
	if (hero.level == 0)
	{
		hero.exp_next = 500;
		EXP_LastLevel = 0;
	};

	// Bonus-EP für Adanosgläubige

	// Bonus-EXP berechnen

	bonuspercent = Mod_GottAdanos;

	// +2% für Halskette der Ehre

	if (Mod_HalsketteDerEhre == 1)
	{
		bonuspercent += 2;
	};

	// +2% für Gürtel der Ehre

	if (Mod_GuertelDerEhre == 1)
	{
		bonuspercent += 2;
	};

	// +10% für Ring des Bücherwurms

	if (Mod_BuecherwurmRing == 1)
	{
		bonuspercent += 10;
	};

	// +5% für Krauttabak

	if (Krauttabak_Bonus == 1)
	{
		bonuspercent += 5;
	};

	// Bonus-EXP dazuzählen

	add_xp += (bonuspercent * add_xp) / 100;

	//----------------------------------------------------------------------------
	hero.exp = hero.exp + add_xp;

	//----------------------------------------------------------------------------
	var string concatText;
	concatText = PRINT_XPGained;
	concatText = ConcatStrings (concatText,	IntToString(add_xp));
	PrintScreen	(concatText, -1, YPOS_XPGained, FONT_ScreenSmall, 2);

	//----------------------------------------------------------------------------
	if ( hero.exp >= hero.exp_next ) // ( XP > (500*((hero.level+2)/2)*(hero.level+1)) )
	{
		hero.level = hero.level+1;

		EXP_LastLevel = hero.exp_next;
		
		hero.exp_next = (hero.exp_next +((hero.level+1)*500) - (Ueberschwaenglichkeit_Perk * hero.exp_next));

		hero.attribute[ATR_HITPOINTS_MAX] 	= hero.attribute[ATR_HITPOINTS_MAX]	+ HP_PER_LEVEL;
		hero.attribute[ATR_HITPOINTS] 		= hero.attribute[ATR_HITPOINTS]		+ HP_PER_LEVEL;
		
		if (hero.level < 51)
		{
			if (SchnellesLernen_Perk == TRUE)
			{
				hero.lp += 1;
			};

			HP_Heilknospe = hero.attribute[ATR_HITPOINTS_MAX] / 5;

			if (Mod_Schwierigkeit < 4)
			{
				hero.LP += 10;
		
				if (Dummheit_Perk == TRUE)
				{
					hero.lp -= 2;
				};	
		
				if (Ueberschwaenglichkeit_Perk == TRUE)
				{
					hero.lp -= 1;

					hero.attribute[ATR_HITPOINTS] 		-= HP_PER_LEVEL/2;
					hero.attribute[ATR_HITPOINTS_MAX] 	-= HP_PER_LEVEL/2;
				};
			};
		};
			
		hero.attribute[ATR_HITPOINTS]	=	hero.attribute[ATR_HITPOINTS_MAX];
		hero.attribute[ATR_MANA]	=	hero.attribute[ATR_MANA_MAX];

		hero.aivar[AIV_Damage] = hero.attribute[ATR_HITPOINTS];

		PRINT_HEROLEVEL = IntToString(hero.level);
	
		var string newLevelText;

		newLevelText = PRINT_LevelUp;
		//newLevelText = ConcatStrings (newLevelText, PRINT_HEROLEVEL);
		//newLevelText = ConcatStrings (newLevelText, PRINT_LevelUp2);

		PrintScreen (newLevelText, -1, YPOS_LevelUp, FONT_Screen, 2);				
		Snd_Play ("LevelUp");
	};
};

