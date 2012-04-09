FUNC VOID B_Autosave()
{
	const int CGameManager__Write_Savegame = 4367056; //0x42A2D0
	CALL_IntParam (0);
	CALL__thiscall (MEM_ReadInt (MEMINT_gameMan_Pointer_address), CGameManager__Write_Savegame);

	Autosave_Counter = 0;

	Autosave_Blocker = 120;

	Print	("Autosave!");
};