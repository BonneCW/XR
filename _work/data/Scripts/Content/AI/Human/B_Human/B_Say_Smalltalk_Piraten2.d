var int Mod_Smalltalk_Piraten2;
var int Mod_Smalltalk_Piraten2_Randi;

FUNC VOID B_Say_Smalltalk_Piraten2 ()
{
	if (Mod_Smalltalk_Piraten2 == 0)
	{
		Mod_Smalltalk_Piraten2_Randi = Hlp_Random(2);
	};

	if (Mod_Smalltalk_Piraten2_Randi == 0)
	{
		if (Mod_Smalltalk_Piraten2 == 0)
		{
			AI_Output(Mod_941_PIR_Angus_AW, NULL, "Info_Mod_Smalltalk_Piraten2_01_06_00"); //Sag mal, wer ist denn heute mit Drehen dran?

			Mod_Smalltalk_Piraten2 = 1;
		}
		else if (Mod_Smalltalk_Piraten2 == 1)
		{
			AI_Output(Mod_942_PIR_Hank_AW, NULL, "Info_Mod_Smalltalk_Piraten2_01_06_01"); //Der Dicke.

			Mod_Smalltalk_Piraten2 = 2;
		}
		else if (Mod_Smalltalk_Piraten2 == 2)
		{
			AI_Output(Mod_941_PIR_Angus_AW, NULL, "Info_Mod_Smalltalk_Piraten2_01_06_02"); //Und wo ist der? Das Vieh verkohlt ja.

			Mod_Smalltalk_Piraten2 = 3;
		}
		else if (Mod_Smalltalk_Piraten2 == 3)
		{
			AI_Output(Mod_942_PIR_Hank_AW, NULL, "Info_Mod_Smalltalk_Piraten2_01_06_03"); //Hat gesagt, er muss mal. Ist aber schon länger her.

			Mod_Smalltalk_Piraten2 = 4;
		}
		else if (Mod_Smalltalk_Piraten2 == 4)
		{
			AI_Output(Mod_941_PIR_Angus_AW, NULL, "Info_Mod_Smalltalk_Piraten2_01_06_04"); //Wahrscheinlich kommt's dann eher dünn. Kein Wunder bei der Verpflegung hier.

			Mod_Smalltalk_Piraten2 = 5;
		}
		else if (Mod_Smalltalk_Piraten2 == 5)
		{
			AI_Output(Mod_942_PIR_Hank_AW, NULL, "Info_Mod_Smalltalk_Piraten2_01_06_05"); //Wohl war. Ziemlich einseitig, unser Essen, seit Skip keinen Nachschub mehr besorgt.

			Mod_Smalltalk_Piraten2 = 6;
		}
		else if (Mod_Smalltalk_Piraten2 == 6)
		{
			AI_Output(Mod_941_PIR_Angus_AW, NULL, "Info_Mod_Smalltalk_Piraten2_01_06_06"); //Aber man könnte vielleicht wieder mal Fleischwanzen ...

			Mod_Smalltalk_Piraten2 = 7;
		}
		else if (Mod_Smalltalk_Piraten2 == 7)
		{
			AI_Output(Mod_942_PIR_Hank_AW, NULL, "Info_Mod_Smalltalk_Piraten2_01_06_07"); //Puh! Hör auf. Die muss man erst 'nen halben Tag kochen, bis der Gestank draußen ist.

			Mod_Smalltalk_Piraten2 = 8;
		}
		else if (Mod_Smalltalk_Piraten2 == 8)
		{
			AI_Output(Mod_942_PIR_Hank_AW, NULL, "Info_Mod_Smalltalk_Piraten2_01_06_08"); //Und dann sind das Aasfresser.

			Mod_Smalltalk_Piraten2 = 9;
		}
		else if (Mod_Smalltalk_Piraten2 == 9)
		{
			AI_Output(Mod_941_PIR_Angus_AW, NULL, "Info_Mod_Smalltalk_Piraten2_01_06_09"); //Gut zubereitet sind die gar nicht schlecht. Vor allem als Ragout ...

			Mod_Smalltalk_Piraten2 = 10;
		}
		else if (Mod_Smalltalk_Piraten2 == 10)
		{
			AI_Output(Mod_941_PIR_Angus_AW, NULL, "Info_Mod_Smalltalk_Piraten2_01_06_10"); //Außerdem braucht man die nicht ständig zu drehen.

			Mod_Smalltalk_Piraten2 = 11;
		}
		else if (Mod_Smalltalk_Piraten2 == 11)
		{
			AI_Output(Mod_942_PIR_Hank_AW, NULL, "Info_Mod_Smalltalk_Piraten2_01_06_11"); //Das hat was.

			Mod_Smalltalk_Piraten2 = 0;
		};
	}
	else if (Mod_Smalltalk_Piraten2_Randi == 1)
	{
		if (Mod_Smalltalk_Piraten2 == 0)
		{
			AI_Output(Mod_941_PIR_Angus_AW, NULL, "Info_Mod_Smalltalk_Piraten2_02_06_00"); //Was ist bloß los mit dem Koch? Der rennt doch laufend aufs Klo.

			Mod_Smalltalk_Piraten2 = 1;
		}
		else if (Mod_Smalltalk_Piraten2 == 1)
		{
			AI_Output(Mod_942_PIR_Hank_AW, NULL, "Info_Mod_Smalltalk_Piraten2_02_06_01"); //Na ja. Sitzend kann er das nicht machen.

			Mod_Smalltalk_Piraten2 = 2;
		}
		else if (Mod_Smalltalk_Piraten2 == 2)
		{
			AI_Output(Mod_941_PIR_Angus_AW, NULL, "Info_Mod_Smalltalk_Piraten2_02_06_02"); //Spaßvogel! Nein wirklich ...

			Mod_Smalltalk_Piraten2 = 3;
		}
		else if (Mod_Smalltalk_Piraten2 == 3)
		{
			AI_Output(Mod_942_PIR_Hank_AW, NULL, "Info_Mod_Smalltalk_Piraten2_02_06_03"); //Wahrscheinlich hat er selbst von seiner Suppe gegessen.

			Mod_Smalltalk_Piraten2 = 4;
		}
		else if (Mod_Smalltalk_Piraten2 == 4)
		{
			AI_Output(Mod_941_PIR_Angus_AW, NULL, "Info_Mod_Smalltalk_Piraten2_02_06_04"); //So dumm kann er nicht sein. Der kocht  für sich selbst doch nur das Beste.

			Mod_Smalltalk_Piraten2 = 5;
		}
		else if (Mod_Smalltalk_Piraten2 == 5)
		{
			AI_Output(Mod_942_PIR_Hank_AW, NULL, "Info_Mod_Smalltalk_Piraten2_02_06_05"); //Meinst du?

			Mod_Smalltalk_Piraten2 = 6;
		}
		else if (Mod_Smalltalk_Piraten2 == 6)
		{
			AI_Output(Mod_941_PIR_Angus_AW, NULL, "Info_Mod_Smalltalk_Piraten2_02_06_06"); //Gewiss. Oder hat er uns schon mal von der Wildschweinlende vorgesetzt, die Skip manchmal aus der Stadt mitbringt?

			Mod_Smalltalk_Piraten2 = 7;
		}
		else if (Mod_Smalltalk_Piraten2 == 7)
		{
			AI_Output(Mod_942_PIR_Hank_AW, NULL, "Info_Mod_Smalltalk_Piraten2_02_06_07"); //Hm. Wildschweinlende. Hört sich gut an.

			Mod_Smalltalk_Piraten2 = 8;
		}
		else if (Mod_Smalltalk_Piraten2 == 8)
		{
			AI_Output(Mod_941_PIR_Angus_AW, NULL, "Info_Mod_Smalltalk_Piraten2_02_06_08"); //Es ist das Beste, was es auf der Insel gibt. Es sei denn, man mag gebratene Minecrawler-Eier. Skip hat das gesagt.

			Mod_Smalltalk_Piraten2 = 9;
		}
		else if (Mod_Smalltalk_Piraten2 == 9)
		{
			AI_Output(Mod_942_PIR_Hank_AW, NULL, "Info_Mod_Smalltalk_Piraten2_02_06_09"); //Dem kann man auch nicht alles glauben.

			Mod_Smalltalk_Piraten2 = 0;
		};
	};
};