FUNC VOID Restore_Questitems() {
	if (questitemliste > 0) {
		if (List_Length(questitemliste) > 0) {
			var int i;
			i = 1;
			var int ptr; ptr = MEM_StackPos.position;

			if (i <= List_Length(questitemliste)) {
				var int itemid;
				itemid = List_Get(questitemliste, i);

				CreateInvItems	(hero, itemid, 1);

				i += 1;
        
				MEM_StackPos.position = ptr;
			};
		};

		List_Destroy(questitemliste);
		questitemliste = 0;
	};
};

FUNC VOID Backup_Questitems() {
	Restore_Questitems();
	
	var int i;
	i = 0;
	var int j;
	j = 0;
	var int itemid;

	var int ptr; ptr = MEM_StackPos.position;

	if (Npc_GetInvItemBySlot (hero, i, j) > 0) {
		itemid = Hlp_GetInstanceID (item);

		if (C_ItmHasFlag(item, ITEM_SHOW)) {
			NPC_RemoveInvItems (hero, itemid, 1);

			if (questitemliste == 0) {
				questitemliste = List_Create(itemid);
			} else {
				List_Add (questitemliste, itemid);
			};
		} else {
			j += 1;
		};
        
		MEM_StackPos.position = ptr;
	} else {
		j = 0;

		i += 1;

		if (i < 9) {
			MEM_StackPos.position = ptr;
		};
	};
};
