var int Thofeistos_ItemsGiven_Chapter_1;
var int Thofeistos_ItemsGiven_Chapter_2;
var int Thofeistos_ItemsGiven_Chapter_3;
var int Thofeistos_ItemsGiven_Chapter_4;
var int Thofeistos_ItemsGiven_Chapter_5;

FUNC VOID B_GiveTradeInv_Mod_Thofeistos_MT (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Thofeistos_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100); 
		CreateInvItems (slf, ItMiSwordraw, 3); 
		
		// ------ Waffen ------
		CreateInvItems (slf, ItMw_Nagelkeule2, 1);
		CreateInvItems (slf, ItMw_Kriegshammer1, 1);
		CreateInvItems (slf, ItMw_Kriegskeule, 1);
		CreateInvItems (slf, ItMw_ShortSword5, 1);
		CreateInvItems (slf, ItMw_1h_Vlk_Sword, 1);
		CreateInvItems (slf, ItMw_Nagelkeule, 1);

		CreateInvItems (slf, ItMw_Streitaxt1, 1);
		CreateInvItems (slf, ItMw_2H_Sword_Light_01, 1);
		CreateInvItems (slf, ItMw_2h_Sld_Axe, 1);
		CreateInvItems (slf, ItMw_2h_Sld_Sword, 1);
		CreateInvItems (slf, ItMw_Hellebarde, 1);
		CreateInvItems (slf, ItMw_2h_Bau_Axe, 1);
		CreateInvItems (slf, ItMw_Richtstab, 1);

		// ------ Ringe / Amulette ------
		
		CreateInvItems (slf, ItBE_Addon_SLD_01, 1); 

		CreateInvItems (slf, ItRu_TeleportNewCamp, 1);		 
		
				
		Thofeistos_ItemsGiven_Chapter_1 = TRUE;
	};
	
	if ((Kapitel >= 2)
	&& (Thofeistos_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 250); 
		CreateInvItems (slf, ItMiSwordraw, 3); 

		CreateInvItems	(slf, ItMw_Schwert, 1);
		CreateInvItems	(slf, ItMw_Spicker, 1);
		CreateInvItems	(slf, ItMw_Schwert3, 1);
		CreateInvItems	(slf, ItMw_Morgenstern, 1);
		CreateInvItems	(slf, ItMw_Doppelaxt, 1);
		CreateInvItems	(slf, ItMw_Bartaxt, 1);

		CreateInvItems	(slf, ItMw_Zweihaender2, 1);
		CreateInvItems	(slf, ItMw_Streitaxt2, 1);
				
		Thofeistos_ItemsGiven_Chapter_2 = TRUE;
	};

	if ((Kapitel >= 3)
	&& (Thofeistos_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 450); 
		CreateInvItems (slf, ItMiSwordraw, 3); 
		
		//Joly: ERZROHLING!!  NICHT ZU VIELE !!!
		//***********************************
		CreateInvItems (slf, ItMi_Nugget, 1); 
		//***********************************
		CreateInvItems (slf, ItBE_Addon_MC, 1); 

		CreateInvItems	(slf, ItMw_Rubinklinge, 1);
		CreateInvItems	(slf, ItMw_Rapier, 1);
		CreateInvItems	(slf, ItMw_Schwert5, 1);
		CreateInvItems	(slf, ItMw_Runenschwert, 1);
		CreateInvItems	(slf, ItMw_Kriegshammer2, 1);

		CreateInvItems	(slf, ItMw_Zweihaender3, 1);
		CreateInvItems	(slf, ItMw_Zweihaender4, 1);
		CreateInvItems	(slf, ItMw_Schlachtaxt, 1);

		Thofeistos_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Thofeistos_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 700); 
		CreateInvItems (slf, ItMiSwordraw, 3); 

		CreateInvItems	(slf, ItMw_Folteraxt, 1);
		CreateInvItems	(slf, ItMW_Addon_Betty, 1);

		CreateInvItems	(slf, ItMw_Krummschwert, 1);
		CreateInvItems	(slf, ItMw_Barbarenstreitaxt, 1);
	
		//Joly: ERZROHLING!!  NICHT ZU VIELE !!!
		//***********************************
		CreateInvItems (slf, ItMi_Nugget, 2); 
		//***********************************

		Thofeistos_ItemsGiven_Chapter_4 = TRUE;
	};

	if ((Kapitel >= 5)
	&& (Thofeistos_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 1100); 
		CreateInvItems (slf, ItMiSwordraw, 3); 

		CreateInvItems	(slf, ItMw_Drachenschneide, 1);
		CreateInvItems	(slf, ItMw_Berserkeraxt, 1);
		
		//Joly: ERZROHLING!!  NICHT ZU VIELE !!!
		//***********************************
		CreateInvItems (slf, ItMi_Nugget, 2); 
		//***********************************

		Thofeistos_ItemsGiven_Chapter_5 = TRUE;
	};
};
