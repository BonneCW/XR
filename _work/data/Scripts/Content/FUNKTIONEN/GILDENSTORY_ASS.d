FUNC VOID GILDENSTORY_ASS ()
{
	if (CurrentLevel == NEWWORLD_ZEN)
	{
		// Einer ist zuviel

		if (Mod_ASS_Jack == 2)
		&& (Npc_IsDead(Mod_586_NONE_Jack_NW))
		{
			Mod_ASS_Jack = 3;

			B_LogEntry	(TOPIC_MOD_ASS_JACK, "So das wäre erledigt. Masut wird zufrieden sein.");
		};

		// Der Blutkelch

		if (Mod_ASS_Richter == 0)
		&& (Npc_KnowsInfo(hero, Info_Mod_RichterKhorinis_Blutkelch))
		&& (!Npc_IsInState(Mod_1034_VLK_Richter_NW, ZS_Talk))
		{
			Mod_ASS_Richter = 1;

			CreateInvItems	(Mod_1034_VLK_Richter_NW, ItMi_Bloodcup_Richter, 1);

			B_KillNpc	(Mod_1034_VLK_Richter_NW);
		};

		// Das verlorene Amulett

		if (Npc_HasItems(hero, ItAm_Mirza) == 1)
		&& (Mod_ASS_MirzaAmulett == 0)
		{
			Mod_ASS_MirzaAmulett = 1;

			AI_Output(hero, NULL, "Info_Mod_Hero_MirzaAmulett_15_00"); //Hoppla. Da ist ja das Ding. Der muss hungrig gewesen sein.
		};

		if (Mod_ASS_Assassinengold == 2)
		&& (Npc_KnowsInfo(hero, Info_Mod_Naim_Comeback))
		&& (Mod_ASS_Comeback < Wld_GetDay())
		{
			Mod_ASS_Assassinengold = 3;

			B_RemoveNpc	(Mod_7100_ASS_Zahit_NW);
			B_RemoveNpc	(Mod_7101_ASS_Krieger_NW);
			B_RemoveNpc	(Mod_7113_ASS_Yussuf_NW);
			B_RemoveNpc	(Mod_7105_ASS_Aabid_NW);
			B_RemoveNpc	(Mod_7104_ASS_Shakir_NW);
			B_RemoveNpc	(Mod_7103_ASS_Gauner_NW);
			B_RemoveNpc	(Mod_7106_ASS_Ramsi_NW);
			B_RemoveNpc	(Mod_7102_ASS_Zeki_NW);
			B_RemoveNpc	(Mod_7108_ASS_Gauner_NW);
			B_RemoveNpc	(Mod_7107_ASS_Gauner_NW);
			B_RemoveNpc	(Mod_7111_ASS_Yasin_NW);
			B_RemoveNpc	(Mod_7127_ASS_Krieger_NW);
			B_RemoveNpc	(Mod_7117_ASS_Krieger_NW);
			B_RemoveNpc	(Mod_7118_ASS_Anwaerter_NW);
			B_RemoveNpc	(Mod_7116_ASS_Krieger_NW);
			B_RemoveNpc	(Mod_7124_ASS_Anwaerter_NW);
			B_RemoveNpc	(Mod_7122_ASS_Maysara_NW);
			B_RemoveNpc	(Mod_7123_ASS_Malik_NW);
			B_RemoveNpc	(Mod_7119_ASS_Masut_NW);
			B_RemoveNpc	(Mod_7125_ASS_Karim_NW);
			B_RemoveNpc	(Mod_7126_ASS_Krieger_NW);
			B_RemoveNpc	(Mod_7141_ASS_Elite_NW);
			B_RemoveNpc	(Mod_7134_ASS_Anwaerter_NW);
			B_RemoveNpc	(Mod_7133_ASS_Sinbad_NW);
			B_RemoveNpc	(Mod_7131_ASS_Krieger_NW);
			B_RemoveNpc	(Mod_7142_ASS_Elite_NW);
			B_RemoveNpc	(Mod_7138_ASS_Azhar_NW);
			B_RemoveNpc	(Mod_7140_ASS_Elite_NW);
			B_RemoveNpc	(Mod_7145_ASS_Aadel_NW);
			B_RemoveNpc	(Mod_7149_ASS_Mufid_NW);
			B_RemoveNpc	(Mod_7146_ASS_Mustafa_NW);
			B_RemoveNpc	(Mod_7147_ASS_Naim_NW);
			B_RemoveNpc	(Mod_7150_ASS_Mahamad_NW);
			B_RemoveNpc	(Mod_7152_ASS_Aiman_NW);
			B_RemoveNpc	(Mod_7148_ASS_Norek_NW);
			B_RemoveNpc	(Mod_7154_ASS_Malek_NW);
			B_RemoveNpc	(Mod_7156_ASS_Mirza_NW);
			B_RemoveNpc	(Mod_7166_ASS_Novize_NW);
			B_RemoveNpc	(Mod_7160_ASS_Novize_NW);
			B_RemoveNpc	(Mod_7199_ASS_Amir_NW);
			B_RemoveNpc	(Mod_7159_ASS_Novize_NW);
			B_RemoveNpc	(Mod_7158_ASS_Novize_NW);
			B_RemoveNpc	(Mod_7161_ASS_Novize_NW);
			B_RemoveNpc	(Mod_7157_ASS_Mourad_NW);
			B_RemoveNpc	(Mod_7163_ASS_Kamal_NW);
			B_RemoveNpc	(Mod_7164_ASS_Kais_NW);
			B_RemoveNpc	(Mod_7165_ASS_Adil_NW);
		};

		if (Mod_ASS_PosWechsel == 0)
		&& (Npc_KnowsInfo(hero, Info_Mod_Cavalorn_AW_Hi))
		{
			Mod_ASS_PosWechsel = 1;

			B_StartOtherRoutine	(Mod_7199_ASS_Amir_NW,	"AUSTAUSCH");
			B_StartOtherRoutine	(Mod_7100_ASS_Zahit_NW,	"AUSTAUSCH");
		};

		if (Mod_ASS_ErolWiederDa == 0)
		&& (Npc_KnowsInfo(hero, Info_Mod_Morpheus_Blutkelch))
		&& (Npc_KnowsInfo(hero, Info_Mod_Lutero_Blutkelch))
		{
			Mod_ASS_ErolWiederDa = 1;

			B_StartOtherRoutine	(Mod_521_NONE_Erol_NW,	"PRESTART");

			AI_UnequipWeapons	(Mod_521_NONE_Erol_NW);

			Npc_RemoveInvItems	(Mod_521_NONE_Erol_NW, ItMw_2H_Eminem_Goldschwert_01, 1);
		};

		if (Npc_KnowsInfo(hero, Info_Mod_Amir_Blutkelch))
		&& (Npc_GetDistToWP(hero, "NW_BIGFARM_LAKE_CAVE_07") < 500)
		&& (Mod_ASS_AtVerratHoehle == 0)
		{
			Mod_ASS_AtVerratHoehle = 1;

			AI_StandUP	(hero);

			AI_Output(hero, NULL, "Info_Mod_Hero_ASS_AtVerratHoehle_15_00"); //Hier hat sich wohl jemand häuslich eingerichtet. Wenn ich nur wüsste, wer ...
		};

		if (Mod_ASS_NaimBlutkelch == 0)
		&& (Npc_IsInState(Mod_7147_ASS_Naim_NW, ZS_MagicSleep))
		&& (Npc_IsInState(Mod_7148_ASS_Norek_NW, ZS_MagicSleep))
		{
			AI_PlayAni	(hero, "T_PLUNDER");

			B_ShowGivenThings	("Blutkelch erhalten");

			CreateInvItems	(hero, ItMi_Bloodcup_Richter, 1);

			Mod_ASS_NaimBlutkelch = 1;
		};

		if (Mod_ASS_Schlacht == 0)
		&& (Npc_KnowsInfo(hero, Info_Mod_Mustafa_Verschwoerung5))
		&& (Npc_GetDistToWP(hero, "WP_ASSASSINE_03") < 500)
		{
			Mod_ASS_Schlacht = 1;

			B_StartOtherRoutine	(Mod_7105_ASS_Aabid_NW,	"SCHLACHT");
			B_StartOtherRoutine	(Mod_7106_ASS_Ramsi_NW,	"SCHLACHT");
			B_StartOtherRoutine	(Mod_7102_ASS_Zeki_NW,	"SCHLACHT");
			B_StartOtherRoutine	(Mod_7103_ASS_Gauner_NW,	"SCHLACHT");
			B_StartOtherRoutine	(Mod_7108_ASS_Gauner_NW,	"SCHLACHT");
			B_StartOtherRoutine	(Mod_7107_ASS_Gauner_NW,	"SCHLACHT");
			B_StartOtherRoutine	(Mod_7113_ASS_Yussuf_NW,	"SCHLACHT");
			B_StartOtherRoutine	(Mod_7111_ASS_Yasin_NW,	"SCHLACHT");
			B_StartOtherRoutine	(Mod_7146_ASS_Mustafa_NW,	"SCHLACHT");
			B_StartOtherRoutine	(Mod_7160_ASS_Novize_NW,	"SCHLACHT");
			B_StartOtherRoutine	(Mod_7161_ASS_Novize_NW,	"SCHLACHT");
			B_StartOtherRoutine	(Mod_7147_ASS_Naim_NW,	"SCHLACHT");
			B_StartOtherRoutine	(Mod_7148_ASS_Norek_NW,	"SCHLACHT");
			B_StartOtherRoutine	(Mod_7163_ASS_Kamal_NW,	"SCHLACHT");
			B_StartOtherRoutine	(Mod_7157_ASS_Mourad_NW,	"SCHLACHT");
			B_StartOtherRoutine	(Mod_7164_ASS_Kais_NW,	"SCHLACHT");
			B_StartOtherRoutine	(Mod_7150_ASS_Mahamad_NW,	"SCHLACHT");
			B_StartOtherRoutine	(Mod_7165_ASS_Adil_NW,	"SCHLACHT");
			B_StartOtherRoutine	(Mod_7152_ASS_Aiman_NW,	"SCHLACHT");
			B_StartOtherRoutine	(Mod_7154_ASS_Malek_NW,	"SCHLACHT");
			B_StartOtherRoutine	(Mod_7159_ASS_Novize_NW,	"SCHLACHT");
			B_StartOtherRoutine	(Mod_7158_ASS_Novize_NW,	"SCHLACHT");
			B_StartOtherRoutine	(Mod_7145_ASS_Aadel_NW,	"SCHLACHT");
			B_StartOtherRoutine	(Mod_7142_ASS_Elite_NW,	"SCHLACHT");
			B_StartOtherRoutine	(Mod_7141_ASS_Elite_NW,	"SCHLACHT");
			B_StartOtherRoutine	(Mod_7140_ASS_Elite_NW,	"SCHLACHT");
			B_StartOtherRoutine	(Mod_7166_ASS_Novize_NW,	"SCHLACHT");
			B_StartOtherRoutine	(Mod_7134_ASS_Anwaerter_NW,	"SCHLACHT");
			B_StartOtherRoutine	(Mod_7138_ASS_Azhar_NW,	"SCHLACHT");
			B_StartOtherRoutine	(Mod_7125_ASS_Karim_NW,	"SCHLACHT");
			B_StartOtherRoutine	(Mod_7124_ASS_Anwaerter_NW,	"SCHLACHT");
			B_StartOtherRoutine	(Mod_7133_ASS_Sinbad_NW,	"SCHLACHT");
			B_StartOtherRoutine	(Mod_7131_ASS_Krieger_NW,	"SCHLACHT");
			B_StartOtherRoutine	(Mod_7122_ASS_Maysara_NW,	"SCHLACHT");
			B_StartOtherRoutine	(Mod_7123_ASS_Malik_NW,	"SCHLACHT");
			B_StartOtherRoutine	(Mod_7126_ASS_Krieger_NW,	"SCHLACHT");
			B_StartOtherRoutine	(Mod_7127_ASS_Krieger_NW,	"SCHLACHT");
			B_StartOtherRoutine	(Mod_7118_ASS_Anwaerter_NW,	"SCHLACHT");
			B_StartOtherRoutine	(Mod_7119_ASS_Masut_NW,	"SCHLACHT");
			B_StartOtherRoutine	(Mod_7117_ASS_Krieger_NW,	"SCHLACHT");
			B_StartOtherRoutine	(Mod_7116_ASS_Krieger_NW,	"SCHLACHT");
			B_StartOtherRoutine	(Mod_7104_ASS_Shakir_NW,	"SCHLACHT");

			Mod_7148_ASS_Norek_NW.guild = GIL_STRF;
			Npc_SetTrueGuild	(Mod_7148_ASS_Norek_NW, GIL_STRF);

			Mod_7157_ASS_Mourad_NW.guild = GIL_STRF;
			Npc_SetTrueGuild	(Mod_7157_ASS_Mourad_NW, GIL_STRF);

			Mod_7164_ASS_Kais_NW.guild = GIL_STRF;
			Npc_SetTrueGuild	(Mod_7164_ASS_Kais_NW, GIL_STRF);

			Mod_7150_ASS_Mahamad_NW.guild = GIL_STRF;
			Npc_SetTrueGuild	(Mod_7150_ASS_Mahamad_NW, GIL_STRF);

			Mod_7165_ASS_Adil_NW.guild = GIL_STRF;
			Npc_SetTrueGuild	(Mod_7165_ASS_Adil_NW, GIL_STRF);

			Mod_7152_ASS_Aiman_NW.guild = GIL_STRF;
			Npc_SetTrueGuild	(Mod_7152_ASS_Aiman_NW, GIL_STRF);

			Mod_7154_ASS_Malek_NW.guild = GIL_STRF;
			Npc_SetTrueGuild	(Mod_7154_ASS_Malek_NW, GIL_STRF);

			Mod_7159_ASS_Novize_NW.guild = GIL_STRF;
			Npc_SetTrueGuild	(Mod_7159_ASS_Novize_NW, GIL_STRF);

			Mod_7158_ASS_Novize_NW.guild = GIL_STRF;
			Npc_SetTrueGuild	(Mod_7158_ASS_Novize_NW, GIL_STRF);

			Mod_7166_ASS_Novize_NW.guild = GIL_STRF;
			Npc_SetTrueGuild	(Mod_7166_ASS_Novize_NW, GIL_STRF);

			Mod_7146_ASS_Mustafa_NW.aivar[AIV_Partymember] = TRUE;
			Mod_7147_ASS_Naim_NW.aivar[AIV_Partymember] = TRUE;
			Mod_7145_ASS_Aadel_NW.aivar[AIV_Partymember] = TRUE;
			Mod_7142_ASS_Elite_NW.aivar[AIV_Partymember] = TRUE;
			Mod_7141_ASS_Elite_NW.aivar[AIV_Partymember] = TRUE;
			Mod_7140_ASS_Elite_NW.aivar[AIV_Partymember] = TRUE;
			Mod_7134_ASS_Anwaerter_NW.aivar[AIV_Partymember] = TRUE;
			Mod_7138_ASS_Azhar_NW.aivar[AIV_Partymember] = TRUE;
			Mod_7125_ASS_Karim_NW.aivar[AIV_Partymember] = TRUE;
			Mod_7124_ASS_Anwaerter_NW.aivar[AIV_Partymember] = TRUE;
			Mod_7133_ASS_Sinbad_NW.aivar[AIV_Partymember] = TRUE;
			Mod_7131_ASS_Krieger_NW.aivar[AIV_Partymember] = TRUE;
			Mod_7122_ASS_Maysara_NW.aivar[AIV_Partymember] = TRUE;
			Mod_7123_ASS_Malik_NW.aivar[AIV_Partymember] = TRUE;
			Mod_7126_ASS_Krieger_NW.aivar[AIV_Partymember] = TRUE;
			Mod_7127_ASS_Krieger_NW.aivar[AIV_Partymember] = TRUE;
			Mod_7118_ASS_Anwaerter_NW.aivar[AIV_Partymember] = TRUE;
			Mod_7119_ASS_Masut_NW.aivar[AIV_Partymember] = TRUE;
			Mod_7117_ASS_Krieger_NW.aivar[AIV_Partymember] = TRUE;
			Mod_7116_ASS_Krieger_NW.aivar[AIV_Partymember] = TRUE;
		};
	};

	if (CurrentLevel == ADDONWORLD_ZEN)
	{
		// Der 3. Blutkelch

		if (Mod_ASS_Blutkelch3 == 5)
		&& (Npc_HasItems(hero, ItMi_Bloodcup_Canyon) == 1)
		{
			Mod_ASS_Blutkelch3 = 6;

			B_LogEntry	(TOPIC_MOD_ASS_LASTBLUTKELCH, "Ich habe den 3. Blutkelch. Sollte unverzüglich zu Norek gehen. Und den Brocken verwahren. Er scheint wertvoll zu sein. Nur schade um die anderen ...");

			AI_Output(hero, NULL, "Info_Mod_Hero_LastBlutkelch_15_00"); //Ah, endlich. Der Blutkelch. Norek kann zufrieden sein.
		};

		// Assassinengold

		if (Mod_ASS_Assassinengold == 0)
		&& (Npc_KnowsInfo(hero, Info_Mod_Norek_Todesangst))
		{
			Mod_ASS_Assassinengold = 1;

			Wld_SendTrigger	("EVT_ERZHOEHLE");
		};

		if (Mod_ASS_Assassinengold == 1)
		&& (Npc_HasItems(hero, ItMi_GreenNugget) >= 34)
		{
			Mod_ASS_Assassinengold = 2;

			B_LogEntry	(TOPIC_MOD_ASS_ASSASSINENGOLD, "Das sollte wohl reichen. Jetzt zurück zu Norek ...");
		};

		// Der Zeremoniendolch

		if (Npc_KnowsInfo(hero, Info_Mod_Riordian_AW_Zeremoniendolch))
		&& (Mod_ASS_DolchMonolog == FALSE)
		{
			if (Npc_GetDistToWP(hero, "BL_RAVEN_RITUAL") < 500)
			|| (Npc_GetDistToWP(hero, "ADW_ADANOSTEMPEL_RAVEN_11") < 500)
			{
				AI_StandUP	(hero);

				AI_Output(hero, NULL, "Info_Mod_Hero_ASS_Zeremoniendolch_15_00"); //Verdammt! Wieder nichts. Muss ich jetzt ganz Jharkendar absuchen? Hmm ... vielleicht kann mir der Eremit im Tal helfen ...

				B_LogEntry	(TOPIC_MOD_ASS_ZEREMONIENDOLCH, "Im Adanostempel habe ich umsonst gesucht. Ich werde mal mit dem Eremit im Tal reden, bevor ich ganz Jharkendar absuchen muss.");

				Mod_ASS_DolchMonolog = TRUE;
			};
		};
	};
};