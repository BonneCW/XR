var int Cipher_ItemsGiven_Chapter_1;
var int Cipher_ItemsGiven_Chapter_2;
var int Cipher_ItemsGiven_Chapter_3;
var int Cipher_ItemsGiven_Chapter_4;
var int Cipher_ItemsGiven_Chapter_5;

FUNC VOID B_GiveTradeInv_Mod_Cipher_MT (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Cipher_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 80); 
		CreateInvItems (slf, ItRw_Arrow, 25);
		CreateInvItems (slf, ItRw_Bolt,  25);
		
		// ------ Waffen ------
		CreateInvItems	(slf, ItRw_Crossbow_L_01, 1);

		CreateInvItems	(slf, ItRw_Bow_L_03, 1);
		CreateInvItems	(slf, ItRw_Sld_Bow, 1);	
		
		CreateInvItems (slf, ItAm_Prot_Total_01,  1);
		
		Cipher_ItemsGiven_Chapter_1 = TRUE;
	};

	if ((Kapitel >= 2)		//Joly: wird eh erst ab 2. Kapitel vom SC erreicht.
	&& (Cipher_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 200); 
		CreateInvItems (slf, ItRw_Arrow, 100);
		CreateInvItems (slf, ItRw_Bolt,  100);

		CreateInvItems	(slf, ItRw_Crossbow_M_01, 1);

		Cipher_ItemsGiven_Chapter_2 = TRUE;
	};

	if ((Kapitel >= 3)
	&& (Cipher_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100); 
		CreateInvItems (slf, ItRw_Arrow, 100);
		CreateInvItems (slf, ItRw_Bolt,  100);

		CreateInvItems	(slf, ItRw_Crossbow_M_02, 1);

		CreateInvItems	(slf, ItRw_Bow_M_03, 1);

		Cipher_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Cipher_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 150); 
		CreateInvItems (slf, ItRw_Arrow, 100);
		CreateInvItems (slf, ItRw_Bolt,  100);

		CreateInvItems	(slf, ItRw_Crossbow_H_01, 1);

		CreateInvItems	(slf, ItRw_Bow_H_01, 1);
		
		Cipher_ItemsGiven_Chapter_4 = TRUE;
	};

	if ((Kapitel >= 5)
	&& (Cipher_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 200); 
		CreateInvItems (slf, ItRw_Arrow, 100);
		CreateInvItems (slf, ItRw_Bolt,  100);

		CreateInvItems	(slf, ItRw_Crossbow_H_02, 1);

		CreateInvItems	(slf, ItRw_Bow_H_04, 1);
		
		Cipher_ItemsGiven_Chapter_5 = TRUE;
	};
};
