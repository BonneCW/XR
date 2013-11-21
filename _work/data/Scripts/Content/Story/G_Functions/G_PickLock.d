// ************* 
// G_PickLock
// ----------
// self = Player // stimmt nicht!!! immer hero benutzen
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
			// Fehlschlag beim Knacken => Dietrich bricht ab und Sound oder nur Neuanfang

			if (r_max(hero.attribute[ATR_DEXTERITY]) < r_max(99)-Dietrich_Perk*25)
			{
				Snd_Play3D 	(self, "PICKLOCK_BROKEN");
				Print (PRINT_PICKLOCK_BROKEN);

				B_Say	(hero, NULL, "$PICKLOCKBROKEN");

				Npc_RemoveInvItems	(hero, ItKe_Lockpick, 1);

				if (Npc_HasItems(hero, ItKe_Lockpick) == 1)
				{
					AI_UseMob	(hero, "CHESTSMALL", -1);
					AI_UseMob	(hero, "CHESTBIG", -1);
					AI_UseMob	(hero, "DOOR", -1);
				};
			
				var int rnd; rnd = r_max(99);
				if (rnd < 50)
				{
					Npc_SendPassivePerc (hero, PERC_ASSESSQUIETSOUND, hero, hero);
				};
			}
			else
			{
				Snd_Play3D 	(self, "PICKLOCK_FAILURE");
				Print (PRINT_PICKLOCK_FAILURE);

				B_Say	(hero, NULL, "$PICKLOCKFAILURE");
			};
		}
		else
		{
			Print	("Sollte hier nie ankommen!!!");
		};
	};
};