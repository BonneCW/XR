var int Daniel_ItemsGiven_Chapter_1;
var int Daniel_ItemsGiven_Chapter_2;
var int Daniel_ItemsGiven_Chapter_3;
var int Daniel_ItemsGiven_Chapter_4;
var int Daniel_ItemsGiven_Chapter_5;

FUNC VOID B_GiveTradeInv_Mod_Daniel_REL (var C_NPC slf)
{
	if ((Kapitel >= 1)
	&& (Daniel_ItemsGiven_Chapter_1 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 100); 
		CreateInvItems (slf,ItPo_Mana_01 	,10); 
		CreateInvItems (slf,ItPo_Health_01	,10);
		CreateInvItems (slf, ItPo_Health_Addon_04,	2);
		CreateInvItems (slf, ItPo_Mana_Addon_04,		2);
		CreateInvItems (slf,ItMi_ApfelTabak	,2); //für Abuyin
		CreateInvItems (slf,ItWr_Astronomy_Mis,1);	//Für  Mission HygalsBringBook
		CreateInvItems (slf,ItFo_Addon_Pfeffer_01,1);//FÜR Mission fortuno
		
		// ------ Scrolls ------
		CreateInvItems (slf,ItSc_Light			,6);
		CreateInvItems (slf,ItSc_Sleep			,1);
		CreateInvItems (slf,ItSc_Firebolt 		,20);
		CreateInvItems (slf,ItSc_Icebolt_Fake 		,8);
		CreateInvItems (slf,ItSc_IceLance_Fake 		,8);
		CreateInvItems (slf,ItSc_InstantFireball ,10);
		CreateInvItems (slf,ItSc_LightningFlash	,5);
		CreateInvItems (slf,ItSc_HarmUndead		,3);
		CreateInvItems (slf,ItSc_Firestorm 		,3);
		CreateInvItems (slf,ItSc_IceWave_Fake		,1);
		CreateInvItems (slf,ItSc_Zap	 		,5);
		CreateInvItems (slf,ItSc_IceCube_Fake		,3);
		CreateInvItems (slf,ItSc_Windfist 		,3);
		CreateInvItems (slf,ItSc_IceWave_Fake		,1);
		CreateInvItems (slf,ItSc_Firerain		,1);
		CreateInvItems (slf,ItSc_Shrink 		,1);
		CreateInvItems (slf,ItSc_ThunderStorm 	,1);

		CreateInvItems (slf,ItSc_SumGobSkel	,1);
		CreateInvItems (slf,ItSc_SumSkel	,1);
		CreateInvItems (slf,ItSc_SumWolf	,1);
		CreateInvItems (slf,ItSc_SumGol		,1);
		CreateInvItems (slf,ItSc_SumDemon	,1);
	
		CreateInvItems (slf, ItPo_ZufallsDrink,		1);

		CreateInvItems (slf, ItRu_TeleportKhorata, 1);

		// ------ AmRiBe ------
		CreateInvItems (slf,ItBe_Addon_Prot_MAGIC, 1); 
		CreateInvItems (slf,ItAm_Hp_Mana_01 ,1);	
		CreateInvItems   (slf, ItPo_Gegengift,		2);
			
		Daniel_ItemsGiven_Chapter_1 = TRUE;
	};
	
	if ((Kapitel >= 2)
	&& Daniel_ItemsGiven_Chapter_2 == FALSE)
	{
		CreateInvItems (slf, ItMi_Gold, 60); 
		CreateInvItems   (slf, ItPo_Health_Addon_04,	2);
		CreateInvItems   (slf, ItPo_Mana_Addon_04,		2);
		CreateInvItems (slf,ItPo_Mana_01 	,15); 
		CreateInvItems (slf,ItPo_Mana_02 	, 1);
		CreateInvItems (slf,ItPo_Health_01	,15);
		CreateInvItems (slf,ItPo_Health_02	, 2); 
		CreateInvItems (slf,ItPo_Perm_Str, 1); 
		CreateInvItems (slf,ItSc_Icebolt_Fake 		,8);
		CreateInvItems (slf,ItSc_IceWave_Fake		,1);
		CreateInvItems (slf,ItSc_IceCube_Fake		,3);
		CreateInvItems   (slf, ItPo_Gegengift,		2);
		
		Daniel_ItemsGiven_Chapter_2 = TRUE;
	};	
	
	if ((Kapitel >= 3)
	&& (Daniel_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 120); 
		CreateInvItems   (slf, ItPo_Health_Addon_04,	2);
		CreateInvItems   (slf, ItPo_Mana_Addon_04,		2);
		CreateInvItems (slf,ItPo_Mana_01 	,25); 
		CreateInvItems (slf,ItPo_Mana_02 	, 3);
		CreateInvItems (slf,ItPo_Health_01	,25);
		CreateInvItems (slf,ItPo_Health_02	, 15); 
		CreateInvItems (slf,ItPo_Perm_Mana	, 1); 
		CreateInvItems (slf, ItPo_Speed, 1); 
		CreateInvItems (slf,ItSc_Icebolt_Fake 		,8);
		CreateInvItems (slf,ItSc_IceWave_Fake		,1);
		CreateInvItems (slf,ItSc_IceCube_Fake		,3);
		CreateInvItems   (slf, ItPo_Gegengift,		2);
	
		Daniel_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Daniel_ItemsGiven_Chapter_4 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 220); 
		CreateInvItems   (slf, ItPo_Health_Addon_04,	3);
		CreateInvItems   (slf, ItPo_Mana_Addon_04,		3);
		CreateInvItems (slf,ItPo_Mana_01 	,35); 
		CreateInvItems (slf,ItPo_Mana_02 	, 15);
		CreateInvItems (slf,ItPo_Health_01	,35);
		CreateInvItems (slf,ItPo_Health_02	, 20); 
		CreateInvItems (slf,ItPo_Health_03	, 10); 
		CreateInvItems (slf,ItPo_Perm_Mana	, 1); 
		CreateInvItems (slf, ItPo_Speed, 1); 
		CreateInvItems (slf,ItSc_Icebolt_Fake 		,8);
		CreateInvItems (slf,ItSc_IceWave_Fake		,1);
		CreateInvItems (slf,ItSc_IceCube_Fake		,3);
		CreateInvItems   (slf, ItPo_Gegengift,		2);
	
		CreateInvItems (slf, ItPo_ZufallsDrink,		1);

		Daniel_ItemsGiven_Chapter_4 = TRUE;
	};

	if ((Kapitel >= 5)
	&& (Daniel_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 321); 
		CreateInvItems   (slf, ItPo_Health_Addon_04,	5);
		CreateInvItems   (slf, ItPo_Mana_Addon_04,		5);
		CreateInvItems (slf,ItPo_Mana_01 	,55); 
		CreateInvItems (slf,ItPo_Mana_02 	, 35);
		CreateInvItems (slf,ItPo_Mana_03 	, 15);
		CreateInvItems (slf,ItPo_Health_01	,55);
		CreateInvItems (slf,ItPo_Health_02	, 30); 
		CreateInvItems (slf,ItPo_Health_03	, 20); 
		CreateInvItems (slf,ItPo_Perm_Health, 1); 
		CreateInvItems (slf, ItPo_Speed, 1); 
		CreateInvItems (slf,ItSc_Icebolt_Fake 		,8);
		CreateInvItems (slf,ItSc_IceWave_Fake		,1);
		CreateInvItems (slf,ItSc_IceCube_Fake		,3);
		CreateInvItems   (slf, ItPo_Gegengift,		2);
		
		Daniel_ItemsGiven_Chapter_5 = TRUE;
	};
};
