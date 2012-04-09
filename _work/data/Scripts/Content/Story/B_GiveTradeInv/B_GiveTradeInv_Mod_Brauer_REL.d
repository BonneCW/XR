var int Brauer_ItemsGiven_Chapter_1;
var int Brauer_ItemsGiven_Chapter_2;
var int Brauer_ItemsGiven_Chapter_3;
var int Brauer_ItemsGiven_Chapter_4;
var int Brauer_ItemsGiven_Chapter_5;

FUNC VOID B_GiveTradeInv_Mod_Brauer_REL (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Brauer_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 50); 
		CreateInvItems (slf, ItFo_Beer, 15); 
			
		Brauer_ItemsGiven_Chapter_1 = TRUE;
	};
	if ((Kapitel >= 2)
	&& (Brauer_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 50); 
		CreateInvItems (slf, ItFo_Booze, 6); 
		
		Brauer_ItemsGiven_Chapter_2 = TRUE;
	};

	if ((Kapitel >= 3)
	&& (Brauer_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 50); 
		CreateInvItems (slf, ItFo_Booze, 10); 

		Brauer_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Brauer_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 150); 
		CreateInvItems (slf, ItFo_Beer, 12); 
		
		Brauer_ItemsGiven_Chapter_4 = TRUE;
	};

	if ((Kapitel >= 5)
	&& (Brauer_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 150); 
		CreateInvItems (slf, ItFo_Beer, 10); 

		Brauer_ItemsGiven_Chapter_5 = TRUE;
	};
};
