// ****************************************************
// B_GetPetzCrime
// --------------
// Liefert Petzcrime in Abhängigkeit von Home-Location
// wenn NSC keine Home-Location angehört --> CRIME_NONE
// ****************************************************

func int B_GetGreatestPetzCrime (var C_NPC slf)
{

	// ------ OldCamp ------
	if (C_NpcBelongsToOldCamp(slf))
	{
		if (PETZCOUNTER_OldCamp_Murder > 0)
		{
			return CRIME_MURDER;
		};
		
		if (PETZCOUNTER_OldCamp_Theft > 0)
		{
			return CRIME_THEFT;
		};
		
		if (PETZCOUNTER_OldCamp_Attack > 0)
		{
			return CRIME_ATTACK;
		};
		
		if (PETZCOUNTER_OldCamp_Sheepkiller > 0)
		{
			return CRIME_SHEEPKILLER;
		};
	};
	
	if (C_NpcBelongsToPsiCamp(slf))
	{
		if (PETZCOUNTER_PsiCamp_Murder > 0)
		{
			return CRIME_MURDER;
		};
		
		if (PETZCOUNTER_PsiCamp_Theft > 0)
		{
			return CRIME_THEFT;
		};
		
		if (PETZCOUNTER_PsiCamp_Attack > 0)
		{
			return CRIME_ATTACK;
		};
		
		if (PETZCOUNTER_PsiCamp_Sheepkiller > 0)
		{
			return CRIME_SHEEPKILLER;
		};
	};
	
	if (C_NpcBelongsToPatherion(slf))
	{
		if (PETZCOUNTER_Patherion_Murder > 0)
		{
			return CRIME_MURDER;
		};
		
		if (PETZCOUNTER_Patherion_Theft > 0)
		{
			return CRIME_THEFT;
		};
		
		if (PETZCOUNTER_Patherion_Attack > 0)
		{
			return CRIME_ATTACK;
		};
		
		if (PETZCOUNTER_Patherion_Sheepkiller > 0)
		{
			return CRIME_SHEEPKILLER;
		};
	};
	
	if (C_NpcBelongsToBandit(slf))
	{
		if (PETZCOUNTER_Bandit_Murder > 0)
		{
			return CRIME_MURDER;
		};
		
		if (PETZCOUNTER_Bandit_Theft > 0)
		{
			return CRIME_THEFT;
		};
		
		if (PETZCOUNTER_Bandit_Attack > 0)
		{
			return CRIME_ATTACK;
		};
		
		if (PETZCOUNTER_Bandit_Sheepkiller > 0)
		{
			return CRIME_SHEEPKILLER;
		};
	};
	
	if (C_NpcBelongsToWMCamp(slf))
	{
		if (PETZCOUNTER_WMCamp_Murder > 0)
		{
			return CRIME_MURDER;
		};
		
		if (PETZCOUNTER_WMCamp_Theft > 0)
		{
			return CRIME_THEFT;
		};
		
		if (PETZCOUNTER_WMCamp_Attack > 0)
		{
			return CRIME_ATTACK;
		};
		
		if (PETZCOUNTER_WMCamp_Sheepkiller > 0)
		{
			return CRIME_SHEEPKILLER;
		};
	};
	
	if (C_NpcBelongsToSCamp(slf))
	{
		if (PETZCOUNTER_SCamp_Murder > 0)
		{
			return CRIME_MURDER;
		};
		
		if (PETZCOUNTER_SCamp_Theft > 0)
		{
			return CRIME_THEFT;
		};
		
		if (PETZCOUNTER_SCamp_Attack > 0)
		{
			return CRIME_ATTACK;
		};
		
		if (PETZCOUNTER_SCamp_Sheepkiller > 0)
		{
			return CRIME_SHEEPKILLER;
		};
	};
	// ------ City ------
	if (C_NpcBelongsToCity(slf))
	{
		if (PETZCOUNTER_City_Murder > 0)
		{
			return CRIME_MURDER;
		};
		
		if (PETZCOUNTER_City_Theft > 0)
		{
			return CRIME_THEFT;
		};
		
		if (PETZCOUNTER_City_Attack > 0)
		{
			return CRIME_ATTACK;
		};
		
		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			return CRIME_SHEEPKILLER;
		};
	};
	
	// ------ Monastery ------
	if (C_NpcBelongsToMonastery(slf))
	{
		if (PETZCOUNTER_Monastery_Murder > 0)
		{
			return CRIME_MURDER;
		};
		
		if (PETZCOUNTER_Monastery_Theft > 0)
		{
			return CRIME_THEFT;
		};
		
		if (PETZCOUNTER_Monastery_Attack > 0)
		{
			return CRIME_ATTACK;
		};
		
		if (PETZCOUNTER_Monastery_Sheepkiller > 0)
		{
			return CRIME_SHEEPKILLER;
		};
	};
	
	// ------ Farm ------
	if (C_NpcBelongsToFarm(slf))
	{
		if (PETZCOUNTER_Farm_Murder > 0)
		{
			return CRIME_MURDER;
		};
		
		if (PETZCOUNTER_Farm_Theft > 0)
		{
			return CRIME_THEFT;
		};
		
		if (PETZCOUNTER_Farm_Attack > 0)
		{
			return CRIME_ATTACK;
		};
		
		if (PETZCOUNTER_Farm_Sheepkiller > 0)
		{
			return CRIME_SHEEPKILLER;
		};
	};
	
	// ------ Khorata ------
	if (C_NpcBelongsToKhorata(slf))
	{
		if (PETZCOUNTER_Khorata_Murder > 0)
		{
			return CRIME_MURDER;
		};
		
		if (PETZCOUNTER_Khorata_Theft > 0)
		{
			return CRIME_THEFT;
		};
		
		if (PETZCOUNTER_Khorata_Attack > 0)
		{
			return CRIME_ATTACK;
		};
		
		if (PETZCOUNTER_Khorata_Sheepkiller > 0)
		{
			return CRIME_SHEEPKILLER;
		};
	};
	
	// ------ Banditenlager Addon ------
	if (C_NpcBelongsToBL(slf))
	{
		if (PETZCOUNTER_BL_Murder > 0)
		{
			return CRIME_MURDER;
		};
		
		if (PETZCOUNTER_BL_Theft > 0)
		{
			return CRIME_THEFT;
		};
		
		if (PETZCOUNTER_BL_Attack > 0)
		{
			return CRIME_ATTACK;
		};
	};
		
	return CRIME_NONE;
};
		
		
