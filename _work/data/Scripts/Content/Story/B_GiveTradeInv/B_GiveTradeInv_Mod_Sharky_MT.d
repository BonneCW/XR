var int Sharky_ItemsGiven_Chapter_1;
var int Sharky_ItemsGiven_Chapter_2;
var int Sharky_ItemsGiven_Chapter_3;
var int Sharky_ItemsGiven_Chapter_4;
var int Sharky_ItemsGiven_Chapter_5;

FUNC VOID B_GiveTradeInv_Mod_Sharky_MT (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Sharky_ItemsGiven_Chapter_1 == FALSE))
	{	
		CreateInvItems (slf, Itlstorch, 3); 
		CreateInvItems (slf, ItKe_Lockpick, 5); 
		CreateInvItems (slf, ItMi_Nugget, 3); 
		CreateInvItems (slf, ItPo_Health_01, 3); 
		CreateInvItems (slf, ItFo_Booze, 6); 
		CreateInvItems (slf, ItPl_Riceplant, 13); 
		CreateInvItems (slf, ItFo_Water, 8); 
		CreateInvItems (slf, ItMi_Pan, 1); 
		CreateInvItems (slf, ItMi_Scoop, 1); 
		CreateInvItems (slf, ItMi_Salpeter, 2); 
		
		Sharky_ItemsGiven_Chapter_1 = TRUE;
	};

	if ((Kapitel >= 2)
	&& (Sharky_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems (slf, Itlstorch, 3); 
		CreateInvItems (slf, ItKe_Lockpick, 5); 
		CreateInvItems (slf, ItMi_Nugget, 3); 
		CreateInvItems (slf, ItPo_Health_01, 3); 
		CreateInvItems (slf, ItFo_Booze, 6); 
		CreateInvItems (slf, ItPl_Riceplant, 13); 
		CreateInvItems (slf, ItFo_Water, 8); 
		CreateInvItems (slf, ItMi_Pan, 1); 
		CreateInvItems (slf, ItMi_Scoop, 1); 
		CreateInvItems (slf, ItMi_Salpeter, 2); 

		Sharky_ItemsGiven_Chapter_2 = TRUE;
	};

	if ((Kapitel >= 3)
	&& (Sharky_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems (slf, Itlstorch, 3); 
		CreateInvItems (slf, ItKe_Lockpick, 5); 
		CreateInvItems (slf, ItMi_Nugget, 3); 
		CreateInvItems (slf, ItPo_Health_01, 3); 
		CreateInvItems (slf, ItFo_Booze, 6); 
		CreateInvItems (slf, ItPl_Riceplant, 13); 
		CreateInvItems (slf, ItFo_Water, 8); 
		CreateInvItems (slf, ItMi_Pan, 1); 
		CreateInvItems (slf, ItMi_Scoop, 1); 
		CreateInvItems (slf, ItMi_Salpeter, 2); 

		Sharky_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Sharky_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems (slf, Itlstorch, 3); 
		CreateInvItems (slf, ItKe_Lockpick, 5); 
		CreateInvItems (slf, ItMi_Nugget, 3); 
		CreateInvItems (slf, ItPo_Health_01, 3); 
		CreateInvItems (slf, ItFo_Booze, 6); 
		CreateInvItems (slf, ItPl_Riceplant, 13); 
		CreateInvItems (slf, ItFo_Water, 8); 
		CreateInvItems (slf, ItMi_Pan, 1); 
		CreateInvItems (slf, ItMi_Scoop, 1); 
		CreateInvItems (slf, ItMi_Salpeter, 2); 
		
		Sharky_ItemsGiven_Chapter_4 = TRUE;
	};

	if ((Kapitel >= 5)
	&& (Sharky_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems (slf, Itlstorch, 3); 
		CreateInvItems (slf, ItKe_Lockpick, 5); 
		CreateInvItems (slf, ItMi_Nugget, 3); 
		CreateInvItems (slf, ItPo_Health_01, 3); 
		CreateInvItems (slf, ItFo_Booze, 6); 
		CreateInvItems (slf, ItPl_Riceplant, 13); 
		CreateInvItems (slf, ItFo_Water, 8); 
		CreateInvItems (slf, ItMi_Pan, 1); 
		CreateInvItems (slf, ItMi_Scoop, 1); 
		CreateInvItems (slf, ItMi_Salpeter, 2); 

		Sharky_ItemsGiven_Chapter_5 = TRUE;
	};
};