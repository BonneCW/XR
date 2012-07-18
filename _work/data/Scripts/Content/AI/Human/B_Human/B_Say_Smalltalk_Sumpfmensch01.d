var int Mod_Smalltalk_Sumpfmensch01;

FUNC VOID B_Say_Smalltalk_Sumpfmensch01 ()
{
	if (Mod_Smalltalk_Sumpfmensch01 == 0)
	{
		AI_Output(Mod_2008_PSINOV_Ghorim_MT, NULL, "Info_Mod_Smalltalk_Sumpfmensch01_02_00"); //Ich habe ihn wirklich gesehen ...

		Mod_Smalltalk_Sumpfmensch01 = 1;
	}
	else if (Mod_Smalltalk_Sumpfmensch01 == 1)
	{
		AI_Output(Mod_1339_PSINOV_Novize_MT, NULL, "Info_Mod_Smalltalk_Sumpfmensch01_03_01"); //Ach, hör auf!

		Mod_Smalltalk_Sumpfmensch01 = 2;
	}
	else if (Mod_Smalltalk_Sumpfmensch01 == 2)
	{
		AI_Output(Mod_2008_PSINOV_Ghorim_MT, NULL, "Info_Mod_Smalltalk_Sumpfmensch01_02_02"); //Nein, wirklich. Er ist rieeesig und er stinkt nach Verwesung!

		Mod_Smalltalk_Sumpfmensch01 = 3;
	}
	else if (Mod_Smalltalk_Sumpfmensch01 == 3)
	{
		AI_Output(Mod_1339_PSINOV_Novize_MT, NULL, "Info_Mod_Smalltalk_Sumpfmensch01_03_03"); //Du willst dich doch nur wichtigmachen!

		Mod_Smalltalk_Sumpfmensch01 = 0;
	};
};