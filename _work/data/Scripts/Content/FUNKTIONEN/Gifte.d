FUNC VOID Gifte ()
{
	// Sumpfgolem-Vergiftung GGPf

	if (GGPf_Sumpfgolem_Time > 0)
	{
		GGPf_Sumpfgolem_Time -= 1;

		if (GGPf_Sumpfgolem_Damage == 3000)	// bei 100% sekündlich vollen Schaden
		{
			hero.attribute[ATR_HITPOINTS] -= 3;
		}
		else if (GGPf_Sumpfgolem_Damage == 2700)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GGPf_Sumpfgolem_Tick < 3)
			{
				hero.attribute[ATR_HITPOINTS] -= 2;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] -= 3;
			};

			GGPf_Sumpfgolem_Tick += 1;

			if (GGPf_Sumpfgolem_Tick >= 10)
			{
				GGPf_Sumpfgolem_Tick = 0;
			};
		}
		else if (GGPf_Sumpfgolem_Damage == 2400)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GGPf_Sumpfgolem_Tick < 1)
			{
				hero.attribute[ATR_HITPOINTS] -= 1;
			}
			else if (GGPf_Sumpfgolem_Tick < 5)
			{
				hero.attribute[ATR_HITPOINTS] -= 2;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] -= 3;
			};

			GGPf_Sumpfgolem_Tick += 1;

			if (GGPf_Sumpfgolem_Tick >= 10)
			{
				GGPf_Sumpfgolem_Tick = 0;
			};
		}
		else if (GGPf_Sumpfgolem_Damage == 2100)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GGPf_Sumpfgolem_Tick < 9)
			{
				hero.attribute[ATR_HITPOINTS] -= 2;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] -= 3;
			};

			GGPf_Sumpfgolem_Tick += 1;

			if (GGPf_Sumpfgolem_Tick >= 10)
			{
				GGPf_Sumpfgolem_Tick = 0;
			};
		};

		if (GGPf_Sumpfgolem_Time == 0)
		{
			GGPf_Sumpfgolem_Damage = 0;

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

					PrintScreen	("Du bist Immun gegenüber dem Gift von Pflanzen.", -1, -1, FONT_SCREEN, 2);
				};

				if (Gewaechsgift < 4)
				{
					PrintScreen	("Deine Resistenzen gegenüber Gewächsgiften sind gestiegen.", -1, -1, FONT_SCREEN, 2);

					Gewaechsgift += 1;

					if ((Gewaechsgift+Tiergift+Giftdampf)%3 == 0)
					{
						if (Gift < 3)
						{
							Gift += 1;

							PrintScreen	("Deine Widerstandskraft gegenüber Giften ist gestiegen.", -1, -1, FONT_SCREEN, 2);
						};
					};
				};
			};
		};
	};

	// Orkschamane-Vergiftung GGPi

	if (GGPi_Orkschamane_Time > 0)
	{
		GGPi_Orkschamane_Time -= 1;

		if (GGPi_Orkschamane_Damage == 3000)	// bei 100% sekündlich vollen Schaden
		{
			hero.attribute[ATR_HITPOINTS] -= 3;
		}
		else if (GGPi_Orkschamane_Damage == 2700)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GGPi_Orkschamane_Tick < 3)
			{
				hero.attribute[ATR_HITPOINTS] -= 2;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] -= 3;
			};

			GGPi_Orkschamane_Tick += 1;

			if (GGPi_Orkschamane_Tick >= 10)
			{
				GGPi_Orkschamane_Tick = 0;
			};
		}
		else if (GGPi_Orkschamane_Damage == 2400)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GGPi_Orkschamane_Tick < 1)
			{
				hero.attribute[ATR_HITPOINTS] -= 1;
			}
			else if (GGPi_Orkschamane_Tick < 5)
			{
				hero.attribute[ATR_HITPOINTS] -= 2;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] -= 3;
			};

			GGPi_Orkschamane_Tick += 1;

			if (GGPi_Orkschamane_Tick >= 10)
			{
				GGPi_Orkschamane_Tick = 0;
			};
		}
		else if (GGPi_Orkschamane_Damage == 2100)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GGPi_Orkschamane_Tick < 9)
			{
				hero.attribute[ATR_HITPOINTS] -= 2;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] -= 3;
			};

			GGPi_Orkschamane_Tick += 1;

			if (GGPi_Orkschamane_Tick >= 10)
			{
				GGPi_Orkschamane_Tick = 0;
			};
		};

		if (GGPi_Orkschamane_Time == 0)
		{
			GGPi_Orkschamane_Damage = 0;

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

					PrintScreen	("Du bist Immun gegenüber dem Gift von Pilzen.", -1, -1, FONT_SCREEN, 2);
				};

				if (Gewaechsgift < 4)
				{
					PrintScreen	("Deine Resistenzen gegenüber Gewächsgiften sind gestiegen.", -1, -1, FONT_SCREEN, 2);

					Gewaechsgift += 1;

					if ((Gewaechsgift+Tiergift+Giftdampf)%3 == 0)
					{
						if (Gift < 3)
						{
							Gift += 1;

							PrintScreen	("Deine Widerstandskraft gegenüber Giften ist gestiegen.", -1, -1, FONT_SCREEN, 2);
						};
					};
				};
			};
		};
	};

	// Echsenmensch-Vergiftung GGPf

	if (GGPf_Echsenmensch_Time > 0)
	{
		GGPf_Echsenmensch_Time -= 1;

		if (GGPf_Echsenmensch_Damage == 5000)	// bei 100% sekündlich vollen Schaden
		{
			hero.attribute[ATR_HITPOINTS] -= 5;
		}
		else if (GGPf_Echsenmensch_Damage == 4500)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GGPf_Echsenmensch_Tick < 5)
			{
				hero.attribute[ATR_HITPOINTS] -= 4;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] -= 5;
			};

			GGPf_Echsenmensch_Tick += 1;

			if (GGPf_Echsenmensch_Tick >= 10)
			{
				GGPf_Echsenmensch_Tick = 0;
			};
		}
		else if (GGPf_Echsenmensch_Damage == 4000)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			hero.attribute[ATR_HITPOINTS] -= 4;

			GGPf_Echsenmensch_Tick += 1;

			if (GGPf_Echsenmensch_Tick >= 10)
			{
				GGPf_Echsenmensch_Tick = 0;
			};
		}
		else if (GGPf_Echsenmensch_Damage == 3600)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GGPf_Echsenmensch_Tick < 9)
			{
				hero.attribute[ATR_HITPOINTS] -= 4;
			};

			GGPf_Echsenmensch_Tick += 1;

			if (GGPf_Echsenmensch_Tick >= 10)
			{
				GGPf_Echsenmensch_Tick = 0;
			};
		};

		if (GGPf_Echsenmensch_Time == 0)
		{
			GGPf_Echsenmensch_Damage = 0;

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

					PrintScreen	("Du bist Immun gegenüber dem Gift von Pflanzen.", -1, -1, FONT_SCREEN, 2);
				};

				if (Gewaechsgift < 4)
				{
					PrintScreen	("Deine Resistenzen gegenüber Gewächsgiften sind gestiegen.", -1, -1, FONT_SCREEN, 2);

					Gewaechsgift += 1;

					if ((Gewaechsgift+Tiergift+Giftdampf)%3 == 0)
					{
						if (Gift < 3)
						{
							Gift += 1;

							PrintScreen	("Deine Widerstandskraft gegenüber Giften ist gestiegen.", -1, -1, FONT_SCREEN, 2);
						};
					};
				};
			};
		};
	};

	// OrkkriegerArmbrust-Vergiftung GGPf

	if (GGPi_OrkkriegerArmbrust_Time > 0)
	{
		GGPi_OrkkriegerArmbrust_Time -= 1;

		if (GGPi_OrkkriegerArmbrust_Damage == 3000)	// bei 100% sekündlich vollen Schaden
		{
			hero.attribute[ATR_HITPOINTS] -= 3;
		}
		else if (GGPi_OrkkriegerArmbrust_Damage == 2700)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GGPi_OrkkriegerArmbrust_Tick < 3)
			{
				hero.attribute[ATR_HITPOINTS] -= 2;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] -= 3;
			};

			GGPi_OrkkriegerArmbrust_Tick += 1;

			if (GGPi_OrkkriegerArmbrust_Tick >= 10)
			{
				GGPi_OrkkriegerArmbrust_Tick = 0;
			};
		}
		else if (GGPi_OrkkriegerArmbrust_Damage == 2400)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GGPi_OrkkriegerArmbrust_Tick < 1)
			{
				hero.attribute[ATR_HITPOINTS] -= 1;
			}
			else if (GGPi_OrkkriegerArmbrust_Tick < 5)
			{
				hero.attribute[ATR_HITPOINTS] -= 2;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] -= 3;
			};

			GGPi_OrkkriegerArmbrust_Tick += 1;

			if (GGPi_OrkkriegerArmbrust_Tick >= 10)
			{
				GGPi_OrkkriegerArmbrust_Tick = 0;
			};
		}
		else if (GGPi_OrkkriegerArmbrust_Damage == 2100)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GGPi_OrkkriegerArmbrust_Tick < 9)
			{
				hero.attribute[ATR_HITPOINTS] -= 2;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] -= 3;
			};

			GGPi_OrkkriegerArmbrust_Tick += 1;

			if (GGPi_OrkkriegerArmbrust_Tick >= 10)
			{
				GGPi_OrkkriegerArmbrust_Tick = 0;
			};
		};

		if (GGPi_OrkkriegerArmbrust_Time == 0)
		{
			GGPi_OrkkriegerArmbrust_Damage = 0;

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

					PrintScreen	("Du bist Immun gegenüber dem Gift von Pilzen.", -1, -1, FONT_SCREEN, 2);
				};

				if (Gewaechsgift < 4)
				{
					PrintScreen	("Deine Resistenzen gegenüber Gewächsgiften sind gestiegen.", -1, -1, FONT_SCREEN, 2);

					Gewaechsgift += 1;

					if ((Gewaechsgift+Tiergift+Giftdampf)%3 == 0)
					{
						if (Gift < 3)
						{
							Gift += 1;

							PrintScreen	("Deine Widerstandskraft gegenüber Giften ist gestiegen.", -1, -1, FONT_SCREEN, 2);
						};
					};
				};
			};
		};
	};

	// Fliegenpilz-Vergiftung GGPf

	if (GGPi_Fliegenpilz_Time > 0)
	{
		GGPi_Fliegenpilz_Time -= 1;

		if (GGPi_Fliegenpilz_Damage == 1000)	// bei 100% sekündlich vollen Schaden
		{
			hero.attribute[ATR_HITPOINTS] -= 1;
		}
		else if (GGPi_Fliegenpilz_Damage == 900)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GGPi_Fliegenpilz_Tick < 9)
			{
				hero.attribute[ATR_HITPOINTS] -= 1;
			};

			GGPi_Fliegenpilz_Tick += 1;

			if (GGPi_Fliegenpilz_Tick >= 10)
			{
				GGPi_Fliegenpilz_Tick = 0;
			};
		}
		else if (GGPi_Fliegenpilz_Damage == 800)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GGPi_Fliegenpilz_Tick < 8)
			{
				hero.attribute[ATR_HITPOINTS] -= 1;
			};

			GGPi_Fliegenpilz_Tick += 1;

			if (GGPi_Fliegenpilz_Tick >= 10)
			{
				GGPi_Fliegenpilz_Tick = 0;
			};
		}
		else if (GGPi_Fliegenpilz_Damage == 700)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GGPi_Fliegenpilz_Tick < 7)
			{
				hero.attribute[ATR_HITPOINTS] -= 1;
			};

			GGPi_Fliegenpilz_Tick += 1;

			if (GGPi_Fliegenpilz_Tick >= 10)
			{
				GGPi_Fliegenpilz_Tick = 0;
			};
		};

		if (GGPi_Fliegenpilz_Time == 0)
		{
			GGPi_Fliegenpilz_Damage = 0;

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

					PrintScreen	("Du bist Immun gegenüber dem Gift von Pilzen.", -1, -1, FONT_SCREEN, 2);
				};

				if (Gewaechsgift < 4)
				{
					PrintScreen	("Deine Resistenzen gegenüber Gewächsgiften sind gestiegen.", -1, -1, FONT_SCREEN, 2);

					Gewaechsgift += 1;

					if ((Gewaechsgift+Tiergift+Giftdampf)%3 == 0)
					{
						if (Gift < 3)
						{
							Gift += 1;

							PrintScreen	("Deine Widerstandskraft gegenüber Giften ist gestiegen.", -1, -1, FONT_SCREEN, 2);
						};
					};
				};
			};
		};
	};

	// Echsenschwert-Vergiftung GGPf

	if (GGPf_Echsenschwert_Time > 0)
	{
		GGPf_Echsenschwert_Time -= 1;

		if (GGPf_Echsenschwert_Damage == 3000)	// bei 100% sekündlich vollen Schaden
		{
			hero.attribute[ATR_HITPOINTS] -= 3;
		}
		else if (GGPf_Echsenschwert_Damage == 2700)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GGPf_Echsenschwert_Tick < 3)
			{
				hero.attribute[ATR_HITPOINTS] -= 2;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] -= 3;
			};

			GGPf_Echsenschwert_Tick += 1;

			if (GGPf_Echsenschwert_Tick >= 10)
			{
				GGPf_Echsenschwert_Tick = 0;
			};
		}
		else if (GGPf_Echsenschwert_Damage == 2400)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GGPf_Echsenschwert_Tick < 1)
			{
				hero.attribute[ATR_HITPOINTS] -= 1;
			}
			else if (GGPf_Echsenschwert_Tick < 5)
			{
				hero.attribute[ATR_HITPOINTS] -= 2;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] -= 3;
			};

			GGPf_Echsenschwert_Tick += 1;

			if (GGPf_Echsenschwert_Tick >= 10)
			{
				GGPf_Echsenschwert_Tick = 0;
			};
		}
		else if (GGPf_Echsenschwert_Damage == 2100)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GGPf_Echsenschwert_Tick < 9)
			{
				hero.attribute[ATR_HITPOINTS] -= 2;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] -= 3;
			};

			GGPf_Echsenschwert_Tick += 1;

			if (GGPf_Echsenschwert_Tick >= 10)
			{
				GGPf_Echsenschwert_Tick = 0;
			};
		};

		if (GGPf_Echsenschwert_Time == 0)
		{
			GGPf_Echsenschwert_Damage = 0;

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

					PrintScreen	("Du bist Immun gegenüber dem Gift von Pflanzen.", -1, -1, FONT_SCREEN, 2);
				};

				if (Gewaechsgift < 4)
				{
					PrintScreen	("Deine Resistenzen gegenüber Gewächsgiften sind gestiegen.", -1, -1, FONT_SCREEN, 2);

					Gewaechsgift += 1;

					if ((Gewaechsgift+Tiergift+Giftdampf)%3 == 0)
					{
						if (Gift < 3)
						{
							Gift += 1;

							PrintScreen	("Deine Widerstandskraft gegenüber Giften ist gestiegen.", -1, -1, FONT_SCREEN, 2);
						};
					};
				};
			};
		};
	};

	// Assassinenschwert-Vergiftung GGPf

	if (GGPf_Assassinenschwert_Time > 0)
	{
		GGPf_Assassinenschwert_Time -= 1;

		if (GGPf_Assassinenschwert_Damage == 3000)	// bei 100% sekündlich vollen Schaden
		{
			hero.attribute[ATR_HITPOINTS] -= 3;
		}
		else if (GGPf_Assassinenschwert_Damage == 2700)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GGPf_Assassinenschwert_Tick < 3)
			{
				hero.attribute[ATR_HITPOINTS] -= 2;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] -= 3;
			};

			GGPf_Assassinenschwert_Tick += 1;

			if (GGPf_Assassinenschwert_Tick >= 10)
			{
				GGPf_Assassinenschwert_Tick = 0;
			};
		}
		else if (GGPf_Assassinenschwert_Damage == 2400)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GGPf_Assassinenschwert_Tick < 1)
			{
				hero.attribute[ATR_HITPOINTS] -= 1;
			}
			else if (GGPf_Assassinenschwert_Tick < 5)
			{
				hero.attribute[ATR_HITPOINTS] -= 2;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] -= 3;
			};

			GGPf_Assassinenschwert_Tick += 1;

			if (GGPf_Assassinenschwert_Tick >= 10)
			{
				GGPf_Assassinenschwert_Tick = 0;
			};
		}
		else if (GGPf_Assassinenschwert_Damage == 2100)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GGPf_Assassinenschwert_Tick < 9)
			{
				hero.attribute[ATR_HITPOINTS] -= 2;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] -= 3;
			};

			GGPf_Assassinenschwert_Tick += 1;

			if (GGPf_Assassinenschwert_Tick >= 10)
			{
				GGPf_Assassinenschwert_Tick = 0;
			};
		};

		if (GGPf_Assassinenschwert_Time == 0)
		{
			GGPf_Assassinenschwert_Damage = 0;

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

					PrintScreen	("Du bist Immun gegenüber dem Gift von Pflanzen.", -1, -1, FONT_SCREEN, 2);
				};

				if (Gewaechsgift < 4)
				{
					PrintScreen	("Deine Resistenzen gegenüber Gewächsgiften sind gestiegen.", -1, -1, FONT_SCREEN, 2);

					Gewaechsgift += 1;

					if ((Gewaechsgift+Tiergift+Giftdampf)%3 == 0)
					{
						if (Gift < 3)
						{
							Gift += 1;

							PrintScreen	("Deine Widerstandskraft gegenüber Giften ist gestiegen.", -1, -1, FONT_SCREEN, 2);
						};
					};
				};
			};
		};
	};

	// Schamanenaxt-Vergiftung GGPi

	if (GGPi_Schamanenaxt_Time > 0)
	{
		GGPi_Schamanenaxt_Time -= 1;

		if (GGPi_Schamanenaxt_Damage == 3000)	// bei 100% sekündlich vollen Schaden
		{
			hero.attribute[ATR_HITPOINTS] -= 3;
		}
		else if (GGPi_Schamanenaxt_Damage == 2700)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GGPi_Schamanenaxt_Tick < 3)
			{
				hero.attribute[ATR_HITPOINTS] -= 2;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] -= 3;
			};

			GGPi_Schamanenaxt_Tick += 1;

			if (GGPi_Schamanenaxt_Tick >= 10)
			{
				GGPi_Schamanenaxt_Tick = 0;
			};
		}
		else if (GGPi_Schamanenaxt_Damage == 2400)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GGPi_Schamanenaxt_Tick < 1)
			{
				hero.attribute[ATR_HITPOINTS] -= 1;
			}
			else if (GGPi_Schamanenaxt_Tick < 5)
			{
				hero.attribute[ATR_HITPOINTS] -= 2;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] -= 3;
			};

			GGPi_Schamanenaxt_Tick += 1;

			if (GGPi_Schamanenaxt_Tick >= 10)
			{
				GGPi_Schamanenaxt_Tick = 0;
			};
		}
		else if (GGPi_Schamanenaxt_Damage == 2100)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GGPi_Schamanenaxt_Tick < 9)
			{
				hero.attribute[ATR_HITPOINTS] -= 2;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] -= 3;
			};

			GGPi_Schamanenaxt_Tick += 1;

			if (GGPi_Schamanenaxt_Tick >= 10)
			{
				GGPi_Schamanenaxt_Tick = 0;
			};
		};

		if (GGPi_Schamanenaxt_Time == 0)
		{
			GGPi_Schamanenaxt_Damage = 0;

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

					PrintScreen	("Du bist Immun gegenüber dem Gift von Pilzen.", -1, -1, FONT_SCREEN, 2);
				};

				if (Gewaechsgift < 4)
				{
					PrintScreen	("Deine Resistenzen gegenüber Gewächsgiften sind gestiegen.", -1, -1, FONT_SCREEN, 2);

					Gewaechsgift += 1;

					if ((Gewaechsgift+Tiergift+Giftdampf)%3 == 0)
					{
						if (Gift < 3)
						{
							Gift += 1;

							PrintScreen	("Deine Widerstandskraft gegenüber Giften ist gestiegen.", -1, -1, FONT_SCREEN, 2);
						};
					};
				};
			};
		};
	};

	// Blutfliege-Vergiftung GTB

	if (GTB_Blutfliege_Time > 0)
	{
		GTB_Blutfliege_Time -= 1;

		if (GTB_Blutfliege_Damage == 3000)	// bei 100% sekündlich vollen Schaden
		{
			hero.attribute[ATR_HITPOINTS] -= 3;
		}
		else if (GTB_Blutfliege_Damage == 2700)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GTB_Blutfliege_Tick < 3)
			{
				hero.attribute[ATR_HITPOINTS] -= 2;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] -= 3;
			};

			GTB_Blutfliege_Tick += 1;

			if (GTB_Blutfliege_Tick >= 10)
			{
				GTB_Blutfliege_Tick = 0;
			};
		}
		else if (GTB_Blutfliege_Damage == 2400)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GTB_Blutfliege_Tick < 1)
			{
				hero.attribute[ATR_HITPOINTS] -= 1;
			}
			else if (GTB_Blutfliege_Tick < 5)
			{
				hero.attribute[ATR_HITPOINTS] -= 2;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] -= 3;
			};

			GTB_Blutfliege_Tick += 1;

			if (GTB_Blutfliege_Tick >= 10)
			{
				GTB_Blutfliege_Tick = 0;
			};
		}
		else if (GTB_Blutfliege_Damage == 2100)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GTB_Blutfliege_Tick < 9)
			{
				hero.attribute[ATR_HITPOINTS] -= 2;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] -= 3;
			};

			GTB_Blutfliege_Tick += 1;

			if (GTB_Blutfliege_Tick >= 10)
			{
				GTB_Blutfliege_Tick = 0;
			};
		};

		if (GTB_Blutfliege_Time == 0)
		{
			GTB_Blutfliege_Damage = 0;

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

					PrintScreen	("Du bist Immun gegenüber dem Gift von Blutfliegen.", -1, -1, FONT_SCREEN, 2);
				};

				if (Tiergift < 3)
				{
					PrintScreen	("Deine Resistenzen gegenüber Tiergiften sind gestiegen.", -1, -1, FONT_SCREEN, 2);

					Tiergift += 1;

					if ((Gewaechsgift+Tiergift+Giftdampf)%3 == 0)
					{
						if (Gift < 3)
						{
							Gift += 1;

							PrintScreen	("Deine Widerstandskraft gegenüber Giften ist gestiegen.", -1, -1, FONT_SCREEN, 2);
						};
					};
				};
			};
		};
	};

	// Sumpfgasdrohne-Vergiftung GTS

	if (GTS_Sumpfgasdrohne_Time > 0)
	{
		GTS_Sumpfgasdrohne_Time -= 1;

		if (GTS_Sumpfgasdrohne_Damage == 5000)	// bei 100% sekündlich vollen Schaden
		{
			hero.attribute[ATR_HITPOINTS] -= 5;
		}
		else if (GTS_Sumpfgasdrohne_Damage == 4500)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GTS_Sumpfgasdrohne_Tick < 5)
			{
				hero.attribute[ATR_HITPOINTS] -= 4;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] -= 5;
			};

			GTS_Sumpfgasdrohne_Tick += 1;

			if (GTS_Sumpfgasdrohne_Tick >= 10)
			{
				GTS_Sumpfgasdrohne_Tick = 0;
			};
		}
		else if (GTS_Sumpfgasdrohne_Damage == 4000)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			hero.attribute[ATR_HITPOINTS] -= 4;

			GTS_Sumpfgasdrohne_Tick += 1;

			if (GTS_Sumpfgasdrohne_Tick >= 10)
			{
				GTS_Sumpfgasdrohne_Tick = 0;
			};
		}
		else if (GTS_Sumpfgasdrohne_Damage == 3600)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GTS_Sumpfgasdrohne_Tick < 9)
			{
				hero.attribute[ATR_HITPOINTS] -= 4;
			};

			GTS_Sumpfgasdrohne_Tick += 1;

			if (GTS_Sumpfgasdrohne_Tick >= 10)
			{
				GTS_Sumpfgasdrohne_Tick = 0;
			};
		};

		if (GTS_Sumpfgasdrohne_Time == 0)
		{
			GTS_Sumpfgasdrohne_Damage = 0;

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

					PrintScreen	("Du bist Immun gegenüber dem Gift von Sumpfgasdrohnen.", -1, -1, FONT_SCREEN, 2);
				};

				if (Tiergift < 4)
				{
					PrintScreen	("Deine Resistenzen gegenüber Tiergiften sind gestiegen.", -1, -1, FONT_SCREEN, 2);

					Tiergift += 1;

					if ((Gewaechsgift+Tiergift+Giftdampf)%3 == 0)
					{
						if (Gift < 3)
						{
							Gift += 1;

							PrintScreen	("Deine Widerstandskraft gegenüber Giften ist gestiegen.", -1, -1, FONT_SCREEN, 2);
						};
					};
				};
			};
		};
	};

	// Minecrawler-Vergiftung GTM

	if (GTM_Minecrawler_Time > 0)
	{
		GTM_Minecrawler_Time -= 1;

		if (GTM_Minecrawler_Damage == 6000)	// bei 100% sekündlich vollen Schaden
		{
			hero.attribute[ATR_HITPOINTS] -= 6;
		}
		else if (GTM_Minecrawler_Damage == 5400)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GTM_Minecrawler_Tick < 1)
			{
				hero.attribute[ATR_HITPOINTS] -= 4;
			}
			else if (GTM_Minecrawler_Tick < 5)
			{
				hero.attribute[ATR_HITPOINTS] -= 5;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] -= 6;
			};

			GTM_Minecrawler_Tick += 1;

			if (GTM_Minecrawler_Tick >= 10)
			{
				GTM_Minecrawler_Tick = 0;
			};
		}
		else if (GTM_Minecrawler_Damage == 4800)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GTM_Minecrawler_Tick < 1)
			{
				hero.attribute[ATR_HITPOINTS] -= 2;
			}
			else if (GTM_Minecrawler_Tick < 2)
			{
				hero.attribute[ATR_HITPOINTS] -= 3;
			}
			else if (GTM_Minecrawler_Tick < 3)
			{
				hero.attribute[ATR_HITPOINTS] -= 4;
			}
			else if (GTM_Minecrawler_Tick < 6)
			{
				hero.attribute[ATR_HITPOINTS] -= 5;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] -= 6;
			};

			GTM_Minecrawler_Tick += 1;

			if (GTM_Minecrawler_Tick >= 10)
			{
				GTM_Minecrawler_Tick = 0;
			};
		}
		else if (GTM_Minecrawler_Damage == 4300)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GTM_Minecrawler_Tick < 1)
			{
				hero.attribute[ATR_HITPOINTS] -= 1;
			}
			else if (GTM_Minecrawler_Tick < 2)
			{
				hero.attribute[ATR_HITPOINTS] -= 2;
			}
			else if (GTM_Minecrawler_Tick < 3)
			{
				hero.attribute[ATR_HITPOINTS] -= 3;
			}
			else if (GTM_Minecrawler_Tick < 4)
			{
				hero.attribute[ATR_HITPOINTS] -= 4;
			}
			else if (GTM_Minecrawler_Tick < 7)
			{
				hero.attribute[ATR_HITPOINTS] -= 5;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] -= 6;
			};

			GTM_Minecrawler_Tick += 1;

			if (GTM_Minecrawler_Tick >= 10)
			{
				GTM_Minecrawler_Tick = 0;
			};
		};

		if (GTM_Minecrawler_Time == 0)
		{
			GTM_Minecrawler_Damage = 0;

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

					PrintScreen	("Du bist Immun gegenüber dem Gift von Minecrawlern.", -1, -1, FONT_SCREEN, 2);
				};

				if (Tiergift < 4)
				{
					PrintScreen	("Deine Resistenzen gegenüber Tiergiften sind gestiegen.", -1, -1, FONT_SCREEN, 2);

					Tiergift += 1;

					if ((Gewaechsgift+Tiergift+Giftdampf)%3 == 0)
					{
						if (Gift < 3)
						{
							Gift += 1;

							PrintScreen	("Deine Widerstandskraft gegenüber Giften ist gestiegen.", -1, -1, FONT_SCREEN, 2);
						};
					};
				};
			};
		};
	};

	// MinecrawlerWarrior-Vergiftung GTM

	if (GTM_MinecrawlerWarrior_Time > 0)
	{
		GTM_MinecrawlerWarrior_Time -= 1;

		if (GTM_MinecrawlerWarrior_Damage == 8000)	// bei 100% sekündlich vollen Schaden
		{
			hero.attribute[ATR_HITPOINTS] -= 8;
		}
		else if (GTM_MinecrawlerWarrior_Damage == 7200)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GTM_MinecrawlerWarrior_Tick < 8)
			{
				hero.attribute[ATR_HITPOINTS] -= 7;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] -= 8;
			};

			GTM_MinecrawlerWarrior_Tick += 1;

			if (GTM_MinecrawlerWarrior_Tick >= 10)
			{
				GTM_MinecrawlerWarrior_Tick = 0;
			};
		}
		else if (GTM_MinecrawlerWarrior_Damage == 6400)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GTM_MinecrawlerWarrior_Tick < 6)
			{
				hero.attribute[ATR_HITPOINTS] -= 6;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] -= 7;
			};

			GTM_MinecrawlerWarrior_Tick += 1;

			if (GTM_MinecrawlerWarrior_Tick >= 10)
			{
				GTM_MinecrawlerWarrior_Tick = 0;
			};
		}
		else if (GTM_MinecrawlerWarrior_Damage == 5800)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GTM_MinecrawlerWarrior_Tick < 2)
			{
				hero.attribute[ATR_HITPOINTS] -= 5;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] -= 6;
			};

			GTM_MinecrawlerWarrior_Tick += 1;

			if (GTM_MinecrawlerWarrior_Tick >= 10)
			{
				GTM_MinecrawlerWarrior_Tick = 0;
			};
		};

		if (GTM_MinecrawlerWarrior_Time == 0)
		{
			GTM_MinecrawlerWarrior_Damage = 0;

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
				else if (Minecrawlergift < 4)
				{
					Minecrawlergift += 1;

					PrintScreen	("Du bist Immun gegenüber dem Gift von Minecrawlern.", -1, -1, FONT_SCREEN, 2);
				};

				if (Tiergift < 4)
				{
					PrintScreen	("Deine Resistenzen gegenüber Tiergiften sind gestiegen.", -1, -1, FONT_SCREEN, 2);

					Tiergift += 1;

					if ((Gewaechsgift+Tiergift+Giftdampf)%3 == 0)
					{
						if (Gift < 3)
						{
							Gift += 1;

							PrintScreen	("Deine Widerstandskraft gegenüber Giften ist gestiegen.", -1, -1, FONT_SCREEN, 2);
						};
					};
				};
			};
		};
	};

	// Sumpfhai-Vergiftung GTSu

	if (GTSu_Sumpfhai_Time > 0)
	{
		GTSu_Sumpfhai_Time -= 1;

		if (GTSu_Sumpfhai_Damage == 5000)	// bei 100% sekündlich vollen Schaden
		{
			hero.attribute[ATR_HITPOINTS] -= 5;
		}
		else if (GTSu_Sumpfhai_Damage == 4500)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GTSu_Sumpfhai_Tick < 9)
			{
				hero.attribute[ATR_HITPOINTS] -= 5;
			};

			GTSu_Sumpfhai_Tick += 1;

			if (GTSu_Sumpfhai_Tick >= 10)
			{
				GTSu_Sumpfhai_Tick = 0;
			};
		}
		else if (GTSu_Sumpfhai_Damage == 4000)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			hero.attribute[ATR_HITPOINTS] -= 4;

			GTSu_Sumpfhai_Tick += 1;

			if (GTSu_Sumpfhai_Tick >= 10)
			{
				GTSu_Sumpfhai_Tick = 0;
			};
		}
		else if (GTSu_Sumpfhai_Damage == 3600)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GTSu_Sumpfhai_Tick < 9)
			{
				hero.attribute[ATR_HITPOINTS] -= 4;
			};

			GTSu_Sumpfhai_Tick += 1;

			if (GTSu_Sumpfhai_Tick >= 10)
			{
				GTSu_Sumpfhai_Tick = 0;
			};
		};

		if (GTSu_Sumpfhai_Time == 0)
		{
			GTSu_Sumpfhai_Damage = 0;

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
				else if (Sumpfhaigift < 4)
				{
					Sumpfhaigift += 1;

					PrintScreen	("Du bist Immun gegenüber dem Gift von Sumpfhaien.", -1, -1, FONT_SCREEN, 2);
				};

				if (Tiergift < 4)
				{
					PrintScreen	("Deine Resistenzen gegenüber Tiergiften sind gestiegen.", -1, -1, FONT_SCREEN, 2);

					Tiergift += 1;

					if ((Gewaechsgift+Tiergift+Giftdampf)%3 == 0)
					{
						if (Gift < 3)
						{
							Gift += 1;

							PrintScreen	("Deine Widerstandskraft gegenüber Giften ist gestiegen.", -1, -1, FONT_SCREEN, 2);
						};
					};
				};
			};
		};
	};

	// Echsenschwert-Vergiftung GTS

	if (GTS_Echsenschwert_Time > 0)
	{
		GTS_Echsenschwert_Time -= 1;

		if (GTS_Echsenschwert_Damage == 5000)	// bei 100% sekündlich vollen Schaden
		{
			hero.attribute[ATR_HITPOINTS] -= 5;
		}
		else if (GTS_Echsenschwert_Damage == 4500)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GTS_Echsenschwert_Tick < 9)
			{
				hero.attribute[ATR_HITPOINTS] -= 5;
			};

			GTS_Echsenschwert_Tick += 1;

			if (GTS_Echsenschwert_Tick >= 10)
			{
				GTS_Echsenschwert_Tick = 0;
			};
		}
		else if (GTS_Echsenschwert_Damage == 4000)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			hero.attribute[ATR_HITPOINTS] -= 4;

			GTS_Echsenschwert_Tick += 1;

			if (GTS_Echsenschwert_Tick >= 10)
			{
				GTS_Echsenschwert_Tick = 0;
			};
		}
		else if (GTS_Echsenschwert_Damage == 3600)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GTS_Echsenschwert_Tick < 9)
			{
				hero.attribute[ATR_HITPOINTS] -= 4;
			};

			GTS_Echsenschwert_Tick += 1;

			if (GTS_Echsenschwert_Tick >= 10)
			{
				GTS_Echsenschwert_Tick = 0;
			};
		};

		if (GTS_Echsenschwert_Time == 0)
		{
			GTS_Echsenschwert_Damage = 0;

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
				else if (Sumpfgasdrohnengift < 4)
				{
					Sumpfgasdrohnengift += 1;

					PrintScreen	("Du bist Immun gegenüber dem Gift von Sumpfgasdrohnen.", -1, -1, FONT_SCREEN, 2);
				};

				if (Tiergift < 4)
				{
					PrintScreen	("Deine Resistenzen gegenüber Tiergiften sind gestiegen.", -1, -1, FONT_SCREEN, 2);

					Tiergift += 1;

					if ((Gewaechsgift+Tiergift+Giftdampf)%3 == 0)
					{
						if (Gift < 3)
						{
							Gift += 1;

							PrintScreen	("Deine Widerstandskraft gegenüber Giften ist gestiegen.", -1, -1, FONT_SCREEN, 2);
						};
					};
				};
			};
		};
	};

	// Assassinenschwert-Vergiftung GTB

	if (GTB_Assassinenschwert_Time > 0)
	{
		GTB_Assassinenschwert_Time -= 1;

		if (GTB_Assassinenschwert_Damage == 5000)	// bei 100% sekündlich vollen Schaden
		{
			hero.attribute[ATR_HITPOINTS] -= 5;
		}
		else if (GTB_Assassinenschwert_Damage == 4500)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GTB_Assassinenschwert_Tick < 9)
			{
				hero.attribute[ATR_HITPOINTS] -= 5;
			};

			GTB_Assassinenschwert_Tick += 1;

			if (GTB_Assassinenschwert_Tick >= 10)
			{
				GTB_Assassinenschwert_Tick = 0;
			};
		}
		else if (GTB_Assassinenschwert_Damage == 4000)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			hero.attribute[ATR_HITPOINTS] -= 4;

			GTB_Assassinenschwert_Tick += 1;

			if (GTB_Assassinenschwert_Tick >= 10)
			{
				GTB_Assassinenschwert_Tick = 0;
			};
		}
		else if (GTB_Assassinenschwert_Damage == 3600)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GTB_Assassinenschwert_Tick < 9)
			{
				hero.attribute[ATR_HITPOINTS] -= 4;
			};

			GTB_Assassinenschwert_Tick += 1;

			if (GTB_Assassinenschwert_Tick >= 10)
			{
				GTB_Assassinenschwert_Tick = 0;
			};
		};

		if (GTB_Assassinenschwert_Time == 0)
		{
			GTB_Assassinenschwert_Damage = 0;

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
				else if (Blutfliegengift < 4)
				{
					Blutfliegengift += 1;

					PrintScreen	("Du bist Immun gegenüber dem Gift von Blutfliegen.", -1, -1, FONT_SCREEN, 2);
				};

				if (Tiergift < 4)
				{
					PrintScreen	("Deine Resistenzen gegenüber Tiergiften sind gestiegen.", -1, -1, FONT_SCREEN, 2);

					Tiergift += 1;

					if ((Gewaechsgift+Tiergift+Giftdampf)%3 == 0)
					{
						if (Gift < 3)
						{
							Gift += 1;

							PrintScreen	("Deine Widerstandskraft gegenüber Giften ist gestiegen.", -1, -1, FONT_SCREEN, 2);
						};
					};
				};
			};
		};
	};

	// Schamanenaxt-Vergiftung GTM

	if (GTM_Schamanenaxt_Time > 0)
	{
		GTM_Schamanenaxt_Time -= 1;

		if (GTM_Schamanenaxt_Damage == 5000)	// bei 100% sekündlich vollen Schaden
		{
			hero.attribute[ATR_HITPOINTS] -= 5;
		}
		else if (GTM_Schamanenaxt_Damage == 4500)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GTM_Schamanenaxt_Tick < 9)
			{
				hero.attribute[ATR_HITPOINTS] -= 5;
			};

			GTM_Schamanenaxt_Tick += 1;

			if (GTM_Schamanenaxt_Tick >= 10)
			{
				GTM_Schamanenaxt_Tick = 0;
			};
		}
		else if (GTM_Schamanenaxt_Damage == 4000)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			hero.attribute[ATR_HITPOINTS] -= 4;

			GTM_Schamanenaxt_Tick += 1;

			if (GTM_Schamanenaxt_Tick >= 10)
			{
				GTM_Schamanenaxt_Tick = 0;
			};
		}
		else if (GTM_Schamanenaxt_Damage == 3600)	// aufgeteilt, in 10 Sekunden dann den max. Schaden
		{
			if (GTM_Schamanenaxt_Tick < 9)
			{
				hero.attribute[ATR_HITPOINTS] -= 4;
			};

			GTM_Schamanenaxt_Tick += 1;

			if (GTM_Schamanenaxt_Tick >= 10)
			{
				GTM_Schamanenaxt_Tick = 0;
			};
		};

		if (GTM_Schamanenaxt_Time == 0)
		{
			GTM_Schamanenaxt_Damage = 0;

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
				else if (Minecrawlergift < 4)
				{
					Minecrawlergift += 1;

					PrintScreen	("Du bist Immun gegenüber dem Gift von Minecrawlern.", -1, -1, FONT_SCREEN, 2);
				};

				if (Tiergift < 4)
				{
					PrintScreen	("Deine Resistenzen gegenüber Tiergiften sind gestiegen.", -1, -1, FONT_SCREEN, 2);

					Tiergift += 1;

					if ((Gewaechsgift+Tiergift+Giftdampf)%3 == 0)
					{
						if (Gift < 3)
						{
							Gift += 1;

							PrintScreen	("Deine Widerstandskraft gegenüber Giften ist gestiegen.", -1, -1, FONT_SCREEN, 2);
						};
					};
				};
			};
		};
	};

	// Sumpfgasdrohnen-Vergiftung GGD

	if (GGD_Sumpfgasdrohne_Time > 0)
	{
		GGD_Sumpfgasdrohne_Time -= 1;

		hero.attribute[ATR_HITPOINTS] -= GGD_Sumpfgasdrohne_Damage;

		if (GGD_Sumpfgasdrohne_Time == 0)
		{
			GGD_Sumpfgasdrohne_Damage = 0;

			GGD_Sumpfgasdrohne += 1;

			Mod_CountGifte += 1;

			if (GGD_Sumpfgasdrohne == 3)
			|| (GGD_Sumpfgasdrohne == 10)
			|| (GGD_Sumpfgasdrohne == 20)
			|| (GGD_Sumpfgasdrohne == 40)
			{
				if (Giftdampf < 3)
				{
					PrintScreen	("Deine Resistenzen gegenüber giftigen Dämpfen sind gestiegen.", -1, -1, FONT_SCREEN, 2);

					Giftdampf += 1;
				}
				else if (Giftdampf < 4)
				{
					Giftdampf += 1;

					PrintScreen	("Du hast die höchste Widerstandkraft gegenüber giftigen Dämpfen erreicht.", -1, -1, FONT_SCREEN, 2);
				};

				if ((Gewaechsgift+Tiergift+Giftdampf)%3 == 0)
				{
					if (Gift < 3)
					{
						Gift += 1;

						PrintScreen	("Deine Widerstandskraft gegenüber Giften ist gestiegen.", -1, -1, FONT_SCREEN, 2);
					};
				};
			};
		};
	};

	// Sumpfgolem-Vergiftung GGD

	if (GGD_Sumpfgolem_Time > 0)
	{
		GGD_Sumpfgolem_Time -= 1;

		hero.attribute[ATR_HITPOINTS] -= GGD_Sumpfgolem_Damage;

		if (GGD_Sumpfgolem_Time == 0)
		{
			GGD_Sumpfgolem_Damage = 0;

			GGD_Sumpfgolem += 1;

			Mod_CountGifte += 1;

			if (GGD_Sumpfgolem == 3)
			|| (GGD_Sumpfgolem == 10)
			|| (GGD_Sumpfgolem == 20)
			|| (GGD_Sumpfgolem == 40)
			{
				if (Giftdampf < 3)
				{
					PrintScreen	("Deine Resistenzen gegenüber giftigen Dämpfen sind gestiegen.", -1, -1, FONT_SCREEN, 2);

					Giftdampf += 1;
				}
				else if (Giftdampf < 4)
				{
					Giftdampf += 1;

					PrintScreen	("Du hast die höchste Widerstandkraft gegenüber giftigen Dämpfen erreicht.", -1, -1, FONT_SCREEN, 2);
				};

				if ((Gewaechsgift+Tiergift+Giftdampf)%3 == 0)
				{
					if (Gift < 3)
					{
						Gift += 1;

						PrintScreen	("Deine Widerstandskraft gegenüber Giften ist gestiegen.", -1, -1, FONT_SCREEN, 2);
					};
				};
			};
		};
	};

	// Sumpfdrachen-Vergiftung GGD

	if (GGD_Sumpfdrache_Time > 0)
	{
		GGD_Sumpfdrache_Time -= 1;

		hero.attribute[ATR_HITPOINTS] -= GGD_Sumpfdrache_Damage;

		if (GGD_Sumpfdrache_Time == 0)
		{
			GGD_Sumpfdrache_Damage = 0;

			GGD_Sumpfdrache += 1;

			Mod_CountGifte += 1;

			if (GGD_Sumpfdrache == 3)
			|| (GGD_Sumpfdrache == 10)
			|| (GGD_Sumpfdrache == 20)
			|| (GGD_Sumpfdrache == 40)
			{
				if (Giftdampf < 3)
				{
					PrintScreen	("Deine Resistenzen gegenüber giftigen Dämpfen sind gestiegen.", -1, -1, FONT_SCREEN, 2);

					Giftdampf += 1;
				}
				else if (Giftdampf < 4)
				{
					Giftdampf += 1;

					PrintScreen	("Du hast die höchste Widerstandkraft gegenüber giftigen Dämpfen erreicht.", -1, -1, FONT_SCREEN, 2);
				};

				if ((Gewaechsgift+Tiergift+Giftdampf)%3 == 0)
				{
					if (Gift < 3)
					{
						Gift += 1;

						PrintScreen	("Deine Widerstandskraft gegenüber Giften ist gestiegen.", -1, -1, FONT_SCREEN, 2);
					};
				};
			};
		};
	};

	// Giftkrater-Vergiftung GGD

	if (GGD_Giftkrater_Time > 0)
	{
		GGD_Giftkrater_Time -= 1;

		hero.attribute[ATR_HITPOINTS] -= GGD_Giftkrater_Damage;

		if (GGD_Giftkrater_Time == 0)
		{
			GGD_Giftkrater_Damage = 0;

			GGD_Giftkrater += 1;

			Mod_CountGifte += 1;

			if (GGD_Giftkrater == 3)
			|| (GGD_Giftkrater == 10)
			|| (GGD_Giftkrater == 20)
			|| (GGD_Giftkrater == 40)
			{
				if (Giftdampf < 3)
				{
					PrintScreen	("Deine Resistenzen gegenüber giftigen Dämpfen sind gestiegen.", -1, -1, FONT_SCREEN, 2);

					Giftdampf += 1;
				}
				else if (Giftdampf < 4)
				{
					Giftdampf += 1;

					PrintScreen	("Du hast die höchste Widerstandkraft gegenüber giftigen Dämpfen erreicht.", -1, -1, FONT_SCREEN, 2);
				};

				if ((Gewaechsgift+Tiergift+Giftdampf)%3 == 0)
				{
					if (Gift < 3)
					{
						Gift += 1;

						PrintScreen	("Deine Widerstandskraft gegenüber Giften ist gestiegen.", -1, -1, FONT_SCREEN, 2);
					};
				};
			};
		};
	};



	// Krankheiten

	// Biss der Fäulnis

	if (BissDerFaeulnis_Time > 0)
	{
		BissDerFaeulnis_Time += 1;

		if (BissDerFaeulnis_Stufe == 0)
		&& (BissDerFaeulnis_Time > 30)
		{
			BissDerFaeulnis_Stufe = 1;

			hero.attribute[ATR_HITPOINTS] -= BissDerFaeulnis_Stufe01_HP;
			hero.attribute[ATR_HITPOINTS_MAX] -= BissDerFaeulnis_Stufe01_HP;

			hero.attribute[ATR_MANA] -= BissDerFaeulnis_Stufe01_MANA;
			hero.attribute[ATR_MANA_MAX] -= BissDerFaeulnis_Stufe01_MANA;

			hero.attribute[ATR_STRENGTH] -= BissDerFaeulnis_Stufe01_STR;
			hero.attribute[ATR_DEXTERITY] -= BissDerFaeulnis_Stufe01_DEX;

			Print	("Du spürst, wie der Biss der Fäulnis dein Blut vergiftet!");

			BissDerFaeulnis_Time -= 30;
		};

		if (BissDerFaeulnis_Stufe == 1)
		&& (BissDerFaeulnis_Time > BissDerFaeulnis_Stufe01)
		{
			BissDerFaeulnis_Stufe = 2;

			// Alte Sachen wieder drauf addieren

			hero.attribute[ATR_HITPOINTS_MAX] += BissDerFaeulnis_Stufe01_HP;
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
			hero.attribute[ATR_MANA_MAX] += BissDerFaeulnis_Stufe01_MANA;
			hero.attribute[ATR_MANA] += BissDerFaeulnis_Stufe01_MANA;
			hero.attribute[ATR_STRENGTH] += BissDerFaeulnis_Stufe01_STR;
			hero.attribute[ATR_DEXTERITY] += BissDerFaeulnis_Stufe01_DEX;

			// Neue Sachen abziehen

			hero.attribute[ATR_HITPOINTS] -= hero.attribute[ATR_HITPOINTS]/10;
			hero.attribute[ATR_HITPOINTS_MAX] -= BissDerFaeulnis_Stufe02_HP;

			hero.attribute[ATR_MANA] -= BissDerFaeulnis_Stufe02_MANA;
			hero.attribute[ATR_MANA_MAX] -= BissDerFaeulnis_Stufe02_MANA;

			hero.attribute[ATR_STRENGTH] -= BissDerFaeulnis_Stufe02_STR;
			hero.attribute[ATR_DEXTERITY] -= BissDerFaeulnis_Stufe02_DEX;

			BissDerFaeulnis_Time -= BissDerFaeulnis_Stufe01;
		};

		if (BissDerFaeulnis_Stufe == 2)
		&& (BissDerFaeulnis_Time > BissDerFaeulnis_Stufe02)
		{
			BissDerFaeulnis_Stufe = 3;

			// Alte Sachen wieder drauf addieren

			hero.attribute[ATR_HITPOINTS_MAX] += BissDerFaeulnis_Stufe02_HP;
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
			hero.attribute[ATR_MANA_MAX] += BissDerFaeulnis_Stufe02_MANA;
			hero.attribute[ATR_MANA] += BissDerFaeulnis_Stufe02_MANA;
			hero.attribute[ATR_STRENGTH] += BissDerFaeulnis_Stufe02_STR;
			hero.attribute[ATR_DEXTERITY] += BissDerFaeulnis_Stufe02_DEX;

			// Neue Sachen abziehen

			hero.attribute[ATR_HITPOINTS] -= hero.attribute[ATR_HITPOINTS]/5;
			hero.attribute[ATR_HITPOINTS_MAX] -= BissDerFaeulnis_Stufe03_HP;

			hero.attribute[ATR_MANA] -= BissDerFaeulnis_Stufe03_MANA;
			hero.attribute[ATR_MANA_MAX] -= BissDerFaeulnis_Stufe03_MANA;

			hero.attribute[ATR_STRENGTH] -= BissDerFaeulnis_Stufe03_STR;
			hero.attribute[ATR_DEXTERITY] -= BissDerFaeulnis_Stufe03_DEX;

			BissDerFaeulnis_Time -= BissDerFaeulnis_Stufe02;
		};

		if (BissDerFaeulnis_Stufe == 3)
		&& (BissDerFaeulnis_Time > BissDerFaeulnis_Stufe03)
		{
			BissDerFaeulnis_Stufe = 0;

			// Alte Sachen wieder drauf addieren

			hero.attribute[ATR_HITPOINTS_MAX] += BissDerFaeulnis_Stufe03_HP;
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
			hero.attribute[ATR_MANA_MAX] += BissDerFaeulnis_Stufe03_MANA;
			hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];
			hero.attribute[ATR_STRENGTH] += BissDerFaeulnis_Stufe03_STR;
			hero.attribute[ATR_DEXTERITY] += BissDerFaeulnis_Stufe03_DEX;

			// Auswertung, denn jetzt ist die Krankheit vorbei

			BissDerFaeulnis_Time = 0;

			BissDerFaeulnis += 1;

			Mod_CountGifte += 1;

			if (BissDerFaeulnis == 3)
			|| (BissDerFaeulnis == 10)
			|| (BissDerFaeulnis == 20)
			|| (BissDerFaeulnis == 40)
			{
				KBDF += 1;

				if (KBDF == 4)
				{
					PrintScreen	("Du hast die höchste Widerstandkraft gegenüber Biss der Fäulnis erreicht.", -1, -1, FONT_SCREEN, 2);
				};

				if (Krankheit < 4)
				{
					Krankheit += 1;

					PrintScreen	("Deine Resistenzen gegenüber Erkrankungen sind gestiegen.", -1, -1, FONT_SCREEN, 2);
				};
			};
		};
	};

	// Hauch der Pestilenz

	if (HauchDerPestilenz_Time > 0)
	{
		HauchDerPestilenz_Time += 1;

		if (HauchDerPestilenz_Stufe == 0)
		&& (HauchDerPestilenz_Time > 30)
		{
			HauchDerPestilenz_Stufe = 1;

			hero.attribute[ATR_HITPOINTS] -= HauchDerPestilenz_Stufe01_HP;
			hero.attribute[ATR_HITPOINTS_MAX] -= HauchDerPestilenz_Stufe01_HP;

			hero.attribute[ATR_MANA] -= HauchDerPestilenz_Stufe01_MANA;
			hero.attribute[ATR_MANA_MAX] -= HauchDerPestilenz_Stufe01_MANA;

			hero.attribute[ATR_STRENGTH] -= HauchDerPestilenz_Stufe01_STR;
			hero.attribute[ATR_DEXTERITY] -= HauchDerPestilenz_Stufe01_DEX;

			Print	("Der Hauch der Pestilenz durchdringt deine Adern!");

			HauchDerPestilenz_Time -= 30;
		};

		if (HauchDerPestilenz_Stufe == 1)
		&& (HauchDerPestilenz_Time > HauchDerPestilenz_Stufe01)
		{
			HauchDerPestilenz_Stufe = 2;

			// Alte Sachen wieder drauf addieren

			hero.attribute[ATR_HITPOINTS_MAX] += HauchDerPestilenz_Stufe01_HP;
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
			hero.attribute[ATR_MANA_MAX] += HauchDerPestilenz_Stufe01_MANA;
			hero.attribute[ATR_MANA] += HauchDerPestilenz_Stufe01_MANA;
			hero.attribute[ATR_STRENGTH] += HauchDerPestilenz_Stufe01_STR;
			hero.attribute[ATR_DEXTERITY] += HauchDerPestilenz_Stufe01_DEX;

			// Neue Sachen abziehen

			hero.attribute[ATR_HITPOINTS] -= hero.attribute[ATR_HITPOINTS]/5;
			hero.attribute[ATR_HITPOINTS_MAX] -= HauchDerPestilenz_Stufe02_HP;

			hero.attribute[ATR_MANA] -= HauchDerPestilenz_Stufe02_MANA;
			hero.attribute[ATR_MANA_MAX] -= HauchDerPestilenz_Stufe02_MANA;

			hero.attribute[ATR_STRENGTH] -= HauchDerPestilenz_Stufe02_STR;
			hero.attribute[ATR_DEXTERITY] -= HauchDerPestilenz_Stufe02_DEX;

			HauchDerPestilenz_Time -= HauchDerPestilenz_Stufe01;
		};

		if (HauchDerPestilenz_Stufe == 2)
		&& (HauchDerPestilenz_Time > HauchDerPestilenz_Stufe02)
		{
			HauchDerPestilenz_Stufe = 3;

			// Alte Sachen wieder drauf addieren

			hero.attribute[ATR_HITPOINTS_MAX] += HauchDerPestilenz_Stufe02_HP;
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
			hero.attribute[ATR_MANA_MAX] += HauchDerPestilenz_Stufe02_MANA;
			hero.attribute[ATR_MANA] += HauchDerPestilenz_Stufe02_MANA;
			hero.attribute[ATR_STRENGTH] += HauchDerPestilenz_Stufe02_STR;
			hero.attribute[ATR_DEXTERITY] += HauchDerPestilenz_Stufe02_DEX;

			// Neue Sachen abziehen

			hero.attribute[ATR_HITPOINTS] -= (hero.attribute[ATR_HITPOINTS]*2)/5;
			hero.attribute[ATR_HITPOINTS_MAX] -= HauchDerPestilenz_Stufe03_HP;

			hero.attribute[ATR_MANA] -= HauchDerPestilenz_Stufe03_MANA;
			hero.attribute[ATR_MANA_MAX] -= HauchDerPestilenz_Stufe03_MANA;

			hero.attribute[ATR_STRENGTH] -= HauchDerPestilenz_Stufe03_STR;
			hero.attribute[ATR_DEXTERITY] -= HauchDerPestilenz_Stufe03_DEX;

			HauchDerPestilenz_Time -= HauchDerPestilenz_Stufe02;
		};

		if (HauchDerPestilenz_Stufe == 3)
		&& (HauchDerPestilenz_Time > HauchDerPestilenz_Stufe03)
		{
			HauchDerPestilenz_Stufe = 0;

			// Alte Sachen wieder drauf addieren

			hero.attribute[ATR_HITPOINTS_MAX] += HauchDerPestilenz_Stufe03_HP;
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
			hero.attribute[ATR_MANA_MAX] += HauchDerPestilenz_Stufe03_MANA;
			hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];
			hero.attribute[ATR_STRENGTH] += HauchDerPestilenz_Stufe03_STR;
			hero.attribute[ATR_DEXTERITY] += HauchDerPestilenz_Stufe03_DEX;

			// Auswertung, denn jetzt ist die Krankheit vorbei

			HauchDerPestilenz_Time = 0;

			HauchDerPestilenz += 1;

			Mod_CountGifte += 1;

			if (HauchDerPestilenz == 3)
			|| (HauchDerPestilenz == 10)
			|| (HauchDerPestilenz == 20)
			|| (HauchDerPestilenz == 40)
			{
				KHDP += 1;

				if (KHDP == 4)
				{
					PrintScreen	("Du hast die höchste Widerstandkraft gegenüber Hauch der Pestilenz erreicht.", -1, -1, FONT_SCREEN, 2);
				};

				if (Krankheit < 4)
				{
					Krankheit += 1;

					PrintScreen	("Deine Resistenzen gegenüber Erkrankungen sind gestiegen.", -1, -1, FONT_SCREEN, 2);
				};
			};
		};
	};

	hero.aivar[AIV_Damage] = hero.attribute[ATR_HITPOINTS];
};