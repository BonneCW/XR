var int Mod_NagurGeschaefte_Scene_Counter;

FUNC VOID NagurGeschaefte_Scene()
{
	if (Mod_NagurGeschaefte_Scene_Counter == 1)
	{
		Wld_SendTrigger	("NAGURGESCHAEFTSCENE");

		CutsceneAn = TRUE;

		Wld_InsertNpc	(Mod_7781_SNOV_Novize_NW, "NW_CITY_HABOUR_09");
		Wld_InsertNpc	(Mod_7782_ASS_Assassine_NW, "NW_CITY_HABOUR_09");
		Wld_InsertNpc	(Mod_7783_OUT_Schmuggler_NW, "NW_CITY_HABOUR_09");

		AI_SetWalkMode	(Mod_7781_SNOV_Novize_NW, NPC_RUN);
	};

	if (Mod_NagurGeschaefte_Scene_Counter == 6)
	{
		AI_PlayAni	(Mod_7781_SNOV_Novize_NW, "T_PLUNDER");
	};

	if (Mod_NagurGeschaefte_Scene_Counter == 9)
	{
		B_StartOtherRoutine	(Mod_7781_SNOV_Novize_NW, "LAGERHAUS");
	};

	if (Mod_NagurGeschaefte_Scene_Counter == 11)
	{
		Mod_Nagur_Geschaeft = 3;

		Wld_SendUnTrigger	("NAGURGESCHAEFTSCENE");

		CutsceneAn = FALSE;
	};

	Mod_NagurGeschaefte_Scene_Counter += 1;
};