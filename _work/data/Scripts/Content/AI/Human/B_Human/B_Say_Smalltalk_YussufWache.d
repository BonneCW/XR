var int Mod_Smalltalk_YussufWache;

FUNC VOID B_Say_Smalltalk_YussufWache ()
{
	if (Mod_Smalltalk_YussufWache == 0)
	{
		AI_Output(Mod_1181_MIL_Tuerwache_NW, NULL, "Info_Mod_Smalltalk_YussufWache_07_00"); //Nanu, wo ist denn dein Kumpel?

		Mod_Smalltalk_YussufWache = 1;
	}
	else if (Mod_Smalltalk_YussufWache == 1)
	{
		AI_Output(Mod_7113_ASS_Yussuf_NW, NULL, "Info_Mod_Smalltalk_YussufWache_13_01"); //Wir haben einige Beweismittel vergessen. Er holt sie.

		Mod_Smalltalk_YussufWache = 2;
	}
	else if (Mod_Smalltalk_YussufWache == 2)
	{
		AI_Output(Mod_1181_MIL_Tuerwache_NW, NULL, "Info_Mod_Smalltalk_YussufWache_07_02"); //Solange warten wir. Um was geht es eigentlich?

		Mod_Smalltalk_YussufWache = 3;
	}
	else if (Mod_Smalltalk_YussufWache == 3)
	{
		AI_Output(Mod_7113_ASS_Yussuf_NW, NULL, "Info_Mod_Smalltalk_YussufWache_13_03"); //Wir sagten doch: Innere Sicherheit.

		Mod_Smalltalk_YussufWache = 4;
	}
	else if (Mod_Smalltalk_YussufWache == 4)
	{
		AI_Output(Mod_1181_MIL_Tuerwache_NW, NULL, "Info_Mod_Smalltalk_YussufWache_07_04"); //Verstehe ich nicht. Wo innen?

		Mod_Smalltalk_YussufWache = 5;
	}
	else if (Mod_Smalltalk_YussufWache == 5)
	{
		AI_Output(Mod_7113_ASS_Yussuf_NW, NULL, "Info_Mod_Smalltalk_YussufWache_13_05"); //Na, zum Beispiel hier im Haus.

		Mod_Smalltalk_YussufWache = 6;
	}
	else if (Mod_Smalltalk_YussufWache == 6)
	{
		AI_Output(Mod_1181_MIL_Tuerwache_NW, NULL, "Info_Mod_Smalltalk_YussufWache_07_06"); //Hier ist alles sicher, solange ich hier stehe.

		Mod_Smalltalk_YussufWache = 7;
	}
	else if (Mod_Smalltalk_YussufWache == 7)
	{
		AI_Output(Mod_7113_ASS_Yussuf_NW, NULL, "Info_Mod_Smalltalk_YussufWache_13_07"); //Schon. Aber man kann nie ganz sicher sein bei der inneren Sicherheit.

		Mod_Smalltalk_YussufWache = 8;
	}
	else if (Mod_Smalltalk_YussufWache == 8)
	{
		AI_Output(Mod_1181_MIL_Tuerwache_NW, NULL, "Info_Mod_Smalltalk_YussufWache_07_08"); //Ich bin aber sicher, hier ist alles in Ordnung. Und wo ist denn dein Kumpel?

		Mod_Smalltalk_YussufWache = 9;
	};
};