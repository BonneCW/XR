var int Mod_Smalltalk_Assassine3;

FUNC VOID B_Say_Smalltalk_Assassine3 ()
{
	if (Mod_Smalltalk_Assassine3 == 0)
	{
		AI_Output(Mod_7111_ASS_Yasin_NW, NULL, "Info_Mod_Smalltalk_Assassine3_13_00"); //Wie weit bist du eigentlich mit deinen Prüfungen?

		Mod_Smalltalk_Assassine3 = 1;
	}
	else if (Mod_Smalltalk_Assassine3 == 1)
	{
		AI_Output(Mod_7113_ASS_Yussuf_NW, NULL, "Info_Mod_Smalltalk_Assassine3_13_01"); //Hab noch eine Aufgabe von Karim.

		Mod_Smalltalk_Assassine3 = 2;
	}
	else if (Mod_Smalltalk_Assassine3 == 2)
	{
		AI_Output(Mod_7111_ASS_Yasin_NW, NULL, "Info_Mod_Smalltalk_Assassine3_13_02"); //Und was hast du zu tun?

		Mod_Smalltalk_Assassine3 = 3;
	}
	else if (Mod_Smalltalk_Assassine3 == 3)
	{
		AI_Output(Mod_7113_ASS_Yussuf_NW, NULL, "Info_Mod_Smalltalk_Assassine3_13_03"); //Du weißt doch, dass ich das nicht sagen darf.

		Mod_Smalltalk_Assassine3 = 4;
	}
	else if (Mod_Smalltalk_Assassine3 == 4)
	{
		AI_Output(Mod_7111_ASS_Yasin_NW, NULL, "Info_Mod_Smalltalk_Assassine3_13_04"); //Ach komm. Ein kleiner Tip für einen guten Freund.

		Mod_Smalltalk_Assassine3 = 5;
	}
	else if (Mod_Smalltalk_Assassine3 == 5)
	{
		AI_Output(Mod_7111_ASS_Yasin_NW, NULL, "Info_Mod_Smalltalk_Assassine3_13_05"); //Ich will ja auch irgendwann diese Gaunerkutte loswerden.

		Mod_Smalltalk_Assassine3 = 6;
	}
	else if (Mod_Smalltalk_Assassine3 == 6)
	{
		AI_Output(Mod_7113_ASS_Yussuf_NW, NULL, "Info_Mod_Smalltalk_Assassine3_13_06"); //Warte, bis du soweit bist. Vielleicht kann ich dir dann helfen.

		Mod_Smalltalk_Assassine3 = 0;
	};
};