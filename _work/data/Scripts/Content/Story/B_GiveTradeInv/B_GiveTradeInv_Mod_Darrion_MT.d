var int Darrion_ItemsGiven_Chapter_1;
var int Darrion_ItemsGiven_Chapter_2;
var int Darrion_ItemsGiven_Chapter_3;
var int Darrion_ItemsGiven_Chapter_4;
var int Darrion_ItemsGiven_Chapter_5;

FUNC VOID B_GiveTradeInv_Mod_Darrion_MT (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Darrion_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100); 
		
		CreateInvItems (slf, ItKe_Lockpick, 10);

		CreateInvItems (slf, ItMw_Schwert1, 1);
		CreateInvItems (slf, ItMw_Kriegshammer1, 1);
		CreateInvItems (slf, ItMw_ShortSword4, 1);
		CreateInvItems (slf, ItMw_1h_Mil_Sword, 1);
		CreateInvItems (slf, ItMw_1h_Sld_Sword, 1);
		CreateInvItems (slf, ItMw_ShortSword3, 1);
		CreateInvItems (slf, ItMW_Addon_Knife01, 1);

		CreateInvItems (slf, ItMw_2H_Sword_Light_01, 1);
		CreateInvItems (slf, ItMw_2h_Sld_Axe, 1);
		CreateInvItems (slf, ItMw_2h_Sld_Sword, 1);
		CreateInvItems (slf, ItMw_Hellebarde, 1);
		
		Darrion_ItemsGiven_Chapter_1 = TRUE;
	};
	
	if ((Kapitel >= 2)
	&& (Darrion_ItemsGiven_Chapter_2 == FALSE))
	{

		CreateInvItems (slf, ItMi_Gold, 250); 
		CreateInvItems	(slf, ItAt_SharkTeeth, 2);

		CreateInvItems	(slf, ItMw_Spicker, 1);
		CreateInvItems	(slf, ItMw_Steinbrecher, 1);
		CreateInvItems	(slf, ItMw_Morgenstern, 1);

		CreateInvItems	(slf, ItMw_Zweihaender2, 1);

		CreateInvItems	(slf, ItMw_Streitkolben, 1);
		CreateInvItems	(slf, ItMw_Rabenschnabel, 1);
		CreateInvItems	(slf, ItMw_Inquisitor, 1);
		CreateInvItems	(slf, ItMw_Kriegshammer2, 1);
		
		Darrion_ItemsGiven_Chapter_2 = TRUE;
	};

	if ((Kapitel >= 3)
	&& (Darrion_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems	(slf, ItMw_Zweihaender3, 1);
		CreateInvItems	(slf, ItMw_Zweihaender4, 1);

		Darrion_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Darrion_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems	(slf, ItMw_Folteraxt, 1);

		CreateInvItems	(slf, ItMw_Barbarenstreitaxt, 1);

		Darrion_ItemsGiven_Chapter_4 = TRUE;
	};

	if ((Kapitel >= 5)
	&& (Darrion_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 1100); 

		CreateInvItems	(slf, ItMw_Berserkeraxt, 1);

		Darrion_ItemsGiven_Chapter_5 = TRUE;
	};
};
