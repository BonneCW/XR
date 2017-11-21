var int Fortuno_ItemsGiven_Chapter_1;
var int Fortuno_ItemsGiven_Chapter_2;
var int Fortuno_ItemsGiven_Chapter_3;
var int Fortuno_ItemsGiven_Chapter_4;
var int Fortuno_ItemsGiven_Chapter_5;

FUNC VOID B_GiveTradeInv_Mod_Fortuno_MT (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Fortuno_ItemsGiven_Chapter_1 == FALSE))
	{
	
		CreateInvItems (slf, ItMi_Gold, 100); 
		
		CreateInvItems (slf, ItFo_Water , 5);
		CreateInvItems (slf, ItFo_Bread , 3);
		CreateInvItems (slf, ItFo_Cheese, 2); 
		
		CreateInvItems (slf, ItMi_Joint, 30); 
		CreateInvItems (slf, ItMi_Traumruf, 10); 
		CreateInvItems (slf, ItMi_Addon_Joint_01, 15); 
		CreateInvItems (slf, ItMi_Addon_Joint_02, 20);
		CreateInvItems (slf, ItMi_SumpfTabak, 5);
		
		CreateInvItems (slf, ITWr_Addon_MCELIXIER_01, 1); 

		CreateInvItems (slf, ItRu_TeleportPsiCamp, 1);

		CreateInvItems	(slf, ItMi_HerbPaket, 1);
		CreateInvItems	(slf, ItPl_Zwillingsdorn, 1);
		
		Fortuno_ItemsGiven_Chapter_1 = TRUE;
	};

	if ((Kapitel >= 2)
	&& (Fortuno_ItemsGiven_Chapter_2 == FALSE))
	{
	
		CreateInvItems (slf, ItMi_Gold, 100); 

		CreateInvItems (slf,ItFo_Cheese, 5); 
		CreateInvItems (slf,ItFo_Mutton, 5); 
		CreateInvItems (slf,ItFo_Stew , 5); 
		CreateInvItems (slf,ItFo_Fishsoup, 5); 
		
		CreateInvItems (slf,ItMi_Joint, 10); 
		CreateInvItems (slf, ItMi_Traumruf, 5); 
		CreateInvItems (slf, ItMi_Addon_Joint_01, 10); 
		CreateInvItems (slf, ItMi_Addon_Joint_02, 10); 
		CreateInvItems	(slf, ItPl_Zwillingsdorn, 1);

		Fortuno_ItemsGiven_Chapter_2 = TRUE;
	};

	if ((Kapitel >= 3)
	&& (Fortuno_ItemsGiven_Chapter_3 == FALSE))
	{
	
		CreateInvItems (slf, ItMi_Gold, 100); 

		CreateInvItems (slf,ItFo_Cheese, 2); 
		CreateInvItems (slf,ItFo_Bacon , 2); 
		CreateInvItems (slf,ItFo_Mutton, 10); 
		CreateInvItems (slf,ItFo_Stew , 5); 
		CreateInvItems (slf,ItFo_Sausage, 5); 
		CreateInvItems (slf,ItFo_Booze, 5); 
		
		CreateInvItems (slf,ItMi_Joint, 10); 
		CreateInvItems (slf, ItMi_Traumruf, 5); 
		CreateInvItems (slf, ItMi_Addon_Joint_01, 10); 
		CreateInvItems (slf, ItMi_Addon_Joint_02, 10); 
		CreateInvItems	(slf, ItPl_Zwillingsdorn, 1);

		Fortuno_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Fortuno_ItemsGiven_Chapter_4 == FALSE))
	{
	
		CreateInvItems (slf, ItMi_Gold, 150); 
		
		CreateInvItems (slf,ItFo_Wine, 5); 
		CreateInvItems (slf,ItFo_Milk , 10); 
		CreateInvItems (slf,ItFo_Mutton, 5); 
		CreateInvItems (slf,ItFo_Stew , 5); 
		CreateInvItems (slf,ItFo_Sausage, 5); 
		CreateInvItems (slf,ItFo_Bacon, 5); 
		
		CreateInvItems (slf,ItMi_Joint, 10); 
		CreateInvItems (slf, ItMi_Traumruf, 5); 
		CreateInvItems (slf, ItMi_Addon_Joint_01, 10); 
		CreateInvItems (slf, ItMi_Addon_Joint_02, 10); 
		CreateInvItems	(slf, ItPl_Zwillingsdorn, 1);
		
		Fortuno_ItemsGiven_Chapter_4 = TRUE;
	};

	if ((Kapitel >= 5)
	&& (Fortuno_ItemsGiven_Chapter_5 == FALSE))
	{
	
		CreateInvItems (slf, ItMi_Gold, 200); 
	
		CreateInvItems (slf,ItFo_Wine, 2); 
		CreateInvItems (slf,ItFo_Milk , 5); 
		CreateInvItems (slf,ItFo_Mutton, 5); 
		CreateInvItems (slf,ItFo_Stew , 5); 
		CreateInvItems (slf,ItFo_Sausage, 5); 
		CreateInvItems (slf,ItFo_Bacon, 5); 
		
		CreateInvItems (slf,ItMi_Joint, 10); 
		CreateInvItems (slf, ItMi_Traumruf, 5); 
		CreateInvItems (slf, ItMi_Addon_Joint_01, 10); 
		CreateInvItems (slf, ItMi_Addon_Joint_02, 10); 
		CreateInvItems	(slf, ItPl_Zwillingsdorn, 1);

		Fortuno_ItemsGiven_Chapter_5 = TRUE;
	};
};