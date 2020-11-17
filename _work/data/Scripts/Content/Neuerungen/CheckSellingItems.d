/*
 * Dictate which items may be sold
 * Written by Frank-95  https://forum.worldofplayers.de/forum/threads/?p=24695536
 *
 * Initialize with CheckSellingItems_Init() in Init_Global
 * Compatible with Gothic 2 only
 */
FUNC INT CanSellItem(var C_Item itm) {
    if (C_ItmHasFlag(itm, ITEM_SHOW)) {
        Print("Das sollte ich lieber behalten.");
        return FALSE;
    };

    return TRUE;
};


FUNC VOID CheckSellingItems_Init() {
    const int oCViewDialogTrade__OnTransferLeft = 6862912; //0x68B840
    HookEngineF(oCViewDialogTrade__OnTransferLeft, 6, CheckSellingItems);
    MemoryProtectionOverride(oCViewDialogTrade__OnTransferLeft + 6, 4);
};
FUNC VOID CheckSellingItems() {
    const int oCViewDialogTrade__OnTransferLeft = 6862912; //0x68B840

	MEM_Info("Called CheckSellingItems()");
	
    var oCNpc her; her = Hlp_GetNpc(hero);
    var C_Item itm;
    itm = _^(List_GetS(her.inventory2_oCItemContainer_contents, her.inventory2_oCItemContainer_selectedItem + 2));

    if (CanSellItem(itm)) {
        MEM_WriteByte(oCViewDialogTrade__OnTransferLeft + 6, 106); // push
    } else {
        MEM_WriteByte(oCViewDialogTrade__OnTransferLeft + 6, 195); // retn
    };
};
