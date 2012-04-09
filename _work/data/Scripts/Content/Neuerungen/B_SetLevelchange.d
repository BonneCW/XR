FUNC VOID B_SetLevelchange (var string levelname, var string waypoint)
{
	var int ptr;
	ptr = MEM_SearchVobByName("OBELISKSCHREIN_LEVELCHANGE");

	if (ptr > 0)
	{
		var oCTriggerChangeLevel tcl;
		MEM_AssignInst(tcl, ptr);

		tcl.levelname = levelname;
		tcl.startvob = waypoint;
	};
};