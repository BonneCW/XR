func void B_Say_Smalltalk()
{

	B_Vergiftet (self);

	var int random;	random = Hlp_Random (160);

	var int Randi;
	
	var int Choice;
	Choice = Hlp_Random(1);

	if 		(random <   5)
	{
		B_Say		( self, self, "$SMALLTALK01");
	} 
	else if (random <  10)
	{
		B_Say		( self, self, "$SMALLTALK02");
	}
	else if (random <  15)
	{
		B_Say		( self, self, "$SMALLTALK03");
	}
	else if (random < 20)
	{
		B_Say		( self, self, "$SMALLTALK04");
	}
	else if (random < 25)
	{
		B_Say		( self, self, "$SMALLTALK05");
	}
	else if (random < 30)
	{
		B_Say		( self, self, "$SMALLTALK06");
	}
	else if (random < 35)
	{
		B_Say		( self, self, "$SMALLTALK07");
	}
	else if (random < 40)
	{
		B_Say		( self, self, "$SMALLTALK08");
	}
	else if (random < 45)
	{
		B_Say		( self, self, "$SMALLTALK09");
	}
	else if (random < 50)
	{
		B_Say		( self, self, "$SMALLTALK10");
	}
	else if (random < 55)
	{
		B_Say		( self, self, "$SMALLTALK11");
	}
	else if (random < 60)
	{
		B_Say		( self, self, "$SMALLTALK12");
	}
	else if (random < 65)
	{
		B_Say		( self, self, "$SMALLTALK13");
	}
	else if (random < 70)
	{
		B_Say		( self, self, "$SMALLTALK14");
	}
	else if (random < 75)
	{
		B_Say		( self, self, "$SMALLTALK15");
	}
	else if (random < 80)
	{
		B_Say		( self, self, "$SMALLTALK16");
	}
	else if (random < 85)
	{
		B_Say		( self, self, "$SMALLTALK17");
	}
	else if (random < 90)
	{
		B_Say		( self, self, "$SMALLTALK18");
	}
	else if (random < 95)
	{
		B_Say		( self, self, "$SMALLTALK19");
	}
	else if (random < 100)
	{
		B_Say		( self, self, "$SMALLTALK20");
	}
	else if (random < 105)
	{
		B_Say		( self, self, "$SMALLTALK21");
	}
	else if (random < 110)
	{
		if (Npc_GetTrueGuild (self) == GIL_VLK)
		|| (Npc_GetTrueGuild (self) == GIL_PAL)	
		{
			if (Choice == 0)
			{
				B_Say		( self, self, "$SMALLTALK28");
			}
			else
			{
				B_Say		( self, self, "$SMALLTALK22");
			};
		}
		else if (Npc_GetTrueGuild (self) == GIL_MIL)
		|| (Npc_GetTrueGuild (self) == GIL_OUT)
		|| (Npc_GetTrueGuild (self) == GIL_PIR)
		{
			if (Choice == 0)
			{
				B_Say		( self, self, "$SMALLTALK25");
			}
			else
			{
				B_Say		( self, self, "$SMALLTALK22");
			};
		}
		else
		{
			B_Say		( self, self, "$SMALLTALK22");
		};	
			
	}
	else if (random < 115)
	{
		if (Npc_GetTrueGuild (self) == GIL_VLK)
		|| (Npc_GetTrueGuild (self) == GIL_PAL)	
		{
			if (Choice == 0)
			{
				B_Say		( self, self, "$SMALLTALK29");
			}
			else
			{
				B_Say		( self, self, "$SMALLTALK23");
			};
		}
		else if (Npc_GetTrueGuild (self) == GIL_MIL)
		|| 		(Npc_GetTrueGuild (self) == GIL_OUT)
		|| 		(Npc_GetTrueGuild (self) == GIL_PIR)
		{
			if (Choice == 0)
			{
				B_Say		( self, self, "$SMALLTALK26");
			}
			else
			{
				B_Say		( self, self, "$SMALLTALK23");
			};
		}
		else
		{
			B_Say		( self, self, "$SMALLTALK23");
		};	
			
	}
	else if (random < 120)
	{		
		if (Npc_GetTrueGuild (self) == GIL_VLK)
		|| (Npc_GetTrueGuild (self) == GIL_PAL)	
		{
			if (Choice == 0)
			{
				B_Say		( self, self, "$SMALLTALK30");
			}
			else
			{
				B_Say		( self, self, "$SMALLTALK24");
			};
		}
		else if (Npc_GetTrueGuild (self) == GIL_MIL)
		|| 		(Npc_GetTrueGuild (self) == GIL_OUT)
		|| 		(Npc_GetTrueGuild (self) == GIL_PIR)
		{
			if (Choice == 0)
			{
				B_Say		( self, self, "$SMALLTALK27");
			}
			else
			{
				B_Say		( self, self, "$SMALLTALK24");
			};
		}
		else
		{
			B_Say		( self, self, "$SMALLTALK24");
		};	
			
	}
	else if (random < 125)
	{		
		if (Npc_GetTrueGuild (self) == GIL_OUT)
		&& (CurrentLevel == RELENDEL_ZEN)	
		{
			Randi = Hlp_Random(3);

			if (Mod_AnnaQuest == 9)
			{
				if (Randi == 0)
				{
					B_Say		(self, self, "$SMALLTALKKHORATAANNAQUEST01");
				}
				else if (Randi == 1)
				{
					B_Say		(self, self, "$SMALLTALKKHORATAANNAQUEST02");
				}
				else
				{
					B_Say		(self, self, "$SMALLTALKKHORATAANNAQUEST03");
				};
			}
			else if (Mod_AnnaQuest == 10)
			{
				if (Randi == 0)
				{
					B_Say		(self, self, "$SMALLTALKKHORATAANNAQUEST04");
				}
				else if (Randi == 1)
				{
					B_Say		(self, self, "$SMALLTALKKHORATAANNAQUEST05");
				}
				else
				{
					B_Say		(self, self, "$SMALLTALKKHORATAANNAQUEST06");
				};
			};
		}
		else if (Npc_GetTrueGuild(self) == GIL_PAL)
		&& (CurrentLevel == NEWWORLD_ZEN)
		{
			if (Npc_KnowsInfo(hero, Info_VLK_16_Rangar))
			|| (Npc_KnowsInfo(hero, Info_VLK_8_Rangar))
			|| (Npc_KnowsInfo(hero, Info_VLK_1_Rangar))
			{
				B_Say		(self, self, "$SMALLTALKRANGAR01");
			}
			else if (Npc_KnowsInfo(hero, Info_VLK_17_Rangar))
			|| (Npc_KnowsInfo(hero, Info_VLK_6_Rangar))
			{
				B_Say		(self, self, "$SMALLTALKRANGAR02");
			};
		}
		else if (Npc_GetTrueGuild(self) == GIL_KDF)
		&& (CurrentLevel == NEWWORLD_ZEN)
		{
			if (GardeAnfangCutscene == 2)
			{
				Randi = Hlp_Random(2);

				if (Randi == 0)
				{
					B_Say		(self, self, "$SMALLTALKDMRBELAGERUNGABDI01");
				}
				else
				{
					B_Say		(self, self, "$SMALLTALKDMRBELAGERUNGABDI02");
				};
			};
		};	
			
	}
	else if (random < 130)
	{		
		if (Npc_GetTrueGuild (self) == GIL_OUT)
		&& (CurrentLevel == RELENDEL_ZEN)	
		{
			Randi = Hlp_Random(3);

			if (Mod_REL_DichterBeiMargarethe == 1)
			{
				if (Randi == 0)
				{
					B_Say		(self, self, "$SMALLTALKKHORATADICHTER01");
				}
				else if (Randi == 1)
				{
					B_Say		(self, self, "$SMALLTALKKHORATADICHTER02");
				}
				else
				{
					B_Say		(self, self, "$SMALLTALKKHORATADICHTER03");
				};
			}
			else if (Mod_REL_DichterInKhorinis == 1)
			{
				if (Randi == 0)
				{
					B_Say		(self, self, "$SMALLTALKKHORATADICHTER04");
				}
				else
				{
					B_Say		(self, self, "$SMALLTALKKHORATADICHTER05");
				};
			};
		}
		else if (Npc_GetTrueGuild(self) == GIL_PAL)
		&& (CurrentLevel == NEWWORLD_ZEN)
		{
			if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Flugblätter))
			{
				Randi = Hlp_Random(2);

				if (Randi == 0)
				{
					B_Say		(self, self, "$SMALLTALKMATTEO01");
				}
				else
				{
					B_Say		(self, self, "$SMALLTALKMATTEO02");
				};
			}
			else if (Npc_KnowsInfo(hero, Info_Mod_Matteo_LehrlingQuest3))
			{
				Randi = Hlp_Random(2);

				if (Randi == 0)
				{
					B_Say		(self, self, "$SMALLTALKMATTEO03");
				}
				else
				{
					B_Say		(self, self, "$SMALLTALKMATTEO04");
				};
			};
		};	
			
	}
	else if (random < 135)
	{	
		if (Npc_GetTrueGuild (self) == GIL_OUT)
		&& (CurrentLevel == RELENDEL_ZEN)	
		{
			Randi = Hlp_Random(3);

			if (Mod_EndresIndizien < 3)
			{
				if (Randi == 0)
				{
					B_Say		(self, self, "$SMALLTALKKHORATAENDRES01");
				}
				else if (Randi == 1)
				{
					B_Say		(self, self, "$SMALLTALKKHORATAENDRES02");
				}
				else
				{
					B_Say		(self, self, "$SMALLTALKKHORATAENDRES03");
				};
			}
			else
			{
				if (Randi == 0)
				{
					B_Say		(self, self, "$SMALLTALKKHORATAENDRES04");
				}
				else if (Randi == 1)
				{
					B_Say		(self, self, "$SMALLTALKKHORATAENDRES05");
				}
				else
				{
					if (Mod_EndresIndizien == 4)
					{
						B_Say		(self, self, "$SMALLTALKKHORATAENDRES06");
					}
					else
					{
						B_Say		(self, self, "$SMALLTALKKHORATAENDRES07");
					};
				};
			};
		}
		else if (Npc_GetTrueGuild(self) == GIL_PAL)
		&& (CurrentLevel == NEWWORLD_ZEN)
		{
			if (Npc_KnowsInfo(hero, Info_Mod_Keroloth_Mario2))
			{
				Randi = Hlp_Random(2);

				if (Randi == 0)
				{
					B_Say	(self, self, "$SMALLTALKKHORINISMARIO01");
				}
				else
				{
					B_Say	(self, self, "$SMALLTALKKHORINISMARIO02");
				};
			}
			else if (Npc_KnowsInfo(hero, Info_Mod_Mario_Hilfe9))
			{
				Randi = Hlp_Random(2);

				if (Randi == 0)
				{
					B_Say	(self, self, "$SMALLTALKKHORINISMARIO03");
				}
				else
				{
					B_Say	(self, self, "$SMALLTALKKHORINISMARIO04");
				};
			};
		};		
			
	}
	else if (random <= 140)
	{	
		if (Npc_GetTrueGuild (self) == GIL_OUT)
		&& (CurrentLevel == RELENDEL_ZEN)	
		{
			if (Kapitel >= 3)
			&& (Mod_REL_Stadthalter == 0)
			{
				Randi = Hlp_Random(11);

				if (Randi == 0)
				{
					B_Say		(self, self, "$SMALLTALKKHORATAUNRUHEN01");
				}
				else if (Randi == 1)
				{
					B_Say		(self, self, "$SMALLTALKKHORATAUNRUHEN02");
				}
				else if (Randi == 2)
				{
					B_Say		(self, self, "$SMALLTALKKHORATAUNRUHEN03");
				}
				else if (Randi == 3)
				{
					B_Say		(self, self, "$SMALLTALKKHORATAUNRUHEN04");
				}
				else if (Randi == 4)
				{
					B_Say		(self, self, "$SMALLTALKKHORATAUNRUHEN05");
				}
				else if (Randi == 5)
				{
					B_Say		(self, self, "$SMALLTALKKHORATAUNRUHEN06");
				}
				else if (Randi == 6)
				{
					B_Say		(self, self, "$SMALLTALKKHORATAUNRUHEN07");
				}
				else if (Randi == 7)
				{
					B_Say		(self, self, "$SMALLTALKKHORATAUNRUHEN08");
				}
				else if (Randi == 8)
				{
					B_Say		(self, self, "$SMALLTALKKHORATAUNRUHEN09");
				}
				else if (Randi == 9)
				{
					B_Say		(self, self, "$SMALLTALKKHORATAUNRUHEN10");
				}
				else
				{
					B_Say		(self, self, "$SMALLTALKKHORATAUNRUHEN11");
				};
			}
			else if (Kapitel >= 3)
			&& (Mod_REL_Stadthalter == 1)
			{
				Randi = Hlp_Random(4);

				if (Randi == 0)
				{
					B_Say		(self, self, "$SMALLTALKKHORATAUNRUHENTHEODORUS01");
				}
				else if (Randi == 1)
				{
					B_Say		(self, self, "$SMALLTALKKHORATAUNRUHENTHEODORUS02");
				}
				else if (Randi == 2)
				{
					B_Say		(self, self, "$SMALLTALKKHORATAUNRUHENTHEODORUS03");
				}
				else
				{
					B_Say		(self, self, "$SMALLTALKKHORATAUNRUHENTHEODORUS04");
				};
			}
			else if (Kapitel >= 3)
			&& (Mod_REL_Stadthalter == 2)
			{
				Randi = Hlp_Random(4);

				if (Randi == 0)
				{
					B_Say		(self, self, "$SMALLTALKKHORATAUNRUHENWENDEL01");
				}
				else if (Randi == 1)
				{
					B_Say		(self, self, "$SMALLTALKKHORATAUNRUHENWENDEL02");
				}
				else if (Randi == 2)
				{
					B_Say		(self, self, "$SMALLTALKKHORATAUNRUHENWENDEL03");
				}
				else
				{
					B_Say		(self, self, "$SMALLTALKKHORATAUNRUHENWENDEL04");
				};
			}
			else if (Kapitel >= 3)
			&& (Mod_REL_Stadthalter == 3)
			{
				Randi = Hlp_Random(4);

				if (Randi == 0)
				{
					B_Say		(self, self, "$SMALLTALKKHORATAUNRUHENLUKAS01");
				}
				else if (Randi == 1)
				{
					B_Say		(self, self, "$SMALLTALKKHORATAUNRUHENLUKAS02");
				}
				else if (Randi == 2)
				{
					B_Say		(self, self, "$SMALLTALKKHORATAUNRUHENLUKAS03");
				}
				else
				{
					B_Say		(self, self, "$SMALLTALKKHORATAUNRUHENLUKAS04");
				};
			};
		}
		else if (CurrentLevel == NEWWORLD_ZEN)
		&& (Npc_GetTrueGuild(self) == GIL_PAL)
		{
			if (Npc_KnowsInfo(hero, Info_Mod_Fellan_HabHammer))
			{
				Randi = Hlp_Random(2);

				if (Randi == 0)
				{
					B_Say		(self, self, "$SMALLTALKFELLAN01");
				}
				else if (Randi == 1)
				{
					B_Say		(self, self, "$SMALLTALKFELLAN02");
				};
			};
		};		
			
	}
	else if (random <= 145)
	{	
		if (Npc_GetTrueGuild (self) == GIL_OUT)
		&& (CurrentLevel == RELENDEL_ZEN)	
		{
			Randi = Hlp_Random(3);

			if (Mod_REL_Frauenkleider01 == 1)
			&& (Mod_REL_Frauenkleider02 == 1)
			&& (Mod_REL_Frauenkleider03 == 1)
			{
				if (Randi == 0)
				{
					B_Say		(self, self, "$SMALLTALKKHORATAFRAUENKLEIDER01");
				}
				else if (Randi == 1)
				{
					B_Say		(self, self, "$SMALLTALKKHORATAFRAUENKLEIDER02");
				}
				else
				{
					B_Say		(self, self, "$SMALLTALKKHORATAFRAUENKLEIDER03");
				};
			};
		}
		else if (CurrentLevel == NEWWORLD_ZEN)
		&& (Npc_GetTrueGuild(self) == GIL_PAL)
		{
			if (Npc_KnowsInfo(hero, Info_Mod_Mika_Pflanzensammler))
			{
				if (Mod_Mika_Pflanzen == 2)
				{
					B_Say		(self, self, "$SMALLTALKMIKAPFLANZEN02");
				}
				else if (Mod_Mika_Pflanzen == 1)
				{
					B_Say		(self, self, "$SMALLTALKMIKAPFLANZEN01");
				};
			};
		};		
			
	}
	else if (random <= 150)
	{	
		if (Npc_GetTrueGuild (self) == GIL_OUT)
		&& (CurrentLevel == RELENDEL_ZEN)	
		{
			Randi = Hlp_Random(6);

			if (Npc_KnowsInfo(hero, Info_Mod_Jesper_REL_InTaverne))
			{
				if (Randi == 0)
				{
					B_Say		(self, self, "$SMALLTALKKHORATADIEBEGRUSEL01");
				}
				else if (Randi == 1)
				{
					B_Say		(self, self, "$SMALLTALKKHORATADIEBEGRUSEL02");
				}
				else if (Randi == 2)
				{
					B_Say		(self, self, "$SMALLTALKKHORATADIEBEGRUSEL03");
				}
				else if (Randi == 3)
				{
					B_Say		(self, self, "$SMALLTALKKHORATADIEBEGRUSEL04");
				}
				else if (Randi == 4)
				{
					B_Say		(self, self, "$SMALLTALKKHORATADIEBEGRUSEL05");
				}
				else
				{
					B_Say		(self, self, "$SMALLTALKKHORATADIEBEGRUSEL06");
				};
			};
		};		
			
	}
	else if (random <= 155)
	{	
		if (Npc_GetTrueGuild (self) == GIL_OUT)
		&& (CurrentLevel == RELENDEL_ZEN)	
		{
			Randi = Hlp_Random(8);

			if (Npc_KnowsInfo(hero, Info_Mod_Cassia_REL_Glorie4))
			{
				if (Randi == 0)
				{
					B_Say		(self, self, "$SMALLTALKKHORATADIEBEBIB01");
				}
				else if (Randi == 1)
				{
					B_Say		(self, self, "$SMALLTALKKHORATADIEBEBIB02");
				}
				else if (Randi == 2)
				{
					B_Say		(self, self, "$SMALLTALKKHORATADIEBEBIB03");
				}
				else if (Randi == 3)
				{
					B_Say		(self, self, "$SMALLTALKKHORATADIEBEBIB04");
				}
				else if (Randi == 4)
				{
					B_Say		(self, self, "$SMALLTALKKHORATADIEBEBIB05");
				}
				else if (Randi == 5)
				{
					B_Say		(self, self, "$SMALLTALKKHORATADIEBEBIB06");
				}
				else if (Randi == 6)
				{
					B_Say		(self, self, "$SMALLTALKKHORATADIEBEBIB07");
				}
				else
				{
					B_Say		(self, self, "$SMALLTALKKHORATADIEBEBIB08");
				};
			};
		};		
			
	}
	else if (random <= 160)
	{	
		if (Npc_GetTrueGuild (self) == GIL_OUT)
		&& (CurrentLevel == RELENDEL_ZEN)
		&& (self.aivar[AIV_GENDER] == MALE)
		{
			Randi = Hlp_Random(6);

			if (Randi == 0)
			{
				B_Say		(self, self, "$SMALLTALKKHORATANORMAL01");
			}
			else if (Randi == 1)
			{
				B_Say		(self, self, "$SMALLTALKKHORATANORMAL02");
			}
			else if (Randi == 2)
			{
				B_Say		(self, self, "$SMALLTALKKHORATANORMAL03");
			}
			else if (Randi == 3)
			{
				B_Say		(self, self, "$SMALLTALKKHORATANORMAL04");
			}
			else if (Randi == 4)
			{
				B_Say		(self, self, "$SMALLTALKKHORATANORMAL05");
			}
			else
			{
				B_Say		(self, self, "$SMALLTALKKHORATANORMAL06");
			};
		};		
			
	};
};
