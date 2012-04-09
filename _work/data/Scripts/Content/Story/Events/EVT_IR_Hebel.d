FUNC VOID IR_HEBEL_01_S0 ()
{
	if (Mod_IR_Hebel01 == 0)
	{
		Mod_Schrittweite = 1;

		Mod_IR_Hebel01 = 1;
	}
	else
	{
		Mod_Schrittweite = 2;

		Mod_IR_Hebel01 = 0;
	};

	if (Mod_IR_Hebel03 == 0)
	&& (Mod_IR_Hebel04 == 0)
	{
		Mod_Schrittweite += 1;
	}
	else if (Mod_IR_Hebel03 == 1)
	&& (Mod_IR_Hebel04 == 1)
	{
		Mod_Schrittweite -= 1;
	};

	if (Mod_IR_Light01_Pos == 1)
	{
		Wld_RemoveItem	(IR_BlueLight_01);
		Wld_InsertItem	(IR_RedLight_01, "FP_ITEM_LIGHT_01");
	}
	else if (Mod_IR_Light01_Pos == 2)
	{
		Wld_RemoveItem	(IR_BlueLight_02);
		Wld_InsertItem	(IR_RedLight_02, "FP_ITEM_LIGHT_02");
	}
	else if (Mod_IR_Light01_Pos == 3)
	{
		Wld_RemoveItem	(IR_BlueLight_03);
		Wld_InsertItem	(IR_RedLight_03, "FP_ITEM_LIGHT_03");
	}
	else if (Mod_IR_Light01_Pos == 4)
	{
		Wld_RemoveItem	(IR_BlueLight_04);
		Wld_InsertItem	(IR_RedLight_04, "FP_ITEM_LIGHT_05");
	}
	else if (Mod_IR_Light01_Pos == 5)
	{
		Wld_RemoveItem	(IR_BlueLight_05);
		Wld_InsertItem	(IR_RedLight_05, "FP_ITEM_LIGHT_05");
	}
	else if (Mod_IR_Light01_Pos == 6)
	{
		Wld_RemoveItem	(IR_BlueLight_06);
		Wld_InsertItem	(IR_RedLight_06, "FP_ITEM_LIGHT_06");
	}
	else if (Mod_IR_Light01_Pos == 7)
	{
		Wld_RemoveItem	(IR_BlueLight_07);
		Wld_InsertItem	(IR_RedLight_07, "FP_ITEM_LIGHT_07");
	}
	else if (Mod_IR_Light01_Pos == 8)
	{
		Wld_RemoveItem	(IR_BlueLight_08);
		Wld_InsertItem	(IR_RedLight_08, "FP_ITEM_LIGHT_08");
	};

	Mod_IR_Light01_Pos += Mod_Schrittweite;

	if (Mod_IR_Light01_Pos > 8)
	{
		Mod_IR_Light01_Pos -= 8;
	};

	if (Mod_IR_Light01_Pos == Mod_IR_Light02_Pos)
	{
		Mod_IR_Light01_Pos += 1;

		if (Mod_IR_Light01_Pos > 8)
		{
			Mod_IR_Light01_Pos -= 8;
		};
	};

	if (Mod_IR_Light01_Pos == 1)
	{
		Wld_RemoveItem	(IR_RedLight_01);
		Wld_InsertItem	(IR_BlueLight_01, "FP_ITEM_LIGHT_01");
	}
	else if (Mod_IR_Light01_Pos == 2)
	{
		Wld_RemoveItem	(IR_RedLight_02);
		Wld_InsertItem	(IR_BlueLight_02, "FP_ITEM_LIGHT_02");
	}
	else if (Mod_IR_Light01_Pos == 3)
	{
		Wld_RemoveItem	(IR_RedLight_03);
		Wld_InsertItem	(IR_BlueLight_03, "FP_ITEM_LIGHT_03");
	}
	else if (Mod_IR_Light01_Pos == 4)
	{
		Wld_RemoveItem	(IR_RedLight_04);
		Wld_InsertItem	(IR_BlueLight_04, "FP_ITEM_LIGHT_05");
	}
	else if (Mod_IR_Light01_Pos == 5)
	{
		Wld_RemoveItem	(IR_RedLight_05);
		Wld_InsertItem	(IR_BlueLight_05, "FP_ITEM_LIGHT_05");
	}
	else if (Mod_IR_Light01_Pos == 6)
	{
		Wld_RemoveItem	(IR_RedLight_06);
		Wld_InsertItem	(IR_BlueLight_06, "FP_ITEM_LIGHT_06");
	}
	else if (Mod_IR_Light01_Pos == 7)
	{
		Wld_RemoveItem	(IR_RedLight_07);
		Wld_InsertItem	(IR_BlueLight_07, "FP_ITEM_LIGHT_07");
	}
	else if (Mod_IR_Light01_Pos == 8)
	{
		Wld_RemoveItem	(IR_RedLight_08);
		Wld_InsertItem	(IR_BlueLight_08, "FP_ITEM_LIGHT_08");
	};
};

