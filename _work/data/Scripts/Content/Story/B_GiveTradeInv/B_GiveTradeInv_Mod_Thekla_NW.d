var int Thekla_NW_ItemsGiven_Chapter_1;
var int Thekla_NW_ItemsGiven_Chapter_2;
var int Thekla_NW_ItemsGiven_Chapter_3;
var int Thekla_NW_ItemsGiven_Chapter_4;
var int Thekla_NW_ItemsGiven_Chapter_5;
var int Thekla_NW_ItemsGiven_Chapter_6;

FUNC VOID B_GiveTradeInv_Mod_Thekla_NW (var C_NPC slf)
{
	if (Kapitel >= 1)
	&& (Thekla_NW_ItemsGiven_Chapter_1 == FALSE)
	{
		CreateInvItems	(slf, ItFo_Apple, 2);
		CreateInvItems	(slf, ItFo_Bacon, 2);
		CreateInvItems	(slf, ItFo_Bread, 10);
		CreateInvItems	(slf, ItFo_MuttonRaw, 15);
		CreateInvItems	(slf, ItFo_Sausage, 4);
		CreateInvItems	(slf, ItFo_Honey, 5);
		CreateInvItems	(slf, ItFo_Water, 10);
		CreateInvItems	(slf, ItFo_Beer, 14);
		CreateInvItems	(slf, ItFo_Wine, 14);
		CreateInvItems	(slf, ItFo_Milk, 8);
		CreateInvItems	(slf, ItMi_Scoop, 1);

		Thekla_NW_ItemsGiven_Chapter_1 = TRUE;
	};
};