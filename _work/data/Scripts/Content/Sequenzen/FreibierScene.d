var int Mod_FreibierScene_Counter;

FUNC VOID FreibierScene()
{
	if (Mod_FreibierScene_Counter == 0)
	{
		B_StartOtherRoutine	(Mod_1076_VLK_Wirt_NW, "FREIBIER");

		if (Npc_GetDistToNpc(Mod_747_MIL_Rangar_NW, hero) < 1000)
		{
			B_StartOtherRoutine	(Mod_747_MIL_Rangar_NW, "FREIBIER");
		};

		B_StartOtherRoutine	(Mod_753_NOV_Ulf_NW, "FREIBIER");

		Wld_SendTrigger	("EVT_FREIBIERSTAND_SCENE");

		CutsceneAn = TRUE;
	};

	if (Mod_FreibierScene_Counter == 2)
	{
		AI_TurnToNpc	(Mod_1076_VLK_Wirt_NW, hero);
		AI_TurnToNpc	(hero, Mod_1076_VLK_Wirt_NW);

		AI_Output(hero, NULL, "Info_Mod_FreibierScene_15_00"); //Was erzählt man sich sonst so?
	};

	if (Mod_FreibierScene_Counter == 7)
	{
		AI_Output(Mod_1076_VLK_Wirt_NW, NULL, "Info_Mod_FreibierScene_29_01"); //Darauf müssen wir erst noch einen heben! Auf Matteo!

		AI_TurnToNpc	(Mod_747_MIL_Rangar_NW, Mod_1076_VLK_Wirt_NW);
		AI_TurnToNpc	(Mod_753_NOV_Ulf_NW, Mod_1076_VLK_Wirt_NW);
	};

	if (Mod_FreibierScene_Counter == 12)
	{
		CreateInvItems	(Mod_1076_VLK_Wirt_NW, ItFo_Beer, 3);
		CreateInvItems	(Mod_747_MIL_Rangar_NW, ItFo_Beer, 3);
		CreateInvItems	(Mod_753_NOV_Ulf_NW, ItFo_Beer, 3);

		B_GiveInvItems	(Mod_1076_VLK_Wirt_NW, hero, ItFo_Beer, 1);

		B_UseItem	(hero, ItFo_Beer);
		B_UseItem	(Mod_1076_VLK_Wirt_NW, ItFo_Beer);

		if (Npc_GetDistToNpc(Mod_747_MIL_Rangar_NW, hero) < 1000)
		{
			B_UseItem	(Mod_747_MIL_Rangar_NW, ItFo_Beer);
		};

		B_UseItem	(Mod_753_NOV_Ulf_NW, ItFo_Beer);
	};

	if (Mod_FreibierScene_Counter == 14)
	{
		AI_Output(Mod_1076_VLK_Wirt_NW, NULL, "Info_Mod_FreibierScene_29_02"); //Und sonst? Das übliche Geschwätz.
	};

	if (Mod_FreibierScene_Counter == 19)
	{
		AI_Output(Mod_1076_VLK_Wirt_NW, NULL, "Info_Mod_FreibierScene_29_03"); //Constantino soll einem Jungen nachgestellt haben, na, wer seine Regungen noch nicht kennt, der kommt wohl aus dem Kloster! (lacht)
	};

	if (Mod_FreibierScene_Counter == 24)
	{
		AI_TurnToNpc	(Mod_753_NOV_Ulf_NW, hero);

		AI_Output(Mod_753_NOV_Ulf_NW, NULL, "Info_Mod_FreibierScene_03_04"); //Das weiß sogar ich!
	};

	if (Mod_FreibierScene_Counter == 31)
	{
		B_StartOtherRoutine	(Mod_1076_VLK_Wirt_NW, "START");

		if (Npc_GetDistToNpc(Mod_747_MIL_Rangar_NW, hero) < 1000)
		{
			B_StartOtherRoutine	(Mod_747_MIL_Rangar_NW, "START");
		};

		B_StartOtherRoutine	(Mod_753_NOV_Ulf_NW, "START");

		Mod_Wirt_Freibier = 3;

		CutsceneAn = FALSE;
	};

	Mod_FreibierScene_Counter += 1;
};