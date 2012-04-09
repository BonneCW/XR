FUNC VOID B_HealGift (var int GiftHeal, var int KrankheitHeal)
{
	if (!Npc_IsPlayer(self))
	{
		return;
	};

	var int DoIt;
	DoIt = 0;

	// Erstmal Gifte

	if (GGPf_Sumpfgolem_Time > 0)
	{
		if (GiftHeal == -1)
		{
			GGPf_Sumpfgolem_Time = 0;
			GGPf_Sumpfgolem_Damage = 0;
			GGPf_Sumpfgolem_Tick = 0;

			DoIt = 1;
		}
		else
		{
			GGPf_Sumpfgolem_Time -= GiftHeal;

			if (GGPf_Sumpfgolem_Time <= 0)
			{
				GGPf_Sumpfgolem_Time = 0;
				GGPf_Sumpfgolem_Damage = 0;
				GGPf_Sumpfgolem_Tick = 0;

				DoIt = 1;
			};
		};

		if (DoIt == 1)
		{
			GGPf_Sumpfgolem += 1;

			Mod_CountGifte += 1;

			if (GGPf_Sumpfgolem == 3)
			|| (GGPf_Sumpfgolem == 10)
			|| (GGPf_Sumpfgolem == 20)
			|| (GGPf_Sumpfgolem == 40)
			{
				if (Pflanzengift < 3)
				{
					Pflanzengift += 1;
				}
				else if (Pflanzengift < 4)
				{
					Pflanzengift += 1;

					Print	("Du bist Immun gegenüber dem Gift von Pflanzen.");
				};

				if (Gewaechsgift < 4)
				{
					Print	("Deine Resistenzen gegenüber Gewächsgiften sind gestiegen.");

					Gewaechsgift += 1;

					if ((Gewaechsgift+Tiergift+Giftdampf)%3 == 0)
					{
						if (Gift < 3)
						{
							Gift += 1;

							Print	("Deine Widerstandskraft gegenüber Giften ist gestiegen.");
						};
					};
				};
			};

			DoIt = 0;
		};
	};

	if (GGPi_Orkschamane_Time > 0)
	{
		if (GiftHeal == -1)
		{
			GGPi_Orkschamane_Time = 0;
			GGPi_Orkschamane_Damage = 0;
			GGPi_Orkschamane_Tick = 0;

			DoIt = 1;
		}
		else
		{
			GGPi_Orkschamane_Time -= GiftHeal;

			if (GGPi_Orkschamane_Time <= 0)
			{
				GGPi_Orkschamane_Time = 0;
				GGPi_Orkschamane_Damage = 0;
				GGPi_Orkschamane_Tick = 0;

				DoIt = 1;
			};
		};

		if (DoIt == 1)
		{
			GGPi_Orkschamane += 1;

			Mod_CountGifte += 1;

			if (GGPi_Orkschamane == 3)
			|| (GGPi_Orkschamane == 10)
			|| (GGPi_Orkschamane == 20)
			|| (GGPi_Orkschamane == 40)
			{
				if (Pilzgift < 3)
				{
					Pilzgift += 1;
				}
				else if (Pilzgift < 4)
				{
					Pilzgift += 1;

					Print	("Du bist Immun gegenüber dem Gift von Pilzen.");
				};

				if (Gewaechsgift < 4)
				{
					Print	("Deine Resistenzen gegenüber Gewächsgiften sind gestiegen.");

					Gewaechsgift += 1;

					if ((Gewaechsgift+Tiergift+Giftdampf)%3 == 0)
					{
						if (Gift < 3)
						{
							Gift += 1;

							Print	("Deine Widerstandskraft gegenüber Giften ist gestiegen.");
						};
					};
				};
			};

			DoIt = 0;
		};
	};

	if (GGPf_Echsenmensch_Time > 0)
	{
		if (GiftHeal == -1)
		{
			GGPf_Echsenmensch_Time = 0;
			GGPf_Echsenmensch_Damage = 0;
			GGPf_Echsenmensch_Tick = 0;

			DoIt = 1;
		}
		else
		{
			GGPf_Echsenmensch_Time -= GiftHeal;

			if (GGPf_Echsenmensch_Time <= 0)
			{
				GGPf_Echsenmensch_Time = 0;
				GGPf_Echsenmensch_Damage = 0;
				GGPf_Echsenmensch_Tick = 0;

				DoIt = 1;
			};
		};

		if (DoIt == 1)
		{
			GGPf_Echsenmensch += 1;

			Mod_CountGifte += 1;

			if (GGPf_Echsenmensch == 3)
			|| (GGPf_Echsenmensch == 10)
			|| (GGPf_Echsenmensch == 20)
			|| (GGPf_Echsenmensch == 40)
			{
				if (Pflanzengift < 3)
				{
					Pflanzengift += 1;
				}
				else if (Pflanzengift < 4)
				{
					Pflanzengift += 1;

					Print	("Du bist Immun gegenüber dem Gift von Pflanzen.");
				};

				if (Gewaechsgift < 4)
				{
					Print	("Deine Resistenzen gegenüber Gewächsgiften sind gestiegen.");

					Gewaechsgift += 1;

					if ((Gewaechsgift+Tiergift+Giftdampf)%3 == 0)
					{
						if (Gift < 3)
						{
							Gift += 1;

							Print	("Deine Widerstandskraft gegenüber Giften ist gestiegen.");
						};
					};
				};
			};

			DoIt = 0;
		};
	};

	if (GGPi_OrkkriegerArmbrust_Time > 0)
	{
		if (GiftHeal == -1)
		{
			GGPi_OrkkriegerArmbrust_Time = 0;
			GGPi_OrkkriegerArmbrust_Damage = 0;
			GGPi_OrkkriegerArmbrust_Tick = 0;

			DoIt = 1;
		}
		else
		{
			GGPi_OrkkriegerArmbrust_Time -= GiftHeal;

			if (GGPi_OrkkriegerArmbrust_Time <= 0)
			{
				GGPi_OrkkriegerArmbrust_Time = 0;
				GGPi_OrkkriegerArmbrust_Damage = 0;
				GGPi_OrkkriegerArmbrust_Tick = 0;

				DoIt = 1;
			};
		};

		if (DoIt == 1)
		{
			GGPi_OrkkriegerArmbrust += 1;

			Mod_CountGifte += 1;

			if (GGPi_OrkkriegerArmbrust == 3)
			|| (GGPi_OrkkriegerArmbrust == 10)
			|| (GGPi_OrkkriegerArmbrust == 20)
			|| (GGPi_OrkkriegerArmbrust == 40)
			{
				if (Pilzgift < 3)
				{
					Pilzgift += 1;
				}
				else if (Pilzgift < 4)
				{
					Pilzgift += 1;

					Print	("Du bist Immun gegenüber dem Gift von Pilzen.");
				};

				if (Gewaechsgift < 4)
				{
					Print	("Deine Resistenzen gegenüber Gewächsgiften sind gestiegen.");

					Gewaechsgift += 1;

					if ((Gewaechsgift+Tiergift+Giftdampf)%3 == 0)
					{
						if (Gift < 3)
						{
							Gift += 1;

							Print	("Deine Widerstandskraft gegenüber Giften ist gestiegen.");
						};
					};
				};
			};

			DoIt = 0;
		};
	};

	if (GGPi_Fliegenpilz_Time > 0)
	{
		if (GiftHeal == -1)
		{
			GGPi_Fliegenpilz_Time = 0;
			GGPi_Fliegenpilz_Damage = 0;
			GGPi_Fliegenpilz_Tick = 0;

			DoIt = 1;
		}
		else
		{
			GGPi_Fliegenpilz_Time -= GiftHeal;

			if (GGPi_Fliegenpilz_Time <= 0)
			{
				GGPi_Fliegenpilz_Time = 0;
				GGPi_Fliegenpilz_Damage = 0;
				GGPi_Fliegenpilz_Tick = 0;

				DoIt = 1;
			};
		};

		if (DoIt == 1)
		{
			GGPi_Fliegenpilz += 1;

			Mod_CountGifte += 1;

			if (GGPi_Fliegenpilz == 3)
			|| (GGPi_Fliegenpilz == 10)
			|| (GGPi_Fliegenpilz == 20)
			|| (GGPi_Fliegenpilz == 40)
			{
				if (Pilzgift < 3)
				{
					Pilzgift += 1;
				}
				else if (Pilzgift < 4)
				{
					Pilzgift += 1;

					Print	("Du bist Immun gegenüber dem Gift von Pilzen.");
				};

				if (Gewaechsgift < 4)
				{
					Print	("Deine Resistenzen gegenüber Gewächsgiften sind gestiegen.");

					Gewaechsgift += 1;

					if ((Gewaechsgift+Tiergift+Giftdampf)%3 == 0)
					{
						if (Gift < 3)
						{
							Gift += 1;

							Print	("Deine Widerstandskraft gegenüber Giften ist gestiegen.");
						};
					};
				};
			};

			DoIt = 0;
		};
	};

	if (GGPf_Echsenschwert_Time > 0)
	{
		if (GiftHeal == -1)
		{
			GGPf_Echsenschwert_Time = 0;
			GGPf_Echsenschwert_Damage = 0;
			GGPf_Echsenschwert_Tick = 0;

			DoIt = 1;
		}
		else
		{
			GGPf_Echsenschwert_Time -= GiftHeal;

			if (GGPf_Echsenschwert_Time <= 0)
			{
				GGPf_Echsenschwert_Time = 0;
				GGPf_Echsenschwert_Damage = 0;
				GGPf_Echsenschwert_Tick = 0;

				DoIt = 1;
			};
		};

		if (DoIt == 1)
		{
			GGPf_Echsenschwert += 1;

			Mod_CountGifte += 1;

			if (GGPf_Echsenschwert == 3)
			|| (GGPf_Echsenschwert == 10)
			|| (GGPf_Echsenschwert == 20)
			|| (GGPf_Echsenschwert == 40)
			{
				if (Pflanzengift < 3)
				{
					Pflanzengift += 1;
				}
				else if (Pflanzengift < 4)
				{
					Pflanzengift += 1;

					Print	("Du bist Immun gegenüber dem Gift von Pflanzen.");
				};

				if (Gewaechsgift < 4)
				{
					Print	("Deine Resistenzen gegenüber Gewächsgiften sind gestiegen.");

					Gewaechsgift += 1;

					if ((Gewaechsgift+Tiergift+Giftdampf)%3 == 0)
					{
						if (Gift < 3)
						{
							Gift += 1;

							Print	("Deine Widerstandskraft gegenüber Giften ist gestiegen.");
						};
					};
				};
			};

			DoIt = 0;
		};
	};

	if (GGPf_Assassinenschwert_Time > 0)
	{
		if (GiftHeal == -1)
		{
			GGPf_Assassinenschwert_Time = 0;
			GGPf_Assassinenschwert_Damage = 0;
			GGPf_Assassinenschwert_Tick = 0;

			DoIt = 1;
		}
		else
		{
			GGPf_Assassinenschwert_Time -= GiftHeal;

			if (GGPf_Assassinenschwert_Time <= 0)
			{
				GGPf_Assassinenschwert_Time = 0;
				GGPf_Assassinenschwert_Damage = 0;
				GGPf_Assassinenschwert_Tick = 0;

				DoIt = 1;
			};
		};

		if (DoIt == 1)
		{
			GGPf_Assassinenschwert += 1;

			Mod_CountGifte += 1;

			if (GGPf_Assassinenschwert == 3)
			|| (GGPf_Assassinenschwert == 10)
			|| (GGPf_Assassinenschwert == 20)
			|| (GGPf_Assassinenschwert == 40)
			{
				if (Pflanzengift < 3)
				{
					Pflanzengift += 1;
				}
				else if (Pflanzengift < 4)
				{
					Pflanzengift += 1;

					Print	("Du bist Immun gegenüber dem Gift von Pflanzen.");
				};

				if (Gewaechsgift < 4)
				{
					Print	("Deine Resistenzen gegenüber Gewächsgiften sind gestiegen.");

					Gewaechsgift += 1;

					if ((Gewaechsgift+Tiergift+Giftdampf)%3 == 0)
					{
						if (Gift < 3)
						{
							Gift += 1;

							Print	("Deine Widerstandskraft gegenüber Giften ist gestiegen.");
						};
					};
				};
			};

			DoIt = 0;
		};
	};

	if (GGPi_Schamanenaxt_Time > 0)
	{
		if (GiftHeal == -1)
		{
			GGPi_Schamanenaxt_Time = 0;
			GGPi_Schamanenaxt_Damage = 0;
			GGPi_Schamanenaxt_Tick = 0;

			DoIt = 1;
		}
		else
		{
			GGPi_Schamanenaxt_Time -= GiftHeal;

			if (GGPi_Schamanenaxt_Time <= 0)
			{
				GGPi_Schamanenaxt_Time = 0;
				GGPi_Schamanenaxt_Damage = 0;
				GGPi_Schamanenaxt_Tick = 0;

				DoIt = 1;
			};
		};

		if (DoIt == 1)
		{
			GGPi_Schamanenaxt += 1;

			Mod_CountGifte += 1;

			if (GGPi_Schamanenaxt == 3)
			|| (GGPi_Schamanenaxt == 10)
			|| (GGPi_Schamanenaxt == 20)
			|| (GGPi_Schamanenaxt == 40)
			{
				if (Pilzgift < 3)
				{
					Pilzgift += 1;
				}
				else if (Pilzgift < 4)
				{
					Pilzgift += 1;

					Print	("Du bist Immun gegenüber dem Gift von Pilzen.");
				};

				if (Gewaechsgift < 4)
				{
					Print	("Deine Resistenzen gegenüber Gewächsgiften sind gestiegen.");

					Gewaechsgift += 1;

					if ((Gewaechsgift+Tiergift+Giftdampf)%3 == 0)
					{
						if (Gift < 3)
						{
							Gift += 1;

							Print	("Deine Widerstandskraft gegenüber Giften ist gestiegen.");
						};
					};
				};
			};

			DoIt = 0;
		};
	};

	if (GTB_Blutfliege_Time > 0)
	{
		if (GiftHeal == -1)
		{
			GTB_Blutfliege_Time = 0;
			GTB_Blutfliege_Damage = 0;
			GTB_Blutfliege_Tick = 0;

			DoIt = 1;
		}
		else
		{
			GTB_Blutfliege_Time -= GiftHeal;

			if (GTB_Blutfliege_Time <= 0)
			{
				GTB_Blutfliege_Time = 0;
				GTB_Blutfliege_Damage = 0;
				GTB_Blutfliege_Tick = 0;

				DoIt = 1;
			};
		};

		if (DoIt == 1)
		{
			GTB_Blutfliege += 1;

			Mod_CountGifte += 1;

			if (GTB_Blutfliege == 3)
			|| (GTB_Blutfliege == 10)
			|| (GTB_Blutfliege == 30)
			{
				if (Blutfliegengift < 2)
				{
					Blutfliegengift += 1;
				}
				else if (Blutfliegengift < 3)
				{
					Blutfliegengift += 1;

					Print	("Du bist Immun gegenüber dem Gift von Blutfliegen.");
				};

				if (Tiergift < 4)
				{
					Print	("Deine Resistenzen gegenüber Tiergiften sind gestiegen.");

					Tiergift += 1;

					if ((Gewaechsgift+Tiergift+Giftdampf)%3 == 0)
					{
						if (Gift < 3)
						{
							Gift += 1;

							Print	("Deine Widerstandskraft gegenüber Giften ist gestiegen.");
						};
					};
				};
			};

			DoIt = 0;
		};
	};

	if (GTS_Sumpfgasdrohne_Time > 0)
	{
		if (GiftHeal == -1)
		{
			GTS_Sumpfgasdrohne_Time = 0;
			GTS_Sumpfgasdrohne_Damage = 0;
			GTS_Sumpfgasdrohne_Tick = 0;

			DoIt = 1;
		}
		else
		{
			GTS_Sumpfgasdrohne_Time -= GiftHeal;

			if (GTS_Sumpfgasdrohne_Time <= 0)
			{
				GTS_Sumpfgasdrohne_Time = 0;
				GTS_Sumpfgasdrohne_Damage = 0;
				GTS_Sumpfgasdrohne_Tick = 0;

				DoIt = 1;
			};
		};

		if (DoIt == 1)
		{
			GTS_Sumpfgasdrohne += 1;

			Mod_CountGifte += 1;

			if (GTS_Sumpfgasdrohne == 3)
			|| (GTS_Sumpfgasdrohne == 10)
			|| (GTS_Sumpfgasdrohne == 30)
			{
				if (Sumpfgasdrohnengift < 2)
				{
					Sumpfgasdrohnengift += 1;
				}
				else if (Sumpfgasdrohnengift < 3)
				{
					Sumpfgasdrohnengift += 1;

					Print	("Du bist Immun gegenüber dem Gift von Sumpfgasdrohnen.");
				};

				if (Tiergift < 4)
				{
					Print	("Deine Resistenzen gegenüber Tiergiften sind gestiegen.");

					Tiergift += 1;

					if ((Gewaechsgift+Tiergift+Giftdampf)%3 == 0)
					{
						if (Gift < 3)
						{
							Gift += 1;

							Print	("Deine Widerstandskraft gegenüber Giften ist gestiegen.");
						};
					};
				};
			};

			DoIt = 0;
		};
	};

	if (GTM_Minecrawler_Time > 0)
	{
		if (GiftHeal == -1)
		{
			GTM_Minecrawler_Time = 0;
			GTM_Minecrawler_Damage = 0;
			GTM_Minecrawler_Tick = 0;

			DoIt = 1;
		}
		else
		{
			GTM_Minecrawler_Time -= GiftHeal;

			if (GTM_Minecrawler_Time <= 0)
			{
				GTM_Minecrawler_Time = 0;
				GTM_Minecrawler_Damage = 0;
				GTM_Minecrawler_Tick = 0;

				DoIt = 1;
			};
		};

		if (DoIt == 1)
		{
			GTM_Minecrawler += 1;

			Mod_CountGifte += 1;

			if (GTM_Minecrawler == 3)
			|| (GTM_Minecrawler == 10)
			|| (GTM_Minecrawler == 30)
			{
				if (Minecrawlergift < 2)
				{
					Minecrawlergift += 1;
				}
				else if (Minecrawlergift < 3)
				{
					Minecrawlergift += 1;

					Print	("Du bist Immun gegenüber dem Gift von Minecrawlern.");
				};

				if (Tiergift < 4)
				{
					Print	("Deine Resistenzen gegenüber Tiergiften sind gestiegen.");

					Tiergift += 1;

					if ((Gewaechsgift+Tiergift+Giftdampf)%3 == 0)
					{
						if (Gift < 3)
						{
							Gift += 1;

							Print	("Deine Widerstandskraft gegenüber Giften ist gestiegen.");
						};
					};
				};
			};

			DoIt = 0;
		};
	};

	if (GTM_MinecrawlerWarrior_Time > 0)
	{
		if (GiftHeal == -1)
		{
			GTM_MinecrawlerWarrior_Time = 0;
			GTM_MinecrawlerWarrior_Damage = 0;
			GTM_MinecrawlerWarrior_Tick = 0;

			DoIt = 1;
		}
		else
		{
			GTM_MinecrawlerWarrior_Time -= GiftHeal;

			if (GTM_MinecrawlerWarrior_Time <= 0)
			{
				GTM_MinecrawlerWarrior_Time = 0;
				GTM_MinecrawlerWarrior_Damage = 0;
				GTM_MinecrawlerWarrior_Tick = 0;

				DoIt = 1;
			};
		};

		if (DoIt == 1)
		{
			GTM_MinecrawlerWarrior += 1;

			Mod_CountGifte += 1;

			if (GTM_MinecrawlerWarrior == 3)
			|| (GTM_MinecrawlerWarrior == 10)
			|| (GTM_MinecrawlerWarrior == 30)
			{
				if (Minecrawlergift < 2)
				{
					Minecrawlergift += 1;
				}
				else if (Minecrawlergift < 3)
				{
					Minecrawlergift += 1;

					Print	("Du bist Immun gegenüber dem Gift von Minecrawlern.");
				};

				if (Tiergift < 4)
				{
					Print	("Deine Resistenzen gegenüber Tiergiften sind gestiegen.");

					Tiergift += 1;

					if ((Gewaechsgift+Tiergift+Giftdampf)%3 == 0)
					{
						if (Gift < 3)
						{
							Gift += 1;

							Print	("Deine Widerstandskraft gegenüber Giften ist gestiegen.");
						};
					};
				};
			};

			DoIt = 0;
		};
	};

	if (GTSu_Sumpfhai_Time > 0)
	{
		if (GiftHeal == -1)
		{
			GTSu_Sumpfhai_Time = 0;
			GTSu_Sumpfhai_Damage = 0;
			GTSu_Sumpfhai_Tick = 0;

			DoIt = 1;
		}
		else
		{
			GTSu_Sumpfhai_Time -= GiftHeal;

			if (GTSu_Sumpfhai_Time <= 0)
			{
				GTSu_Sumpfhai_Time = 0;
				GTSu_Sumpfhai_Damage = 0;
				GTSu_Sumpfhai_Tick = 0;

				DoIt = 1;
			};
		};

		if (DoIt == 1)
		{
			GTSu_Sumpfhai += 1;

			Mod_CountGifte += 1;

			if (GTSu_Sumpfhai == 3)
			|| (GTSu_Sumpfhai == 10)
			|| (GTSu_Sumpfhai == 30)
			{
				if (Sumpfhaigift < 2)
				{
					Sumpfhaigift += 1;
				}
				else if (Sumpfhaigift < 3)
				{
					Sumpfhaigift += 1;

					Print	("Du bist Immun gegenüber dem Gift von Sumpfhaien.");
				};

				if (Tiergift < 4)
				{
					Print	("Deine Resistenzen gegenüber Tiergiften sind gestiegen.");

					Tiergift += 1;

					if ((Gewaechsgift+Tiergift+Giftdampf)%3 == 0)
					{
						if (Gift < 3)
						{
							Gift += 1;

							Print	("Deine Widerstandskraft gegenüber Giften ist gestiegen.");
						};
					};
				};
			};

			DoIt = 0;
		};
	};

	if (GTS_Echsenschwert_Time > 0)
	{
		if (GiftHeal == -1)
		{
			GTS_Echsenschwert_Time = 0;
			GTS_Echsenschwert_Damage = 0;
			GTS_Echsenschwert_Tick = 0;

			DoIt = 1;
		}
		else
		{
			GTS_Echsenschwert_Time -= GiftHeal;

			if (GTS_Echsenschwert_Time <= 0)
			{
				GTS_Echsenschwert_Time = 0;
				GTS_Echsenschwert_Damage = 0;
				GTS_Echsenschwert_Tick = 0;

				DoIt = 1;
			};
		};

		if (DoIt == 1)
		{
			GTS_Echsenschwert += 1;

			Mod_CountGifte += 1;

			if (GTS_Echsenschwert == 3)
			|| (GTS_Echsenschwert == 10)
			|| (GTS_Echsenschwert == 30)
			{
				if (Sumpfgasdrohnengift < 2)
				{
					Sumpfgasdrohnengift += 1;
				}
				else if (Sumpfgasdrohnengift < 3)
				{
					Sumpfgasdrohnengift += 1;

					Print	("Du bist Immun gegenüber dem Gift von Sumpfgasdrohnen.");
				};

				if (Tiergift < 4)
				{
					Print	("Deine Resistenzen gegenüber Tiergiften sind gestiegen.");

					Tiergift += 1;

					if ((Gewaechsgift+Tiergift+Giftdampf)%3 == 0)
					{
						if (Gift < 3)
						{
							Gift += 1;

							Print	("Deine Widerstandskraft gegenüber Giften ist gestiegen.");
						};
					};
				};
			};

			DoIt = 0;
		};
	};

	if (GTB_Assassinenschwert_Time > 0)
	{
		if (GiftHeal == -1)
		{
			GTB_Assassinenschwert_Time = 0;
			GTB_Assassinenschwert_Damage = 0;
			GTB_Assassinenschwert_Tick = 0;

			DoIt = 1;
		}
		else
		{
			GTB_Assassinenschwert_Time -= GiftHeal;

			if (GTB_Assassinenschwert_Time <= 0)
			{
				GTB_Assassinenschwert_Time = 0;
				GTB_Assassinenschwert_Damage = 0;
				GTB_Assassinenschwert_Tick = 0;

				DoIt = 1;
			};
		};

		if (DoIt == 1)
		{
			GTB_Assassinenschwert += 1;

			Mod_CountGifte += 1;

			if (GTB_Assassinenschwert == 3)
			|| (GTB_Assassinenschwert == 10)
			|| (GTB_Assassinenschwert == 30)
			{
				if (Blutfliegengift < 2)
				{
					Blutfliegengift += 1;
				}
				else if (Blutfliegengift < 3)
				{
					Blutfliegengift += 1;

					Print	("Du bist Immun gegenüber dem Gift von Blutfliegen.");
				};

				if (Tiergift < 4)
				{
					Print	("Deine Resistenzen gegenüber Tiergiften sind gestiegen.");

					Tiergift += 1;

					if ((Gewaechsgift+Tiergift+Giftdampf)%3 == 0)
					{
						if (Gift < 3)
						{
							Gift += 1;

							Print	("Deine Widerstandskraft gegenüber Giften ist gestiegen.");
						};
					};
				};
			};

			DoIt = 0;
		};
	};

	if (GTM_Schamanenaxt_Time > 0)
	{
		if (GiftHeal == -1)
		{
			GTM_Schamanenaxt_Time = 0;
			GTM_Schamanenaxt_Damage = 0;
			GTM_Schamanenaxt_Tick = 0;

			DoIt = 1;
		}
		else
		{
			GTM_Schamanenaxt_Time -= GiftHeal;

			if (GTM_Schamanenaxt_Time <= 0)
			{
				GTM_Schamanenaxt_Time = 0;
				GTM_Schamanenaxt_Damage = 0;
				GTM_Schamanenaxt_Tick = 0;

				DoIt = 1;
			};
		};

		if (DoIt == 1)
		{
			GTM_Schamanenaxt += 1;

			Mod_CountGifte += 1;

			if (GTM_Schamanenaxt == 3)
			|| (GTM_Schamanenaxt == 10)
			|| (GTM_Schamanenaxt == 30)
			{
				if (Minecrawlergift < 2)
				{
					Minecrawlergift += 1;
				}
				else if (Minecrawlergift < 3)
				{
					Minecrawlergift += 1;

					Print	("Du bist Immun gegenüber dem Gift von Minecrawlern.");
				};

				if (Tiergift < 4)
				{
					Print	("Deine Resistenzen gegenüber Tiergiften sind gestiegen.");

					Tiergift += 1;

					if ((Gewaechsgift+Tiergift+Giftdampf)%3 == 0)
					{
						if (Gift < 3)
						{
							Gift += 1;

							Print	("Deine Widerstandskraft gegenüber Giften ist gestiegen.");
						};
					};
				};
			};

			DoIt = 0;
		};
	};

	if (GGD_Sumpfgasdrohne_Time > 0)
	{
		if (GiftHeal == -1)
		{
			GGD_Sumpfgasdrohne_Time = 0;
			GGD_Sumpfgasdrohne_Damage = 0;
			GGD_Sumpfgasdrohne_Tick = 0;

			DoIt = 1;
		}
		else
		{
			GGD_Sumpfgasdrohne_Time -= GiftHeal;

			if (GGD_Sumpfgasdrohne_Time <= 0)
			{
				GGD_Sumpfgasdrohne_Time = 0;
				GGD_Sumpfgasdrohne_Damage = 0;
				GGD_Sumpfgasdrohne_Tick = 0;

				DoIt = 1;
			};
		};

		if (DoIt == 1)
		{
			GGD_Sumpfgasdrohne += 1;

			Mod_CountGifte += 1;

			if (GGD_Sumpfgasdrohne == 3)
			|| (GGD_Sumpfgasdrohne == 10)
			|| (GGD_Sumpfgasdrohne == 20)
			|| (GGD_Sumpfgasdrohne == 40)
			{
				if (Giftdampf < 3)
				{
					Giftdampf += 1;

					Print	("Deine Resistenzen gegenüber giftigen Dämpfen sind gestiegen.");
				}
				else if (Giftdampf < 4)
				{
					Giftdampf += 1;

					Print	("Du hast die höchste Widerstandkraft gegenüber giftigen Dämpfen erreicht.");
				};

				if ((Gewaechsgift+Tiergift+Giftdampf)%3 == 0)
				{
					if (Gift < 3)
					{
						Gift += 1;

						Print	("Deine Widerstandskraft gegenüber Giften ist gestiegen.");
					};
				};
			};

			DoIt = 0;
		};
	};

	if (GGD_Sumpfgolem_Time > 0)
	{
		if (GiftHeal == -1)
		{
			GGD_Sumpfgolem_Time = 0;
			GGD_Sumpfgolem_Damage = 0;
			GGD_Sumpfgolem_Tick = 0;

			DoIt = 1;
		}
		else
		{
			GGD_Sumpfgolem_Time -= GiftHeal;

			if (GGD_Sumpfgolem_Time <= 0)
			{
				GGD_Sumpfgolem_Time = 0;
				GGD_Sumpfgolem_Damage = 0;
				GGD_Sumpfgolem_Tick = 0;

				DoIt = 1;
			};
		};

		if (DoIt == 1)
		{
			GGD_Sumpfgolem += 1;

			Mod_CountGifte += 1;

			if (GGD_Sumpfgolem == 3)
			|| (GGD_Sumpfgolem == 10)
			|| (GGD_Sumpfgolem == 20)
			|| (GGD_Sumpfgolem == 40)
			{
				if (Giftdampf < 3)
				{
					Giftdampf += 1;

					Print	("Deine Resistenzen gegenüber giftigen Dämpfen sind gestiegen.");
				}
				else if (Giftdampf < 4)
				{
					Giftdampf += 1;

					Print	("Du hast die höchste Widerstandkraft gegenüber giftigen Dämpfen erreicht.");
				};

				if ((Gewaechsgift+Tiergift+Giftdampf)%3 == 0)
				{
					if (Gift < 3)
					{
						Gift += 1;

						Print	("Deine Widerstandskraft gegenüber Giften ist gestiegen.");
					};
				};
			};

			DoIt = 0;
		};
	};

	if (GGD_Sumpfdrache_Time > 0)
	{
		if (GiftHeal == -1)
		{
			GGD_Sumpfdrache_Time = 0;
			GGD_Sumpfdrache_Damage = 0;
			GGD_Sumpfdrache_Tick = 0;

			DoIt = 1;
		}
		else
		{
			GGD_Sumpfdrache_Time -= GiftHeal;

			if (GGD_Sumpfdrache_Time <= 0)
			{
				GGD_Sumpfdrache_Time = 0;
				GGD_Sumpfdrache_Damage = 0;
				GGD_Sumpfdrache_Tick = 0;

				DoIt = 1;
			};
		};

		if (DoIt == 1)
		{
			GGD_Sumpfdrache += 1;

			Mod_CountGifte += 1;

			if (GGD_Sumpfdrache == 3)
			|| (GGD_Sumpfdrache == 10)
			|| (GGD_Sumpfdrache == 20)
			|| (GGD_Sumpfdrache == 40)
			{
				if (Giftdampf < 3)
				{
					Giftdampf += 1;

					Print	("Deine Resistenzen gegenüber giftigen Dämpfen sind gestiegen.");
				}
				else if (Giftdampf < 4)
				{
					Giftdampf += 1;

					Print	("Du hast die höchste Widerstandkraft gegenüber giftigen Dämpfen erreicht.");
				};

				if ((Gewaechsgift+Tiergift+Giftdampf)%3 == 0)
				{
					if (Gift < 3)
					{
						Gift += 1;

						Print	("Deine Widerstandskraft gegenüber Giften ist gestiegen.");
					};
				};
			};

			DoIt = 0;
		};
	};

	if (GGD_Giftkrater_Time > 0)
	{
		if (GiftHeal == -1)
		{
			GGD_Giftkrater_Time = 0;
			GGD_Giftkrater_Damage = 0;
			GGD_Giftkrater_Tick = 0;

			DoIt = 1;
		}
		else
		{
			GGD_Giftkrater_Time -= GiftHeal;

			if (GGD_Giftkrater_Time <= 0)
			{
				GGD_Giftkrater_Time = 0;
				GGD_Giftkrater_Damage = 0;
				GGD_Giftkrater_Tick = 0;

				DoIt = 1;
			};
		};

		if (DoIt == 1)
		{
			GGD_Giftkrater += 1;

			Mod_CountGifte += 1;

			if (GGD_Giftkrater == 3)
			|| (GGD_Giftkrater == 10)
			|| (GGD_Giftkrater == 20)
			|| (GGD_Giftkrater == 40)
			{
				if (Giftdampf < 3)
				{
					Giftdampf += 1;

					Print	("Deine Resistenzen gegenüber giftigen Dämpfen sind gestiegen.");
				}
				else if (Giftdampf < 4)
				{
					Giftdampf += 1;

					Print	("Du hast die höchste Widerstandkraft gegenüber giftigen Dämpfen erreicht.");
				};

				if ((Gewaechsgift+Tiergift+Giftdampf)%3 == 0)
				{
					if (Gift < 3)
					{
						Gift += 1;

						Print	("Deine Widerstandskraft gegenüber Giften ist gestiegen.");
					};
				};
			};

			DoIt = 0;
		};
	};


	// Krankheiten

	if (BissDerFaeulnis_Time > 0)
	{
		if (KrankheitHeal >= BissDerFaeulnis_Stufe03)
		{
			KrankheitHeal -= BissDerFaeulnis_Stufe03;

			BissDerFaeulnis_Stufe03 = 0;

			if (KrankheitHeal >= BissDerFaeulnis_Stufe02)
			{
				KrankheitHeal -= BissDerFaeulnis_Stufe02;

				BissDerFaeulnis_Stufe02 = 0;

				if (KrankheitHeal >= BissDerFaeulnis_Stufe01)
				{
					KrankheitHeal -= BissDerFaeulnis_Stufe01;

					BissDerFaeulnis_Stufe01 = 0;

					Mod_CountGifte += 1;
				}
				else
				{
					BissDerFaeulnis_Stufe01 -= KrankheitHeal;
				};
			}
			else
			{
				BissDerFaeulnis_Stufe02 -= KrankheitHeal;
			};
		}
		else
		{
			BissDerFaeulnis_Stufe03 -= KrankheitHeal;
		};
	};

	if (HauchDerPestilenz_Time > 0)
	{
		if (KrankheitHeal >= HauchDerPestilenz_Stufe03)
		{
			KrankheitHeal -= HauchDerPestilenz_Stufe03;

			HauchDerPestilenz_Stufe03 = 0;

			if (KrankheitHeal >= HauchDerPestilenz_Stufe02)
			{
				KrankheitHeal -= HauchDerPestilenz_Stufe02;

				HauchDerPestilenz_Stufe02 = 0;

				if (KrankheitHeal >= HauchDerPestilenz_Stufe01)
				{
					KrankheitHeal -= HauchDerPestilenz_Stufe01;

					HauchDerPestilenz_Stufe01 = 0;

					Mod_CountGifte += 1;
				}
				else
				{
					HauchDerPestilenz_Stufe01 -= KrankheitHeal;
				};
			}
			else
			{
				HauchDerPestilenz_Stufe02 -= KrankheitHeal;
			};
		}
		else
		{
			HauchDerPestilenz_Stufe03 -= KrankheitHeal;
		};
	};
};