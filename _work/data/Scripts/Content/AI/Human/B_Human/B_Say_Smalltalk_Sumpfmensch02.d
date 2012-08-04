var int Mod_Smalltalk_Sumpfmensch02;

FUNC VOID B_Say_Smalltalk_Sumpfmensch02 ()
{
	if (Mod_Smalltalk_Sumpfmensch02 == 0)
	{
		AI_Output(Mod_1337_PSINOV_Novize_MT, NULL, "Info_Mod_Smalltalk_Sumpfmensch02_05_00"); //Und der Neffe einer entfernten Schwägerin hat einen Cousin, dessen Schwiegertochter dem Sumpfmenschen um ein Haar entkommen ist!

		Mod_Smalltalk_Sumpfmensch02 = 1;
	}
	else if (Mod_Smalltalk_Sumpfmensch02 == 1)
	{
		AI_Output(Mod_1336_PSINOV_Novize_MT, NULL, "Info_Mod_Smalltalk_Sumpfmensch02_03_01"); //Was du nicht sagst!

		Mod_Smalltalk_Sumpfmensch02 = 2;
	}
	else if (Mod_Smalltalk_Sumpfmensch02 == 2)
	{
		AI_Output(Mod_1338_PSINOV_Novize_MT, NULL, "Info_Mod_Smalltalk_Sumpfmensch02_03_02"); //Meine Güte, niemand ist mehr sicher!!!

		Mod_Smalltalk_Sumpfmensch02 = 0;
	};
};