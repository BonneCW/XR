var int Eduard_ItemsGiven_Chapter_1;
var int Eduard_ItemsGiven_Chapter_2;
var int Eduard_ItemsGiven_Chapter_3;
var int Eduard_ItemsGiven_Chapter_4;
var int Eduard_ItemsGiven_Chapter_5;

FUNC VOID B_GiveTradeInv_Mod_Eduard_MT (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Eduard_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems (slf, ItMw_1H_Mace_L_04, 2);

		CreateInvItems (slf, ItMi_Gold, 100); 
		CreateInvItems (slf, ItMiSwordraw, 3); 
		CreateInvItems	(slf, ItMi_GoldNugget_Addon, 3);

		CreateInvItems (slf, ItRw_Arrow, 100); 
		CreateInvItems (slf, ItRw_Bolt, 100);
		
		// ------ Waffen ------
		CreateInvItems (slf, ItMw_Nagelkeule2, 1);
		CreateInvItems (slf, ItMw_Kriegskeule, 1);
		CreateInvItems (slf, ItMw_1h_Mil_Sword, 1);
		CreateInvItems (slf, ItMw_1h_Sld_Axe, 1);
		CreateInvItems (slf, ItMw_1h_Sld_Sword, 1);
		CreateInvItems (slf, ItMw_1h_Vlk_Sword, 1);
		CreateInvItems (slf, ItMw_Nagelkeule, 1);

		CreateInvItems (slf, ItMw_2h_Sld_Axe, 1);
		CreateInvItems (slf, ItMw_2h_Sld_Sword, 1);
		CreateInvItems (slf, ItMw_2h_Bau_Axe, 1);
		CreateInvItems (slf, ItMw_Richtstab, 1);

		CreateInvItems	(slf, ItMw_1H_Mace_L_04, 1);	 
		
				
		Eduard_ItemsGiven_Chapter_1 = TRUE;
	};
	
	if ((Kapitel >= 2)
	&& (Eduard_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 250); 
		CreateInvItems (slf, ItMiSwordraw, 3); 
		CreateInvItems	(slf, ItMi_GoldNugget_Addon, 3);

		CreateInvItems	(slf, ItMw_Schwert, 1);
		CreateInvItems	(slf, ItMw_Schwert3, 1);
		CreateInvItems	(slf, ItMw_Doppelaxt, 1);

		CreateInvItems	(slf, ItMw_Zweihaender2, 1);
				
		Eduard_ItemsGiven_Chapter_2 = TRUE;
	};

	if ((Kapitel >= 3)
	&& (Eduard_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 450); 
		CreateInvItems (slf, ItMiSwordraw, 3); 
		
		//Joly: ERZROHLING!!  NICHT ZU VIELE !!!
		//***********************************
		CreateInvItems (slf, ItMi_Nugget, 1); 
		//***********************************

		CreateInvItems	(slf, ItMw_Schwert5, 1);
		CreateInvItems	(slf, ItMw_Inquisitor, 1);
		CreateInvItems	(slf, ItMw_Kriegshammer2, 1);

		CreateInvItems	(slf, ItMw_Zweihaender3, 1);
		CreateInvItems	(slf, ItMw_Schlachtaxt, 1);

		Eduard_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Eduard_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 700); 
		CreateInvItems (slf, ItMiSwordraw, 3); 

		CreateInvItems	(slf, ItMw_Folteraxt, 1);

		CreateInvItems	(slf, ItMw_Krummschwert, 1);
		CreateInvItems	(slf, ItMw_Barbarenstreitaxt, 1);

		CreateInvItems	(slf, ItMw_Drachenschneide, 1);
		CreateInvItems	(slf, ItMw_Berserkeraxt, 1);
	
		//Joly: ERZROHLING!!  NICHT ZU VIELE !!!
		//***********************************
		CreateInvItems (slf, ItMi_Nugget, 2); 
		//***********************************

		Eduard_ItemsGiven_Chapter_4 = TRUE;
	};

	if ((Kapitel >= 5)
	&& (Eduard_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 1100); 
		CreateInvItems	(slf, ItMi_GoldNugget_Addon, 1);
		CreateInvItems (slf, ItMiSwordraw, 3); 
		
		//Joly: ERZROHLING!!  NICHT ZU VIELE !!!
		//***********************************
		CreateInvItems (slf, ItMi_Nugget, 2); 
		//***********************************

		Eduard_ItemsGiven_Chapter_5 = TRUE;
	};
};
