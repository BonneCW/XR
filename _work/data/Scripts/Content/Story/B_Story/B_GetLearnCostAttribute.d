// ***********************************************************
// B_GetLearnCostAttribute
// -----------------------
// ermittelt die Kosten eines Attributspunktes (abh. v. Gilde)
// ***********************************************************
	
func int B_GetLearnCostAttribute (var C_NPC oth, var int attribut)
{
	var int kosten; kosten = 0;

	// ------ Kosten für Stärke ------
	if (attribut == ATR_STRENGTH) 
	{
		if (Mod_RealStrength >= 120)		{	kosten = (5);	}
		else if (Mod_RealStrength >= 90) 	{	kosten = (4);	}
		else if (Mod_RealStrength >= 60) 	{	kosten = (3);	}
		else if (Mod_RealStrength >= 30) 	{	kosten = (2);	}
		else 					{	kosten = (1);	};

		if (Mod_Gilde == 6)
		|| (Mod_Gilde == 7)
		|| (Mod_Gilde == 8)
		|| (Mod_Gilde == 10)
		|| (Mod_Gilde == 11)
		|| (Mod_Gilde == 13)
		|| (Mod_Gilde == 14)
		{
			kosten = kosten*2;
		};
	};
	
	// ------ Kosten für Dexterity ------
	if (attribut == ATR_DEXTERITY) 
	{
		if (Mod_RealDexterity >= 120)		{	kosten = (5);	}
		else if (Mod_RealDexterity >= 90)	{	kosten = (4);	}
		else if (Mod_RealDexterity >= 60)	{	kosten = (3);	}
		else if (Mod_RealDexterity >= 30)	{	kosten = (2);	}
		else 					{	kosten = (1);	};

		if (Mod_Gilde == 6)
		|| (Mod_Gilde == 7)
		|| (Mod_Gilde == 8)
		|| (Mod_Gilde == 10)
		|| (Mod_Gilde == 11)
		|| (Mod_Gilde == 13)
		|| (Mod_Gilde == 14)
		{
			kosten = kosten*2;
		};
	};
	
	// ------ Kosten für Mana MAX ------
	if (attribut == ATR_MANA_MAX)
	{		
		if (Mod_RealMana >= 120)		{	kosten = (5);	}
		else if (Mod_RealMana >= 90) 		{	kosten = (4);	}
		else if (Mod_RealMana >= 60) 		{	kosten = (3);	}
		else if (Mod_RealMana >= 30) 		{	kosten = (2);	}
		else 					{	kosten = (1);	};

		if (Mod_Gilde == 4)
		|| (Mod_Gilde == 5)
		|| (Mod_Gilde == 19)
		|| (Mod_Gilde == 15)
		|| (Mod_Gilde == 16)
		|| (Mod_Gilde == 17)
		|| (Mod_Gilde == 18)
		{
			kosten = kosten*2;
		};
	};
	
	return kosten;
};
	
