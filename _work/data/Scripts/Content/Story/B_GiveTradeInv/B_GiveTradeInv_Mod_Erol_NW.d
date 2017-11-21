var int Erol_ItemsGiven_Chapter_1;
var int Erol_ItemsGiven_Chapter_2;
var int Erol_ItemsGiven_Chapter_3;
var int Erol_ItemsGiven_Chapter_4;
var int Erol_ItemsGiven_Chapter_5;

FUNC VOID B_GiveTradeInv_Mod_Erol_NW (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Erol_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems (slf,ItFo_Water , 5);
		CreateInvItems (slf,ItFo_Bread , 3);
		CreateInvItems (slf,ItFo_Cheese, 2); 
		CreateInvItems (slf,ItPl_Mana_Herb_02 , 1);
		CreateInvItems (slf,ItPl_Health_Herb_02, 2); 
		CreateInvItems (slf,ItPl_Temp_Herb, 1); 
		CreateInvItems (slf,ItPo_Perm_Health, 1); 
		CreateInvItems (slf,ItMi_Orkstatuette, 1); 
		CreateInvItems (slf,ItMi_DarkPearl, 1); 
		CreateInvItems (slf,ItMi_BeliarStatue, 1); 
		CreateInvItems (slf,ItMi_RuneBlank, 1); 
		
		
		CreateInvItems (slf, ItAm_Hast, 1);
		
		CreateInvItems (slf, ItRi_Prot_Edge_01, 1);
		CreateInvItems (slf, ItAm_Strg_01, 1);

		//Orkwaffen
		CreateInvItems	(slf, ItMw_2H_OrcAxe_01, 1);
		CreateInvItems	(slf, ItMw_2H_OrcAxe_02, 1);
		CreateInvItems	(slf, ItMw_2H_OrcAxe_03, 1);
		CreateInvItems	(slf, ItMw_2H_OrcAxe_04, 1);
		CreateInvItems	(slf, ItMw_2H_OrcSword_02, 1);

				
		Erol_ItemsGiven_Chapter_1 = TRUE;
	};

	if ((Kapitel >= 2)
	&& (Erol_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems (slf,ItFo_Water , 1);
		CreateInvItems (slf,ItFo_Bread , 2);
		CreateInvItems (slf,ItFo_Cheese, 3); 
		CreateInvItems (slf,ItPl_Mana_Herb_02 , 3);
		CreateInvItems (slf,ItPl_Health_Herb_02, 3); 
		CreateInvItems (slf,ItPl_Temp_Herb, 2); 

		Erol_ItemsGiven_Chapter_2 = TRUE;
	};

	if ((Kapitel >= 3)
	&& (Erol_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems (slf,ItFo_Booze , 5);
		CreateInvItems (slf,ItFo_Cheese, 2); 
		CreateInvItems (slf,ItPl_Mana_Herb_02 , 3);
		CreateInvItems (slf,ItPl_Health_Herb_02, 3); 
		CreateInvItems (slf,ItPl_Temp_Herb, 2); 
		
		CreateInvItems (slf, ItMiSwordraw, 5); 

		Erol_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Erol_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems (slf,ItFo_Cheese, 1); 
		CreateInvItems (slf,ItFo_Mutton, 2); 
		CreateInvItems (slf,ItFo_Stew , 3); 
		CreateInvItems (slf,ItFo_Fishsoup, 4); 
		CreateInvItems (slf,ItPl_Mana_Herb_02 , 3);
		CreateInvItems (slf,ItPl_Health_Herb_02, 3); 
		CreateInvItems (slf,ItPl_Temp_Herb, 2); 
		
		Erol_ItemsGiven_Chapter_4 = TRUE;
	};

	if ((Kapitel >= 5)
	&& (Erol_ItemsGiven_Chapter_5 == FALSE))
	{
	
		CreateInvItems (slf,ItFo_Booze , 5);
		CreateInvItems (slf,ItPl_Mana_Herb_02 , 3);
		CreateInvItems (slf,ItPl_Health_Herb_02, 3); 
		CreateInvItems (slf,ItPl_Temp_Herb, 2); 

		Erol_ItemsGiven_Chapter_5 = TRUE;
	};
};