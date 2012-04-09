var int Matteo_ItemsGiven_Chapter_1;
var int Matteo_ItemsGiven_Chapter_2;
var int Matteo_ItemsGiven_Chapter_3;
var int Matteo_ItemsGiven_Chapter_4;
var int Matteo_ItemsGiven_Chapter_5;

FUNC VOID B_GiveTradeInv_Mod_Matteo_NW (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Matteo_ItemsGiven_Chapter_1 == FALSE))
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
		CreateInvItems	(slf, ItMi_Kerze, 1);
		CreateInvItems	(slf, ItMi_Seide, 1);
		CreateInvItems	(slf, ItMi_Pan, 1);
		CreateInvItems	(slf, ItMi_Scoop, 1);
		
		Matteo_ItemsGiven_Chapter_1 = TRUE;
	};
	if ((Kapitel >= 2)
	&& Matteo_ItemsGiven_Chapter_2 == FALSE)
	{
		CreateInvItems (slf,itmi_broom,2);
		CreateInvItems (slf,ItLsTorch,5);
		CreateInvItems (slf, ItPl_Forestberry, 3); 
		CreateInvItems (slf, ItFo_Stew, 5); 
		CreateInvItems (slf, ItFo_Water, 4); 
		CreateInvItems (slf, ItFo_Wine, 8);
		CreateInvItems (slf, ItFo_Beer, 8);
		CreateInvItems (slf, ItRw_Arrow, 30);		
		
		Matteo_ItemsGiven_Chapter_2 = TRUE;
	};	
	
	if ((Kapitel >= 3)
	&& (Matteo_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100); 
		CreateInvItems (slf,ItLsTorch,5);
		CreateInvItems (slf, ItPl_Forestberry, 3); 
		CreateInvItems (slf, ItFo_Bread, 2); 
		CreateInvItems (slf, ItFo_Sausage, 3); 
		CreateInvItems (slf, ItFo_Wine, 4);
		CreateInvItems (slf, ItFo_Beer, 8);
		CreateInvItems (slf, ItRw_Arrow, 50);			
		
		Matteo_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Matteo_ItemsGiven_Chapter_4 == FALSE))
	{
	
		CreateInvItems (slf, ItMi_Gold, 150); 
		CreateInvItems (slf,ItPl_Mana_Herb_02,2);
		CreateInvItems (slf, ItPl_Health_Herb_02, 3); 
		CreateInvItems (slf, ItMi_Lute, 1); 
		CreateInvItems (slf, ItFo_Sausage, 3); 
		CreateInvItems (slf, ItFo_Wine, 4);
		CreateInvItems (slf, ItFo_Beer, 8);
		CreateInvItems (slf, ItRw_Arrow, 100);		

		Matteo_ItemsGiven_Chapter_4 = TRUE;
	};

	if ((Kapitel >= 5)
	&& (Matteo_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 200); 
		CreateInvItems (slf, ItPl_Health_Herb_02, 2); 
		CreateInvItems (slf, ItMi_Lute, 1); 
		CreateInvItems (slf, ItFo_Bacon, 1); 
		CreateInvItems (slf, ItFo_Fishsoup, 1); 
		CreateInvItems (slf, ItMiSwordraw, 1); 
		CreateInvItems (slf, ItRw_Arrow, 20);			
		
		Matteo_ItemsGiven_Chapter_5 = TRUE;
	};
};
