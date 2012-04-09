FUNC VOID B_Say_Smalltalk_KM ()
{
	if (Mod_NL_Teutonica_Smalltalk == 0)
	{
		AI_Output(Mod_595_MIL_Mario_NW, NULL, "Info_Mod_Mario_Kardif_Teutonica_07_00"); //Hey, hast du gehört ... die Sache mit der Teutonica.

		Mod_NL_Teutonica_Smalltalk = 1;
	}
	else if (Mod_NL_Teutonica_Smalltalk == 1)
	{
		AI_Output(Mod_590_NONE_Kardif_NW, NULL, "Info_Mod_Mario_Kardif_Teutonica_14_01"); //Stimmt, die soll ja vor einigen Monaten vor Khorinis gesunken sein.

		Mod_NL_Teutonica_Smalltalk = 2;
	}
	else if (Mod_NL_Teutonica_Smalltalk == 2)
	{
		AI_Output(Mod_595_MIL_Mario_NW, NULL, "Info_Mod_Mario_Kardif_Teutonica_07_02"); //Ja, und dann soll ein riesiges Seeungeheuer die ganze Mannschaft gefressen haben ... bis auf einen Matrosen.

		Mod_NL_Teutonica_Smalltalk = 3;
	}
	else if (Mod_NL_Teutonica_Smalltalk == 3)
	{
		AI_Output(Mod_590_NONE_Kardif_NW, NULL, "Info_Mod_Mario_Kardif_Teutonica_14_03"); //Jojo, und der soll es dann gerade so bis an den Strand geschafft haben.

		Mod_NL_Teutonica_Smalltalk = 4;
	}
	else if (Mod_NL_Teutonica_Smalltalk == 4)
	{
		AI_Output(Mod_595_MIL_Mario_NW, NULL, "Info_Mod_Mario_Kardif_Teutonica_07_04"); //Gerettet, denkste. Der Strand voll von Feuerwaranen, in der nächsten Höhle Untote und zu allem Überfluss noch Piraten.

		Mod_NL_Teutonica_Smalltalk = 5;
	}
	else if (Mod_NL_Teutonica_Smalltalk == 5)
	{
		AI_Output(Mod_595_MIL_Mario_NW, NULL, "Info_Mod_Mario_Kardif_Teutonica_07_05"); //Er ist dann durch die Gegend geirrt, hat Ruinen einer alten Kultur gefunden und soll sogar Echsen gesehen haben, die auf zwei Beinen liefen.

		Mod_NL_Teutonica_Smalltalk = 6;
	}
	else if (Mod_NL_Teutonica_Smalltalk == 6)
	{
		AI_Output(Mod_595_MIL_Mario_NW, NULL, "Info_Mod_Mario_Kardif_Teutonica_07_06"); //Und nach vielen Wochen schaffte er es dann über die Berge ...

		Mod_NL_Teutonica_Smalltalk = 7;
	}
	else if (Mod_NL_Teutonica_Smalltalk == 7)
	{
		AI_Output(Mod_590_NONE_Kardif_NW, NULL, "Info_Mod_Mario_Kardif_Teutonica_14_07"); //Ach, weißt du, ich glaub aber das ist großes Seemannsgarn.

		Mod_NL_Teutonica_Smalltalk = 8;
	}
	else if (Mod_NL_Teutonica_Smalltalk == 8)
	{
		AI_Output(Mod_590_NONE_Kardif_NW, NULL, "Info_Mod_Mario_Kardif_Teutonica_14_08"); //Kam ja halbtot hier an, hat bestimmt viel zusammenphantasiert ... und seit dem hat er ja auch den Verstand verloren, ist nach Norden gegangen ...

		Mod_NL_Teutonica_Smalltalk = 9;
	}
	else if (Mod_NL_Teutonica_Smalltalk == 9)
	{
		AI_Output(Mod_590_NONE_Kardif_NW, NULL, "Info_Mod_Mario_Kardif_Teutonica_14_09"); //Was mit der Teutonica, ihrer Mannschaft und den Schätzen passiert ist bleibt wohl auf ewig ein Geheimnis.

		Mod_NL_Teutonica_Smalltalk = 10;
	}
	else if (Mod_NL_Teutonica_Smalltalk == 10)
	{
		Mod_NL_Teutonica_Smalltalk = 11;

		Mod_NL_Teutonica = 1;

		B_StartOtherRoutine	(Mod_590_NONE_Kardif_NW, "START");
		B_StartOtherRoutine	(Mod_595_MIL_Mario_NW, "START");
	};
};