FUNC VOID Mob_RemoveItems (var string mobname, var C_Item itm, var int amount)
{
	var int ptr;
	ptr = MEM_SearchVobByName(mobname);

	var int ptr2;
	ptr2 = MEM_InstToPtr(itm);

	if (ptr > 0)
	{
		if (Hlp_Is_oCMobContainer(ptr))
		{
			CALL_IntParam(amount);
			CALL_PtrParam(ptr2);
			CALL__thiscall(ptr, 7495808);
		}
		else
		{
			return; // kein MobContainer
		};
	}
	else
	{
		return; // kein entsprechendes Mob gefunden
	};
};

FUNC VOID Mob_RemoveItem (var string mobname, var C_Item itm)
{
	Mob_RemoveItems(mobname, itm, 1);
};