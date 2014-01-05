var int Brian_ItemsGiven_Chapter_1;
var int Brian_ItemsGiven_Chapter_2;
var int Brian_ItemsGiven_Chapter_3;
var int Brian_ItemsGiven_Chapter_4;
var int Brian_ItemsGiven_Chapter_5;

FUNC VOID B_GiveTradeInv_Mod_Brian_NW (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Brian_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 20); 
		CreateInvItems (slf, ItMiSwordraw, 2); 
		CreateInvItems	(slf, ItMi_GoldNugget_Addon, 1);
		CreateInvItems	(slf, Pfeilspitze, 15);
		
		Brian_ItemsGiven_Chapter_1 = TRUE;
	};

	if ((Kapitel >= 2)
	&& (Brian_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 20); 
		CreateInvItems (slf, ItMiSwordraw, 1); 
		CreateInvItems	(slf, ItMi_GoldNugget_Addon, 1);
		CreateInvItems	(slf, Pfeilspitze, 30);
		
		Brian_ItemsGiven_Chapter_2 = TRUE;
	};

	if ((Kapitel >= 3)
	&& (Brian_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 20); 
		CreateInvItems (slf, ItMiSwordraw, 1); 
		CreateInvItems	(slf, ItMi_GoldNugget_Addon, 1);
		CreateInvItems	(slf, Pfeilspitze, 45);
		
		Brian_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Brian_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 20); 
		CreateInvItems (slf, ItMiSwordraw, 1); 
		CreateInvItems	(slf, ItMi_GoldNugget_Addon, 1);
		CreateInvItems	(slf, Pfeilspitze, 60);
		
		Brian_ItemsGiven_Chapter_4 = TRUE;
	};

	if ((Kapitel >= 5)
	&& (Brian_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 40); 
		CreateInvItems (slf, ItMiSwordraw, 1); 
		CreateInvItems	(slf, ItMi_GoldNugget_Addon, 1);
		CreateInvItems	(slf, Pfeilspitze, 75);
		
		Brian_ItemsGiven_Chapter_5 = TRUE;
	};
};
