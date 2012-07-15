var int Mod_FortunoSumpfmensch_Scene_Counter;

FUNC VOID FortunoSumpfmensch_Scene()
{
	if (Mod_FortunoSumpfmensch_Scene_Counter == 1)
	{
		Wld_SendTrigger	("EVT_CAMERA_FORTUNO_SUMPFMENSCH");

		CutsceneAn = TRUE;

		AI_GotoWP	(hero, "PSI_PLACE");

		AI_PlayAni	(hero, "T_STAND_2_SIT");
	};

	if (Mod_FortunoSumpfmensch_Scene_Counter == 3)
	{
		AI_Output(Mod_951_PSINOV_Fortuno_MT, NULL, "Info_Mod_Hero_FortunoSumpfmensch_Scene_13_00"); //Lange bevor die ersten Brüder unserer Gemeinschaft diesen Sumpf betraten das brache und tote Land zu bestellen und sich hier eine neue Heimat zu schaffen, lebte bereits ein Mensch in den verworrenen Tiefen des Morastes.
	};

	if (Mod_FortunoSumpfmensch_Scene_Counter == 9)
	{
		AI_Output(Mod_951_PSINOV_Fortuno_MT, NULL, "Info_Mod_Hero_FortunoSumpfmensch_Scene_13_01"); //Lange bevor die ersten Brüder unserer Gemeinschaft diesen Sumpf betraten das brache und tote Land zu bestellen und sich hier eine neue Heimat zu schaffen, lebte bereits ein Mensch in den verworrenen Tiefen des Morastes.
	};

	if (Mod_FortunoSumpfmensch_Scene_Counter == 15)
	{
		AI_Output(Mod_951_PSINOV_Fortuno_MT, NULL, "Info_Mod_Hero_FortunoSumpfmensch_Scene_13_02"); //Warum er der Welt entsagte weiß niemand. Manche sagen, er sei ein Wechselbalg oder ein Halbblut gewesen.
	};

	if (Mod_FortunoSumpfmensch_Scene_Counter == 21)
	{
		AI_Output(Mod_951_PSINOV_Fortuno_MT, NULL, "Info_Mod_Hero_FortunoSumpfmensch_Scene_13_03"); //Die Mutter ein Mensch und der Vater eine der dunklen Kreaturen, die diese Gegend in früheren Zeiten so zahlreich besiedelten.
	};

	if (Mod_FortunoSumpfmensch_Scene_Counter == 27)
	{
		AI_Output(Mod_951_PSINOV_Fortuno_MT, NULL, "Info_Mod_Hero_FortunoSumpfmensch_Scene_13_04"); //Andere wiederum meinen, er sei einst ein Herrscher gewesen, gerecht und aufrichtig dem Volk und dem Gesetz gegenüber, loyal seinen Freunden und treu seiner Frau.
	};

	if (Mod_FortunoSumpfmensch_Scene_Counter == 33)
	{
		AI_Output(Mod_951_PSINOV_Fortuno_MT, NULL, "Info_Mod_Hero_FortunoSumpfmensch_Scene_13_05"); //Als die verworrenen Wege des Schicksal ihn jedoch dazu zwangen, dem Gesetz folgend seine Geliebte hinzurichten, da sie ihm die Ehe gebrochen hatte, konnte er es nicht mehr ertragen, sein Gesicht gespiegelt zu sehen.
	};

	if (Mod_FortunoSumpfmensch_Scene_Counter == 39)
	{
		AI_Output(Mod_951_PSINOV_Fortuno_MT, NULL, "Info_Mod_Hero_FortunoSumpfmensch_Scene_13_06"); //Er stach sich beide Augen aus und der Wind trieb ihn in die fauligen Tiefen des Sumpfes.
	};

	if (Mod_FortunoSumpfmensch_Scene_Counter == 45)
	{
		AI_Output(Mod_951_PSINOV_Fortuno_MT, NULL, "Info_Mod_Hero_FortunoSumpfmensch_Scene_13_07"); //Wieder andere behaupten, diese Kreatur sei nie ein Mensch gewesen sondern ein Homunculus, ein aus den dunklen Künsten der Alchemie erschaffenes Wesen, welches unsterblich die eigene Existenz nicht ertrug und seinen Schöpfern entfloh.
	};

	if (Mod_FortunoSumpfmensch_Scene_Counter == 51)
	{
		AI_Output(Mod_951_PSINOV_Fortuno_MT, NULL, "Info_Mod_Hero_FortunoSumpfmensch_Scene_13_08"); //Wer oder Was auch immer diese Kreatur ist, im Laufe der Jahrzehnte und Jahrhunderte wurde sie zu einem Teil des Sumpfes, fraß mit den Sumpfhaien und jagte mit den Sumpfratten.
	};

	if (Mod_FortunoSumpfmensch_Scene_Counter == 57)
	{
		AI_Output(Mod_951_PSINOV_Fortuno_MT, NULL, "Info_Mod_Hero_FortunoSumpfmensch_Scene_13_09"); //Wer oder Was auch immer diese Kreatur ist, im Laufe der Jahrzehnte und Jahrhunderte wurde sie zu einem Teil des Sumpfes, fraß mit den Sumpfhaien und jagte mit den Sumpfratten.
	};

	if (Mod_FortunoSumpfmensch_Scene_Counter == 63)
	{
		AI_Output(Mod_951_PSINOV_Fortuno_MT, NULL, "Info_Mod_Hero_FortunoSumpfmensch_Scene_13_10"); //Doch dieser Frieden ist nun vorbei. Nicht nur der Schläfer ist erweckt worden sondern auch dies garstige Wesen, das im Sumpf herumschleicht, lauernd, hassend, mordend, leidend und seinen Schmerz mit dieser Welt teilen will.
	};

	if (Mod_FortunoSumpfmensch_Scene_Counter == 69)
	{
		AI_Output(Mod_951_PSINOV_Fortuno_MT, NULL, "Info_Mod_Hero_FortunoSumpfmensch_Scene_13_11"); //Von weitem ist sein Gewimmer zu hören, und wer es hört, tut gut daran schnell und weit zu laufen, denn diese Laute entstammen dem traurigen Maul des HEULENDEN SUMPFMENSCHEN!!!
	};

	if (Mod_FortunoSumpfmensch_Scene_Counter == 75)
	{
		// ToDo: Chor, der schreit, wie bei Balor
	};

	if (Mod_FortunoSumpfmensch_Scene_Counter == 81)
	{
		Mod_Fortuno_Sumpfmensch_Scene = 2;

		Wld_SendUnTrigger	("EVT_CAMERA_FORTUNO_SUMPFMENSCH");

		CutsceneAn = FALSE;

		AI_PlayAni	(hero, "T_SIT_2_STAND");
	};

	Mod_FortunoSumpfmensch_Scene_Counter += 1;
};