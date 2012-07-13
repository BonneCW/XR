FUNC VOID MEMINT_RemoveVob(var int ptr)
{
	if (ptr > 0)
	&& (ptr != MEM_InstToPtr(PC_Hero))
	{
		CALL__thiscall(ptr, 6298688); // Entfernt übergebens Vob (zCVob.RemoveVobFromWorld())
	};
};

FUNC INT MEM_RemoveVob(var string vobname)
{
	var int ptr; ptr = MEM_SearchVobByName (vobname);

	if (ptr > 0)
	{
		MEMINT_RemoveVob(ptr);

		return TRUE;
	}
	else
	{
		return FALSE;
	};
};