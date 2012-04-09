
var int Hans_ItemsGiven_Chapter_1;
var int Hans_ItemsGiven_Chapter_2;
var int Hans_ItemsGiven_Chapter_3;
var int Hans_ItemsGiven_Chapter_4;
var int Hans_ItemsGiven_Chapter_5;

FUNC VOID B_GiveTradeInv_Mod_Hans_REL (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Hans_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100); 
	
		// ------ Waffen ------
		CreateInvItems (slf, ItMw_ShortSword5, 1);
		CreateInvItems (slf, ItMw_ShortSword4, 1);
		CreateInvItems (slf, ItMw_1h_Sld_Sword, 1);
		CreateInvItems (slf, ItMw_1h_Vlk_Sword, 1);
		CreateInvItems (slf, ItMw_Nagelkeule, 1);
		CreateInvItems (slf, ItMw_ShortSword3, 1);

		CreateInvItems (slf, ItMw_Streitaxt1, 1);
		CreateInvItems (slf, ItMw_2H_Sword_Light_01, 1);
		CreateInvItems (slf, ItMw_2h_Sld_Axe, 1);
		CreateInvItems (slf, ItMw_2h_Sld_Sword, 1);
		CreateInvItems (slf, ItMw_Hellebarde, 1);
		CreateInvItems (slf, ItMw_Richtstab, 1);
		
		// ------ Ringe / Amulette ------
		CreateInvItems (slf, ItBE_Addon_Leather_01, 1); 
		CreateInvItems (slf, ItBE_Addon_MIL_01		, 1); 
		CreateInvItems (slf, ItAm_Prot_Edge_01		, 1); 
		CreateInvItems (slf, ItMiSwordraw, 3); 
		
		Hans_ItemsGiven_Chapter_1 = TRUE;
	};
	
	if ((Kapitel >= 2)
	&& (Hans_ItemsGiven_Chapter_2 == FALSE))
	{

		CreateInvItems (slf, ItMi_Gold, 100); 
		CreateInvItems (slf, ItMiSwordraw, 5); 

		CreateInvItems	(slf, ItRw_Crossbow_M_01, 1);

		CreateInvItems	(slf, ItRw_Bow_M_01, 1);
		CreateInvItems	(slf, ItRw_Bow_M_02, 1);

		CreateInvItems	(slf, ItMw_Schwert, 1);
		CreateInvItems	(slf, ItMw_Steinbrecher, 1);
		CreateInvItems	(slf, ItMw_Schwert2, 1);
		CreateInvItems	(slf, ItMw_Bartaxt, 1);

		CreateInvItems	(slf, ItMw_Zweihaender2, 1);
		CreateInvItems	(slf, ItMw_Streitaxt2, 1);
	
		Hans_ItemsGiven_Chapter_2 = TRUE;
	};

	if ((Kapitel >= 3)
	&& (Hans_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100); 
		CreateInvItems (slf, ItMiSwordraw, 5); 
		CreateInvItems (slf, ItBe_Addon_Prot_Point, 1); 

		CreateInvItems	(slf, ItRw_Crossbow_M_02, 1);

		CreateInvItems	(slf, ItRw_Bow_M_03, 1);
		CreateInvItems	(slf, ItRw_Bow_M_04, 1);

		CreateInvItems	(slf, ItMw_Streitkolben, 1);
		CreateInvItems	(slf, ItMw_Rubinklinge, 1);
		CreateInvItems	(slf, ItMw_Rapier, 1);
		CreateInvItems	(slf, ItMw_Schwert5, 1);
		CreateInvItems	(slf, ItMw_Meisterdegen, 1);
		CreateInvItems	(slf, ItMw_ElBastardo, 1);

		CreateInvItems	(slf, ItMW_Addon_Keule_2h_01, 1);
		CreateInvItems	(slf, ItMw_Zweihaender4, 1);
		
		Hans_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Hans_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 150); 
		CreateInvItems (slf, ItMiSwordraw, 5); 
		CreateInvItems (slf, ItBe_Addon_Prot_EDGE, 1);
		CreateInvItems (slf, ItBe_Addon_Prot_TOTAL, 1);

		CreateInvItems	(slf, ItRw_Crossbow_H_01, 1);

		CreateInvItems	(slf, ItRw_Bow_H_01, 1);

		CreateInvItems	(slf, ItMw_Folteraxt, 1);
		CreateInvItems	(slf, ItMW_Addon_Betty, 1);

		CreateInvItems	(slf, ItMw_Krummschwert, 1);
		CreateInvItems	(slf, ItMw_Barbarenstreitaxt, 1);
		
		Hans_ItemsGiven_Chapter_4 = TRUE;
	};

	if ((Kapitel >= 5)
	&& (Hans_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 200); 
		CreateInvItems (slf, ItMiSwordraw, 5); 

		CreateInvItems	(slf, ItRw_Crossbow_H_02, 1);

		CreateInvItems	(slf, ItRw_Bow_H_04, 1);

		CreateInvItems	(slf, ItMw_Drachenschneide, 1);
		CreateInvItems	(slf, ItMw_Berserkeraxt, 1);
	
		Hans_ItemsGiven_Chapter_5 = TRUE;
	};
};
