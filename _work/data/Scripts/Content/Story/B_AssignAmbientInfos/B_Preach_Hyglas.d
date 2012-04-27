// ***************
// B_Preach_Hyglas
// ***************

func void B_Preach_Hyglas(var int satz)
{
	if (satz == 0) 	
	{	
		AI_Output (self, self, "Info_Mod_Hyglas_Preach_14_00"); //Ach, wie ungerecht doch die Welt ist!
	};
	if (satz == 1) 	
	{	
		AI_Output (self, self, "Info_Mod_Hyglas_Preach_14_01"); //Die zischende Schlange verspeist das unschuldige Eichhörnchen.
	};
	if (satz == 2) 	
	{	
		AI_Output (self, self, "Info_Mod_Hyglas_Preach_14_02"); //O weh, mir widerfährt Unrecht!
	};
};
