var int Borka_ItemsGiven_Chapter_1;
var int Borka_ItemsGiven_Chapter_2;
var int Borka_ItemsGiven_Chapter_3;
var int Borka_ItemsGiven_Chapter_4;
var int Borka_ItemsGiven_Chapter_5;

FUNC VOID B_GiveTradeInv_Mod_Borka_NW (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Borka_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems (slf, ItMi_Joint, 13); 
		
		Borka_ItemsGiven_Chapter_1 = TRUE;
	};

	if ((Kapitel >= 2)		//Joly: wird eh erst ab 2. Kapitel vom SC erreicht.
	&& (Borka_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems (slf, ItMi_Joint, 13); 

		Borka_ItemsGiven_Chapter_2 = TRUE;
	};

	if ((Kapitel >= 3)
	&& (Borka_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems (slf, ItMi_Joint, 13); 

		Borka_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Borka_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems (slf, ItMi_Joint, 13); 
		
		Borka_ItemsGiven_Chapter_4 = TRUE;
	};

	if ((Kapitel >= 5)
	&& (Borka_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems (slf, ItMi_Joint, 13); 
		
		Borka_ItemsGiven_Chapter_5 = TRUE;
	};
};
