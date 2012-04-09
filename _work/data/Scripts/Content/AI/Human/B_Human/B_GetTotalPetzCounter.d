// *********************
// B_GetTotalPetzCounter
// *********************

func int B_GetTotalPetzCounter (var C_NPC slf)
{

	// ------ OldCamp ------
	if (C_NpcBelongsToOldCamp(slf))
	{
		return (PETZCOUNTER_OldCamp_Murder + PETZCOUNTER_OldCamp_Theft + PETZCOUNTER_OldCamp_Attack + PETZCOUNTER_OldCamp_Sheepkiller);
	};
	
	if (C_NpcBelongsToPsiCamp(slf))
	{
		return (PETZCOUNTER_PsiCamp_Murder + PETZCOUNTER_PsiCamp_Theft + PETZCOUNTER_PsiCamp_Attack + PETZCOUNTER_PsiCamp_Sheepkiller);
	};
	
	if (C_NpcBelongsToPatherion(slf))
	{
		return (PETZCOUNTER_Patherion_Murder + PETZCOUNTER_Patherion_Theft + PETZCOUNTER_Patherion_Attack + PETZCOUNTER_Patherion_Sheepkiller);
	};
	
	if (C_NpcBelongsToBandit(slf))
	{
		return (PETZCOUNTER_Bandit_Murder + PETZCOUNTER_Bandit_Theft + PETZCOUNTER_Bandit_Attack + PETZCOUNTER_Bandit_Sheepkiller);
	};
	
	if (C_NpcBelongsToWMCamp(slf))
	{
		return (PETZCOUNTER_WMCamp_Murder + PETZCOUNTER_WMCamp_Theft + PETZCOUNTER_WMCamp_Attack + PETZCOUNTER_WMCamp_Sheepkiller);
	};
	
	if (C_NpcBelongsToSCamp(slf))
	{
		return (PETZCOUNTER_SCamp_Murder + PETZCOUNTER_SCamp_Theft + PETZCOUNTER_SCamp_Attack + PETZCOUNTER_SCamp_Sheepkiller);
	};

	// ------ City ------
	if (C_NpcBelongsToCity(slf))
	{
		return (PETZCOUNTER_City_Murder + PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller);
	};
	
	// ------ Monastery ------
	if (C_NpcBelongsToMonastery(slf))
	{
		return (PETZCOUNTER_Monastery_Murder + PETZCOUNTER_Monastery_Theft + PETZCOUNTER_Monastery_Attack + PETZCOUNTER_Monastery_Sheepkiller);
	};
	
	// ------ Farm ------
	if (C_NpcBelongsToFarm(slf))
	{
		return (PETZCOUNTER_Farm_Murder + PETZCOUNTER_Farm_Theft + PETZCOUNTER_Farm_Attack + PETZCOUNTER_Farm_Sheepkiller);
	};
	
	// ------ Khorata ------
	if (C_NpcBelongsToKhorata(slf))
	{
		return (PETZCOUNTER_Khorata_Murder + PETZCOUNTER_Khorata_Theft + PETZCOUNTER_Khorata_Attack + PETZCOUNTER_Khorata_Sheepkiller);
	};
	// ------ Banditenlager ------
	if (C_NpcBelongsToBL(slf))
	{
		return (PETZCOUNTER_BL_Murder + PETZCOUNTER_BL_Theft + PETZCOUNTER_BL_Attack); 
	};
		
	return 0; //default
};
