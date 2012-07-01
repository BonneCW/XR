FUNC VOID GILDENSTORY_DIEBE()
{
	if (CurrentLevel == RELENDEL_ZEN)
	{
		if (Mod_Diebe_Elvira == 0)
		&& (Npc_HasItems(Mod_7499_KDF_Elvira_REL, ItKe_RELMagier) == 1)
		{
			if (Mob_HasItems("ELVIRATRUHE", ItFo_KWine) > 0)
			|| (Mob_HasItems("ELVIRATRUHE", ItFo_Wine) > 0)
			{
				if (!Npc_IsDead(Mod_7499_KDF_Elvira_REL))
				{
					Mod_Diebe_Elvira = 1;

					Npc_SetRefuseTalk (Mod_7499_KDF_Elvira_REL, 30);
				};
			}; 
		};

		if (Mod_Diebe_Elvira == 1)
		{
			if (Npc_KnowsInfo(hero, Info_Mod_Elvira_DiebeKey))
			&& (!Npc_IsInState(Mod_7499_KDF_Elvira_REL, ZS_Talk))
			{
				Mod_Diebe_Elvira = 2;

				AI_UnequipArmor	(Mod_7499_KDF_Elvira_REL);

				Wld_PlayEffect	("SCREEN_BLACK", hero, hero, 0, 0, 0, FALSE);

				Npc_SetRefuseTalk (Mod_7499_KDF_Elvira_REL, 10);

				PlayVideo ("LOVESCENE.BIK");

				Npc_RemoveInvItems	(Mod_7499_KDF_Elvira_REL, ItKe_RELMagier, 1);
				CreateInvItems	(hero, ItKe_RELMagier, 1);
			}; 
		};

		if (Mod_Diebe_Weg == 1)
		&& (Npc_KnowsInfo(hero, Info_Mod_Attila_Umzug))
		{
			Mod_Diebe_Weg = 2;

			Wld_InsertNpc	(Mod_7705_OUT_Cassia_REL, "REL_CITY_001");
			Wld_InsertNpc	(Mod_7704_OUT_Jesper_REL, "REL_CITY_001");
			Wld_InsertNpc	(Mod_7708_OUT_Ramirez_REL, "REL_CITY_001");
			Wld_InsertNpc	(Mod_748_NONE_Rengaru_NW, "REL_CITY_001");
		};

		if (Mod_Diebe_Brunnen == 0)
		&& (Npc_KnowsInfo(hero, Info_Mod_Cassia_REL_Glorie6))
		&& (Npc_GetDistToWP(hero, "REL_CITY_255") < 1000)
		&& (Wld_IsTime(23,00,02,00))
		{
			Mod_Diebe_Brunnen = 1;

			B_LogEntry	(TOPIC_MOD_DIEB_GLORIE, "Aha ... im Brunnen landet also das Gold.");
		};

		if (Mod_Diebe_Brunnen == 1)
		&& (Wld_GetDay() > Mod_Diebe_BrunnenTag)
		&& (Npc_KnowsInfo(hero, Info_Mod_Cassia_REL_Glorie7))
		{
			Mod_Diebe_Brunnen = 2;

			Mod_Diebe_BrunnenTag = Wld_GetDay();

			B_StartOtherRoutine	(Mod_7705_OUT_Cassia_REL, "SCHATZKAMMER");
			B_StartOtherRoutine	(Mod_7704_OUT_Jesper_REL, "SCHATZKAMMER");
			B_StartOtherRoutine	(Mod_7708_OUT_Ramirez_REL, "SCHATZKAMMER");
			B_StartOtherRoutine	(Mod_7709_OUT_Attila_REL, "SCHATZKAMMER");
		};

		if (Mod_Diebe_Brunnen == 2)
		&& (Wld_GetDay() > Mod_Diebe_BrunnenTag)
		{
			Mod_Diebe_Brunnen = 3;
		};

		if (Mod_Diebe_Brunnen == 3)
		&& (Npc_HasItems(hero, ItMi_Lederbeutel_Diebe) == 5)
		{
			Mod_Diebe_Brunnen = 4;

			Npc_RemoveInvItems	(hero, ItMi_Lederbeutel_Diebe, 5);

			CreateInvItems	(hero, ItSe_GoldPocket100, 5);
		};
	};

	if (CurrentLevel == NEWWORLD_ZEN)
	{
		if (Mod_Diebe_Weg == 0)
		&& (Npc_KnowsInfo(hero, Info_Mod_Urnol_Daemonisch))
		{
			Mod_Diebe_Weg = 1;

			B_StartOtherRoutine	(Mod_568_NONE_Cassia_NW, "TOT");
			B_StartOtherRoutine	(Mod_587_NONE_Jesper_NW, "TOT");
			B_StartOtherRoutine	(Mod_746_NONE_Ramirez_NW, "TOT");
			B_StartOtherRoutine	(Mod_748_NONE_Rengaru_NW, "TOT");
		};
	};
};