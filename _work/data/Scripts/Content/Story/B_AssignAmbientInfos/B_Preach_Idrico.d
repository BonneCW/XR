// ***************
// B_Preach_Idrico
// ***************

func void B_Preach_Idrico(var int satz)
{
	if (Mod_REL_IdricoDorn == 6)
	{
		if (satz == 0) 	
		{	
			AI_Output (self, self, "Info_Mod_Idrico_Preach_08_00"); //Ach, wie ungerecht doch die Welt ist!
		};
		if (satz == 1) 	
		{	
			AI_Output (self, self, "Info_Mod_Idrico_Preach_08_01"); //Die zischende Schlange verspeist das unschuldige Eichhörnchen.
		};
		if (satz == 2) 	
		{	
			AI_Output (self, self, "Info_Mod_Idrico_Preach_08_02"); //O weh, mir widerfährt Unrecht!
		};
	}
	else
	{
		if (satz == 0) 	
		{	
			AI_Output (self, self, "Info_Mod_Idrico_Preach_08_03"); //Kehrt um, ihr armen Frevler!
		};
		if (satz == 1) 	
		{	
			AI_Output (self, self, "Info_Mod_Idrico_Preach_08_04"); //Adanos breitet seine Arme schützend um seine Schafe aus.
		};
		if (satz == 2)
		{	
			AI_Output (self, self, "Info_Mod_Idrico_Preach_08_05"); //Hört von Elviras Gotteslästerung!
		};
		if (satz == 3)
		{	
			AI_Output (self, self, "Info_Mod_Idrico_Preach_08_06"); //Kommt zu mir, und ihr werdet erleuchtet.
		};
	};
};
