var int Jora_ItemsGiven_Chapter_1;
var int Jora_ItemsGiven_Chapter_2;
var int Jora_ItemsGiven_Chapter_3;
var int Jora_ItemsGiven_Chapter_4;
var int Jora_ItemsGiven_Chapter_5;

FUNC VOID B_GiveTradeInv_Mod_Jora_NW (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Jora_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100); 
		CreateInvItems (slf, ItMi_GoldNugget_Addon, 2); 
		CreateInvItems (slf, ItSc_Light,1); 
		CreateInvItems (slf, ItPl_Health_Herb_01 , 2);
		CreateInvItems (slf, ItPl_Mushroom_01 , 3);
		CreateInvItems (slf, ItFo_Mutton, 8); 
		CreateInvItems (slf, ItRw_Arrow, 30);
		CreateInvItems (slf, ItRw_Bolt,  30);
		CreateInvItems (slf, ItMi_Seide, 1);
		CreateInvItems (slf, ItMi_Scoop, 1);

		CreateInvItems (slf, ItRw_Arrow, 100); 
		CreateInvItems (slf, ItRw_Bolt, 100); 

		CreateInvItems (slf, ItRu_TeleportSeaport, 1);
		
		// ------ Waffen ------
		CreateInvItems	(slf, ItRw_Crossbow_L_01, 1);

		CreateInvItems	(slf, ItRw_Bow_L_02, 1);

		CreateInvItems (slf, ItMw_Schiffsaxt, 1);
		CreateInvItems (slf, ItMw_Kriegskeule, 1);
		CreateInvItems (slf, ItMw_1h_Sld_Sword, 1);
		CreateInvItems (slf, ItMW_Addon_Knife01, 1);

		CreateInvItems (slf, ItMW_Addon_Stab05, 1);
		CreateInvItems (slf, ItMw_Stabkeule, 1);
		
		CreateInvItems (slf,ItAm_Prot_Point_01 , 1);
				
		Jora_ItemsGiven_Chapter_1 = TRUE;
	};
	
	if ((Kapitel >= 2)
	&& (Jora_ItemsGiven_Chapter_2 == FALSE))
	{

		CreateInvItems (slf, ItMi_Gold, 100); 
		CreateInvItems (slf, ItMiSwordraw,1); 
		CreateInvItems (slf, ItPl_Health_Herb_01 , 3);
		CreateInvItems (slf, ItPl_Mushroom_02 , 2);
		CreateInvItems (slf, ItFo_Fishsoup, 3); 
		CreateInvItems (slf, ItRw_Arrow, 60);
		CreateInvItems (slf, ItRw_Bolt,  60);

		CreateInvItems	(slf, ItRw_Bow_M_02, 1);

		CreateInvItems	(slf, ItMw_Schwert, 1);
		CreateInvItems	(slf, ItMw_Spicker, 1);
		CreateInvItems	(slf, ItMw_Morgenstern, 1);
		CreateInvItems	(slf, ItMw_Bartaxt, 1);

		CreateInvItems	(slf, ItMw_Streitaxt2, 1);
			
		Jora_ItemsGiven_Chapter_2 = TRUE;
	};

	if ((Kapitel >= 3)
	&& (Jora_ItemsGiven_Chapter_3 == FALSE))
	{

		CreateInvItems (slf, ItMi_Gold, 100); 
		CreateInvItems (slf,ItFo_Wine,1); 
		CreateInvItems (slf,ItPl_Mana_Herb_01 , 4);
		CreateInvItems (slf,ItPl_Health_Herb_02 , 3);
		CreateInvItems (slf, ItRw_Arrow, 60);
		CreateInvItems (slf, ItRw_Bolt,  60);

		CreateInvItems	(slf, ItRw_Crossbow_M_02, 1);

		CreateInvItems	(slf, ItRw_Bow_M_04, 1);

		CreateInvItems	(slf, ItMw_Streitkolben, 1);
		CreateInvItems	(slf, ItMw_Schwert5, 1);
		CreateInvItems	(slf, ItMw_Runenschwert, 1);
		CreateInvItems	(slf, ItMw_Rabenschnabel, 1);
		CreateInvItems	(slf, ItMw_Inquisitor, 1);

		CreateInvItems	(slf, ItMw_Zweihaender3, 1);
			
		Jora_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Jora_ItemsGiven_Chapter_4 == FALSE))
	{

		CreateInvItems (slf, ItMi_Gold, 150); 
		CreateInvItems (slf,ItMi_Rockcrystal,1); 
		CreateInvItems (slf,ItPl_Mana_Herb_02 , 4);
		CreateInvItems (slf,ItPl_Health_Herb_03 , 5);
		CreateInvItems (slf, ItRw_Arrow, 60);
		CreateInvItems (slf, ItRw_Bolt,  60);	
		CreateInvItems (slf, ItBe_Addon_STR_10, 1);

		CreateInvItems	(slf, ItRw_Crossbow_H_01, 1);

		CreateInvItems	(slf, ItRw_Bow_H_02, 1);

		CreateInvItems	(slf, ItMw_Folteraxt, 1);
		CreateInvItems	(slf, ItMW_Addon_Betty, 1);

		CreateInvItems	(slf, ItMw_Krummschwert, 1);
		CreateInvItems	(slf, ItMw_Barbarenstreitaxt, 1);

		Jora_ItemsGiven_Chapter_4 = TRUE;
	};

	if ((Kapitel >= 5)
	&& (Jora_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 200); 
		CreateInvItems (slf,ItMi_Coal,3); 
		CreateInvItems (slf,ItMi_Pitch,2); 
		CreateInvItems (slf,ItPl_Health_Herb_03 , 5);
		CreateInvItems (slf,ItPl_Mana_Herb_03 , 5);
		CreateInvItems (slf, ItRw_Arrow, 160);
		CreateInvItems (slf, ItRw_Bolt,  160);	

		CreateInvItems	(slf, ItRw_Crossbow_H_02, 1);

		CreateInvItems	(slf, ItMw_Drachenschneide, 1);
		
		Jora_ItemsGiven_Chapter_5 = TRUE;
	};
};
