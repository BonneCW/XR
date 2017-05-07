
var int Woron_ItemsGiven_Chapter_1;
var int Woron_ItemsGiven_Chapter_2;
var int Woron_ItemsGiven_Chapter_3;
var int Woron_ItemsGiven_Chapter_4;
var int Woron_ItemsGiven_Chapter_5;

FUNC VOID B_GiveTradeInv_Mod_Woron_JL (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Woron_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100); 
		CreateInvItems (slf, ItRw_Arrow, 30); 
		CreateInvItems (slf, ItRw_SchmetterArrow, 30); 
		
		// ------ Waffen ------
		CreateInvItems	(slf, ItRw_Crossbow_L_01, 1);
		CreateInvItems	(slf, ItRw_Crossbow_L_02, 1);
		CreateInvItems	(slf, ItRw_Holzarmbrust, 1);

		CreateInvItems	(slf, ItRw_Bow_L_03, 1);
		CreateInvItems	(slf, ItRw_Bow_L_04, 1);

		CreateInvItems (slf, ItMw_Nagelkeule2, 1);
		CreateInvItems (slf, ItMw_1h_Mil_Sword, 1);
		CreateInvItems (slf, ItMw_1h_Sld_Axe, 1);
		CreateInvItems (slf, ItMw_1h_Sld_Sword, 1);
		CreateInvItems (slf, ItMw_1h_Vlk_Sword, 1);
		CreateInvItems (slf, ItMw_Nagelkeule, 1);
		CreateInvItems (slf, ItMw_ShortSword3, 1);
		CreateInvItems (slf, ItMW_Addon_Knife01, 1);

		CreateInvItems (slf, ItMw_2h_Bau_Axe, 1);
		CreateInvItems (slf, ItMw_Richtstab, 1);

		// ------ Waffen ------
		
		// ------ Ringe / Amulette ------
		CreateInvItems (slf, ItBE_Addon_Leather_01, 1); 
		CreateInvItems (slf, ItBE_Addon_MIL_01		, 1); 
		CreateInvItems (slf, ItAm_Prot_Edge_01		, 1); 
		
		Woron_ItemsGiven_Chapter_1 = TRUE;
	};
	
	if ((Kapitel >= 2)
	&& (Woron_ItemsGiven_Chapter_2 == FALSE))
	{

		CreateInvItems (slf, ItMi_Gold, 100); 
		CreateInvItems (slf, ItMiSwordraw, 5); 
		CreateInvItems (slf, ItRw_Arrow, 50); 
		CreateInvItems (slf, ItRw_SchmetterArrow, 50); 
		CreateInvItems (slf, ItRw_Bolt, 50); 
		CreateInvItems (slf, ItRw_SchmetterBolt, 50); 

		CreateInvItems	(slf, ItRw_Crossbow_M_01, 1);
		CreateInvItems	(slf, ItRw_Goldarmbrust, 1);

		CreateInvItems	(slf, ItRw_Bow_M_01, 1);
		CreateInvItems	(slf, ItRw_Bow_M_02, 1);

		CreateInvItems	(slf, ItMw_Schwert, 1);
	
		Woron_ItemsGiven_Chapter_2 = TRUE;
	};

	if ((Kapitel >= 3)
	&& (Woron_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100); 
		CreateInvItems (slf, ItMiSwordraw, 5); 
		CreateInvItems (slf, ItBe_Addon_Prot_Point, 1); 
		CreateInvItems (slf, ItRw_Arrow, 100); 
		CreateInvItems (slf, ItRw_SchmetterArrow, 100); 
		CreateInvItems (slf, ItRw_Bolt, 100); 
		CreateInvItems (slf, ItRw_SchmetterBolt, 100); 

		CreateInvItems	(slf, ItRw_Crossbow_M_02, 1);

		CreateInvItems	(slf, ItRw_Bow_M_03, 1);
		CreateInvItems	(slf, ItRw_Bow_M_04, 1);

		CreateInvItems	(slf, ItMw_Rapier, 1);
		CreateInvItems	(slf, ItMw_Schwert5, 1);
		
		Woron_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Woron_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 150); 
		CreateInvItems (slf, ItMiSwordraw, 5); 
		CreateInvItems (slf, ItBe_Addon_Prot_EDGE, 1);
		CreateInvItems (slf, ItBe_Addon_Prot_TOTAL, 1);

		CreateInvItems (slf, ItRw_Arrow, 180); 
		CreateInvItems (slf, ItRw_SchmetterArrow, 100); 
		CreateInvItems (slf, ItRw_Bolt, 160); 
		CreateInvItems (slf, ItRw_SchmetterBolt, 100); 

		CreateInvItems	(slf, ItRw_Crossbow_H_01, 1);

		CreateInvItems	(slf, ItRw_Bow_H_01, 1);
		CreateInvItems	(slf, ItRw_Bow_H_02, 1);
		CreateInvItems	(slf, ItRw_Bow_H_03, 1);

		CreateInvItems	(slf, ItMw_Folteraxt, 1);
		CreateInvItems	(slf, ItMW_Addon_Betty, 1);

		CreateInvItems	(slf, ItMw_Krummschwert, 1);
		CreateInvItems	(slf, ItMw_Barbarenstreitaxt, 1);
		
		Woron_ItemsGiven_Chapter_4 = TRUE;
	};

	if ((Kapitel >= 5)
	&& (Woron_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 200); 
		CreateInvItems (slf, ItMiSwordraw, 5); 
		CreateInvItems (slf, ItRw_Arrow, 200); 
		CreateInvItems (slf, ItRw_SchmetterArrow, 100); 
		CreateInvItems (slf, ItRw_Bolt, 170); 
		CreateInvItems (slf, ItRw_SchmetterBolt, 100); 

		CreateInvItems	(slf, ItRw_Crossbow_H_02, 1);

		CreateInvItems	(slf, ItRw_Bow_H_04, 1);
	
		Woron_ItemsGiven_Chapter_5 = TRUE;
	};
};
