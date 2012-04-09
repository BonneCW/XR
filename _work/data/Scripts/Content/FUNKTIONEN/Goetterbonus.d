var int Mod_HatAdanosBonus;
var int Mod_HatBeliarBonus;
var int Mod_HatInnosBonus;
var int Mod_GottDex;
var int Mod_GottStr;
var int Mod_GottMana;
var int Mod_GottHP;
var int Mod_GottProtection;
var int Mod_GottDamage;
var int Mod_GottAdanos;
var int Mod_GottInnos;
var int Mod_GottBeliar;

FUNC VOID Goetterbonus()
{
	if (Wld_IsTime(20,00,08,00))
	&& (!Wld_IsRaining())
	&& (Mod_GottCooldown == 0)
	{
		if (Mod_HatInnosBonus == TRUE)
		{
			Mod_HatInnosBonus = FALSE;

			AI_PrintScreen	("Innos nimmt dir seinen Segen!", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

			hero.attribute[ATR_MANA] -= Mod_GottMana;
			hero.attribute[ATR_MANA_MAX] -= Mod_GottMana;
			hero.protection[PROT_EDGE] -= Mod_GottProtection*1000;
			hero.protection[PROT_BLUNT] -= Mod_GottProtection*1000;
			hero.protection[PROT_POINT] -= Mod_GottProtection*1000;
			hero.protection[PROT_MAGIC] -= Mod_GottProtection;
			hero.protection[PROT_FIRE] -= Mod_GottProtection;

			if (hero.attribute[ATR_HITPOINTS] > Mod_GottHP)
			{
				hero.attribute[ATR_HITPOINTS] -= Mod_GottHP;

				hero.aivar[AIV_Damage] -= Mod_GottHP;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] = 1;

				hero.aivar[AIV_Damage] = 1;
			};

			hero.attribute[ATR_HITPOINTS_MAX] -= Mod_GottHP;

			Mod_GottDex = 0;
			Mod_GottStr = 0;
			Mod_GottMana = 0;
			Mod_GottHP = 0;
			Mod_GottProtection = 0;
			Mod_GottDamage = 0;
			Mod_GottAdanos = 0;
			Mod_GottInnos = 0;
			Mod_GottBeliar = 0;
		};

		if (Mod_HatAdanosBonus == TRUE)
		{
			Mod_HatAdanosBonus = FALSE;

			AI_PrintScreen	("Adanos nimmt dir seinen Segen!", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

			hero.attribute[ATR_MANA] -= Mod_GottMana;
			hero.attribute[ATR_MANA_MAX] -= Mod_GottMana;
			hero.protection[PROT_EDGE] -= Mod_GottProtection*1000;
			hero.protection[PROT_BLUNT] -= Mod_GottProtection*1000;
			hero.protection[PROT_POINT] -= Mod_GottProtection*1000;
			hero.protection[PROT_MAGIC] -= Mod_GottProtection;
			hero.protection[PROT_FIRE] -= Mod_GottProtection;

			if (hero.attribute[ATR_HITPOINTS] > Mod_GottHP)
			{
				hero.attribute[ATR_HITPOINTS] -= Mod_GottHP;

				hero.aivar[AIV_Damage] -= Mod_GottHP;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] = 1;

				hero.aivar[AIV_Damage] = 1;
			};

			hero.attribute[ATR_HITPOINTS_MAX] -= Mod_GottHP;

			Mod_GottDex = 0;
			Mod_GottStr = 0;
			Mod_GottMana = 0;
			Mod_GottHP = 0;
			Mod_GottProtection = 0;
			Mod_GottDamage = 0;
			Mod_GottAdanos = 0;
			Mod_GottInnos = 0;
			Mod_GottBeliar = 0;
		};

		if ((Mod_Gottstatus == 1)
		|| (Mod_Gottstatus == 2)
		|| (Mod_Gottstatus == 3)
		|| (Mod_Gottstatus == 4))
		&& (Mod_HatBeliarBonus == FALSE)
		{
			Mod_HatBeliarBonus = TRUE;

			AI_PrintScreen	("Beliar gibt dir seinen Segen!", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

			if (Mod_Gottstatus == 1)
			{
				if (Mod_Gilde == 12)
				|| (Mod_Gilde == 13)
				|| (Mod_Gilde == 14)
				{
					Mod_GottMana = 4000/hero.attribute[ATR_MANA_MAX];
				};
				if (Mod_Gilde == 12)
				|| (Mod_Gilde == 15)
				|| (Mod_Gilde == 16)
				|| (Mod_Gilde == 4)
				|| (Mod_Gilde == 19)
				|| (Mod_Gilde == 5)
				{
					Mod_GottDamage = 20;
				};

				Mod_GottHP = 2000/hero.attribute[ATR_HITPOINTS_MAX];
				Mod_GottProtection = 20;
				Mod_GottBeliar = 20;
			}
			else if (Mod_Gottstatus == 2)
			{
				if (Mod_Gilde == 12)
				|| (Mod_Gilde == 13)
				|| (Mod_Gilde == 14)
				{
					Mod_GottMana = 3000/hero.attribute[ATR_MANA_MAX];
				};
				if (Mod_Gilde == 12)
				|| (Mod_Gilde == 15)
				|| (Mod_Gilde == 16)
				|| (Mod_Gilde == 4)
				|| (Mod_Gilde == 19)
				|| (Mod_Gilde == 5)
				{
					Mod_GottDamage = 15;
				};

				Mod_GottHP = 1500/hero.attribute[ATR_HITPOINTS_MAX];
				Mod_GottProtection = 15;
				Mod_GottBeliar = 15;
			}
			else if (Mod_Gottstatus == 3)
			{
				if (Mod_Gilde == 12)
				|| (Mod_Gilde == 13)
				|| (Mod_Gilde == 14)
				{
					Mod_GottMana = 2000/hero.attribute[ATR_MANA_MAX];
				};
				if (Mod_Gilde == 12)
				|| (Mod_Gilde == 15)
				|| (Mod_Gilde == 16)
				|| (Mod_Gilde == 4)
				|| (Mod_Gilde == 19)
				|| (Mod_Gilde == 5)
				{
					Mod_GottDamage = 10;
				};

				Mod_GottHP = 1000/hero.attribute[ATR_HITPOINTS_MAX];
				Mod_GottProtection = 10;
				Mod_GottBeliar = 10;
			}
			else if (Mod_Gottstatus == 4)
			{
				if (Mod_Gilde == 12)
				|| (Mod_Gilde == 13)
				|| (Mod_Gilde == 14)
				{
					Mod_GottMana = 1000/hero.attribute[ATR_MANA_MAX];
				};
				if (Mod_Gilde == 12)
				|| (Mod_Gilde == 15)
				|| (Mod_Gilde == 16)
				|| (Mod_Gilde == 4)
				|| (Mod_Gilde == 19)
				|| (Mod_Gilde == 5)
				{
					Mod_GottDamage = 5;
				};

				Mod_GottHP = 500/hero.attribute[ATR_HITPOINTS_MAX];
				Mod_GottProtection = 5;
				Mod_GottBeliar = 5;
			};

			hero.attribute[ATR_MANA_MAX] += Mod_GottMana;
			hero.attribute[ATR_MANA] += Mod_GottMana;
			hero.attribute[ATR_HITPOINTS_MAX] += Mod_GottHP;
			hero.attribute[ATR_HITPOINTS] += Mod_GottHP;
			hero.protection[PROT_EDGE] += Mod_GottProtection*1000;
			hero.protection[PROT_BLUNT] += Mod_GottProtection*1000;
			hero.protection[PROT_POINT] += Mod_GottProtection*1000;
			hero.protection[PROT_MAGIC] += Mod_GottProtection;
			hero.protection[PROT_FIRE] += Mod_GottProtection;

			hero.aivar[AIV_Damage] += Mod_GottHP;
		}
		else if (Mod_Gottstatus > 4)
		&& (Mod_HatBeliarBonus == TRUE)
		{
			Mod_HatBeliarBonus = FALSE;

			AI_PrintScreen	("Beliar nimmt dir seinen Segen!", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

			hero.attribute[ATR_MANA] -= Mod_GottMana;
			hero.attribute[ATR_MANA_MAX] -= Mod_GottMana;
			hero.protection[PROT_EDGE] -= Mod_GottProtection*1000;
			hero.protection[PROT_BLUNT] -= Mod_GottProtection*1000;
			hero.protection[PROT_POINT] -= Mod_GottProtection*1000;
			hero.protection[PROT_MAGIC] -= Mod_GottProtection;
			hero.protection[PROT_FIRE] -= Mod_GottProtection;

			if (hero.attribute[ATR_HITPOINTS] > Mod_GottHP)
			{
				hero.attribute[ATR_HITPOINTS] -= Mod_GottHP;

				hero.aivar[AIV_Damage] -= Mod_GottHP;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] = 1;

				hero.aivar[AIV_Damage] = 1;
			};

			hero.attribute[ATR_HITPOINTS_MAX] -= Mod_GottHP;

			Mod_GottDex = 0;
			Mod_GottStr = 0;
			Mod_GottMana = 0;
			Mod_GottHP = 0;
			Mod_GottProtection = 0;
			Mod_GottDamage = 0;
			Mod_GottAdanos = 0;
			Mod_GottInnos = 0;
			Mod_GottBeliar = 0;
		};
	}
	else if (Wld_IsTime(08,00,20,00))
	&& (!Wld_IsRaining())
	&& (Mod_GottCooldown == 0)
	{
		if (Mod_HatBeliarBonus == TRUE)
		{
			Mod_HatBeliarBonus = FALSE;

			AI_PrintScreen	("Beliar nimmt dir seinen Segen!", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

			hero.attribute[ATR_MANA] -= Mod_GottMana;
			hero.attribute[ATR_MANA_MAX] -= Mod_GottMana;
			hero.protection[PROT_EDGE] -= Mod_GottProtection*1000;
			hero.protection[PROT_BLUNT] -= Mod_GottProtection*1000;
			hero.protection[PROT_POINT] -= Mod_GottProtection*1000;
			hero.protection[PROT_MAGIC] -= Mod_GottProtection;
			hero.protection[PROT_FIRE] -= Mod_GottProtection;

			if (hero.attribute[ATR_HITPOINTS] > Mod_GottHP)
			{
				hero.attribute[ATR_HITPOINTS] -= Mod_GottHP;

				hero.aivar[AIV_Damage] -= Mod_GottHP;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] = 1;
			};

			hero.attribute[ATR_HITPOINTS_MAX] -= Mod_GottHP;

				hero.aivar[AIV_Damage] = 1;

			Mod_GottDex = 0;
			Mod_GottStr = 0;
			Mod_GottMana = 0;
			Mod_GottHP = 0;
			Mod_GottProtection = 0;
			Mod_GottDamage = 0;
			Mod_GottAdanos = 0;
			Mod_GottInnos = 0;
			Mod_GottBeliar = 0;
		};

		if (Mod_HatAdanosBonus == TRUE)
		{
			Mod_HatAdanosBonus = FALSE;

			AI_PrintScreen	("Adanos nimmt dir seinen Segen!", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

			hero.attribute[ATR_MANA] -= Mod_GottMana;
			hero.attribute[ATR_MANA_MAX] -= Mod_GottMana;
			hero.protection[PROT_EDGE] -= Mod_GottProtection*1000;
			hero.protection[PROT_BLUNT] -= Mod_GottProtection*1000;
			hero.protection[PROT_POINT] -= Mod_GottProtection*1000;
			hero.protection[PROT_MAGIC] -= Mod_GottProtection;
			hero.protection[PROT_FIRE] -= Mod_GottProtection;

			if (hero.attribute[ATR_HITPOINTS] > Mod_GottHP)
			{
				hero.attribute[ATR_HITPOINTS] -= Mod_GottHP;

				hero.aivar[AIV_Damage] -= Mod_GottHP;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] = 1;

				hero.aivar[AIV_Damage] = 1;
			};

			hero.attribute[ATR_HITPOINTS_MAX] -= Mod_GottHP;

			Mod_GottDex = 0;
			Mod_GottStr = 0;
			Mod_GottMana = 0;
			Mod_GottHP = 0;
			Mod_GottProtection = 0;
			Mod_GottDamage = 0;
			Mod_GottAdanos = 0;
			Mod_GottInnos = 0;
			Mod_GottBeliar = 0;
		};

		if ((Mod_Gottstatus == 9)
		|| (Mod_Gottstatus == 10)
		|| (Mod_Gottstatus == 11)
		|| (Mod_Gottstatus == 12))
		&& (Mod_HatInnosBonus == FALSE)
		{
			Mod_HatInnosBonus = TRUE;

			AI_PrintScreen	("Innos gibt dir seinen Segen!", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

			if (Mod_Gottstatus == 9)
			{
				if (Mod_Gilde == 6)
				|| (Mod_Gilde == 7)
				|| (Mod_Gilde == 8)
				{
					Mod_GottMana = 4000/hero.attribute[ATR_MANA_MAX];
				};
				if (Mod_Gilde == 1)
				|| (Mod_Gilde == 2)
				|| (Mod_Gilde == 3)
				|| (Mod_Gilde == 4)
				|| (Mod_Gilde == 19)
				|| (Mod_Gilde == 5)
				{
					Mod_GottDamage = 20;
				};

				Mod_GottHP = 2000/hero.attribute[ATR_HITPOINTS_MAX];
				Mod_GottProtection = 20;
				Mod_GottInnos = 20;
			}
			else if (Mod_Gottstatus == 10)
			{
				if (Mod_Gilde == 6)
				|| (Mod_Gilde == 7)
				|| (Mod_Gilde == 8)
				{
					Mod_GottMana = 3000/hero.attribute[ATR_MANA_MAX];
				};
				if (Mod_Gilde == 1)
				|| (Mod_Gilde == 2)
				|| (Mod_Gilde == 3)
				|| (Mod_Gilde == 4)
				|| (Mod_Gilde == 19)
				|| (Mod_Gilde == 5)
				{
					Mod_GottDamage = 15;
				};

				Mod_GottHP = 1500/hero.attribute[ATR_HITPOINTS_MAX];
				Mod_GottProtection = 15;
				Mod_GottInnos = 15;
			}
			else if (Mod_Gottstatus == 11)
			{
				if (Mod_Gilde == 6)
				|| (Mod_Gilde == 7)
				|| (Mod_Gilde == 8)
				{
					Mod_GottMana = 2000/hero.attribute[ATR_MANA_MAX];
				};
				if (Mod_Gilde == 1)
				|| (Mod_Gilde == 2)
				|| (Mod_Gilde == 3)
				|| (Mod_Gilde == 4)
				|| (Mod_Gilde == 19)
				|| (Mod_Gilde == 5)
				{
					Mod_GottDamage = 10;
				};

				Mod_GottHP = 1000/hero.attribute[ATR_HITPOINTS_MAX];
				Mod_GottProtection = 10;
				Mod_GottInnos = 10;
			}
			else if (Mod_Gottstatus == 12)
			{
				if (Mod_Gilde == 6)
				|| (Mod_Gilde == 7)
				|| (Mod_Gilde == 8)
				{
					Mod_GottMana = 1000/hero.attribute[ATR_MANA_MAX];
				};
				if (Mod_Gilde == 1)
				|| (Mod_Gilde == 2)
				|| (Mod_Gilde == 3)
				|| (Mod_Gilde == 4)
				|| (Mod_Gilde == 19)
				|| (Mod_Gilde == 5)
				{
					Mod_GottDamage = 5;
				};

				Mod_GottHP = 500/hero.attribute[ATR_HITPOINTS_MAX];
				Mod_GottProtection = 5;
				Mod_GottInnos = 5;
			};

			hero.attribute[ATR_MANA_MAX] += Mod_GottMana;
			hero.attribute[ATR_MANA] += Mod_GottMana;
			hero.attribute[ATR_HITPOINTS_MAX] += Mod_GottHP;
			hero.attribute[ATR_HITPOINTS] += Mod_GottHP;
			hero.protection[PROT_EDGE] += Mod_GottProtection*1000;
			hero.protection[PROT_BLUNT] += Mod_GottProtection*1000;
			hero.protection[PROT_POINT] += Mod_GottProtection*1000;
			hero.protection[PROT_MAGIC] += Mod_GottProtection;
			hero.protection[PROT_FIRE] += Mod_GottProtection;

			hero.aivar[AIV_Damage] += Mod_GottHP;
		}
		else if (Mod_Gottstatus < 9)
		&& (Mod_HatInnosBonus == TRUE)
		{
			Mod_HatInnosBonus = FALSE;

			AI_PrintScreen	("Innos nimmt dir seinen Segen!", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

			hero.attribute[ATR_MANA] -= Mod_GottMana;
			hero.attribute[ATR_MANA_MAX] -= Mod_GottMana;
			hero.protection[PROT_EDGE] -= Mod_GottProtection*1000;
			hero.protection[PROT_BLUNT] -= Mod_GottProtection*1000;
			hero.protection[PROT_POINT] -= Mod_GottProtection*1000;
			hero.protection[PROT_MAGIC] -= Mod_GottProtection;
			hero.protection[PROT_FIRE] -= Mod_GottProtection;

			if (hero.attribute[ATR_HITPOINTS] > Mod_GottHP)
			{
				hero.attribute[ATR_HITPOINTS] -= Mod_GottHP;

				hero.aivar[AIV_Damage] -= Mod_GottHP;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] = 1;

				hero.aivar[AIV_Damage] = 1;
			};

			hero.attribute[ATR_HITPOINTS_MAX] -= Mod_GottHP;

			Mod_GottDex = 0;
			Mod_GottStr = 0;
			Mod_GottMana = 0;
			Mod_GottHP = 0;
			Mod_GottProtection = 0;
			Mod_GottDamage = 0;
			Mod_GottAdanos = 0;
			Mod_GottInnos = 0;
			Mod_GottBeliar = 0;
		};
	}
	else if (Wld_IsRaining())
	&& (Mod_GottCooldown == 0)
	{
		if (Mod_HatBeliarBonus == TRUE)
		{
			Mod_HatBeliarBonus = FALSE;

			AI_PrintScreen	("Beliar nimmt dir seinen Segen!", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

			hero.attribute[ATR_MANA] -= Mod_GottMana;
			hero.attribute[ATR_MANA_MAX] -= Mod_GottMana;
			hero.protection[PROT_EDGE] -= Mod_GottProtection*1000;
			hero.protection[PROT_BLUNT] -= Mod_GottProtection*1000;
			hero.protection[PROT_POINT] -= Mod_GottProtection*1000;
			hero.protection[PROT_MAGIC] -= Mod_GottProtection;
			hero.protection[PROT_FIRE] -= Mod_GottProtection;

			if (hero.attribute[ATR_HITPOINTS] > Mod_GottHP)
			{
				hero.attribute[ATR_HITPOINTS] -= Mod_GottHP;

				hero.aivar[AIV_Damage] -= Mod_GottHP;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] = 1;

				hero.aivar[AIV_Damage] = 1;
			};

			hero.attribute[ATR_HITPOINTS_MAX] -= Mod_GottHP;

			Mod_GottDex = 0;
			Mod_GottStr = 0;
			Mod_GottMana = 0;
			Mod_GottHP = 0;
			Mod_GottProtection = 0;
			Mod_GottDamage = 0;
			Mod_GottAdanos = 0;
			Mod_GottInnos = 0;
			Mod_GottBeliar = 0;
		};

		if (Mod_HatInnosBonus == TRUE)
		{
			Mod_HatInnosBonus = FALSE;

			AI_PrintScreen	("Innos nimmt dir seinen Segen!", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

			hero.attribute[ATR_MANA] -= Mod_GottMana;
			hero.attribute[ATR_MANA_MAX] -= Mod_GottMana;
			hero.protection[PROT_EDGE] -= Mod_GottProtection*1000;
			hero.protection[PROT_BLUNT] -= Mod_GottProtection*1000;
			hero.protection[PROT_POINT] -= Mod_GottProtection*1000;
			hero.protection[PROT_MAGIC] -= Mod_GottProtection;
			hero.protection[PROT_FIRE] -= Mod_GottProtection;

			if (hero.attribute[ATR_HITPOINTS] > Mod_GottHP)
			{
				hero.attribute[ATR_HITPOINTS] -= Mod_GottHP;

				hero.aivar[AIV_Damage] -= Mod_GottHP;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] = 1;

				hero.aivar[AIV_Damage] = 1;
			};

			hero.attribute[ATR_HITPOINTS_MAX] -= Mod_GottHP;

			Mod_GottDex = 0;
			Mod_GottStr = 0;
			Mod_GottMana = 0;
			Mod_GottHP = 0;
			Mod_GottProtection = 0;
			Mod_GottDamage = 0;
			Mod_GottAdanos = 0;
			Mod_GottInnos = 0;
			Mod_GottBeliar = 0;
		};
		if ((Mod_Gottstatus == 5)
		|| (Mod_Gottstatus == 6)
		|| (Mod_Gottstatus == 7)
		|| (Mod_Gottstatus == 8))
		&& (Mod_HatAdanosBonus == FALSE)
		{
			Mod_HatAdanosBonus = TRUE;

			AI_PrintScreen	("Adanos gibt dir seinen Segen!", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

			if (Mod_Gottstatus == 5)
			{
				if (Mod_Gilde == 9)
				|| (Mod_Gilde == 10)
				|| (Mod_Gilde == 11)
				{
					Mod_GottMana = 4000/hero.attribute[ATR_MANA_MAX];
				};
				if (Mod_Gilde == 9)
				|| (Mod_Gilde == 17)
				|| (Mod_Gilde == 18)
				|| (Mod_Gilde == 4)
				|| (Mod_Gilde == 19)
				|| (Mod_Gilde == 5)
				{
					Mod_GottDamage = 20;
				};

				Mod_GottHP = 2000/hero.attribute[ATR_HITPOINTS_MAX];
				Mod_GottProtection = 20;
				Mod_GottAdanos = 100;
			}
			else if (Mod_Gottstatus == 6)
			{
				if (Mod_Gilde == 9)
				|| (Mod_Gilde == 10)
				|| (Mod_Gilde == 11)
				{
					Mod_GottMana = 3000/hero.attribute[ATR_MANA_MAX];
				};
				if (Mod_Gilde == 9)
				|| (Mod_Gilde == 17)
				|| (Mod_Gilde == 18)
				|| (Mod_Gilde == 4)
				|| (Mod_Gilde == 19)
				|| (Mod_Gilde == 5)
				{
					Mod_GottDamage = 15;
				};

				Mod_GottHP = 1500/hero.attribute[ATR_HITPOINTS_MAX];
				Mod_GottProtection = 15;
				Mod_GottAdanos = 50;
			}
			else if (Mod_Gottstatus == 7)
			{
				if (Mod_Gilde == 9)
				|| (Mod_Gilde == 10)
				|| (Mod_Gilde == 11)
				{
					Mod_GottMana = 2000/hero.attribute[ATR_MANA_MAX];
				};
				if (Mod_Gilde == 9)
				|| (Mod_Gilde == 17)
				|| (Mod_Gilde == 18)
				|| (Mod_Gilde == 4)
				|| (Mod_Gilde == 19)
				|| (Mod_Gilde == 5)
				{
					Mod_GottDamage = 10;
				};

				Mod_GottHP = 1000/hero.attribute[ATR_HITPOINTS_MAX];
				Mod_GottProtection = 10;
				Mod_GottAdanos = 25;
			}
			else if (Mod_Gottstatus == 8)
			{
				if (Mod_Gilde == 9)
				|| (Mod_Gilde == 10)
				|| (Mod_Gilde == 11)
				{
					Mod_GottMana = 1000/hero.attribute[ATR_MANA_MAX];
				};
				if (Mod_Gilde == 9)
				|| (Mod_Gilde == 17)
				|| (Mod_Gilde == 18)
				|| (Mod_Gilde == 4)
				|| (Mod_Gilde == 19)
				|| (Mod_Gilde == 5)
				{
					Mod_GottDamage = 5;
				};

				Mod_GottHP = 500/hero.attribute[ATR_HITPOINTS_MAX];
				Mod_GottProtection = 5;
				Mod_GottAdanos = 10;
			};

			hero.attribute[ATR_MANA_MAX] += Mod_GottMana;
			hero.attribute[ATR_MANA] += Mod_GottMana;
			hero.attribute[ATR_HITPOINTS_MAX] += Mod_GottHP;
			hero.attribute[ATR_HITPOINTS] += Mod_GottHP;
			hero.protection[PROT_EDGE] += Mod_GottProtection*1000;
			hero.protection[PROT_BLUNT] += Mod_GottProtection*1000;
			hero.protection[PROT_POINT] += Mod_GottProtection*1000;
			hero.protection[PROT_MAGIC] += Mod_GottProtection;
			hero.protection[PROT_FIRE] += Mod_GottProtection;

			hero.aivar[AIV_Damage] += Mod_GottHP;
		}
		else if ((Mod_Gottstatus < 5)
		|| (Mod_GottStatus > 8))
		&& (Mod_HatAdanosBonus == TRUE)
		{
			Mod_HatAdanosBonus = FALSE;

			AI_PrintScreen	("Adanos nimmt dir seinen Segen!", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

			hero.attribute[ATR_MANA] -= Mod_GottMana;
			hero.attribute[ATR_MANA_MAX] -= Mod_GottMana;
			hero.protection[PROT_EDGE] -= Mod_GottProtection*1000;
			hero.protection[PROT_BLUNT] -= Mod_GottProtection*1000;
			hero.protection[PROT_POINT] -= Mod_GottProtection*1000;
			hero.protection[PROT_MAGIC] -= Mod_GottProtection;
			hero.protection[PROT_FIRE] -= Mod_GottProtection;

			if (hero.attribute[ATR_HITPOINTS] > Mod_GottHP)
			{
				hero.attribute[ATR_HITPOINTS] -= Mod_GottHP;

				hero.aivar[AIV_Damage] -= Mod_GottHP;
			}
			else
			{
				hero.attribute[ATR_HITPOINTS] = 1;

				hero.aivar[AIV_Damage] = 1;
			};

			hero.attribute[ATR_HITPOINTS_MAX] -= Mod_GottHP;

			Mod_GottDex = 0;
			Mod_GottStr = 0;
			Mod_GottMana = 0;
			Mod_GottHP = 0;
			Mod_GottProtection = 0;
			Mod_GottDamage = 0;
			Mod_GottAdanos = 0;
			Mod_GottInnos = 0;
			Mod_GottBeliar = 0;
		};
	};	
};