func int C_OtherIsToleratedEnemy(var C_NPC slf, var C_NPC oth)
{
	PrintDebugNpc			(PD_ZS_DETAIL,	"C_OtherIsToleratedEnemy");

	//-------- Orkverfolger --------
	if (C_NpcIsOrc(slf))
	{
		PrintDebugNpc		(PD_ZS_DETAIL,	"...'self' ist Ork!");

		//---- Ulu-Mulu in der Hand ? ----
		var C_ITEM			weapon;
		var int				weaponInstance;
		weapon = 			Npc_GetReadiedWeapon(oth);

		if (Hlp_IsValidItem(weapon))
		{
			weaponInstance =Hlp_GetInstanceID(weapon);

			PrintDebugString(PD_ZS_DETAIL, "...gezogene Waffe von 'other': ", weapon.name);

			if (weaponInstance == UluMulu)
			&& (!Npc_KnowsInfo(hero, Info_Mod_Xardas_MT_HabSchwert))
			{
				PrintDebugNpc(PD_ZS_DETAIL, "...true!");
				return		TRUE;
			};
		};
		
		//---- Ulu-Mulu equipped ? ----
		weapon = 			Npc_GetEquippedMeleeWeapon	(oth);

		if (Hlp_IsValidItem(weapon))
		{
			weaponInstance =Hlp_GetInstanceID(weapon);

			PrintDebugString(PD_ZS_DETAIL, "...equippte Waffe von 'other': ", weapon.name);

			if (weaponInstance == UluMulu)
			&& (!Npc_KnowsInfo(hero, Info_Mod_Xardas_MT_HabSchwert))
			{
				PrintDebugNpc(PD_ZS_DETAIL, "...true!");
				return		TRUE;
			};
		};
	};

	PrintDebugNpc			(PD_ZS_DETAIL, "...false!");
	return 					FALSE;
};