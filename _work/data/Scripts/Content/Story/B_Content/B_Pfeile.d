func INT B_Pfeile (var C_NPC oth, var C_NPC slf)
{
	if (Hlp_GetInstanceID(oth) != Hlp_GetInstanceID(PC_Hero))
	{
		return 0;
	};

	var C_Item RW;
	RW = Npc_GetReadiedWeapon(oth);

	if (!Hlp_IsValidItem(RW))
	{
		return 0;
	};

	if (C_ItmHasFlag(RW,ITEM_BOW))
	|| (C_ItmHasFlag(RW,ITEM_CROSSBOW))
	{
		if ((RW.munition == ItRw_IceArrow)
		|| (RW.munition == ItRw_IceBolt))
		&& (Hlp_Random(3) == 1)
		{
			Npc_ClearAIQueue	(slf);
			B_ClearPerceptions	(slf);

			Wld_PlayEffect("spellFX_IceSpell_SENDPERCEPTION",  slf, slf, 0, 0, 0, FALSE );

			AI_StartState		(slf, ZS_MagicFreeze, 0, "");

			return 0;
		};
		if (RW.munition == ItRw_Addon_FireArrow)
		|| (RW.munition == ItRw_Addon_FireBolt)
		{
			var int Feuerschuss_Schaden;
		
			Feuerschuss_Schaden = 100-slf.protection[PROT_FIRE];

			if (Feuerschuss_Schaden < 10)
			{
				Feuerschuss_Schaden = 10;
			};

			Wld_PlayEffect("VOB_MAGICBURN",  slf, slf, 0, 0, 0, FALSE );

			if (C_NpcIsFiremonster(slf))
			{
				return 0;
			}
			else if (C_NpcIsIcemonster(slf))
			{
				return Feuerschuss_Schaden*2;
			}
			else
			{
				return Feuerschuss_Schaden;
			};
		};
		if (RW.munition == ItRw_HolyArrow)
		|| (RW.munition == ItRw_HolyBolt)
		{
			if (C_NpcIsUndead(slf))
			|| (slf.guild == GIL_DEMON)
			{
				return 100;
			};
		};
		if (RW.munition == ItRw_Addon_MagicArrow)
		|| (RW.munition == ItRw_Addon_MagicBolt)
		{
			var int Magieschuss_Schaden;
		
			Magieschuss_Schaden = 150-slf.protection[PROT_MAGIC];

			if (Magieschuss_Schaden < 10)
			{
				Magieschuss_Schaden = 10;
			};

			return Magieschuss_Schaden;
		};
		if (RW.munition == ItRw_GoldErzArrow)
		|| (RW.munition == ItRw_GoldErzBolt)
		{
			return 50;
		};
		if (RW.munition == ItRw_GoldErzBlutArrow)
		|| (RW.munition == ItRw_GoldErzBlutBolt)
		{
			return 100;
		};
		if (RW.munition == ItRw_SchmetterArrow)
		|| (RW.munition == ItRw_SchmetterBolt)
		{
			var int Schmetterschuss_Schaden;
		
			Schmetterschuss_Schaden = 100-slf.protection[PROT_BLUNT];

			if (Schmetterschuss_Schaden < 10)
			{
				Schmetterschuss_Schaden = 10;
			};

			if (C_NpcIsUndead(slf))
			{
				return Schmetterschuss_Schaden*2;
			}
			else
			{
				return Schmetterschuss_Schaden;
			};
		};
		if (RW.munition == ItRw_TiergiftArrow)
		|| (RW.munition == ItRw_TiergiftBolt)
		{
			if (oth.aivar[AIV_MM_REAL_ID] != ID_BLOODFLY)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_SPIDER)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_MINECRAWLER)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_MINECRAWLERWARRIOR)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_MINECRAWLERQUEEN)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_SWAMPDRONE)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_ZOMBIE)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_SKELETON)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_SKELETONLORD)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_SKELETON_MAGE)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_GOBBO_SKELETON)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_UNDEADORCWARRIOR)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_DEMON)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_DEMON_LORD)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_DRAGON_ROCK)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_DRAGON_FIRE)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_DRAGON_ICE)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_DRAGON_SWAMP)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_DRAGON_UNDEAD)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_DRAGON_BLACK)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_KOBOLD)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_GIGANTDERVORZEIT)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_BALROG)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_GARGOYLE)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_UNDEADSWAMPSHARK)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_LINDWURM)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_FIREWARAN)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_STONEGUARDIAN)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_SLEEPER)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_ALRAUNE)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_APFELBAUM)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_WISP)
			&& (oth.guild != GIL_STONEGOLEM)
			&& (oth.guild != GIL_FIREGOLEM)
			&& (oth.guild != GIL_ICEGOLEM)
			&& (oth.guild != GIL_SWAMPGOLEM)
			&& (Hlp_GetInstanceID(oth) != Hlp_GetInstanceID(Schattenlord_877_Urnol))
			&& (Hlp_GetInstanceID(oth) != Hlp_GetInstanceID(Schattenlord_999_Urnol))
			&& (Hlp_GetInstanceID(oth) != Hlp_GetInstanceID(Schattenlord_542_Urnol))
			&& (Hlp_GetInstanceID(oth) != Hlp_GetInstanceID(Mod_7036_NONE_Pilger_NW))
			&& (Hlp_GetInstanceID(oth) != Hlp_GetInstanceID(Mod_7659_OUT_Magier_REL))
			{
				oth.aivar[AIV_Tiergift] += 10;
			};
		};
		if (RW.munition == ItRw_GewaechsgiftArrow)
		|| (RW.munition == ItRw_GewaechsgiftBolt)
		{
			if (oth.aivar[AIV_MM_REAL_ID] != ID_ZOMBIE)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_SKELETON)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_SKELETONLORD)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_SKELETON_MAGE)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_GOBBO_SKELETON)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_UNDEADORCWARRIOR)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_DEMON)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_DEMON_LORD)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_DRAGON_ROCK)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_DRAGON_FIRE)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_DRAGON_ICE)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_DRAGON_SWAMP)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_DRAGON_UNDEAD)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_DRAGON_BLACK)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_KOBOLD)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_GIGANTDERVORZEIT)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_BALROG)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_GARGOYLE)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_UNDEADSWAMPSHARK)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_LINDWURM)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_FIREWARAN)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_STONEGUARDIAN)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_SLEEPER)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_ALRAUNE)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_APFELBAUM)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_WISP)
			&& (oth.guild != GIL_STONEGOLEM)
			&& (oth.guild != GIL_FIREGOLEM)
			&& (oth.guild != GIL_ICEGOLEM)
			&& (oth.guild != GIL_SWAMPGOLEM)
			&& (Hlp_GetInstanceID(oth) != Hlp_GetInstanceID(Schattenlord_877_Urnol))
			&& (Hlp_GetInstanceID(oth) != Hlp_GetInstanceID(Schattenlord_999_Urnol))
			&& (Hlp_GetInstanceID(oth) != Hlp_GetInstanceID(Schattenlord_542_Urnol))
			&& (Hlp_GetInstanceID(oth) != Hlp_GetInstanceID(Mod_7036_NONE_Pilger_NW))
			&& (Hlp_GetInstanceID(oth) != Hlp_GetInstanceID(Mod_7659_OUT_Magier_REL))
			{
				oth.aivar[AIV_Pflanzengift] += 16;
			};
		};
		if (RW.munition == ItRw_WiderhakenArrow)
		|| (RW.munition == ItRw_WiderhakenBolt)
		{
			if (Hlp_Random(100) < 30)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_ZOMBIE)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_SKELETON)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_SKELETONLORD)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_SKELETON_MAGE)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_GOBBO_SKELETON)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_UNDEADORCWARRIOR)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_GIGANTDERVORZEIT)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_BALROG)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_GARGOYLE)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_UNDEADSWAMPSHARK)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_STONEGUARDIAN)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_SLEEPER)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_ALRAUNE)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_APFELBAUM)
			&& (oth.aivar[AIV_MM_REAL_ID] != ID_WISP)
			&& (oth.guild != GIL_STONEGOLEM)
			&& (oth.guild != GIL_FIREGOLEM)
			&& (oth.guild != GIL_ICEGOLEM)
			&& (oth.guild != GIL_SWAMPGOLEM)
			&& (Hlp_GetInstanceID(oth) != Hlp_GetInstanceID(Schattenlord_877_Urnol))
			&& (Hlp_GetInstanceID(oth) != Hlp_GetInstanceID(Schattenlord_999_Urnol))
			&& (Hlp_GetInstanceID(oth) != Hlp_GetInstanceID(Schattenlord_542_Urnol))
			&& (Hlp_GetInstanceID(oth) != Hlp_GetInstanceID(Mod_7036_NONE_Pilger_NW))
			&& (Hlp_GetInstanceID(oth) != Hlp_GetInstanceID(Mod_7659_OUT_Magier_REL))
			{
				oth.aivar[AIV_Blutet] = 20;
			};
		};
	};

	return 0;
};