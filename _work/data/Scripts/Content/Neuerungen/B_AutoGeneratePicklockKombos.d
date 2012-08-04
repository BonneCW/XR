FUNC VOID B_AutoGeneratePicklockKombos()
{
	MEM_InitAll();

	var zCListSort liste;
	MEM_AssignInst(liste, MEM_World.voblist);

	var int loopStart; loopStart = MEM_StackPos.position;
	/* while */ if (liste.next != 0) {
		var oCMobLockable vob;
		var int vobPtr; vobPtr = liste.data;
		MEM_AssignInst (vob, vobPtr);

		if (Hlp_Is_oCMobLockable(vobPtr)) {
			if (STR_Len(vob.pickLockStr) > 0)
			{
				var int i; i = 0;
				var string newcombo; newcombo = "";
				var int secloop; secloop = MEM_StackPos.position;

				if (i < STR_Len(vob.pickLockStr))
				{
					if (r_max(1) == 0)
					{
						newcombo = ConcatStrings(newcombo, "L");
					}
					else
					{
						newcombo = ConcatStrings(newcombo, "R");
					};

					i += 1;

					MEM_StackPos.position = secloop;
				};

				vob.pickLockStr = newcombo;
			};
		};

		MEM_AssignInst (liste, liste.next);

		MEM_StackPos.position = loopStart;
	}; /*end while*/
};