FUNC VOID IR_HEBEL_01_S1 ()
{
	if (Mod_IR_Hebel01 == 0)
	{
		Mod_Schrittweite = 1;

		Mod_IR_Hebel01 = 1;
	}
	else
	{
		Mod_Schrittweite = 2;

		Mod_IR_Hebel01 = 0;
	};

	if (Mod_IR_Hebel03 == 0)
	&& (Mod_IR_Hebel04 == 0)
	{
		Mod_Schrittweite += 1;
	}
	else if (Mod_IR_Hebel03 == 1)
	&& (Mod_IR_Hebel04 == 1)
	{
		Mod_Schrittweite -= 1;
	};

	if (Mod_IR_Light01_Pos == 1)
	{
		Wld_RemoveItem	(IR_BlueLight_01);
		Wld_InsertItem	(IR_RedLight_01, "FP_ITEM_LIGHT_01");
	}
	else if (Mod_IR_Light01_Pos == 2)
	{
		Wld_RemoveItem	(IR_BlueLight_02);
		Wld_InsertItem	(IR_RedLight_02, "FP_ITEM_LIGHT_02");
	}
	else if (Mod_IR_Light01_Pos == 3)
	{
		Wld_RemoveItem	(IR_BlueLight_03);
		Wld_InsertItem	(IR_RedLight_03, "FP_ITEM_LIGHT_03");
	}
	else if (Mod_IR_Light01_Pos == 4)
	{
		Wld_RemoveItem	(IR_BlueLight_04);
		Wld_InsertItem	(IR_RedLight_04, "FP_ITEM_LIGHT_05");
	}
	else if (Mod_IR_Light01_Pos == 5)
	{
		Wld_RemoveItem	(IR_BlueLight_05);
		Wld_InsertItem	(IR_RedLight_05, "FP_ITEM_LIGHT_05");
	}
	else if (Mod_IR_Light01_Pos == 6)
	{
		Wld_RemoveItem	(IR_BlueLight_06);
		Wld_InsertItem	(IR_RedLight_06, "FP_ITEM_LIGHT_06");
	}
	else if (Mod_IR_Light01_Pos == 7)
	{
		Wld_RemoveItem	(IR_BlueLight_07);
		Wld_InsertItem	(IR_RedLight_07, "FP_ITEM_LIGHT_07");
	}
	else if (Mod_IR_Light01_Pos == 8)
	{
		Wld_RemoveItem	(IR_BlueLight_08);
		Wld_InsertItem	(IR_RedLight_08, "FP_ITEM_LIGHT_08");
	};

	Mod_IR_Light01_Pos += Mod_Schrittweite;

	if (Mod_IR_Light01_Pos > 8)
	{
		Mod_IR_Light01_Pos -= 8;
	};

	if (Mod_IR_Light01_Pos == Mod_IR_Light02_Pos)
	{
		Mod_IR_Light01_Pos += 1;

		if (Mod_IR_Light01_Pos > 8)
		{
			Mod_IR_Light01_Pos -= 8;
		};
	};

	if (Mod_IR_Light01_Pos == 1)
	{
		Wld_RemoveItem	(IR_RedLight_01);
		Wld_InsertItem	(IR_BlueLight_01, "FP_ITEM_LIGHT_01");
	}
	else if (Mod_IR_Light01_Pos == 2)
	{
		Wld_RemoveItem	(IR_RedLight_02);
		Wld_InsertItem	(IR_BlueLight_02, "FP_ITEM_LIGHT_02");
	}
	else if (Mod_IR_Light01_Pos == 3)
	{
		Wld_RemoveItem	(IR_RedLight_03);
		Wld_InsertItem	(IR_BlueLight_03, "FP_ITEM_LIGHT_03");
	}
	else if (Mod_IR_Light01_Pos == 4)
	{
		Wld_RemoveItem	(IR_RedLight_04);
		Wld_InsertItem	(IR_BlueLight_04, "FP_ITEM_LIGHT_05");
	}
	else if (Mod_IR_Light01_Pos == 5)
	{
		Wld_RemoveItem	(IR_RedLight_05);
		Wld_InsertItem	(IR_BlueLight_05, "FP_ITEM_LIGHT_05");
	}
	else if (Mod_IR_Light01_Pos == 6)
	{
		Wld_RemoveItem	(IR_RedLight_06);
		Wld_InsertItem	(IR_BlueLight_06, "FP_ITEM_LIGHT_06");
	}
	else if (Mod_IR_Light01_Pos == 7)
	{
		Wld_RemoveItem	(IR_RedLight_07);
		Wld_InsertItem	(IR_BlueLight_07, "FP_ITEM_LIGHT_07");
	}
	else if (Mod_IR_Light01_Pos == 8)
	{
		Wld_RemoveItem	(IR_RedLight_08);
		Wld_InsertItem	(IR_BlueLight_08, "FP_ITEM_LIGHT_08");
	};
};

