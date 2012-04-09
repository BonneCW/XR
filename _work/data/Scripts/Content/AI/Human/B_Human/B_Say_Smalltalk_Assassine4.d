var int Mod_Smalltalk_Assassine4;

FUNC VOID B_Say_Smalltalk_Assassine4 ()
{
	if (Mod_Smalltalk_Assassine4 == 0)
	{
		AI_Output(Mod_7149_ASS_Mufid_NW, NULL, "Info_Mod_Smalltalk_Assassine4_13_00"); //... müssen wir nur noch sehen, wie wir an den Kelch rankommem, den Na'im hat.

		Mod_Smalltalk_Assassine4 = 1;
	}
	else if (Mod_Smalltalk_Assassine4 == 1)
	{
		AI_Output(Mod_7156_ASS_Mirza_NW, NULL, "Info_Mod_Smalltalk_Assassine4_12_01"); //Und der Andere?

		Mod_Smalltalk_Assassine4 = 2;
	}
	else if (Mod_Smalltalk_Assassine4 == 2)
	{
		AI_Output(Mod_7149_ASS_Mufid_NW, NULL, "Info_Mod_Smalltalk_Assassine4_13_02"); //Den hat Norek schon. Amir hat ihn besorgt.

		Mod_Smalltalk_Assassine4 = 3;
	}
	else if (Mod_Smalltalk_Assassine4 == 3)
	{
		AI_Output(Mod_7156_ASS_Mirza_NW, NULL, "Info_Mod_Smalltalk_Assassine4_12_03"); //Na gut. Na'im hat den Kelch sicher in seiner Truhe.

		Mod_Smalltalk_Assassine4 = 4;
	}
	else if (Mod_Smalltalk_Assassine4 == 4)
	{
		AI_Output(Mod_7149_ASS_Mufid_NW, NULL, "Info_Mod_Smalltalk_Assassine4_13_04"); //Das denke ich auch. Aber wie da drankommen?

		Mod_Smalltalk_Assassine4 = 5;
	}
	else if (Mod_Smalltalk_Assassine4 == 5)
	{
		AI_Output(Mod_7156_ASS_Mirza_NW, NULL, "Info_Mod_Smalltalk_Assassine4_12_05"); //Man müsste ihn ablenken. Und Mustafa dazu.

		Mod_Smalltalk_Assassine4 = 6;
	}
	else if (Mod_Smalltalk_Assassine4 == 6)
	{
		AI_Output(Mod_7149_ASS_Mufid_NW, NULL, "Info_Mod_Smalltalk_Assassine4_13_06"); //Das könnte klappen ...

		Mod_Smalltalk_Assassine4 = 7;

		B_StartOtherRoutine	(Mod_7149_ASS_Mufid_NW,	"VERRAT2");
		B_StartOtherRoutine	(Mod_7156_ASS_Mirza_NW,	"VERRAT2");
	};
};