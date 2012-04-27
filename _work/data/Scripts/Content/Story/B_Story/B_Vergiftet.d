var int Mod_Blutschaden;

FUNC VOID B_Vergiftet(var C_NPC slf)
{
	if (slf.aivar[AIV_GiftTime] < Mod_GiftCounter)
	{
		if (slf.id >= 13000)
		&& (slf.id < 14000)
		&& (Npc_GetDistToNpc(slf, hero) < 500)
		{
			if (Mod_LichtAn_Pal > 0)
			{
				B_MagicHurtNpc	(hero, slf, 300);
			}
			else if (Mod_LichtAn_Normal > 0)
			{
				B_MagicHurtNpc	(hero, slf, 100);
			};
		};

		if (slf.aivar[AIV_Blutet] > 0)
		&& (!Npc_IsDead(slf))
		{
			slf.aivar[AIV_Blutet] -= 1;

			Mod_Blutschaden = slf.attribute[ATR_HITPOINTS_MAX]/25;

			if (slf.attribute[ATR_HITPOINTS]-20 <= 0)
			{
				Mod_Blutschaden = slf.attribute[ATR_HITPOINTS]-1;
			};

			if (Mod_Blutschaden < 2)
			{
				Mod_Blutschaden = 2;
			};

			if (slf.attribute[ATR_HITPOINTS] <= 0)
			{
				B_GivePlayerXP(XP_PER_VICTORY*slf.level);
			};

			B_MagicHurtNpc (hero, slf, Mod_Blutschaden);
		};

		if (Npc_GetDistToNpc(slf, hero) < 500)
		{
			if (Mod_AuraFrost == 1)
			&& (Mod_AuraFrost_Counter%3 == 0)
			&& (slf.aivar[AIV_Partymember] == FALSE)
			{
				B_MagicHurtNpc	(hero, slf, SPL_Damage_LightningFlash);

				Npc_ClearAIQueue	(slf);
				B_ClearPerceptions	(slf);
				AI_StartState (slf, ZS_MagicMiniFreeze, 0, "");
			};

			if (Mod_AuraFeuer == 1)
			&& (Mod_AuraFeuer_Counter%3 == 0)
			&& (slf.aivar[AIV_Partymember] == FALSE)
			{
				B_MagicHurtNpc	(hero, slf, SPL_Damage_InstantFireball);
			};

			if (Mod_AuraHeilung == 1)
			&& (slf.aivar[AIV_Partymember] == TRUE)
			{
				slf.attribute[ATR_HITPOINTS] += slf.attribute[ATR_HITPOINTS_MAX]/10;

				if (slf.attribute[ATR_HITPOINTS] > slf.attribute[ATR_HITPOINTS_MAX])
				{
					slf.attribute[ATR_HITPOINTS] = slf.attribute[ATR_HITPOINTS_MAX];
				};

				slf.aivar[AIV_Damage] = slf.attribute[ATR_HITPOINTS];
			};
		};

		if (slf.aivar[AIV_Pflanzengift] > 0)
		{
			if (slf.guild == GIL_STONEGOLEM)
			|| (slf.guild == GIL_ICEGOLEM)
			|| (slf.guild == GIL_FIREGOLEM)
			|| (slf.guild == GIL_SWAMPGOLEM)
			|| (C_NpcIsUndead(slf))
			{
				// immun
			}
			else if (slf.guild == GIL_DRACONIAN)
			|| (slf.guild == GIL_DRAGON)
			|| (slf.guild == GIL_DEMON)
			|| (slf.guild == GIL_SWAMPSHARK)
			{
				B_MagicHurtNpc	(hero, slf, 1);
			}
			else
			{
				B_MagicHurtNpc	(hero, slf, 3);
			};

			slf.aivar[AIV_Pflanzengift] -= 1;
		};

		if (slf.aivar[AIV_Tiergift] > 0)
		{
			if (slf.guild == GIL_STONEGOLEM)
			|| (slf.guild == GIL_ICEGOLEM)
			|| (slf.guild == GIL_FIREGOLEM)
			|| (slf.guild == GIL_SWAMPGOLEM)
			|| (C_NpcIsUndead(slf))
			{
				// immun
			}
			else if (slf.guild == GIL_BLOODFLY)
			|| (slf.guild == GIL_MINECRAWLER)
			|| (slf.guild == GIL_SWAMPSHARK)
			{
				// Resistenz

				B_MagicHurtNpc	(hero, slf, 2);				
			}
			else if (slf.guild == GIL_DRACONIAN)
			|| (slf.guild == GIL_DRAGON)
			|| (slf.guild == GIL_DEMON)
			{
				B_MagicHurtNpc	(hero, slf, 3);
			}
			else
			{
				B_MagicHurtNpc	(hero, slf, 5);
			};

			slf.aivar[AIV_Tiergift] -= 1;
		};

		if (slf.aivar[AIV_Siechtum] > 0)
		&& (slf.guild > GIL_SEPERATOR_HUM)
		&& (slf.guild != GIL_ORC)
		&& (slf.guild != GIL_FRIENDLY_ORC)
		&& (slf.guild != GIL_DRACONIAN)
		{
			B_MagicHurtNpc	(hero, slf, 2);

			slf.aivar[AIV_Siechtum] -= 1;
		};

		if (Mod_AuraFlammen == 1)
		{
			if (Mod_AuraFlammen_Counter%3 == 0)
			{
				var int fldmg; fldmg = 120-slf.protection[PROT_MAGIC];

				if (fldmg < 5)
				{
					fldmg = 5;
				};

				B_MagicHurtNpc	(hero, slf, fldmg);

				Wld_PlayEffect ("spellFX_Firestorm_COLLIDE", slf, slf, 0, 0, 0, FALSE);

				Mod_AuraFlammen_Used = 1;
			};
		};

		slf.aivar[AIV_Gifttime] = Mod_GiftCounter;		
	};

	if (slf.guild == GIL_MEATBUG)
	&& (Npc_GetDistToNpc(hero, slf) <= 120)
	&& (C_BodyStateContains(hero, BS_RUN))
	&& (slf.flags == 0)
	{
		B_MagicHurtNpc	(hero, slf, 9999);

		Fleischwanzen_Zertrampelt += 1;
	};	

	if ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Swampshark_Fuetterung_02_01))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Swampshark_Fuetterung_02_02))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Swampshark_Fuetterung_02_03))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Swampshark_Fuetterung_02_04))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Swampshark_Fuetterung_02_05)))
	&& (Mod_ImGrenzgebiet == 1)
	&& (slf.attribute[ATR_HITPOINTS] <= slf.attribute[ATR_HITPOINTS_MAX]/2)
	&& (!Npc_IsDead(slf))
	{
		B_MagicHurtNpc	(hero, slf, 99999);

		Mod_EchsenQuest_01_SumpfhaiGeschwaecht += 1;

		if (Mod_EchsenQuest_01_SumpfhaiGeschwaecht == 5)
		{
			Mod_EchsenQuest_01 = 3;

			B_LogEntry	(TOPIC_MOD_ECHSEN_WEIBCHENFUETTERUNG, "Auch die alten Weibchen sind versorgt, fehlen nur noch die starken Weibchen. Da reicht es, wenn ich die nächsten fünf Sumpfhaie wie sie sind ins Grenzgebiet locke.");

			Wld_InsertNpc	(Swampshark_Fuetterung_03_01,	"ADW_BANDIT_VP3_05");
			Wld_InsertNpc	(Swampshark_Fuetterung_03_02,	"ADW_BANDIT_VP3_05");
			Wld_InsertNpc	(Swampshark_Fuetterung_03_03,	"ADW_BANDIT_VP3_03");
			Wld_InsertNpc	(Swampshark_Fuetterung_03_04,	"ADW_SHARK_02");
			Wld_InsertNpc	(Swampshark_Fuetterung_03_05,	"ADW_SHARK_01");
		};
	};

	if ((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Swampshark_Fuetterung_03_01))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Swampshark_Fuetterung_03_02))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Swampshark_Fuetterung_03_03))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Swampshark_Fuetterung_03_04))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Swampshark_Fuetterung_03_05)))
	&& (Mod_ImGrenzgebiet == 1)
	&& (!Npc_IsDead(slf))
	{
		B_MagicHurtNpc	(hero, slf, 99999);

		Mod_EchsenQuest_01_SumpfhaiAngelockt += 1;

		if (Mod_EchsenQuest_01_SumpfhaiAngelockt == 5)
		{
			Mod_EchsenQuest_01 = 4;

			B_LogEntry_More	(TOPIC_MOD_ECHSEN_VERTRAUEN, TOPIC_MOD_ECHSEN_WEIBCHENFUETTERUNG, "Ich habe die Weibchen gefüttert.", "Und auch die starken Weibchen haben ihr Futter bekommen.");
			B_SetTopicStatus	(TOPIC_MOD_ECHSEN_WEIBCHENFUETTERUNG, LOG_SUCCESS);
		};
	};

	// Geschrumpfte Gegner sollen zertrampelt werden können wie Fleischwanzen

	if (slf.aivar[AIV_MM_ShrinkState] == 14)
	&& (Npc_GetDistToNpc(hero, slf) <= 100)
	&& (C_BodyStateContains(hero, BS_RUN))
	{
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Sheep))
		|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Hammel))
		|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Wolf))
		|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(BlackWolf))
		|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Warg))
		|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Orcdog))
		|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Giant_Rat))
		{
			B_MagicHurtNpc	(hero, slf, 9999);
		};
	};

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7265_GUR_BaalTavor_OGY))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7261_PSINOV_Novize_OGY))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7262_PSINOV_Novize_OGY))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7263_PSINOV_Novize_OGY))
	|| (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7264_PSINOV_Novize_OGY))
	{
		slf.protection[PROT_MAGIC] = -1;
	};

	// Monster bei Balrog und Gigant schwächen, sobald Bedingungen dafür erfüllt

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(FireGolem_Balrog))
	{
		if (Mod_WM_BlutkultTot == 1)
		&& (Npc_HasItems(hero, ItMi_AbsorbKristall2) == 1)
		{
			slf.attribute[ATR_STRENGTH] = 50;

			if (slf.attribute[ATR_HITPOINTS] > slf.attribute[ATR_HITPOINTS_MAX])
			{
				slf.attribute[ATR_HITPOINTS] = 175;

				slf.aivar[AIV_Damage] = 175;
			};

			slf.attribute[ATR_HITPOINTS_MAX] = 175;
			slf.protection[PROT_EDGE] = 0;
			slf.protection[PROT_BLUNT] = 0;
			slf.protection[PROT_MAGIC] = 0;
			slf.protection[PROT_FIRE] = 0;
			slf.protection[PROT_POINT] = 0;
		}
		else if (Mod_WM_BlutkultTot == 1)
		|| (Npc_HasItems(hero, ItMi_AbsorbKristall2) == 1)
		{
			slf.attribute[ATR_STRENGTH] = 125;

			if (slf.attribute[ATR_HITPOINTS] > slf.attribute[ATR_HITPOINTS_MAX])
			{
				slf.attribute[ATR_HITPOINTS] = 250;

				slf.aivar[AIV_Damage] = 250;
			};

			slf.attribute[ATR_HITPOINTS_MAX] = 250;
			slf.protection[PROT_EDGE] = 35000;
			slf.protection[PROT_BLUNT] = 35000;
			slf.protection[PROT_MAGIC] = 35;
			slf.protection[PROT_FIRE] = 35;
			slf.protection[PROT_POINT] = 35000;
		};
	};

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Feuerteufel_Balrog))
	{
		if (Mod_WM_BlutkultTot == 1)
		&& (Npc_HasItems(hero, ItMi_AbsorbKristall2) == 1)
		{
			slf.attribute[ATR_STRENGTH] = 30;

			if (slf.attribute[ATR_HITPOINTS] > slf.attribute[ATR_HITPOINTS_MAX])
			{
				slf.attribute[ATR_HITPOINTS] = 95;

				slf.aivar[AIV_Damage] = 95;
			};

			slf.attribute[ATR_HITPOINTS_MAX] = 95;
			slf.protection[PROT_EDGE] = 0;
			slf.protection[PROT_BLUNT] = 0;
			slf.protection[PROT_MAGIC] = 0;
			slf.protection[PROT_FIRE] = 0;
			slf.protection[PROT_POINT] = 0;
		}
		else if (Mod_WM_BlutkultTot == 1)
		|| (Npc_HasItems(hero, ItMi_AbsorbKristall2) == 1)
		{
			slf.attribute[ATR_STRENGTH] = 75;

			if (slf.attribute[ATR_HITPOINTS] > slf.attribute[ATR_HITPOINTS_MAX])
			{
				slf.attribute[ATR_HITPOINTS] = 150;

				slf.aivar[AIV_Damage] = 150;
			};

			slf.attribute[ATR_HITPOINTS_MAX] = 150;
			slf.protection[PROT_EDGE] = 35000;
			slf.protection[PROT_BLUNT] = 35000;
			slf.protection[PROT_MAGIC] = 35;
			slf.protection[PROT_FIRE] = 35;
			slf.protection[PROT_POINT] = 35000;
		};
	};

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Demon_Balrog))
	{
		if (Mod_WM_BlutkultTot == 1)
		&& (Npc_HasItems(hero, ItMi_AbsorbKristall2) == 1)
		{
			slf.attribute[ATR_STRENGTH] = 50;

			if (slf.attribute[ATR_HITPOINTS] > slf.attribute[ATR_HITPOINTS_MAX])
			{
				slf.attribute[ATR_HITPOINTS] = 175;

				slf.aivar[AIV_Damage] = 175;
			};

			slf.attribute[ATR_HITPOINTS_MAX] = 175;
			slf.protection[PROT_EDGE] = 0;
			slf.protection[PROT_BLUNT] = 0;
			slf.protection[PROT_MAGIC] = 0;
			slf.protection[PROT_FIRE] = 0;
			slf.protection[PROT_POINT] = 0;
		}
		else if (Mod_WM_BlutkultTot == 1)
		|| (Npc_HasItems(hero, ItMi_AbsorbKristall2) == 1)
		{
			slf.attribute[ATR_STRENGTH] = 125;

			if (slf.attribute[ATR_HITPOINTS] > slf.attribute[ATR_HITPOINTS_MAX])
			{
				slf.attribute[ATR_HITPOINTS] = 250;

				slf.aivar[AIV_Damage] = 250;
			};

			slf.attribute[ATR_HITPOINTS_MAX] = 250;
			slf.protection[PROT_EDGE] = 35000;
			slf.protection[PROT_BLUNT] = 35000;
			slf.protection[PROT_MAGIC] = 35;
			slf.protection[PROT_FIRE] = 35;
			slf.protection[PROT_POINT] = 35000;
		};
	};

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DemonLord_Balrog))
	{
		if (Mod_WM_BlutkultTot == 1)
		&& (Npc_HasItems(hero, ItMi_AbsorbKristall2) == 1)
		{
			slf.attribute[ATR_STRENGTH] = 75;

			if (slf.attribute[ATR_HITPOINTS] > slf.attribute[ATR_HITPOINTS_MAX])
			{
				slf.attribute[ATR_HITPOINTS] = 200;

				slf.aivar[AIV_Damage] = 200;
			};

			slf.attribute[ATR_HITPOINTS_MAX] = 200;
			slf.protection[PROT_EDGE] = 0;
			slf.protection[PROT_BLUNT] = 0;
			slf.protection[PROT_MAGIC] = 0;
			slf.protection[PROT_FIRE] = 0;
			slf.protection[PROT_POINT] = 0;
		}
		else if (Mod_WM_BlutkultTot == 1)
		|| (Npc_HasItems(hero, ItMi_AbsorbKristall2) == 1)
		{
			slf.attribute[ATR_STRENGTH] = 150;

			if (slf.attribute[ATR_HITPOINTS] > slf.attribute[ATR_HITPOINTS_MAX])
			{
				slf.attribute[ATR_HITPOINTS] = 300;

				slf.aivar[AIV_Damage] = 300;
			};

			slf.attribute[ATR_HITPOINTS_MAX] = 300;
			slf.protection[PROT_EDGE] = 35000;
			slf.protection[PROT_BLUNT] = 35000;
			slf.protection[PROT_MAGIC] = 35;
			slf.protection[PROT_FIRE] = 35;
			slf.protection[PROT_POINT] = 35000;
		};
	};

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(DemonWolf_GigantDerVorzeit))
	{
		if (Mod_WM_BlutkultTot == 1)
		&& (Npc_HasItems(hero, ItMi_AbsorbKristall2) == 1)
		{
			slf.attribute[ATR_STRENGTH] = 10;

			if (slf.attribute[ATR_HITPOINTS] > slf.attribute[ATR_HITPOINTS_MAX])
			{
				slf.attribute[ATR_HITPOINTS] = 40;

				slf.aivar[AIV_Damage] = 40;
			};

			slf.attribute[ATR_HITPOINTS_MAX] = 40;
			slf.protection[PROT_EDGE] = 0;
			slf.protection[PROT_BLUNT] = 0;
			slf.protection[PROT_MAGIC] = 0;
			slf.protection[PROT_FIRE] = 0;
			slf.protection[PROT_POINT] = 0;
		}
		else if (Mod_WM_BlutkultTot == 1)
		|| (Npc_HasItems(hero, ItMi_AbsorbKristall2) == 1)
		{
			slf.attribute[ATR_STRENGTH] = 25;

			if (slf.attribute[ATR_HITPOINTS] > slf.attribute[ATR_HITPOINTS_MAX])
			{
				slf.attribute[ATR_HITPOINTS] = 80;

				slf.aivar[AIV_Damage] = 80;
			};

			slf.attribute[ATR_HITPOINTS_MAX] = 80;
			slf.protection[PROT_EDGE] = 5000;
			slf.protection[PROT_BLUNT] = 5000;
			slf.protection[PROT_MAGIC] = 5;
			slf.protection[PROT_FIRE] = 5;
			slf.protection[PROT_POINT] = 5000;
		};
	};

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Swampgolem_GigantDerVorzeit))
	{
		if (Mod_WM_BlutkultTot == 1)
		&& (Npc_HasItems(hero, ItMi_AbsorbKristall2) == 1)
		{
			slf.attribute[ATR_STRENGTH] = 45;

			if (slf.attribute[ATR_HITPOINTS] > slf.attribute[ATR_HITPOINTS_MAX])
			{
				slf.attribute[ATR_HITPOINTS] = 100;

				slf.aivar[AIV_Damage] = 100;
			};

			slf.attribute[ATR_HITPOINTS_MAX] = 100;
			slf.protection[PROT_EDGE] = 0;
			slf.protection[PROT_BLUNT] = 0;
			slf.protection[PROT_MAGIC] = 0;
			slf.protection[PROT_FIRE] = 0;
			slf.protection[PROT_POINT] = 0;
		}
		else if (Mod_WM_BlutkultTot == 1)
		|| (Npc_HasItems(hero, ItMi_AbsorbKristall2) == 1)
		{
			slf.attribute[ATR_STRENGTH] = 75;

			if (slf.attribute[ATR_HITPOINTS] > slf.attribute[ATR_HITPOINTS_MAX])
			{
				slf.attribute[ATR_HITPOINTS] = 150;

				slf.aivar[AIV_Damage] = 150;
			};

			slf.attribute[ATR_HITPOINTS_MAX] = 150;
			slf.protection[PROT_EDGE] = 35000;
			slf.protection[PROT_BLUNT] = 35000;
			slf.protection[PROT_MAGIC] = 35;
			slf.protection[PROT_FIRE] = 35;
			slf.protection[PROT_POINT] = 35000;
		};
	};

	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Mod_7368_JG_Jaeger_NW))
	&& (Npc_KnowsInfo(hero, Info_Mod_Ramsi_KeilerFleischWeg))
	{
		slf.flags = 0;
	};

	// Wenn Hero Standhaft gelernt hat, dann kann ihn kein Gegner mehr wegschleudern

	if (Standfest_Perk == TRUE)
	{
		if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Blutgolem))
		|| (slf.aivar[AIV_MM_REAL_ID] == ID_SWAMPGOLEM)
		|| (slf.guild == GIL_ICEGOLEM)
		|| (slf.guild == GIL_STONEGOLEM)
		|| (slf.guild == GIL_TROLL)
		{
			slf.damageType = DAM_BLUNT;
			slf.damage[DAM_INDEX_FLY] = 0;
		}
		else if (slf.guild == GIL_DRAGON)
		|| (slf.guild == GIL_FIREGOLEM)
		{
			slf.damageType = DAM_FIRE;
			slf.damage[DAM_INDEX_FLY] = 0;
		};
	};
		
	//Print	("Vergiftet");
};