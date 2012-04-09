// **********************************************
// B_GrantAbsolution
// -----------------
// Resettet alle Absolution/News/Petz - Variablen
// für die angegebene Location
// **********************************************

func void B_GrantAbsolution (var int location)
{
	// ------ OldCamp ------
	if (location == LOC_OLDCAMP)
	|| (location == LOC_ALL)
	{
		ABSOLUTIONLEVEL_OldCamp	= ABSOLUTIONLEVEL_OldCamp + 1;
		
		PETZCOUNTER_OldCamp_Murder	 	= 0;
		PETZCOUNTER_OldCamp_Theft	 	= 0;
		PETZCOUNTER_OldCamp_Attack 		= 0;
		PETZCOUNTER_OldCamp_Sheepkiller	= 0;
	};
	
	if (location == LOC_PsiCAMP)
	|| (location == LOC_ALL)
	{
		ABSOLUTIONLEVEL_PsiCamp	= ABSOLUTIONLEVEL_PsiCamp + 1;
		
		PETZCOUNTER_PsiCamp_Murder	 	= 0;
		PETZCOUNTER_PsiCamp_Theft	 	= 0;
		PETZCOUNTER_PsiCamp_Attack 		= 0;
		PETZCOUNTER_PsiCamp_Sheepkiller	= 0;
	};
	
	if (location == LOC_Patherion)
	|| (location == LOC_ALL)
	{
		ABSOLUTIONLEVEL_Patherion	= ABSOLUTIONLEVEL_Patherion + 1;
		
		PETZCOUNTER_Patherion_Murder	 	= 0;
		PETZCOUNTER_Patherion_Theft	 	= 0;
		PETZCOUNTER_Patherion_Attack 		= 0;
		PETZCOUNTER_Patherion_Sheepkiller	= 0;
	};
	
	if (location == LOC_Bandit)
	|| (location == LOC_ALL)
	{
		ABSOLUTIONLEVEL_Bandit	= ABSOLUTIONLEVEL_Bandit + 1;
		
		PETZCOUNTER_Bandit_Murder	 	= 0;
		PETZCOUNTER_Bandit_Theft	 	= 0;
		PETZCOUNTER_Bandit_Attack 		= 0;
		PETZCOUNTER_Bandit_Sheepkiller	= 0;
	};
	
	if (location == LOC_WMCAMP)
	|| (location == LOC_ALL)
	{
		ABSOLUTIONLEVEL_WMCamp	= ABSOLUTIONLEVEL_WMCamp + 1;
		
		PETZCOUNTER_WMCamp_Murder	 	= 0;
		PETZCOUNTER_WMCamp_Theft	 	= 0;
		PETZCOUNTER_WMCamp_Attack 		= 0;
		PETZCOUNTER_WMCamp_Sheepkiller	= 0;
	};
	
	if (location == LOC_SMCAMP)
	|| (location == LOC_ALL)
	{
		ABSOLUTIONLEVEL_SCamp	= ABSOLUTIONLEVEL_SCamp + 1;
		
		PETZCOUNTER_SCamp_Murder	 	= 0;
		PETZCOUNTER_SCamp_Theft	 	= 0;
		PETZCOUNTER_SCamp_Attack 		= 0;
		PETZCOUNTER_SCamp_Sheepkiller	= 0;
	};
	// ------ City ------
	if (location == LOC_CITY)
	|| (location == LOC_ALL)
	{
		ABSOLUTIONLEVEL_City	= ABSOLUTIONLEVEL_City + 1;
		
		PETZCOUNTER_City_Murder	 		= 0;
		PETZCOUNTER_City_Theft	 		= 0;
		PETZCOUNTER_City_Attack 		= 0;
		PETZCOUNTER_City_Sheepkiller	= 0;
	};
	
	// ------ Monastery ------
	if (location == LOC_MONASTERY)
	|| (location == LOC_ALL)
	{
		ABSOLUTIONLEVEL_Monastery 	= ABSOLUTIONLEVEL_Monastery + 1;
		
		PETZCOUNTER_Monastery_Murder	 		= 0;
		PETZCOUNTER_Monastery_Theft				= 0;		
		PETZCOUNTER_Monastery_Attack			= 0;
		PETZCOUNTER_Monastery_Sheepkiller		= 0;
	};
	
	// ------ Farm ------
	if (location == LOC_FARM)
	|| (location == LOC_ALL)
	{
		ABSOLUTIONLEVEL_Farm 	= ABSOLUTIONLEVEL_Farm + 1;
		
		PETZCOUNTER_Farm_Murder			= 0;
		PETZCOUNTER_Farm_Theft			= 0;
		PETZCOUNTER_Farm_Attack			= 0;
		PETZCOUNTER_Farm_Sheepkiller	= 0;
	};
	
	// ------ Khorata ------
	if (location == LOC_Khorata)
	|| (location == LOC_ALL)
	{
		ABSOLUTIONLEVEL_Khorata 	= ABSOLUTIONLEVEL_Khorata + 1;
		
		PETZCOUNTER_Khorata_Murder			= 0;
		PETZCOUNTER_Khorata_Theft			= 0;
		PETZCOUNTER_Khorata_Attack			= 0;
		PETZCOUNTER_Khorata_Sheepkiller	= 0;
	};
	
	// ------ Banditenlager ------
	if (location == LOC_BL)
	//KEIN LOC_ALL FÜR BANDITEN!!
	{
		ABSOLUTIONLEVEL_BL 	= ABSOLUTIONLEVEL_BL + 1;
		
		PETZCOUNTER_BL_Murder			= 0;
		PETZCOUNTER_BL_Theft			= 0;
		PETZCOUNTER_BL_Attack			= 0;
	};
};

