var int Anglar_ItemsGiven_Chapter_1;
var int Anglar_ItemsGiven_Chapter_2;
var int Anglar_ItemsGiven_Chapter_3;
var int Anglar_ItemsGiven_Chapter_4;
var int Anglar_ItemsGiven_Chapter_5;


FUNC VOID B_GiveTradeInv_Mod_Anglar_EIS (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Anglar_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems (slf, ItFo_Fish, 12);
		
		Anglar_ItemsGiven_Chapter_1 = TRUE;
	};
	
	if ((Kapitel >= 2)
	&& (Anglar_ItemsGiven_Chapter_2 == FALSE))
	{
	
		CreateInvItems (slf, ItMi_Gold, 50); 

		CreateInvItems (slf, ItFo_Fish, 8);
	
		Anglar_ItemsGiven_Chapter_2 = TRUE;
	};

	if ((Kapitel >= 3)
	&& (Anglar_ItemsGiven_Chapter_3 == FALSE))
	{
	
		CreateInvItems (slf, ItMi_Gold, 100); 
	
		CreateInvItems (slf, ItFo_Fish, 4);

		Anglar_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Anglar_ItemsGiven_Chapter_4 == FALSE))
	{
	
		CreateInvItems (slf, ItMi_Gold, 150); 
		
		CreateInvItems (slf, ItFo_Fish, 19);
	
		Anglar_ItemsGiven_Chapter_4 = TRUE;
	};

	if ((Kapitel >= 5)
	&& (Anglar_ItemsGiven_Chapter_5 == FALSE))
	{
	
		CreateInvItems (slf, ItMi_Gold, 200); 
	
		CreateInvItems (slf, ItFo_Fish, 9);

		Anglar_ItemsGiven_Chapter_5 = TRUE;
	};
};