FUNC VOID IR_HEBEL_02_S0 ()
{
	if (Mod_IR_Hebel02 == 0)
	{
		Mod_Schrittweite = 1;

		Mod_IR_Hebel02 = 1;
	}
	else
	{
		Mod_Schrittweite = 2;

		Mod_IR_Hebel02 = 0;
	};

	if (Mod_IR_Hebel03 == 0)
	&& (Mod_IR_Hebel04 == 0)
	{
		Mod_Schrittweite += 1;
	}
	else if (Mod_IR_Hebel03 == 1)
	&& (Mod_IR_Hebel04 == 1)
	{
		Mod_Schrittweite -= 1;
	};

	if (Mod_IR_Light01_Pos == 1)
	{
		Wld_RemoveItem	(IR_BlueLight_01);
		Wld_InsertItem	(IR_RedLight_01, "FP_ITEM_LIGHT_01");
	}
	else if (Mod_IR_Light01_Pos == 2)
	{
		Wld_RemoveItem	(IR_BlueLight_02);
		Wld_InsertItem	(IR_RedLight_02, "FP_ITEM_LIGHT_02");
	}
	else if (Mod_IR_Light01_Pos == 3)
	{
		Wld_RemoveItem	(IR_BlueLight_03);
		Wld_InsertItem	(IR_RedLight_03, "FP_ITEM_LIGHT_03");
	}
	else if (Mod_IR_Light01_Pos == 4)
	{
		Wld_RemoveItem	(IR_BlueLight_04);
		Wld_InsertItem	(IR_RedLight_04, "FP_ITEM_LIGHT_05");
	}
	else if (Mod_IR_Light01_Pos == 5)
	{
		Wld_RemoveItem	(IR_BlueLight_05);
		Wld_InsertItem	(IR_RedLight_05, "FP_ITEM_LIGHT_05");
	}
	else if (Mod_IR_Light01_Pos == 6)
	{
		Wld_RemoveItem	(IR_BlueLight_06);
		Wld_InsertItem	(IR_RedLight_06, "FP_ITEM_LIGHT_06");
	}
	else if (Mod_IR_Light01_Pos == 7)
	{
		Wld_RemoveItem	(IR_BlueLight_07);
		Wld_InsertItem	(IR_RedLight_07, "FP_ITEM_LIGHT_07");
	}
	else if (Mod_IR_Light01_Pos == 8)
	{
		Wld_RemoveItem	(IR_BlueLight_08);
		Wld_InsertItem	(IR_RedLight_08, "FP_ITEM_LIGHT_08");
	};

	Mod_IR_Light01_Pos -= Mod_Schrittweite;

	if (Mod_IR_Light01_Pos < 1)
	{
		Mod_IR_Light01_Pos += 8;
	};

	if (Mod_IR_Light01_Pos == Mod_IR_Light02_Pos)
	{
		Mod_IR_Light01_Pos += 1;

		if (Mod_IR_Light01_Pos > 8)
		{
			Mod_IR_Light01_Pos -= 8;
		};
	};

	if (Mod_IR_Light01_Pos == 1)
	{
		Wld_RemoveItem	(IR_RedLight_01);
		Wld_InsertItem	(IR_BlueLight_01, "FP_ITEM_LIGHT_01");
	}
	else if (Mod_IR_Light01_Pos == 2)
	{
		Wld_RemoveItem	(IR_RedLight_02);
		Wld_InsertItem	(IR_BlueLight_02, "FP_ITEM_LIGHT_02");
	}
	else if (Mod_IR_Light01_Pos == 3)
	{
		Wld_RemoveItem	(IR_RedLight_03);
		Wld_InsertItem	(IR_BlueLight_03, "FP_ITEM_LIGHT_03");
	}
	else if (Mod_IR_Light01_Pos == 4)
	{
		Wld_RemoveItem	(IR_RedLight_04);
		Wld_InsertItem	(IR_BlueLight_04, "FP_ITEM_LIGHT_05");
	}
	else if (Mod_IR_Light01_Pos == 5)
	{
		Wld_RemoveItem	(IR_RedLight_05);
		Wld_InsertItem	(IR_BlueLight_05, "FP_ITEM_LIGHT_05");
	}
	else if (Mod_IR_Light01_Pos == 6)
	{
		Wld_RemoveItem	(IR_RedLight_06);
		Wld_InsertItem	(IR_BlueLight_06, "FP_ITEM_LIGHT_06");
	}
	else if (Mod_IR_Light01_Pos == 7)
	{
		Wld_RemoveItem	(IR_RedLight_07);
		Wld_InsertItem	(IR_BlueLight_07, "FP_ITEM_LIGHT_07");
	}
	else if (Mod_IR_Light01_Pos == 8)
	{
		Wld_RemoveItem	(IR_RedLight_08);
		Wld_InsertItem	(IR_BlueLight_08, "FP_ITEM_LIGHT_08");
	};
};

