// ****************************************************************
// B_AssessDamage
// --------------
// wird durchWahrnehmung PERC_AssessDamage ÜBERALL her aufgerufen
// (also auch aus ZS_Attack, AR kann sich allerdings NICHT ändern!)
// ****************************************************************

func void B_AssessDamage_Hero ()
{
	if (!C_NpcIsHero(self))
	{
		return;
	};

	if (!Hlp_IsValidNpc(other))
	{
		return;
	};

	if (self.aivar[AIV_Damage] == self.attribute[ATR_HITPOINTS]+1)
	{
		self.attribute[ATR_HITPOINTS] += 1;

		B_CalculateDamage	(self, other);
	}
	else	// Kein Schaden genommen, später hier DefenseBreak ergänzen
	{
		if (self.aivar[AIV_Damage] == self.attribute[ATR_HITPOINTS])
		{
			if (C_CanDefenseBreak(other))
			&& (Hlp_Random(100) < 15)
			{
				B_CalculateDamage(self, other);
			}
			else if (Npc_IsInFightMode(other, FMODE_FAR))
			{
				B_CalculateDamage(self, other);
			}
			else
			{
				return;
			};
		}
		else
		{
			self.aivar[AIV_Damage] = self.attribute[ATR_HITPOINTS];
			
			if (self.flags != 2)
			{
				return;
			};
		};
	};

	if (!Mod_Bloodsplats)
	{
		_B_HeroDamage();
	};

	if (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(SchiffOrk_Berserker))
	{
		AI_Teleport	(hero, "WP_SS_BACK");
		Wld_PlayEffect("BLACK_SCREEN", hero, hero, 0, 0, 0, TRUE);

		return;
	};
	
	if (HEROISTKEINZOMBIE == FALSE)
	{
		return;
	};

	var int GiftChance;

	GiftChance = 0;

	var int armor;

	armor = ((hero.protection[PROT_EDGE] + hero.protection[PROT_POINT])/1000) + hero.protection[PROT_FIRE] + hero.protection[PROT_MAGIC];

	armor = armor/4;

	var C_ITEM arm;
	arm = Npc_GetEquippedArmor(hero);

	if (Hlp_IsItem(arm, ItAr_BDT_XL) == TRUE)
	{
		armor = armor*5;
	};

	// Als Skelett und Golem immun gegen Vergiftung und Krankheit

	if (Mod_TrfSkeleton2 == 1)
	{
		return;
	};

	if (Mod_IstGolem == 1)
	{
		return;
	};

	if (Mod_GiftNeutralisierung > 0)
	{
		return;
	};

	// Gifte

	// Gewächsgifte

	// Pflanzengift

	if (other.aivar[AIV_MM_REAL_ID] == ID_SWAMPGOLEM)
	&& (Pflanzengift < 4)
	&& (GGPf_Sumpfgolem_Time == 0)
	{
		// Wahrscheinlichkeit, eine Vergiftung zu erleiden

		if (Gift == 0)
		{
			GiftChance = 30;
		}
		else if (Gift == 1)
		{
			GiftChance = 25;
		}
		else if (Gift == 2)
		{
			GiftChance = 21;
		}
		else if (Gift == 3)
		{
			GiftChance = 18;
		};

		GiftChance = GiftChance - ((GiftChance*armor)/100);

		if (Hlp_Random(100) < GiftChance)
		{
			// Zeit erhöhen

			if (Pflanzengift == 0)
			{
				GGPf_Sumpfgolem_Time += 40;
			}
			else if (Pflanzengift == 1) // 25% weniger
			{
				GGPf_Sumpfgolem_Time += 30;
			}
			else if (Pflanzengift == 2) // 50% weniger
			{
				GGPf_Sumpfgolem_Time += 20;
			}
			else if (Pflanzengift == 3) // 75% weniger
			{
				GGPf_Sumpfgolem_Time += 10;
			};

			// neuer Schaden

			if (Gewaechsgift == 0)
			{
				GGPf_Sumpfgolem_Damage = 3000;
			}
			else if (Gewaechsgift == 1) // 10% weniger
			{
				GGPf_Sumpfgolem_Damage = 2700;
			}
			else if (Gewaechsgift == 2) // noch mal 10% weniger
			{
				GGPf_Sumpfgolem_Damage = 2400;
			}
			else if (Gewaechsgift == 3) // und noch mal 10% weniger
			{
				GGPf_Sumpfgolem_Damage = 2100;
			};
		};
	};

	if (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Mod_7657_OUT_Suchender_REL))
	&& (Pflanzengift < 4)
	&& (GGPf_Sumpfgolem_Time == 0)
	{
		// Wahrscheinlichkeit, eine Vergiftung zu erleiden

		if (Gift == 0)
		{
			GiftChance = 30;
		}
		else if (Gift == 1)
		{
			GiftChance = 25;
		}
		else if (Gift == 2)
		{
			GiftChance = 21;
		}
		else if (Gift == 3)
		{
			GiftChance = 18;
		};

		GiftChance = GiftChance - ((GiftChance*armor)/100);

		if (Hlp_Random(100) < GiftChance)
		{
			// Zeit erhöhen

			if (Pflanzengift == 0)
			{
				GGPf_Sumpfgolem_Time += 40;
			}
			else if (Pflanzengift == 1) // 25% weniger
			{
				GGPf_Sumpfgolem_Time += 30;
			}
			else if (Pflanzengift == 2) // 50% weniger
			{
				GGPf_Sumpfgolem_Time += 20;
			}
			else if (Pflanzengift == 3) // 75% weniger
			{
				GGPf_Sumpfgolem_Time += 10;
			};

			// neuer Schaden

			if (Gewaechsgift == 0)
			{
				GGPf_Sumpfgolem_Damage = 3000;
			}
			else if (Gewaechsgift == 1) // 10% weniger
			{
				GGPf_Sumpfgolem_Damage = 2700;
			}
			else if (Gewaechsgift == 2) // noch mal 10% weniger
			{
				GGPf_Sumpfgolem_Damage = 2400;
			}
			else if (Gewaechsgift == 3) // und noch mal 10% weniger
			{
				GGPf_Sumpfgolem_Damage = 2100;
			};
		};
	};

	if (other.aivar[AIV_MM_REAL_ID] == ID_ORCSHAMAN)
	&& (Pilzgift < 4)
	&& (GGPi_Orkschamane_Time == 0)
	{
		// Wahrscheinlichkeit, eine Vergiftung zu erleiden

		if (Gift == 0)
		{
			GiftChance = 10;
		}
		else if (Gift == 1)
		{
			GiftChance = 8;
		}
		else if (Gift == 2)
		{
			GiftChance = 6;
		}
		else if (Gift == 3)
		{
			GiftChance = 5;
		};

		GiftChance = GiftChance - ((GiftChance*armor)/100);

		if (Hlp_Random(100) < GiftChance)
		{
			// Zeit erhöhen

			if (Pilzgift == 0)
			{
				GGPi_Orkschamane_Time += 40;
			}
			else if (Pilzgift == 1) // 25% weniger
			{
				GGPi_Orkschamane_Time += 30;
			}
			else if (Pilzgift == 2) // 50% weniger
			{
				GGPi_Orkschamane_Time += 20;
			}
			else if (Pilzgift == 3) // 75% weniger
			{
				GGPi_Orkschamane_Time += 10;
			};

			// neuer Schaden

			if (Gewaechsgift == 0)
			{
				GGPi_Orkschamane_Damage = 3000;
			}
			else if (Gewaechsgift == 1) // 10% weniger
			{
				GGPi_Orkschamane_Damage = 2700;
			}
			else if (Gewaechsgift == 2) // noch mal 10% weniger
			{
				GGPi_Orkschamane_Damage = 2400;
			}
			else if (Gewaechsgift == 3) // und noch mal 10% weniger
			{
				GGPi_Orkschamane_Damage = 2100;
			};
		};
	};

	if (other.guild == GIL_DRACONIAN)
	&& (Pflanzengift < 4)
	&& (GGPf_Echsenmensch_Time == 0)
	{
		// Wahrscheinlichkeit, eine Vergiftung zu erleiden

		if (Gift == 0)
		{
			GiftChance = 40;
		}
		else if (Gift == 1)
		{
			GiftChance = 34;
		}
		else if (Gift == 2)
		{
			GiftChance = 29;
		}
		else if (Gift == 3)
		{
			GiftChance = 25;
		};

		GiftChance = GiftChance - ((GiftChance*armor)/100);

		if (Hlp_Random(100) < GiftChance)
		{
			// Zeit erhöhen

			if (Pilzgift == 0)
			{
				GGPf_Echsenmensch_Time += 40;
			}
			else if (Pflanzengift == 1) // 25% weniger
			{
				GGPf_Echsenmensch_Time += 30;
			}
			else if (Pflanzengift == 2) // 50% weniger
			{
				GGPf_Echsenmensch_Time += 20;
			}
			else if (Pflanzengift == 3) // 75% weniger
			{
				GGPf_Echsenmensch_Time += 10;
			};

			// neuer Schaden

			if (Gewaechsgift == 0)
			{
				GGPf_Echsenmensch_Damage = 5000;
			}
			else if (Gewaechsgift == 1) // 10% weniger
			{
				GGPf_Echsenmensch_Damage = 4500;
			}
			else if (Gewaechsgift == 2) // noch mal 10% weniger
			{
				GGPf_Echsenmensch_Damage = 4000;
			}
			else if (Gewaechsgift == 3) // und noch mal 10% weniger
			{
				GGPf_Echsenmensch_Damage = 3600;
			};
		};
	};

	if (other.aivar[AIV_MM_REAL_ID] == ID_ORCWARRIORCROSSBOW)
	&& (Pilzgift < 4)
	&& (GGPi_OrkkriegerArmbrust_Time == 0)
	{
		// Wahrscheinlichkeit, eine Vergiftung zu erleiden

		if (Gift == 0)
		{
			GiftChance = 30;
		}
		else if (Gift == 1)
		{
			GiftChance = 26;
		}
		else if (Gift == 2)
		{
			GiftChance = 22;
		}
		else if (Gift == 3)
		{
			GiftChance = 19;
		};

		GiftChance = GiftChance - ((GiftChance*armor)/100);

		if (Hlp_Random(100) < GiftChance)
		{
			// Zeit erhöhen

			if (Pilzgift == 0)
			{
				GGPi_OrkkriegerArmbrust_Time += 40;
			}
			else if (Pilzgift == 1) // 25% weniger
			{
				GGPi_OrkkriegerArmbrust_Time += 30;
			}
			else if (Pilzgift == 2) // 50% weniger
			{
				GGPi_OrkkriegerArmbrust_Time += 20;
			}
			else if (Pilzgift == 3) // 75% weniger
			{
				GGPi_OrkkriegerArmbrust_Time += 10;
			};

			// neuer Schaden

			if (Gewaechsgift == 0)
			{
				GGPi_OrkkriegerArmbrust_Damage = 3000;
			}
			else if (Gewaechsgift == 1) // 10% weniger
			{
				GGPi_OrkkriegerArmbrust_Damage = 2700;
			}
			else if (Gewaechsgift == 2) // noch mal 10% weniger
			{
				GGPi_OrkkriegerArmbrust_Damage = 2400;
			}
			else if (Gewaechsgift == 3) // und noch mal 10% weniger
			{
				GGPi_OrkkriegerArmbrust_Damage = 2100;
			};
		};
	};

	var C_ITEM rdw;
	rdw = Npc_GetReadiedWeapon(other);

	if (other.guild < GIL_SEPERATOR_HUM)
	&& (Pflanzengift < 4)
	&& ((Hlp_IsItem(rdw, ItMw_Assassinenschwert))
	|| (Hlp_IsItem(rdw, ItMw_Assassinenkralle))
	|| (Hlp_IsItem(rdw, ItMw_Katana))
	|| (Hlp_IsItem(rdw, ItRw_Assassinenbogen))
	|| (Hlp_IsItem(rdw, ItRw_Todesbogen))
	|| (Hlp_IsItem(rdw, ItRw_Runenbogen)))
	&& (GGPf_Assassinenschwert_Time == 0)
	&& (Hlp_GetInstanceID(other) != Hlp_GetInstanceID(Mod_7133_ASS_Sinbad_NW))
	{
		// Wahrscheinlichkeit, eine Vergiftung zu erleiden

		if (Gift == 0)
		{
			GiftChance = 20;
		}
		else if (Gift == 1)
		{
			GiftChance = 17;
		}
		else if (Gift == 2)
		{
			GiftChance = 15;
		}
		else if (Gift == 3)
		{
			GiftChance = 13;
		};

		GiftChance = GiftChance - ((GiftChance*armor)/100);

		if (Hlp_Random(100) < GiftChance)
		{
			// Zeit erhöhen

			if (Pilzgift == 0)
			{
				GGPf_Assassinenschwert_Time += 30;
			}
			else if (Pflanzengift == 1) // 25% weniger
			{
				GGPf_Assassinenschwert_Time += 22;
			}
			else if (Pflanzengift == 2) // 50% weniger
			{
				GGPf_Assassinenschwert_Time += 15;
			}
			else if (Pflanzengift == 3) // 75% weniger
			{
				GGPf_Assassinenschwert_Time += 7;
			};

			// neuer Schaden

			if (Gewaechsgift == 0)
			{
				GGPf_Assassinenschwert_Damage = 3000;
			}
			else if (Gewaechsgift == 1) // 10% weniger
			{
				GGPf_Assassinenschwert_Damage = 2700;
			}
			else if (Gewaechsgift == 2) // noch mal 10% weniger
			{
				GGPf_Assassinenschwert_Damage = 2400;
			}
			else if (Gewaechsgift == 3) // und noch mal 10% weniger
			{
				GGPf_Assassinenschwert_Damage = 2100;
			};
		};
	};

	if (other.aivar[AIV_MM_REAL_ID] == ID_ORCSHAMAN)
	&& (Pilzgift < 4)
	&& (GGPi_Schamanenaxt_Time == 0)
	{
		// Wahrscheinlichkeit, eine Vergiftung zu erleiden

		if (Gift == 0)
		{
			GiftChance = 10;
		}
		else if (Gift == 1)
		{
			GiftChance = 8;
		}
		else if (Gift == 2)
		{
			GiftChance = 6;
		}
		else if (Gift == 3)
		{
			GiftChance = 5;
		};

		GiftChance = GiftChance - ((GiftChance*armor)/100);

		if (Hlp_Random(100) < GiftChance)
		{
			// Zeit erhöhen

			if (Pilzgift == 0)
			{
				GGPi_Schamanenaxt_Time += 30;
			}
			else if (Pilzgift == 1) // 25% weniger
			{
				GGPi_Schamanenaxt_Time += 22;
			}
			else if (Pilzgift == 2) // 50% weniger
			{
				GGPi_Schamanenaxt_Time += 15;
			}
			else if (Pilzgift == 3) // 75% weniger
			{
				GGPi_Schamanenaxt_Time += 7;
			};

			// neuer Schaden

			if (Gewaechsgift == 0)
			{
				GGPi_Schamanenaxt_Damage = 3000;
			}
			else if (Gewaechsgift == 1) // 10% weniger
			{
				GGPi_Schamanenaxt_Damage = 2700;
			}
			else if (Gewaechsgift == 2) // noch mal 10% weniger
			{
				GGPi_Schamanenaxt_Damage = 2400;
			}
			else if (Gewaechsgift == 3) // und noch mal 10% weniger
			{
				GGPi_Schamanenaxt_Damage = 2100;
			};
		};
	};

	if (other.aivar[AIV_MM_REAL_ID] == ID_BLOODFLY)
	&& (Blutfliegengift < 3)
	&& (GTB_Blutfliege_Time == 0)
	{
		// Wahrscheinlichkeit, eine Vergiftung zu erleiden

		if (Gift == 0)
		{
			GiftChance = 50; //100%
		}
		else if (Gift == 1)
		{
			GiftChance = 42; //- 15%
		}
		else if (Gift == 2)
		{
			GiftChance = 36; //nochmal -15% vom Rest
		}
		else if (Gift == 3)
		{
			GiftChance = 30; //nochmal -15% vom Rest
		};

		GiftChance = GiftChance - ((GiftChance*armor)/100);

		if (Hlp_Random(100) < GiftChance)
		{
			// Zeit erhöhen

			if (Blutfliegengift == 0)
			{
				GTB_Blutfliege_Time += 20;
			}
			else if (Blutfliegengift == 1) // 25% weniger
			{
				GTB_Blutfliege_Time += 15;
			}
			else if (Blutfliegengift == 2) // 50% weniger
			{
				GTB_Blutfliege_Time += 10;
			};

			// neuer Schaden

			if (Tiergift == 0)
			{
				GTB_Blutfliege_Damage = 3000;
			}
			else if (Tiergift == 1) // 10% weniger
			{
				GTB_Blutfliege_Damage = 2700;
			}
			else if (Tiergift == 2) // noch mal 10% weniger
			{
				GTB_Blutfliege_Damage = 2400;
			}
			else if (Tiergift == 3) // und noch mal 10% weniger
			{
				GTB_Blutfliege_Damage = 2100;
			};
		};
	};

	if (other.aivar[AIV_MM_REAL_ID] == ID_SWAMPDRONE)
	&& (Sumpfgasdrohnengift < 3)
	&& (GTS_Sumpfgasdrohne_Time == 0)
	{
		// Wahrscheinlichkeit, eine Vergiftung zu erleiden

		if (Gift == 0)
		{
			GiftChance = 50; //100%
		}
		else if (Gift == 1)
		{
			GiftChance = 42; //- 15%
		}
		else if (Gift == 2)
		{
			GiftChance = 36; //nochmal -15% vom Rest
		}
		else if (Gift == 3)
		{
			GiftChance = 30; //nochmal -15% vom Rest
		};

		GiftChance = GiftChance - ((GiftChance*armor)/100);

		if (Hlp_Random(100) < GiftChance)
		{
			// Zeit erhöhen

			if (Sumpfgasdrohnengift == 0)
			{
				GTS_Sumpfgasdrohne_Time += 20;
			}
			else if (Sumpfgasdrohnengift == 1) // 25% weniger
			{
				GTS_Sumpfgasdrohne_Time += 15;
			}
			else if (Sumpfgasdrohnengift == 2) // 50% weniger
			{
				GTS_Sumpfgasdrohne_Time += 10;
			};

			// neuer Schaden

			if (Tiergift == 0)
			{
				GTS_Sumpfgasdrohne_Damage = 5000;
			}
			else if (Tiergift == 1) // 10% weniger
			{
				GTS_Sumpfgasdrohne_Damage = 4500;
			}
			else if (Tiergift == 2) // noch mal 10% weniger
			{
				GTS_Sumpfgasdrohne_Damage = 4000;
			}
			else if (Tiergift == 3) // und noch mal 10% weniger
			{
				GTS_Sumpfgasdrohne_Damage = 3600;
			};
		};
	};

	if (other.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLER)
	&& (Minecrawlergift < 3)
	&& (GTM_Minecrawler_Time == 0)
	{
		// Wahrscheinlichkeit, eine Vergiftung zu erleiden

		if (Gift == 0)
		{
			GiftChance = 50; //100%
		}
		else if (Gift == 1)
		{
			GiftChance = 42; //- 15%
		}
		else if (Gift == 2)
		{
			GiftChance = 36; //nochmal -15% vom Rest
		}
		else if (Gift == 3)
		{
			GiftChance = 30; //nochmal -15% vom Rest
		};

		GiftChance = GiftChance - ((GiftChance*armor)/100);

		if (Hlp_Random(100) < GiftChance)
		{
			// Zeit erhöhen

			if (Minecrawlergift == 0)
			{
				GTM_Minecrawler_Time += 30;
			}
			else if (Minecrawlergift == 1) // 25% weniger
			{
				GTM_Minecrawler_Time += 23;
			}
			else if (Minecrawlergift == 2) // 50% weniger
			{
				GTM_Minecrawler_Time += 15;
			};

			// neuer Schaden

			if (Tiergift == 0)
			{
				GTM_Minecrawler_Damage = 6000;
			}
			else if (Tiergift == 1) // 10% weniger
			{
				GTM_Minecrawler_Damage = 5400;
			}
			else if (Tiergift == 2) // noch mal 10% weniger
			{
				GTM_Minecrawler_Damage = 4800;
			}
			else if (Tiergift == 3) // und noch mal 10% weniger
			{
				GTM_Minecrawler_Damage = 4300;
			};
		};
	};

	if (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Mod_7657_OUT_Suchender_REL))
	&& (Minecrawlergift < 3)
	&& (GTM_Minecrawler_Time == 0)
	{
		// Wahrscheinlichkeit, eine Vergiftung zu erleiden

		if (Gift == 0)
		{
			GiftChance = 50; //100%
		}
		else if (Gift == 1)
		{
			GiftChance = 42; //- 15%
		}
		else if (Gift == 2)
		{
			GiftChance = 36; //nochmal -15% vom Rest
		}
		else if (Gift == 3)
		{
			GiftChance = 30; //nochmal -15% vom Rest
		};

		GiftChance = GiftChance - ((GiftChance*armor)/100);

		if (Hlp_Random(100) < GiftChance)
		{
			// Zeit erhöhen

			if (Minecrawlergift == 0)
			{
				GTM_Minecrawler_Time += 30;
			}
			else if (Minecrawlergift == 1) // 25% weniger
			{
				GTM_Minecrawler_Time += 23;
			}
			else if (Minecrawlergift == 2) // 50% weniger
			{
				GTM_Minecrawler_Time += 15;
			};

			// neuer Schaden

			if (Tiergift == 0)
			{
				GTM_Minecrawler_Damage = 6000;
			}
			else if (Tiergift == 1) // 10% weniger
			{
				GTM_Minecrawler_Damage = 5400;
			}
			else if (Tiergift == 2) // noch mal 10% weniger
			{
				GTM_Minecrawler_Damage = 4800;
			}
			else if (Tiergift == 3) // und noch mal 10% weniger
			{
				GTM_Minecrawler_Damage = 4300;
			};
		};
	};

	if (other.aivar[AIV_MM_REAL_ID] == ID_MINECRAWLERWARRIOR)
	&& (Minecrawlergift < 3)
	&& (GTM_MinecrawlerWarrior_Time == 0)
	{
		// Wahrscheinlichkeit, eine Vergiftung zu erleiden

		if (Gift == 0)
		{
			GiftChance = 50; //100%
		}
		else if (Gift == 1)
		{
			GiftChance = 42; //- 15%
		}
		else if (Gift == 2)
		{
			GiftChance = 36; //nochmal -15% vom Rest
		}
		else if (Gift == 3)
		{
			GiftChance = 30; //nochmal -15% vom Rest
		};

		GiftChance = GiftChance - ((GiftChance*armor)/100);

		if (Hlp_Random(100) < GiftChance)
		{
			// Zeit erhöhen

			if (Minecrawlergift == 0)
			{
				GTM_MinecrawlerWarrior_Time += 30;
			}
			else if (Minecrawlergift == 1) // 25% weniger
			{
				GTM_MinecrawlerWarrior_Time += 23;
			}
			else if (Minecrawlergift == 2) // 50% weniger
			{
				GTM_MinecrawlerWarrior_Time += 15;
			};

			// neuer Schaden

			if (Tiergift == 0)
			{
				GTM_MinecrawlerWarrior_Damage = 8000;
			}
			else if (Tiergift == 1) // 10% weniger
			{
				GTM_MinecrawlerWarrior_Damage = 7200;
			}
			else if (Tiergift == 2) // noch mal 10% weniger
			{
				GTM_MinecrawlerWarrior_Damage = 6400;
			}
			else if (Tiergift == 3) // und noch mal 10% weniger
			{
				GTM_MinecrawlerWarrior_Damage = 5800;
			};
		};
	};

	if (other.aivar[AIV_MM_REAL_ID] == ID_SWAMPSHARK)
	&& (Sumpfhaigift < 3)
	&& (GTSu_Sumpfhai_Time == 0)
	{
		// Wahrscheinlichkeit, eine Vergiftung zu erleiden

		if (Gift == 0)
		{
			GiftChance = 40; //100%
		}
		else if (Gift == 1)
		{
			GiftChance = 34; //- 15%
		}
		else if (Gift == 2)
		{
			GiftChance = 28; //nochmal -15% vom Rest
		}
		else if (Gift == 3)
		{
			GiftChance = 24; //nochmal -15% vom Rest
		};

		GiftChance = GiftChance - ((GiftChance*armor)/100);

		if (Hlp_Random(100) < GiftChance)
		{
			// Zeit erhöhen

			if (Sumpfhaigift == 0)
			{
				GTSu_Sumpfhai_Time += 30;
			}
			else if (Sumpfhaigift == 1) // 25% weniger
			{
				GTSu_Sumpfhai_Time += 23;
			}
			else if (Sumpfhaigift == 2) // 50% weniger
			{
				GTSu_Sumpfhai_Time += 15;
			};

			// neuer Schaden

			if (Tiergift == 0)
			{
				GTSu_Sumpfhai_Damage = 5000;
			}
			else if (Tiergift == 1) // 10% weniger
			{
				GTSu_Sumpfhai_Damage = 4500;
			}
			else if (Tiergift == 2) // noch mal 10% weniger
			{
				GTSu_Sumpfhai_Damage = 4000;
			}
			else if (Tiergift == 3) // und noch mal 10% weniger
			{
				GTSu_Sumpfhai_Damage = 3600;
			};
		};
	};

	if (other.guild == GIL_DRACONIAN)
	&& (Sumpfgasdrohnengift < 3)
	&& (GTS_Echsenschwert_Time == 0)
	{
		// Wahrscheinlichkeit, eine Vergiftung zu erleiden

		if (Gift == 0)
		{
			GiftChance = 50; //100%
		}
		else if (Gift == 1)
		{
			GiftChance = 42; //- 15%
		}
		else if (Gift == 2)
		{
			GiftChance = 36; //nochmal -15% vom Rest
		}
		else if (Gift == 3)
		{
			GiftChance = 30; //nochmal -15% vom Rest
		};

		GiftChance = GiftChance - ((GiftChance*armor)/100);

		if (Hlp_Random(100) < GiftChance)
		{
			// Zeit erhöhen

			if (Sumpfgasdrohnengift == 0)
			{
				GTS_Echsenschwert_Time += 20;
			}
			else if (Sumpfgasdrohnengift == 1) // 25% weniger
			{
				GTS_Echsenschwert_Time += 14;
			}
			else if (Sumpfgasdrohnengift == 2) // 50% weniger
			{
				GTS_Echsenschwert_Time += 8;
			};

			// neuer Schaden

			if (Tiergift == 0)
			{
				GTS_Echsenschwert_Damage = 5000;
			}
			else if (Tiergift == 1) // 10% weniger
			{
				GTS_Echsenschwert_Damage = 4500;
			}
			else if (Tiergift == 2) // noch mal 10% weniger
			{
				GTS_Echsenschwert_Damage = 4000;
			}
			else if (Tiergift == 3) // und noch mal 10% weniger
			{
				GTS_Echsenschwert_Damage = 3600;
			};
		};
	};

	if (other.guild < GIL_SEPERATOR_HUM)
	&& (Blutfliegengift < 3)
	&& ((Hlp_IsItem(rdw, ItMw_Assassinenschwert))
	|| (Hlp_IsItem(rdw, ItMw_Assassinenkralle))
	|| (Hlp_IsItem(rdw, ItMw_Katana))
	|| (Hlp_IsItem(rdw, ItRw_Assassinenbogen))
	|| (Hlp_IsItem(rdw, ItRw_Todesbogen))
	|| (Hlp_IsItem(rdw, ItRw_Runenbogen)))
	&& (GTB_Assassinenschwert_Time == 0)
	&& (Hlp_GetInstanceID(other) != Hlp_GetInstanceID(Mod_7133_ASS_Sinbad_NW))
	{
		// Wahrscheinlichkeit, eine Vergiftung zu erleiden

		if (Gift == 0)
		{
			GiftChance = 50; //100%
		}
		else if (Gift == 1)
		{
			GiftChance = 42; //- 15%
		}
		else if (Gift == 2)
		{
			GiftChance = 36; //nochmal -15% vom Rest
		}
		else if (Gift == 3)
		{
			GiftChance = 30; //nochmal -15% vom Rest
		};

		GiftChance = GiftChance - ((GiftChance*armor)/100);

		if (Hlp_Random(100) < GiftChance)
		{
			// Zeit erhöhen

			if (Blutfliegengift == 0)
			{
				GTB_Assassinenschwert_Time += 20;
			}
			else if (Blutfliegengift == 1) // 25% weniger
			{
				GTB_Assassinenschwert_Time += 14;
			}
			else if (Blutfliegengift == 2) // 50% weniger
			{
				GTB_Assassinenschwert_Time += 8;
			};

			// neuer Schaden

			if (Tiergift == 0)
			{
				GTB_Assassinenschwert_Damage = 5000;
			}
			else if (Tiergift == 1) // 10% weniger
			{
				GTB_Assassinenschwert_Damage = 4500;
			}
			else if (Tiergift == 2) // noch mal 10% weniger
			{
				GTB_Assassinenschwert_Damage = 4000;
			}
			else if (Tiergift == 3) // und noch mal 10% weniger
			{
				GTB_Assassinenschwert_Damage = 3600;
			};
		};
	};

	if (other.aivar[AIV_MM_REAL_ID] == ID_ORCSHAMAN)
	&& (Minecrawlergift < 3)
	&& (GTM_Schamanenaxt_Time == 0)
	{
		// Wahrscheinlichkeit, eine Vergiftung zu erleiden

		if (Gift == 0)
		{
			GiftChance = 50; //100%
		}
		else if (Gift == 1)
		{
			GiftChance = 42; //- 15%
		}
		else if (Gift == 2)
		{
			GiftChance = 36; //nochmal -15% vom Rest
		}
		else if (Gift == 3)
		{
			GiftChance = 30; //nochmal -15% vom Rest
		};

		GiftChance = GiftChance - ((GiftChance*armor)/100);

		if (Hlp_Random(100) < GiftChance)
		{
			// Zeit erhöhen

			if (Minecrawlergift == 0)
			{
				GTM_Schamanenaxt_Time += 20;
			}
			else if (Minecrawlergift == 1) // 25% weniger
			{
				GTM_Schamanenaxt_Time += 14;
			}
			else if (Minecrawlergift == 2) // 50% weniger
			{
				GTM_Schamanenaxt_Time += 8;
			};

			// neuer Schaden

			if (Tiergift == 0)
			{
				GTM_Schamanenaxt_Damage = 5000;
			}
			else if (Tiergift == 1) // 10% weniger
			{
				GTM_Schamanenaxt_Damage = 4500;
			}
			else if (Tiergift == 2) // noch mal 10% weniger
			{
				GTM_Schamanenaxt_Damage = 4000;
			}
			else if (Tiergift == 3) // und noch mal 10% weniger
			{
				GTM_Schamanenaxt_Damage = 3600;
			};
		};
	};

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Giftdrache_11004_NW))
	&& (GGD_Sumpfdrache_Time == 0)
	{
		// Wahrscheinlichkeit, eine Vergiftung zu erleiden

		if (Gift == 0)
		{
			GiftChance = 100; //100%
		}
		else if (Gift == 1)
		{
			GiftChance = 85; //- 15%
		}
		else if (Gift == 2)
		{
			GiftChance = 72; //nochmal -15% vom Rest
		}
		else if (Gift == 3)
		{
			GiftChance = 61; //nochmal -15% vom Rest
		};

		if (Hlp_Random(100) < GiftChance)
		{
			// Zeit erhöhen

			if (Giftdampf == 0)
			{
				GGD_Sumpfdrache_Time += 5;
			}
			else if (Giftdampf == 1) // 20% weniger
			{
				GGD_Sumpfdrache_Time += 4;
			}
			else if (Giftdampf == 2) // 40% weniger
			{
				GGD_Sumpfdrache_Time += 3;
			}
			else if (Giftdampf == 3) // 60% weniger
			{
				GGD_Sumpfdrache_Time += 2;
			}
			else if (Giftdampf == 4) // 80% weniger
			{
				GGD_Sumpfdrache_Time += 1;
			};

			// neuer Schaden

			if (Giftdampf == 0)
			{
				GGD_Sumpfdrache_Damage = 20;
			}
			else if (Giftdampf == 1) // 10% weniger
			{
				GGD_Sumpfdrache_Damage = 18;
			}
			else if (Giftdampf == 2) // noch mal 10% weniger
			{
				GGD_Sumpfdrache_Damage = 16;
			}
			else if (Giftdampf == 3) // und noch mal 10% weniger
			{
				GGD_Sumpfdrache_Damage = 14;
			}
			else if (Giftdampf == 4) // und noch mal 10% weniger
			{
				GGD_Sumpfdrache_Damage = 13;
			};
		};
	};

	// Krankheiten

	if (other.aivar[AIV_MM_REAL_ID] == ID_SKELETON)
	&& (Hlp_GetInstanceID(other) != Hlp_GetInstanceID(Lesser_Skeleton))
	&& (BissDerFaeulnis_Time == 0)
	{
		if (KBDF == 0)
		{
			GiftChance = 30;	// 100 %
		}
		else if (KBDF == 1)
		{
			GiftChance = 24;	// - 20 %
		}
		else if (KBDF == 2)
		{
			GiftChance = 19;	// 100 %
		}
		else if (KBDF == 3)
		{
			GiftChance = 15;	// 100 %
		}
		else if (KBDF == 4)
		{
			GiftChance = 12;	// 100 %
		};

		GiftChance = GiftChance - ((GiftChance*armor)/100);

		if (Hlp_Random(100) < GiftChance)
		{
			// Zeit festlegen

			if (Krankheit == 0)
			{
				BissDerFaeulnis_Stufe01 = 300;
				BissDerFaeulnis_Stufe02 = 300;
				BissDerFaeulnis_Stufe03 = 300;
			}
			else if (Krankheit == 1)
			{
				BissDerFaeulnis_Stufe01 = 270;
				BissDerFaeulnis_Stufe02 = 270;
				BissDerFaeulnis_Stufe03 = 270;
			}
			else if (Krankheit == 2)
			{
				BissDerFaeulnis_Stufe01 = 243;
				BissDerFaeulnis_Stufe02 = 243;
				BissDerFaeulnis_Stufe03 = 243;
			}
			else if (Krankheit == 3)
			{
				BissDerFaeulnis_Stufe01 = 219;
				BissDerFaeulnis_Stufe02 = 219;
				BissDerFaeulnis_Stufe03 = 219;
			}
			else if (Krankheit == 4)
			{
				BissDerFaeulnis_Stufe01 = 197;
				BissDerFaeulnis_Stufe02 = 197;
				BissDerFaeulnis_Stufe03 = 197;
			};

			// Mali festlegen und die Start-Mali gleich abziehen

			if (KBDF == 0)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 11)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 10;
				};

				BissDerFaeulnis_Stufe01_MANA = 10;
				BissDerFaeulnis_Stufe01_STR = 5;
				BissDerFaeulnis_Stufe01_DEX = 5;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 31)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 30;
				};

				BissDerFaeulnis_Stufe02_MANA = 15;
				BissDerFaeulnis_Stufe02_STR = 10;
				BissDerFaeulnis_Stufe02_DEX = 10;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 61)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 60;
				};

				BissDerFaeulnis_Stufe03_MANA = 30;
				BissDerFaeulnis_Stufe03_STR = 20;
				BissDerFaeulnis_Stufe03_DEX = 20;
			}
			else if (KBDF == 1)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 9)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 8;
				};

				BissDerFaeulnis_Stufe01_MANA = 8;
				BissDerFaeulnis_Stufe01_STR = 4;
				BissDerFaeulnis_Stufe01_DEX = 4;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 25)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 24;
				};

				BissDerFaeulnis_Stufe02_MANA = 12;
				BissDerFaeulnis_Stufe02_STR = 8;
				BissDerFaeulnis_Stufe02_DEX = 8;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 49)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 48;
				};

				BissDerFaeulnis_Stufe03_MANA = 24;
				BissDerFaeulnis_Stufe03_STR = 16;
				BissDerFaeulnis_Stufe03_DEX = 16;
			}
			else if (KBDF == 2)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 7)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 6;
				};

				BissDerFaeulnis_Stufe01_MANA = 6;
				BissDerFaeulnis_Stufe01_STR = 3;
				BissDerFaeulnis_Stufe01_DEX = 3;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 20)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 19;
				};

				BissDerFaeulnis_Stufe02_MANA = 10;
				BissDerFaeulnis_Stufe02_STR = 6;
				BissDerFaeulnis_Stufe02_DEX = 6;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 39)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 38;
				};

				BissDerFaeulnis_Stufe03_MANA = 19;
				BissDerFaeulnis_Stufe03_STR = 13;
				BissDerFaeulnis_Stufe03_DEX = 13;
			}
			else if (KBDF == 3)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 6)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 5;
				};

				BissDerFaeulnis_Stufe01_MANA = 5;
				BissDerFaeulnis_Stufe01_STR = 3;
				BissDerFaeulnis_Stufe01_DEX = 3;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 16)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 15;
				};

				BissDerFaeulnis_Stufe02_MANA = 8;
				BissDerFaeulnis_Stufe02_STR = 5;
				BissDerFaeulnis_Stufe02_DEX = 5;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 32)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 31;
				};

				BissDerFaeulnis_Stufe03_MANA = 15;
				BissDerFaeulnis_Stufe03_STR = 10;
				BissDerFaeulnis_Stufe03_DEX = 10;
			}
			else if (KBDF == 4)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 5)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 4;
				};

				BissDerFaeulnis_Stufe01_MANA = 4;
				BissDerFaeulnis_Stufe01_STR = 2;
				BissDerFaeulnis_Stufe01_DEX = 2;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 13)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 12;
				};

				BissDerFaeulnis_Stufe02_MANA = 6;
				BissDerFaeulnis_Stufe02_STR = 4;
				BissDerFaeulnis_Stufe02_DEX = 4;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 26)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 25;
				};

				BissDerFaeulnis_Stufe03_MANA = 12;
				BissDerFaeulnis_Stufe03_STR = 8;
				BissDerFaeulnis_Stufe03_DEX = 8;
			};

			BissDerFaeulnis_Time = 1;
		};
	};

	if (other.aivar[AIV_MM_REAL_ID] == ID_SKELETON)
	&& (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Lesser_Skeleton))
	&& (BissDerFaeulnis_Time == 0)
	{
		if (KBDF == 0)
		{
			GiftChance = 20;	// 100 %
		}
		else if (KBDF == 1)
		{
			GiftChance = 16;	// - 20 %
		}
		else if (KBDF == 2)
		{
			GiftChance = 13;	// 100 %
		}
		else if (KBDF == 3)
		{
			GiftChance = 10;	// 100 %
		}
		else if (KBDF == 4)
		{
			GiftChance = 8;	// 100 %
		};

		GiftChance = GiftChance - ((GiftChance*armor)/100);

		if (Hlp_Random(100) < GiftChance)
		{
			// Zeit festlegen

			if (Krankheit == 0)
			{
				BissDerFaeulnis_Stufe01 = 300;
				BissDerFaeulnis_Stufe02 = 300;
				BissDerFaeulnis_Stufe03 = 300;
			}
			else if (Krankheit == 1)
			{
				BissDerFaeulnis_Stufe01 = 270;
				BissDerFaeulnis_Stufe02 = 270;
				BissDerFaeulnis_Stufe03 = 270;
			}
			else if (Krankheit == 2)
			{
				BissDerFaeulnis_Stufe01 = 243;
				BissDerFaeulnis_Stufe02 = 243;
				BissDerFaeulnis_Stufe03 = 243;
			}
			else if (Krankheit == 3)
			{
				BissDerFaeulnis_Stufe01 = 219;
				BissDerFaeulnis_Stufe02 = 219;
				BissDerFaeulnis_Stufe03 = 219;
			}
			else if (Krankheit == 4)
			{
				BissDerFaeulnis_Stufe01 = 197;
				BissDerFaeulnis_Stufe02 = 197;
				BissDerFaeulnis_Stufe03 = 197;
			};

			// Mali festlegen und die Start-Mali gleich abziehen

			if (KBDF == 0)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 11)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 10;
				};

				BissDerFaeulnis_Stufe01_MANA = 10;
				BissDerFaeulnis_Stufe01_STR = 5;
				BissDerFaeulnis_Stufe01_DEX = 5;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 31)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 30;
				};

				BissDerFaeulnis_Stufe02_MANA = 15;
				BissDerFaeulnis_Stufe02_STR = 10;
				BissDerFaeulnis_Stufe02_DEX = 10;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 61)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 60;
				};

				BissDerFaeulnis_Stufe03_MANA = 30;
				BissDerFaeulnis_Stufe03_STR = 20;
				BissDerFaeulnis_Stufe03_DEX = 20;
			}
			else if (KBDF == 1)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 9)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 8;
				};

				BissDerFaeulnis_Stufe01_MANA = 8;
				BissDerFaeulnis_Stufe01_STR = 4;
				BissDerFaeulnis_Stufe01_DEX = 4;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 25)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 24;
				};

				BissDerFaeulnis_Stufe02_MANA = 12;
				BissDerFaeulnis_Stufe02_STR = 8;
				BissDerFaeulnis_Stufe02_DEX = 8;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 49)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 48;
				};

				BissDerFaeulnis_Stufe03_MANA = 24;
				BissDerFaeulnis_Stufe03_STR = 16;
				BissDerFaeulnis_Stufe03_DEX = 16;
			}
			else if (KBDF == 2)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 7)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 6;
				};

				BissDerFaeulnis_Stufe01_MANA = 6;
				BissDerFaeulnis_Stufe01_STR = 3;
				BissDerFaeulnis_Stufe01_DEX = 3;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 20)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 19;
				};

				BissDerFaeulnis_Stufe02_MANA = 10;
				BissDerFaeulnis_Stufe02_STR = 6;
				BissDerFaeulnis_Stufe02_DEX = 6;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 39)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 38;
				};

				BissDerFaeulnis_Stufe03_MANA = 19;
				BissDerFaeulnis_Stufe03_STR = 13;
				BissDerFaeulnis_Stufe03_DEX = 13;
			}
			else if (KBDF == 3)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 6)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 5;
				};

				BissDerFaeulnis_Stufe01_MANA = 5;
				BissDerFaeulnis_Stufe01_STR = 3;
				BissDerFaeulnis_Stufe01_DEX = 3;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 16)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 15;
				};

				BissDerFaeulnis_Stufe02_MANA = 8;
				BissDerFaeulnis_Stufe02_STR = 5;
				BissDerFaeulnis_Stufe02_DEX = 5;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 32)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 31;
				};

				BissDerFaeulnis_Stufe03_MANA = 15;
				BissDerFaeulnis_Stufe03_STR = 10;
				BissDerFaeulnis_Stufe03_DEX = 10;
			}
			else if (KBDF == 4)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 5)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 4;
				};

				BissDerFaeulnis_Stufe01_MANA = 4;
				BissDerFaeulnis_Stufe01_STR = 2;
				BissDerFaeulnis_Stufe01_DEX = 2;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 13)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 12;
				};

				BissDerFaeulnis_Stufe02_MANA = 6;
				BissDerFaeulnis_Stufe02_STR = 4;
				BissDerFaeulnis_Stufe02_DEX = 4;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 26)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 25;
				};

				BissDerFaeulnis_Stufe03_MANA = 12;
				BissDerFaeulnis_Stufe03_STR = 8;
				BissDerFaeulnis_Stufe03_DEX = 8;
			};

			BissDerFaeulnis_Time = 1;
		};
	};

	if (other.aivar[AIV_MM_REAL_ID] == ID_WOLF)
	&& (Hlp_GetInstanceID(other) != Hlp_GetInstanceID(BlackWolf))
	&& (BissDerFaeulnis_Time == 0)
	{
		if (KBDF == 0)
		{
			GiftChance = 5;	// 100 %
		}
		else if (KBDF == 1)
		{
			GiftChance = 4;	// - 20 %
		}
		else if (KBDF == 2)
		{
			GiftChance = 3;	// 100 %
		}
		else if (KBDF == 3)
		{
			GiftChance = 2;	// 100 %
		}
		else if (KBDF == 4)
		{
			GiftChance = 2;	// 100 %
		};

		GiftChance = GiftChance - ((GiftChance*armor)/100);

		if (Hlp_Random(100) < GiftChance)
		{
			// Zeit festlegen

			if (Krankheit == 0)
			{
				BissDerFaeulnis_Stufe01 = 300;
				BissDerFaeulnis_Stufe02 = 300;
				BissDerFaeulnis_Stufe03 = 300;
			}
			else if (Krankheit == 1)
			{
				BissDerFaeulnis_Stufe01 = 270;
				BissDerFaeulnis_Stufe02 = 270;
				BissDerFaeulnis_Stufe03 = 270;
			}
			else if (Krankheit == 2)
			{
				BissDerFaeulnis_Stufe01 = 243;
				BissDerFaeulnis_Stufe02 = 243;
				BissDerFaeulnis_Stufe03 = 243;
			}
			else if (Krankheit == 3)
			{
				BissDerFaeulnis_Stufe01 = 219;
				BissDerFaeulnis_Stufe02 = 219;
				BissDerFaeulnis_Stufe03 = 219;
			}
			else if (Krankheit == 4)
			{
				BissDerFaeulnis_Stufe01 = 197;
				BissDerFaeulnis_Stufe02 = 197;
				BissDerFaeulnis_Stufe03 = 197;
			};

			// Mali festlegen und die Start-Mali gleich abziehen

			if (KBDF == 0)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 11)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 10;
				};

				BissDerFaeulnis_Stufe01_MANA = 10;
				BissDerFaeulnis_Stufe01_STR = 5;
				BissDerFaeulnis_Stufe01_DEX = 5;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 31)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 30;
				};

				BissDerFaeulnis_Stufe02_MANA = 15;
				BissDerFaeulnis_Stufe02_STR = 10;
				BissDerFaeulnis_Stufe02_DEX = 10;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 61)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 60;
				};

				BissDerFaeulnis_Stufe03_MANA = 30;
				BissDerFaeulnis_Stufe03_STR = 20;
				BissDerFaeulnis_Stufe03_DEX = 20;
			}
			else if (KBDF == 1)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 9)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 8;
				};

				BissDerFaeulnis_Stufe01_MANA = 8;
				BissDerFaeulnis_Stufe01_STR = 4;
				BissDerFaeulnis_Stufe01_DEX = 4;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 25)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 24;
				};

				BissDerFaeulnis_Stufe02_MANA = 12;
				BissDerFaeulnis_Stufe02_STR = 8;
				BissDerFaeulnis_Stufe02_DEX = 8;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 49)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 48;
				};

				BissDerFaeulnis_Stufe03_MANA = 24;
				BissDerFaeulnis_Stufe03_STR = 16;
				BissDerFaeulnis_Stufe03_DEX = 16;
			}
			else if (KBDF == 2)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 7)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 6;
				};

				BissDerFaeulnis_Stufe01_MANA = 6;
				BissDerFaeulnis_Stufe01_STR = 3;
				BissDerFaeulnis_Stufe01_DEX = 3;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 20)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 19;
				};

				BissDerFaeulnis_Stufe02_MANA = 10;
				BissDerFaeulnis_Stufe02_STR = 6;
				BissDerFaeulnis_Stufe02_DEX = 6;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 39)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 38;
				};

				BissDerFaeulnis_Stufe03_MANA = 19;
				BissDerFaeulnis_Stufe03_STR = 13;
				BissDerFaeulnis_Stufe03_DEX = 13;
			}
			else if (KBDF == 3)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 6)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 5;
				};

				BissDerFaeulnis_Stufe01_MANA = 5;
				BissDerFaeulnis_Stufe01_STR = 3;
				BissDerFaeulnis_Stufe01_DEX = 3;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 16)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 15;
				};

				BissDerFaeulnis_Stufe02_MANA = 8;
				BissDerFaeulnis_Stufe02_STR = 5;
				BissDerFaeulnis_Stufe02_DEX = 5;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 32)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 31;
				};

				BissDerFaeulnis_Stufe03_MANA = 15;
				BissDerFaeulnis_Stufe03_STR = 10;
				BissDerFaeulnis_Stufe03_DEX = 10;
			}
			else if (KBDF == 4)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 5)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 4;
				};

				BissDerFaeulnis_Stufe01_MANA = 4;
				BissDerFaeulnis_Stufe01_STR = 2;
				BissDerFaeulnis_Stufe01_DEX = 2;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 13)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 12;
				};

				BissDerFaeulnis_Stufe02_MANA = 6;
				BissDerFaeulnis_Stufe02_STR = 4;
				BissDerFaeulnis_Stufe02_DEX = 4;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 26)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 25;
				};

				BissDerFaeulnis_Stufe03_MANA = 12;
				BissDerFaeulnis_Stufe03_STR = 8;
				BissDerFaeulnis_Stufe03_DEX = 8;
			};

			BissDerFaeulnis_Time = 1;
		};
	};

	if (other.aivar[AIV_MM_REAL_ID] == ID_WARG)
	&& (BissDerFaeulnis_Time == 0)
	{
		if (KBDF == 0)
		{
			GiftChance = 20;	// 100 %
		}
		else if (KBDF == 1)
		{
			GiftChance = 16;	// - 20 %
		}
		else if (KBDF == 2)
		{
			GiftChance = 13;	// 100 %
		}
		else if (KBDF == 3)
		{
			GiftChance = 10;	// 100 %
		}
		else if (KBDF == 4)
		{
			GiftChance = 8;	// 100 %
		};

		GiftChance = GiftChance - ((GiftChance*armor)/100);

		if (Hlp_Random(100) < GiftChance)
		{
			// Zeit festlegen

			if (Krankheit == 0)
			{
				BissDerFaeulnis_Stufe01 = 300;
				BissDerFaeulnis_Stufe02 = 300;
				BissDerFaeulnis_Stufe03 = 300;
			}
			else if (Krankheit == 1)
			{
				BissDerFaeulnis_Stufe01 = 270;
				BissDerFaeulnis_Stufe02 = 270;
				BissDerFaeulnis_Stufe03 = 270;
			}
			else if (Krankheit == 2)
			{
				BissDerFaeulnis_Stufe01 = 243;
				BissDerFaeulnis_Stufe02 = 243;
				BissDerFaeulnis_Stufe03 = 243;
			}
			else if (Krankheit == 3)
			{
				BissDerFaeulnis_Stufe01 = 219;
				BissDerFaeulnis_Stufe02 = 219;
				BissDerFaeulnis_Stufe03 = 219;
			}
			else if (Krankheit == 4)
			{
				BissDerFaeulnis_Stufe01 = 197;
				BissDerFaeulnis_Stufe02 = 197;
				BissDerFaeulnis_Stufe03 = 197;
			};

			// Mali festlegen und die Start-Mali gleich abziehen

			if (KBDF == 0)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 11)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 10;
				};

				BissDerFaeulnis_Stufe01_MANA = 10;
				BissDerFaeulnis_Stufe01_STR = 5;
				BissDerFaeulnis_Stufe01_DEX = 5;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 31)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 30;
				};

				BissDerFaeulnis_Stufe02_MANA = 15;
				BissDerFaeulnis_Stufe02_STR = 10;
				BissDerFaeulnis_Stufe02_DEX = 10;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 61)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 60;
				};

				BissDerFaeulnis_Stufe03_MANA = 30;
				BissDerFaeulnis_Stufe03_STR = 20;
				BissDerFaeulnis_Stufe03_DEX = 20;
			}
			else if (KBDF == 1)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 9)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 8;
				};

				BissDerFaeulnis_Stufe01_MANA = 8;
				BissDerFaeulnis_Stufe01_STR = 4;
				BissDerFaeulnis_Stufe01_DEX = 4;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 25)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 24;
				};

				BissDerFaeulnis_Stufe02_MANA = 12;
				BissDerFaeulnis_Stufe02_STR = 8;
				BissDerFaeulnis_Stufe02_DEX = 8;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 49)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 48;
				};

				BissDerFaeulnis_Stufe03_MANA = 24;
				BissDerFaeulnis_Stufe03_STR = 16;
				BissDerFaeulnis_Stufe03_DEX = 16;
			}
			else if (KBDF == 2)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 7)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 6;
				};

				BissDerFaeulnis_Stufe01_MANA = 6;
				BissDerFaeulnis_Stufe01_STR = 3;
				BissDerFaeulnis_Stufe01_DEX = 3;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 20)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 19;
				};

				BissDerFaeulnis_Stufe02_MANA = 10;
				BissDerFaeulnis_Stufe02_STR = 6;
				BissDerFaeulnis_Stufe02_DEX = 6;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 39)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 38;
				};

				BissDerFaeulnis_Stufe03_MANA = 19;
				BissDerFaeulnis_Stufe03_STR = 13;
				BissDerFaeulnis_Stufe03_DEX = 13;
			}
			else if (KBDF == 3)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 6)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 5;
				};

				BissDerFaeulnis_Stufe01_MANA = 5;
				BissDerFaeulnis_Stufe01_STR = 3;
				BissDerFaeulnis_Stufe01_DEX = 3;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 16)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 15;
				};

				BissDerFaeulnis_Stufe02_MANA = 8;
				BissDerFaeulnis_Stufe02_STR = 5;
				BissDerFaeulnis_Stufe02_DEX = 5;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 32)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 31;
				};

				BissDerFaeulnis_Stufe03_MANA = 15;
				BissDerFaeulnis_Stufe03_STR = 10;
				BissDerFaeulnis_Stufe03_DEX = 10;
			}
			else if (KBDF == 4)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 5)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 4;
				};

				BissDerFaeulnis_Stufe01_MANA = 4;
				BissDerFaeulnis_Stufe01_STR = 2;
				BissDerFaeulnis_Stufe01_DEX = 2;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 13)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 12;
				};

				BissDerFaeulnis_Stufe02_MANA = 6;
				BissDerFaeulnis_Stufe02_STR = 4;
				BissDerFaeulnis_Stufe02_DEX = 4;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 26)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 25;
				};

				BissDerFaeulnis_Stufe03_MANA = 12;
				BissDerFaeulnis_Stufe03_STR = 8;
				BissDerFaeulnis_Stufe03_DEX = 8;
			};

			BissDerFaeulnis_Time = 1;
		};
	};

	if (other.aivar[AIV_MM_REAL_ID] == ID_SNAPPER)
	&& (BissDerFaeulnis_Time == 0)
	{
		if (KBDF == 0)
		{
			GiftChance = 20;	// 100 %
		}
		else if (KBDF == 1)
		{
			GiftChance = 16;	// - 20 %
		}
		else if (KBDF == 2)
		{
			GiftChance = 13;	// 100 %
		}
		else if (KBDF == 3)
		{
			GiftChance = 10;	// 100 %
		}
		else if (KBDF == 4)
		{
			GiftChance = 8;	// 100 %
		};

		GiftChance = GiftChance - ((GiftChance*armor)/100);

		if (Hlp_Random(100) < GiftChance)
		{
			// Zeit festlegen

			if (Krankheit == 0)
			{
				BissDerFaeulnis_Stufe01 = 300;
				BissDerFaeulnis_Stufe02 = 300;
				BissDerFaeulnis_Stufe03 = 300;
			}
			else if (Krankheit == 1)
			{
				BissDerFaeulnis_Stufe01 = 270;
				BissDerFaeulnis_Stufe02 = 270;
				BissDerFaeulnis_Stufe03 = 270;
			}
			else if (Krankheit == 2)
			{
				BissDerFaeulnis_Stufe01 = 243;
				BissDerFaeulnis_Stufe02 = 243;
				BissDerFaeulnis_Stufe03 = 243;
			}
			else if (Krankheit == 3)
			{
				BissDerFaeulnis_Stufe01 = 219;
				BissDerFaeulnis_Stufe02 = 219;
				BissDerFaeulnis_Stufe03 = 219;
			}
			else if (Krankheit == 4)
			{
				BissDerFaeulnis_Stufe01 = 197;
				BissDerFaeulnis_Stufe02 = 197;
				BissDerFaeulnis_Stufe03 = 197;
			};

			// Mali festlegen und die Start-Mali gleich abziehen

			if (KBDF == 0)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 11)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 10;
				};

				BissDerFaeulnis_Stufe01_MANA = 10;
				BissDerFaeulnis_Stufe01_STR = 5;
				BissDerFaeulnis_Stufe01_DEX = 5;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 31)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 30;
				};

				BissDerFaeulnis_Stufe02_MANA = 15;
				BissDerFaeulnis_Stufe02_STR = 10;
				BissDerFaeulnis_Stufe02_DEX = 10;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 61)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 60;
				};

				BissDerFaeulnis_Stufe03_MANA = 30;
				BissDerFaeulnis_Stufe03_STR = 20;
				BissDerFaeulnis_Stufe03_DEX = 20;
			}
			else if (KBDF == 1)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 9)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 8;
				};

				BissDerFaeulnis_Stufe01_MANA = 8;
				BissDerFaeulnis_Stufe01_STR = 4;
				BissDerFaeulnis_Stufe01_DEX = 4;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 25)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 24;
				};

				BissDerFaeulnis_Stufe02_MANA = 12;
				BissDerFaeulnis_Stufe02_STR = 8;
				BissDerFaeulnis_Stufe02_DEX = 8;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 49)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 48;
				};

				BissDerFaeulnis_Stufe03_MANA = 24;
				BissDerFaeulnis_Stufe03_STR = 16;
				BissDerFaeulnis_Stufe03_DEX = 16;
			}
			else if (KBDF == 2)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 7)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 6;
				};

				BissDerFaeulnis_Stufe01_MANA = 6;
				BissDerFaeulnis_Stufe01_STR = 3;
				BissDerFaeulnis_Stufe01_DEX = 3;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 20)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 19;
				};

				BissDerFaeulnis_Stufe02_MANA = 10;
				BissDerFaeulnis_Stufe02_STR = 6;
				BissDerFaeulnis_Stufe02_DEX = 6;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 39)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 38;
				};

				BissDerFaeulnis_Stufe03_MANA = 19;
				BissDerFaeulnis_Stufe03_STR = 13;
				BissDerFaeulnis_Stufe03_DEX = 13;
			}
			else if (KBDF == 3)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 6)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 5;
				};

				BissDerFaeulnis_Stufe01_MANA = 5;
				BissDerFaeulnis_Stufe01_STR = 3;
				BissDerFaeulnis_Stufe01_DEX = 3;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 16)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 15;
				};

				BissDerFaeulnis_Stufe02_MANA = 8;
				BissDerFaeulnis_Stufe02_STR = 5;
				BissDerFaeulnis_Stufe02_DEX = 5;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 32)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 31;
				};

				BissDerFaeulnis_Stufe03_MANA = 15;
				BissDerFaeulnis_Stufe03_STR = 10;
				BissDerFaeulnis_Stufe03_DEX = 10;
			}
			else if (KBDF == 4)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 5)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 4;
				};

				BissDerFaeulnis_Stufe01_MANA = 4;
				BissDerFaeulnis_Stufe01_STR = 2;
				BissDerFaeulnis_Stufe01_DEX = 2;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 13)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 12;
				};

				BissDerFaeulnis_Stufe02_MANA = 6;
				BissDerFaeulnis_Stufe02_STR = 4;
				BissDerFaeulnis_Stufe02_DEX = 4;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 26)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 25;
				};

				BissDerFaeulnis_Stufe03_MANA = 12;
				BissDerFaeulnis_Stufe03_STR = 8;
				BissDerFaeulnis_Stufe03_DEX = 8;
			};

			BissDerFaeulnis_Time = 1;
		};
	};

	if (other.aivar[AIV_MM_REAL_ID] == ID_DRAGONSNAPPER)
	&& (BissDerFaeulnis_Time == 0)
	{
		if (KBDF == 0)
		{
			GiftChance = 20;	// 100 %
		}
		else if (KBDF == 1)
		{
			GiftChance = 16;	// - 20 %
		}
		else if (KBDF == 2)
		{
			GiftChance = 13;	// 100 %
		}
		else if (KBDF == 3)
		{
			GiftChance = 10;	// 100 %
		}
		else if (KBDF == 4)
		{
			GiftChance = 8;	// 100 %
		};

		GiftChance = GiftChance - ((GiftChance*armor)/100);

		if (Hlp_Random(100) < GiftChance)
		{
			// Zeit festlegen

			if (Krankheit == 0)
			{
				BissDerFaeulnis_Stufe01 = 300;
				BissDerFaeulnis_Stufe02 = 300;
				BissDerFaeulnis_Stufe03 = 300;
			}
			else if (Krankheit == 1)
			{
				BissDerFaeulnis_Stufe01 = 270;
				BissDerFaeulnis_Stufe02 = 270;
				BissDerFaeulnis_Stufe03 = 270;
			}
			else if (Krankheit == 2)
			{
				BissDerFaeulnis_Stufe01 = 243;
				BissDerFaeulnis_Stufe02 = 243;
				BissDerFaeulnis_Stufe03 = 243;
			}
			else if (Krankheit == 3)
			{
				BissDerFaeulnis_Stufe01 = 219;
				BissDerFaeulnis_Stufe02 = 219;
				BissDerFaeulnis_Stufe03 = 219;
			}
			else if (Krankheit == 4)
			{
				BissDerFaeulnis_Stufe01 = 197;
				BissDerFaeulnis_Stufe02 = 197;
				BissDerFaeulnis_Stufe03 = 197;
			};

			// Mali festlegen und die Start-Mali gleich abziehen

			if (KBDF == 0)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 11)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 10;
				};

				BissDerFaeulnis_Stufe01_MANA = 10;
				BissDerFaeulnis_Stufe01_STR = 5;
				BissDerFaeulnis_Stufe01_DEX = 5;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 31)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 30;
				};

				BissDerFaeulnis_Stufe02_MANA = 15;
				BissDerFaeulnis_Stufe02_STR = 10;
				BissDerFaeulnis_Stufe02_DEX = 10;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 61)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 60;
				};

				BissDerFaeulnis_Stufe03_MANA = 30;
				BissDerFaeulnis_Stufe03_STR = 20;
				BissDerFaeulnis_Stufe03_DEX = 20;
			}
			else if (KBDF == 1)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 9)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 8;
				};

				BissDerFaeulnis_Stufe01_MANA = 8;
				BissDerFaeulnis_Stufe01_STR = 4;
				BissDerFaeulnis_Stufe01_DEX = 4;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 25)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 24;
				};

				BissDerFaeulnis_Stufe02_MANA = 12;
				BissDerFaeulnis_Stufe02_STR = 8;
				BissDerFaeulnis_Stufe02_DEX = 8;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 49)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 48;
				};

				BissDerFaeulnis_Stufe03_MANA = 24;
				BissDerFaeulnis_Stufe03_STR = 16;
				BissDerFaeulnis_Stufe03_DEX = 16;
			}
			else if (KBDF == 2)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 7)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 6;
				};

				BissDerFaeulnis_Stufe01_MANA = 6;
				BissDerFaeulnis_Stufe01_STR = 3;
				BissDerFaeulnis_Stufe01_DEX = 3;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 20)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 19;
				};

				BissDerFaeulnis_Stufe02_MANA = 10;
				BissDerFaeulnis_Stufe02_STR = 6;
				BissDerFaeulnis_Stufe02_DEX = 6;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 39)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 38;
				};

				BissDerFaeulnis_Stufe03_MANA = 19;
				BissDerFaeulnis_Stufe03_STR = 13;
				BissDerFaeulnis_Stufe03_DEX = 13;
			}
			else if (KBDF == 3)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 6)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 5;
				};

				BissDerFaeulnis_Stufe01_MANA = 5;
				BissDerFaeulnis_Stufe01_STR = 3;
				BissDerFaeulnis_Stufe01_DEX = 3;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 16)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 15;
				};

				BissDerFaeulnis_Stufe02_MANA = 8;
				BissDerFaeulnis_Stufe02_STR = 5;
				BissDerFaeulnis_Stufe02_DEX = 5;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 32)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 31;
				};

				BissDerFaeulnis_Stufe03_MANA = 15;
				BissDerFaeulnis_Stufe03_STR = 10;
				BissDerFaeulnis_Stufe03_DEX = 10;
			}
			else if (KBDF == 4)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 5)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 4;
				};

				BissDerFaeulnis_Stufe01_MANA = 4;
				BissDerFaeulnis_Stufe01_STR = 2;
				BissDerFaeulnis_Stufe01_DEX = 2;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 13)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 12;
				};

				BissDerFaeulnis_Stufe02_MANA = 6;
				BissDerFaeulnis_Stufe02_STR = 4;
				BissDerFaeulnis_Stufe02_DEX = 4;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 26)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 25;
				};

				BissDerFaeulnis_Stufe03_MANA = 12;
				BissDerFaeulnis_Stufe03_STR = 8;
				BissDerFaeulnis_Stufe03_DEX = 8;
			};

			BissDerFaeulnis_Time = 1;
		};
	};

	if (other.aivar[AIV_MM_REAL_ID] == ID_WOLF)
	&& (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(BlackWolf))
	&& (BissDerFaeulnis_Time == 0)
	{
		if (KBDF == 0)
		{
			GiftChance = 20;	// 100 %
		}
		else if (KBDF == 1)
		{
			GiftChance = 16;	// - 20 %
		}
		else if (KBDF == 2)
		{
			GiftChance = 13;	// 100 %
		}
		else if (KBDF == 3)
		{
			GiftChance = 10;	// 100 %
		}
		else if (KBDF == 4)
		{
			GiftChance = 8;	// 100 %
		};

		GiftChance = GiftChance - ((GiftChance*armor)/100);

		if (Hlp_Random(100) < GiftChance)
		{
			// Zeit festlegen

			if (Krankheit == 0)
			{
				BissDerFaeulnis_Stufe01 = 300;
				BissDerFaeulnis_Stufe02 = 300;
				BissDerFaeulnis_Stufe03 = 300;
			}
			else if (Krankheit == 1)
			{
				BissDerFaeulnis_Stufe01 = 270;
				BissDerFaeulnis_Stufe02 = 270;
				BissDerFaeulnis_Stufe03 = 270;
			}
			else if (Krankheit == 2)
			{
				BissDerFaeulnis_Stufe01 = 243;
				BissDerFaeulnis_Stufe02 = 243;
				BissDerFaeulnis_Stufe03 = 243;
			}
			else if (Krankheit == 3)
			{
				BissDerFaeulnis_Stufe01 = 219;
				BissDerFaeulnis_Stufe02 = 219;
				BissDerFaeulnis_Stufe03 = 219;
			}
			else if (Krankheit == 4)
			{
				BissDerFaeulnis_Stufe01 = 197;
				BissDerFaeulnis_Stufe02 = 197;
				BissDerFaeulnis_Stufe03 = 197;
			};

			// Mali festlegen und die Start-Mali gleich abziehen

			if (KBDF == 0)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 11)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 10;
				};

				BissDerFaeulnis_Stufe01_MANA = 10;
				BissDerFaeulnis_Stufe01_STR = 5;
				BissDerFaeulnis_Stufe01_DEX = 5;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 31)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 30;
				};

				BissDerFaeulnis_Stufe02_MANA = 15;
				BissDerFaeulnis_Stufe02_STR = 10;
				BissDerFaeulnis_Stufe02_DEX = 10;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 61)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 60;
				};

				BissDerFaeulnis_Stufe03_MANA = 30;
				BissDerFaeulnis_Stufe03_STR = 20;
				BissDerFaeulnis_Stufe03_DEX = 20;
			}
			else if (KBDF == 1)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 9)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 8;
				};

				BissDerFaeulnis_Stufe01_MANA = 8;
				BissDerFaeulnis_Stufe01_STR = 4;
				BissDerFaeulnis_Stufe01_DEX = 4;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 25)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 24;
				};

				BissDerFaeulnis_Stufe02_MANA = 12;
				BissDerFaeulnis_Stufe02_STR = 8;
				BissDerFaeulnis_Stufe02_DEX = 8;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 49)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 48;
				};

				BissDerFaeulnis_Stufe03_MANA = 24;
				BissDerFaeulnis_Stufe03_STR = 16;
				BissDerFaeulnis_Stufe03_DEX = 16;
			}
			else if (KBDF == 2)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 7)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 6;
				};

				BissDerFaeulnis_Stufe01_MANA = 6;
				BissDerFaeulnis_Stufe01_STR = 3;
				BissDerFaeulnis_Stufe01_DEX = 3;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 20)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 19;
				};

				BissDerFaeulnis_Stufe02_MANA = 10;
				BissDerFaeulnis_Stufe02_STR = 6;
				BissDerFaeulnis_Stufe02_DEX = 6;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 39)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 38;
				};

				BissDerFaeulnis_Stufe03_MANA = 19;
				BissDerFaeulnis_Stufe03_STR = 13;
				BissDerFaeulnis_Stufe03_DEX = 13;
			}
			else if (KBDF == 3)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 6)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 5;
				};

				BissDerFaeulnis_Stufe01_MANA = 5;
				BissDerFaeulnis_Stufe01_STR = 3;
				BissDerFaeulnis_Stufe01_DEX = 3;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 16)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 15;
				};

				BissDerFaeulnis_Stufe02_MANA = 8;
				BissDerFaeulnis_Stufe02_STR = 5;
				BissDerFaeulnis_Stufe02_DEX = 5;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 32)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 31;
				};

				BissDerFaeulnis_Stufe03_MANA = 15;
				BissDerFaeulnis_Stufe03_STR = 10;
				BissDerFaeulnis_Stufe03_DEX = 10;
			}
			else if (KBDF == 4)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 5)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 4;
				};

				BissDerFaeulnis_Stufe01_MANA = 4;
				BissDerFaeulnis_Stufe01_STR = 2;
				BissDerFaeulnis_Stufe01_DEX = 2;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 13)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 12;
				};

				BissDerFaeulnis_Stufe02_MANA = 6;
				BissDerFaeulnis_Stufe02_STR = 4;
				BissDerFaeulnis_Stufe02_DEX = 4;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 26)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 25;
				};

				BissDerFaeulnis_Stufe03_MANA = 12;
				BissDerFaeulnis_Stufe03_STR = 8;
				BissDerFaeulnis_Stufe03_DEX = 8;
			};

			BissDerFaeulnis_Time = 1;
		};
	};

	if (other.aivar[AIV_MM_REAL_ID] == ID_GIANT_RAT)
	&& (BissDerFaeulnis_Time == 0)
	{
		if (KBDF == 0)
		{
			GiftChance = 30;	// 100 %
		}
		else if (KBDF == 1)
		{
			GiftChance = 24;	// - 20 %
		}
		else if (KBDF == 2)
		{
			GiftChance = 19;	// 100 %
		}
		else if (KBDF == 3)
		{
			GiftChance = 15;	// 100 %
		}
		else if (KBDF == 4)
		{
			GiftChance = 12;	// 100 %
		};

		GiftChance = GiftChance - ((GiftChance*armor)/100);

		if (Hlp_Random(100) < GiftChance)
		{
			// Zeit festlegen

			if (Krankheit == 0)
			{
				BissDerFaeulnis_Stufe01 = 300;
				BissDerFaeulnis_Stufe02 = 300;
				BissDerFaeulnis_Stufe03 = 300;
			}
			else if (Krankheit == 1)
			{
				BissDerFaeulnis_Stufe01 = 270;
				BissDerFaeulnis_Stufe02 = 270;
				BissDerFaeulnis_Stufe03 = 270;
			}
			else if (Krankheit == 2)
			{
				BissDerFaeulnis_Stufe01 = 243;
				BissDerFaeulnis_Stufe02 = 243;
				BissDerFaeulnis_Stufe03 = 243;
			}
			else if (Krankheit == 3)
			{
				BissDerFaeulnis_Stufe01 = 219;
				BissDerFaeulnis_Stufe02 = 219;
				BissDerFaeulnis_Stufe03 = 219;
			}
			else if (Krankheit == 4)
			{
				BissDerFaeulnis_Stufe01 = 197;
				BissDerFaeulnis_Stufe02 = 197;
				BissDerFaeulnis_Stufe03 = 197;
			};

			// Mali festlegen und die Start-Mali gleich abziehen

			if (KBDF == 0)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 11)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 10;
				};

				BissDerFaeulnis_Stufe01_MANA = 10;
				BissDerFaeulnis_Stufe01_STR = 5;
				BissDerFaeulnis_Stufe01_DEX = 5;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 31)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 30;
				};

				BissDerFaeulnis_Stufe02_MANA = 15;
				BissDerFaeulnis_Stufe02_STR = 10;
				BissDerFaeulnis_Stufe02_DEX = 10;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 61)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 60;
				};

				BissDerFaeulnis_Stufe03_MANA = 30;
				BissDerFaeulnis_Stufe03_STR = 20;
				BissDerFaeulnis_Stufe03_DEX = 20;
			}
			else if (KBDF == 1)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 9)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 8;
				};

				BissDerFaeulnis_Stufe01_MANA = 8;
				BissDerFaeulnis_Stufe01_STR = 4;
				BissDerFaeulnis_Stufe01_DEX = 4;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 25)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 24;
				};

				BissDerFaeulnis_Stufe02_MANA = 12;
				BissDerFaeulnis_Stufe02_STR = 8;
				BissDerFaeulnis_Stufe02_DEX = 8;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 49)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 48;
				};

				BissDerFaeulnis_Stufe03_MANA = 24;
				BissDerFaeulnis_Stufe03_STR = 16;
				BissDerFaeulnis_Stufe03_DEX = 16;
			}
			else if (KBDF == 2)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 7)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 6;
				};

				BissDerFaeulnis_Stufe01_MANA = 6;
				BissDerFaeulnis_Stufe01_STR = 3;
				BissDerFaeulnis_Stufe01_DEX = 3;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 20)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 19;
				};

				BissDerFaeulnis_Stufe02_MANA = 10;
				BissDerFaeulnis_Stufe02_STR = 6;
				BissDerFaeulnis_Stufe02_DEX = 6;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 39)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 38;
				};

				BissDerFaeulnis_Stufe03_MANA = 19;
				BissDerFaeulnis_Stufe03_STR = 13;
				BissDerFaeulnis_Stufe03_DEX = 13;
			}
			else if (KBDF == 3)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 6)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 5;
				};

				BissDerFaeulnis_Stufe01_MANA = 5;
				BissDerFaeulnis_Stufe01_STR = 3;
				BissDerFaeulnis_Stufe01_DEX = 3;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 16)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 15;
				};

				BissDerFaeulnis_Stufe02_MANA = 8;
				BissDerFaeulnis_Stufe02_STR = 5;
				BissDerFaeulnis_Stufe02_DEX = 5;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 32)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 31;
				};

				BissDerFaeulnis_Stufe03_MANA = 15;
				BissDerFaeulnis_Stufe03_STR = 10;
				BissDerFaeulnis_Stufe03_DEX = 10;
			}
			else if (KBDF == 4)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 5)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 4;
				};

				BissDerFaeulnis_Stufe01_MANA = 4;
				BissDerFaeulnis_Stufe01_STR = 2;
				BissDerFaeulnis_Stufe01_DEX = 2;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 13)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 12;
				};

				BissDerFaeulnis_Stufe02_MANA = 6;
				BissDerFaeulnis_Stufe02_STR = 4;
				BissDerFaeulnis_Stufe02_DEX = 4;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 26)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 25;
				};

				BissDerFaeulnis_Stufe03_MANA = 12;
				BissDerFaeulnis_Stufe03_STR = 8;
				BissDerFaeulnis_Stufe03_DEX = 8;
			};

			BissDerFaeulnis_Time = 1;
		};
	};

	if (other.aivar[AIV_MM_REAL_ID] == ID_HARPY)
	&& (BissDerFaeulnis_Time == 0)
	{
		if (KBDF == 0)
		{
			GiftChance = 20;	// 100 %
		}
		else if (KBDF == 1)
		{
			GiftChance = 16;	// - 20 %
		}
		else if (KBDF == 2)
		{
			GiftChance = 13;	// 100 %
		}
		else if (KBDF == 3)
		{
			GiftChance = 10;	// 100 %
		}
		else if (KBDF == 4)
		{
			GiftChance = 8;	// 100 %
		};

		GiftChance = GiftChance - ((GiftChance*armor)/100);

		if (Hlp_Random(100) < GiftChance)
		{
			// Zeit festlegen

			if (Krankheit == 0)
			{
				BissDerFaeulnis_Stufe01 = 300;
				BissDerFaeulnis_Stufe02 = 300;
				BissDerFaeulnis_Stufe03 = 300;
			}
			else if (Krankheit == 1)
			{
				BissDerFaeulnis_Stufe01 = 270;
				BissDerFaeulnis_Stufe02 = 270;
				BissDerFaeulnis_Stufe03 = 270;
			}
			else if (Krankheit == 2)
			{
				BissDerFaeulnis_Stufe01 = 243;
				BissDerFaeulnis_Stufe02 = 243;
				BissDerFaeulnis_Stufe03 = 243;
			}
			else if (Krankheit == 3)
			{
				BissDerFaeulnis_Stufe01 = 219;
				BissDerFaeulnis_Stufe02 = 219;
				BissDerFaeulnis_Stufe03 = 219;
			}
			else if (Krankheit == 4)
			{
				BissDerFaeulnis_Stufe01 = 197;
				BissDerFaeulnis_Stufe02 = 197;
				BissDerFaeulnis_Stufe03 = 197;
			};

			// Mali festlegen und die Start-Mali gleich abziehen

			if (KBDF == 0)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 11)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 10;
				};

				BissDerFaeulnis_Stufe01_MANA = 10;
				BissDerFaeulnis_Stufe01_STR = 5;
				BissDerFaeulnis_Stufe01_DEX = 5;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 31)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 30;
				};

				BissDerFaeulnis_Stufe02_MANA = 15;
				BissDerFaeulnis_Stufe02_STR = 10;
				BissDerFaeulnis_Stufe02_DEX = 10;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 61)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 60;
				};

				BissDerFaeulnis_Stufe03_MANA = 30;
				BissDerFaeulnis_Stufe03_STR = 20;
				BissDerFaeulnis_Stufe03_DEX = 20;
			}
			else if (KBDF == 1)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 9)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 8;
				};

				BissDerFaeulnis_Stufe01_MANA = 8;
				BissDerFaeulnis_Stufe01_STR = 4;
				BissDerFaeulnis_Stufe01_DEX = 4;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 25)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 24;
				};

				BissDerFaeulnis_Stufe02_MANA = 12;
				BissDerFaeulnis_Stufe02_STR = 8;
				BissDerFaeulnis_Stufe02_DEX = 8;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 49)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 48;
				};

				BissDerFaeulnis_Stufe03_MANA = 24;
				BissDerFaeulnis_Stufe03_STR = 16;
				BissDerFaeulnis_Stufe03_DEX = 16;
			}
			else if (KBDF == 2)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 7)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 6;
				};

				BissDerFaeulnis_Stufe01_MANA = 6;
				BissDerFaeulnis_Stufe01_STR = 3;
				BissDerFaeulnis_Stufe01_DEX = 3;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 20)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 19;
				};

				BissDerFaeulnis_Stufe02_MANA = 10;
				BissDerFaeulnis_Stufe02_STR = 6;
				BissDerFaeulnis_Stufe02_DEX = 6;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 39)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 38;
				};

				BissDerFaeulnis_Stufe03_MANA = 19;
				BissDerFaeulnis_Stufe03_STR = 13;
				BissDerFaeulnis_Stufe03_DEX = 13;
			}
			else if (KBDF == 3)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 6)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 5;
				};

				BissDerFaeulnis_Stufe01_MANA = 5;
				BissDerFaeulnis_Stufe01_STR = 3;
				BissDerFaeulnis_Stufe01_DEX = 3;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 16)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 15;
				};

				BissDerFaeulnis_Stufe02_MANA = 8;
				BissDerFaeulnis_Stufe02_STR = 5;
				BissDerFaeulnis_Stufe02_DEX = 5;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 32)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 31;
				};

				BissDerFaeulnis_Stufe03_MANA = 15;
				BissDerFaeulnis_Stufe03_STR = 10;
				BissDerFaeulnis_Stufe03_DEX = 10;
			}
			else if (KBDF == 4)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 5)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 4;
				};

				BissDerFaeulnis_Stufe01_MANA = 4;
				BissDerFaeulnis_Stufe01_STR = 2;
				BissDerFaeulnis_Stufe01_DEX = 2;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 13)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 12;
				};

				BissDerFaeulnis_Stufe02_MANA = 6;
				BissDerFaeulnis_Stufe02_STR = 4;
				BissDerFaeulnis_Stufe02_DEX = 4;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 26)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 25;
				};

				BissDerFaeulnis_Stufe03_MANA = 12;
				BissDerFaeulnis_Stufe03_STR = 8;
				BissDerFaeulnis_Stufe03_DEX = 8;
			};

			BissDerFaeulnis_Time = 1;
		};
	};

	if (other.aivar[AIV_MM_REAL_ID] == ID_SWAMPRAT)
	&& (BissDerFaeulnis_Time == 0)
	{
		if (KBDF == 0)
		{
			GiftChance = 30;	// 100 %
		}
		else if (KBDF == 1)
		{
			GiftChance = 24;	// - 20 %
		}
		else if (KBDF == 2)
		{
			GiftChance = 19;	// 100 %
		}
		else if (KBDF == 3)
		{
			GiftChance = 15;	// 100 %
		}
		else if (KBDF == 4)
		{
			GiftChance = 12;	// 100 %
		};

		GiftChance = GiftChance - ((GiftChance*armor)/100);

		if (Hlp_Random(100) < GiftChance)
		{
			// Zeit festlegen

			if (Krankheit == 0)
			{
				BissDerFaeulnis_Stufe01 = 300;
				BissDerFaeulnis_Stufe02 = 300;
				BissDerFaeulnis_Stufe03 = 300;
			}
			else if (Krankheit == 1)
			{
				BissDerFaeulnis_Stufe01 = 270;
				BissDerFaeulnis_Stufe02 = 270;
				BissDerFaeulnis_Stufe03 = 270;
			}
			else if (Krankheit == 2)
			{
				BissDerFaeulnis_Stufe01 = 243;
				BissDerFaeulnis_Stufe02 = 243;
				BissDerFaeulnis_Stufe03 = 243;
			}
			else if (Krankheit == 3)
			{
				BissDerFaeulnis_Stufe01 = 219;
				BissDerFaeulnis_Stufe02 = 219;
				BissDerFaeulnis_Stufe03 = 219;
			}
			else if (Krankheit == 4)
			{
				BissDerFaeulnis_Stufe01 = 197;
				BissDerFaeulnis_Stufe02 = 197;
				BissDerFaeulnis_Stufe03 = 197;
			};

			// Mali festlegen und die Start-Mali gleich abziehen

			if (KBDF == 0)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 11)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 10;
				};

				BissDerFaeulnis_Stufe01_MANA = 10;
				BissDerFaeulnis_Stufe01_STR = 5;
				BissDerFaeulnis_Stufe01_DEX = 5;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 31)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 30;
				};

				BissDerFaeulnis_Stufe02_MANA = 15;
				BissDerFaeulnis_Stufe02_STR = 10;
				BissDerFaeulnis_Stufe02_DEX = 10;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 61)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 60;
				};

				BissDerFaeulnis_Stufe03_MANA = 30;
				BissDerFaeulnis_Stufe03_STR = 20;
				BissDerFaeulnis_Stufe03_DEX = 20;
			}
			else if (KBDF == 1)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 9)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 8;
				};

				BissDerFaeulnis_Stufe01_MANA = 8;
				BissDerFaeulnis_Stufe01_STR = 4;
				BissDerFaeulnis_Stufe01_DEX = 4;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 25)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 24;
				};

				BissDerFaeulnis_Stufe02_MANA = 12;
				BissDerFaeulnis_Stufe02_STR = 8;
				BissDerFaeulnis_Stufe02_DEX = 8;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 49)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 48;
				};

				BissDerFaeulnis_Stufe03_MANA = 24;
				BissDerFaeulnis_Stufe03_STR = 16;
				BissDerFaeulnis_Stufe03_DEX = 16;
			}
			else if (KBDF == 2)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 7)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 6;
				};

				BissDerFaeulnis_Stufe01_MANA = 6;
				BissDerFaeulnis_Stufe01_STR = 3;
				BissDerFaeulnis_Stufe01_DEX = 3;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 20)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 19;
				};

				BissDerFaeulnis_Stufe02_MANA = 10;
				BissDerFaeulnis_Stufe02_STR = 6;
				BissDerFaeulnis_Stufe02_DEX = 6;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 39)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 38;
				};

				BissDerFaeulnis_Stufe03_MANA = 19;
				BissDerFaeulnis_Stufe03_STR = 13;
				BissDerFaeulnis_Stufe03_DEX = 13;
			}
			else if (KBDF == 3)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 6)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 5;
				};

				BissDerFaeulnis_Stufe01_MANA = 5;
				BissDerFaeulnis_Stufe01_STR = 3;
				BissDerFaeulnis_Stufe01_DEX = 3;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 16)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 15;
				};

				BissDerFaeulnis_Stufe02_MANA = 8;
				BissDerFaeulnis_Stufe02_STR = 5;
				BissDerFaeulnis_Stufe02_DEX = 5;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 32)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 31;
				};

				BissDerFaeulnis_Stufe03_MANA = 15;
				BissDerFaeulnis_Stufe03_STR = 10;
				BissDerFaeulnis_Stufe03_DEX = 10;
			}
			else if (KBDF == 4)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 5)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 4;
				};

				BissDerFaeulnis_Stufe01_MANA = 4;
				BissDerFaeulnis_Stufe01_STR = 2;
				BissDerFaeulnis_Stufe01_DEX = 2;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 13)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 12;
				};

				BissDerFaeulnis_Stufe02_MANA = 6;
				BissDerFaeulnis_Stufe02_STR = 4;
				BissDerFaeulnis_Stufe02_DEX = 4;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 26)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 25;
				};

				BissDerFaeulnis_Stufe03_MANA = 12;
				BissDerFaeulnis_Stufe03_STR = 8;
				BissDerFaeulnis_Stufe03_DEX = 8;
			};

			BissDerFaeulnis_Time = 1;
		};
	};

	if (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Mod_7656_OUT_Suchender_REL))
	&& (BissDerFaeulnis_Time == 0)
	{
		if (KBDF == 0)
		{
			GiftChance = 30;	// 100 %
		}
		else if (KBDF == 1)
		{
			GiftChance = 24;	// - 20 %
		}
		else if (KBDF == 2)
		{
			GiftChance = 19;	// 100 %
		}
		else if (KBDF == 3)
		{
			GiftChance = 15;	// 100 %
		}
		else if (KBDF == 4)
		{
			GiftChance = 12;	// 100 %
		};

		GiftChance = GiftChance - ((GiftChance*armor)/100);

		if (Hlp_Random(100) < GiftChance)
		{
			// Zeit festlegen

			if (Krankheit == 0)
			{
				BissDerFaeulnis_Stufe01 = 300;
				BissDerFaeulnis_Stufe02 = 300;
				BissDerFaeulnis_Stufe03 = 300;
			}
			else if (Krankheit == 1)
			{
				BissDerFaeulnis_Stufe01 = 270;
				BissDerFaeulnis_Stufe02 = 270;
				BissDerFaeulnis_Stufe03 = 270;
			}
			else if (Krankheit == 2)
			{
				BissDerFaeulnis_Stufe01 = 243;
				BissDerFaeulnis_Stufe02 = 243;
				BissDerFaeulnis_Stufe03 = 243;
			}
			else if (Krankheit == 3)
			{
				BissDerFaeulnis_Stufe01 = 219;
				BissDerFaeulnis_Stufe02 = 219;
				BissDerFaeulnis_Stufe03 = 219;
			}
			else if (Krankheit == 4)
			{
				BissDerFaeulnis_Stufe01 = 197;
				BissDerFaeulnis_Stufe02 = 197;
				BissDerFaeulnis_Stufe03 = 197;
			};

			// Mali festlegen und die Start-Mali gleich abziehen

			if (KBDF == 0)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 11)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 10;
				};

				BissDerFaeulnis_Stufe01_MANA = 10;
				BissDerFaeulnis_Stufe01_STR = 5;
				BissDerFaeulnis_Stufe01_DEX = 5;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 31)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 30;
				};

				BissDerFaeulnis_Stufe02_MANA = 15;
				BissDerFaeulnis_Stufe02_STR = 10;
				BissDerFaeulnis_Stufe02_DEX = 10;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 61)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 60;
				};

				BissDerFaeulnis_Stufe03_MANA = 30;
				BissDerFaeulnis_Stufe03_STR = 20;
				BissDerFaeulnis_Stufe03_DEX = 20;
			}
			else if (KBDF == 1)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 9)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 8;
				};

				BissDerFaeulnis_Stufe01_MANA = 8;
				BissDerFaeulnis_Stufe01_STR = 4;
				BissDerFaeulnis_Stufe01_DEX = 4;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 25)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 24;
				};

				BissDerFaeulnis_Stufe02_MANA = 12;
				BissDerFaeulnis_Stufe02_STR = 8;
				BissDerFaeulnis_Stufe02_DEX = 8;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 49)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 48;
				};

				BissDerFaeulnis_Stufe03_MANA = 24;
				BissDerFaeulnis_Stufe03_STR = 16;
				BissDerFaeulnis_Stufe03_DEX = 16;
			}
			else if (KBDF == 2)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 7)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 6;
				};

				BissDerFaeulnis_Stufe01_MANA = 6;
				BissDerFaeulnis_Stufe01_STR = 3;
				BissDerFaeulnis_Stufe01_DEX = 3;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 20)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 19;
				};

				BissDerFaeulnis_Stufe02_MANA = 10;
				BissDerFaeulnis_Stufe02_STR = 6;
				BissDerFaeulnis_Stufe02_DEX = 6;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 39)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 38;
				};

				BissDerFaeulnis_Stufe03_MANA = 19;
				BissDerFaeulnis_Stufe03_STR = 13;
				BissDerFaeulnis_Stufe03_DEX = 13;
			}
			else if (KBDF == 3)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 6)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 5;
				};

				BissDerFaeulnis_Stufe01_MANA = 5;
				BissDerFaeulnis_Stufe01_STR = 3;
				BissDerFaeulnis_Stufe01_DEX = 3;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 16)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 15;
				};

				BissDerFaeulnis_Stufe02_MANA = 8;
				BissDerFaeulnis_Stufe02_STR = 5;
				BissDerFaeulnis_Stufe02_DEX = 5;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 32)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 31;
				};

				BissDerFaeulnis_Stufe03_MANA = 15;
				BissDerFaeulnis_Stufe03_STR = 10;
				BissDerFaeulnis_Stufe03_DEX = 10;
			}
			else if (KBDF == 4)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 5)
				{
					BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe01_HP = 4;
				};

				BissDerFaeulnis_Stufe01_MANA = 4;
				BissDerFaeulnis_Stufe01_STR = 2;
				BissDerFaeulnis_Stufe01_DEX = 2;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 13)
				{
					BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe02_HP = 12;
				};

				BissDerFaeulnis_Stufe02_MANA = 6;
				BissDerFaeulnis_Stufe02_STR = 4;
				BissDerFaeulnis_Stufe02_DEX = 4;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 26)
				{
					BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					BissDerFaeulnis_Stufe03_HP = 25;
				};

				BissDerFaeulnis_Stufe03_MANA = 12;
				BissDerFaeulnis_Stufe03_STR = 8;
				BissDerFaeulnis_Stufe03_DEX = 8;
			};

			BissDerFaeulnis_Time = 1;
		};
	};

	// Hauch der Pestilenz

	if (other.aivar[AIV_MM_REAL_ID] == ID_ZOMBIE)
	&& (HauchDerPestilenz_Time == 0)
	{
		if (KHDP == 0)
		{
			GiftChance = 50;	// 100 %
		}
		else if (KHDP == 1)
		{
			GiftChance = 40;	// - 20 %
		}
		else if (KHDP == 2)
		{
			GiftChance = 32;	// 100 %
		}
		else if (KHDP == 3)
		{
			GiftChance = 26;	// 100 %
		}
		else if (KHDP == 4)
		{
			GiftChance = 20;	// 100 %
		};

		GiftChance = GiftChance - ((GiftChance*armor)/100);

		if (Hlp_Random(100) < GiftChance)
		{
			// Zeit festlegen

			if (Krankheit == 0)
			{
				HauchDerPestilenz_Stufe01 = 180;
				HauchDerPestilenz_Stufe02 = 240;
				HauchDerPestilenz_Stufe03 = 1080;
			}
			else if (Krankheit == 1)
			{
				HauchDerPestilenz_Stufe01 = 162;
				HauchDerPestilenz_Stufe02 = 216;
				HauchDerPestilenz_Stufe03 = 972;
			}
			else if (Krankheit == 2)
			{
				HauchDerPestilenz_Stufe01 = 146;
				HauchDerPestilenz_Stufe02 = 194;
				HauchDerPestilenz_Stufe03 = 875;
			}
			else if (Krankheit == 3)
			{
				HauchDerPestilenz_Stufe01 = 131;
				HauchDerPestilenz_Stufe02 = 175;
				HauchDerPestilenz_Stufe03 = 787;
			}
			else if (Krankheit == 4)
			{
				HauchDerPestilenz_Stufe01 = 118;
				HauchDerPestilenz_Stufe02 = 157;
				HauchDerPestilenz_Stufe03 = 709;
			};

			// Mali festlegen und die Start-Mali gleich abziehen

			if (KHDP == 0)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 21)
				{
					HauchDerPestilenz_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe01_HP = 20;
				};

				HauchDerPestilenz_Stufe01_MANA = 15;
				HauchDerPestilenz_Stufe01_STR = 10;
				HauchDerPestilenz_Stufe01_DEX = 10;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 51)
				{
					HauchDerPestilenz_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe02_HP = 50;
				};

				HauchDerPestilenz_Stufe02_MANA = 30;
				HauchDerPestilenz_Stufe02_STR = 20;
				HauchDerPestilenz_Stufe02_DEX = 20;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 121)
				{
					HauchDerPestilenz_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe03_HP = 120;
				};

				HauchDerPestilenz_Stufe03_MANA = 60;
				HauchDerPestilenz_Stufe03_STR = 40;
				HauchDerPestilenz_Stufe03_DEX = 40;
			}
			else if (KHDP == 1)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 17)
				{
					HauchDerPestilenz_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe01_HP = 16;
				};

				HauchDerPestilenz_Stufe01_MANA = 12;
				HauchDerPestilenz_Stufe01_STR = 8;
				HauchDerPestilenz_Stufe01_DEX = 8;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 41)
				{
					HauchDerPestilenz_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe02_HP = 40;
				};

				HauchDerPestilenz_Stufe02_MANA = 24;
				HauchDerPestilenz_Stufe02_STR = 16;
				HauchDerPestilenz_Stufe02_DEX = 16;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 97)
				{
					HauchDerPestilenz_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe03_HP = 96;
				};

				HauchDerPestilenz_Stufe03_MANA = 48;
				HauchDerPestilenz_Stufe03_STR = 32;
				HauchDerPestilenz_Stufe03_DEX = 32;
			}
			else if (KHDP == 2)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 14)
				{
					HauchDerPestilenz_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe01_HP = 13;
				};

				HauchDerPestilenz_Stufe01_MANA = 10;
				HauchDerPestilenz_Stufe01_STR = 6;
				HauchDerPestilenz_Stufe01_DEX = 6;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 33)
				{
					HauchDerPestilenz_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe02_HP = 32;
				};

				HauchDerPestilenz_Stufe02_MANA = 19;
				HauchDerPestilenz_Stufe02_STR = 13;
				HauchDerPestilenz_Stufe02_DEX = 13;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 78)
				{
					HauchDerPestilenz_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe03_HP = 77;
				};

				HauchDerPestilenz_Stufe03_MANA = 38;
				HauchDerPestilenz_Stufe03_STR = 26;
				HauchDerPestilenz_Stufe03_DEX = 26;
			}
			else if (KHDP == 3)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 11)
				{
					HauchDerPestilenz_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe01_HP = 10;
				};

				HauchDerPestilenz_Stufe01_MANA = 8;
				HauchDerPestilenz_Stufe01_STR = 5;
				HauchDerPestilenz_Stufe01_DEX = 5;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 27)
				{
					HauchDerPestilenz_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe02_HP = 26;
				};

				HauchDerPestilenz_Stufe02_MANA = 15;
				HauchDerPestilenz_Stufe02_STR = 10;
				HauchDerPestilenz_Stufe02_DEX = 10;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 62)
				{
					HauchDerPestilenz_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe03_HP = 61;
				};

				HauchDerPestilenz_Stufe03_MANA = 31;
				HauchDerPestilenz_Stufe03_STR = 20;
				HauchDerPestilenz_Stufe03_DEX = 20;
			}
			else if (KHDP == 4)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 9)
				{
					HauchDerPestilenz_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe01_HP = 8;
				};

				HauchDerPestilenz_Stufe01_MANA = 6;
				HauchDerPestilenz_Stufe01_STR = 4;
				HauchDerPestilenz_Stufe01_DEX = 4;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 21)
				{
					HauchDerPestilenz_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe02_HP = 20;
				};

				HauchDerPestilenz_Stufe02_MANA = 12;
				HauchDerPestilenz_Stufe02_STR = 8;
				HauchDerPestilenz_Stufe02_DEX = 8;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 50)
				{
					HauchDerPestilenz_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe03_HP = 49;
				};

				HauchDerPestilenz_Stufe03_MANA = 25;
				HauchDerPestilenz_Stufe03_STR = 16;
				HauchDerPestilenz_Stufe03_DEX = 16;
			};

			HauchDerPestilenz_Time = 1;
		};
	};

	if (other.aivar[AIV_MM_REAL_ID] == ID_UNDEADORCWARRIOR)
	&& (HauchDerPestilenz_Time == 0)
	{
		if (KHDP == 0)
		{
			GiftChance = 50;	// 100 %
		}
		else if (KHDP == 1)
		{
			GiftChance = 40;	// - 20 %
		}
		else if (KHDP == 2)
		{
			GiftChance = 32;	// 100 %
		}
		else if (KHDP == 3)
		{
			GiftChance = 26;	// 100 %
		}
		else if (KHDP == 4)
		{
			GiftChance = 20;	// 100 %
		};

		GiftChance = GiftChance - ((GiftChance*armor)/100);

		if (Hlp_Random(100) < GiftChance)
		{
			// Zeit festlegen

			if (Krankheit == 0)
			{
				HauchDerPestilenz_Stufe01 = 180;
				HauchDerPestilenz_Stufe02 = 240;
				HauchDerPestilenz_Stufe03 = 1080;
			}
			else if (Krankheit == 1)
			{
				HauchDerPestilenz_Stufe01 = 162;
				HauchDerPestilenz_Stufe02 = 216;
				HauchDerPestilenz_Stufe03 = 972;
			}
			else if (Krankheit == 2)
			{
				HauchDerPestilenz_Stufe01 = 146;
				HauchDerPestilenz_Stufe02 = 194;
				HauchDerPestilenz_Stufe03 = 875;
			}
			else if (Krankheit == 3)
			{
				HauchDerPestilenz_Stufe01 = 131;
				HauchDerPestilenz_Stufe02 = 175;
				HauchDerPestilenz_Stufe03 = 787;
			}
			else if (Krankheit == 4)
			{
				HauchDerPestilenz_Stufe01 = 118;
				HauchDerPestilenz_Stufe02 = 157;
				HauchDerPestilenz_Stufe03 = 709;
			};

			// Mali festlegen und die Start-Mali gleich abziehen

			if (KHDP == 0)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 21)
				{
					HauchDerPestilenz_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe01_HP = 20;
				};

				HauchDerPestilenz_Stufe01_MANA = 15;
				HauchDerPestilenz_Stufe01_STR = 10;
				HauchDerPestilenz_Stufe01_DEX = 10;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 51)
				{
					HauchDerPestilenz_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe02_HP = 50;
				};

				HauchDerPestilenz_Stufe02_MANA = 30;
				HauchDerPestilenz_Stufe02_STR = 20;
				HauchDerPestilenz_Stufe02_DEX = 20;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 121)
				{
					HauchDerPestilenz_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe03_HP = 120;
				};

				HauchDerPestilenz_Stufe03_MANA = 60;
				HauchDerPestilenz_Stufe03_STR = 40;
				HauchDerPestilenz_Stufe03_DEX = 40;
			}
			else if (KHDP == 1)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 17)
				{
					HauchDerPestilenz_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe01_HP = 16;
				};

				HauchDerPestilenz_Stufe01_MANA = 12;
				HauchDerPestilenz_Stufe01_STR = 8;
				HauchDerPestilenz_Stufe01_DEX = 8;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 41)
				{
					HauchDerPestilenz_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe02_HP = 40;
				};

				HauchDerPestilenz_Stufe02_MANA = 24;
				HauchDerPestilenz_Stufe02_STR = 16;
				HauchDerPestilenz_Stufe02_DEX = 16;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 97)
				{
					HauchDerPestilenz_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe03_HP = 96;
				};

				HauchDerPestilenz_Stufe03_MANA = 48;
				HauchDerPestilenz_Stufe03_STR = 32;
				HauchDerPestilenz_Stufe03_DEX = 32;
			}
			else if (KHDP == 2)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 14)
				{
					HauchDerPestilenz_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe01_HP = 13;
				};

				HauchDerPestilenz_Stufe01_MANA = 10;
				HauchDerPestilenz_Stufe01_STR = 6;
				HauchDerPestilenz_Stufe01_DEX = 6;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 33)
				{
					HauchDerPestilenz_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe02_HP = 32;
				};

				HauchDerPestilenz_Stufe02_MANA = 19;
				HauchDerPestilenz_Stufe02_STR = 13;
				HauchDerPestilenz_Stufe02_DEX = 13;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 78)
				{
					HauchDerPestilenz_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe03_HP = 77;
				};

				HauchDerPestilenz_Stufe03_MANA = 38;
				HauchDerPestilenz_Stufe03_STR = 26;
				HauchDerPestilenz_Stufe03_DEX = 26;
			}
			else if (KHDP == 3)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 11)
				{
					HauchDerPestilenz_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe01_HP = 10;
				};

				HauchDerPestilenz_Stufe01_MANA = 8;
				HauchDerPestilenz_Stufe01_STR = 5;
				HauchDerPestilenz_Stufe01_DEX = 5;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 27)
				{
					HauchDerPestilenz_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe02_HP = 26;
				};

				HauchDerPestilenz_Stufe02_MANA = 15;
				HauchDerPestilenz_Stufe02_STR = 10;
				HauchDerPestilenz_Stufe02_DEX = 10;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 62)
				{
					HauchDerPestilenz_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe03_HP = 61;
				};

				HauchDerPestilenz_Stufe03_MANA = 31;
				HauchDerPestilenz_Stufe03_STR = 20;
				HauchDerPestilenz_Stufe03_DEX = 20;
			}
			else if (KHDP == 4)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 9)
				{
					HauchDerPestilenz_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe01_HP = 8;
				};

				HauchDerPestilenz_Stufe01_MANA = 6;
				HauchDerPestilenz_Stufe01_STR = 4;
				HauchDerPestilenz_Stufe01_DEX = 4;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 21)
				{
					HauchDerPestilenz_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe02_HP = 20;
				};

				HauchDerPestilenz_Stufe02_MANA = 12;
				HauchDerPestilenz_Stufe02_STR = 8;
				HauchDerPestilenz_Stufe02_DEX = 8;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 50)
				{
					HauchDerPestilenz_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe03_HP = 49;
				};

				HauchDerPestilenz_Stufe03_MANA = 25;
				HauchDerPestilenz_Stufe03_STR = 16;
				HauchDerPestilenz_Stufe03_DEX = 16;
			};

			HauchDerPestilenz_Time = 1;
		};
	};

	if (other.aivar[AIV_MM_REAL_ID] == ID_WARAN)
	&& (HauchDerPestilenz_Time == 0)
	{
		if (KHDP == 0)
		{
			GiftChance = 60;	// 100 %
		}
		else if (KHDP == 1)
		{
			GiftChance = 48;	// - 20 %
		}
		else if (KHDP == 2)
		{
			GiftChance = 38;	// 100 %
		}
		else if (KHDP == 3)
		{
			GiftChance = 31;	// 100 %
		}
		else if (KHDP == 4)
		{
			GiftChance = 25;	// 100 %
		};

		GiftChance = GiftChance - ((GiftChance*armor)/100);

		if (Hlp_Random(100) < GiftChance)
		{
			// Zeit festlegen

			if (Krankheit == 0)
			{
				HauchDerPestilenz_Stufe01 = 180;
				HauchDerPestilenz_Stufe02 = 240;
				HauchDerPestilenz_Stufe03 = 1080;
			}
			else if (Krankheit == 1)
			{
				HauchDerPestilenz_Stufe01 = 162;
				HauchDerPestilenz_Stufe02 = 216;
				HauchDerPestilenz_Stufe03 = 972;
			}
			else if (Krankheit == 2)
			{
				HauchDerPestilenz_Stufe01 = 146;
				HauchDerPestilenz_Stufe02 = 194;
				HauchDerPestilenz_Stufe03 = 875;
			}
			else if (Krankheit == 3)
			{
				HauchDerPestilenz_Stufe01 = 131;
				HauchDerPestilenz_Stufe02 = 175;
				HauchDerPestilenz_Stufe03 = 787;
			}
			else if (Krankheit == 4)
			{
				HauchDerPestilenz_Stufe01 = 118;
				HauchDerPestilenz_Stufe02 = 157;
				HauchDerPestilenz_Stufe03 = 709;
			};

			// Mali festlegen und die Start-Mali gleich abziehen

			if (KHDP == 0)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 21)
				{
					HauchDerPestilenz_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe01_HP = 20;
				};

				HauchDerPestilenz_Stufe01_MANA = 15;
				HauchDerPestilenz_Stufe01_STR = 10;
				HauchDerPestilenz_Stufe01_DEX = 10;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 51)
				{
					HauchDerPestilenz_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe02_HP = 50;
				};

				HauchDerPestilenz_Stufe02_MANA = 30;
				HauchDerPestilenz_Stufe02_STR = 20;
				HauchDerPestilenz_Stufe02_DEX = 20;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 121)
				{
					HauchDerPestilenz_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe03_HP = 120;
				};

				HauchDerPestilenz_Stufe03_MANA = 60;
				HauchDerPestilenz_Stufe03_STR = 40;
				HauchDerPestilenz_Stufe03_DEX = 40;
			}
			else if (KHDP == 1)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 17)
				{
					HauchDerPestilenz_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe01_HP = 16;
				};

				HauchDerPestilenz_Stufe01_MANA = 12;
				HauchDerPestilenz_Stufe01_STR = 8;
				HauchDerPestilenz_Stufe01_DEX = 8;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 41)
				{
					HauchDerPestilenz_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe02_HP = 40;
				};

				HauchDerPestilenz_Stufe02_MANA = 24;
				HauchDerPestilenz_Stufe02_STR = 16;
				HauchDerPestilenz_Stufe02_DEX = 16;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 97)
				{
					HauchDerPestilenz_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe03_HP = 96;
				};

				HauchDerPestilenz_Stufe03_MANA = 48;
				HauchDerPestilenz_Stufe03_STR = 32;
				HauchDerPestilenz_Stufe03_DEX = 32;
			}
			else if (KHDP == 2)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 14)
				{
					HauchDerPestilenz_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe01_HP = 13;
				};

				HauchDerPestilenz_Stufe01_MANA = 10;
				HauchDerPestilenz_Stufe01_STR = 6;
				HauchDerPestilenz_Stufe01_DEX = 6;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 33)
				{
					HauchDerPestilenz_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe02_HP = 32;
				};

				HauchDerPestilenz_Stufe02_MANA = 19;
				HauchDerPestilenz_Stufe02_STR = 13;
				HauchDerPestilenz_Stufe02_DEX = 13;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 78)
				{
					HauchDerPestilenz_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe03_HP = 77;
				};

				HauchDerPestilenz_Stufe03_MANA = 38;
				HauchDerPestilenz_Stufe03_STR = 26;
				HauchDerPestilenz_Stufe03_DEX = 26;
			}
			else if (KHDP == 3)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 11)
				{
					HauchDerPestilenz_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe01_HP = 10;
				};

				HauchDerPestilenz_Stufe01_MANA = 8;
				HauchDerPestilenz_Stufe01_STR = 5;
				HauchDerPestilenz_Stufe01_DEX = 5;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 27)
				{
					HauchDerPestilenz_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe02_HP = 26;
				};

				HauchDerPestilenz_Stufe02_MANA = 15;
				HauchDerPestilenz_Stufe02_STR = 10;
				HauchDerPestilenz_Stufe02_DEX = 10;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 62)
				{
					HauchDerPestilenz_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe03_HP = 61;
				};

				HauchDerPestilenz_Stufe03_MANA = 31;
				HauchDerPestilenz_Stufe03_STR = 20;
				HauchDerPestilenz_Stufe03_DEX = 20;
			}
			else if (KHDP == 4)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 9)
				{
					HauchDerPestilenz_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe01_HP = 8;
				};

				HauchDerPestilenz_Stufe01_MANA = 6;
				HauchDerPestilenz_Stufe01_STR = 4;
				HauchDerPestilenz_Stufe01_DEX = 4;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 21)
				{
					HauchDerPestilenz_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe02_HP = 20;
				};

				HauchDerPestilenz_Stufe02_MANA = 12;
				HauchDerPestilenz_Stufe02_STR = 8;
				HauchDerPestilenz_Stufe02_DEX = 8;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 50)
				{
					HauchDerPestilenz_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe03_HP = 49;
				};

				HauchDerPestilenz_Stufe03_MANA = 25;
				HauchDerPestilenz_Stufe03_STR = 16;
				HauchDerPestilenz_Stufe03_DEX = 16;
			};

			HauchDerPestilenz_Time = 1;
		};
	};

	if (other.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEAST_SKELETON)
	&& (HauchDerPestilenz_Time == 0)
	{
		if (KHDP == 0)
		{
			GiftChance = 30;	// 100 %
		}
		else if (KHDP == 1)
		{
			GiftChance = 24;	// - 20 %
		}
		else if (KHDP == 2)
		{
			GiftChance = 19;	// 100 %
		}
		else if (KHDP == 3)
		{
			GiftChance = 15;	// 100 %
		}
		else if (KHDP == 4)
		{
			GiftChance = 12;	// 100 %
		};

		GiftChance = GiftChance - ((GiftChance*armor)/100);

		if (Hlp_Random(100) < GiftChance)
		{
			// Zeit festlegen

			if (Krankheit == 0)
			{
				HauchDerPestilenz_Stufe01 = 180;
				HauchDerPestilenz_Stufe02 = 240;
				HauchDerPestilenz_Stufe03 = 1080;
			}
			else if (Krankheit == 1)
			{
				HauchDerPestilenz_Stufe01 = 162;
				HauchDerPestilenz_Stufe02 = 216;
				HauchDerPestilenz_Stufe03 = 972;
			}
			else if (Krankheit == 2)
			{
				HauchDerPestilenz_Stufe01 = 146;
				HauchDerPestilenz_Stufe02 = 194;
				HauchDerPestilenz_Stufe03 = 875;
			}
			else if (Krankheit == 3)
			{
				HauchDerPestilenz_Stufe01 = 131;
				HauchDerPestilenz_Stufe02 = 175;
				HauchDerPestilenz_Stufe03 = 787;
			}
			else if (Krankheit == 4)
			{
				HauchDerPestilenz_Stufe01 = 118;
				HauchDerPestilenz_Stufe02 = 157;
				HauchDerPestilenz_Stufe03 = 709;
			};

			// Mali festlegen und die Start-Mali gleich abziehen

			if (KHDP == 0)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 21)
				{
					HauchDerPestilenz_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe01_HP = 20;
				};

				HauchDerPestilenz_Stufe01_MANA = 15;
				HauchDerPestilenz_Stufe01_STR = 10;
				HauchDerPestilenz_Stufe01_DEX = 10;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 51)
				{
					HauchDerPestilenz_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe02_HP = 50;
				};

				HauchDerPestilenz_Stufe02_MANA = 30;
				HauchDerPestilenz_Stufe02_STR = 20;
				HauchDerPestilenz_Stufe02_DEX = 20;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 121)
				{
					HauchDerPestilenz_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe03_HP = 120;
				};

				HauchDerPestilenz_Stufe03_MANA = 60;
				HauchDerPestilenz_Stufe03_STR = 40;
				HauchDerPestilenz_Stufe03_DEX = 40;
			}
			else if (KHDP == 1)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 17)
				{
					HauchDerPestilenz_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe01_HP = 16;
				};

				HauchDerPestilenz_Stufe01_MANA = 12;
				HauchDerPestilenz_Stufe01_STR = 8;
				HauchDerPestilenz_Stufe01_DEX = 8;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 41)
				{
					HauchDerPestilenz_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe02_HP = 40;
				};

				HauchDerPestilenz_Stufe02_MANA = 24;
				HauchDerPestilenz_Stufe02_STR = 16;
				HauchDerPestilenz_Stufe02_DEX = 16;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 97)
				{
					HauchDerPestilenz_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe03_HP = 96;
				};

				HauchDerPestilenz_Stufe03_MANA = 48;
				HauchDerPestilenz_Stufe03_STR = 32;
				HauchDerPestilenz_Stufe03_DEX = 32;
			}
			else if (KHDP == 2)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 14)
				{
					HauchDerPestilenz_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe01_HP = 13;
				};

				HauchDerPestilenz_Stufe01_MANA = 10;
				HauchDerPestilenz_Stufe01_STR = 6;
				HauchDerPestilenz_Stufe01_DEX = 6;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 33)
				{
					HauchDerPestilenz_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe02_HP = 32;
				};

				HauchDerPestilenz_Stufe02_MANA = 19;
				HauchDerPestilenz_Stufe02_STR = 13;
				HauchDerPestilenz_Stufe02_DEX = 13;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 78)
				{
					HauchDerPestilenz_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe03_HP = 77;
				};

				HauchDerPestilenz_Stufe03_MANA = 38;
				HauchDerPestilenz_Stufe03_STR = 26;
				HauchDerPestilenz_Stufe03_DEX = 26;
			}
			else if (KHDP == 3)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 11)
				{
					HauchDerPestilenz_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe01_HP = 10;
				};

				HauchDerPestilenz_Stufe01_MANA = 8;
				HauchDerPestilenz_Stufe01_STR = 5;
				HauchDerPestilenz_Stufe01_DEX = 5;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 27)
				{
					HauchDerPestilenz_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe02_HP = 26;
				};

				HauchDerPestilenz_Stufe02_MANA = 15;
				HauchDerPestilenz_Stufe02_STR = 10;
				HauchDerPestilenz_Stufe02_DEX = 10;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 62)
				{
					HauchDerPestilenz_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe03_HP = 61;
				};

				HauchDerPestilenz_Stufe03_MANA = 31;
				HauchDerPestilenz_Stufe03_STR = 20;
				HauchDerPestilenz_Stufe03_DEX = 20;
			}
			else if (KHDP == 4)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 9)
				{
					HauchDerPestilenz_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe01_HP = 8;
				};

				HauchDerPestilenz_Stufe01_MANA = 6;
				HauchDerPestilenz_Stufe01_STR = 4;
				HauchDerPestilenz_Stufe01_DEX = 4;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 21)
				{
					HauchDerPestilenz_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe02_HP = 20;
				};

				HauchDerPestilenz_Stufe02_MANA = 12;
				HauchDerPestilenz_Stufe02_STR = 8;
				HauchDerPestilenz_Stufe02_DEX = 8;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 50)
				{
					HauchDerPestilenz_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe03_HP = 49;
				};

				HauchDerPestilenz_Stufe03_MANA = 25;
				HauchDerPestilenz_Stufe03_STR = 16;
				HauchDerPestilenz_Stufe03_DEX = 16;
			};

			HauchDerPestilenz_Time = 1;
		};
	};

	if (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(Mod_7656_OUT_Suchender_REL))
	&& (HauchDerPestilenz_Time == 0)
	{
		if (KHDP == 0)
		{
			GiftChance = 30;	// 100 %
		}
		else if (KHDP == 1)
		{
			GiftChance = 24;	// - 20 %
		}
		else if (KHDP == 2)
		{
			GiftChance = 19;	// 100 %
		}
		else if (KHDP == 3)
		{
			GiftChance = 15;	// 100 %
		}
		else if (KHDP == 4)
		{
			GiftChance = 12;	// 100 %
		};

		GiftChance = GiftChance - ((GiftChance*armor)/100);

		if (Hlp_Random(100) < GiftChance)
		{
			// Zeit festlegen

			if (Krankheit == 0)
			{
				HauchDerPestilenz_Stufe01 = 180;
				HauchDerPestilenz_Stufe02 = 240;
				HauchDerPestilenz_Stufe03 = 1080;
			}
			else if (Krankheit == 1)
			{
				HauchDerPestilenz_Stufe01 = 162;
				HauchDerPestilenz_Stufe02 = 216;
				HauchDerPestilenz_Stufe03 = 972;
			}
			else if (Krankheit == 2)
			{
				HauchDerPestilenz_Stufe01 = 146;
				HauchDerPestilenz_Stufe02 = 194;
				HauchDerPestilenz_Stufe03 = 875;
			}
			else if (Krankheit == 3)
			{
				HauchDerPestilenz_Stufe01 = 131;
				HauchDerPestilenz_Stufe02 = 175;
				HauchDerPestilenz_Stufe03 = 787;
			}
			else if (Krankheit == 4)
			{
				HauchDerPestilenz_Stufe01 = 118;
				HauchDerPestilenz_Stufe02 = 157;
				HauchDerPestilenz_Stufe03 = 709;
			};

			// Mali festlegen und die Start-Mali gleich abziehen

			if (KHDP == 0)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 21)
				{
					HauchDerPestilenz_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe01_HP = 20;
				};

				HauchDerPestilenz_Stufe01_MANA = 15;
				HauchDerPestilenz_Stufe01_STR = 10;
				HauchDerPestilenz_Stufe01_DEX = 10;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 51)
				{
					HauchDerPestilenz_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe02_HP = 50;
				};

				HauchDerPestilenz_Stufe02_MANA = 30;
				HauchDerPestilenz_Stufe02_STR = 20;
				HauchDerPestilenz_Stufe02_DEX = 20;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 121)
				{
					HauchDerPestilenz_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe03_HP = 120;
				};

				HauchDerPestilenz_Stufe03_MANA = 60;
				HauchDerPestilenz_Stufe03_STR = 40;
				HauchDerPestilenz_Stufe03_DEX = 40;
			}
			else if (KHDP == 1)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 17)
				{
					HauchDerPestilenz_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe01_HP = 16;
				};

				HauchDerPestilenz_Stufe01_MANA = 12;
				HauchDerPestilenz_Stufe01_STR = 8;
				HauchDerPestilenz_Stufe01_DEX = 8;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 41)
				{
					HauchDerPestilenz_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe02_HP = 40;
				};

				HauchDerPestilenz_Stufe02_MANA = 24;
				HauchDerPestilenz_Stufe02_STR = 16;
				HauchDerPestilenz_Stufe02_DEX = 16;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 97)
				{
					HauchDerPestilenz_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe03_HP = 96;
				};

				HauchDerPestilenz_Stufe03_MANA = 48;
				HauchDerPestilenz_Stufe03_STR = 32;
				HauchDerPestilenz_Stufe03_DEX = 32;
			}
			else if (KHDP == 2)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 14)
				{
					HauchDerPestilenz_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe01_HP = 13;
				};

				HauchDerPestilenz_Stufe01_MANA = 10;
				HauchDerPestilenz_Stufe01_STR = 6;
				HauchDerPestilenz_Stufe01_DEX = 6;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 33)
				{
					HauchDerPestilenz_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe02_HP = 32;
				};

				HauchDerPestilenz_Stufe02_MANA = 19;
				HauchDerPestilenz_Stufe02_STR = 13;
				HauchDerPestilenz_Stufe02_DEX = 13;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 78)
				{
					HauchDerPestilenz_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe03_HP = 77;
				};

				HauchDerPestilenz_Stufe03_MANA = 38;
				HauchDerPestilenz_Stufe03_STR = 26;
				HauchDerPestilenz_Stufe03_DEX = 26;
			}
			else if (KHDP == 3)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 11)
				{
					HauchDerPestilenz_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe01_HP = 10;
				};

				HauchDerPestilenz_Stufe01_MANA = 8;
				HauchDerPestilenz_Stufe01_STR = 5;
				HauchDerPestilenz_Stufe01_DEX = 5;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 27)
				{
					HauchDerPestilenz_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe02_HP = 26;
				};

				HauchDerPestilenz_Stufe02_MANA = 15;
				HauchDerPestilenz_Stufe02_STR = 10;
				HauchDerPestilenz_Stufe02_DEX = 10;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 62)
				{
					HauchDerPestilenz_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe03_HP = 61;
				};

				HauchDerPestilenz_Stufe03_MANA = 31;
				HauchDerPestilenz_Stufe03_STR = 20;
				HauchDerPestilenz_Stufe03_DEX = 20;
			}
			else if (KHDP == 4)
			{
				if (hero.attribute[ATR_HITPOINTS_MAX] <= 9)
				{
					HauchDerPestilenz_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe01_HP = 8;
				};

				HauchDerPestilenz_Stufe01_MANA = 6;
				HauchDerPestilenz_Stufe01_STR = 4;
				HauchDerPestilenz_Stufe01_DEX = 4;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 21)
				{
					HauchDerPestilenz_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe02_HP = 20;
				};

				HauchDerPestilenz_Stufe02_MANA = 12;
				HauchDerPestilenz_Stufe02_STR = 8;
				HauchDerPestilenz_Stufe02_DEX = 8;

				if (hero.attribute[ATR_HITPOINTS_MAX] <= 50)
				{
					HauchDerPestilenz_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
				}
				else
				{
					HauchDerPestilenz_Stufe03_HP = 49;
				};

				HauchDerPestilenz_Stufe03_MANA = 25;
				HauchDerPestilenz_Stufe03_STR = 16;
				HauchDerPestilenz_Stufe03_DEX = 16;
			};

			HauchDerPestilenz_Time = 1;
		};
	};

	return;
};