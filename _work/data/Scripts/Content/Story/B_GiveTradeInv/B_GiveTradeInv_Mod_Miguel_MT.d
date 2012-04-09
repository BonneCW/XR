var int Miguel_ItemsGiven_Chapter_1;
var int Miguel_ItemsGiven_Chapter_2;
var int Miguel_ItemsGiven_Chapter_3;
var int Miguel_ItemsGiven_Chapter_4;
var int Miguel_ItemsGiven_Chapter_5;

FUNC VOID B_GiveTradeInv_Mod_Miguel_MT (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Miguel_ItemsGiven_Chapter_1 == FALSE))
	{
		
		CreateInvItems (slf,ItPo_Mana_01 	,10); 
		CreateInvItems (slf,ItPo_Health_01	,10);
		CreateInvItems (slf,ItPo_Mana_02 	,4); 
		CreateInvItems (slf,ItPo_Health_02	,4);

		CreateInvItems (slf, ItMi_Pan, 1);
		CreateInvItems (slf, ItMi_Scoop, 1);
		CreateInvItems (slf, ItMw_2H_Axe_L_01, 1);
		CreateInvItems (slf, ItMi_Stuff_Barbknife_01, 1);
		CreateInvItems (slf, ItKe_Lockpick, 15);
		CreateInvItems (slf, ItMi_GoldNugget_Addon, 3);
		CreateInvItems (slf, ItRw_Arrow, 55);
		CreateInvItems (slf, ItRw_Bolt, 55);
		CreateInvItems (slf, ItRw_SchmetterArrow, 35);
		CreateInvItems (slf, ItRw_SchmetterBolt, 35);
		CreateInvItems (slf, ItWr_Paper, 15);
		CreateInvItems (slf, ItMi_Ast, 123);
		CreateInvItems (slf, ItMi_Flask, 8);
		CreateInvItems (slf, ItMi_Joint, 13);
		CreateInvItems (slf, ItMi_Nugget, 3);
		CreateInvItems (slf, ItFo_Water, 3);
		CreateInvItems (slf, ItFo_Bread, 4);
		CreateInvItems (slf, ItPl_Mushroom_03, 3);
		CreateInvItems (slf, ItMi_Alchemy_Alcohol_01, 5);
		CreateInvItems (slf, ItFo_Booze, 10);
		CreateInvItems (slf, ItFo_Beer, 8);
		CreateInvItems (slf, ItMi_Runeblank, 1);
		CreateInvItems (slf, ItMi_Pitch, 4);
		CreateInvItems (slf, ItMi_Sulfur, 2);
		CreateInvItems (slf, ItMi_Stomper, 2);
		CreateInvItems (slf, ItMi_Lute, 1);
		CreateInvItems (slf, ItMi_Coal, 2);
		CreateInvItems (slf, ItFo_Wine, 5);
		CreateInvItems (slf, ItAt_LurkerSkin, 4);
		CreateInvItems (slf, ItAt_WolfFur, 3);
		
		CreateInvItems (slf, ItPo_Health_Addon_04,	1);
		CreateInvItems (slf, ItPo_Perm_DEX,	1);
						
		Miguel_ItemsGiven_Chapter_1 = TRUE;
	};
	
	if ((Kapitel >= 2)
	&& (Miguel_ItemsGiven_Chapter_2 == FALSE))
	{

		CreateInvItems (slf, ItKe_Lockpick, 15);
		CreateInvItems (slf, ItMi_GoldNugget_Addon, 3);
		CreateInvItems (slf, ItRw_Arrow, 55);
		CreateInvItems (slf, ItRw_Bolt, 55);
		CreateInvItems (slf, ItRw_SchmetterArrow, 35);
		CreateInvItems (slf, ItRw_SchmetterBolt, 35);
		CreateInvItems (slf, ItWr_Paper, 15);
		CreateInvItems (slf, ItMi_Ast, 123);
		CreateInvItems (slf, ItMi_Flask, 8);
		CreateInvItems (slf, ItMi_Joint, 13);
		CreateInvItems (slf, ItMi_Nugget, 3);
				
		Miguel_ItemsGiven_Chapter_2 = TRUE;
	};

	if ((Kapitel >= 3)
	&& (Miguel_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems (slf,ItPo_Mana_01 	,5); 
		CreateInvItems (slf,ItPo_Health_01	,5);
		CreateInvItems (slf,ItPo_Mana_02 	,2); 
		CreateInvItems (slf,ItPo_Health_02	,2);

		CreateInvItems (slf, ItKe_Lockpick, 15);
		CreateInvItems (slf, ItRw_Arrow, 55);
		CreateInvItems (slf, ItRw_Bolt, 55);
		CreateInvItems (slf, ItRw_SchmetterArrow, 35);
		CreateInvItems (slf, ItRw_SchmetterBolt, 35);
		CreateInvItems (slf, ItWr_Paper, 15);
		CreateInvItems (slf, ItMi_Ast, 123);
		CreateInvItems (slf, ItMi_Joint, 13);
		CreateInvItems (slf, ItFo_Water, 3);
		CreateInvItems (slf, ItFo_Bread, 4);
		CreateInvItems (slf, ItPl_Mushroom_03, 3);
		CreateInvItems (slf, ItMi_Alchemy_Alcohol_01, 5);
		CreateInvItems (slf, ItFo_Beer, 8);
		CreateInvItems (slf, ItMi_Pitch, 4);
		CreateInvItems (slf, ItMi_Sulfur, 2);
		CreateInvItems (slf, ItMi_Coal, 2);
		CreateInvItems (slf, ItFo_Wine, 5);
		CreateInvItems (slf, ItAt_WolfFur, 3);

		CreateInvItems (slf, ItSc_TrfSheep,	1);

		Miguel_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Miguel_ItemsGiven_Chapter_4 == FALSE))
	{
	
		CreateInvItems (slf, ItPo_ZufallsDrink,		1);

		CreateInvItems (slf, ItKe_Lockpick, 15);
		CreateInvItems (slf, ItMi_GoldNugget_Addon, 3);
		CreateInvItems (slf, ItRw_Arrow, 55);
		CreateInvItems (slf, ItRw_Bolt, 55);
		CreateInvItems (slf, ItRw_SchmetterArrow, 35);
		CreateInvItems (slf, ItRw_SchmetterBolt, 35);
		CreateInvItems (slf, ItWr_Paper, 15);
		CreateInvItems (slf, ItMi_Ast, 123);
		CreateInvItems (slf, ItMi_Flask, 8);
		CreateInvItems (slf, ItMi_Joint, 13);
		CreateInvItems (slf, ItMi_Nugget, 3);
		CreateInvItems (slf, ItFo_Water, 3);
		CreateInvItems (slf, ItFo_Bread, 4);
		CreateInvItems (slf, ItPl_Mushroom_03, 3);
		CreateInvItems (slf, ItMi_Alchemy_Alcohol_01, 5);
		CreateInvItems (slf, ItFo_Booze, 10);
		CreateInvItems (slf, ItFo_Beer, 8);
		CreateInvItems (slf, ItMi_Runeblank, 1);
		CreateInvItems (slf, ItMi_Pitch, 4);
		CreateInvItems (slf, ItMi_Sulfur, 2);
		CreateInvItems (slf, ItMi_Coal, 2);
		CreateInvItems (slf, ItFo_Wine, 5);
		CreateInvItems (slf, ItAt_LurkerSkin, 4);

		CreateInvItems (slf, ItPo_Perm_STR,	1);
		CreateInvItems (slf, ItSc_TrfKeiler,	1);
		
		
		Miguel_ItemsGiven_Chapter_4 = TRUE;
	};

	if ((Kapitel >= 5)
	&& (Miguel_ItemsGiven_Chapter_5 == FALSE))
	{
		

		CreateInvItems (slf, ItKe_Lockpick, 15);
		CreateInvItems (slf, ItMi_GoldNugget_Addon, 3);
		CreateInvItems (slf, ItRw_Arrow, 55);
		CreateInvItems (slf, ItRw_Bolt, 55);
		CreateInvItems (slf, ItRw_SchmetterArrow, 35);
		CreateInvItems (slf, ItRw_SchmetterBolt, 35);
		CreateInvItems (slf, ItWr_Paper, 15);
		CreateInvItems (slf, ItMi_Ast, 123);
		CreateInvItems (slf, ItMi_Flask, 8);
		CreateInvItems (slf, ItMi_Joint, 13);
		CreateInvItems (slf, ItMi_Nugget, 3);
		CreateInvItems (slf, ItFo_Water, 3);
		CreateInvItems (slf, ItFo_Bread, 4);
		CreateInvItems (slf, ItPl_Mushroom_03, 3);
		CreateInvItems (slf, ItMi_Alchemy_Alcohol_01, 5);
		CreateInvItems (slf, ItFo_Booze, 10);
		CreateInvItems (slf, ItFo_Beer, 8);
		CreateInvItems (slf, ItMi_Runeblank, 1);
		CreateInvItems (slf, ItMi_Pitch, 4);
		CreateInvItems (slf, ItMi_Sulfur, 2);
		CreateInvItems (slf, ItMi_Coal, 2);
		CreateInvItems (slf, ItFo_Wine, 5);
		CreateInvItems (slf, ItAt_LurkerSkin, 4);
		CreateInvItems (slf, ItAt_WolfFur, 3);

		CreateInvItems (slf, ItAt_CrawlerQueen, 1);
	
		Miguel_ItemsGiven_Chapter_5 = TRUE;
	};
};