FUNC VOID IR_HEBEL_02_S1 ()
{
	if (Mod_IR_Hebel02 == 0)
	{
		Mod_Schrittweite = 1;

		Mod_IR_Hebel02 = 1;
	}
	else
	{
		Mod_Schrittweite = 2;

		Mod_IR_Hebel02 = 0;
	};

	if (Mod_IR_Hebel03 == 0)
	&& (Mod_IR_Hebel04 == 0)
	{
		Mod_Schrittweite += 1;
	}
	else if (Mod_IR_Hebel03 == 1)
	&& (Mod_IR_Hebel04 == 1)
	{
		Mod_Schrittweite -= 1;
	};

	if (Mod_IR_Light01_Pos == 1)
	{
		Wld_RemoveItem	(IR_BlueLight_01);
		Wld_InsertItem	(IR_RedLight_01, "FP_ITEM_LIGHT_01");
	}
	else if (Mod_IR_Light01_Pos == 2)
	{
		Wld_RemoveItem	(IR_BlueLight_02);
		Wld_InsertItem	(IR_RedLight_02, "FP_ITEM_LIGHT_02");
	}
	else if (Mod_IR_Light01_Pos == 3)
	{
		Wld_RemoveItem	(IR_BlueLight_03);
		Wld_InsertItem	(IR_RedLight_03, "FP_ITEM_LIGHT_03");
	}
	else if (Mod_IR_Light01_Pos == 4)
	{
		Wld_RemoveItem	(IR_BlueLight_04);
		Wld_InsertItem	(IR_RedLight_04, "FP_ITEM_LIGHT_05");
	}
	else if (Mod_IR_Light01_Pos == 5)
	{
		Wld_RemoveItem	(IR_BlueLight_05);
		Wld_InsertItem	(IR_RedLight_05, "FP_ITEM_LIGHT_05");
	}
	else if (Mod_IR_Light01_Pos == 6)
	{
		Wld_RemoveItem	(IR_BlueLight_06);
		Wld_InsertItem	(IR_RedLight_06, "FP_ITEM_LIGHT_06");
	}
	else if (Mod_IR_Light01_Pos == 7)
	{
		Wld_RemoveItem	(IR_BlueLight_07);
		Wld_InsertItem	(IR_RedLight_07, "FP_ITEM_LIGHT_07");
	}
	else if (Mod_IR_Light01_Pos == 8)
	{
		Wld_RemoveItem	(IR_BlueLight_08);
		Wld_InsertItem	(IR_RedLight_08, "FP_ITEM_LIGHT_08");
	};

	Mod_IR_Light01_Pos -= Mod_Schrittweite;

	if (Mod_IR_Light01_Pos < 1)
	{
		Mod_IR_Light01_Pos += 8;
	};

	if (Mod_IR_Light01_Pos == Mod_IR_Light02_Pos)
	{
		Mod_IR_Light01_Pos += 1;

		if (Mod_IR_Light01_Pos > 8)
		{
			Mod_IR_Light01_Pos -= 8;
		};
	};

	if (Mod_IR_Light01_Pos == 1)
	{
		Wld_RemoveItem	(IR_RedLight_01);
		Wld_InsertItem	(IR_BlueLight_01, "FP_ITEM_LIGHT_01");
	}
	else if (Mod_IR_Light01_Pos == 2)
	{
		Wld_RemoveItem	(IR_RedLight_02);
		Wld_InsertItem	(IR_BlueLight_02, "FP_ITEM_LIGHT_02");
	}
	else if (Mod_IR_Light01_Pos == 3)
	{
		Wld_RemoveItem	(IR_RedLight_03);
		Wld_InsertItem	(IR_BlueLight_03, "FP_ITEM_LIGHT_03");
	}
	else if (Mod_IR_Light01_Pos == 4)
	{
		Wld_RemoveItem	(IR_RedLight_04);
		Wld_InsertItem	(IR_BlueLight_04, "FP_ITEM_LIGHT_05");
	}
	else if (Mod_IR_Light01_Pos == 5)
	{
		Wld_RemoveItem	(IR_RedLight_05);
		Wld_InsertItem	(IR_BlueLight_05, "FP_ITEM_LIGHT_05");
	}
	else if (Mod_IR_Light01_Pos == 6)
	{
		Wld_RemoveItem	(IR_RedLight_06);
		Wld_InsertItem	(IR_BlueLight_06, "FP_ITEM_LIGHT_06");
	}
	else if (Mod_IR_Light01_Pos == 7)
	{
		Wld_RemoveItem	(IR_RedLight_07);
		Wld_InsertItem	(IR_BlueLight_07, "FP_ITEM_LIGHT_07");
	}
	else if (Mod_IR_Light01_Pos == 8)
	{
		Wld_RemoveItem	(IR_RedLight_08);
		Wld_InsertItem	(IR_BlueLight_08, "FP_ITEM_LIGHT_08");
	};
};

