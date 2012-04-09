var int Genn_ItemsGiven_Chapter_1;
var int Genn_ItemsGiven_Chapter_2;
var int Genn_ItemsGiven_Chapter_3;
var int Genn_ItemsGiven_Chapter_4;
var int Genn_ItemsGiven_Chapter_5;

FUNC VOID B_GiveTradeInv_Mod_Genn_TUG (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Genn_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems	 (slf, ItMi_Gold,		100);  

		CreateInvItems   (slf, ItSc_Sleep,	  	1); //Joly: Für Mission benötigt!!!!
		CreateInvItems   (slf, ItMi_Sulfur,   	2);
		CreateInvItems   (slf, ItPo_Mana_01,  	2);
		CreateInvItems   (slf, ItPo_Health_01,	3);

		CreateInvItems   (slf, ItSc_Light,	5);
		CreateInvItems   (slf, ItSc_Firebolt, 5);
		CreateInvItems   (slf, ItSc_LightHeal,5);
		CreateInvItems   (slf, ItSc_Windfist, 1);
		CreateInvItems   (slf, ItPo_Gegengift,		2);
		CreateInvItems (slf, ItMi_Salpeter, 2); 
				
		Genn_ItemsGiven_Chapter_1 = TRUE;
	};
	
	if ((Kapitel >= 2)
	&& (Genn_ItemsGiven_Chapter_2 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100); 

		CreateInvItems   (slf, ItMi_Sulfur, 	2);
		CreateInvItems   (slf, ItMi_Quartz, 	2);
		CreateInvItems   (slf, ItMi_Pitch, 	    1);
		
		CreateInvItems   (slf, ItSc_Icebolt, 5);
		CreateInvItems   (slf, ItPo_Health_01,  7);
		CreateInvItems   (slf, ItPo_Health_02,  2);
		CreateInvItems   (slf, ItPo_Mana_01,	14);//Joly:hab ich schon verdoppelt nach version 1.26e

		CreateInvItems   (slf, ItSc_InstantFireball, 5);
		CreateInvItems   (slf, ItPo_Gegengift,		2);
	
		CreateInvItems (slf, ItPo_ZufallsDrink,		1);
		CreateInvItems (slf, ItMi_Salpeter, 2); 
		//***********************************
	
		Genn_ItemsGiven_Chapter_2 = TRUE;
	};

	if ((Kapitel >= 3)
	&& (Genn_ItemsGiven_Chapter_3 == FALSE))
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

		CreateInvItems   (slf, ItSc_MediumHeal,	5);
		CreateInvItems   (slf, ItSc_Firestorm, 4);
		
		CreateInvItems   (slf, ItPo_Gegengift,		2);
		CreateInvItems (slf, ItMi_Salpeter, 2); 
			 
		//Joly: RUNENROHLING!!  NICHT ZU VIELE !!!
		//***********************************
		CreateInvItems   (slf, ItMi_RuneBlank, 1);
		//***********************************

		
		CreateInvItems (slf,ItBe_Addon_Prot_MAGIC, 1); 

		Genn_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Genn_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 150); 
		
		CreateInvItems   (slf, ItMi_Sulfur, 	5);
		CreateInvItems   (slf, ItMi_Quartz, 	6);
		CreateInvItems   (slf, ItMi_Rockcrystal, 	3);
		CreateInvItems   (slf, ItMi_Coal, 	4);
		CreateInvItems   (slf, ItMi_Aquamarine, 	2);	
		CreateInvItems   (slf, ItMi_Pitch, 	    1);
		CreateInvItems	 (slf, ItMi_HolyWater,		5); 


		CreateInvItems   (slf, ItPo_Health_02,  15);
		CreateInvItems   (slf, ItPo_Health_03,  10);
		CreateInvItems   (slf, ItPo_Mana_01,	30);
		CreateInvItems   (slf, ItPo_Mana_02,	30);

		CreateInvItems   (slf, ItSc_HarmUndead, 2);
		CreateInvItems   (slf, ItSc_ChargeFireball,3);
		CreateInvItems   (slf, ItSc_Firerain, 2);
		CreateInvItems   (slf, ItPo_Gegengift,		2);
		
		CreateInvItems (slf, ItMi_Salpeter, 2); 
				
		
		Genn_ItemsGiven_Chapter_4 = TRUE;
	};

	if ((Kapitel >= 5)
	&& (Genn_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 200); 

		CreateInvItems   (slf, ItMi_Sulfur, 	6);
		CreateInvItems   (slf, ItMi_Quartz, 	4);
		CreateInvItems   (slf, ItMi_Rockcrystal, 	6);
		CreateInvItems   (slf, ItMi_Coal, 	3);
		CreateInvItems   (slf, ItMi_Aquamarine, 	3);
		CreateInvItems   (slf, ItMi_DarkPearl, 	1);
		CreateInvItems   (slf, ItMi_HolyWater, 	3);

		CreateInvItems   (slf, ItPo_Health_02,  20);
		CreateInvItems   (slf, ItPo_Health_03,  15);
		CreateInvItems   (slf, ItPo_Mana_01,	50);
		CreateInvItems   (slf, ItPo_Mana_02,	40);

		CreateInvItems   (slf, ItSc_Pyrokinesis,	5);
		CreateInvItems   (slf, ItSc_FullHeal ,3);
	
		CreateInvItems (slf, ItPo_ZufallsDrink,		1);
		CreateInvItems   (slf, ItPo_Gegengift,		2);
		CreateInvItems (slf, ItMi_Salpeter, 2); 

		//Joly: RUNENROHLING!!  NICHT ZU VIELE !!!
		//***********************************
		CreateInvItems   (slf, ItMi_RuneBlank, 1);
		//***********************************
	
		
		Genn_ItemsGiven_Chapter_5 = TRUE;
	};
};
