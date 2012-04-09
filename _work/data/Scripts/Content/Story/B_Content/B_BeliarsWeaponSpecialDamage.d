var int RavenBlitz;

func void B_DeliriumSchaden (var C_NPC oth, var C_NPC slf)
{
	if (Delirium_Perk == TRUE)
	&& (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(hero))
	{
		if (C_ScHasReadiedDeliriumWaffe())
		{
			if (!Npc_CanSeeNpc (slf, oth))
			|| (Unsichtbarkeitsperk == TRUE)
			|| (Npc_IsInState(slf,ZS_Sleep))
			|| (Npc_IsInState(slf,ZS_Sleep_Deep))
			|| (Npc_IsInState(slf,ZS_Knockout))
			{
				B_MagicHurtNpc	(oth, slf, 9999999);
			};
		};
	};
};

func int B_Knockout (var C_NPC oth, var C_NPC slf)
{
	var C_ITEM gezogeneWaffe;
	gezogeneWaffe = Npc_GetReadiedWeapon(oth);

	if ((Knockout_Perk == TRUE)
	|| (Hlp_IsItem(gezogeneWaffe, ItMw_UnconsciousKnueppel) == TRUE))
	&& (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(hero))
	{
		if (!Npc_CanSeeNpc (slf, oth))
		|| (Unsichtbarkeitsperk == TRUE)
		|| (Npc_IsInState(slf,ZS_Sleep))
		|| (Npc_IsInState(slf,ZS_Sleep_Deep))
		|| (Hlp_IsItem(gezogeneWaffe, ItMw_UnconsciousKnueppel) == TRUE)
		{
			if (!Npc_IsInState(slf, ZS_Knockout))
			{
				if (Hlp_IsItem(gezogeneWaffe, ItMw_UnconsciousKnueppel) == TRUE)
				{
					AI_StartState(slf, ZS_Knockout, 0, "" );

					AI_RemoveWeapon	(oth);

					AI_UnequipWeapons	(oth);

					Npc_RemoveInvItems (oth, ItMw_UnconsciousKnueppel, 1);
				}
				else
				{
					B_MagicHurtNpc	(oth, slf, ((oth.attribute[ATR_STRENGTH]+oth.attribute[ATR_DEXTERITY])/2));

					if (r_max(99) < 15)
					{						
						AI_StartState(slf, ZS_Knockout, 0, "" );
					};
				};

				return TRUE;
			};
		};
	};

	return FALSE;
};

func int B_BeliarsWeaponSpecialDamage (var C_NPC oth, var C_NPC slf) //other ist angreifer, slf ist victim
{
	if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Skeleton_Anführer)) //HACK: egal, welche Waffe Raven hat
	{
		//Ambient Pfx
		Wld_PlayEffect("spellFX_BELIARSRAGE_COLLIDE", slf, slf, 0, 0, 0, FALSE );
			
		if (RavenBlitz <= 0)
		{
			Wld_PlayEffect("spellFX_BELIARSRAGE",  oth, oth, 0, 0, 0, FALSE );
				
			RavenBlitz += 1;
								
			return 50; //Extraschaden von Raven!
		}
		else if (RavenBlitz >= 3) 
		{
			var int RavenRandy; RavenRandy = Hlp_Random(3);

			if (RavenRandy <= 50)
			{
				RavenBlitz = 0; //wieder von vorne
			};
		}
		else
		{
			RavenBlitz += 1;
		};
			
	}
	else if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(hero))
	{
		var int DamageRandy;
		DamageRandy = r_max(99);

		var int klauendamage;
		klauendamage = 0;

		if (C_ScHasReadiedBeliarsWeapon())
		{
			if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Schattenlord_999_Urnol))
			{
				slf.flags = 0;

				klauendamage = 100;
			};

			if (slf.flags != NPC_FLAG_IMMORTAL)
			{
				if (Mod_Gottstatus < 5)
				{
					slf.effect = "SPELLFX_FIRESWORDBLACK";

					Wld_PlayEffect("spellFX_BELIARSRAGE_COLLIDE", hero, hero, 0, 0, 0, FALSE );

					Wld_PlayEffect("SpellFX_BELIARSRAGE", slf, slf, 0, 0, 0, FALSE);

					if (Mod_Gottstatus == 4)
					{
						return 50+klauendamage;
					}
					else if (Mod_Gottstatus == 3)
					{
						return 100+klauendamage;
					}
					else if  (Mod_Gottstatus == 2)
					{
						return 150+klauendamage;
					}
					else if (Mod_Gottstatus == 1)
					{
						return 200+klauendamage;
					};
				}
				else
				{
					if (DamageRandy <= BeliarDamageChance) 
					{
						Wld_PlayEffect("spellFX_BELIARSRAGE", slf, slf, 0, 0, 0, FALSE );

						return 100+klauendamage;			
					};

					//Ambient Pfx
					Wld_PlayEffect("spellFX_BELIARSRAGE_COLLIDE", hero, hero, 0, 0, 0, FALSE );
				};
			};
		};
	};

	return 0;
};

