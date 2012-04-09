var int Maysara_ItemsGiven_Chapter_1;
var int Maysara_ItemsGiven_Chapter_2;
var int Maysara_ItemsGiven_Chapter_3;
var int Maysara_ItemsGiven_Chapter_4;
var int Maysara_ItemsGiven_Chapter_5;

FUNC VOID B_GiveTradeInv_Mod_Maysara_NW (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Maysara_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100); 
		CreateInvItems (slf, ItRw_Arrow, 30); 
		CreateInvItems (slf, ItRw_SchmetterArrow, 30); 
		
		// ------ Waffen ------
		CreateInvItems	(slf, ItRw_Bow_L_03, 1);
		CreateInvItems	(slf, ItRw_Bow_L_04, 1);

		CreateInvItems (slf, ItMw_Assassinenschwert, 1);
		CreateInvItems (slf, ItMw_1h_Mil_Sword, 1);
		CreateInvItems (slf, ItMw_Nagelkeule, 1);

		// ------ Waffen ------
		
		// ------ Ringe / Amulette ------
		CreateInvItems (slf, ItBE_Addon_Leather_01, 1); 
		CreateInvItems (slf, ItBE_Addon_MIL_01		, 1); 
		CreateInvItems (slf, ItAm_Prot_Edge_01		, 1); 
		
		Maysara_ItemsGiven_Chapter_1 = TRUE;
	};
	
	if ((Kapitel >= 2)
	&& (Maysara_ItemsGiven_Chapter_2 == FALSE))
	{

		CreateInvItems (slf, ItMi_Gold, 100); 
		CreateInvItems (slf, ItMiSwordraw, 5); 
		CreateInvItems (slf, ItRw_Arrow, 50); 
		CreateInvItems (slf, ItRw_SchmetterArrow, 50); 
		CreateInvItems (slf, ItRw_Bolt, 50); 

		CreateInvItems	(slf, ItRw_Bow_M_01, 1);

		CreateInvItems	(slf, ItMw_Schwert, 1);
		CreateInvItems	(slf, ItMw_Schwert3, 1);
	
		Maysara_ItemsGiven_Chapter_2 = TRUE;
	};

	if ((Kapitel >= 3)
	&& (Maysara_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100); 
		CreateInvItems (slf, ItMiSwordraw, 5); 
		CreateInvItems (slf, ItBe_Addon_Prot_Point, 1); 
		CreateInvItems (slf, ItRw_Arrow, 100); 
		CreateInvItems (slf, ItRw_SchmetterArrow, 100); 
		CreateInvItems (slf, ItRw_Bolt, 100); 

		CreateInvItems	(slf, ItRw_Bow_M_03, 1);

		CreateInvItems	(slf, ItMw_Rubinklinge, 1);
		CreateInvItems	(slf, ItMw_Rapier, 1);
		CreateInvItems	(slf, ItMw_Meisterdegen, 1);
		
		Maysara_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Maysara_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 150); 
		CreateInvItems (slf, ItMiSwordraw, 5); 
		CreateInvItems (slf, ItBe_Addon_Prot_EDGE, 1);
		CreateInvItems (slf, ItBe_Addon_Prot_TOTAL, 1);

		CreateInvItems (slf, ItRw_Arrow, 180); 
		CreateInvItems (slf, ItRw_SchmetterArrow, 100); 
		CreateInvItems (slf, ItRw_Bolt, 160); 

		CreateInvItems	(slf, ItRw_Bow_H_01, 1);
		CreateInvItems	(slf, ItRw_Bow_H_02, 1);

		CreateInvItems	(slf, ItMW_Addon_Betty, 1);
		
		Maysara_ItemsGiven_Chapter_4 = TRUE;
	};

	if ((Kapitel >= 5)
	&& (Maysara_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 200); 
		CreateInvItems (slf, ItMiSwordraw, 5); 
		CreateInvItems (slf, ItRw_Arrow, 200); 
		CreateInvItems (slf, ItRw_SchmetterArrow, 100); 
		CreateInvItems (slf, ItRw_Bolt, 170); 

		CreateInvItems	(slf, ItRw_Bow_H_04, 1);
	
		Maysara_ItemsGiven_Chapter_5 = TRUE;
	};
};
