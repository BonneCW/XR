func int C_ItmHasFlag(var C_Item itm, var int flg)
{
    if( Hlp_IsValidItem(itm) )
    {
        if( (itm.flags & flg) == flg )
        {
            return TRUE;
        };
    };
    return FALSE;
};

FUNC VOID B_ShowPlunderedItem (var C_NPC victm, var C_NPC plunder, var C_Item plunderthing)
{
	if (C_ItmHasFlag(plunderthing, ITEM_SHOW))
	|| (C_ItmHasFlag(plunderthing, ITEM_KAT_DOCS))
	|| (C_ItmHasFlag(plunderthing, ITEM_RING))
	|| (C_ItmHasFlag(plunderthing, ITEM_AMULET))
	|| (C_ItmHasFlag(plunderthing, ITEM_KAT_NONE))
	{
		var string PlunderItem;
		//PlunderItem = ConcatStrings(IntToString(plunderamount), "x ");
		PlunderItem = ConcatStrings(plunderthing.name, " erhalten");

		Print (PlunderItem);
 	};
};

FUNC void B_TransferInventory_All (var C_Npc victm, var C_Npc plunder)
{
    if (Npc_GetInvItemBySlot (victm, 0, 0) > 0)
    {
        var int itemid;
            
        itemid = Hlp_GetInstanceID (item);

        CreateInvItems (plunder, itemid, NPC_HasItems (victm, itemid));
        
        NPC_RemoveInvItems (victm, itemid, NPC_HasItems (victm, itemid));
        
        B_TransferInventory_All (victm,plunder);
    };
};

FUNC void B_TransferInventory_Mob (var C_Npc victm, var string plunder)
{
    if (Npc_GetInvItemBySlot (victm, 0, 0) > 0)
    {
        var int itemid;
            
        itemid = Hlp_GetInstanceID (item);

        Mob_CreateItems (plunder, itemid, NPC_HasItems (victm, itemid));
        
        NPC_RemoveInvItems (victm, itemid, NPC_HasItems (victm, itemid));
        
        B_TransferInventory_Mob (victm, plunder);
    };
};

FUNC void B_TransferInventory_Weapons (var C_Npc victm, var C_Npc plunder)
{
    if (Npc_GetInvItemBySlot (victm, 1, 0) > 0)
    {
	if (C_ItmHasFlag(item, ITEM_KAT_ARMOR))
	{
		return;
	};

        var int itemid;
            
        itemid = Hlp_GetInstanceID (item);

	B_ShowPlunderedItem (victm, plunder, item);

        CreateInvItems (plunder, itemid, NPC_HasItems (victm, itemid));
        
        NPC_RemoveInvItems (victm, itemid, NPC_HasItems (victm, itemid));
        
        B_TransferInventory_Weapons(victm,plunder);
    };
};

FUNC void B_TransferInventory_Armors (var C_Npc victm, var C_Npc plunder)
{
    if (Npc_GetInvItemBySlot (victm, 2, 0) > 0)
    {
	var int itemid;
            
        itemid = Hlp_GetInstanceID (item);

	B_ShowPlunderedItem (victm, plunder, item);

        CreateInvItems (plunder, itemid, NPC_HasItems (victm, itemid));
        
        NPC_RemoveInvItems (victm, itemid, NPC_HasItems (victm, itemid));
        
        B_TransferInventory_Armors (victm,plunder);
    };
};

FUNC void B_TransferInventory_Runen (var C_Npc victm, var C_Npc plunder)
{
    if (Npc_GetInvItemBySlot (victm, 3, 0) > 0)
    {
	if (C_ItmHasFlag(item, ITEM_KAT_ARMOR))
	{
		return;
	};

        var int itemid;
            
        itemid = Hlp_GetInstanceID (item);

	B_ShowPlunderedItem (victm, plunder, item);

        CreateInvItems (plunder, itemid, NPC_HasItems (victm, itemid));
        
        NPC_RemoveInvItems (victm, itemid, NPC_HasItems (victm, itemid));
        
        B_TransferInventory_Runen (victm,plunder);
    };
};

FUNC void B_TransferInventory_Magics (var C_Npc victm, var C_Npc plunder)
{
    if (Npc_GetInvItemBySlot (victm, 4, 0) > 0)
    {
	if (C_ItmHasFlag(item, ITEM_KAT_ARMOR))
	{
		return;
	};

        var int itemid;
            
        itemid = Hlp_GetInstanceID (item);

	B_ShowPlunderedItem (victm, plunder, item);

        CreateInvItems (plunder, itemid, NPC_HasItems (victm, itemid));
        
        NPC_RemoveInvItems (victm, itemid, NPC_HasItems (victm, itemid));
        
        B_TransferInventory_Magics (victm,plunder);
    };
};

FUNC void B_TransferInventory_Food (var C_Npc victm, var C_Npc plunder)
{
    if (Npc_GetInvItemBySlot (victm, 5, 0) > 0)
    {
	if (C_ItmHasFlag(item, ITEM_KAT_ARMOR))
	{
		return;
	};

        var int itemid;
            
        itemid = Hlp_GetInstanceID (item);

	B_ShowPlunderedItem (victm, plunder, item);

        CreateInvItems (plunder, itemid, NPC_HasItems (victm, itemid));
        
        NPC_RemoveInvItems (victm, itemid, NPC_HasItems (victm, itemid));
        
        B_TransferInventory_Food (victm,plunder);
    };
};

FUNC void B_TransferInventory_Potion (var C_Npc victm, var C_Npc plunder)
{
    if (Npc_GetInvItemBySlot (victm, 6, 0) > 0)
    {
	if (C_ItmHasFlag(item, ITEM_KAT_ARMOR))
	{
		return;
	};

        var int itemid;
            
        itemid = Hlp_GetInstanceID (item);

	B_ShowPlunderedItem (victm, plunder, item);

        CreateInvItems (plunder, itemid, NPC_HasItems (victm, itemid));
        
        NPC_RemoveInvItems (victm, itemid, NPC_HasItems (victm, itemid));
        
        B_TransferInventory_Potion (victm,plunder);
    };
};

FUNC void B_TransferInventory_Docs (var C_Npc victm, var C_Npc plunder)
{
    if (Npc_GetInvItemBySlot (victm, 7, 0) > 0)
    {
	if (C_ItmHasFlag(item, ITEM_KAT_ARMOR))
	{
		return;
	};

        var int itemid;
            
        itemid = Hlp_GetInstanceID (item);

	B_ShowPlunderedItem (victm, plunder, item);

        CreateInvItems (plunder, itemid, NPC_HasItems (victm, itemid));
        
        NPC_RemoveInvItems (victm, itemid, NPC_HasItems (victm, itemid));
        
        B_TransferInventory_Docs (victm,plunder);
    };
};

FUNC void B_TransferInventory_Misc (var C_Npc victm, var C_Npc plunder)
{
    if (Npc_GetInvItemBySlot (victm, 8, 0) > 0)
    {
	if (C_ItmHasFlag(item, ITEM_KAT_ARMOR))
	{
		return;
	};

        var int itemid;
            
        itemid = Hlp_GetInstanceID (item);

	B_ShowPlunderedItem (victm, plunder, item);

        CreateInvItems (plunder, itemid, NPC_HasItems (victm, itemid));
        
        NPC_RemoveInvItems (victm, itemid, NPC_HasItems (victm, itemid));
        
        B_TransferInventory_Misc (victm,plunder);
    };
};