FUNC VOID IR_HEBEL_03_S0 ()
{
	if (Mod_IR_Hebel03 == 0)
	{
		Mod_Schrittweite = 1;

		Mod_IR_Hebel03 = 1;
	}
	else
	{
		Mod_Schrittweite = 2;

		Mod_IR_Hebel03 = 0;
	};

	if (Mod_IR_Hebel01 == 0)
	&& (Mod_IR_Hebel02 == 0)
	{
		Mod_Schrittweite += 1;
	}
	else if (Mod_IR_Hebel01 == 1)
	&& (Mod_IR_Hebel02 == 1)
	{
		Mod_Schrittweite -= 1;
	};

	if (Mod_IR_Light02_Pos == 1)
	{
		Wld_RemoveItem	(IR_BlueLight_01);
		Wld_InsertItem	(IR_RedLight_01, "FP_ITEM_LIGHT_01");
	}
	else if (Mod_IR_Light02_Pos == 2)
	{
		Wld_RemoveItem	(IR_BlueLight_02);
		Wld_InsertItem	(IR_RedLight_02, "FP_ITEM_LIGHT_02");
	}
	else if (Mod_IR_Light02_Pos == 3)
	{
		Wld_RemoveItem	(IR_BlueLight_03);
		Wld_InsertItem	(IR_RedLight_03, "FP_ITEM_LIGHT_03");
	}
	else if (Mod_IR_Light02_Pos == 4)
	{
		Wld_RemoveItem	(IR_BlueLight_04);
		Wld_InsertItem	(IR_RedLight_04, "FP_ITEM_LIGHT_05");
	}
	else if (Mod_IR_Light02_Pos == 5)
	{
		Wld_RemoveItem	(IR_BlueLight_05);
		Wld_InsertItem	(IR_RedLight_05, "FP_ITEM_LIGHT_05");
	}
	else if (Mod_IR_Light02_Pos == 6)
	{
		Wld_RemoveItem	(IR_BlueLight_06);
		Wld_InsertItem	(IR_RedLight_06, "FP_ITEM_LIGHT_06");
	}
	else if (Mod_IR_Light02_Pos == 7)
	{
		Wld_RemoveItem	(IR_BlueLight_07);
		Wld_InsertItem	(IR_RedLight_07, "FP_ITEM_LIGHT_07");
	}
	else if (Mod_IR_Light02_Pos == 8)
	{
		Wld_RemoveItem	(IR_BlueLight_08);
		Wld_InsertItem	(IR_RedLight_08, "FP_ITEM_LIGHT_08");
	};

	Mod_IR_Light02_Pos += Mod_Schrittweite;

	if (Mod_IR_Light02_Pos > 8)
	{
		Mod_IR_Light02_Pos -= 8;
	};

	if (Mod_IR_Light02_Pos == Mod_IR_Light01_Pos)
	{
		Mod_IR_Light02_Pos += 1;

		if (Mod_IR_Light02_Pos > 8)
		{
			Mod_IR_Light02_Pos -= 8;
		};
	};

	if (Mod_IR_Light02_Pos == 1)
	{
		Wld_RemoveItem	(IR_RedLight_01);
		Wld_InsertItem	(IR_BlueLight_01, "FP_ITEM_LIGHT_01");
	}
	else if (Mod_IR_Light02_Pos == 2)
	{
		Wld_RemoveItem	(IR_RedLight_02);
		Wld_InsertItem	(IR_BlueLight_02, "FP_ITEM_LIGHT_02");
	}
	else if (Mod_IR_Light02_Pos == 3)
	{
		Wld_RemoveItem	(IR_RedLight_03);
		Wld_InsertItem	(IR_BlueLight_03, "FP_ITEM_LIGHT_03");
	}
	else if (Mod_IR_Light02_Pos == 4)
	{
		Wld_RemoveItem	(IR_RedLight_04);
		Wld_InsertItem	(IR_BlueLight_04, "FP_ITEM_LIGHT_05");
	}
	else if (Mod_IR_Light02_Pos == 5)
	{
		Wld_RemoveItem	(IR_RedLight_05);
		Wld_InsertItem	(IR_BlueLight_05, "FP_ITEM_LIGHT_05");
	}
	else if (Mod_IR_Light02_Pos == 6)
	{
		Wld_RemoveItem	(IR_RedLight_06);
		Wld_InsertItem	(IR_BlueLight_06, "FP_ITEM_LIGHT_06");
	}
	else if (Mod_IR_Light02_Pos == 7)
	{
		Wld_RemoveItem	(IR_RedLight_07);
		Wld_InsertItem	(IR_BlueLight_07, "FP_ITEM_LIGHT_07");
	}
	else if (Mod_IR_Light02_Pos == 8)
	{
		Wld_RemoveItem	(IR_RedLight_08);
		Wld_InsertItem	(IR_BlueLight_08, "FP_ITEM_LIGHT_08");
	};
};

