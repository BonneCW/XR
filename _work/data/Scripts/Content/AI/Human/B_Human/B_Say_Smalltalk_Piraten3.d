var int Mod_Smalltalk_Piraten3;
var int Mod_Smalltalk_Piraten3_Randi;

FUNC VOID B_Say_Smalltalk_Piraten3 ()
{
	if (Mod_Smalltalk_Piraten3 == 0)
	{
		Mod_Smalltalk_Piraten3_Randi = Hlp_Random(2);
	};

	if (Mod_Smalltalk_Piraten3_Randi == 0)
	{
		if (Mod_Smalltalk_Piraten3 == 0)
		{
			AI_Output(Mod_929_PIR_Bill_AW, NULL, "Info_Mod_Smalltalk_Piraten3_01_03_00"); //Langsam krieg ich hier den Lagerkoller. Wie lang sind wir eigentlich schon hier?

			Mod_Smalltalk_Piraten3 = 1;
		}
		else if (Mod_Smalltalk_Piraten3 == 1)
		{
			AI_Output(Mod_939_PIR_Owen_AW, NULL, "Info_Mod_Smalltalk_Piraten3_01_13_01"); //Paar Wochen, würd ich sagen.

			Mod_Smalltalk_Piraten3 = 2;
		}
		else if (Mod_Smalltalk_Piraten3 == 2)
		{
			AI_Output(Mod_929_PIR_Bill_AW, NULL, "Info_Mod_Smalltalk_Piraten3_01_03_02"); //Nicht länger? Mir kommts wie Monate vor. Diese Langeweile ...

			Mod_Smalltalk_Piraten3 = 3;
		}
		else if (Mod_Smalltalk_Piraten3 == 3)
		{
			AI_Output(Mod_939_PIR_Owen_AW, NULL, "Info_Mod_Smalltalk_Piraten3_01_13_03"); //Du hast recht. Mir hängt's auch langsam zum Hals raus. Schließlich sind wir Seefahrer und keine Landratten.

			Mod_Smalltalk_Piraten3 = 4;
		}
		else if (Mod_Smalltalk_Piraten3 == 4)
		{
			AI_Output(Mod_929_PIR_Bill_AW, NULL, "Info_Mod_Smalltalk_Piraten3_01_03_04"); //Wem sagst du das! Jetzt ein dickes Handelsschiff kapern. Das wär's doch.

			Mod_Smalltalk_Piraten3 = 5;
		}
		else if (Mod_Smalltalk_Piraten3 == 5)
		{
			AI_Output(Mod_939_PIR_Owen_AW, NULL, "Info_Mod_Smalltalk_Piraten3_01_13_05"); //Oder gar 'ne königliche Fregatte.

			Mod_Smalltalk_Piraten3 = 6;
		}
		else if (Mod_Smalltalk_Piraten3 == 6)
		{
			AI_Output(Mod_929_PIR_Bill_AW, NULL, "Info_Mod_Smalltalk_Piraten3_01_03_06"); //Beim Klabautermann! Aber seit auf dem Festland Krieg ist, kreuzt hier keine Nußschale mehr auf.

			Mod_Smalltalk_Piraten3 = 7;
		}
		else if (Mod_Smalltalk_Piraten3 == 7)
		{
			AI_Output(Mod_939_PIR_Owen_AW, NULL, "Info_Mod_Smalltalk_Piraten3_01_13_07"); //Jo, leider. Ist schade, nachdem wir letztes Mal so ein schönes Schiff erbeutet haben.

			Mod_Smalltalk_Piraten3 = 8;
		}
		else if (Mod_Smalltalk_Piraten3 == 8)
		{
			AI_Output(Mod_929_PIR_Bill_AW, NULL, "Info_Mod_Smalltalk_Piraten3_01_03_08"); //Genau. Und wie diese Feiglinge haufenweise über Bord gesprungen sind.

			Mod_Smalltalk_Piraten3 = 9;
		}
		else if (Mod_Smalltalk_Piraten3 == 9)
		{
			AI_Output(Mod_939_PIR_Owen_AW, NULL, "Info_Mod_Smalltalk_Piraten3_01_13_09"); //Und wie der Kapitän gejammert hat beim Kielholen. Das waren noch Zeiten. Aber jetzt?

			Mod_Smalltalk_Piraten3 = 0;
		};
	}
	else if (Mod_Smalltalk_Piraten3_Randi == 1)
	{
		if (Mod_Smalltalk_Piraten3 == 0)
		{
			AI_Output(Mod_929_PIR_Bill_AW, NULL, "Info_Mod_Smalltalk_Piraten3_02_03_00"); //Nu' guck dir nur den Bones an. Der schwingt doch den ganzen Tag lang seine Axt.

			Mod_Smalltalk_Piraten3 = 1;
		}
		else if (Mod_Smalltalk_Piraten3 == 1)
		{
			AI_Output(Mod_939_PIR_Owen_AW, NULL, "Info_Mod_Smalltalk_Piraten3_02_13_01"); //Wundert mich auch. Der hat doch den Bogen raus, find ich.

			Mod_Smalltalk_Piraten3 = 2;
		}
		else if (Mod_Smalltalk_Piraten3 == 2)
		{
			AI_Output(Mod_929_PIR_Bill_AW, NULL, "Info_Mod_Smalltalk_Piraten3_02_03_02"); //Eben. Vielleicht steckt was anderes dahinter.

			Mod_Smalltalk_Piraten3 = 3;
		}
		else if (Mod_Smalltalk_Piraten3 == 3)
		{
			AI_Output(Mod_939_PIR_Owen_AW, NULL, "Info_Mod_Smalltalk_Piraten3_02_13_03"); //Was denkst du?

			Mod_Smalltalk_Piraten3 = 4;
		}
		else if (Mod_Smalltalk_Piraten3 == 4)
		{
			AI_Output(Mod_929_PIR_Bill_AW, NULL, "Info_Mod_Smalltalk_Piraten3_02_03_04"); //Der Bones war doch verheiratet und irgendwann ist ihm die Frau davongelaufen.

			Mod_Smalltalk_Piraten3 = 5;
		}
		else if (Mod_Smalltalk_Piraten3 == 5)
		{
			AI_Output(Mod_929_PIR_Bill_AW, NULL, "Info_Mod_Smalltalk_Piraten3_02_03_05"); //Hatte die Nase voll, dass ihr Alter immer unterwegs war, sagt man.

			Mod_Smalltalk_Piraten3 = 6;
		}
		else if (Mod_Smalltalk_Piraten3 == 6)
		{
			AI_Output(Mod_929_PIR_Bill_AW, NULL, "Info_Mod_Smalltalk_Piraten3_02_03_06"); //Nu denk ich, der hat ihr Bild vor Augen, wenn er so draufhaut.

			Mod_Smalltalk_Piraten3 = 7;
		}
		else if (Mod_Smalltalk_Piraten3 == 7)
		{
			AI_Output(Mod_939_PIR_Owen_AW, NULL, "Info_Mod_Smalltalk_Piraten3_02_13_07"); //(lacht laut) Da könnte was dran sein bei der schlechten Laune, die der immer draufhat.

			Mod_Smalltalk_Piraten3 = 0;
		};
	};
};