FUNC VOID Kampfperks()
{
	if (Konter_Perk == 1)
	{
		Npc_GetTarget	(hero);

		//AI_PrintScreen	(IntToString(Npc_GetDistToNpc(hero,other)), -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

		if (KonterAngriff == TRUE)
		{
			var int Damage;
			var C_Item NW;

			NW = Npc_GetReadiedWeapon (hero);

			Damage = 2*Nw.damageTotal + hero.attribute[ATR_STRENGTH] - other.protection[PROT_EDGE]/1000;

			//Print	(IntToString(Damage));

			B_MagicHurtNpc	(hero, other, Damage);

			KonterAngriff = FALSE;
		};

		if (Npc_GetDistToNpc(hero,other) < 350)
		&& (C_BodyStateContains(other, BS_HIT))
		&& (C_BodyStateContains(hero, BS_PARADE))
		&& (Npc_IsInFightMode(hero, FMODE_MELEE))
		&& (Npc_IsInFightMode(other, FMODE_MELEE))
		{
			var int Random;

			Random = Hlp_Random(1000);
			
			if (Random < (hero.level * (hero.HitChance[NPC_TALENT_1H]+hero.HitChance[NPC_TALENT_2H])))
			{
				AI_StandUp(other);
				AI_StandUp(hero);
		
				AI_PlayAni(hero, "S_1HATTACK");

				//B_MagicHurtNpc	(hero, other, 9999);

				KonterAngriff = TRUE;
			};
		};
	};
};