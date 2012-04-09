var int Mod_ParcivalVorKneipeScene_Counter;

FUNC VOID ParcivalVorKneipeScene()
{
	if (Mod_ParcivalVorKneipeScene_Counter == 0)
	{
		Wld_SendTrigger	("EVT_CAMERA_PARCIVAL_VORKNEIPE");

		AI_TurnToNpc	(Mod_504_PAL_Parcival_REL, hero);
		AI_TurnToNpc	(hero, Mod_504_PAL_Parcival_REL);

		CutsceneAn = TRUE;
	};

	if (Mod_ParcivalVorKneipeScene_Counter == 2)
	{
		AI_Output(Mod_504_PAL_Parcival_REL, NULL, "Info_Mod_ParcivalVorKneipeScene_13_00"); //(euphorisch) Ja, Innos sei gedankt, die Barriere steht wieder.
	};

	if (Mod_ParcivalVorKneipeScene_Counter == 8)
	{
		AI_Output(Mod_504_PAL_Parcival_REL, NULL, "Info_Mod_ParcivalVorKneipeScene_13_01"); //Mein Dienst hier ist somit nicht länger erforderlich und ich kann alsbald zurück nach Khorinis ... raus, aus dieser verkommenen Umgebung.
	};

	if (Mod_ParcivalVorKneipeScene_Counter == 14)
	{
		Wld_InsertNpc	(Mod_7673_MIL_Miliz_REL,	"REL_MOOR_141");

		AI_TurnToNpc	(Mod_7673_MIL_Miliz_REL, Mod_504_PAL_Parcival_REL);
	};

	if (Mod_ParcivalVorKneipeScene_Counter == 16)
	{
		AI_Output(Mod_7673_MIL_Miliz_REL, NULL, "Info_Mod_ParcivalVorKneipeScene_06_02"); //Ich komme im Auftrag von Kommandant Garond.
	};

	if (Mod_ParcivalVorKneipeScene_Counter == 22)
	{
		AI_Output(Mod_7673_MIL_Miliz_REL, NULL, "Info_Mod_ParcivalVorKneipeScene_06_03"); //Er hat Kenntnis über die neue Situation beim Moor erhalten.
	};

	if (Mod_ParcivalVorKneipeScene_Counter == 28)
	{
		AI_Output(Mod_7673_MIL_Miliz_REL, NULL, "Info_Mod_ParcivalVorKneipeScene_06_04"); //Da es nun die Umstände zulassen, soll die alte Siedlung wieder errichtet werden… unter eurer Führung und in Zusammenarbeit mit den kundigen Menschen dieser Umgebung.
	};

	if (Mod_ParcivalVorKneipeScene_Counter == 34)
	{
		AI_Output(Mod_7673_MIL_Miliz_REL, NULL, "Info_Mod_ParcivalVorKneipeScene_06_05"); //Für den König!
	};

	if (Mod_ParcivalVorKneipeScene_Counter == 40)
	{
		B_RemoveNpc	(Mod_7673_MIL_Miliz_REL);

		AI_Output(Mod_504_PAL_Parcival_REL, NULL, "Info_Mod_ParcivalVorKneipeScene_13_06"); //(entsetzt) Was?! Nein, dies ist nicht möglich… wartet!
	};

	if (Mod_ParcivalVorKneipeScene_Counter == 46)
	{
		AI_Output(hero, NULL, "Info_Mod_ParcivalVorKneipeScene_15_07"); //(zu sich selbst) Nun, es scheint, als müsse er doch noch ein Weilchen seinen Dienst hier leisten.
	};

	if (Mod_ParcivalVorKneipeScene_Counter == 52)
	{
		AI_Output(Mod_504_PAL_Parcival_REL, NULL, "Info_Mod_ParcivalVorKneipeScene_13_08"); //(entgeistert) Nein ... das ist zu viel ...
	};

	if (Mod_ParcivalVorKneipeScene_Counter == 58)
	{
		B_StartOtherRoutine	(Mod_504_PAL_Parcival_REL, "INKNEIPE");

		Wld_SendUnTrigger	("EVT_CAMERA_PARCIVAL_VORKNEIPE");

		Mod_Parcival_VorKneipe = 2;

		CutsceneAn = FALSE;
	};

	Mod_ParcivalVorKneipeScene_Counter += 1;
};