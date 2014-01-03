var int Erika_ItemsGiven_Chapter_1;
var int Erika_ItemsGiven_Chapter_2;
var int Erika_ItemsGiven_Chapter_3;
var int Erika_ItemsGiven_Chapter_4;
var int Erika_ItemsGiven_Chapter_5;

FUNC VOID B_GiveTradeInv_Mod_Erika_REL (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Erika_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100); 
		CreateInvItems (slf, ItMi_GoldNugget_Addon, 2); 
		CreateInvItems (slf, ItSc_Light,1); 
		CreateInvItems (slf, ItPl_Health_Herb_01 , 2);
		CreateInvItems (slf, ItPl_Mushroom_01 , 3);
		CreateInvItems (slf, ItFo_Mutton, 8); 
		CreateInvItems (slf, ItRw_Arrow, 30);
		CreateInvItems (slf, ItRw_Bolt,  30);
		CreateInvItems	(slf, ItMi_Seide, 1);
		CreateInvItems	(slf, ItFo_BoozeRudolf, 1);
		CreateInvItems	(slf, ItFo_Addon_Grog, 1);
		
		// ------ Waffen ------
		
		CreateInvItems (slf,ItAm_Prot_Point_01 , 1);
				
		Erika_ItemsGiven_Chapter_1 = TRUE;
	};
	
	if ((Kapitel >= 2)
	&& (Erika_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100); 
		CreateInvItems (slf,ItMiSwordraw,1); 
		CreateInvItems (slf,ItPl_Health_Herb_01 , 3);
		CreateInvItems (slf,ItPl_Mushroom_02 , 2);
		CreateInvItems (slf,ItFo_Fishsoup, 3); 
		CreateInvItems (slf, ItRw_Arrow, 60);
		CreateInvItems (slf, ItRw_Bolt,  60);
			
		Erika_ItemsGiven_Chapter_2 = TRUE;
	};

	if ((Kapitel >= 3)
	&& (Erika_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100); 
		CreateInvItems (slf,ItFo_Wine,1); 
		CreateInvItems (slf,ItPl_Mana_Herb_01 , 4);
		CreateInvItems (slf,ItPl_Health_Herb_02 , 3);
		CreateInvItems (slf, ItRw_Arrow, 60);
		CreateInvItems (slf, ItRw_Bolt,  60);
			
		Erika_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Erika_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 150); 
		CreateInvItems (slf,ItMi_Rockcrystal,1); 
		CreateInvItems (slf,ItPl_Mana_Herb_02 , 4);
		CreateInvItems (slf,ItPl_Health_Herb_03 , 5);
		CreateInvItems (slf, ItRw_Arrow, 60);
		CreateInvItems (slf, ItRw_Bolt,  60);	
		Erika_ItemsGiven_Chapter_4 = TRUE;
	};

	if ((Kapitel >= 5)
	&& (Erika_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 200); 
		CreateInvItems (slf,ItMi_Coal,3); 
		CreateInvItems (slf,ItMi_Pitch,2); 
		CreateInvItems (slf,ItPl_Health_Herb_03 , 5);
		CreateInvItems (slf,ItPl_Mana_Herb_03 , 5);
		CreateInvItems (slf, ItRw_Arrow, 160);
		CreateInvItems (slf, ItRw_Bolt,  160);	
		
		Erika_ItemsGiven_Chapter_5 = TRUE;
	};
};
