func void NL_STEINKREIS_01_S1 ()
{
	if (Mod_NL_Siegelbuch == 2)
	&& (Mob_HasItems("STEINKREISMITTE_01", ItWr_Siegelbuch) == 1)
	{
		Mod_NL_Steinkreis_01 += 1;

		Wld_PlayEffect("FX_EarthQuake",  hero, hero, 0, 0, 0, FALSE );

		if (Hlp_Random(5) == 0)
		{
			if (Hlp_Random(2) == 0)
			{
				Wld_PlayEffect("spellFX_INCOVATION_RED",  hero, hero, 0, 0, 0, FALSE );
			}
			else
			{
				if (Hlp_Random(2) == 0)
				{
					Wld_PlayEffect("spellFX_INCOVATION_BLUE",  hero, hero, 0, 0, 0, FALSE );
				}
				else
				{
					Wld_PlayEffect("spellFX_INCOVATION_VIOLET",  hero, hero, 0, 0, 0, FALSE );
				};
			};
		};

		if (Mod_NL_Steinkreis_01 == 1)
		{
			Wld_InsertNpc	(Mod_7323_Paladingeist_NW, "WP_PALADINGEIST_01");
			Wld_InsertNpc	(Mod_7324_Paladingeist_NW, "WP_PALADINGEIST_02");
			Wld_InsertNpc	(Mod_7325_Paladingeist_NW, "NW_LITTLESTONEHENDGE");
			Wld_InsertNpc	(Mod_7437_Paladingeist_NW, "NW_LITTLESTONEHENDGE_01");
			Wld_InsertNpc	(Mod_7438_Paladingeist_NW, "NW_LITTLESTONEHENDGE_01");
			Wld_InsertNpc	(Mod_7439_Paladingeist_NW, "NW_LITTLESTONEHENDGE_02");
			Wld_InsertNpc	(Mod_7440_Paladingeist_NW, "WP_PALADINGEIST_01");
			Wld_InsertNpc	(Mod_7441_Paladingeist_NW, "WP_PALADINGEIST_03");
		};

		if (Mod_NL_Steinkreis_01 == 2)
		{
			Wld_PlayEffect("spellFX_HolyRain_RAIN",  hero, hero, 0, 0, 0, FALSE );

			AI_PlayAni	(Mod_7323_Paladingeist_NW, "T_DEADB");
			AI_PlayAni	(Mod_7324_Paladingeist_NW, "T_DEADB");
			AI_PlayAni	(Mod_7325_Paladingeist_NW, "T_DEADB");
			AI_PlayAni	(Mod_7437_Paladingeist_NW, "T_DEADB");
			AI_PlayAni	(Mod_7438_Paladingeist_NW, "T_DEADB");
			AI_PlayAni	(Mod_7439_Paladingeist_NW, "T_DEADB");
			AI_PlayAni	(Mod_7440_Paladingeist_NW, "T_DEADB");
			AI_PlayAni	(Mod_7441_Paladingeist_NW, "T_DEADB");
		};

		if (Mod_NL_Steinkreis_01 == 3)
		{
			Mod_NL_Siegelbuch = 3;

			B_RemoveNpc	(Mod_7323_Paladingeist_NW);
			B_RemoveNpc	(Mod_7324_Paladingeist_NW);
			B_RemoveNpc	(Mod_7325_Paladingeist_NW);
			B_RemoveNpc	(Mod_7437_Paladingeist_NW);
			B_RemoveNpc	(Mod_7438_Paladingeist_NW);
			B_RemoveNpc	(Mod_7439_Paladingeist_NW);
			B_RemoveNpc	(Mod_7440_Paladingeist_NW);
			B_RemoveNpc	(Mod_7441_Paladingeist_NW);

			B_LogEntry	(TOPIC_MOD_NL_SIEGELBUCH, "Tatsächlich! Das erste Siegel ist geöffnet! Die Dinge, die sich während dessen in der Umgebung abgespielt haben, waren mehr als verwirrend ...");
		};
	};
};

