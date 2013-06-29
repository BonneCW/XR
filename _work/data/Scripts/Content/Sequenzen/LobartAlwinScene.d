var int Mod_LobartAlwinScene_Counter;

FUNC VOID LobartAlwinScene()
{
	if (Mod_LobartAlwinScene_Counter == 0)
	{
		AI_TurnToNpc	(Mod_910_BAU_Lobart_NW, Mod_560_NONE_Alwin_NW);
		AI_TurnToNpc	(Mod_597_NONE_Meldor_NW, Mod_560_NONE_Alwin_NW);
		AI_TurnToNpc	(Mod_593_NONE_Lucy_NW, Mod_560_NONE_Alwin_NW);
		AI_TurnToNpc	(Mod_1041_VLK_Buergerin_NW, Mod_560_NONE_Alwin_NW);
		AI_TurnToNpc	(Mod_1039_VLK_Buergerin_NW, Mod_560_NONE_Alwin_NW);

		AI_GotoWP	(hero, "NW_CITY_PATH_HABOUR_07");

		Wld_SendTrigger	("EVT_LOBARTALWIN_SCENE");

		CutsceneAn = TRUE;
	};

	if (Mod_LobartAlwinScene_Counter == 2)
	{
		AI_TurnToNpc	(hero, Mod_910_BAU_Lobart_NW);

		AI_Output(hero, NULL, "Info_Mod_LobartAlwinScene_15_00"); //Was ist hier los?
	};

	if (Mod_LobartAlwinScene_Counter == 7)
	{
		AI_Output(Mod_910_BAU_Lobart_NW, NULL, "Info_Mod_LobartAlwinScene_26_01"); //(entrüstet) Der Kerl hat meine Schafe geschlachtet! Was fällt dem ein?!
	};

	if (Mod_LobartAlwinScene_Counter == 12)
	{
		AI_TurnToNpc	(Mod_597_NONE_Meldor_NW, Mod_910_BAU_Lobart_NW);

		AI_Output(Mod_597_NONE_Meldor_NW, NULL, "Info_Mod_LobartAlwinScene_07_02"); //Ist ja gut, Mann. Kannst du auch noch was anderes sagen?
	};

	if (Mod_LobartAlwinScene_Counter == 17)
	{
		AI_Output(hero, NULL, "Info_Mod_LobartAlwinScene_15_03"); //Kann mir mal jemand antworten?
	};

	if (Mod_LobartAlwinScene_Counter == 22)
	{
		AI_Output(Mod_910_BAU_Lobart_NW, NULL, "Info_Mod_LobartAlwinScene_26_04"); //Ich habe ihn niedergeschlagen! Oh, Innos! Lebt er noch?
	};

	if (Mod_LobartAlwinScene_Counter == 27)
	{
		AI_Output(Mod_597_NONE_Meldor_NW, NULL, "Info_Mod_LobartAlwinScene_07_05"); //Der ist noch kreuzfidel. Schlimmer als nach 'nem Besäufnis wird er sich schon nicht fühlen.
	};

	if (Mod_LobartAlwinScene_Counter == 32)
	{
		AI_TurnToNpc	(Mod_597_NONE_Meldor_NW, hero);
		AI_TurnToNpc	(hero, Mod_597_NONE_Meldor_NW);

		AI_Output(Mod_597_NONE_Meldor_NW, NULL, "Info_Mod_LobartAlwinScene_07_06"); //(zum Helden) Lobart ist ein wenig ausgerastet, als er gesehen hat, dass sich jemand an seinen Schafen vergriffen hat.
	};

	if (Mod_LobartAlwinScene_Counter == 37)
	{
		AI_Output(Mod_597_NONE_Meldor_NW, NULL, "Info_Mod_LobartAlwinScene_07_07"); //Er ist sofort in die Stadt und zu Alwin, und der hatte das Pech, gerade frisch Schafe geschlachtet zu haben.
	};

	if (Mod_LobartAlwinScene_Counter == 42)
	{
		AI_Output(Mod_597_NONE_Meldor_NW, NULL, "Info_Mod_LobartAlwinScene_07_08"); //Und dann ist Lobart schon auf ihn los, er rannte weg, jo, und wir sehen ja noch, wie weit er gekommen ist.
	};

	if (Mod_LobartAlwinScene_Counter == 47)
	{
		AI_Output(hero, NULL, "Info_Mod_LobartAlwinScene_15_09"); //Waren es Lobarts Schafe, die Alwin getötet hat?
	};

	if (Mod_LobartAlwinScene_Counter == 52)
	{
		AI_Output(Mod_597_NONE_Meldor_NW, NULL, "Info_Mod_LobartAlwinScene_07_10"); //Keine Ahnung. So weit habe ich noch nicht gedacht.
	};

	if (Mod_LobartAlwinScene_Counter == 57)
	{
		Mod_LobartAlwin = 2;

		CutsceneAn = FALSE;
	};

	Mod_LobartAlwinScene_Counter += 1;
};