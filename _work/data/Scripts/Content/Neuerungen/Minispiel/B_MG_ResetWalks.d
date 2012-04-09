FUNC VOID B_MG_ResetWalks(var int owner)
{
	var int i; i = 0;
	var int ptr; ptr = MEM_StackPos.position;

	if (i < 5)
	{
		if (owner == 0)
		{
			if (MEM_ReadStatArr(MG_EigeneFiguren, i) == MG_FIGUR_TROLL)
			{
				Hero_Troll.walked = FALSE;
			}
			else if (MEM_ReadStatArr(MG_EigeneFiguren, i) == MG_FIGUR_Minecrawlerqueen)
			{
				Hero_Minecrawlerqueen.walked = FALSE;
			}
			else if (MEM_ReadStatArr(MG_EigeneFiguren, i) == MG_FIGUR_Schaf)
			{
				Hero_Schaf.walked = FALSE;
			}
			else if (MEM_ReadStatArr(MG_EigeneFiguren, i) == MG_FIGUR_Hase)
			{
				Hero_Hase.walked = FALSE;
			}
			else if (MEM_ReadStatArr(MG_EigeneFiguren, i) == MG_FIGUR_Balrog)
			{
				Hero_Balrog.walked = FALSE;
			}
			else if (MEM_ReadStatArr(MG_EigeneFiguren, i) == MG_FIGUR_Meatbug)
			{
				Hero_Meatbug.walked = FALSE;
			}
			else if (MEM_ReadStatArr(MG_EigeneFiguren, i) == MG_FIGUR_Snapper)
			{
				Hero_Snapper.walked = FALSE;
			}
			else if (MEM_ReadStatArr(MG_EigeneFiguren, i) == MG_FIGUR_Stoneguardian)
			{
				Hero_Stoneguardian.walked = FALSE;
			}
			else if (MEM_ReadStatArr(MG_EigeneFiguren, i) == MG_FIGUR_Goblin)
			{
				Hero_Goblin.walked = FALSE;
			}
			else if (MEM_ReadStatArr(MG_EigeneFiguren, i) == MG_FIGUR_Bloodfly)
			{
				Hero_Bloodfly.walked = FALSE;
			};
		}
		else
		{
			if (MEM_ReadStatArr(MG_GegnerFiguren, i) == MG_FIGUR_TROLL)
			{
				Opp_Troll.walked = FALSE;
			}
			else if (MEM_ReadStatArr(MG_GegnerFiguren, i) == MG_FIGUR_Minecrawlerqueen)
			{
				Opp_Minecrawlerqueen.walked = FALSE;
			}
			else if (MEM_ReadStatArr(MG_GegnerFiguren, i) == MG_FIGUR_Schaf)
			{
				Opp_Schaf.walked = FALSE;
			}
			else if (MEM_ReadStatArr(MG_GegnerFiguren, i) == MG_FIGUR_Hase)
			{
				Opp_Hase.walked = FALSE;
			}
			else if (MEM_ReadStatArr(MG_GegnerFiguren, i) == MG_FIGUR_Balrog)
			{
				Opp_Balrog.walked = FALSE;
			}
			else if (MEM_ReadStatArr(MG_GegnerFiguren, i) == MG_FIGUR_Meatbug)
			{
				Opp_Meatbug.walked = FALSE;
			}
			else if (MEM_ReadStatArr(MG_GegnerFiguren, i) == MG_FIGUR_Snapper)
			{
				Opp_Snapper.walked = FALSE;
			}
			else if (MEM_ReadStatArr(MG_GegnerFiguren, i) == MG_FIGUR_Stoneguardian)
			{
				Opp_Stoneguardian.walked = FALSE;
			}
			else if (MEM_ReadStatArr(MG_GegnerFiguren, i) == MG_FIGUR_Goblin)
			{
				Opp_Goblin.walked = FALSE;
			}
			else if (MEM_ReadStatArr(MG_GegnerFiguren, i) == MG_FIGUR_Bloodfly)
			{
				Opp_Bloodfly.walked = FALSE;
			};
		};
	
		i += 1;

		MEM_StackPos.position = ptr;
	};
};

FUNC INT B_MG_StillWalks()
{
	var int i; i = 0;
	var int ptr; ptr = MEM_StackPos.position;

	if (i < 5)
	{
		if (MEM_ReadStatArr(MG_EigeneFiguren, i) == MG_FIGUR_TROLL)
		{
			if (Hero_Troll.walked == FALSE)
			{
				return TRUE;
			};
		}
		else if (MEM_ReadStatArr(MG_EigeneFiguren, i) == MG_FIGUR_Minecrawlerqueen)
		{
			if (Hero_Minecrawlerqueen.walked == FALSE)
			{
				return TRUE;
			};
		}
		else if (MEM_ReadStatArr(MG_EigeneFiguren, i) == MG_FIGUR_Schaf)
		{
			if (Hero_Schaf.walked == FALSE)
			{
				return TRUE;
			};
		}
		else if (MEM_ReadStatArr(MG_EigeneFiguren, i) == MG_FIGUR_Hase)
		{
			if (Hero_Hase.walked == FALSE)
			{
				return TRUE;
			};
		}
		else if (MEM_ReadStatArr(MG_EigeneFiguren, i) == MG_FIGUR_Balrog)
		{
			if (Hero_Balrog.walked == FALSE)
			{
				return TRUE;
			};
		}
		else if (MEM_ReadStatArr(MG_EigeneFiguren, i) == MG_FIGUR_Meatbug)
		{
			if (Hero_Meatbug.walked == FALSE)
			{
				return TRUE;
			};
		}
		else if (MEM_ReadStatArr(MG_EigeneFiguren, i) == MG_FIGUR_Snapper)
		{
			if (Hero_Snapper.walked == FALSE)
			{
				return TRUE;
			};
		}
		else if (MEM_ReadStatArr(MG_EigeneFiguren, i) == MG_FIGUR_Stoneguardian)
		{
			if (Hero_Stoneguardian.walked == FALSE)
			{
				return TRUE;
			};
		}
		else if (MEM_ReadStatArr(MG_EigeneFiguren, i) == MG_FIGUR_Goblin)
		{
			if (Hero_Goblin.walked == FALSE)
			{
				return TRUE;
			};
		}
		else if (MEM_ReadStatArr(MG_EigeneFiguren, i) == MG_FIGUR_Bloodfly)
		{
			if (Hero_Bloodfly.walked == FALSE)
			{
				return TRUE;
			};
		};

		i += 1;

		MEM_StackPos.position = ptr;
	};

	return FALSE;
};