func void NL_STEINKREIS_01_S0 ()
{
	if (Mod_NL_Siegelbuch == 2)
	&& (Mob_HasItems("STEINKREISMITTE_01", ItWr_Siegelbuch) == 1)
	{
		Mod_NL_Steinkreis_01 += 1;

		Wld_PlayEffect("FX_EarthQuake",  hero, hero, 0, 0, 0, FALSE );

		if (Hlp_Random(5) == 0)
		{
			if (Hlp_Random(2) == 0)
			{
				Wld_PlayEffect("spellFX_INCOVATION_RED",  hero, hero, 0, 0, 0, FALSE );
			}
			else
			{
				if (Hlp_Random(2) == 0)
				{
					Wld_PlayEffect("spellFX_INCOVATION_BLUE",  hero, hero, 0, 0, 0, FALSE );
				}
				else
				{
					Wld_PlayEffect("spellFX_INCOVATION_VIOLET",  hero, hero, 0, 0, 0, FALSE );
				};
			};
		};

		if (Mod_NL_Steinkreis_01 == 1)
		{
			Wld_InsertNpc	(Mod_7323_Paladingeist_NW, "WP_PALADINGEIST_01");
			Wld_InsertNpc	(Mod_7324_Paladingeist_NW, "WP_PALADINGEIST_02");
			Wld_InsertNpc	(Mod_7325_Paladingeist_NW, "NW_LITTLESTONEHENDGE");
			Wld_InsertNpc	(Mod_7437_Paladingeist_NW, "NW_LITTLESTONEHENDGE_01");
			Wld_InsertNpc	(Mod_7438_Paladingeist_NW, "NW_LITTLESTONEHENDGE_01");
			Wld_InsertNpc	(Mod_7439_Paladingeist_NW, "NW_LITTLESTONEHENDGE_02");
			Wld_InsertNpc	(Mod_7440_Paladingeist_NW, "WP_PALADINGEIST_01");
			Wld_InsertNpc	(Mod_7441_Paladingeist_NW, "WP_PALADINGEIST_03");
		};

		if (Mod_NL_Steinkreis_01 == 2)
		{
			Wld_PlayEffect("spellFX_HolyRain_RAIN",  hero, hero, 0, 0, 0, FALSE );

			AI_PlayAni	(Mod_7323_Paladingeist_NW, "T_DEADB");
			AI_PlayAni	(Mod_7324_Paladingeist_NW, "T_DEADB");
			AI_PlayAni	(Mod_7325_Paladingeist_NW, "T_DEADB");
			AI_PlayAni	(Mod_7437_Paladingeist_NW, "T_DEADB");
			AI_PlayAni	(Mod_7438_Paladingeist_NW, "T_DEADB");
			AI_PlayAni	(Mod_7439_Paladingeist_NW, "T_DEADB");
			AI_PlayAni	(Mod_7440_Paladingeist_NW, "T_DEADB");
			AI_PlayAni	(Mod_7441_Paladingeist_NW, "T_DEADB");
		};

		if (Mod_NL_Steinkreis_01 == 3)
		{
			Mod_NL_Siegelbuch = 3;

			B_RemoveNpc	(Mod_7323_Paladingeist_NW);
			B_RemoveNpc	(Mod_7324_Paladingeist_NW);
			B_RemoveNpc	(Mod_7325_Paladingeist_NW);
			B_RemoveNpc	(Mod_7437_Paladingeist_NW);
			B_RemoveNpc	(Mod_7438_Paladingeist_NW);
			B_RemoveNpc	(Mod_7439_Paladingeist_NW);
			B_RemoveNpc	(Mod_7440_Paladingeist_NW);
			B_RemoveNpc	(Mod_7441_Paladingeist_NW);

			B_LogEntry	(TOPIC_MOD_NL_SIEGELBUCH, "Tatsächlich! Das erste Siegel ist geöffnet! Die Dinge, die sich während dessen in der Umgebung abgespielt haben, waren mehr als verwirrend ...");
		};
	};
};

