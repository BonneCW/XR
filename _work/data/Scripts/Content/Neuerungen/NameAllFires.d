FUNC VOID NameAllFires()
{
	MEM_InitAll();

	var zCListSort liste;
	MEM_AssignInst(liste, MEM_World.voblist);

	var int loopStart; loopStart = MEM_StackPos.position;
	/* while */ if (liste.next != 0) {
		var zCObject vob;
		var int vobPtr; vobPtr = liste.data;
		MEM_AssignInst (vob, vobPtr);

		if (Hlp_Is_oCMobFire(vobPtr)) {
			if (Hlp_StrCmp(vob.objectname, "FIREPLACE_DIEBKELLER") == FALSE)
			&& (Hlp_StrCmp(vob.objectname, "LIGHTSPAWNER_1") == FALSE)
			&& (Hlp_StrCmp(vob.objectname, "LIGHTSPAWNER_2") == FALSE)
			&& (Hlp_StrCmp(vob.objectname, "LIGHTSPAWNER_3") == FALSE)
			&& (Hlp_StrCmp(vob.objectname, "LIGHTSPAWNER_4") == FALSE)
			&& (Hlp_StrCmp(vob.objectname, "LIGHTSPAWNER_5") == FALSE)
			&& (Hlp_StrCmp(vob.objectname, "LIGHTSPAWNER_6") == FALSE)
			&& (Hlp_StrCmp(vob.objectname, "LIGHTSPAWNER_7") == FALSE)
			&& (Hlp_StrCmp(vob.objectname, "LIGHTSPAWNER_8") == FALSE)
			&& (Hlp_StrCmp(vob.objectname, "LIGHTSPAWNER_9") == FALSE)
			&& (Hlp_StrCmp(vob.objectname, "LIGHTSPAWNER_10") == FALSE)
			&& (Hlp_StrCmp(vob.objectname, "LIGHTSPAWNER_11") == FALSE)
			{
				MEM_RenameVob (vobPtr, "FIREPLACE");
			};
		};

		MEM_AssignInst (liste, liste.next);

		MEM_StackPos.position = loopStart;
	}; /*end while*/
};