var int Mod_Smalltalk_Assassine2;

FUNC VOID B_Say_Smalltalk_Assassine2 ()
{
	if (Mod_Smalltalk_Assassine2 == 0)
	{
		AI_Output(Mod_7102_ASS_Zeki_NW, NULL, "Info_Mod_Smalltalk_Assassine2_05_00"); //Ich könnte dir mal was vorspielen.

		Mod_Smalltalk_Assassine2 = 1;
	}
	else if (Mod_Smalltalk_Assassine2 == 1)
	{
		AI_Output(Mod_7103_ASS_Gauner_NW, NULL, "Info_Mod_Smalltalk_Assassine2_03_01"); //Lass man gut sein. Hab nichts übrig für solche Musik. Höre lieber Posaunen und so.

		Mod_Smalltalk_Assassine2 = 2;
	}
	else if (Mod_Smalltalk_Assassine2 == 2)
	{
		AI_Output(Mod_7102_ASS_Zeki_NW, NULL, "Info_Mod_Smalltalk_Assassine2_05_02"); //Schade. Habe gerade 'ne neue Komposition. Wirklich nicht?

		Mod_Smalltalk_Assassine2 = 3;
	}
	else if (Mod_Smalltalk_Assassine2 == 3)
	{
		AI_Output(Mod_7103_ASS_Gauner_NW, NULL, "Info_Mod_Smalltalk_Assassine2_03_03"); //Erzähl mir lieber, was es draußen Neues gibt.

		Mod_Smalltalk_Assassine2 = 4;
	}
	else if (Mod_Smalltalk_Assassine2 == 4)
	{
		AI_Output(Mod_7102_ASS_Zeki_NW, NULL, "Info_Mod_Smalltalk_Assassine2_05_04"); //Ich hab gehört, dass sich da allerlei Unheil abspielt.

		Mod_Smalltalk_Assassine2 = 5;
	}
	else if (Mod_Smalltalk_Assassine2 == 5)
	{
		AI_Output(Mod_7102_ASS_Zeki_NW, NULL, "Info_Mod_Smalltalk_Assassine2_05_05"); //Bin ganz froh, dass wir uns erst mal hier verschanzt haben.

		Mod_Smalltalk_Assassine2 = 6;
	}
	else if (Mod_Smalltalk_Assassine2 == 6)
	{
		AI_Output(Mod_7103_ASS_Gauner_NW, NULL, "Info_Mod_Smalltalk_Assassine2_03_06"); //Schon. Aber hier tut sich doch nichts. Keine Aufträge, keine Möglichkeit, vorwärts zu kommen.

		Mod_Smalltalk_Assassine2 = 7;
	}
	else if (Mod_Smalltalk_Assassine2 == 7)
	{
		AI_Output(Mod_7103_ASS_Gauner_NW, NULL, "Info_Mod_Smalltalk_Assassine2_03_07"); //Ich wäre so gern hinten bei den Kriegern.

		Mod_Smalltalk_Assassine2 = 8;
	}
	else if (Mod_Smalltalk_Assassine2 == 8)
	{
		AI_Output(Mod_7102_ASS_Zeki_NW, NULL, "Info_Mod_Smalltalk_Assassine2_05_08"); //Sprich mit Shakir. Vielleicht hat er was für dich.

		Mod_Smalltalk_Assassine2 = 9;
	}
	else if (Mod_Smalltalk_Assassine2 == 9)
	{
		AI_Output(Mod_7103_ASS_Gauner_NW, NULL, "Info_Mod_Smalltalk_Assassine2_03_09"); //Meinst du?

		Mod_Smalltalk_Assassine2 = 10;
	}
	else if (Mod_Smalltalk_Assassine2 == 10)
	{
		AI_Output(Mod_7102_ASS_Zeki_NW, NULL, "Info_Mod_Smalltalk_Assassine2_05_10"); //Klar doch. Schau den Neuen an. Der wird nicht lange bei uns hier vorn bleiben.

		Mod_Smalltalk_Assassine2 = 11;
	}
	else if (Mod_Smalltalk_Assassine2 == 11)
	{
		AI_Output(Mod_7103_ASS_Gauner_NW, NULL, "Info_Mod_Smalltalk_Assassine2_03_11"); //Der hat auch den Vorteil, dass er sich auf der Insel frei bewegen kann.

		Mod_Smalltalk_Assassine2 = 12;
	}
	else if (Mod_Smalltalk_Assassine2 == 12)
	{
		AI_Output(Mod_7102_ASS_Zeki_NW, NULL, "Info_Mod_Smalltalk_Assassine2_05_12"); //Dann beschaff dir doch andere Kleidung. Ne Bauernkluft sollte schon reichen.

		Mod_Smalltalk_Assassine2 = 13;
	}
	else if (Mod_Smalltalk_Assassine2 == 13)
	{
		AI_Output(Mod_7103_ASS_Gauner_NW, NULL, "Info_Mod_Smalltalk_Assassine2_03_13"); //Ich weiß nicht. Ist alles so deprimierend.

		Mod_Smalltalk_Assassine2 = 0;
	};
};