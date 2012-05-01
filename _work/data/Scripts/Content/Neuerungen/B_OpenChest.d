FUNC VOID B_OpenChest()
{
	var oCMobLockable ml; ml = MEM_PtrToInst(ESI);

	if (STR_Len(ml.pickLockStr) >= 3)
	{
		B_GivePlayerXP	((STR_Len(ml.pickLockStr)-2)*5);
	};

	if (r_max(hero.attribute[ATR_DEXTERITY]) < r_max(99))
	{
		Npc_SendPassivePerc (hero, PERC_ASSESSQUIETSOUND, hero, hero);

		Snd_Play3D	(hero, "TRUHENKNARREN_LAUT");
	};
};