var int Mod_Smalltalk_Assassine1;

FUNC VOID B_Say_Smalltalk_Assassine1 ()
{
	if (Mod_Smalltalk_Assassine1 == 0)
	{
		AI_Output(Mod_7106_ASS_Ramsi_NW, NULL, "Info_Mod_Smalltalk_Assassine1_08_00"); //Ist gar nicht mehr so einfach mit der Jägerei.

		Mod_Smalltalk_Assassine1 = 1;
	}
	else if (Mod_Smalltalk_Assassine1 == 1)
	{
		AI_Output(Mod_7105_ASS_Aabid_NW, NULL, "Info_Mod_Smalltalk_Assassine1_09_01"); //Ich weiß. Die Wölfe werden zur Plage.

		Mod_Smalltalk_Assassine1 = 2;
	}
	else if (Mod_Smalltalk_Assassine1 == 2)
	{
		AI_Output(Mod_7106_ASS_Ramsi_NW, NULL, "Info_Mod_Smalltalk_Assassine1_08_02"); //Am schlimmsten sind die Schwarzen. Sehr agressiv.

		Mod_Smalltalk_Assassine1 = 3;
	}
	else if (Mod_Smalltalk_Assassine1 == 3)
	{
		AI_Output(Mod_7105_ASS_Aabid_NW, NULL, "Info_Mod_Smalltalk_Assassine1_09_03"); //Denkst du. Bist du mal einem Warg begegnet?

		Mod_Smalltalk_Assassine1 = 4;
	}
	else if (Mod_Smalltalk_Assassine1 == 4)
	{
		AI_Output(Mod_7106_ASS_Ramsi_NW, NULL, "Info_Mod_Smalltalk_Assassine1_08_04"); //Nein. Aber ich hörte, es ist auch 'ne Wolfsrasse.

		Mod_Smalltalk_Assassine1 = 5;
	}
	else if (Mod_Smalltalk_Assassine1 == 5)
	{
		AI_Output(Mod_7105_ASS_Aabid_NW, NULL, "Info_Mod_Smalltalk_Assassine1_09_05"); //Stimmt. Aber gefährlicher als normale und schwarze Wölfe zusammen.

		Mod_Smalltalk_Assassine1 = 6;
	}
	else if (Mod_Smalltalk_Assassine1 == 6)
	{
		AI_Output(Mod_7105_ASS_Aabid_NW, NULL, "Info_Mod_Smalltalk_Assassine1_09_06"); //Wenn die mal deine Witterung haben, hilft dir nur ein Baum oder ein Fels, auf den du springen kannst.

		Mod_Smalltalk_Assassine1 = 7;
	}
	else if (Mod_Smalltalk_Assassine1 == 7)
	{
		AI_Output(Mod_7105_ASS_Aabid_NW, NULL, "Info_Mod_Smalltalk_Assassine1_09_07"); //Dabei ist das Fleisch nicht mal essbar. Viel zu zäh.

		Mod_Smalltalk_Assassine1 = 8;
	}
	else if (Mod_Smalltalk_Assassine1 == 8)
	{
		AI_Output(Mod_7105_ASS_Aabid_NW, NULL, "Info_Mod_Smalltalk_Assassine1_09_08"); //Nur das Fell taugt was. Bringt einen guten Preis am Markt.

		Mod_Smalltalk_Assassine1 = 9;
	}
	else if (Mod_Smalltalk_Assassine1 == 9)
	{
		AI_Output(Mod_7106_ASS_Ramsi_NW, NULL, "Info_Mod_Smalltalk_Assassine1_08_09"); //Ich sags ja.

		Mod_Smalltalk_Assassine1 = 0;
	};
};