FUNC VOID IR_HEBEL_03_S1 ()
{
	if (Mod_IR_Hebel03 == 0)
	{
		Mod_Schrittweite = 1;

		Mod_IR_Hebel03 = 1;
	}
	else
	{
		Mod_Schrittweite = 2;

		Mod_IR_Hebel03 = 0;
	};

	if (Mod_IR_Hebel01 == 0)
	&& (Mod_IR_Hebel02 == 0)
	{
		Mod_Schrittweite += 1;
	}
	else if (Mod_IR_Hebel01 == 1)
	&& (Mod_IR_Hebel02 == 1)
	{
		Mod_Schrittweite -= 1;
	};

	if (Mod_IR_Light02_Pos == 1)
	{
		Wld_RemoveItem	(IR_BlueLight_01);
		Wld_InsertItem	(IR_RedLight_01, "FP_ITEM_LIGHT_01");
	}
	else if (Mod_IR_Light02_Pos == 2)
	{
		Wld_RemoveItem	(IR_BlueLight_02);
		Wld_InsertItem	(IR_RedLight_02, "FP_ITEM_LIGHT_02");
	}
	else if (Mod_IR_Light02_Pos == 3)
	{
		Wld_RemoveItem	(IR_BlueLight_03);
		Wld_InsertItem	(IR_RedLight_03, "FP_ITEM_LIGHT_03");
	}
	else if (Mod_IR_Light02_Pos == 4)
	{
		Wld_RemoveItem	(IR_BlueLight_04);
		Wld_InsertItem	(IR_RedLight_04, "FP_ITEM_LIGHT_05");
	}
	else if (Mod_IR_Light02_Pos == 5)
	{
		Wld_RemoveItem	(IR_BlueLight_05);
		Wld_InsertItem	(IR_RedLight_05, "FP_ITEM_LIGHT_05");
	}
	else if (Mod_IR_Light02_Pos == 6)
	{
		Wld_RemoveItem	(IR_BlueLight_06);
		Wld_InsertItem	(IR_RedLight_06, "FP_ITEM_LIGHT_06");
	}
	else if (Mod_IR_Light02_Pos == 7)
	{
		Wld_RemoveItem	(IR_BlueLight_07);
		Wld_InsertItem	(IR_RedLight_07, "FP_ITEM_LIGHT_07");
	}
	else if (Mod_IR_Light02_Pos == 8)
	{
		Wld_RemoveItem	(IR_BlueLight_08);
		Wld_InsertItem	(IR_RedLight_08, "FP_ITEM_LIGHT_08");
	};

	Mod_IR_Light02_Pos += Mod_Schrittweite;

	if (Mod_IR_Light02_Pos > 8)
	{
		Mod_IR_Light02_Pos -= 8;
	};

	if (Mod_IR_Light02_Pos == Mod_IR_Light01_Pos)
	{
		Mod_IR_Light02_Pos += 1;

		if (Mod_IR_Light02_Pos > 8)
		{
			Mod_IR_Light02_Pos -= 8;
		};
	};

	if (Mod_IR_Light02_Pos == 1)
	{
		Wld_RemoveItem	(IR_RedLight_01);
		Wld_InsertItem	(IR_BlueLight_01, "FP_ITEM_LIGHT_01");
	}
	else if (Mod_IR_Light02_Pos == 2)
	{
		Wld_RemoveItem	(IR_RedLight_02);
		Wld_InsertItem	(IR_BlueLight_02, "FP_ITEM_LIGHT_02");
	}
	else if (Mod_IR_Light02_Pos == 3)
	{
		Wld_RemoveItem	(IR_RedLight_03);
		Wld_InsertItem	(IR_BlueLight_03, "FP_ITEM_LIGHT_03");
	}
	else if (Mod_IR_Light02_Pos == 4)
	{
		Wld_RemoveItem	(IR_RedLight_04);
		Wld_InsertItem	(IR_BlueLight_04, "FP_ITEM_LIGHT_05");
	}
	else if (Mod_IR_Light02_Pos == 5)
	{
		Wld_RemoveItem	(IR_RedLight_05);
		Wld_InsertItem	(IR_BlueLight_05, "FP_ITEM_LIGHT_05");
	}
	else if (Mod_IR_Light02_Pos == 6)
	{
		Wld_RemoveItem	(IR_RedLight_06);
		Wld_InsertItem	(IR_BlueLight_06, "FP_ITEM_LIGHT_06");
	}
	else if (Mod_IR_Light02_Pos == 7)
	{
		Wld_RemoveItem	(IR_RedLight_07);
		Wld_InsertItem	(IR_BlueLight_07, "FP_ITEM_LIGHT_07");
	}
	else if (Mod_IR_Light02_Pos == 8)
	{
		Wld_RemoveItem	(IR_RedLight_08);
		Wld_InsertItem	(IR_BlueLight_08, "FP_ITEM_LIGHT_08");
	};
};

