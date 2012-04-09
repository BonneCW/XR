FUNC VOID ERFINDERHAUS ()
{
	if (Mod_InErfinderhaus == TRUE)
	&& (Mod_Erfinderbrief_Gelesen == FALSE)
	{
		AI_GotoWP	(PC_Hero, "NW_CITY_UPTOWN_HUT_04_04");

		AI_Output(PC_Hero, NULL, "Info_Mod_Hero_ErfinderHaus_15_00"); //Ich sollte mich noch ein wenig umsehen.
	};
};

FUNC VOID ERFINDERLARIUSLAWRENCE()
{
	if (Mod_MitLawrenceGesprochen == 2)
	{
		Mod_MitLawrenceGesprochen = 3;

		Wld_SendTrigger	("DIALOGLARIUSLAWRENCE");

		
	};
};