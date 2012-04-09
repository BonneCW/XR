var int Skip_ItemsGiven_Chapter_1;
var int Skip_ItemsGiven_Chapter_2;
var int Skip_ItemsGiven_Chapter_3;
var int Skip_ItemsGiven_Chapter_4;
var int Skip_ItemsGiven_Chapter_5;

FUNC VOID B_GiveTradeInv_Mod_Skip_AW (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Skip_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100); 

		CreateInvItems (slf, ItFo_Addon_Rum,4);
		CreateInvItems (slf, ItFo_Addon_Grog,8);
		CreateInvItems (slf, ItFo_Booze,6);
		CreateInvItems (slf, ItFo_Beer,12);
		CreateInvItems (slf, Itfo_Wine,4);
		CreateInvItems (slf, ItFo_Bacon,2);
		CreateInvItems (slf,ItFo_Water , 5);
		CreateInvItems (slf, ItMi_Flask,4);
		CreateInvItems (slf, ItPl_SwampHerb,4);
		CreateInvItems (slf, ItMi_Joint,1);
		CreateInvItems (slf, ItWr_Map_AddonWorld,1);
		
		CreateInvItems (slf, Ri_ProtFire02,1);
		CreateInvItems (slf, ItWr_Rezept_Rumtopf,1);
						
		Skip_ItemsGiven_Chapter_1 = TRUE;
	};
	
	if ((Kapitel >= 2)
	&& (Skip_ItemsGiven_Chapter_2 == FALSE))
	{
	
		CreateInvItems (slf, ItMi_Gold, 100); 

		CreateInvItems (slf, ItFo_Addon_Rum,4);
		CreateInvItems (slf, ItFo_Addon_Grog,8);
		CreateInvItems (slf, ItFo_Booze,6);
		CreateInvItems (slf, ItFo_Beer,12);
		CreateInvItems (slf,ItFo_Water , 5);
		CreateInvItems (slf, Itfo_Wine,4);
		CreateInvItems (slf, ItFo_Bacon,2);
		CreateInvItems (slf, ItMi_Flask,4);
		CreateInvItems (slf, ItPl_SwampHerb,4);
		CreateInvItems (slf, ItMi_Joint,1);
				
		Skip_ItemsGiven_Chapter_2 = TRUE;
	};

	if ((Kapitel >= 3)
	&& (Skip_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100); 

		CreateInvItems (slf, ItFo_Addon_Rum,4);
		CreateInvItems (slf, ItFo_Addon_Grog,8);
		CreateInvItems (slf, ItFo_Booze,6);
		CreateInvItems (slf, ItFo_Beer,12);
		CreateInvItems (slf, Itfo_Wine,4);
		CreateInvItems (slf,ItFo_Water , 5);
		CreateInvItems (slf, ItFo_Bacon,2);
		CreateInvItems (slf, ItMi_Flask,4);
		CreateInvItems (slf, ItPl_SwampHerb,4);
		CreateInvItems (slf, ItMi_Joint,1);

		Skip_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Skip_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100); 

		CreateInvItems (slf, ItFo_Addon_Rum,4);
		CreateInvItems (slf, ItFo_Addon_Grog,8);
		CreateInvItems (slf, ItFo_Booze,6);
		CreateInvItems (slf, ItFo_Beer,12);
		CreateInvItems (slf, Itfo_Wine,4);
		CreateInvItems (slf, ItFo_Water , 5);
		CreateInvItems (slf, ItFo_Bacon,2);
		CreateInvItems (slf, ItMi_Flask,4);
		CreateInvItems (slf, ItPl_SwampHerb,4);
		CreateInvItems (slf, ItMi_Joint,1);
		
		Skip_ItemsGiven_Chapter_4 = TRUE;
	};

	if ((Kapitel >= 5)
	&& (Skip_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100); 

		CreateInvItems (slf, ItFo_Addon_Rum,4);
		CreateInvItems (slf, ItFo_Addon_Grog,8);
		CreateInvItems (slf, ItFo_Booze,6);
		CreateInvItems (slf, ItFo_Beer,12);
		CreateInvItems (slf, Itfo_Wine,4);
		CreateInvItems (slf, ItFo_Bacon,2);
		CreateInvItems (slf, ItMi_Flask,4);
		CreateInvItems (slf, ItPl_SwampHerb,4);
		CreateInvItems (slf, ItMi_Joint,1);
		
		Skip_ItemsGiven_Chapter_5 = TRUE;
	};
};
