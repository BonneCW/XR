var int Snaf_ItemsGiven_Chapter_1;
var int Snaf_ItemsGiven_Chapter_2;
var int Snaf_ItemsGiven_Chapter_3;
var int Snaf_ItemsGiven_Chapter_4;
var int Snaf_ItemsGiven_Chapter_5;

FUNC VOID B_GiveTradeInv_Mod_Snaf_MT (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Snaf_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100); 
		CreateInvItems	(slf, ItFo_Apple, 2);
		CreateInvItems	(slf, ItFo_Bacon, 2);
		CreateInvItems	(slf, ItFo_Bread, 10);
		CreateInvItems	(slf, ItFo_Sausage, 4);
		CreateInvItems	(slf, ItFo_Honey, 5);
		CreateInvItems	(slf, ItFo_Water, 10);
		CreateInvItems	(slf, ItFo_Beer, 14);
		CreateInvItems	(slf, ItFo_Wine, 14);
		CreateInvItems	(slf, ItFo_Milk, 8);
		CreateInvItems	(slf, ItFo_Pilzsuppe, 3);
		CreateInvItems	(slf, ItFo_Fleischwanzenragout, 5);
		CreateInvItems	(slf, ItMi_Scoop, 2);
		
		Snaf_ItemsGiven_Chapter_1 = TRUE;
	};
	if ((Kapitel >= 2)
	&& Snaf_ItemsGiven_Chapter_2 == FALSE)
	{
		CreateInvItems (slf, ItPl_Forestberry, 3); 
		CreateInvItems (slf, ItFo_Stew, 5); 
		CreateInvItems (slf, ItFo_Water, 4); 
		CreateInvItems (slf, ItFo_Wine, 8);
		CreateInvItems (slf, ItFo_Beer, 8);
		CreateInvItems	(slf, ItFo_Pilzsuppe, 3);
		CreateInvItems	(slf, ItFo_Fleischwanzenragout, 5);	
		
		Snaf_ItemsGiven_Chapter_2 = TRUE;
	};	
	
	if ((Kapitel >= 3)
	&& (Snaf_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100); 
		CreateInvItems (slf, ItPl_Forestberry, 3); 
		CreateInvItems (slf, ItFo_Bread, 2); 
		CreateInvItems (slf, ItFo_Sausage, 3); 
		CreateInvItems (slf, ItFo_Wine, 4);
		CreateInvItems (slf, ItFo_Beer, 8);
		CreateInvItems	(slf, ItFo_Pilzsuppe, 3);
		CreateInvItems	(slf, ItFo_Fleischwanzenragout, 5);		
		
		Snaf_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Snaf_ItemsGiven_Chapter_4 == FALSE))
	{
	
		CreateInvItems (slf, ItMi_Gold, 150); 
		CreateInvItems (slf,ItPl_Mana_Herb_02,2);
		CreateInvItems (slf, ItPl_Health_Herb_02, 3); 
		CreateInvItems (slf, ItMi_Lute, 1); 
		CreateInvItems (slf, ItFo_Sausage, 3); 
		CreateInvItems (slf, ItFo_Wine, 4);
		CreateInvItems (slf, ItFo_Beer, 8);
		CreateInvItems	(slf, ItFo_Pilzsuppe, 3);
		CreateInvItems	(slf, ItFo_Fleischwanzenragout, 5);	

		Snaf_ItemsGiven_Chapter_4 = TRUE;
	};

	if ((Kapitel >= 5)
	&& (Snaf_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 200); 
		CreateInvItems (slf, ItPl_Health_Herb_02, 2); 
		CreateInvItems (slf, ItFo_Bacon, 1); 
		CreateInvItems (slf, ItFo_Fishsoup, 1); 
		CreateInvItems	(slf, ItFo_Pilzsuppe, 3);
		CreateInvItems	(slf, ItFo_Fleischwanzenragout, 5);		
		
		Snaf_ItemsGiven_Chapter_5 = TRUE;
	};
};