func INT B_AdanosStabSpecialDamage (var C_NPC oth, var C_NPC slf) //other ist angreifer, slf ist victim
{
	if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(hero))
	{
		var int DamageRandy;
		DamageRandy = r_max(99);

		if (C_ScHasReadiedAdanosStab())
		{
				if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Fake_Hero))
				{
					return 100;
				};

				if (slf.flags != NPC_FLAG_IMMORTAL)
				{
					if (Mod_Gottstatus > 4)
					&& (Mod_Gottstatus < 9)
					{
						Wld_PlayEffect("spellFX_BELIARSRAGE_COLLIDE", hero, hero, 0, 0, 0, FALSE );

						Wld_PlayEffect("SpellFX_ADANOSRAGE", slf, slf, 0, 0, 0, FALSE);

						if (Mod_Gottstatus == 8)
						{
							return 50;
						}
						else if (Mod_Gottstatus == 7)
						{
							return 100;
						}
						else if  (Mod_Gottstatus == 6)
						{
							return 150;
						}
						else if (Mod_Gottstatus == 5)
						{
							return 200;
						};
					};
				
				};
		};
	};

	return 0;
};

func INT B_HolyHammerSpecialDamage (var C_NPC oth, var C_NPC slf) //other ist angreifer, slf ist victim
{
	if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(hero))
	{
		var int DamageRandy;
		DamageRandy = r_max(99);

		if (C_ScHasReadiedHolyHammer())
		{
				if (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Dragon_Undead))
				{
					return 100;
				};

				if (slf.flags != NPC_FLAG_IMMORTAL)
				{
					if (Mod_Gottstatus > 8)
					{
						Wld_PlayEffect("spellFX_BELIARSRAGE_COLLIDE", hero, hero, 0, 0, 0, FALSE );

						Wld_PlayEffect("SpellFX_INNORSRAGE", slf, slf, 0, 0, 0, FALSE);

						if (Mod_Gottstatus == 12)
						{
							return 50;
						}
						else if (Mod_Gottstatus == 11)
						{
							return 100;
						}
						else if  (Mod_Gottstatus == 10)
						{
							return 150;
						}
						else if (Mod_Gottstatus == 9)
						{
							return 200;
						};
					};
				};
		};
	};

	return 0;
};

FUNC INT B_UrizielsSpecialDamage (var C_NPC oth, var C_NPC slf)
{
	if (Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(hero))
	&& (C_ScHasReadiedUriziel())
	{
		Wld_PlayEffect("SpellFX_BELIARSRAGE_COLLIDE", hero, hero, 0, 0, 0, FALSE);

		Wld_PlayEffect("SpellFX_BELIARSRAGE", slf, slf, 0, 0, 0, FALSE);

		if (slf.aivar[AIV_MM_REAL_ID]	==	ID_GOBBO_SKELETON)
		|| (slf.aivar[AIV_MM_REAL_ID]	==	ID_SHADOWBEAST_SKELETON)
		|| (slf.aivar[AIV_MM_REAL_ID]	==	ID_SKELETON)
		|| (slf.aivar[AIV_MM_REAL_ID]	==	ID_SUMMONED_SKELETON)
		|| (slf.aivar[AIV_MM_REAL_ID]	==	ID_SKELETON_MAGE)
		|| (slf.aivar[AIV_MM_REAL_ID]	==	ID_ZOMBIE)
		|| (slf.aivar[AIV_MM_REAL_ID]	==	ID_SUMMONEDZombie)
		{
			Wld_PlayEffect("SpellFX_FIRESWORDBLACK", slf, slf, 0, 0, 0, FALSE);
			return 9999;
		};
		
		AI_StartState	(slf, ZS_MagicFreeze, 0, "");

		return 200;	
	};

	return 0;
};

FUNC VOID B_GolemsSchadensbediengungen (var C_NPC oth, var C_NPC slf)
{
	if (Hlp_GetInstanceID(oth)	==	Hlp_GetInstanceID(hero))
	{
		if (slf.aivar[AIV_MM_REAL_ID]	==	ID_FIREGOLEM)
		{
			if (C_ScHasReadiedEiszauber())
			{
				slf.attribute[ATR_HITPOINTS] -= 50;
			};
		};
		if (slf.aivar[AIV_MM_REAL_ID]	==	ID_STONEGOLEM)
		{
			if (C_ScHasReadiedKeule())
			{
				slf.attribute[ATR_HITPOINTS] -= 50;
			};
		};
		if (slf.aivar[AIV_MM_REAL_ID]	==	ID_ICEGOLEM)
		{
			if (Mod_UsesFirebolt	==	1)
			{
				slf.attribute[ATR_HITPOINTS] -= 50;
			};
		};
	};
};			