FUNC VOID B_AutoPlundering (var C_NPC slf, var C_NPC oth)
{
	if ((Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(hero))
	|| (oth.aivar[AIV_PARTYMEMBER] == TRUE))
	&& (Mod_AutoInventar == TRUE)
	&& (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Keiler_Ramsi))
	{
		/*B_TransferInventory_Weapons (slf, hero);
		B_TransferInventory_Runen (slf, hero);
		B_TransferInventory_Magics (slf, hero);
		B_TransferInventory_Food (slf, hero);
		B_TransferInventory_Potion (slf, hero);
		B_TransferInventory_Docs (slf, hero);
		B_TransferInventory_Misc (slf, hero);

		Print ("Auto-Plünderung");*/
	};
};