func void NL_STEINKREIS_02_S1 ()
{
	if (Mod_NL_Siegelbuch == 3)
	&& (Mob_HasItems("STEINKREISMITTE_02", ItWr_Siegelbuch) == 1)
	{
		Mod_NL_Steinkreis_02 += 1;

		Wld_PlayEffect("FX_EarthQuake",  hero, hero, 0, 0, 0, FALSE );

		if (Hlp_Random(5) == 0)
		{
			if (Hlp_Random(2) == 0)
			{
				Wld_PlayEffect("spellFX_INCOVATION_RED",  hero, hero, 0, 0, 0, FALSE );
			}
			else
			{
				if (Hlp_Random(2) == 0)
				{
					Wld_PlayEffect("spellFX_INCOVATION_BLUE",  hero, hero, 0, 0, 0, FALSE );
				}
				else
				{
					Wld_PlayEffect("spellFX_INCOVATION_VIOLET",  hero, hero, 0, 0, 0, FALSE );
				};
			};
		};

		if (Mod_NL_Steinkreis_02 == 1)
		{
			Wld_PlayEffect("spellFX_Icewave_WAVE",  hero, hero, 0, 0, 0, FALSE );
		};

		if (Mod_NL_Steinkreis_02 == 2)
		{
			Wld_InsertNpc	(Erdgigant, "FP_EVENT_SPAWN_STONEGUARDIAN_ORNAMENT_BIGFARM_01");
		};

		if (Mod_NL_Steinkreis_02 == 3)
		{
			Mod_NL_Siegelbuch = 4;

			Wld_InsertNpc	(Stoneguardian, "FP_SPAWN_STONEGUARDIAN_STEINKREIS_01");
			Wld_InsertNpc	(Stoneguardian, "FP_SPAWN_STONEGUARDIAN_STEINKREIS_02");
			Wld_InsertNpc	(Stoneguardian, "FP_SPAWN_STONEGUARDIAN_STEINKREIS_03");
			Wld_InsertNpc	(Stoneguardian, "FP_SPAWN_STONEGUARDIAN_STEINKREIS_04");
			Wld_InsertNpc	(Stoneguardian, "FP_SPAWN_STONEGUARDIAN_STEINKREIS_05");
			Wld_InsertNpc	(Stoneguardian, "FP_SPAWN_STONEGUARDIAN_STEINKREIS_06");
			Wld_InsertNpc	(Stoneguardian, "FP_SPAWN_STONEGUARDIAN_STEINKREIS_07");
			Wld_InsertNpc	(Stoneguardian, "FP_SPAWN_STONEGUARDIAN_STEINKREIS_08");

			B_LogEntry	(TOPIC_MOD_NL_SIEGELBUCH, "Puhh, so habe ich denn nun das 2te Siegel öffnen können. Auch, wenn es mich diesmal beinahe das Leben gekostet hätte ...");
		};
	}
	else if (Mod_NL_Siegelbuch == 2)
	{
		AI_Output(hero, NULL, "Info_Mod_Hero_ErstAndererSteinkreis_15_00"); //Ich sollte erst einen anderen Steinkreis benutzen.
	};
};

func void NL_STEINKREIS_02_S0 ()
{
	if (Mod_NL_Siegelbuch == 3)
	&& (Mob_HasItems("STEINKREISMITTE_02", ItWr_Siegelbuch) == 1)
	{
		Mod_NL_Steinkreis_02 += 1;

		Wld_PlayEffect("FX_EarthQuake",  hero, hero, 0, 0, 0, FALSE );

		if (Hlp_Random(5) == 0)
		{
			if (Hlp_Random(2) == 0)
			{
				Wld_PlayEffect("spellFX_INCOVATION_RED",  hero, hero, 0, 0, 0, FALSE );
			}
			else
			{
				if (Hlp_Random(2) == 0)
				{
					Wld_PlayEffect("spellFX_INCOVATION_BLUE",  hero, hero, 0, 0, 0, FALSE );
				}
				else
				{
					Wld_PlayEffect("spellFX_INCOVATION_VIOLET",  hero, hero, 0, 0, 0, FALSE );
				};
			};
		};

		if (Mod_NL_Steinkreis_02 == 1)
		{
			Wld_PlayEffect("spellFX_Icewave_WAVE",  hero, hero, 0, 0, 0, FALSE );
		};

		if (Mod_NL_Steinkreis_02 == 2)
		{
			Wld_InsertNpc	(Erdgigant, "FP_EVENT_SPAWN_STONEGUARDIAN_ORNAMENT_BIGFARM_01");
		};

		if (Mod_NL_Steinkreis_02 == 3)
		{
			Mod_NL_Siegelbuch = 4;

			Wld_InsertNpc	(Stoneguardian, "FP_SPAWN_STONEGUARDIAN_STEINKREIS_01");
			Wld_InsertNpc	(Stoneguardian, "FP_SPAWN_STONEGUARDIAN_STEINKREIS_02");
			Wld_InsertNpc	(Stoneguardian, "FP_SPAWN_STONEGUARDIAN_STEINKREIS_03");
			Wld_InsertNpc	(Stoneguardian, "FP_SPAWN_STONEGUARDIAN_STEINKREIS_04");
			Wld_InsertNpc	(Stoneguardian, "FP_SPAWN_STONEGUARDIAN_STEINKREIS_05");
			Wld_InsertNpc	(Stoneguardian, "FP_SPAWN_STONEGUARDIAN_STEINKREIS_06");
			Wld_InsertNpc	(Stoneguardian, "FP_SPAWN_STONEGUARDIAN_STEINKREIS_07");
			Wld_InsertNpc	(Stoneguardian, "FP_SPAWN_STONEGUARDIAN_STEINKREIS_08");

			B_LogEntry	(TOPIC_MOD_NL_SIEGELBUCH, "Puhh, so habe ich denn nun das 2te Siegel öffnen können. Auch, wenn es mich diesmal beinahe das Leben gekostet hätte ...");
		};
	}
	else if (Mod_NL_Siegelbuch == 2)
	{
		AI_Output(hero, NULL, "Info_Mod_Hero_ErstAndererSteinkreis_15_00"); //Ich sollte erst einen anderen Steinkreis benutzen.
	};
};

