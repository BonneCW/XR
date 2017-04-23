var int Scar_ItemsGiven_Chapter_1;
var int Scar_ItemsGiven_Chapter_2;
var int Scar_ItemsGiven_Chapter_3;
var int Scar_ItemsGiven_Chapter_4;
var int Scar_ItemsGiven_Chapter_5;

FUNC VOID B_GiveTradeInv_Mod_Scar_MT (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Scar_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 80); 
		CreateInvItems (slf, ItRw_Arrow, 100);
		CreateInvItems (slf, ItRw_Bolt,  100);
		
		// ------ Waffen ------
		CreateInvItems	(slf, ItRw_Crossbow_L_01, 1);
		CreateInvItems	(slf, ItRw_Crossbow_L_02, 1);

		CreateInvItems	(slf, ItRw_Bow_L_01, 1);
		CreateInvItems	(slf, ItRw_Bow_L_02, 1);
		CreateInvItems	(slf, ItRw_Sld_Bow, 1);	

		CreateInvItems (slf, ItMw_Nagelkeule2, 1);
		CreateInvItems (slf, ItMw_Kriegshammer1, 1);
		CreateInvItems (slf, ItMw_Kriegskeule, 1);
		CreateInvItems (slf, ItMw_ShortSword4, 1);
		CreateInvItems (slf, ItMw_1h_Mil_Sword, 1);
		CreateInvItems (slf, ItMw_1h_Sld_Axe, 1);
		CreateInvItems (slf, ItMw_1h_Sld_Sword, 1);
		CreateInvItems (slf, ItMw_Nagelkeule, 1);

		CreateInvItems (slf, ItMw_Streitaxt1, 1);
		CreateInvItems (slf, ItMw_2H_Sword_Light_01, 1);
		CreateInvItems (slf, ItMw_2h_Sld_Axe, 1);
		CreateInvItems (slf, ItMw_2h_Sld_Sword, 1);
		CreateInvItems (slf, ItMw_Hellebarde, 1);
		CreateInvItems (slf, ItMw_2h_Bau_Axe, 1);
		CreateInvItems (slf, ItMw_Richtstab, 1);
		
		CreateInvItems (slf, ItAm_Prot_Total_01,  1);
		
		Scar_ItemsGiven_Chapter_1 = TRUE;
	};

	if ((Kapitel >= 2)		//Joly: wird eh erst ab 2. Kapitel vom SC erreicht.
	&& (Scar_ItemsGiven_Chapter_2 == FALSE))
	{

		CreateInvItems	(slf, ItAt_ShadowHorn, 1);
		CreateInvItems (slf, ItMi_Gold, 200); 
		CreateInvItems (slf, ItRw_Arrow, 100);
		CreateInvItems (slf, ItRw_Bolt,  100);

		CreateInvItems	(slf, ItRw_Crossbow_M_01, 1);

		CreateInvItems	(slf, ItRw_Bow_M_02, 1);

		CreateInvItems	(slf, ItMw_Steinbrecher, 1);
		CreateInvItems	(slf, ItMw_Schwert2, 1);
		CreateInvItems	(slf, ItMw_Schwert3, 1);
		CreateInvItems	(slf, ItMw_Morgenstern, 1);
		CreateInvItems	(slf, ItMw_Bartaxt, 1);

		CreateInvItems	(slf, ItMw_Zweihaender2, 1);
		CreateInvItems	(slf, ItMw_Streitaxt2, 1);

		Scar_ItemsGiven_Chapter_2 = TRUE;
	};

	if ((Kapitel >= 3)
	&& (Scar_ItemsGiven_Chapter_3 == FALSE))
	{	
		CreateInvItems (slf, ItMi_Gold, 100); 
		CreateInvItems (slf, ItRw_Arrow, 100);
		CreateInvItems (slf, ItRw_Bolt,  100);

		CreateInvItems	(slf, ItRw_Crossbow_M_02, 1);

		CreateInvItems	(slf, ItRw_Bow_M_03, 1);

		CreateInvItems	(slf, ItMw_Streitkolben, 1);
		CreateInvItems	(slf, ItMw_Rubinklinge, 1);
		CreateInvItems	(slf, ItMw_Schwert5, 1);
		CreateInvItems	(slf, ItMw_Rabenschnabel, 1);
		CreateInvItems	(slf, ItMw_Inquisitor, 1);
		CreateInvItems	(slf, ItMw_Meisterdegen, 1);

		CreateInvItems	(slf, ItMw_Zweihaender3, 1);
		CreateInvItems	(slf, ItMW_Addon_Keule_2h_01, 1);

		Scar_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Scar_ItemsGiven_Chapter_4 == FALSE))
	{

		CreateInvItems (slf, ItMi_Gold, 150); 
		CreateInvItems (slf, ItRw_Arrow, 100);
		CreateInvItems (slf, ItRw_Bolt,  100);

		CreateInvItems	(slf, ItRw_Crossbow_H_01, 1);

		CreateInvItems	(slf, ItRw_Bow_H_01, 1);

		CreateInvItems	(slf, ItMw_Folteraxt, 1);
		CreateInvItems	(slf, ItMW_Addon_Betty, 1);

		CreateInvItems	(slf, ItMw_Krummschwert, 1);
		
		Scar_ItemsGiven_Chapter_4 = TRUE;
	};

	if ((Kapitel >= 5)
	&& (Scar_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 200); 
		CreateInvItems (slf, ItRw_Arrow, 100);
		CreateInvItems (slf, ItRw_Bolt,  100);

		CreateInvItems	(slf, ItRw_Crossbow_H_02, 1);

		CreateInvItems	(slf, ItRw_Bow_H_04, 1);

		CreateInvItems	(slf, ItMw_Berserkeraxt, 1);
	
		Scar_ItemsGiven_Chapter_5 = TRUE;
	};
};