func int B_GetLearnCostAttribute_New (var C_NPC oth, var int attribut)
{
	var int kosten; kosten = 0;

	// ------ Kosten für Stärke ------
	if (attribut == ATR_STRENGTH) 
	{
		if (Mod_Realstrength >= 120)		{	kosten = (25);	}
		else if (Mod_Realstrength == 119)	{	kosten = (24);	}
		else if (Mod_Realstrength == 118)	{	kosten = (23);	}
		else if (Mod_Realstrength == 117)	{	kosten = (22);	}
		else if (Mod_Realstrength == 116)	{	kosten = (21);	}
		else if (Mod_Realstrength >= 90)	{	kosten = (20);	}
		else if (Mod_Realstrength == 89)	{	kosten = (19);	}
		else if (Mod_Realstrength == 88)	{	kosten = (18);	}
		else if (Mod_Realstrength == 87)	{	kosten = (17);	}
		else if (Mod_Realstrength == 86)	{	kosten = (16);	}
		else if (Mod_Realstrength >= 60)	{	kosten = (15);	}
		else if (Mod_Realstrength == 59)	{	kosten = (14);	}
		else if (Mod_Realstrength == 58)	{	kosten = (13);	}
		else if (Mod_Realstrength == 57)	{	kosten = (12);	}
		else if (Mod_Realstrength == 56)	{	kosten = (11);	}
		else if (Mod_Realstrength >= 30)	{	kosten = (10);	}
		else if (Mod_Realstrength == 29)	{	kosten = (9);	}
		else if (Mod_Realstrength == 28)	{	kosten = (8);	}
		else if (Mod_Realstrength == 27)	{	kosten = (7);	}
		else if (Mod_Realstrength == 26)	{	kosten = (6);	}
		else 					{	kosten = (5);	};

		if (Mod_Gilde == 6)
		|| (Mod_Gilde == 7)
		|| (Mod_Gilde == 8)
		|| (Mod_Gilde == 10)
		|| (Mod_Gilde == 11)
		|| (Mod_Gilde == 13)
		|| (Mod_Gilde == 14)
		{
			kosten = kosten*2;
		};
	};
	
	// ------ Kosten für Dexterity ------
	if (attribut == ATR_DEXTERITY) 
	{
		if (Mod_RealDexterity >= 120)		{	kosten = (25);	}
		else if (Mod_RealDexterity == 119)	{	kosten = (24);	}
		else if (Mod_RealDexterity == 118)	{	kosten = (23);	}
		else if (Mod_RealDexterity == 117)	{	kosten = (22);	}
		else if (Mod_RealDexterity == 116)	{	kosten = (21);	}
		else if (Mod_RealDexterity >= 90)	{	kosten = (20);	}
		else if (Mod_RealDexterity == 89)	{	kosten = (19);	}
		else if (Mod_RealDexterity == 88)	{	kosten = (18);	}
		else if (Mod_RealDexterity == 87)	{	kosten = (17);	}
		else if (Mod_RealDexterity == 86)	{	kosten = (16);	}
		else if (Mod_RealDexterity >= 60)	{	kosten = (15);	}
		else if (Mod_RealDexterity == 59)	{	kosten = (14);	}
		else if (Mod_RealDexterity == 58)	{	kosten = (13);	}
		else if (Mod_RealDexterity == 57)	{	kosten = (12);	}
		else if (Mod_RealDexterity == 56)	{	kosten = (11);	}
		else if (Mod_RealDexterity >= 30)	{	kosten = (10);	}
		else if (Mod_RealDexterity == 29)	{	kosten = (9);	}
		else if (Mod_RealDexterity == 28)	{	kosten = (8);	}
		else if (Mod_RealDexterity == 27)	{	kosten = (7);	}
		else if (Mod_RealDexterity == 26)	{	kosten = (6);	}
		else 					{	kosten = (5);	};

		if (Mod_Gilde == 6)
		|| (Mod_Gilde == 7)
		|| (Mod_Gilde == 8)
		|| (Mod_Gilde == 10)
		|| (Mod_Gilde == 11)
		|| (Mod_Gilde == 13)
		|| (Mod_Gilde == 14)
		{
			kosten = kosten*2;
		};
	};
	
	// ------ Kosten für Mana MAX ------
	if (attribut == ATR_MANA_MAX)
	{
		if (Mod_RealMana >= 120)	{	kosten = (25);	}
		else if (Mod_RealMana == 119)	{	kosten = (24);	}
		else if (Mod_RealMana == 118)	{	kosten = (23);	}
		else if (Mod_RealMana == 117)	{	kosten = (22);	}
		else if (Mod_RealMana == 116)	{	kosten = (21);	}
		else if (Mod_RealMana >= 90)	{	kosten = (20);	}
		else if (Mod_RealMana == 89)	{	kosten = (19);	}
		else if (Mod_RealMana == 88)	{	kosten = (18);	}
		else if (Mod_RealMana == 87)	{	kosten = (17);	}
		else if (Mod_RealMana == 86)	{	kosten = (16);	}
		else if (Mod_RealMana >= 60)	{	kosten = (15);	}
		else if (Mod_RealMana == 59)	{	kosten = (14);	}
		else if (Mod_RealMana == 58)	{	kosten = (13);	}
		else if (Mod_RealMana == 57)	{	kosten = (12);	}
		else if (Mod_RealMana == 56)	{	kosten = (11);	}
		else if (Mod_RealMana >= 30)	{	kosten = (10);	}
		else if (Mod_RealMana == 29)	{	kosten = (9);	}
		else if (Mod_RealMana == 28)	{	kosten = (8);	}
		else if (Mod_RealMana == 27)	{	kosten = (7);	}
		else if (Mod_RealMana == 26)	{	kosten = (6);	}
		else 				{	kosten = (5);	};

		if (Mod_Gilde == 4)
		|| (Mod_Gilde == 5)
		|| (Mod_Gilde == 19)
		|| (Mod_Gilde == 15)
		|| (Mod_Gilde == 16)
		|| (Mod_Gilde == 17)
		|| (Mod_Gilde == 18)
		{
			kosten = kosten*2;
		};
	};
	
	return kosten;
};