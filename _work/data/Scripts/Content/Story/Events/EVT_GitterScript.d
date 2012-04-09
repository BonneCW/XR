FUNC VOID EVT_GITTERSCRIPT ()
{
	if (Mod_JG_Gitter == 1)
	{
		Mod_JG_Gitter = 2;

		Wld_SendTrigger	("EVT_DRACHENTALGITTER");

		// Drache und Wachen zum Kämpfen zusammenstellen

		B_StartOtherRoutine	(Wasserdrache_11054_DT, "KAMPF");

		B_StartOtherRoutine	(Mod_7544_OUT_Wache_DT, "KAMPF");
		B_StartOtherRoutine	(Mod_7545_OUT_Wache_DT, "KAMPF");
		B_StartOtherRoutine	(Mod_7546_OUT_Wache_DT, "KAMPF");
		B_StartOtherRoutine	(Mod_7547_OUT_Wache_DT, "KAMPF");
		B_StartOtherRoutine	(Mod_7548_OUT_Wache_DT, "KAMPF");
		B_StartOtherRoutine	(Mod_7549_OUT_Wache_DT, "KAMPF");
		B_StartOtherRoutine	(Mod_7550_OUT_Wache_DT, "KAMPF");
		B_StartOtherRoutine	(Mod_7551_OUT_Wache_DT, "KAMPF");
		B_StartOtherRoutine	(Mod_7552_OUT_Wache_DT, "KAMPF");
		B_StartOtherRoutine	(Mod_7553_OUT_Wache_DT, "KAMPF");
	};
};

FUNC VOID EVT_STEINSCRIPT01_S0 ()
{
	if (Mod_JG_Raetselstein01 == 0)
	{
		Mod_JG_Raetselstein01 = 1;

		Mod_JG_Raetselstein += 8;
	}
	else
	{
		Mod_JG_Raetselstein01 = 0;

		Mod_JG_Raetselstein -= 8;
	};

	Wld_SendTrigger	("EVT_STEIN01");
};

FUNC VOID EVT_STEINSCRIPT01_S1 ()
{
	if (Mod_JG_Raetselstein01 == 0)
	{
		Mod_JG_Raetselstein01 = 1;

		Mod_JG_Raetselstein += 8;
	}
	else
	{
		Mod_JG_Raetselstein01 = 0;

		Mod_JG_Raetselstein -= 8;
	};

	Wld_SendTrigger	("EVT_STEIN01");
};

FUNC VOID EVT_STEINSCRIPT02_S0 ()
{
	if (Mod_JG_Raetselstein02 == 0)
	{
		Mod_JG_Raetselstein02 = 1;

		Mod_JG_Raetselstein += 4;
	}
	else
	{
		Mod_JG_Raetselstein02 = 0;

		Mod_JG_Raetselstein -= 4;
	};

	Wld_SendTrigger	("EVT_STEIN02");
};

FUNC VOID EVT_STEINSCRIPT02_S1 ()
{
	if (Mod_JG_Raetselstein02 == 0)
	{
		Mod_JG_Raetselstein02 = 1;

		Mod_JG_Raetselstein += 4;
	}
	else
	{
		Mod_JG_Raetselstein02 = 0;

		Mod_JG_Raetselstein -= 4;
	};

	Wld_SendTrigger	("EVT_STEIN02");
};

FUNC VOID EVT_STEINSCRIPT03_S0 ()
{
	if (Mod_JG_Raetselstein03 == 0)
	{
		Mod_JG_Raetselstein03 = 1;

		Mod_JG_Raetselstein += 2;
	}
	else
	{
		Mod_JG_Raetselstein03 = 0;

		Mod_JG_Raetselstein -= 2;
	};

	Wld_SendTrigger	("EVT_STEIN03");
};

FUNC VOID EVT_STEINSCRIPT03_S1 ()
{
	if (Mod_JG_Raetselstein03 == 0)
	{
		Mod_JG_Raetselstein03 = 1;

		Mod_JG_Raetselstein += 2;
	}
	else
	{
		Mod_JG_Raetselstein03 = 0;

		Mod_JG_Raetselstein -= 2;
	};

	Wld_SendTrigger	("EVT_STEIN03");
};

FUNC VOID EVT_STEINSCRIPT04_S0 ()
{
	if (Mod_JG_Raetselstein04 == 0)
	{
		Mod_JG_Raetselstein04 = 1;

		Mod_JG_Raetselstein += 1;
	}
	else
	{
		Mod_JG_Raetselstein04 = 0;

		Mod_JG_Raetselstein -= 1;
	};

	Wld_SendTrigger	("EVT_STEIN04");
};

FUNC VOID EVT_STEINSCRIPT04_S1 ()
{
	if (Mod_JG_Raetselstein04 == 0)
	{
		Mod_JG_Raetselstein04 = 1;

		Mod_JG_Raetselstein += 1;
	}
	else
	{
		Mod_JG_Raetselstein04 = 0;

		Mod_JG_Raetselstein -= 1;
	};

	Wld_SendTrigger	("EVT_STEIN04");
};

FUNC VOID EVT_STEINSCRIPT05_S0 ()
{
	if (Mod_JG_RaetselWand == 1)
	{
		if (Mod_JG_Raetselstein_Counter > 0)
		{
			if (Mod_JG_Raetselstein_Wert == Mod_JG_Raetselstein)
			{
				Mod_JG_Raetselstein_Counter += 1;

				if (Mod_JG_Raetselstein_Counter == 4)
				{
					B_LogEntry	(TOPIC_MOD_JG_RAETSELWAND, "Geschafft! Jetzt in die letzte Kammer ...");
					B_SetTopicStatus	(TOPIC_MOD_JG_RAETSELWAND, LOG_SUCCESS);

					B_GivePlayerXP	(250);

					Wld_SendTrigger	("EVT_RAETSELWAND_CAM");
					Wld_SendTrigger	("EVT_RAETSELSTEINWAND");
				};
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] -= (hero.attribute[ATR_HITPOINTS_MAX]/2)-1;
			};
		}
		else
		{
			Mod_JG_Raetselstein_Counter = 1;
		};

		Mod_JG_Raetselstein_Wert = Hlp_Random(16);

		MOBNAME_XR_RAETSELSTEIN = IntToString(Mod_JG_Raetselstein_Wert);
	};
};

FUNC VOID EVT_STEINSCRIPT05_S1 ()
{
	if (Mod_JG_RaetselWand == 1)
	{
		if (Mod_JG_Raetselstein_Counter > 0)
		{
			if (Mod_JG_Raetselstein_Wert == Mod_JG_Raetselstein)
			{
				Mod_JG_Raetselstein_Counter += 1;

				if (Mod_JG_Raetselstein_Counter == 4)
				{
					B_LogEntry	(TOPIC_MOD_JG_RAETSELWAND, "Geschafft! Jetzt in die letzte Kammer ...");
					B_SetTopicStatus	(TOPIC_MOD_JG_RAETSELWAND, LOG_SUCCESS);

					B_GivePlayerXP	(250);

					Wld_SendTrigger	("");
				};
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] -= (hero.attribute[ATR_HITPOINTS_MAX]/2)-1;
			};
		}
		else
		{
			Mod_JG_Raetselstein_Counter = 1;
		};

		Mod_JG_Raetselstein_Wert = Hlp_Random(16);

		MOBNAME_XR_RAETSELSTEIN = IntToString(Mod_JG_Raetselstein_Wert);
	};
};

FUNC VOID EVT_DTTELEPORT ()
{
	if (Mod_JG_Khorgor == 1)
	{
		AI_Teleport	(hero, "GOTOWALDIS");
	};
};