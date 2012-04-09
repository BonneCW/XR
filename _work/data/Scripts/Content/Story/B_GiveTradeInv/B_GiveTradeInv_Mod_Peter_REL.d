var int Peter_ItemsGiven_Chapter_1;
var int Peter_ItemsGiven_Chapter_2;
var int Peter_ItemsGiven_Chapter_3;
var int Peter_ItemsGiven_Chapter_4;
var int Peter_ItemsGiven_Chapter_5;

FUNC VOID B_GiveTradeInv_Mod_Peter_REL (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Peter_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 50); 
		CreateInvItems (slf, ItFo_Wine, 16); 
		CreateInvItems (slf, ItFo_Booze, 13); 
		CreateInvItems (slf, ItFo_Beer, 15); 
		CreateInvItems (slf, ItFo_Apple, 5); 
		CreateInvItems (slf, ItFo_Stew, 5); 
		CreateInvItems (slf, ItFo_LammPoekelfleisch, 5); 
			
		Peter_ItemsGiven_Chapter_1 = TRUE;
	};
	if ((Kapitel >= 2)
	&& (Peter_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 50); 
		CreateInvItems (slf, ItFo_Wine, 8); 
		CreateInvItems (slf, ItFo_Booze, 6); 
		CreateInvItems (slf, ItFo_Beer, 10); 
		CreateInvItems (slf, ItFo_Cheese, 5); 
		CreateInvItems (slf, ItFo_Bacon, 5); 
		CreateInvItems (slf, ItFo_Sausage, 5); 
		CreateInvItems (slf, ItFo_Honey, 5); 
		
		Peter_ItemsGiven_Chapter_2 = TRUE;
	};

	if ((Kapitel >= 3)
	&& (Peter_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 50); 
		CreateInvItems (slf, ItFo_Wine, 8); 
		CreateInvItems (slf, ItFo_Booze, 10); 
		CreateInvItems (slf, ItFo_Beer, 12); 
		CreateInvItems (slf, ItFo_Bacon, 5); 
		CreateInvItems (slf, ItFo_Sausage, 5); 
		CreateInvItems (slf, ItFo_Honey, 5); 

		Peter_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Peter_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 150); 
		CreateInvItems (slf, ItFo_Wine, 14); 
		CreateInvItems (slf, ItFo_Booze, 8); 
		CreateInvItems (slf, ItFo_Beer, 12); 
		CreateInvItems (slf, ItFo_Apple, 5); 
		CreateInvItems (slf, ItFo_Stew, 5); 
		
		Peter_ItemsGiven_Chapter_4 = TRUE;
	};

	if ((Kapitel >= 5)
	&& (Peter_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 150); 
		CreateInvItems (slf, ItFo_Wine, 10); 
		CreateInvItems (slf, ItFo_Booze, 8); 
		CreateInvItems (slf, ItFo_Beer, 10); 
		CreateInvItems (slf, ItFo_Apple, 5); 
		CreateInvItems (slf, ItFo_Stew, 5); 
		CreateInvItems (slf, ItFo_Bacon, 5); 
		CreateInvItems (slf, ItFo_Sausage, 5); 
		CreateInvItems (slf, ItFo_Honey, 5); 

		Peter_ItemsGiven_Chapter_5 = TRUE;
	};
};
