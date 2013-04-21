var int Mod_Smalltalk_Ramirez;

FUNC VOID B_Say_Smalltalk_Ramirez ()
{
	if (Mod_Smalltalk_Ramirez == 0)
	{
		AI_Output(Mod_7708_OUT_Ramirez_REL, NULL, "Info_Mod_Smalltalk_Ramirez_14_00"); //(tuckenhaft) Oh, sieh sich einer diese schönen Kleider an. Wirklich bezaubernd.

		Mod_Smalltalk_Ramirez = 1;
	}
	else if (Mod_Smalltalk_Ramirez == 1)
	{
		AI_Output(Mod_7708_OUT_Ramirez_REL, NULL, "Info_Mod_Smalltalk_Ramirez_14_01"); //Haben etwa Eure Hände alle diese schönen Kreationen hervorgebracht?

		Mod_Smalltalk_Ramirez = 2;
	}
	else if (Mod_Smalltalk_Ramirez == 2)
	{
		AI_Output(Mod_7535_OUT_Schneider_REL, NULL, "Info_Mod_Smalltalk_Ramirez_31_02"); //In der Tat. Ihr habt also Gefallen daran gefunden? Ihr müsst ein Mann von Welt sein ...

		Mod_Smalltalk_Ramirez = 3;
	}
	else if (Mod_Smalltalk_Ramirez == 3)
	{
		AI_Output(Mod_7708_OUT_Ramirez_REL, NULL, "Info_Mod_Smalltalk_Ramirez_14_03"); //Das Kompliment gebe ich gerne an euch zurück.

		Mod_Smalltalk_Ramirez = 4;
	}
	else if (Mod_Smalltalk_Ramirez == 4)
	{
		AI_Output(Mod_7708_OUT_Ramirez_REL, NULL, "Info_Mod_Smalltalk_Ramirez_14_04"); //Wirklich herzallerliebst, was meine Augen hier alles erblicken.

		Mod_Smalltalk_Ramirez = 5;
	}
	else if (Mod_Smalltalk_Ramirez == 5)
	{
		AI_Output(Mod_7535_OUT_Schneider_REL, NULL, "Info_Mod_Smalltalk_Ramirez_31_05"); //Ja, auch meine Augen vermag so mancher Anblick zu entzücken.

		Mod_Smalltalk_Ramirez = 6;
	}
	else if (Mod_Smalltalk_Ramirez == 6)
	{
		AI_Output(Mod_7708_OUT_Ramirez_REL, NULL, "Info_Mod_Smalltalk_Ramirez_14_06"); //Ihr scheint die wahren Tugenden eines Künstlers zu pflegen.

		Mod_Smalltalk_Ramirez = 7;
	}
	else if (Mod_Smalltalk_Ramirez == 7)
	{
		AI_Output(Mod_7535_OUT_Schneider_REL, NULL, "Info_Mod_Smalltalk_Ramirez_31_07"); //Ja, gewiss. In vielerlei Hinsicht.

		Mod_Smalltalk_Ramirez = 8;
	}
	else if (Mod_Smalltalk_Ramirez == 8)
	{
		AI_Output(Mod_7535_OUT_Schneider_REL, NULL, "Info_Mod_Smalltalk_Ramirez_31_08"); //Ich meine jedoch zu erkennen, dass ihr mir da in nichts nachsteht ... ich täusche mich doch nicht?

		Mod_Smalltalk_Ramirez = 9;
	}
	else if (Mod_Smalltalk_Ramirez == 9)
	{
		AI_Output(Mod_7708_OUT_Ramirez_REL, NULL, "Info_Mod_Smalltalk_Ramirez_14_09"); //Nun, vielleicht kann sich mancher Schleier in einem weiterführenden Tête-à-tête lüften ...

		Mod_Smalltalk_Ramirez = 10;
	}
	else if (Mod_Smalltalk_Ramirez == 10)
	{
		AI_Output(Mod_7535_OUT_Schneider_REL, NULL, "Info_Mod_Smalltalk_Ramirez_31_10"); //Gewiss ...

		Mod_Smalltalk_Ramirez = 11;
	}
	else if (Mod_Smalltalk_Ramirez == 11)
	{
		AI_Output(Mod_7708_OUT_Ramirez_REL, NULL, "Info_Mod_Smalltalk_Ramirez_14_11"); //Oh, ganz wie ihr meint ...

		Mod_Smalltalk_Ramirez = 12;
	}
	else if (Mod_Smalltalk_Ramirez == 12)
	{
		AI_Output(Mod_7535_OUT_Schneider_REL, NULL, "Info_Mod_Smalltalk_Ramirez_31_12"); //Ihr lasst mich erröten ...

		Mod_Smalltalk_Ramirez = 13;
	}
	else if (Mod_Smalltalk_Ramirez == 13)
	{
		AI_Output(Mod_7708_OUT_Ramirez_REL, NULL, "Info_Mod_Smalltalk_Ramirez_14_13"); //Ihr scheint ja ein echter Schlingel zu sein ...

		Mod_Smalltalk_Ramirez = 14;
	}
	else if (Mod_Smalltalk_Ramirez == 14)
	{
		AI_Output(Mod_7535_OUT_Schneider_REL, NULL, "Info_Mod_Smalltalk_Ramirez_31_14"); //Ach, wie köstlich.

		Mod_Smalltalk_Ramirez = 15;
	}
	else if (Mod_Smalltalk_Ramirez == 15)
	{
		AI_Output(Mod_7708_OUT_Ramirez_REL, NULL, "Info_Mod_Smalltalk_Ramirez_14_15"); //Ihr seid wirklich süß ...

		Mod_Smalltalk_Ramirez = 10;
	};
};