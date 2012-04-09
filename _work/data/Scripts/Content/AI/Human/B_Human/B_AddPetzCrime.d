// **************************************************
// B_AddPetzCrime
// --------------
// Erhöht Petzcrime-Counter der übergebenen Crime
// in der der Home-Location
// **************************************************

func void B_AddPetzCrime (var C_NPC slf, var int crime)
{

	B_Vergiftet (slf);

	// ------ OldCamp ------
	if (C_NpcBelongsToOldCamp(slf))
	{
		if (crime == CRIME_MURDER)
		{
			PETZCOUNTER_OldCamp_Murder = PETZCOUNTER_OldCamp_Murder + 1;
		};
		
		if (crime == CRIME_THEFT)
		{
			PETZCOUNTER_OldCamp_Theft = PETZCOUNTER_OldCamp_Theft + 1;
		};
		
		if (crime == CRIME_ATTACK)
		{
			PETZCOUNTER_OldCamp_Attack = PETZCOUNTER_OldCamp_Attack + 1;
		};
	
		if (crime == CRIME_SHEEPKILLER)
		{
			PETZCOUNTER_OldCamp_Sheepkiller = PETZCOUNTER_OldCamp_Sheepkiller + 1;
		};
	};

	if (C_NpcBelongsToPsiCamp(slf))
	{
		if (crime == CRIME_MURDER)
		{
			PETZCOUNTER_PsiCamp_Murder = PETZCOUNTER_PsiCamp_Murder + 1;
		};
		
		if (crime == CRIME_THEFT)
		{
			PETZCOUNTER_PsiCamp_Theft = PETZCOUNTER_PsiCamp_Theft + 1;
		};
		
		if (crime == CRIME_ATTACK)
		{
			PETZCOUNTER_PsiCamp_Attack = PETZCOUNTER_PsiCamp_Attack + 1;
		};
	
		if (crime == CRIME_SHEEPKILLER)
		{
			PETZCOUNTER_PsiCamp_Sheepkiller = PETZCOUNTER_PsiCamp_Sheepkiller + 1;
		};
	};

	if (C_NpcBelongsToPatherion(slf))
	{
		if (crime == CRIME_MURDER)
		{
			PETZCOUNTER_Patherion_Murder = PETZCOUNTER_Patherion_Murder + 1;
		};
		
		if (crime == CRIME_THEFT)
		{
			PETZCOUNTER_Patherion_Theft = PETZCOUNTER_Patherion_Theft + 1;
		};
		
		if (crime == CRIME_ATTACK)
		{
			PETZCOUNTER_Patherion_Attack = PETZCOUNTER_Patherion_Attack + 1;
		};
	
		if (crime == CRIME_SHEEPKILLER)
		{
			PETZCOUNTER_Patherion_Sheepkiller = PETZCOUNTER_Patherion_Sheepkiller + 1;
		};
	};

	if (C_NpcBelongsToBandit(slf))
	{
		if (crime == CRIME_MURDER)
		{
			PETZCOUNTER_Bandit_Murder = PETZCOUNTER_Bandit_Murder + 1;
		};
		
		if (crime == CRIME_THEFT)
		{
			PETZCOUNTER_Bandit_Theft = PETZCOUNTER_Bandit_Theft + 1;
		};
		
		if (crime == CRIME_ATTACK)
		{
			PETZCOUNTER_Bandit_Attack = PETZCOUNTER_Bandit_Attack + 1;
		};
	
		if (crime == CRIME_SHEEPKILLER)
		{
			PETZCOUNTER_Bandit_Sheepkiller = PETZCOUNTER_Bandit_Sheepkiller + 1;
		};
	};

	if (C_NpcBelongsToWMCamp(slf))
	{
		if (crime == CRIME_MURDER)
		{
			PETZCOUNTER_WMCamp_Murder = PETZCOUNTER_WMCamp_Murder + 1;
		};
		
		if (crime == CRIME_THEFT)
		{
			PETZCOUNTER_WMCamp_Theft = PETZCOUNTER_WMCamp_Theft + 1;
		};
		
		if (crime == CRIME_ATTACK)
		{
			PETZCOUNTER_WMCamp_Attack = PETZCOUNTER_WMCamp_Attack + 1;
		};
	
		if (crime == CRIME_SHEEPKILLER)
		{
			PETZCOUNTER_WMCamp_Sheepkiller = PETZCOUNTER_WMCamp_Sheepkiller + 1;
		};
	};

	if (C_NpcBelongsToSCamp(slf))
	{
		if (crime == CRIME_MURDER)
		{
			PETZCOUNTER_SCamp_Murder = PETZCOUNTER_SCamp_Murder + 1;
		};
		
		if (crime == CRIME_THEFT)
		{
			PETZCOUNTER_SCamp_Theft = PETZCOUNTER_SCamp_Theft + 1;
		};
		
		if (crime == CRIME_ATTACK)
		{
			PETZCOUNTER_SCamp_Attack = PETZCOUNTER_SCamp_Attack + 1;
		};
	
		if (crime == CRIME_SHEEPKILLER)
		{
			PETZCOUNTER_SCamp_Sheepkiller = PETZCOUNTER_SCamp_Sheepkiller + 1;
		};
	};
	
	// ------ City ------
	if (C_NpcBelongsToCity(slf))
	{
		if (crime == CRIME_MURDER)
		{
			PETZCOUNTER_City_Murder = PETZCOUNTER_City_Murder + 1;
		};
		
		if (crime == CRIME_THEFT)
		{
			PETZCOUNTER_City_Theft = PETZCOUNTER_City_Theft + 1;
		};
		
		if (crime == CRIME_ATTACK)
		{
			PETZCOUNTER_City_Attack = PETZCOUNTER_City_Attack + 1;
		};
	
		if (crime == CRIME_SHEEPKILLER)
		{
			PETZCOUNTER_City_Sheepkiller = PETZCOUNTER_City_Sheepkiller + 1;
		};

		Mod_GarondCityCrime += 1;
	};
	
	// ------ Monastery ------
	if (C_NpcBelongsToMonastery(slf))
	{
		if (crime == CRIME_MURDER)
		{
			PETZCOUNTER_Monastery_Murder = PETZCOUNTER_Monastery_Murder + 1;
		};
		
		if (crime == CRIME_THEFT)
		{
			PETZCOUNTER_Monastery_Theft = PETZCOUNTER_Monastery_Theft + 1;
		};
		
		if (crime == CRIME_ATTACK)
		{
			PETZCOUNTER_Monastery_Attack = PETZCOUNTER_Monastery_Attack + 1;
		};
	
		if (crime == CRIME_SHEEPKILLER)
		{
			PETZCOUNTER_Monastery_Sheepkiller = PETZCOUNTER_Monastery_Sheepkiller + 1;
		};
	};

	// ------ Farm ------
	if (C_NpcBelongsToFarm(slf))
	{
		if (crime == CRIME_MURDER)
		{
			PETZCOUNTER_Farm_Murder = PETZCOUNTER_Farm_Murder + 1;
		};
		
		if (crime == CRIME_THEFT)
		{
			PETZCOUNTER_Farm_Theft = PETZCOUNTER_Farm_Theft + 1;
		};
		
		if (crime == CRIME_ATTACK)
		{
			PETZCOUNTER_Farm_Attack = PETZCOUNTER_Farm_Attack + 1;
		};
	
		if (crime == CRIME_SHEEPKILLER)
		{
			PETZCOUNTER_Farm_Sheepkiller = PETZCOUNTER_Farm_Sheepkiller + 1;
		};
	};
	// ------ Banditenlager Addon ------
	if (C_NpcBelongsToBL(slf))
	{
		if (crime == CRIME_MURDER)
		{
			PETZCOUNTER_BL_Murder = PETZCOUNTER_BL_Murder + 1;
		};
		
		if (crime == CRIME_THEFT)
		{
			PETZCOUNTER_BL_Theft = PETZCOUNTER_BL_Theft + 1;
		};
		
		if (crime == CRIME_ATTACK)
		{
			PETZCOUNTER_BL_Attack = PETZCOUNTER_BL_Attack + 1;
		};
	
	};
};

