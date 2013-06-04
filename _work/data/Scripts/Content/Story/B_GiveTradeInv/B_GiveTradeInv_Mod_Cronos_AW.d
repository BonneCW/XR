var int Cronos_AW_ItemsGiven_Chapter_1;
var int Cronos_AW_ItemsGiven_Chapter_2;
var int Cronos_AW_ItemsGiven_Chapter_3;
var int Cronos_AW_ItemsGiven_Chapter_4;
var int Cronos_AW_ItemsGiven_Chapter_5;

FUNC VOID B_GiveTradeInv_Mod_Cronos_AW (var C_NPC slf)
{
	 
	if ((Kapitel >= 2)
	&& (Cronos_AW_ItemsGiven_Chapter_2 == FALSE))
	{
		
		CreateInvItems   (slf, ItMW_Addon_Stab03, 	1);
		CreateInvItems   (slf, ItMW_Addon_Stab05, 	1);
		
		CreateInvItems   (slf, ItMi_Sulfur, 	2);
		CreateInvItems   (slf, ItMi_Quartz, 	2);
		CreateInvItems   (slf, ItMi_Pitch, 	    1);
		
		CreateInvItems   (slf, ItPo_Health_01,  7);
		CreateInvItems   (slf, ItPo_Health_02,  2);
		CreateInvItems   (slf, ItPo_Mana_01,	14);
		
		CreateInvItems   (slf, ItPo_Health_Addon_04,	2);
		CreateInvItems   (slf, ItPo_Mana_Addon_04,		5);
		
		CreateInvItems	 (slf, ItMi_Flask,		15); 
		CreateInvItems	 (slf, ItMi_HolyWater,		5); 
		CreateInvItems (slf,ItFo_Water , 5);
		 
		CreateInvItems	 (slf, ItWr_Map_AddonWorld,		1);  
		CreateInvItems   (slf, ItPo_Gegengift,		2);

			//Joly: RUNENROHLING!!  NICHT ZU VIELE !!!
		//***********************************
		CreateInvItems   (slf, ItMi_RuneBlank, 2);
		//***********************************
		
		// ------ Scrolls ------
		CreateInvItems   (slf, ItSc_Light,	5);
		CreateInvItems   (slf, ItSc_Zap, 5);
		CreateInvItems   (slf, ItSc_LightHeal,5);
		CreateInvItems   (slf, ItSc_Icelance,	5);
		
		CreateInvItems   (slf, ItSc_Whirlwind,	1);
		CreateInvItems   (slf, ItSc_Icebolt, 	3);
		CreateInvItems   (slf, ItSc_Whirlwind, 2);
		CreateInvItems   (slf, ItSc_Geyser, 2);
		CreateInvItems   (slf, ItSc_Thunderstorm, 2);
		CreateInvItems   (slf, ItSc_WATERFIST, 1);
		CreateInvItems   (slf, ItRw_IceArrow, 100);
		CreateInvItems	(slf, ItPl_Zwillingsdorn, 1);
		
		Cronos_AW_ItemsGiven_Chapter_2 = TRUE;
	};

	if ((Kapitel >= 3)
	&& (Cronos_AW_ItemsGiven_Chapter_3 == FALSE))
	{
	
		CreateInvItems (slf, ItMi_Gold, 100); 

		CreateInvItems   (slf, ItMi_Sulfur, 	2);
		CreateInvItems   (slf, ItMi_Quartz, 	2);
		CreateInvItems   (slf, ItMi_Rockcrystal, 	2);
		CreateInvItems   (slf, ItMi_Coal, 	2);
		CreateInvItems 	 (slf, ItAt_WaranFiretongue, 	1);	
		CreateInvItems   (slf, ItMi_Pitch, 	    1);
		CreateInvItems	 (slf, ItMi_HolyWater,		5); 

		CreateInvItems   (slf, ItPo_Health_02,  9);
		CreateInvItems   (slf, ItPo_Health_03,  6);
		CreateInvItems   (slf, ItPo_Mana_01,	30);
		
		CreateInvItems   (slf, ItPo_Health_Addon_04,	2);
		CreateInvItems   (slf, ItPo_Mana_Addon_04,		5);
		
		CreateInvItems   (slf, ItSc_MediumHeal,	5);
		CreateInvItems   (slf, ItSc_Thunderball, 2);
		CreateInvItems   (slf, ItSc_IceCube, 3);	
		CreateInvItems	 (slf, ItMi_Flask,		10); 
		
		CreateInvItems   (slf, ItSc_Icelance, 2);
		CreateInvItems   (slf, ItSc_Whirlwind, 2);
		CreateInvItems   (slf, ItPo_Gegengift,		2);
	
		CreateInvItems   (slf, ItSc_Geyser, 2);
		CreateInvItems   (slf, ItSc_Thunderstorm, 2); 

		CreateInvItems   (slf, ItSc_WATERFIST, 1);
		CreateInvItems   (slf, ItRw_IceArrow, 100);
		CreateInvItems	(slf, ItPl_Zwillingsdorn, 1);
	 
		//Joly: RUNENROHLING!!  NICHT ZU VIELE !!!
		//***********************************
		CreateInvItems   (slf, ItMi_RuneBlank, 2);
		//***********************************

		
		Cronos_AW_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Cronos_AW_ItemsGiven_Chapter_4 == FALSE))
	{
	
		CreateInvItems   (slf, ItMi_Sulfur, 	5);
		CreateInvItems   (slf, ItMi_Quartz, 	6);
		CreateInvItems   (slf, ItMi_Rockcrystal, 	3);
		CreateInvItems   (slf, ItMi_Coal, 	4);
		CreateInvItems   (slf, ItMi_Aquamarine, 	2);	
		CreateInvItems   (slf, ItMi_Pitch, 	    1);
		CreateInvItems	 (slf, ItMi_Flask,		10);  
			
		CreateInvItems   (slf, ItPo_Health_Addon_04,	5);
		CreateInvItems   (slf, ItPo_Mana_Addon_04,		10);
		CreateInvItems	 (slf, ItMi_HolyWater,		5); 
		
		CreateInvItems   (slf, ItPo_Health_02,  15);
		CreateInvItems   (slf, ItPo_Health_03,  10);
		CreateInvItems   (slf, ItPo_Mana_01,	30);
		CreateInvItems   (slf, ItPo_Mana_02,	30);

		CreateInvItems   (slf, ItSc_LightningFlash,	3);
				
		
		CreateInvItems   (slf, ItSc_Icelance, 3);
		CreateInvItems   (slf, ItSc_Whirlwind, 3);
	
		CreateInvItems   (slf, ItSc_Geyser, 3);
		CreateInvItems   (slf, ItSc_Thunderstorm, 3); 

		CreateInvItems   (slf, ItSc_WATERFIST, 2);
		CreateInvItems   (slf, ItRw_IceArrow, 100);
		CreateInvItems   (slf, ItPo_Gegengift,		2);
		CreateInvItems	(slf, ItPl_Zwillingsdorn, 1);
	
		Cronos_AW_ItemsGiven_Chapter_4 = TRUE;
	};

	if ((Kapitel >= 5)
	&& (Cronos_AW_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems   (slf, ItMi_Sulfur, 	6);
		CreateInvItems   (slf, ItMi_Quartz, 	4);
		CreateInvItems   (slf, ItMi_Rockcrystal, 	6);
		CreateInvItems   (slf, ItMi_Coal, 	3);
		CreateInvItems   (slf, ItMi_Aquamarine, 	3);
		CreateInvItems   (slf, ItMi_DarkPearl, 	1);
		CreateInvItems   (slf, ItMi_HolyWater, 	3);
		CreateInvItems	 (slf, ItMi_Flask,		10);  

		CreateInvItems   (slf, ItPo_Health_02,  20);
		CreateInvItems   (slf, ItPo_Health_03,  15);
		CreateInvItems   (slf, ItPo_Mana_01,	50);
		CreateInvItems   (slf, ItPo_Mana_02,	40);

		CreateInvItems   (slf, ItSc_IceWave, 4);
		CreateInvItems   (slf, ItSc_FullHeal ,3);
		
		CreateInvItems   (slf, ItSc_Icelance, 3);
		CreateInvItems   (slf, ItSc_Whirlwind, 3);
	
		CreateInvItems   (slf, ItSc_Geyser, 3);
		CreateInvItems   (slf, ItSc_Thunderstorm, 3); 

		CreateInvItems   (slf, ItSc_WATERFIST, 3);
		CreateInvItems   (slf, ItRw_IceArrow, 100);
		CreateInvItems   (slf, ItPo_Gegengift,		2);

		//Joly: RUNENROHLING!!  NICHT ZU VIELE !!!
		//***********************************
		CreateInvItems   (slf, ItMi_RuneBlank, 1);
		//***********************************
		CreateInvItems	(slf, ItPl_Zwillingsdorn, 1);
	
		
		Cronos_AW_ItemsGiven_Chapter_5 = TRUE;
	};
};
