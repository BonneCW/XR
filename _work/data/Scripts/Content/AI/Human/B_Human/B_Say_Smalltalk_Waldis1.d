var int Mod_Smalltalk_Waldis1;

FUNC VOID B_Say_Smalltalk_Waldis1 ()
{
	if (Mod_Smalltalk_Waldis1 == 0)
	{
		AI_Output(Mod_7433_JG_Zelar_MT, NULL, "Info_Mod_Smalltalk_Waldis1_03_00"); //... und außerdem finde ich, dass in letzter Zeit viel weniger Wild zu finden ist.

		Mod_Smalltalk_Waldis1 = 1;
	}
	else if (Mod_Smalltalk_Waldis1 == 1)
	{
		AI_Output(Mod_7431_JG_Baldur_MT, NULL, "Info_Mod_Smalltalk_Waldis1_08_01"); //Wohl war. Hier in unserer Gegend gibt's kaum noch Wölfe. Paar Wargen weiter unten.

		Mod_Smalltalk_Waldis1 = 2;
	}
	else if (Mod_Smalltalk_Waldis1 == 2)
	{
		AI_Output(Mod_7431_JG_Baldur_MT, NULL, "Info_Mod_Smalltalk_Waldis1_08_02"); //Und die Savenger höre ich auch nicht mehr kreischen. Hm ...

		Mod_Smalltalk_Waldis1 = 3;
	}
	else if (Mod_Smalltalk_Waldis1 == 3)
	{
		AI_Output(Mod_7433_JG_Zelar_MT, NULL, "Info_Mod_Smalltalk_Waldis1_03_03"); //Ich denke da an einen Wilddieb.

		Mod_Smalltalk_Waldis1 = 4;
	}
	else if (Mod_Smalltalk_Waldis1 == 4)
	{
		AI_Output(Mod_7431_JG_Baldur_MT, NULL, "Info_Mod_Smalltalk_Waldis1_08_04"); //Meinst du? Einer, der uns die leichte Beute wegjagt. Könnte sein.

		Mod_Smalltalk_Waldis1 = 5;
	}
	else if (Mod_Smalltalk_Waldis1 == 5)
	{
		AI_Output(Mod_7431_JG_Baldur_MT, NULL, "Info_Mod_Smalltalk_Waldis1_08_05"); //Hab aber noch niemanden in der Gegend gesehen. Wenn ich den erwische.

		Mod_Smalltalk_Waldis1 = 6;
	}
	else if (Mod_Smalltalk_Waldis1 == 6)
	{
		AI_Output(Mod_7433_JG_Zelar_MT, NULL, "Info_Mod_Smalltalk_Waldis1_03_06"); //Muss ja nicht sein.

		Mod_Smalltalk_Waldis1 = 7;
	}
	else if (Mod_Smalltalk_Waldis1 == 7)
	{
		AI_Output(Mod_7431_JG_Baldur_MT, NULL, "Info_Mod_Smalltalk_Waldis1_08_07"); //Könnte aber. Man sollte mal mit Cyrco reden.

		Mod_Smalltalk_Waldis1 = 8;
	}
	else if (Mod_Smalltalk_Waldis1 == 8)
	{
		AI_Output(Mod_7433_JG_Zelar_MT, NULL, "Info_Mod_Smalltalk_Waldis1_03_08"); //Wenn du meinst. Übrigens, das Wetter wird umschlagen.

		Mod_Smalltalk_Waldis1 = 9;
	}
	else if (Mod_Smalltalk_Waldis1 == 9)
	{
		AI_Output(Mod_7431_JG_Baldur_MT, NULL, "Info_Mod_Smalltalk_Waldis1_08_09"); //Eh? Woher weißt du das.

		Mod_Smalltalk_Waldis1 = 10;
	}
	else if (Mod_Smalltalk_Waldis1 == 10)
	{
		AI_Output(Mod_7433_JG_Zelar_MT, NULL, "Info_Mod_Smalltalk_Waldis1_03_10"); //Ich spüre es in den Knochen. So ein Ziehen im Kreuz.

		Mod_Smalltalk_Waldis1 = 11;
	}
	else if (Mod_Smalltalk_Waldis1 == 11)
	{
		AI_Output(Mod_7433_JG_Zelar_MT, NULL, "Info_Mod_Smalltalk_Waldis1_03_11"); //Was macht eigentlich deine Verwundung?

		Mod_Smalltalk_Waldis1 = 12;
	}
	else if (Mod_Smalltalk_Waldis1 == 12)
	{
		AI_Output(Mod_7431_JG_Baldur_MT, NULL, "Info_Mod_Smalltalk_Waldis1_08_12"); //Wird ganz gut, denke ich. Kann bald wieder auf die Jagd.

		Mod_Smalltalk_Waldis1 = 13;
	}
	else if (Mod_Smalltalk_Waldis1 == 13)
	{
		AI_Output(Mod_7433_JG_Zelar_MT, NULL, "Info_Mod_Smalltalk_Waldis1_03_13"); //Mach langsam, wir haben genug Vorräte ...

		Mod_Smalltalk_Waldis1 = 0;
	};
};