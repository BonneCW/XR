var int Kardif_ItemsGiven_Chapter_1;
var int Kardif_ItemsGiven_Chapter_2;
var int Kardif_ItemsGiven_Chapter_3;
var int Kardif_ItemsGiven_Chapter_4;
var int Kardif_ItemsGiven_Chapter_5;

FUNC VOID B_GiveTradeInv_Mod_Kardif_NW (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Kardif_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 80); 

		CreateInvItems (slf, ItFo_FishSoup, 3); 
		CreateInvItems (slf, ItFo_Mutton, 1); 
		CreateInvItems (slf, ItFo_Fish, 4); 
		CreateInvItems (slf, ItFo_Booze, 12); 
		CreateInvItems (slf, ItFo_Beer, 14); 
		
		CreateInvItems   (slf, ItFo_Wine,	13);
		
		CreateInvItems   (slf, ItMi_SumpfTabak,	2);
		
		Kardif_ItemsGiven_Chapter_1 = TRUE;
	};

	if ((Kapitel >= 2)
	&& (Kardif_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100); 

		CreateInvItems (slf, ItFo_Sausage, 2); 
		CreateInvItems (slf, ItFo_Fish, 4); 
		CreateInvItems (slf, ItFo_Booze, 4); 
		CreateInvItems (slf, ItFo_Beer, 8); 
		
		CreateInvItems   (slf, ItFo_Wine,	6);
		
		IF (Knows_SecretSign == TRUE)			
		{
			CreateInvItems (self, ItKe_Lockpick, 20);
		};
		Kardif_ItemsGiven_Chapter_2 = TRUE;
	};

	if ((Kapitel >= 3)
	&& (Kardif_ItemsGiven_Chapter_3 == FALSE))
	{
	
		CreateInvItems (slf, ItMi_Gold, 150); 

		CreateInvItems (slf, ItFo_Sausage, 2); 
		CreateInvItems (slf, ItFo_FishSoup, 3); 
		CreateInvItems (slf, ItFo_Mutton, 1); 
		CreateInvItems (slf, ItFo_Wine, 2); 
		CreateInvItems (slf, ItFo_Beer, 8); 
		
		IF (Knows_SecretSign == TRUE)			
		{
			CreateInvItems (self, ItKe_Lockpick, 20);
		};
		
		Kardif_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Kardif_ItemsGiven_Chapter_4 == FALSE))
	{
	
		CreateInvItems (slf, ItMi_Gold, 200); 
		
		
		CreateInvItems (slf, ItFo_Sausage, 2); 
		CreateInvItems (slf, ItFo_FishSoup, 3); 
		CreateInvItems (slf, ItFo_Mutton, 1); 
		CreateInvItems (slf, ItFo_Fish, 4); 
		CreateInvItems (slf, ItFo_Wine, 2); 
		CreateInvItems (slf, ItFo_Booze, 4); 
		CreateInvItems (slf, ItFo_Beer, 8); 
		
		IF (Knows_SecretSign == TRUE)			
		{
			CreateInvItems (self, ItKe_Lockpick, 20);
		};
		
		Kardif_ItemsGiven_Chapter_4 = TRUE;
	};

	if ((Kapitel >= 5)
	&& (Kardif_ItemsGiven_Chapter_5 == FALSE))
	{
	
		CreateInvItems (slf, ItMi_Gold, 300); 
	
		CreateInvItems (slf, ItFo_Sausage, 3); 
		CreateInvItems (slf, ItFo_FishSoup, 5); 
		CreateInvItems (slf, ItFo_Mutton, 7); 
		CreateInvItems (slf, ItFo_Fish, 8); 
		CreateInvItems (slf, ItFo_Wine, 6); 
		CreateInvItems (slf, ItFo_Booze, 8); 
		CreateInvItems (slf, ItFo_Beer, 8); 
		
		IF (Knows_SecretSign == TRUE)			
		{
			CreateInvItems (self, ItKe_Lockpick, 20);
		};
		
		Kardif_ItemsGiven_Chapter_5 = TRUE;
	};
};