func void NL_STEINKREIS_03_S1 ()
{
	if (Mod_NL_Siegelbuch == 4)
	&& (Mob_HasItems("STEINKREISMITTE_03", ItWr_Siegelbuch) == 1)
	&& (Npc_HasItems(hero, ItWr_Chromanin3) == 1)
	{
		Mod_NL_Steinkreis_03 += 1;

		Wld_PlayEffect("FX_EarthQuake",  hero, hero, 0, 0, 0, FALSE );

		if (Hlp_Random(5) == 0)
		{
			if (Hlp_Random(2) == 0)
			{
				Wld_PlayEffect("spellFX_INCOVATION_RED",  hero, hero, 0, 0, 0, FALSE );
			}
			else
			{
				if (Hlp_Random(2) == 0)
				{
					Wld_PlayEffect("spellFX_INCOVATION_BLUE",  hero, hero, 0, 0, 0, FALSE );
				}
				else
				{
					Wld_PlayEffect("spellFX_INCOVATION_VIOLET",  hero, hero, 0, 0, 0, FALSE );
				};
			};
		};

		if (Mod_NL_Steinkreis_03 == 2)
		{
			Wld_InsertNpc	(Wurzelzwerg, "FP_EVENT_SPAWN_STONEGUARDIAN_ORNAMENT_FOREST_01");
			Wld_InsertNpc	(Wurzelzwerg, "FP_EVENT_SPAWN_STONEGUARDIAN_ORNAMENT_FOREST_01");
			Wld_InsertNpc	(Wurzelzwerg, "FP_EVENT_SPAWN_STONEGUARDIAN_ORNAMENT_FOREST_01");
			Wld_InsertNpc	(Wurzelzwerg, "FP_EVENT_SPAWN_STONEGUARDIAN_ORNAMENT_FOREST_01");
			Wld_InsertNpc	(Wurzelzwerg, "FP_EVENT_SPAWN_STONEGUARDIAN_ORNAMENT_FOREST_01");
			Wld_InsertNpc	(Wurzelzwerg, "FP_EVENT_SPAWN_STONEGUARDIAN_ORNAMENT_FOREST_01");
			Wld_InsertNpc	(Wurzelzwerg, "FP_EVENT_SPAWN_STONEGUARDIAN_ORNAMENT_FOREST_01");
			Wld_InsertNpc	(Wurzelzwerg, "FP_EVENT_SPAWN_STONEGUARDIAN_ORNAMENT_FOREST_01");
			Wld_InsertNpc	(Wurzelzwerg, "FP_EVENT_SPAWN_STONEGUARDIAN_ORNAMENT_FOREST_01");
			Wld_InsertNpc	(Wurzelzwerg, "FP_EVENT_SPAWN_STONEGUARDIAN_ORNAMENT_FOREST_01");
			Wld_InsertNpc	(Wurzelzwerg, "FP_EVENT_SPAWN_STONEGUARDIAN_ORNAMENT_FOREST_01");
			Wld_InsertNpc	(Wurzelzwerg, "FP_EVENT_SPAWN_STONEGUARDIAN_ORNAMENT_FOREST_01");
		};

		if (Mod_NL_Steinkreis_03 == 3)
		{
			Mod_NL_Siegelbuch = 5;

			Npc_RemoveInvItems	(hero, ItWr_Chromanin3, 1);
			CreateInvItems	(hero, theriddle4, 1);

			B_LogEntry	(TOPIC_MOD_NL_SIEGELBUCH, "Ja, endlich das sollte es gewesen sein. Aber ... einen Augenblick mal ... scheiße, nichts wie weg ...");
			B_SetTopicStatus	(TOPIC_MOD_NL_SIEGELBUCH, LOG_SUCCESS);

			Mdl_ApplyOverlayMDS	(hero, "HUMANS_REGEN.MDS");

			AI_GotoWP	(hero, "NW_FOREST_PATH_66");

			B_StartOtherRoutine	(Mod_513_DMB_Xardas_NW, "DRACHEN");
			
			MEM_RemoveVob("STEINKREISMITTE_03");
		};
	}
	else if (Mod_NL_Siegelbuch == 2)
	|| (Mod_NL_Siegelbuch == 3)
	{
		AI_Output(hero, NULL, "Info_Mod_Hero_ErstAndererSteinkreis_15_00"); //Ich sollte erst einen anderen Steinkreis benutzen.
	};
};

