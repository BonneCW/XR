var int SlowmotionCooldown;
var int AusdauerCooldown;

FUNC VOID PerkSchleife()
{
	// Regenerationen

	if (HP_Perk == TRUE)
	&& (hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	&& (!Npc_IsDead(hero)) {
		HP_Reg = ((hero.attribute[ATR_STRENGTH] + hero.attribute[ATR_DEXTERITY]) * hero.level);

		var int dividedHPReg;
		dividedHPReg = HP_Reg / 8000;

		if (dividedHPReg < 1) {
			HP_Reg = max(1, HP_Reg);
			if (TimeCounter_Real % (8000 / HP_Reg) == 0) {
				hero.attribute[ATR_HITPOINTS] += 1;
			};
		} else {
			hero.attribute[ATR_HITPOINTS] += dividedHPReg;
		};

		hero.aivar[AIV_Damage] = hero.attribute[ATR_HITPOINTS];

		if (hero.attribute[ATR_HITPOINTS] > hero.attribute[ATR_HITPOINTS_MAX])
		{
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];

			hero.aivar[AIV_Damage] = hero.attribute[ATR_HITPOINTS_MAX];
		};
	};

	if (Mana_Perk == TRUE)
	&& (hero.attribute[ATR_MANA] < hero.attribute[ATR_MANA_MAX]) {
		Mana_Reg = hero.attribute[ATR_MANA_MAX]*((hero.level));

		var int dividedManaReg;
		dividedManaReg = Mana_Reg / 8000;
		if (dividedManaReg < 1) {
			Mana_Reg = max(1, Mana_Reg);
			if (TimeCounter_Real % (8000 / Mana_Reg) == 0) {
				hero.attribute[ATR_MANA] += 1;
			};
		} else {
			hero.attribute[ATR_MANA] += dividedManaReg;
		};

		if (hero.attribute[ATR_MANA] > hero.attribute[ATR_MANA_MAX]) {
			hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];
		};
	};

	// Verwandlung Frau

	if (Mod_TrfWoman == 1)
	{
		Mod_TrfWoman_Time -= 1;

		if (Mod_TrfWoman_Time == 0)
		{
			Mod_TrfWoman = 0;

			hero.attribute[ATR_STRENGTH] += 15;
			hero.attribute[ATR_DEXTERITY] -= 20;
			hero.attribute[ATR_HITPOINTS] += 40;
			hero.attribute[ATR_HITPOINTS_MAX] += 40;

			hero.aivar[AIV_Damage] += 40;

			AI_UnequipArmor	(hero);

			Mdl_SetVisual (hero,"HUMANS.MDS");
			// ------ Visual ------ "body_Mesh",		bodyTex			SkinColor	headMesh,			faceTex,		teethTex,	armorInstance	
			Mdl_SetVisualBody (hero, "hum_body_naked0", 1,				0,			"Hum_Head_Fighter", 	FACE_N_Player,	0, 			NO_Armor);

			Mdl_RemoveOverlayMDS	(hero, "HUMANS_BABE.MDS");
		};
	};

	// Verwandlung Halbinfernalischer

	if (Mod_HeroIstDemon == TRUE)
	{
		Mod_HeroDemonCounter -= 1;

		if (Mod_HeroDemonCounter <= 0)
		{
			Mod_HeroIstDemon = FALSE;

			hero.attribute[ATR_STRENGTH] -= 100;
			hero.attribute[ATR_DEXTERITY] += 70;
			hero.attribute[ATR_HITPOINTS] -= 400;
			hero.attribute[ATR_HITPOINTS_MAX] -= 400;

			hero.aivar[AIV_Damage] -= 400;

			hero.protection[PROT_EDGE] -= 100000;
			hero.protection[PROT_BLUNT] -= 100000;
			hero.protection[PROT_POINT] -= 100000;
			hero.protection[PROT_FIRE] -= 100;
			hero.protection[PROT_MAGIC] -= 100;

			hero.damagetype = DAM_BLUNT;

			AI_UnequipArmor	(hero);

			Wld_StopEffect	("INFERNALFIRE");

			Mdl_SetVisual (hero,"HUMANS.MDS");
			// ------ Visual ------ "body_Mesh",		bodyTex			SkinColor	headMesh,			faceTex,		teethTex,	armorInstance	
			Mdl_SetVisualBody (hero, "hum_body_naked0", 1,				0,			"Hum_Head_Fighter", 	FACE_N_Player,	0, 			NO_Armor);
		};
	};

	// Verwandlung Skelett

	if (Mod_TrfSkeleton2 == 1)
	{
		Mod_TrfSkeleton2_Time -= 1;

		if (Mod_TrfSkeleton2_Time == 0)
		{
			Mod_TrfSkeleton2 = 0;

			AI_UnequipArmor	(hero);

			Mdl_SetVisualBody (hero, "hum_body_naked0", 1,				0,			"Hum_Head_Fighter", 	FACE_N_Player,	0, 			NO_Armor);

			if (Mod_Gilde == 1)
			|| (Mod_Gilde == 2)
			|| (Mod_Gilde == 3)
			{
				hero.guild = GIL_PAL;
			}
			else if (Mod_Gilde == 4)
			|| (Mod_Gilde == 5)
			|| (Mod_Gilde == 19)
			{
				hero.guild = GIL_MIL;
			}
			else if (Mod_Gilde == 6)
			|| (Mod_Gilde == 7)
			|| (Mod_Gilde == 8)
			{
				hero.guild = GIL_VLK;
			}
			else if (Mod_Gilde == 9)
			|| (Mod_Gilde == 10)
			|| (Mod_Gilde == 11)
			|| (Mod_Gilde == 17)
			|| (Mod_Gilde == 18)
			{
				hero.guild = GIL_NOV;
			}
			else if (Mod_Gilde == 12)
			|| (Mod_Gilde == 13)
			|| (Mod_Gilde == 14)
			|| (Mod_Gilde == 15)
			|| (Mod_Gilde == 16)
			{
				hero.guild = GIL_KDF;
			};

			playerIsTransformed = FALSE;
		};
	};

	if (Mod_FolgsamkeitSnapper_Intus == TRUE)
	{
		Mod_FolgsamkeitSnapper_Time -= 1;

		if (Mod_FolgsamkeitSnapper_Time == 0)
		{
			hero.attribute[ATR_STRENGTH] -= 20;
			hero.attribute[ATR_DEXTERITY] -= 20;

			hero.protection[PROT_EDGE] -= 30000;
			hero.protection[PROT_BLUNT] -= 30000;
			hero.protection[PROT_POINT] -= 30000;
			hero.protection[PROT_MAGIC] -= 30;
			hero.protection[PROT_FIRE] -= 30;

			AI_UnequipArmor	(hero);

			Mdl_SetVisualBody (hero, "hum_body_naked0", 1,				0,			"Hum_Head_Fighter", 	FACE_N_Player,	0, 			NO_Armor);

			if (Mod_Gilde == 1)
			|| (Mod_Gilde == 2)
			|| (Mod_Gilde == 3)
			{
				hero.guild = GIL_PAL;
			}
			else if (Mod_Gilde == 4)
			|| (Mod_Gilde == 5)
			|| (Mod_Gilde == 19)
			{
				hero.guild = GIL_MIL;
			}
			else if (Mod_Gilde == 6)
			|| (Mod_Gilde == 7)
			|| (Mod_Gilde == 8)
			{
				hero.guild = GIL_VLK;
			}
			else if (Mod_Gilde == 9)
			|| (Mod_Gilde == 10)
			|| (Mod_Gilde == 11)
			|| (Mod_Gilde == 17)
			|| (Mod_Gilde == 18)
			{
				hero.guild = GIL_NOV;
			}
			else if (Mod_Gilde == 12)
			|| (Mod_Gilde == 13)
			|| (Mod_Gilde == 14)
			|| (Mod_Gilde == 15)
			|| (Mod_Gilde == 16)
			{
				hero.guild = GIL_KDF;
			};

			Mod_FolgsamkeitSnapper_Intus = FALSE;
		};
	};

	// Ring der Verschleierung

	if (Mod_Verschleierung == 1)
	&& (Unsichtbarkeitsperk == TRUE)
	{
		Npc_ChangeAttribute(hero, ATR_MANA, hero.attribute[ATR_MANA_MAX]/20);

		if (hero.attribute[ATR_MANA] < 5)
		{
			Mod_Verschleierung = 0;

			hero.flags = 0;

			Unsichtbarkeitsperk = FALSE;

			AI_Teleport	(hero, "PC_HERO");
		};
	};

	if (Mod_Dornenguertel)
	{
		if (TimeCounter_Real%4 == 0)
		{
			B_MagicHurtNpc	(hero, hero, 1);
		};
	};

	if (Mod_HeilungRing)
	{
		if (hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
		{
			hero.attribute[ATR_HITPOINTS] += 1;
			hero.aivar[AIV_Damage] = hero.attribute[ATR_HITPOINTS];
		};
	};

	if (Mod_WillenskraftRing)
	{
		if (hero.attribute[ATR_MANA] < hero.attribute[ATR_MANA_MAX])
		{
			hero.attribute[ATR_MANA] += 1;
		};
	};

	// Kampfperks

	Kampfperks();
};