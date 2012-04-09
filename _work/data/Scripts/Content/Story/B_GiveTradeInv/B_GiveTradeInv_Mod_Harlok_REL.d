var int Harlok_ItemsGiven_Chapter_1;
var int Harlok_ItemsGiven_Chapter_2;
var int Harlok_ItemsGiven_Chapter_3;
var int Harlok_ItemsGiven_Chapter_4;
var int Harlok_ItemsGiven_Chapter_5;

FUNC VOID B_GiveTradeInv_Mod_Harlok_REL (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Harlok_ItemsGiven_Chapter_1 == FALSE))
	{
	
		CreateInvItems (slf, ItMi_Joint, 30); 
		CreateInvItems (slf, ItMi_Traumruf, 10); 
		CreateInvItems (slf, ItMi_Addon_Joint_01, 15); 
		CreateInvItems (slf, ItMi_Addon_Joint_02, 20);
		
		Harlok_ItemsGiven_Chapter_1 = TRUE;
	};

	if ((Kapitel >= 2)
	&& (Harlok_ItemsGiven_Chapter_2 == FALSE))
	{
	
		CreateInvItems (slf,ItMi_Joint, 10); 
		CreateInvItems (slf, ItMi_Traumruf, 5); 
		CreateInvItems (slf, ItMi_Addon_Joint_01, 10); 
		CreateInvItems (slf, ItMi_Addon_Joint_02, 10); 

		Harlok_ItemsGiven_Chapter_2 = TRUE;
	};

	if ((Kapitel >= 3)
	&& (Harlok_ItemsGiven_Chapter_3 == FALSE))
	{
	
		CreateInvItems (slf,ItMi_Joint, 10); 
		CreateInvItems (slf, ItMi_Traumruf, 5); 
		CreateInvItems (slf, ItMi_Addon_Joint_01, 10); 
		CreateInvItems (slf, ItMi_Addon_Joint_02, 10); 

		Harlok_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Harlok_ItemsGiven_Chapter_4 == FALSE))
	{
	
		CreateInvItems (slf,ItMi_Joint, 10); 
		CreateInvItems (slf, ItMi_Traumruf, 5); 
		CreateInvItems (slf, ItMi_Addon_Joint_01, 10); 
		CreateInvItems (slf, ItMi_Addon_Joint_02, 10); 
		
		Harlok_ItemsGiven_Chapter_4 = TRUE;
	};

	if ((Kapitel >= 5)
	&& (Harlok_ItemsGiven_Chapter_5 == FALSE))
	{
	
		CreateInvItems (slf,ItMi_Joint, 10); 
		CreateInvItems (slf, ItMi_Traumruf, 5); 
		CreateInvItems (slf, ItMi_Addon_Joint_01, 10); 
		CreateInvItems (slf, ItMi_Addon_Joint_02, 10); 

		Harlok_ItemsGiven_Chapter_5 = TRUE;
	};
};