var int Fisk_ItemsGiven_Chapter_1;
var int Fisk_ItemsGiven_Chapter_2;
var int Fisk_ItemsGiven_Chapter_3;
var int Fisk_ItemsGiven_Chapter_4;
var int Fisk_ItemsGiven_Chapter_5;

FUNC VOID B_GiveTradeInv_Mod_Fisk_MT (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Fisk_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100); 
		
		CreateInvItems (slf, ItKe_Lockpick, 10);
		CreateInvItems (slf, ItSc_Sleep, 2);
		
		CreateInvItems (slf, ItRw_Arrow, 100); 
		CreateInvItems (slf, ItRw_Bolt, 100); 
		
		CreateInvItems (slf, ItMi_Nugget, 20); 
		CreateInvItems (slf, ItMi_GoldNugget_Addon, 13); 
		CreateInvItems (slf, ItMi_Joint, 15); 
		
		CreateInvItems (slf, ItMi_Ast, 20); 
		
		//Gürtel
		CreateInvItems (slf, ItBE_Addon_Leather_01, 1); 

		CreateInvItems (slf, ItRu_TeleportOldCamp, 1);

		CreateInvItems	(slf, ItRw_Crossbow_L_01, 1);
		CreateInvItems	(slf, ItRw_Crossbow_L_02, 1);

		CreateInvItems	(slf, ItRw_Bow_L_03, 1);
		CreateInvItems	(slf, ItRw_Bow_L_04, 1);
		CreateInvItems	(slf, ItRw_Sld_Bow, 1);	

		CreateInvItems (slf, ItMw_Nagelkeule2, 1);
		CreateInvItems (slf, ItMw_1h_Mil_Sword, 1);
		CreateInvItems (slf, ItMw_1h_Sld_Axe, 1);
		CreateInvItems (slf, ItMw_1h_Sld_Sword, 1);
		CreateInvItems (slf, ItMw_Nagelkeule, 1);
		CreateInvItems (slf, ItMW_Addon_Knife01, 1);

		CreateInvItems (slf, ItMw_Streitaxt1, 1);
		CreateInvItems (slf, ItMw_2h_Sld_Axe, 1);
		CreateInvItems (slf, ItMw_2h_Sld_Sword, 1);
		CreateInvItems (slf, ItMw_2h_Bau_Axe, 1);
		CreateInvItems (slf, ItMw_Richtstab, 1);
		
		Fisk_ItemsGiven_Chapter_1 = TRUE;
	};
	
	if ((Kapitel >= 2)
	&& (Fisk_ItemsGiven_Chapter_2 == FALSE))
	{

		CreateInvItems (slf, ItMi_Gold, 250); 
		CreateInvItems (slf, ItRw_Arrow, 50); 
		CreateInvItems (slf, ItRw_Bolt, 30); 

		CreateInvItems	(slf, ItAt_ShadowHorn, 1);

		CreateInvItems	(slf, ItRw_Crossbow_M_01, 1);

		CreateInvItems	(slf, ItRw_Bow_M_01, 1);

		CreateInvItems	(slf, ItMw_Schwert, 1);
		CreateInvItems	(slf, ItMw_Spicker, 1);
		CreateInvItems	(slf, ItMw_Morgenstern, 1);

		CreateInvItems	(slf, ItMw_Zweihaender2, 1);
		
		Fisk_ItemsGiven_Chapter_2 = TRUE;
	};

	if ((Kapitel >= 3)
	&& (Fisk_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 450); 
		CreateInvItems (slf, ItRw_Arrow, 70); 
		CreateInvItems (slf, ItRw_Bolt, 50); 
		CreateInvItems (slf, ItBe_Addon_Prot_Point, 1); 
		//Joly: ERZROHLING!!  NICHT ZU VIELE !!!
		//***********************************
		CreateInvItems (slf, ItMi_Nugget, 1); 
		//***********************************

		CreateInvItems	(slf, ItRw_Crossbow_M_02, 1);

		CreateInvItems	(slf, ItRw_Bow_M_03, 1);
		CreateInvItems	(slf, ItRw_Bow_M_04, 1);

		CreateInvItems	(slf, ItMw_Streitkolben, 1);
		CreateInvItems	(slf, ItMw_Rabenschnabel, 1);
		CreateInvItems	(slf, ItMw_Inquisitor, 1);
		CreateInvItems	(slf, ItMw_Kriegshammer2, 1);

		CreateInvItems	(slf, ItMw_Zweihaender3, 1);
		CreateInvItems	(slf, ItMw_Zweihaender4, 1);
		
		Fisk_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Fisk_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 700); 
		CreateInvItems (slf, ItMiSwordraw, 1); 
		CreateInvItems (slf, ItRw_Arrow, 80); 
		CreateInvItems (slf, ItRw_Bolt, 60); 
		CreateInvItems (slf, ItBe_Addon_Prot_EDGE, 1);
		CreateInvItems (slf, ItBe_Addon_Prot_EdgPoi, 1);

		CreateInvItems	(slf, ItRw_Crossbow_H_01, 1);

		CreateInvItems	(slf, ItRw_Bow_H_01, 1);
		CreateInvItems	(slf, ItRw_Bow_H_02, 1);

		CreateInvItems	(slf, ItMw_Folteraxt, 1);

		CreateInvItems	(slf, ItMw_Barbarenstreitaxt, 1);
		
		
		//Joly: ERZROHLING!!  NICHT ZU VIELE !!!
		//***********************************
		CreateInvItems (slf, ItMi_Nugget, 2); 
		//***********************************

		Fisk_ItemsGiven_Chapter_4 = TRUE;
	};

	if ((Kapitel >= 5)
	&& (Fisk_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 1100); 
		CreateInvItems (slf, ItRw_Arrow, 100); 
		CreateInvItems (slf, ItRw_Bolt, 70); 

		CreateInvItems	(slf, ItRw_Crossbow_H_02, 1);

		CreateInvItems	(slf, ItRw_Bow_H_04, 1);

		CreateInvItems	(slf, ItMw_Berserkeraxt, 1);

		Fisk_ItemsGiven_Chapter_5 = TRUE;
	};
};
