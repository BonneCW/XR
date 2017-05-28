var int Liselotte_ItemsGiven_Chapter_1;
var int Liselotte_ItemsGiven_Chapter_2;
var int Liselotte_ItemsGiven_Chapter_3;
var int Liselotte_ItemsGiven_Chapter_4;
var int Liselotte_ItemsGiven_Chapter_5;

FUNC VOID B_GiveTradeInv_Mod_Liselotte_NW (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Liselotte_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 20); 
		CreateInvItems (slf,ItLsTorch,20);
		CreateInvItems (slf, ItRw_Arrow, 50);		
		
		// ------ Waffen ------
		CreateInvItems	(slf, ItRw_Sld_Bow, 1);	

		CreateInvItems (slf, ItMw_1h_Mil_Sword, 1);
		CreateInvItems (slf, ItMw_1h_Sld_Sword, 1);
		CreateInvItems (slf, ItMw_1h_Vlk_Sword, 1);
		CreateInvItems (slf, ItMw_Nagelkeule, 1);
		CreateInvItems (slf, ItMw_ShortSword3, 1);

		CreateInvItems (slf, ItMw_Stabkeule, 1);
		CreateInvItems (slf, ItMw_2h_Bau_Axe, 1);
		CreateInvItems (slf, ItMw_Richtstab, 1);
		
		CreateInvItems (slf,ItRi_Hp_01, 1);
		
		CreateInvItems (slf,ItMi_DarkPearl, 1);
		CreateInvItems (slf,ItMi_Orkstatuette, 1);
		CreateInvItems (slf,ItMi_Stuff_Barbknife_01, 1);
		
		Liselotte_ItemsGiven_Chapter_1 = TRUE;
	};
	
	if ((Kapitel >= 2)
	&& Liselotte_ItemsGiven_Chapter_2 == FALSE)
	{	

		CreateInvItems (slf, ItMi_Gold, 20); 
		CreateInvItems (slf, ItLsTorch,5);
		CreateInvItems (slf, ItRw_Arrow, 50);	

		CreateInvItems	(slf, ItRw_Bow_M_02, 1);

		CreateInvItems	(slf, ItMw_Schwert, 1);
		CreateInvItems	(slf, ItMw_Schwert2, 1);
		CreateInvItems	(slf, ItMw_Schwert3, 1);
		CreateInvItems	(slf, ItMw_Doppelaxt, 1);

		CreateInvItems	(slf, ItMw_Zweihaender2, 1);
		
		Liselotte_ItemsGiven_Chapter_2 = TRUE;
	};	
	
	if ((Kapitel >= 3)
	&& (Liselotte_ItemsGiven_Chapter_3 == FALSE))
	{
		
		CreateInvItems (slf, ItMi_Gold, 25); 
		CreateInvItems (slf, ItRw_Arrow, 50);	

		CreateInvItems	(slf, ItRw_Bow_M_03, 1);

		CreateInvItems	(slf, ItMw_Streitkolben, 1);
		CreateInvItems	(slf, ItMw_Schwert5, 1);

		CreateInvItems	(slf, ItMW_Addon_Keule_2h_01, 1);
		
		Liselotte_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Liselotte_ItemsGiven_Chapter_4 == FALSE))
	{

		CreateInvItems (slf, ItMi_Gold, 100); 
		CreateInvItems (slf, ItRw_Arrow, 50);	

		CreateInvItems	(slf, ItRw_Bow_H_01, 1);
		CreateInvItems	(slf, ItRw_Bow_H_02, 1);

		CreateInvItems	(slf, ItMw_Folteraxt, 1);
		CreateInvItems	(slf, ItMW_Addon_Betty, 1);

		CreateInvItems	(slf, ItMw_Krummschwert, 1);
		CreateInvItems	(slf, ItMw_Barbarenstreitaxt, 1);

		CreateInvItems	(slf, ItRw_Bow_H_04, 1);		
		
		Liselotte_ItemsGiven_Chapter_4 = TRUE;
	};

	if ((Kapitel >= 5)
	&& (Liselotte_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 200); 
		CreateInvItems (slf, ItRw_Arrow, 50);	

		CreateInvItems	(slf, ItMw_Berserkeraxt, 1);		
		
		Liselotte_ItemsGiven_Chapter_5 = TRUE;
	};
};