FUNC VOID IR_HEBEL_04_S0 ()
{
	if (Mod_IR_Hebel04 == 0)
	{
		Mod_Schrittweite = 1;

		Mod_IR_Hebel04 = 1;
	}
	else
	{
		Mod_Schrittweite = 2;

		Mod_IR_Hebel04 = 0;
	};

	if (Mod_IR_Hebel01 == 0)
	&& (Mod_IR_Hebel02 == 0)
	{
		Mod_Schrittweite += 1;
	}
	else if (Mod_IR_Hebel01 == 1)
	&& (Mod_IR_Hebel02 == 1)
	{
		Mod_Schrittweite -= 1;
	};

	if (Mod_IR_Light02_Pos == 1)
	{
		Wld_RemoveItem	(IR_BlueLight_01);
		Wld_InsertItem	(IR_RedLight_01, "FP_ITEM_LIGHT_01");
	}
	else if (Mod_IR_Light02_Pos == 2)
	{
		Wld_RemoveItem	(IR_BlueLight_02);
		Wld_InsertItem	(IR_RedLight_02, "FP_ITEM_LIGHT_02");
	}
	else if (Mod_IR_Light02_Pos == 3)
	{
		Wld_RemoveItem	(IR_BlueLight_03);
		Wld_InsertItem	(IR_RedLight_03, "FP_ITEM_LIGHT_03");
	}
	else if (Mod_IR_Light02_Pos == 4)
	{
		Wld_RemoveItem	(IR_BlueLight_04);
		Wld_InsertItem	(IR_RedLight_04, "FP_ITEM_LIGHT_05");
	}
	else if (Mod_IR_Light02_Pos == 5)
	{
		Wld_RemoveItem	(IR_BlueLight_05);
		Wld_InsertItem	(IR_RedLight_05, "FP_ITEM_LIGHT_05");
	}
	else if (Mod_IR_Light02_Pos == 6)
	{
		Wld_RemoveItem	(IR_BlueLight_06);
		Wld_InsertItem	(IR_RedLight_06, "FP_ITEM_LIGHT_06");
	}
	else if (Mod_IR_Light02_Pos == 7)
	{
		Wld_RemoveItem	(IR_BlueLight_07);
		Wld_InsertItem	(IR_RedLight_07, "FP_ITEM_LIGHT_07");
	}
	else if (Mod_IR_Light02_Pos == 8)
	{
		Wld_RemoveItem	(IR_BlueLight_08);
		Wld_InsertItem	(IR_RedLight_08, "FP_ITEM_LIGHT_08");
	};

	Mod_IR_Light02_Pos -= Mod_Schrittweite;

	if (Mod_IR_Light02_Pos < 1)
	{
		Mod_IR_Light02_Pos += 8;
	};

	if (Mod_IR_Light02_Pos == Mod_IR_Light01_Pos)
	{
		Mod_IR_Light02_Pos += 1;

		if (Mod_IR_Light02_Pos > 8)
		{
			Mod_IR_Light02_Pos -= 8;
		};
	};

	if (Mod_IR_Light02_Pos == 1)
	{
		Wld_RemoveItem	(IR_RedLight_01);
		Wld_InsertItem	(IR_BlueLight_01, "FP_ITEM_LIGHT_01");
	}
	else if (Mod_IR_Light02_Pos == 2)
	{
		Wld_RemoveItem	(IR_RedLight_02);
		Wld_InsertItem	(IR_BlueLight_02, "FP_ITEM_LIGHT_02");
	}
	else if (Mod_IR_Light02_Pos == 3)
	{
		Wld_RemoveItem	(IR_RedLight_03);
		Wld_InsertItem	(IR_BlueLight_03, "FP_ITEM_LIGHT_03");
	}
	else if (Mod_IR_Light02_Pos == 4)
	{
		Wld_RemoveItem	(IR_RedLight_04);
		Wld_InsertItem	(IR_BlueLight_04, "FP_ITEM_LIGHT_05");
	}
	else if (Mod_IR_Light02_Pos == 5)
	{
		Wld_RemoveItem	(IR_RedLight_05);
		Wld_InsertItem	(IR_BlueLight_05, "FP_ITEM_LIGHT_05");
	}
	else if (Mod_IR_Light02_Pos == 6)
	{
		Wld_RemoveItem	(IR_RedLight_06);
		Wld_InsertItem	(IR_BlueLight_06, "FP_ITEM_LIGHT_06");
	}
	else if (Mod_IR_Light02_Pos == 7)
	{
		Wld_RemoveItem	(IR_RedLight_07);
		Wld_InsertItem	(IR_BlueLight_07, "FP_ITEM_LIGHT_07");
	}
	else if (Mod_IR_Light02_Pos == 8)
	{
		Wld_RemoveItem	(IR_RedLight_08);
		Wld_InsertItem	(IR_BlueLight_08, "FP_ITEM_LIGHT_08");
	};
};

