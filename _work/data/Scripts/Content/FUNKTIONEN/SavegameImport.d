FUNC INT SavegameImport (var string modname, var string variable, var int flag, var int mod)
{
	var int importsave; importsave = LoadLibrary("ImportSavegame.dll");

	if(!importsave) { return -1; };
	PrintDebug("SavegameImport -- Lib ok");

	var int importsave_func;
	importsave_func = GetProcAddress(importsave, "?ImportSavegame@@YAHPBD0HH@Z");
	
	if(!importsave_func)
	{
		FreeLibrary(importsave);

		return -1;
	};

	PrintDebug("SavegameImport -- Funktion ok");

	CALL_IntParam(mod);
	CALL_IntParam(flag);
	CALL_cStringPtrParam(variable);
	CALL_cStringPtrParam(modname);
	CALL__cdecl(importsave_func);
	PrintDebug("SavegameImport -- Aufruf ok");

	var int res;
	res = CALL_RetValAsInt();

	FreeLibrary(importsave);

	return res;
};