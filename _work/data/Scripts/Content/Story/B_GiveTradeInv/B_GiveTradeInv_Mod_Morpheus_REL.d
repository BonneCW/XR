var int Morpheus_ItemsGiven_Chapter_1;
var int Morpheus_ItemsGiven_Chapter_2;
var int Morpheus_ItemsGiven_Chapter_3;
var int Morpheus_ItemsGiven_Chapter_4;
var int Morpheus_ItemsGiven_Chapter_5;

FUNC VOID B_GiveTradeInv_Mod_Morpheus_REL (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Morpheus_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems (slf, ItAm_Prot_Fire_01, 1); 
		CreateInvItems (slf, ItAm_Prot_Edge_01, 1); 
		CreateInvItems (slf, ItAm_Prot_Point_01, 1); 
		CreateInvItems (slf, ItAm_Prot_Mage_01, 1);
		CreateInvItems (slf, ItRi_Prot_Fire_01, 1);
		CreateInvItems (slf, ItRi_Prot_Point_01, 1); 
		CreateInvItems (slf, ItRi_Prot_Edge_01, 1);
		CreateInvItems (slf, ItRi_Prot_Mage_01, 1);
				
		Morpheus_ItemsGiven_Chapter_1 = TRUE;
	};
	
	if ((Kapitel >= 2)
	&& (Morpheus_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems (slf, ItAm_Prot_Total_01, 1); 
		CreateInvItems (slf, ItRi_Prot_Fire_02, 1); 
		CreateInvItems (slf, ItRi_Prot_Point_02, 1);
		CreateInvItems (slf, ItRi_Prot_Edge_02, 1);
		CreateInvItems (slf, ItRi_Prot_Mage_02, 1); 
		CreateInvItems (slf, ItRi_Prot_Total_01, 1);
		CreateInvItems (slf, ItRi_Dex_01, 1);
		CreateInvItems (slf, ItRi_Hp_01, 1);
		CreateInvItems (slf, ItRi_Str_01, 1);
		CreateInvItems (slf, ItRi_Mana_01, 1);
			
		Morpheus_ItemsGiven_Chapter_2 = TRUE;
	};

	if ((Kapitel >= 3)
	&& (Morpheus_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems (slf, ItAm_Dex_01, 1); 
		CreateInvItems (slf, ItAm_Strg_01, 1); 
		CreateInvItems (slf, ItAm_Hp_01, 1);
		CreateInvItems (slf, ItAm_Mana_01, 1);
		CreateInvItems (slf, ItRi_Prot_Total_02, 1);
		CreateInvItems (slf, ItRi_Dex_02, 1);
		CreateInvItems (slf, ItRi_Hp_02, 1);
		CreateInvItems (slf, ItRi_Str_02, 1);
		CreateInvItems (slf, ItRi_Mana_02, 1);
		CreateInvItems (slf, ItRi_Hp_Mana_01, 1);
		CreateInvItems (slf, ItRi_Dex_Strg_01, 1);
			
		Morpheus_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Morpheus_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems (slf, ItAm_Dex_Strg_01, 1); 
		CreateInvItems (slf, ItAm_Hp_Mana_01, 1);

		Morpheus_ItemsGiven_Chapter_4 = TRUE;
	};

	if ((Kapitel >= 5)
	&& (Morpheus_ItemsGiven_Chapter_5 == FALSE))
	{
		
		Morpheus_ItemsGiven_Chapter_5 = TRUE;
	};
};