FUNC VOID IR_HEBEL_04_S1 ()
{
	if (Mod_IR_Hebel04 == 0)
	{
		Mod_Schrittweite = 1;

		Mod_IR_Hebel04 = 1;
	}
	else
	{
		Mod_Schrittweite = 2;

		Mod_IR_Hebel04 = 0;
	};

	if (Mod_IR_Hebel01 == 0)
	&& (Mod_IR_Hebel02 == 0)
	{
		Mod_Schrittweite += 1;
	}
	else if (Mod_IR_Hebel01 == 1)
	&& (Mod_IR_Hebel02 == 1)
	{
		Mod_Schrittweite -= 1;
	};

	if (Mod_IR_Light02_Pos == 1)
	{
		Wld_RemoveItem	(IR_BlueLight_01);
		Wld_InsertItem	(IR_RedLight_01, "FP_ITEM_LIGHT_01");
	}
	else if (Mod_IR_Light02_Pos == 2)
	{
		Wld_RemoveItem	(IR_BlueLight_02);
		Wld_InsertItem	(IR_RedLight_02, "FP_ITEM_LIGHT_02");
	}
	else if (Mod_IR_Light02_Pos == 3)
	{
		Wld_RemoveItem	(IR_BlueLight_03);
		Wld_InsertItem	(IR_RedLight_03, "FP_ITEM_LIGHT_03");
	}
	else if (Mod_IR_Light02_Pos == 4)
	{
		Wld_RemoveItem	(IR_BlueLight_04);
		Wld_InsertItem	(IR_RedLight_04, "FP_ITEM_LIGHT_05");
	}
	else if (Mod_IR_Light02_Pos == 5)
	{
		Wld_RemoveItem	(IR_BlueLight_05);
		Wld_InsertItem	(IR_RedLight_05, "FP_ITEM_LIGHT_05");
	}
	else if (Mod_IR_Light02_Pos == 6)
	{
		Wld_RemoveItem	(IR_BlueLight_06);
		Wld_InsertItem	(IR_RedLight_06, "FP_ITEM_LIGHT_06");
	}
	else if (Mod_IR_Light02_Pos == 7)
	{
		Wld_RemoveItem	(IR_BlueLight_07);
		Wld_InsertItem	(IR_RedLight_07, "FP_ITEM_LIGHT_07");
	}
	else if (Mod_IR_Light02_Pos == 8)
	{
		Wld_RemoveItem	(IR_BlueLight_08);
		Wld_InsertItem	(IR_RedLight_08, "FP_ITEM_LIGHT_08");
	};

	Mod_IR_Light02_Pos -= Mod_Schrittweite;

	if (Mod_IR_Light02_Pos < 1)
	{
		Mod_IR_Light02_Pos += 8;
	};

	if (Mod_IR_Light02_Pos == Mod_IR_Light01_Pos)
	{
		Mod_IR_Light02_Pos += 1;

		if (Mod_IR_Light02_Pos > 8)
		{
			Mod_IR_Light02_Pos -= 8;
		};
	};

	if (Mod_IR_Light02_Pos == 1)
	{
		Wld_RemoveItem	(IR_RedLight_01);
		Wld_InsertItem	(IR_BlueLight_01, "FP_ITEM_LIGHT_01");
	}
	else if (Mod_IR_Light02_Pos == 2)
	{
		Wld_RemoveItem	(IR_RedLight_02);
		Wld_InsertItem	(IR_BlueLight_02, "FP_ITEM_LIGHT_02");
	}
	else if (Mod_IR_Light02_Pos == 3)
	{
		Wld_RemoveItem	(IR_RedLight_03);
		Wld_InsertItem	(IR_BlueLight_03, "FP_ITEM_LIGHT_03");
	}
	else if (Mod_IR_Light02_Pos == 4)
	{
		Wld_RemoveItem	(IR_RedLight_04);
		Wld_InsertItem	(IR_BlueLight_04, "FP_ITEM_LIGHT_05");
	}
	else if (Mod_IR_Light02_Pos == 5)
	{
		Wld_RemoveItem	(IR_RedLight_05);
		Wld_InsertItem	(IR_BlueLight_05, "FP_ITEM_LIGHT_05");
	}
	else if (Mod_IR_Light02_Pos == 6)
	{
		Wld_RemoveItem	(IR_RedLight_06);
		Wld_InsertItem	(IR_BlueLight_06, "FP_ITEM_LIGHT_06");
	}
	else if (Mod_IR_Light02_Pos == 7)
	{
		Wld_RemoveItem	(IR_RedLight_07);
		Wld_InsertItem	(IR_BlueLight_07, "FP_ITEM_LIGHT_07");
	}
	else if (Mod_IR_Light02_Pos == 8)
	{
		Wld_RemoveItem	(IR_RedLight_08);
		Wld_InsertItem	(IR_BlueLight_08, "FP_ITEM_LIGHT_08");
	};
};

FUNC VOID EVT_IR_ROOM_01 ()
{
	if ((Mod_IR_Light01_Pos == 1)
	&& (Mod_IR_Light02_Pos == 2))
	|| ((Mod_IR_Light01_Pos == 2)
	&& (Mod_IR_Light02_Pos == 1))
	{
		
	}
	else
	{
		Wld_SendTrigger	("EVT_LEFT_UP_ROOM_02_TRIGGERLIST_ENTRANCE");
	};
};

FUNC VOID EVT_IR_ROOM2_01 ()
{
	if (Mod_IR_Light01_Pos != 1)
	&& (Mod_IR_Light02_Pos != 2)
	&& (Mod_IR_Light02_Pos != 1)
	&& (Mod_IR_Light01_Pos != 2)
	{
		Wld_SendTrigger	("EVT_LEFT_ROOM_02_TRAP_TRIGGERLIST_01");
	};
};

FUNC VOID EVT_IR_ROOM_02 ()
{
	if ((Mod_IR_Light01_Pos == 3)
	&& (Mod_IR_Light02_Pos == 4))
	|| ((Mod_IR_Light01_Pos == 4)
	&& (Mod_IR_Light02_Pos == 3))
	{
	}
	else
	{
		Wld_SendTrigger	("EVT_RIGHT_UP_TRIGGERLIST_FOR_ENTRANCE_01");
	};
};

FUNC VOID EVT_IR_ROOM2_02 ()
{
	if (Mod_IR_Light01_Pos != 3)
	&& (Mod_IR_Light02_Pos != 4)
	&& (Mod_IR_Light02_Pos != 4)
	&& (Mod_IR_Light01_Pos != 3)
	{
		Wld_SendTrigger	("EVT_RIGHT_ROOM_02_TRIGGERLIST_FALSE_SPAWN_01");
	};
};

FUNC VOID EVT_IR_ROOM_03 ()
{
	if ((Mod_IR_Light01_Pos == 5)
	&& (Mod_IR_Light02_Pos == 6))
	|| ((Mod_IR_Light01_Pos == 6)
	&& (Mod_IR_Light02_Pos == 5))
	{
	}
	else
	{
		Wld_SendTrigger	("EVT_RIGHT_DOWN_TRIGGERLIST_FOR_ENTRANCE_01");
	};
};