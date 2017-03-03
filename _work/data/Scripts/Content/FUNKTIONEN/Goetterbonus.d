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
var int Segen_Handle;

FUNC INT Min(VAR INT a, VAR INT b) {
	if (a < b) {
		return a;
	} else {
		return b;
	};
};

FUNC VOID Goetterbonus()
{
	if (!Hlp_IsValidHandle(Segen_Handle))
	{
		Segen_Handle = View_CreatePxl(Print_Screen[PS_X]-60, 50, Print_Screen[PS_X]-20, 90);
		View_SetTexture(Segen_Handle, "SEGEN_INNOS.TGA");
	};

	if (Wld_IsTime(20,00,08,00))
	&& (!Wld_IsRaining())
	&& (Mod_GottCooldown == 0)
	{
		if (Mod_HatInnosBonus == TRUE)
		{
			Mod_HatInnosBonus = FALSE;

			hero.attribute[ATR_MANA] -= Mod_GottMana;
			hero.attribute[ATR_MANA_MAX] -= Mod_GottMana;
			hero.protection[PROT_EDGE] -= Min(Mod_GottProtection*1000, hero.protection[PROT_EDGE]);
			hero.protection[PROT_BLUNT] -= Min(Mod_GottProtection*1000, hero.protection[PROT_BLUNT]);
			hero.protection[PROT_POINT] -= Min(Mod_GottProtection*1000, hero.protection[PROT_POINT]);
			hero.protection[PROT_MAGIC] -= Min(Mod_GottProtection, hero.protection[PROT_MAGIC]);
			hero.protection[PROT_FIRE] -= Min(Mod_GottProtection, hero.protection[PROT_FIRE]);

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

			View_Close(Segen_Handle);
		};

		if (Mod_HatAdanosBonus == TRUE)
		{
			Mod_HatAdanosBonus = FALSE;

			hero.attribute[ATR_MANA] -= Mod_GottMana;
			hero.attribute[ATR_MANA_MAX] -= Mod_GottMana;
			hero.protection[PROT_EDGE] -= Min(Mod_GottProtection*1000, hero.protection[PROT_EDGE]);
			hero.protection[PROT_BLUNT] -= Min(Mod_GottProtection*1000, hero.protection[PROT_BLUNT]);
			hero.protection[PROT_POINT] -= Min(Mod_GottProtection*1000, hero.protection[PROT_POINT]);
			hero.protection[PROT_MAGIC] -= Min(Mod_GottProtection, hero.protection[PROT_MAGIC]);
			hero.protection[PROT_FIRE] -= Min(Mod_GottProtection, hero.protection[PROT_FIRE]);

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

			View_Close(Segen_Handle);
		};

		if ((Mod_Gottstatus == 1)
		|| (Mod_Gottstatus == 2)
		|| (Mod_Gottstatus == 3)
		|| (Mod_Gottstatus == 4))
		&& (Mod_HatBeliarBonus == FALSE)
		{
			Mod_HatBeliarBonus = TRUE;

			if (Mod_Gottstatus == 1)
			{
				if (Mod_Gilde == 12)
				|| (Mod_Gilde == 13)
				|| (Mod_Gilde == 14)
				{
					if (hero.attribute[ATR_MANA_MAX] > 0) {
						Mod_GottMana = 4000 / hero.attribute[ATR_MANA_MAX];
					} else {
						Mod_GottMana = 10;
					};
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

				if (hero.attribute[ATR_HITPOINTS_MAX] > 0) {
					Mod_GottHP = 2000 / hero.attribute[ATR_HITPOINTS_MAX];
				} else {
					Mod_GottHP = 0;
				};
				Mod_GottProtection = 20;
				Mod_GottBeliar = 20;
			}
			else if (Mod_Gottstatus == 2)
			{
				if (Mod_Gilde == 12)
				|| (Mod_Gilde == 13)
				|| (Mod_Gilde == 14)
				{
					if (hero.attribute[ATR_MANA_MAX] > 0) {
						Mod_GottMana = 3000 / hero.attribute[ATR_MANA_MAX];
					} else {
						Mod_GottMana = 10;
					};
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

				if (hero.attribute[ATR_HITPOINTS_MAX] > 0) {
					Mod_GottHP = 1500 / hero.attribute[ATR_HITPOINTS_MAX];
				} else {
					Mod_GottHP = 0;
				};
				Mod_GottProtection = 15;
				Mod_GottBeliar = 15;
			}
			else if (Mod_Gottstatus == 3)
			{
				if (Mod_Gilde == 12)
				|| (Mod_Gilde == 13)
				|| (Mod_Gilde == 14)
				{
					if (hero.attribute[ATR_MANA_MAX] > 0) {
						Mod_GottMana = 2000 / hero.attribute[ATR_MANA_MAX];
					} else {
						Mod_GottMana = 10;
					};
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

				if (hero.attribute[ATR_HITPOINTS_MAX] > 0) {
					Mod_GottHP = 1000 / hero.attribute[ATR_HITPOINTS_MAX];
				} else {
					Mod_GottHP = 0;
				};
				Mod_GottProtection = 10;
				Mod_GottBeliar = 10;
			}
			else if (Mod_Gottstatus == 4)
			{
				if (Mod_Gilde == 12)
				|| (Mod_Gilde == 13)
				|| (Mod_Gilde == 14)
				{
					if (hero.attribute[ATR_MANA_MAX] > 0) {
						Mod_GottMana = 1000 / hero.attribute[ATR_MANA_MAX];
					} else {
						Mod_GottMana = 10;
					};
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

				if (hero.attribute[ATR_HITPOINTS_MAX] > 0) {
					Mod_GottHP = 500 / hero.attribute[ATR_HITPOINTS_MAX];
				} else {
					Mod_GottHP = 0;
				};
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

			View_SetTexture(Segen_Handle, "SEGEN_BELIAR.TGA");

			View_Open(Segen_Handle);
		}
		else if (Mod_Gottstatus > 4)
		&& (Mod_HatBeliarBonus == TRUE)
		{
			Mod_HatBeliarBonus = FALSE;

			hero.attribute[ATR_MANA] -= Mod_GottMana;
			hero.attribute[ATR_MANA_MAX] -= Mod_GottMana;
			hero.protection[PROT_EDGE] -= Min(Mod_GottProtection*1000, hero.protection[PROT_EDGE]);
			hero.protection[PROT_BLUNT] -= Min(Mod_GottProtection*1000, hero.protection[PROT_BLUNT]);
			hero.protection[PROT_POINT] -= Min(Mod_GottProtection*1000, hero.protection[PROT_POINT]);
			hero.protection[PROT_MAGIC] -= Min(Mod_GottProtection, hero.protection[PROT_MAGIC]);
			hero.protection[PROT_FIRE] -= Min(Mod_GottProtection, hero.protection[PROT_FIRE]);

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

			View_Close(Segen_Handle);
		};
	}
	else if (Wld_IsTime(08,00,20,00))
	&& (!Wld_IsRaining())
	&& (Mod_GottCooldown == 0)
	{
		if (Mod_HatBeliarBonus == TRUE)
		{
			Mod_HatBeliarBonus = FALSE;

			hero.attribute[ATR_MANA] -= Mod_GottMana;
			hero.attribute[ATR_MANA_MAX] -= Mod_GottMana;
			hero.protection[PROT_EDGE] -= Min(Mod_GottProtection*1000, hero.protection[PROT_EDGE]);
			hero.protection[PROT_BLUNT] -= Min(Mod_GottProtection*1000, hero.protection[PROT_BLUNT]);
			hero.protection[PROT_POINT] -= Min(Mod_GottProtection*1000, hero.protection[PROT_POINT]);
			hero.protection[PROT_MAGIC] -= Min(Mod_GottProtection, hero.protection[PROT_MAGIC]);
			hero.protection[PROT_FIRE] -= Min(Mod_GottProtection, hero.protection[PROT_FIRE]);

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

			View_Close(Segen_Handle);
		};

		if (Mod_HatAdanosBonus == TRUE)
		{
			Mod_HatAdanosBonus = FALSE;

			hero.attribute[ATR_MANA] -= Mod_GottMana;
			hero.attribute[ATR_MANA_MAX] -= Mod_GottMana;
			hero.protection[PROT_EDGE] -= Min(Mod_GottProtection*1000, hero.protection[PROT_EDGE]);
			hero.protection[PROT_BLUNT] -= Min(Mod_GottProtection*1000, hero.protection[PROT_BLUNT]);
			hero.protection[PROT_POINT] -= Min(Mod_GottProtection*1000, hero.protection[PROT_POINT]);
			hero.protection[PROT_MAGIC] -= Min(Mod_GottProtection, hero.protection[PROT_MAGIC]);
			hero.protection[PROT_FIRE] -= Min(Mod_GottProtection, hero.protection[PROT_FIRE]);

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

			View_Close(Segen_Handle);
		};

		if ((Mod_Gottstatus == 9)
		|| (Mod_Gottstatus == 10)
		|| (Mod_Gottstatus == 11)
		|| (Mod_Gottstatus == 12))
		&& (Mod_HatInnosBonus == FALSE)
		{
			Mod_HatInnosBonus = TRUE;

			if (Mod_Gottstatus == 9)
			{
				if (Mod_Gilde == 6)
				|| (Mod_Gilde == 7)
				|| (Mod_Gilde == 8)
				{
					if (hero.attribute[ATR_MANA_MAX] > 0) {
						Mod_GottMana = 4000 / hero.attribute[ATR_MANA_MAX];
					} else {
						Mod_GottMana = 10;
					};
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

				if (hero.attribute[ATR_HITPOINTS_MAX] > 0) {
					Mod_GottHP = 2000 / hero.attribute[ATR_HITPOINTS_MAX];
				} else {
					Mod_GottHP = 0;
				};
				Mod_GottProtection = 20;
				Mod_GottInnos = 20;
			}
			else if (Mod_Gottstatus == 10)
			{
				if (Mod_Gilde == 6)
				|| (Mod_Gilde == 7)
				|| (Mod_Gilde == 8)
				{
					if (hero.attribute[ATR_MANA_MAX] > 0) {
						Mod_GottMana = 3000 / hero.attribute[ATR_MANA_MAX];
					} else {
						Mod_GottMana = 10;
					};
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

				if (hero.attribute[ATR_HITPOINTS_MAX] > 0) {
					Mod_GottHP = 1500 / hero.attribute[ATR_HITPOINTS_MAX];
				} else {
					Mod_GottHP = 0;
				};
				Mod_GottProtection = 15;
				Mod_GottInnos = 15;
			}
			else if (Mod_Gottstatus == 11)
			{
				if (Mod_Gilde == 6)
				|| (Mod_Gilde == 7)
				|| (Mod_Gilde == 8)
				{
					if (hero.attribute[ATR_MANA_MAX] > 0) {
						Mod_GottMana = 2000 / hero.attribute[ATR_MANA_MAX];
					} else {
						Mod_GottMana = 10;
					};
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

				if (hero.attribute[ATR_HITPOINTS_MAX] > 0) {
					Mod_GottHP = 1000 / hero.attribute[ATR_HITPOINTS_MAX];
				} else {
					Mod_GottHP = 0;
				};
				Mod_GottProtection = 10;
				Mod_GottInnos = 10;
			}
			else if (Mod_Gottstatus == 12)
			{
				if (Mod_Gilde == 6)
				|| (Mod_Gilde == 7)
				|| (Mod_Gilde == 8)
				{
					if (hero.attribute[ATR_MANA_MAX] > 0) {
						Mod_GottMana = 1000 / hero.attribute[ATR_MANA_MAX];
					} else {
						Mod_GottMana = 10;
					};
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

				if (hero.attribute[ATR_HITPOINTS_MAX] > 0) {
					Mod_GottHP = 500 / hero.attribute[ATR_HITPOINTS_MAX];
				} else {
					Mod_GottHP = 0;
				};
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

			View_SetTexture(Segen_Handle, "SEGEN_INNOS.TGA");

			View_Open(Segen_Handle);
		}
		else if (Mod_Gottstatus < 9)
		&& (Mod_HatInnosBonus == TRUE)
		{
			Mod_HatInnosBonus = FALSE;

			hero.attribute[ATR_MANA] -= Mod_GottMana;
			hero.attribute[ATR_MANA_MAX] -= Mod_GottMana;
			hero.protection[PROT_EDGE] -= Min(Mod_GottProtection*1000, hero.protection[PROT_EDGE]);
			hero.protection[PROT_BLUNT] -= Min(Mod_GottProtection*1000, hero.protection[PROT_BLUNT]);
			hero.protection[PROT_POINT] -= Min(Mod_GottProtection*1000, hero.protection[PROT_POINT]);
			hero.protection[PROT_MAGIC] -= Min(Mod_GottProtection, hero.protection[PROT_MAGIC]);
			hero.protection[PROT_FIRE] -= Min(Mod_GottProtection, hero.protection[PROT_FIRE]);

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

			View_Close(Segen_Handle);
		};
	}
	else if (Wld_IsRaining())
	&& (Mod_GottCooldown == 0)
	{
		if (Mod_HatBeliarBonus == TRUE)
		{
			Mod_HatBeliarBonus = FALSE;

			hero.attribute[ATR_MANA] -= Mod_GottMana;
			hero.attribute[ATR_MANA_MAX] -= Mod_GottMana;
			hero.protection[PROT_EDGE] -= Min(Mod_GottProtection*1000, hero.protection[PROT_EDGE]);
			hero.protection[PROT_BLUNT] -= Min(Mod_GottProtection*1000, hero.protection[PROT_BLUNT]);
			hero.protection[PROT_POINT] -= Min(Mod_GottProtection*1000, hero.protection[PROT_POINT]);
			hero.protection[PROT_MAGIC] -= Min(Mod_GottProtection, hero.protection[PROT_MAGIC]);
			hero.protection[PROT_FIRE] -= Min(Mod_GottProtection, hero.protection[PROT_FIRE]);

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

			View_Close(Segen_Handle);
		};

		if (Mod_HatInnosBonus == TRUE)
		{
			Mod_HatInnosBonus = FALSE;

			hero.attribute[ATR_MANA] -= Mod_GottMana;
			hero.attribute[ATR_MANA_MAX] -= Mod_GottMana;
			hero.protection[PROT_EDGE] -= Min(Mod_GottProtection*1000, hero.protection[PROT_EDGE]);
			hero.protection[PROT_BLUNT] -= Min(Mod_GottProtection*1000, hero.protection[PROT_BLUNT]);
			hero.protection[PROT_POINT] -= Min(Mod_GottProtection*1000, hero.protection[PROT_POINT]);
			hero.protection[PROT_MAGIC] -= Min(Mod_GottProtection, hero.protection[PROT_MAGIC]);
			hero.protection[PROT_FIRE] -= Min(Mod_GottProtection, hero.protection[PROT_FIRE]);

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

			View_Close(Segen_Handle);
		};
		if ((Mod_Gottstatus == 5)
		|| (Mod_Gottstatus == 6)
		|| (Mod_Gottstatus == 7)
		|| (Mod_Gottstatus == 8))
		&& (Mod_HatAdanosBonus == FALSE)
		{
			Mod_HatAdanosBonus = TRUE;

			if (Mod_Gottstatus == 5)
			{
				if (Mod_Gilde == 9)
				|| (Mod_Gilde == 10)
				|| (Mod_Gilde == 11)
				{
					if (hero.attribute[ATR_MANA_MAX] > 0) {
						Mod_GottMana = 4000 / hero.attribute[ATR_MANA_MAX];
					} else {
						Mod_GottMana = 10;
					};
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

				if (hero.attribute[ATR_HITPOINTS_MAX] > 0) {
					Mod_GottHP = 2000 / hero.attribute[ATR_HITPOINTS_MAX];
				} else {
					Mod_GottHP = 0;
				};
				Mod_GottProtection = 20;
				Mod_GottAdanos = 20;
			}
			else if (Mod_Gottstatus == 6)
			{
				if (Mod_Gilde == 9)
				|| (Mod_Gilde == 10)
				|| (Mod_Gilde == 11)
				{
					if (hero.attribute[ATR_MANA_MAX] > 0) {
						Mod_GottMana = 3000 / hero.attribute[ATR_MANA_MAX];
					} else {
						Mod_GottMana = 10;
					};
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

				if (hero.attribute[ATR_HITPOINTS_MAX] > 0) {
					Mod_GottHP = 1500 / hero.attribute[ATR_HITPOINTS_MAX];
				} else {
					Mod_GottHP = 0;
				};
				Mod_GottProtection = 15;
				Mod_GottAdanos = 15;
			}
			else if (Mod_Gottstatus == 7)
			{
				if (Mod_Gilde == 9)
				|| (Mod_Gilde == 10)
				|| (Mod_Gilde == 11)
				{
					if (hero.attribute[ATR_MANA_MAX] > 0) {
						Mod_GottMana = 2000 / hero.attribute[ATR_MANA_MAX];
					} else {
						Mod_GottMana = 10;
					};
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

				if (hero.attribute[ATR_HITPOINTS_MAX] > 0) {
					Mod_GottHP = 1000 / hero.attribute[ATR_HITPOINTS_MAX];
				} else {
					Mod_GottHP = 0;
				};
				Mod_GottProtection = 10;
				Mod_GottAdanos = 10;
			}
			else if (Mod_Gottstatus == 8)
			{
				if (Mod_Gilde == 9)
				|| (Mod_Gilde == 10)
				|| (Mod_Gilde == 11)
				{
					if (hero.attribute[ATR_MANA_MAX] > 0) {
						Mod_GottMana = 1000 / hero.attribute[ATR_MANA_MAX];
					} else {
						Mod_GottMana = 10;
					};
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

				if (hero.attribute[ATR_HITPOINTS_MAX] > 0) {
					Mod_GottHP = 500 / hero.attribute[ATR_HITPOINTS_MAX];
				} else {
					Mod_GottHP = 0;
				};
				Mod_GottProtection = 5;
				Mod_GottAdanos = 5;
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

			View_SetTexture(Segen_Handle, "SEGEN_ADANOS.TGA");

			View_Open(Segen_Handle);
		}
		else if ((Mod_Gottstatus < 5)
		|| (Mod_GottStatus > 8))
		&& (Mod_HatAdanosBonus == TRUE)
		{
			Mod_HatAdanosBonus = FALSE;

			hero.attribute[ATR_MANA] -= Mod_GottMana;
			hero.attribute[ATR_MANA_MAX] -= Mod_GottMana;
			hero.protection[PROT_EDGE] -= Min(Mod_GottProtection*1000, hero.protection[PROT_EDGE]);
			hero.protection[PROT_BLUNT] -= Min(Mod_GottProtection*1000, hero.protection[PROT_BLUNT]);
			hero.protection[PROT_POINT] -= Min(Mod_GottProtection*1000, hero.protection[PROT_POINT]);
			hero.protection[PROT_MAGIC] -= Min(Mod_GottProtection, hero.protection[PROT_MAGIC]);
			hero.protection[PROT_FIRE] -= Min(Mod_GottProtection, hero.protection[PROT_FIRE]);

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

			View_Close(Segen_Handle);
		};
	};	
};