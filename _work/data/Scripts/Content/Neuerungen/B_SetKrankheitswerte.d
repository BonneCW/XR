FUNC VOID B_SetBissDerFaeulnisWerte (var int hp1, var int mana1, var int str1, var int dex1, var int hp2, var int mana2, var int str2, var int dex2, var int hp3, var int mana3, var int str3, var int dex3)
{
	if (hero.attribute[ATR_HITPOINTS_MAX] <= hp1+1)
	{
		BissDerFaeulnis_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
	}
	else
	{
		BissDerFaeulnis_Stufe01_HP = hp1;
	};

	if (hero.attribute[ATR_MANA_MAX] < mana1)
	{
		BissDerFaeulnis_Stufe01_MANA = hero.attribute[ATR_MANA_MAX];
	}
	else
	{
		BissDerFaeulnis_Stufe01_MANA = mana1;
	};

	if (hero.attribute[ATR_STRENGTH] < str1)
	{
		BissDerFaeulnis_Stufe01_STR = hero.attribute[ATR_STRENGTH];
	}
	else
	{
		BissDerFaeulnis_Stufe01_STR = str1;
	};

	if (hero.attribute[ATR_DEXTERITY] < dex1)
	{
		BissDerFaeulnis_Stufe01_DEX = hero.attribute[ATR_DEXTERITY];
	}
	else
	{
		BissDerFaeulnis_Stufe01_DEX = dex1;
	};

	if (hero.attribute[ATR_HITPOINTS_MAX] <= hp2+1)
	{
		BissDerFaeulnis_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
	}
	else
	{
		BissDerFaeulnis_Stufe02_HP = hp2;
	};

	if (hero.attribute[ATR_MANA_MAX] < mana2)
	{
		BissDerFaeulnis_Stufe02_MANA = hero.attribute[ATR_MANA_MAX];
	}
	else
	{
		BissDerFaeulnis_Stufe02_MANA = mana2;
	};

	if (hero.attribute[ATR_STRENGTH] < str2)
	{
		BissDerFaeulnis_Stufe02_STR = hero.attribute[ATR_STRENGTH];
	}
	else
	{
		BissDerFaeulnis_Stufe02_STR = str2;
	};

	if (hero.attribute[ATR_DEXTERITY] < dex2)
	{
		BissDerFaeulnis_Stufe02_DEX = hero.attribute[ATR_DEXTERITY];
	}
	else
	{
		BissDerFaeulnis_Stufe02_DEX = dex2;
	};

	if (hero.attribute[ATR_HITPOINTS_MAX] <= hp3+1)
	{
		BissDerFaeulnis_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
	}
	else
	{
		BissDerFaeulnis_Stufe03_HP = hp3;
	};

	if (hero.attribute[ATR_MANA_MAX] < mana3)
	{
		BissDerFaeulnis_Stufe03_MANA = hero.attribute[ATR_MANA_MAX];
	}
	else
	{
		BissDerFaeulnis_Stufe03_MANA = mana3;
	};

	if (hero.attribute[ATR_STRENGTH] < str3)
	{
		BissDerFaeulnis_Stufe03_STR = hero.attribute[ATR_STRENGTH];
	}
	else
	{
		BissDerFaeulnis_Stufe03_STR = str3;
	};

	if (hero.attribute[ATR_DEXTERITY] < dex3)
	{
		BissDerFaeulnis_Stufe03_DEX = hero.attribute[ATR_DEXTERITY];
	}
	else
	{
		BissDerFaeulnis_Stufe03_DEX = dex3;
	};
};

FUNC VOID B_SetHauchDerPestilenzWerte (var int hp1, var int mana1, var int str1, var int dex1, var int hp2, var int mana2, var int str2, var int dex2, var int hp3, var int mana3, var int str3, var int dex3)
{
	if (hero.attribute[ATR_HITPOINTS_MAX] <= hp1+1)
	{
		HauchDerPestilenz_Stufe01_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
	}
	else
	{
		HauchDerPestilenz_Stufe01_HP = hp1;
	};

	if (hero.attribute[ATR_MANA_MAX] < mana1)
	{
		HauchDerPestilenz_Stufe01_MANA = hero.attribute[ATR_MANA_MAX];
	}
	else
	{
		HauchDerPestilenz_Stufe01_MANA = mana1;
	};

	if (hero.attribute[ATR_STRENGTH] < str1)
	{
		HauchDerPestilenz_Stufe01_STR = hero.attribute[ATR_STRENGTH];
	}
	else
	{
		HauchDerPestilenz_Stufe01_STR = str1;
	};

	if (hero.attribute[ATR_DEXTERITY] < dex1)
	{
		HauchDerPestilenz_Stufe01_DEX = hero.attribute[ATR_DEXTERITY];
	}
	else
	{
		HauchDerPestilenz_Stufe01_DEX = dex1;
	};

	if (hero.attribute[ATR_HITPOINTS_MAX] <= hp2+1)
	{
		HauchDerPestilenz_Stufe02_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
	}
	else
	{
		HauchDerPestilenz_Stufe02_HP = hp2;
	};

	if (hero.attribute[ATR_MANA_MAX] < mana2)
	{
		HauchDerPestilenz_Stufe02_MANA = hero.attribute[ATR_MANA_MAX];
	}
	else
	{
		HauchDerPestilenz_Stufe02_MANA = mana2;
	};

	if (hero.attribute[ATR_STRENGTH] < str2)
	{
		HauchDerPestilenz_Stufe02_STR = hero.attribute[ATR_STRENGTH];
	}
	else
	{
		HauchDerPestilenz_Stufe02_STR = str2;
	};

	if (hero.attribute[ATR_DEXTERITY] < dex2)
	{
		HauchDerPestilenz_Stufe02_DEX = hero.attribute[ATR_DEXTERITY];
	}
	else
	{
		HauchDerPestilenz_Stufe02_DEX = dex2;
	};

	if (hero.attribute[ATR_HITPOINTS_MAX] <= hp3+1)
	{
		HauchDerPestilenz_Stufe03_HP = hero.attribute[ATR_HITPOINTS_MAX]-2;
	}
	else
	{
		HauchDerPestilenz_Stufe03_HP = hp3;
	};

	if (hero.attribute[ATR_MANA_MAX] < mana3)
	{
		HauchDerPestilenz_Stufe03_MANA = hero.attribute[ATR_MANA_MAX];
	}
	else
	{
		HauchDerPestilenz_Stufe03_MANA = mana3;
	};

	if (hero.attribute[ATR_STRENGTH] < str3)
	{
		HauchDerPestilenz_Stufe03_STR = hero.attribute[ATR_STRENGTH];
	}
	else
	{
		HauchDerPestilenz_Stufe03_STR = str3;
	};

	if (hero.attribute[ATR_DEXTERITY] < dex3)
	{
		HauchDerPestilenz_Stufe03_DEX = hero.attribute[ATR_DEXTERITY];
	}
	else
	{
		HauchDerPestilenz_Stufe03_DEX = dex3;
	};
};