func void NL_STEINKREIS_03_S0 ()
{
	if (Mod_NL_Siegelbuch == 4)
	&& (Mob_HasItems("STEINKREISMITTE_03", ItWr_Siegelbuch) == 1)
	&& (Npc_HasItems(hero, ItWr_Chromanin3) == 1)
	{
		Mod_NL_Steinkreis_03 += 1;

		Wld_PlayEffect("FX_EarthQuake",  hero, hero, 0, 0, 0, FALSE );

		if (Hlp_Random(5) == 0)
		{
			if (Hlp_Random(2) == 0)
			{
				Wld_PlayEffect("spellFX_INCOVATION_RED",  hero, hero, 0, 0, 0, FALSE );
			}
			else
			{
				if (Hlp_Random(2) == 0)
				{
					Wld_PlayEffect("spellFX_INCOVATION_BLUE",  hero, hero, 0, 0, 0, FALSE );
				}
				else
				{
					Wld_PlayEffect("spellFX_INCOVATION_VIOLET",  hero, hero, 0, 0, 0, FALSE );
				};
			};
		};

		if (Mod_NL_Steinkreis_03 == 2)
		{
			Wld_InsertNpc	(Wurzelzwerg, "FP_EVENT_SPAWN_STONEGUARDIAN_ORNAMENT_FOREST_01");
			Wld_InsertNpc	(Wurzelzwerg, "FP_EVENT_SPAWN_STONEGUARDIAN_ORNAMENT_FOREST_01");
			Wld_InsertNpc	(Wurzelzwerg, "FP_EVENT_SPAWN_STONEGUARDIAN_ORNAMENT_FOREST_01");
			Wld_InsertNpc	(Wurzelzwerg, "FP_EVENT_SPAWN_STONEGUARDIAN_ORNAMENT_FOREST_01");
			Wld_InsertNpc	(Wurzelzwerg, "FP_EVENT_SPAWN_STONEGUARDIAN_ORNAMENT_FOREST_01");
			Wld_InsertNpc	(Wurzelzwerg, "FP_EVENT_SPAWN_STONEGUARDIAN_ORNAMENT_FOREST_01");
			Wld_InsertNpc	(Wurzelzwerg, "FP_EVENT_SPAWN_STONEGUARDIAN_ORNAMENT_FOREST_01");
			Wld_InsertNpc	(Wurzelzwerg, "FP_EVENT_SPAWN_STONEGUARDIAN_ORNAMENT_FOREST_01");
			Wld_InsertNpc	(Wurzelzwerg, "FP_EVENT_SPAWN_STONEGUARDIAN_ORNAMENT_FOREST_01");
			Wld_InsertNpc	(Wurzelzwerg, "FP_EVENT_SPAWN_STONEGUARDIAN_ORNAMENT_FOREST_01");
			Wld_InsertNpc	(Wurzelzwerg, "FP_EVENT_SPAWN_STONEGUARDIAN_ORNAMENT_FOREST_01");
			Wld_InsertNpc	(Wurzelzwerg, "FP_EVENT_SPAWN_STONEGUARDIAN_ORNAMENT_FOREST_01");
		};

		if (Mod_NL_Steinkreis_03 == 3)
		{
			Mod_NL_Siegelbuch = 5;

			Npc_RemoveInvItems	(hero, ItWr_Chromanin3, 1);
			CreateInvItems	(hero, theriddle4, 1);

			B_LogEntry	(TOPIC_MOD_NL_SIEGELBUCH, "Ja, endlich das sollte es gewesen sein. Aber ... einen Augenblick mal ... scheiße, nichts wie weg ...");
			B_SetTopicStatus	(TOPIC_MOD_NL_SIEGELBUCH, LOG_SUCCESS);

			Mdl_ApplyOverlayMDS	(hero, "HUMANS_REGEN.MDS");

			AI_GotoWP	(hero, "NW_FOREST_PATH_66");

			B_StartOtherRoutine	(Mod_513_DMB_Xardas_NW, "DRACHEN");
			
			MEM_RemoveVob("STEINKREISMITTE_03");

			Mod_SiegelEffekt = 1;
		};
	}
	else if (Mod_NL_Siegelbuch == 2)
	|| (Mod_NL_Siegelbuch == 3)
	{
		AI_Output(hero, NULL, "Info_Mod_Hero_ErstAndererSteinkreis_15_00"); //Ich sollte erst einen anderen Steinkreis benutzen.
	};
};