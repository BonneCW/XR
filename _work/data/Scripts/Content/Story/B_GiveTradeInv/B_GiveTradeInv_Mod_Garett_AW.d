var int Garett_ItemsGiven_Chapter_1;
var int Garett_ItemsGiven_Chapter_2;
var int Garett_ItemsGiven_Chapter_3;
var int Garett_ItemsGiven_Chapter_4;
var int Garett_ItemsGiven_Chapter_5;

FUNC VOID B_GiveTradeInv_Mod_Garett_AW (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Garett_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 10); 
		CreateInvItems (slf, ItFo_Addon_Rum,1);
		CreateInvItems (slf, ItPo_Health_Addon_04,1);
		
		// ------ Waffen ------	
		CreateInvItems (slf, ItMW_Addon_Hacker_1h_02, 1);
		CreateInvItems (slf, ItMw_Addon_PIR1hAxe, 1);
		CreateInvItems (slf, ItMw_Addon_PIR1hSword, 1);
		CreateInvItems (slf, ItMw_Schiffsaxt, 1);
		CreateInvItems (slf, ItMw_Schwert1, 1);

		CreateInvItems (slf, ItMW_Addon_Hacker_2h_02, 1);
		CreateInvItems (slf, ItMw_Addon_PIR2hAxe, 1);
		CreateInvItems (slf, ItMw_Addon_PIR2hSword, 1);
			
		// ------ Ringe / Amulette ------
		CreateInvItems (slf, ItAm_Prot_Fire_01,1);
		CreateInvItems (slf, ItRi_Prot_Mage_02,1);
						
		Garett_ItemsGiven_Chapter_1 = TRUE;
	};
	
	if ((Kapitel >= 2)
	&& (Garett_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 20); 
		CreateInvItems (slf, ItMi_Joint,1);
		CreateInvItems (slf, ItMiSwordraw, 2); 
		CreateInvItems (slf, ItMi_DarkPearl,1);

		CreateInvItems	(slf, ItMw_Piratensaebel, 1);
		CreateInvItems	(slf, ItMw_Schwert3, 1);
		CreateInvItems	(slf, ItMw_Doppelaxt, 1);

		CreateInvItems	(slf, ItMW_Addon_Hacker_2h_01, 1);
				
		Garett_ItemsGiven_Chapter_2 = TRUE;
	};

	if ((Kapitel >= 3)
	&& (Garett_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 50); 

		CreateInvItems	(slf, ItMW_Addon_Hacker_1h_01, 1);

		CreateInvItems	(slf, ItMW_Addon_Keule_2h_01, 1);

		Garett_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Garett_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100);

		CreateInvItems	(slf, ItMW_Addon_Betty, 1);

		CreateInvItems	(slf, ItMw_Krummschwert, 1);
		
		Garett_ItemsGiven_Chapter_4 = TRUE;
	};

	if ((Kapitel >= 5)
	&& (Garett_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 200); 
	
		Garett_ItemsGiven_Chapter_5 = TRUE;
	};
};
