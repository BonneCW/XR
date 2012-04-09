// *****************
// B_StopBeliarCity
// *****************

// **************
// ZS_BeliarCity
// **************

func void ZS_BeliarCity()
{
	/*Mod_Spell_BeliarCity = TRUE;

	Npc_SetStateTime(self, 0);	*/


	Print ("Die Wirkung des Zaubers neigt sich dem Ende zu");
	
	if (Npc_GetStateTime(self) > SPL_TIME_BeliarCity)
	{
		Mod_Spell_BeliarCity = FALSE;
	}
	else
	{
		Mod_Spell_BeliarCity = TRUE;

		if (Npc_GetStateTime(self) < 60)
		{
			Print ("Die Wirkung des Zaubers neigt sich dem Ende zu");
		};

		ZS_BeliarCity();
	};
};
/*
func int ZS_BeliarCity_Loop ()
{	
	Mod_Spell_BeliarCity = TRUE;

	if (Npc_GetStateTime(self) < 60)
	{
		Print ("Die Wirkung des Zaubers neigt sich dem Ende zu");
	};

       if (Npc_GetStateTime(self) > SPL_TIME_BeliarCity)
	{
		return LOOP_END;
	};
	
	// LOOP FUNC
	return				LOOP_CONTINUE;
};


func void ZS_BeliarCity_End()
{
	Mod_Spell_BeliarCity = FALSE;
};
*/