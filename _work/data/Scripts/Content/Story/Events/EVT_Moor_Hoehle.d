FUNC VOID EVT_MOOR_HOEHLE ()
{
	var C_Item ewp;
	var C_Item ear;

	ewp = Npc_GetEquippedMeleeWeapon(hero);
	ear = Npc_GetEquippedArmor(hero);

	if (Hlp_IsValidItem(ewp))
	{
		if (ewp.material == MAT_METAL)
		{
			B_MagicHurtNpc	(hero, hero, 999999);

			Wld_PlayEffect("SpellFX_BELIARSRAGE", hero, hero, 0, 0, 0, FALSE);
		};
	};

	if (Hlp_IsValidItem(ear))
	{
		if (ear.material == MAT_METAL)
		{
			B_MagicHurtNpc	(hero, hero, 999999);

			Wld_PlayEffect("SpellFX_BELIARSRAGE", hero, hero, 0, 0, 0, FALSE);
		};
	};
};

FUNC VOID EVT_MOOR_HOEHLE2 ()
{
	var C_Item ewp;
	var C_Item ear;

	ewp = Npc_GetEquippedMeleeWeapon(hero);
	ear = Npc_GetEquippedArmor(hero);

	if (Hlp_IsValidItem(ewp))
	{
		if (ewp.material == MAT_METAL)
		{
			Wld_PlayEffect("SPELLFX_BARRIEREWARNING", hero, hero, 0, 0, 0, FALSE);
		};
	};

	if (Hlp_IsValidItem(ear))
	{
		if (ear.material == MAT_METAL)
		{
			Wld_PlayEffect("SPELLFX_BARRIEREWARNING", hero, hero, 0, 0, 0, FALSE);
		};
	};
};

var int Moor_Dolche;

FUNC VOID EVT_MOOR_DOLCHE()
{
	Moor_Dolche += 1;

	if (Moor_Dolche == 4)
	{
		Wld_SendTrigger	("EVT_MOOR_LASTSCHREIN");
	}
	else if (Moor_Dolche == 5)
	{
		Wld_SendTrigger	("EVT_BARRIERE_MOOR_HOEHLENEINGANG");
	};
};