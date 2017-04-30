var int Hermy_ItemsGiven_Chapter_1;
var int Hermy_ItemsGiven_Chapter_2;
var int Hermy_ItemsGiven_Chapter_3;
var int Hermy_ItemsGiven_Chapter_4;
var int Hermy_ItemsGiven_Chapter_5;

FUNC VOID B_GiveTradeInv_Mod_Hermy_MT (var C_NPC slf)
{
	if (Npc_HasItems(slf, ItMi_Flask) < 10) {
		CreateInvItems(slf, ItMi_Flask, 10 - Npc_HasItems(slf, ItMi_Flask));
	};
	
	if ((Kapitel >= 1)
	&& (Hermy_ItemsGiven_Chapter_1 == FALSE))
	{
		// ------ Scrolls ------
		CreateInvItems (slf, ItSc_TrfShadowbeast, 1);
		CreateInvItems (slf, ItSc_TrfSnapper, 3);
		CreateInvItems (slf, ItSc_TrfWarg, 2);
		CreateInvItems (slf, ItSc_TrfBloodfly, 5);
		CreateInvItems (slf, ItSc_TrfBloodhound, 1);
		CreateInvItems (slf, ItSc_TrfKeiler, 3);
		CreateInvItems (slf, ItSc_TrfSheep, 6);
		CreateInvItems (slf, ItSc_TrfRabbit, 6);
			
		Hermy_ItemsGiven_Chapter_1 = TRUE;
	};
	
	if ((Kapitel >= 2)
	&& Hermy_ItemsGiven_Chapter_2 == FALSE)
	{
		CreateInvItems (slf, ItSc_TrfShadowbeast, 1);
		CreateInvItems (slf, ItSc_TrfSnapper, 3);
		CreateInvItems (slf, ItSc_TrfWarg, 2);
		CreateInvItems (slf, ItSc_TrfBloodfly, 5);
		CreateInvItems (slf, ItSc_TrfBloodhound, 1);
		CreateInvItems (slf, ItSc_TrfGolem, 1);
		CreateInvItems (slf, ItSc_TrfKeiler, 3);
		CreateInvItems (slf, ItSc_TrfSheep, 6);
		CreateInvItems (slf, ItSc_TrfRabbit, 6);
		CreateInvItems (slf, ItSc_TrfMeatbug, 2);
		
		Hermy_ItemsGiven_Chapter_2 = TRUE;
	};	
	
	if ((Kapitel >= 3)
	&& (Hermy_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems (slf, ItSc_TrfShadowbeast, 1);
		CreateInvItems (slf, ItSc_TrfSnapper, 3);
		CreateInvItems (slf, ItSc_TrfWarg, 2);
		CreateInvItems (slf, ItSc_TrfBloodfly, 5);
		CreateInvItems (slf, ItSc_TrfBloodhound, 1);
		CreateInvItems (slf, ItSc_TrfKeiler, 3);
		CreateInvItems (slf, ItSc_TrfSheep, 6);
		CreateInvItems (slf, ItSc_TrfRabbit, 6);
		CreateInvItems (slf, ItSc_TrfMeatbug, 2);
		CreateInvItems (slf, ItSc_TrfBlackTroll, 1);
	
		Hermy_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Hermy_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems (slf, ItSc_TrfShadowbeast, 1);
		CreateInvItems (slf, ItSc_TrfSnapper, 3);
		CreateInvItems (slf, ItSc_TrfWarg, 2);
		CreateInvItems (slf, ItSc_TrfBloodfly, 5);
		CreateInvItems (slf, ItSc_TrfBloodhound, 1);
		CreateInvItems (slf, ItSc_TrfKeiler, 3);
		CreateInvItems (slf, ItSc_TrfSheep, 6);
		CreateInvItems (slf, ItSc_TrfRabbit, 6);
		CreateInvItems (slf, ItSc_TrfMeatbug, 2);
		CreateInvItems (slf, ItSc_TrfBlackTroll, 1);
		CreateInvItems (slf, ItSc_TrfHarpie, 3);
		CreateInvItems (slf, ItSc_TrfGolem, 1);

		Hermy_ItemsGiven_Chapter_4 = TRUE;
	};

	if ((Kapitel >= 5)
	&& (Hermy_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems (slf, ItSc_TrfShadowbeast, 2);
		CreateInvItems (slf, ItSc_TrfSnapper, 3);
		CreateInvItems (slf, ItSc_TrfWarg, 2);
		CreateInvItems (slf, ItSc_TrfBloodfly, 5);
		CreateInvItems (slf, ItSc_TrfBloodhound, 2);
		CreateInvItems (slf, ItSc_TrfKeiler, 3);
		CreateInvItems (slf, ItSc_TrfSheep, 6);
		CreateInvItems (slf, ItSc_TrfRabbit, 6);
		CreateInvItems (slf, ItSc_TrfMeatbug, 2);
		CreateInvItems (slf, ItSc_TrfBlackTroll, 3);
		CreateInvItems (slf, ItSc_TrfHarpie, 3);
		CreateInvItems (slf, ItSc_TrfGolem, 3);
		
		Hermy_ItemsGiven_Chapter_5 = TRUE;
	};
};
