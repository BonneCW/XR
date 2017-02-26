FUNC VOID GILDENSTORY_FM()
{
	// FM-Story

	if (CurrentLevel == PATHERION_ZEN)
	{
		if (Npc_IsInState(Mod_1916_KDF_Magier_PAT_UG, ZS_Laehmen))
		|| (Npc_IsInState(Mod_1916_KDF_Magier_PAT_UG, ZS_Unconscious))
		|| (C_BodyStateContains(Mod_1916_KDF_Magier_PAT_UG, BS_UNCONSCIOUS))
		{
			if (Tojan_Counter == 0)
			{
				Wld_InsertNpc	(Mod_1915_KDF_Tojan_PAT_UG, "WP_PAT_UNTERGRUND_06");

				AI_RemoveWeapon	(hero);

				CutsceneAn = TRUE;
			};

			if (Tojan_Counter == 2)
			{
				AI_GotoWP	(hero, "WP_PAT_UNTERGRUND_06");
			};

			if (Tojan_Counter == 3)
			{
				Wld_SendTrigger	("EVT_PAT_UNTERGRUND_VERHOER");
			};

			if (Tojan_Counter == 5)
			{
				AI_Output(Mod_1915_KDF_Tojan_PAT_UG, NULL, "Info_Mod_Tojan_Killer_15_00"); //Wie bist du in das Kloster gekommen?
			};

			if (Tojan_Counter == 10)
			{
				AI_Output(Mod_1916_KDF_Magier_PAT_UG, NULL, "Info_Mod_Tojan_Killer_15_01"); //(lacht) Eine Kleinigkeit für meinen Meister.
			};

			if (Tojan_Counter == 15)
			{
				AI_Output(Mod_1915_KDF_Tojan_PAT_UG, NULL, "Info_Mod_Tojan_Killer_15_02"); //Wie bist du hier reingekommen? Und was hoffst du hier drinnen zu finden?
			};

			if (Tojan_Counter == 20)
			{
				AI_Output(Mod_1916_KDF_Magier_PAT_UG, NULL, "Info_Mod_Tojan_Killer_15_03"); //...
			};

			if (Tojan_Counter == 25)
			{
				AI_Output(Mod_1915_KDF_Tojan_PAT_UG, NULL, "Info_Mod_Tojan_Killer_15_04"); //REDE DU WANZE!
			};

			if (Tojan_Counter == 30)
			{
				AI_Output(Mod_1916_KDF_Magier_PAT_UG, NULL, "Info_Mod_Tojan_Killer_15_05"); //(lacht) Der Feind ... ist oft näher ... als man glaubt!
			};

			if (Tojan_Counter == 35)
			{
				AI_Output(Mod_1915_KDF_Tojan_PAT_UG, NULL, "Info_Mod_Tojan_Killer_15_06"); //Du Wurm!
			};

			if (Tojan_Counter == 40)
			{
				Mod_1916_KDF_Magier_PAT_UG.attribute[ATR_HITPOINTS] = 0;

				AI_StartState		(Mod_1916_KDF_Magier_PAT_UG, ZS_Dead, 1, "");

				Mod_FM_SM_TOT = TRUE;
			};	

			if (Tojan_Counter == 50)
			{
				B_StartOtherRoutine	(Mod_1916_KDF_Magier_PAT_UG, "FLUCHT");	

				AI_Teleport	(Mod_1916_KDF_Magier_PAT_UG, "TOT");

				CutsceneAn = FALSE;
			};

			Tojan_Counter += 1;
		};

		if (Npc_HasItems(hero, ItMi_Focus_Pat) == 5)
		&& (Mod_FM_Foki == 0)
		{	
			Wld_InsertNpc	(Mod_1775_DMB_Beschwoerer_PAT, "WP_PAT_WEG_34");

			B_RemoveNpc	(Mod_7794_KDS_SchwarzerMagier_PAT);

			Mod_FM_Foki = 1;
			
			B_LogEntry(TOPIC_MOD_FM_FOKI, "Ich habe alle fünf Foki. Jetzt sollte ich zurück zu Nagon gehen.");
		};

		if (Mod_FM_Foki == 1)
		&& (Npc_IsDead(Dragon_Black))
		&& (Npc_IsDead(Mod_1775_DMB_Beschwoerer_PAT))
		{
			AI_Output(hero, NULL, "Info_Mod_Hero_Beschwoerer_15_00"); //Ich sollte mal mit Tojan sprechen.

			Mod_FM_Foki = 2;
			
			B_LogEntry(TOPIC_MOD_FM_FOKI, "Ich sollte mal mit Tojan sprechen.");
		};

		if (Npc_KnowsInfo(hero, Info_Mod_Aaron_Hi))
		&& (Mod_FM_Foki == 3)
		&& (Wld_GetDay() > Mod_FM_AaronDay)
		{
			B_StartOtherRoutine	(Mod_1771_KDF_Aaron_PAT, "FALLE");

			Mod_FM_Foki = 4;
		};

		if (Mod_FM_Foki == 5)
		&& (!Npc_IsInState(Mod_1771_KDF_Aaron_PAT, ZS_Talk))
		{
			AI_PlayAni	(Mod_1771_KDF_Aaron_PAT, "T_STAND_2_VICTIM_SLE");

			Mod_FM_Foki = 6;
		};

		if (Mod_FM_Foki == 8)
		&& (!Npc_IsInState(Mod_1746_KDF_Tojan_PAT, ZS_Talk))
		{
			Mod_1746_KDF_Tojan_PAT.guild = GIL_STRF;
			Npc_SetTrueGuild	(Mod_1746_KDF_Tojan_PAT, GIL_STRF);

			Mod_FM_Foki = 9;
		};

		if (Mod_FM_AtHexe == 1)
		&& (!Npc_IsInState(Mod_1859_HEX_Hexenqueen_PAT, ZS_Talk))
		{
			AI_Output(Mod_1859_HEX_Hexenqueen_PAT, NULL, "Info_Mod_Hexenqueen_STOP_17_00"); //Oh nein! Ihr bleibt alle schön, wo ihr seid!

			AI_StartState	(PC_Hero, ZS_MagicFreeze, 0, "");
			AI_StartState	(Mod_1858_KDF_Aaron_PAT, ZS_MagicFreeze, 0, "");

			Mod_FM_AtHexe = 2;
		};

		if (Mod_FM_AtHexe == 2)
		{
			SpeekHexe_Counter += 1;

			if (SpeekHexe_Counter == 5)
			{
				Wld_PlayEffect("FX_EarthQuake",  Mod_1859_HEX_Hexenqueen_PAT, Mod_1859_HEX_Hexenqueen_PAT, 0, 0, 0, FALSE );
				Wld_PlayEffect("spellFX_INCOVATION_RED",  Mod_1859_HEX_Hexenqueen_PAT, Mod_1859_HEX_Hexenqueen_PAT, 0, 0, 0, FALSE );
				AI_PlayAni (Mod_1859_HEX_Hexenqueen_PAT,"T_PRACTICEMAGIC5");
			};

			if (SpeekHexe_Counter == 7)
			{
				Wld_InsertNpc	(Mod_1860_HEX_Onara_PAT, "WP_PAT_TURM_23");
	
				Mod_FM_AtHexe = 3;
			};
		};

		// Regenerationen des Hauptmannes

		if (Mod_1855_PAL_Paladin_PAT.attribute[ATR_HITPOINTS] < Mod_1855_PAL_Paladin_PAT.attribute[ATR_HITPOINTS_MAX])
		&& (!Npc_IsDead(Mod_1855_PAL_Paladin_PAT))
		{
			HP_Reg_Mod_1855_PAL_Paladin_PAT = ((Mod_1855_PAL_Paladin_PAT.attribute[ATR_STRENGTH]+Mod_1855_PAL_Paladin_PAT.attribute[ATR_DEXTERITY])*Mod_1855_PAL_Paladin_PAT.level);

			HP_Reg_Mod_1855_PAL_Paladin_PAT = HP_Reg_Mod_1855_PAL_Paladin_PAT * (100-((Mod_1855_PAL_Paladin_PAT.attribute[ATR_HITPOINTS]*100)/Mod_1855_PAL_Paladin_PAT.attribute[ATR_HITPOINTS_MAX]));

			HP_Reg_Mod_1855_PAL_Paladin_PAT = HP_Reg_Mod_1855_PAL_Paladin_PAT / 100;

			if (HP_Reg_Mod_1855_PAL_Paladin_PAT > 1500)
			{
				HP_Heal_Mod_1855_PAL_Paladin_PAT = HP_Reg_Mod_1855_PAL_Paladin_PAT/1500;
				HP_To_Mod_1855_PAL_Paladin_PAT = 0;
			}
			else
			{
				HP_To_Mod_1855_PAL_Paladin_PAT = 1500/HP_Reg_Mod_1855_PAL_Paladin_PAT;
				HP_Heal_Mod_1855_PAL_Paladin_PAT = 1;
			};

			HP_Counter_Mod_1855_PAL_Paladin_PAT += 1;

			if (HP_Counter_Mod_1855_PAL_Paladin_PAT >= HP_To_Mod_1855_PAL_Paladin_PAT)
			{
				Mod_1855_PAL_Paladin_PAT.attribute[ATR_HITPOINTS] += HP_Heal_Mod_1855_PAL_Paladin_PAT;

				Mod_1855_PAL_Paladin_PAT.aivar[AIV_Damage] += HP_Heal_Mod_1855_PAL_Paladin_PAT;

				HP_Counter_Mod_1855_PAL_Paladin_PAT = 0;
			};

			if (Mod_1855_PAL_Paladin_PAT.attribute[ATR_HITPOINTS] > Mod_1855_PAL_Paladin_PAT.attribute[ATR_HITPOINTS_MAX])
			{
				Mod_1855_PAL_Paladin_PAT.attribute[ATR_HITPOINTS] = Mod_1855_PAL_Paladin_PAT.attribute[ATR_HITPOINTS_MAX];

				Mod_1855_PAL_Paladin_PAT.aivar[AIV_Damage] = Mod_1855_PAL_Paladin_PAT.attribute[ATR_HITPOINTS_MAX];
			};
		};

		if (Mod_1855_PAL_Paladin_PAT.attribute[ATR_MANA] < Mod_1855_PAL_Paladin_PAT.attribute[ATR_MANA_MAX])
		&& (!Npc_IsDead(Mod_1855_PAL_Paladin_PAT))
		{
			Mana_Reg_Mod_1855_PAL_Paladin_PAT = Mod_1855_PAL_Paladin_PAT.attribute[ATR_MANA_MAX]*((Mod_1855_PAL_Paladin_PAT.level));

			Mana_Reg_Mod_1855_PAL_Paladin_PAT = Mana_Reg_Mod_1855_PAL_Paladin_PAT * (100-((Mod_1855_PAL_Paladin_PAT.attribute[ATR_MANA]*100)/Mod_1855_PAL_Paladin_PAT.attribute[ATR_MANA_MAX]));

			Mana_Reg_Mod_1855_PAL_Paladin_PAT = Mana_Reg_Mod_1855_PAL_Paladin_PAT / 100;

			if (Mana_Reg_Mod_1855_PAL_Paladin_PAT > 1000)
			{
				Mana_Heal_Mod_1855_PAL_Paladin_PAT = Mana_Reg_Mod_1855_PAL_Paladin_PAT/1000;
				Mana_To_Mod_1855_PAL_Paladin_PAT = 0;
			}
			else
			{
				Mana_To_Mod_1855_PAL_Paladin_PAT = 1000/Mana_Reg_Mod_1855_PAL_Paladin_PAT;
				Mana_Heal_Mod_1855_PAL_Paladin_PAT = 1;
			};

			Mana_Counter_Mod_1855_PAL_Paladin_PAT += 1;

			if (Mana_Counter_Mod_1855_PAL_Paladin_PAT >= Mana_To_Mod_1855_PAL_Paladin_PAT)
			{
				Mod_1855_PAL_Paladin_PAT.attribute[ATR_MANA] += Mana_Heal_Mod_1855_PAL_Paladin_PAT;

				Mana_Counter_Mod_1855_PAL_Paladin_PAT = 0;
			};

			if (Mod_1855_PAL_Paladin_PAT.attribute[ATR_MANA] > Mod_1855_PAL_Paladin_PAT.attribute[ATR_MANA_MAX])
			{
				Mod_1855_PAL_Paladin_PAT.attribute[ATR_MANA] = Mod_1855_PAL_Paladin_PAT.attribute[ATR_MANA_MAX];
			};
		};

		// Regenerationen des Paladins

		if (Mod_1856_PAL_Paladin_PAT.attribute[ATR_HITPOINTS] < Mod_1856_PAL_Paladin_PAT.attribute[ATR_HITPOINTS_MAX])
		&& (!Npc_IsDead(Mod_1856_PAL_Paladin_PAT))
		{
			HP_Reg_Mod_1856_PAL_Paladin_PAT = ((Mod_1856_PAL_Paladin_PAT.attribute[ATR_STRENGTH]+Mod_1856_PAL_Paladin_PAT.attribute[ATR_DEXTERITY])*Mod_1856_PAL_Paladin_PAT.level);

			HP_Reg_Mod_1856_PAL_Paladin_PAT = HP_Reg_Mod_1856_PAL_Paladin_PAT * (100-((Mod_1856_PAL_Paladin_PAT.attribute[ATR_HITPOINTS]*100)/Mod_1856_PAL_Paladin_PAT.attribute[ATR_HITPOINTS_MAX]));

			HP_Reg_Mod_1856_PAL_Paladin_PAT = HP_Reg_Mod_1856_PAL_Paladin_PAT / 100;

			if (HP_Reg_Mod_1856_PAL_Paladin_PAT > 1500)
			{
				HP_Heal_Mod_1856_PAL_Paladin_PAT = HP_Reg_Mod_1856_PAL_Paladin_PAT/1500;
				HP_To_Mod_1856_PAL_Paladin_PAT = 0;
			}
			else
			{
				HP_To_Mod_1856_PAL_Paladin_PAT = 1500/HP_Reg_Mod_1856_PAL_Paladin_PAT;
				HP_Heal_Mod_1856_PAL_Paladin_PAT = 1;
			};

			HP_Counter_Mod_1856_PAL_Paladin_PAT += 1;

			if (HP_Counter_Mod_1856_PAL_Paladin_PAT >= HP_To_Mod_1856_PAL_Paladin_PAT)
			{
				Mod_1856_PAL_Paladin_PAT.attribute[ATR_HITPOINTS] += HP_Heal_Mod_1856_PAL_Paladin_PAT;

				HP_Counter_Mod_1856_PAL_Paladin_PAT = 0;

				Mod_1856_PAL_Paladin_PAT.aivar[AIV_Damage] += HP_Heal_Mod_1856_PAL_Paladin_PAT;
			};

			if (Mod_1856_PAL_Paladin_PAT.attribute[ATR_HITPOINTS] > Mod_1856_PAL_Paladin_PAT.attribute[ATR_HITPOINTS_MAX])
			{
				Mod_1856_PAL_Paladin_PAT.attribute[ATR_HITPOINTS] = Mod_1856_PAL_Paladin_PAT.attribute[ATR_HITPOINTS_MAX];

				Mod_1856_PAL_Paladin_PAT.aivar[AIV_Damage] = Mod_1856_PAL_Paladin_PAT.attribute[ATR_HITPOINTS_MAX];
			};
		};

		if (Mod_1856_PAL_Paladin_PAT.attribute[ATR_MANA] < Mod_1856_PAL_Paladin_PAT.attribute[ATR_MANA_MAX])
		&& (!Npc_IsDead(Mod_1856_PAL_Paladin_PAT))
		{
			Mana_Reg_Mod_1856_PAL_Paladin_PAT = Mod_1856_PAL_Paladin_PAT.attribute[ATR_MANA_MAX]*((Mod_1856_PAL_Paladin_PAT.level));

			Mana_Reg_Mod_1856_PAL_Paladin_PAT = Mana_Reg_Mod_1856_PAL_Paladin_PAT * (100-((Mod_1856_PAL_Paladin_PAT.attribute[ATR_MANA]*100)/Mod_1856_PAL_Paladin_PAT.attribute[ATR_MANA_MAX]));

			Mana_Reg_Mod_1856_PAL_Paladin_PAT = Mana_Reg_Mod_1856_PAL_Paladin_PAT / 100;

			if (Mana_Reg_Mod_1856_PAL_Paladin_PAT > 1000)
			{
				Mana_Heal_Mod_1856_PAL_Paladin_PAT = Mana_Reg_Mod_1856_PAL_Paladin_PAT/1000;
				Mana_To_Mod_1856_PAL_Paladin_PAT = 0;
			}
			else
			{
				Mana_To_Mod_1856_PAL_Paladin_PAT = 1000/Mana_Reg_Mod_1856_PAL_Paladin_PAT;
				Mana_Heal_Mod_1856_PAL_Paladin_PAT = 1;
			};

			Mana_Counter_Mod_1856_PAL_Paladin_PAT += 1;

			if (Mana_Counter_Mod_1856_PAL_Paladin_PAT >= Mana_To_Mod_1856_PAL_Paladin_PAT)
			{
				Mod_1856_PAL_Paladin_PAT.attribute[ATR_MANA] += Mana_Heal_Mod_1856_PAL_Paladin_PAT;

				Mana_Counter_Mod_1856_PAL_Paladin_PAT = 0;
			};

			if (Mod_1856_PAL_Paladin_PAT.attribute[ATR_MANA] > Mod_1856_PAL_Paladin_PAT.attribute[ATR_MANA_MAX])
			{
				Mod_1856_PAL_Paladin_PAT.attribute[ATR_MANA] = Mod_1856_PAL_Paladin_PAT.attribute[ATR_MANA_MAX];
			};
		};

		// Regenerationen des Ordenspriesters

		if (Mod_1857_KDF_Magier_PAT.attribute[ATR_HITPOINTS] < Mod_1857_KDF_Magier_PAT.attribute[ATR_HITPOINTS_MAX])
		&& (!Npc_IsDead(Mod_1857_KDF_Magier_PAT))
		{
			HP_Reg_Mod_1857_KDF_Magier_PAT = ((Mod_1857_KDF_Magier_PAT.attribute[ATR_STRENGTH]+Mod_1857_KDF_Magier_PAT.attribute[ATR_DEXTERITY])*Mod_1857_KDF_Magier_PAT.level);

			HP_Reg_Mod_1857_KDF_Magier_PAT = HP_Reg_Mod_1857_KDF_Magier_PAT * (100-((Mod_1857_KDF_Magier_PAT.attribute[ATR_HITPOINTS]*100)/Mod_1857_KDF_Magier_PAT.attribute[ATR_HITPOINTS_MAX]));

			HP_Reg_Mod_1857_KDF_Magier_PAT = HP_Reg_Mod_1857_KDF_Magier_PAT / 100;

			if (HP_Reg_Mod_1857_KDF_Magier_PAT > 1500)
			{
				HP_Heal_Mod_1857_KDF_Magier_PAT = HP_Reg_Mod_1857_KDF_Magier_PAT/1500;
				HP_To_Mod_1857_KDF_Magier_PAT = 0;
			}
			else
			{
				HP_To_Mod_1857_KDF_Magier_PAT = 1500/HP_Reg_Mod_1857_KDF_Magier_PAT;
				HP_Heal_Mod_1857_KDF_Magier_PAT = 1;
			};

			HP_Counter_Mod_1857_KDF_Magier_PAT += 1;

			if (HP_Counter_Mod_1857_KDF_Magier_PAT >= HP_To_Mod_1857_KDF_Magier_PAT)
			{
				Mod_1857_KDF_Magier_PAT.attribute[ATR_HITPOINTS] += HP_Heal_Mod_1857_KDF_Magier_PAT;

				Mod_1857_KDF_Magier_PAT.aivar[AIV_Damage] += HP_Heal_Mod_1857_KDF_Magier_PAT;

				HP_Counter_Mod_1857_KDF_Magier_PAT = 0;
			};

			if (Mod_1857_KDF_Magier_PAT.attribute[ATR_HITPOINTS] > Mod_1857_KDF_Magier_PAT.attribute[ATR_HITPOINTS_MAX])
			{
				Mod_1857_KDF_Magier_PAT.attribute[ATR_HITPOINTS] = Mod_1857_KDF_Magier_PAT.attribute[ATR_HITPOINTS_MAX];

				Mod_1857_KDF_Magier_PAT.aivar[AIV_Damage] = Mod_1857_KDF_Magier_PAT.attribute[ATR_HITPOINTS_MAX];
			};
		};

		if (Mod_1857_KDF_Magier_PAT.attribute[ATR_MANA] < Mod_1857_KDF_Magier_PAT.attribute[ATR_MANA_MAX])
		&& (!Npc_IsDead(Mod_1857_KDF_Magier_PAT))
		{
			Mana_Reg_Mod_1857_KDF_Magier_PAT = Mod_1857_KDF_Magier_PAT.attribute[ATR_MANA_MAX]*((Mod_1857_KDF_Magier_PAT.level));

			Mana_Reg_Mod_1857_KDF_Magier_PAT = Mana_Reg_Mod_1857_KDF_Magier_PAT * (100-((Mod_1857_KDF_Magier_PAT.attribute[ATR_MANA]*100)/Mod_1857_KDF_Magier_PAT.attribute[ATR_MANA_MAX]));

			Mana_Reg_Mod_1857_KDF_Magier_PAT = Mana_Reg_Mod_1857_KDF_Magier_PAT / 100;

			if (Mana_Reg_Mod_1857_KDF_Magier_PAT > 1000)
			{
				Mana_Heal_Mod_1857_KDF_Magier_PAT = Mana_Reg_Mod_1857_KDF_Magier_PAT/1000;
				Mana_To_Mod_1857_KDF_Magier_PAT = 0;
			}
			else
			{
				Mana_To_Mod_1857_KDF_Magier_PAT = 1000/Mana_Reg_Mod_1857_KDF_Magier_PAT;
				Mana_Heal_Mod_1857_KDF_Magier_PAT = 1;
			};

			Mana_Counter_Mod_1857_KDF_Magier_PAT += 1;

			if (Mana_Counter_Mod_1857_KDF_Magier_PAT >= Mana_To_Mod_1857_KDF_Magier_PAT)
			{
				Mod_1857_KDF_Magier_PAT.attribute[ATR_MANA] += Mana_Heal_Mod_1857_KDF_Magier_PAT;

				Mana_Counter_Mod_1857_KDF_Magier_PAT = 0;
			};

			if (Mod_1857_KDF_Magier_PAT.attribute[ATR_MANA] > Mod_1857_KDF_Magier_PAT.attribute[ATR_MANA_MAX])
			{
				Mod_1857_KDF_Magier_PAT.attribute[ATR_MANA] = Mod_1857_KDF_Magier_PAT.attribute[ATR_MANA_MAX];
			};
		};

		// Regenerationen des Schwarzen Kriegers

		if (Mod_7333_KDS_SchwarzerMagier_PAT.attribute[ATR_HITPOINTS] < Mod_7333_KDS_SchwarzerMagier_PAT.attribute[ATR_HITPOINTS_MAX])
		&& (!Npc_IsDead(Mod_7333_KDS_SchwarzerMagier_PAT))
		{
			HP_Reg_Mod_7333_KDS_SchwarzerMagier_PAT = ((Mod_7333_KDS_SchwarzerMagier_PAT.attribute[ATR_STRENGTH]+Mod_7333_KDS_SchwarzerMagier_PAT.attribute[ATR_DEXTERITY])*Mod_7333_KDS_SchwarzerMagier_PAT.level);

			HP_Reg_Mod_7333_KDS_SchwarzerMagier_PAT = HP_Reg_Mod_7333_KDS_SchwarzerMagier_PAT * (100-((Mod_7333_KDS_SchwarzerMagier_PAT.attribute[ATR_HITPOINTS]*100)/Mod_7333_KDS_SchwarzerMagier_PAT.attribute[ATR_HITPOINTS_MAX]));

			HP_Reg_Mod_7333_KDS_SchwarzerMagier_PAT = HP_Reg_Mod_7333_KDS_SchwarzerMagier_PAT / 100;

			if (HP_Reg_Mod_7333_KDS_SchwarzerMagier_PAT > 1500)
			{
				HP_Heal_Mod_7333_KDS_SchwarzerMagier_PAT = HP_Reg_Mod_7333_KDS_SchwarzerMagier_PAT/1500;
				HP_To_Mod_7333_KDS_SchwarzerMagier_PAT = 0;
			}
			else
			{
				HP_To_Mod_7333_KDS_SchwarzerMagier_PAT = 1500/HP_Reg_Mod_7333_KDS_SchwarzerMagier_PAT;
				HP_Heal_Mod_7333_KDS_SchwarzerMagier_PAT = 1;
			};

			HP_Counter_Mod_7333_KDS_SchwarzerMagier_PAT += 1;

			if (HP_Counter_Mod_7333_KDS_SchwarzerMagier_PAT >= HP_To_Mod_7333_KDS_SchwarzerMagier_PAT)
			{
				Mod_7333_KDS_SchwarzerMagier_PAT.attribute[ATR_HITPOINTS] += HP_Heal_Mod_7333_KDS_SchwarzerMagier_PAT;

				Mod_7333_KDS_SchwarzerMagier_PAT.aivar[AIV_Damage] += HP_Heal_Mod_7333_KDS_SchwarzerMagier_PAT;

				HP_Counter_Mod_7333_KDS_SchwarzerMagier_PAT = 0;
			};

			if (Mod_7333_KDS_SchwarzerMagier_PAT.attribute[ATR_HITPOINTS] > Mod_7333_KDS_SchwarzerMagier_PAT.attribute[ATR_HITPOINTS_MAX])
			{
				Mod_7333_KDS_SchwarzerMagier_PAT.attribute[ATR_HITPOINTS] = Mod_7333_KDS_SchwarzerMagier_PAT.attribute[ATR_HITPOINTS_MAX];

				Mod_7333_KDS_SchwarzerMagier_PAT.aivar[AIV_Damage] = Mod_7333_KDS_SchwarzerMagier_PAT.attribute[ATR_HITPOINTS_MAX];
			};
		};

		if (Mod_7333_KDS_SchwarzerMagier_PAT.attribute[ATR_MANA] < Mod_7333_KDS_SchwarzerMagier_PAT.attribute[ATR_MANA_MAX])
		&& (!Npc_IsDead(Mod_7333_KDS_SchwarzerMagier_PAT))
		{
			Mana_Reg_Mod_7333_KDS_SchwarzerMagier_PAT = Mod_7333_KDS_SchwarzerMagier_PAT.attribute[ATR_MANA_MAX]*((Mod_7333_KDS_SchwarzerMagier_PAT.level));

			Mana_Reg_Mod_7333_KDS_SchwarzerMagier_PAT = Mana_Reg_Mod_7333_KDS_SchwarzerMagier_PAT * (100-((Mod_7333_KDS_SchwarzerMagier_PAT.attribute[ATR_MANA]*100)/Mod_7333_KDS_SchwarzerMagier_PAT.attribute[ATR_MANA_MAX]));

			Mana_Reg_Mod_7333_KDS_SchwarzerMagier_PAT = Mana_Reg_Mod_7333_KDS_SchwarzerMagier_PAT / 100;

			if (Mana_Reg_Mod_7333_KDS_SchwarzerMagier_PAT > 1000)
			{
				Mana_Heal_Mod_7333_KDS_SchwarzerMagier_PAT = Mana_Reg_Mod_7333_KDS_SchwarzerMagier_PAT/1000;
				Mana_To_Mod_7333_KDS_SchwarzerMagier_PAT = 0;
			}
			else
			{
				Mana_To_Mod_7333_KDS_SchwarzerMagier_PAT = 1000/Mana_Reg_Mod_7333_KDS_SchwarzerMagier_PAT;
				Mana_Heal_Mod_7333_KDS_SchwarzerMagier_PAT = 1;
			};

			Mana_Counter_Mod_7333_KDS_SchwarzerMagier_PAT += 1;

			if (Mana_Counter_Mod_7333_KDS_SchwarzerMagier_PAT >= Mana_To_Mod_7333_KDS_SchwarzerMagier_PAT)
			{
				Mod_7333_KDS_SchwarzerMagier_PAT.attribute[ATR_MANA] += Mana_Heal_Mod_7333_KDS_SchwarzerMagier_PAT;

				Mana_Counter_Mod_7333_KDS_SchwarzerMagier_PAT = 0;
			};

			if (Mod_7333_KDS_SchwarzerMagier_PAT.attribute[ATR_MANA] > Mod_7333_KDS_SchwarzerMagier_PAT.attribute[ATR_MANA_MAX])
			{
				Mod_7333_KDS_SchwarzerMagier_PAT.attribute[ATR_MANA] = Mod_7333_KDS_SchwarzerMagier_PAT.attribute[ATR_MANA_MAX];
			};
		};

		// Regenerationen des Schwarzmagiers

		if (Mod_7332_SMK_SchwarzerKrieger_PAT.attribute[ATR_HITPOINTS] < Mod_7332_SMK_SchwarzerKrieger_PAT.attribute[ATR_HITPOINTS_MAX])
		&& (!Npc_IsDead(Mod_7332_SMK_SchwarzerKrieger_PAT))
		{
			HP_Reg_Mod_7332_SMK_SchwarzerKrieger_PAT = ((Mod_7332_SMK_SchwarzerKrieger_PAT.attribute[ATR_STRENGTH]+Mod_7332_SMK_SchwarzerKrieger_PAT.attribute[ATR_DEXTERITY])*Mod_7332_SMK_SchwarzerKrieger_PAT.level);

			HP_Reg_Mod_7332_SMK_SchwarzerKrieger_PAT = HP_Reg_Mod_7332_SMK_SchwarzerKrieger_PAT * (100-((Mod_7332_SMK_SchwarzerKrieger_PAT.attribute[ATR_HITPOINTS]*100)/Mod_7332_SMK_SchwarzerKrieger_PAT.attribute[ATR_HITPOINTS_MAX]));

			HP_Reg_Mod_7332_SMK_SchwarzerKrieger_PAT = HP_Reg_Mod_7332_SMK_SchwarzerKrieger_PAT / 100;

			if (HP_Reg_Mod_7332_SMK_SchwarzerKrieger_PAT > 1500)
			{
				HP_Heal_Mod_7332_SMK_SchwarzerKrieger_PAT = HP_Reg_Mod_7332_SMK_SchwarzerKrieger_PAT/1500;
				HP_To_Mod_7332_SMK_SchwarzerKrieger_PAT = 0;
			}
			else
			{
				HP_To_Mod_7332_SMK_SchwarzerKrieger_PAT = 1500/HP_Reg_Mod_7332_SMK_SchwarzerKrieger_PAT;
				HP_Heal_Mod_7332_SMK_SchwarzerKrieger_PAT = 1;
			};

			HP_Counter_Mod_7332_SMK_SchwarzerKrieger_PAT += 1;

			if (HP_Counter_Mod_7332_SMK_SchwarzerKrieger_PAT >= HP_To_Mod_7332_SMK_SchwarzerKrieger_PAT)
			{
				Mod_7332_SMK_SchwarzerKrieger_PAT.attribute[ATR_HITPOINTS] += HP_Heal_Mod_7332_SMK_SchwarzerKrieger_PAT;

				Mod_7332_SMK_SchwarzerKrieger_PAT.aivar[AIV_Damage] += HP_Heal_Mod_7332_SMK_SchwarzerKrieger_PAT;

				HP_Counter_Mod_7332_SMK_SchwarzerKrieger_PAT = 0;
			};

			if (Mod_7332_SMK_SchwarzerKrieger_PAT.attribute[ATR_HITPOINTS] > Mod_7332_SMK_SchwarzerKrieger_PAT.attribute[ATR_HITPOINTS_MAX])
			{
				Mod_7332_SMK_SchwarzerKrieger_PAT.attribute[ATR_HITPOINTS] = Mod_7332_SMK_SchwarzerKrieger_PAT.attribute[ATR_HITPOINTS_MAX];

				Mod_7332_SMK_SchwarzerKrieger_PAT.aivar[AIV_Damage] = Mod_7332_SMK_SchwarzerKrieger_PAT.attribute[ATR_HITPOINTS_MAX];
			};
		};

		if (Mod_7332_SMK_SchwarzerKrieger_PAT.attribute[ATR_MANA] < Mod_7332_SMK_SchwarzerKrieger_PAT.attribute[ATR_MANA_MAX])
		&& (!Npc_IsDead(Mod_7332_SMK_SchwarzerKrieger_PAT))
		{
			Mana_Reg_Mod_7332_SMK_SchwarzerKrieger_PAT = Mod_7332_SMK_SchwarzerKrieger_PAT.attribute[ATR_MANA_MAX]*((Mod_7332_SMK_SchwarzerKrieger_PAT.level));

			Mana_Reg_Mod_7332_SMK_SchwarzerKrieger_PAT = Mana_Reg_Mod_7332_SMK_SchwarzerKrieger_PAT * (100-((Mod_7332_SMK_SchwarzerKrieger_PAT.attribute[ATR_MANA]*100)/Mod_7332_SMK_SchwarzerKrieger_PAT.attribute[ATR_MANA_MAX]));

			Mana_Reg_Mod_7332_SMK_SchwarzerKrieger_PAT = Mana_Reg_Mod_7332_SMK_SchwarzerKrieger_PAT / 100;

			if (Mana_Reg_Mod_7332_SMK_SchwarzerKrieger_PAT > 1000)
			{
				Mana_Heal_Mod_7332_SMK_SchwarzerKrieger_PAT = Mana_Reg_Mod_7332_SMK_SchwarzerKrieger_PAT/1000;
				Mana_To_Mod_7332_SMK_SchwarzerKrieger_PAT = 0;
			}
			else
			{
				Mana_To_Mod_7332_SMK_SchwarzerKrieger_PAT = 1000/Mana_Reg_Mod_7332_SMK_SchwarzerKrieger_PAT;
				Mana_Heal_Mod_7332_SMK_SchwarzerKrieger_PAT = 1;
			};

			Mana_Counter_Mod_7332_SMK_SchwarzerKrieger_PAT += 1;

			if (Mana_Counter_Mod_7332_SMK_SchwarzerKrieger_PAT >= Mana_To_Mod_7332_SMK_SchwarzerKrieger_PAT)
			{
				Mod_7332_SMK_SchwarzerKrieger_PAT.attribute[ATR_MANA] += Mana_Heal_Mod_7332_SMK_SchwarzerKrieger_PAT;

				Mana_Counter_Mod_7332_SMK_SchwarzerKrieger_PAT = 0;
			};

			if (Mod_7332_SMK_SchwarzerKrieger_PAT.attribute[ATR_MANA] > Mod_7332_SMK_SchwarzerKrieger_PAT.attribute[ATR_MANA_MAX])
			{
				Mod_7332_SMK_SchwarzerKrieger_PAT.attribute[ATR_MANA] = Mod_7332_SMK_SchwarzerKrieger_PAT.attribute[ATR_MANA_MAX];
			};
		};

		// Auren und Kristalle

		if (Npc_KnowsInfo(hero, Info_Mod_Velario_MangelQuest2))
		&& (Wld_GetDay() > Mod_PAT_VelarioDay)
		&& (Mod_Enter_PAT_Second == TRUE)
		&& (Mod_PAT_Velario == 0)
		{
			Mod_PAT_Velario = 1;

			B_StartOtherRoutine	(Mod_1738_KDF_Velario_PAT, "RUNEMAKER");
		};

		// Foki sammeln

		if (Mod_PAT_Focus_01 == 0)
		&& (Npc_IsDead(Demon_PAT_01))
		&& (Npc_IsDead(Demon_PAT_02))
		{
			Mod_PAT_Focus_01 = 1;

			B_LogEntry	(TOPIC_MOD_FM_FOKI, "Zwei Dämonen für einen Mann. Das sollte die Tugend Mut gewesen sein.");
		};
	};

	if (CurrentLevel == NEWWORLD_ZEN)
	{
		// Pyrokar will nicht weg, bevor alles in Ordnung ist

		if (AUFSUCHENACHSEELENSTEINE == 0)
		&& (Npc_KnowsInfo(hero, Info_Mod_Aaron_Party))
		&& (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Goetterschwerter))
		{
			AUFSUCHENACHSEELENSTEINE = 1;
		};

		// Nachtschicht für Marduk

		if (Mod_Marduk_Gestampft == FALSE)
		{
			if (Npc_KnowsInfo(hero, Info_Mod_Marduk_Nachtschicht))
			&& (C_BodyStateContains(hero, BS_MOBINTERACT))
			&& (Npc_GetDistToWP(hero, "NW_MONASTERY_WINEMAKER_04") < 1000)
			{
				Mod_Marduk_StampfZeit += 1;

				if (Mod_Marduk_StampfZeit >= 600)
				{
					Mod_Marduk_Gestampft = TRUE;

					B_BlessAttribute (hero, ATR_STRENGTH, 1);

					B_LogEntry	(TOPIC_MOD_MARDUK_NACHTSCHICHT, "Ich habe wohl genug Weintrauben für Marduk gestampft.");
				};
			};
		};

		// Feuer gegen Eis

		if (Mod_FM_FeuerEis == 0)
		{
			if (Npc_KnowsInfo(hero, Info_Mod_Hyglas_FeuerGegenEis))
			&& (!Npc_IsInState(Mod_918_KDF_Hyglas_NW, ZS_Talk))
			{
				AI_Teleport	(Mod_918_KDF_Hyglas_NW, "NW_TAVERNE");
				B_StartOtherRoutine	(Mod_918_KDF_Hyglas_NW, "TAVERNE");

				B_StartOtherRoutine	(Mod_776_NONE_Orlan_NW, "VORTAVERNE");

				AI_Teleport	(hero, "NW_TAVERNE");

				Mod_FM_FeuerEis = 1;
			};
		};

		if (Mod_FM_FeuerEis == 1)
		{
			if (Npc_KnowsInfo(hero, Info_Mod_Hyglas_FeuerGegenEis4))
			&& (Npc_GetDistToWP(Mod_918_KDF_Hyglas_NW, "WP_STEINKREIS_05") < 500)
			{
				Wld_InsertNpc	(IceGolem_FeuerGegenEis_02,	"WP_STEINKREIS_05");
				Wld_InsertNpc	(IceGolem_FeuerGegenEis_03,	"WP_STEINKREIS_05");
				Wld_InsertNpc	(IceGolem_FeuerGegenEis_04,	"WP_STEINKREIS_05");

				Mod_FM_FeuerEis = 2;
			};
		};

		if (Mod_FM_FeuerEis == 2)
		{
			if (Npc_KnowsInfo(hero, Info_Mod_Hyglas_FeuerGegenEis5))
			&& (!Npc_IsInState(Mod_918_KDF_Hyglas_NW, ZS_Talk))
			{
				AI_Teleport	(hero, "WP_EISHOEHLE_01");

				AI_Teleport	(Mod_918_KDF_Hyglas_NW, "WP_EISHOEHLE_01");

				B_StartOtherRoutine	(Mod_918_KDF_Hyglas_NW, "EISHOEHLE");

				Mod_FM_FeuerEis = 3;
			};
		};

		if (Mod_FM_Hyglas_Eisgebiet == 2)
		{
			Mod_FM_Hyglas_Eisgebiet = 3;

			B_StartOtherRoutine	(Mod_918_KDF_Hyglas_NW, "PREDIGER");
		};
	};

	if (CurrentLevel == EISGEBIET_ZEN)
	{
		// Feuersbrunst am See

		if (Npc_KnowsInfo(hero, Info_Mod_Hyglas_EIS_Feuersbrunst))
		&& (Npc_GetDistToNpc(hero, Mod_7793_KDF_Hyglas_EIS) > 5000)
		&& (Mod_FM_Hyglas_Eisgebiet == 0)
		{
			Mod_FM_Hyglas_Eisgebiet = 1;
			Mod_FM_Hyglas_Eisgebiet_Day = Wld_GetDay();

			B_StartOtherRoutine	(Mod_7793_KDF_Hyglas_EIS, "ATTHYS");
			B_StartOtherRoutine	(Mod_1954_EIS_Thys_EIS, "ATTHYS");
		};

		if (Wld_GetDay() > Mod_FM_Hyglas_Eisgebiet_Day)
		&& (Mod_FM_Hyglas_Eisgebiet == 1)
		{
			Mod_FM_Hyglas_Eisgebiet = 2;

			B_RemoveNpc	(Mod_7793_KDF_Hyglas_EIS);

			B_StartOtherRoutine	(Mod_1954_EIS_Thys_EIS, "START");
		};
	};
};