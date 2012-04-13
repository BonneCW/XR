// ************* 
// G_PickLock
// ----------
// self = Player
// *************

func void G_PickLock (var int bSuccess, var int bBrokenOpen)
{
	if (bSuccess)
	{
		if (!bBrokenOpen)
		{
			Snd_Play3D 	(self, "PICKLOCK_SUCCESS");
			Print (PRINT_PICKLOCK_SUCCESS);
		}
		else
		{
			Snd_Play3D 	(self, "PICKLOCK_UNLOCK");
			Print (PRINT_PICKLOCK_UNLOCK);	
		};
	}
	else
	{
		if (bBrokenOpen)
		{
			if (Dietrich_Perk == TRUE)
			&& (Hlp_Random(100) < 50)
			{
				CreateInvItems	(hero, ItKe_Lockpick, 1);

				Print	("Noch mal Glück gehabt!");

				Snd_Play3D 	(self, "PICKLOCK_FAILURE");
				Print (PRINT_PICKLOCK_FAILURE);
			}
			else
			{
				Snd_Play3D 	(self, "PICKLOCK_BROKEN");
				Print (PRINT_PICKLOCK_BROKEN);
			
				var int rnd; rnd = Hlp_Random(100);
				if (rnd <= 25)
				{
					Npc_SendPassivePerc (hero, PERC_ASSESSQUIETSOUND, hero, hero);
				};
			};
		}
		else
		{
			Snd_Play3D 	(self, "PICKLOCK_FAILURE");
			Print (PRINT_PICKLOCK_FAILURE);
		};
	};
};
