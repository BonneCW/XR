var int Ignaz_ItemsGiven_Chapter_1;
var int Ignaz_ItemsGiven_Chapter_2;
var int Ignaz_ItemsGiven_Chapter_3;
var int Ignaz_ItemsGiven_Chapter_4;
var int Ignaz_ItemsGiven_Chapter_5;

FUNC VOID B_GiveTradeInv_Mod_Ignaz_NW (var C_NPC slf)
{
	if (Npc_HasItems(slf, ItMi_Flask) < 25) {
		CreateInvItems(slf, ItMi_Flask, 25 - Npc_HasItems(slf, ItMi_Flask));
	};
	
	if (Kapitel >= 1)
	&& (Ignaz_ItemsGiven_Chapter_1 == FALSE)
	{
		CreateInvItems (slf, ItMi_Gold, 100); 
		CreateInvItems (slf,ItPo_Mana_01 	, 1); 
		CreateInvItems (slf,ItPo_Health_01	, 1);
		CreateInvItems (slf,ItPo_Speed 		, 1); 
		CreateInvItems   (slf, ItPo_Health_Addon_04,	3);
		CreateInvItems   (slf, ItPo_Mana_Addon_04,		3);
		CreateInvItems (slf,ITMI_Flask		,10);
		CreateInvItems	(slf, ItAt_Sting, 1);	
		CreateInvItems	(slf, ItWr_Scroll_Firebolt, 1);	
		CreateInvItems	(slf, ItWr_Scroll_Icebolt, 1);	
		CreateInvItems	(slf, ItWr_Scroll_Zap, 1);	
		CreateInvItems	(slf, ItWr_Scroll_SumWolf, 1);	
		CreateInvItems	(slf, ItWr_Scroll_SumGobSkel, 1);	
		CreateInvItems	(slf, ItWr_Scroll_SumSkel, 1);	
		CreateInvItems	(slf, ItWr_Scroll_SummonGuardian, 1);	
		CreateInvItems	(slf, ItWr_Scroll_SummonZombie, 1);	
		CreateInvItems	(slf, ItWr_Scroll_SumGol, 1);	
		CreateInvItems	(slf, ItWr_Scroll_SumDemon, 1);	
		CreateInvItems	(slf, ItWr_Scroll_ArmyOfDarkness, 1);	
		CreateInvItems	(slf, ItWr_Scroll_InstantIceball, 1);	
		CreateInvItems	(slf, ItWr_Scroll_Icelance, 1);	
		CreateInvItems	(slf, ItWr_Scroll_Geyser, 1);	
		CreateInvItems	(slf, ItWr_Scroll_Icecube, 1);	
		CreateInvItems	(slf, ItWr_Scroll_Waterfist, 1);	
		CreateInvItems	(slf, ItWr_Scroll_Icewave, 1);	
		CreateInvItems	(slf, ItWr_Scroll_Icerain, 1);	
		CreateInvItems	(slf, ItWr_Scroll_InstantFireball, 1);	
		CreateInvItems	(slf, ItWr_Scroll_Firestorm, 1);	
		CreateInvItems	(slf, ItWr_Scroll_ChargeFireball, 1);	
		CreateInvItems	(slf, ItWr_Scroll_Pyrokinesis, 1);	
		CreateInvItems	(slf, ItWr_Scroll_Firerain, 1);	
		CreateInvItems	(slf, ItWr_Scroll_Thunderstorm, 1);	
		CreateInvItems	(slf, ItWr_Scroll_Thunderball, 1);	
		CreateInvItems	(slf, ItWr_Scroll_LightningFlash, 1);	
		CreateInvItems	(slf, ItWr_Scroll_Light, 1);	
		CreateInvItems	(slf, ItWr_Scroll_Shrink, 1);	
		CreateInvItems	(slf, ItWr_Scroll_HarmUndead, 1);	
		CreateInvItems	(slf, ItWr_Scroll_LightHeal, 1);	
		CreateInvItems	(slf, ItWr_Scroll_MediumHeal, 1);	
		CreateInvItems	(slf, ItWr_Scroll_FullHeal, 1);	
		CreateInvItems	(slf, ItWr_Scroll_SuckEnergy, 1);	
		CreateInvItems	(slf, ItWr_Scroll_Zerfleischen, 1);	
		CreateInvItems	(slf, ItWr_Scroll_BeliarsRage, 1);	
		CreateInvItems	(slf, ItWr_Scroll_Skull, 1);	
		CreateInvItems	(slf, ItWr_Scroll_BreathOfDeath, 1);	
		CreateInvItems	(slf, ItWr_Paper, 15);	
		
		// ------ Scrolls ------
		CreateInvItems (slf,ITSC_Charm			,5);
		CreateInvItems (slf,ITSC_Sleep			,1);
	
		CreateInvItems (slf, ItPo_ZufallsDrink,		1);
		CreateInvItems   (slf, ItPo_Gegengift,		2);
		CreateInvItems	(slf, ItPl_Zwillingsdorn, 1);
		
		Ignaz_ItemsGiven_Chapter_1 = TRUE;
	};
	
	if ((Kapitel >= 2)
	&& Ignaz_ItemsGiven_Chapter_2 == FALSE)
	{
		CreateInvItems (slf, ItMi_Gold, 200); 
		CreateInvItems   (slf, ItPo_Health_Addon_04,	3);
		CreateInvItems   (slf, ItPo_Mana_Addon_04,		3);
		CreateInvItems (slf,ItPo_Mana_01 	, 2); 
		CreateInvItems (slf,ItPo_Health_01	, 2);
		CreateInvItems (slf,ItPo_Speed 		, 2); 
		CreateInvItems (slf,ITSC_Charm		, 5);	
		CreateInvItems (slf,ITMI_Flask		,10);	
		CreateInvItems	(slf, ItWr_Scroll_SumWolf, 1);	
		CreateInvItems   (slf, ItPo_Gegengift,		2);
		CreateInvItems	(slf, ItWr_Scroll_Firebolt, 1);	
		CreateInvItems	(slf, ItWr_Scroll_Icebolt, 1);	
		CreateInvItems	(slf, ItWr_Scroll_Zap, 1);	
		CreateInvItems	(slf, ItWr_Scroll_SumWolf, 1);	
		CreateInvItems	(slf, ItWr_Scroll_SumGobSkel, 1);	
		CreateInvItems	(slf, ItWr_Scroll_SumSkel, 1);	
		CreateInvItems	(slf, ItWr_Scroll_SummonGuardian, 1);	
		CreateInvItems	(slf, ItWr_Scroll_SummonZombie, 1);	
		CreateInvItems	(slf, ItWr_Scroll_SumGol, 1);	
		CreateInvItems	(slf, ItWr_Scroll_SumDemon, 1);	
		CreateInvItems	(slf, ItWr_Scroll_ArmyOfDarkness, 1);	
		CreateInvItems	(slf, ItWr_Scroll_InstantIceball, 1);	
		CreateInvItems	(slf, ItWr_Scroll_Icelance, 1);	
		CreateInvItems	(slf, ItWr_Scroll_Geyser, 1);	
		CreateInvItems	(slf, ItWr_Scroll_Icecube, 1);	
		CreateInvItems	(slf, ItWr_Scroll_Waterfist, 1);	
		CreateInvItems	(slf, ItWr_Scroll_Icewave, 1);	
		CreateInvItems	(slf, ItWr_Scroll_Icerain, 1);	
		CreateInvItems	(slf, ItWr_Scroll_InstantFireball, 1);	
		CreateInvItems	(slf, ItWr_Scroll_Firestorm, 1);	
		CreateInvItems	(slf, ItWr_Scroll_ChargeFireball, 1);	
		CreateInvItems	(slf, ItWr_Scroll_Pyrokinesis, 1);	
		CreateInvItems	(slf, ItWr_Scroll_Firerain, 1);	
		CreateInvItems	(slf, ItWr_Scroll_Thunderstorm, 1);	
		CreateInvItems	(slf, ItWr_Scroll_Thunderball, 1);	
		CreateInvItems	(slf, ItWr_Scroll_LightningFlash, 1);	
		CreateInvItems	(slf, ItWr_Scroll_Light, 1);	
		CreateInvItems	(slf, ItWr_Scroll_Shrink, 1);	
		CreateInvItems	(slf, ItWr_Scroll_HarmUndead, 1);	
		CreateInvItems	(slf, ItWr_Scroll_LightHeal, 1);	
		CreateInvItems	(slf, ItWr_Scroll_MediumHeal, 1);	
		CreateInvItems	(slf, ItWr_Scroll_FullHeal, 1);	
		CreateInvItems	(slf, ItWr_Scroll_SuckEnergy, 1);	
		CreateInvItems	(slf, ItWr_Scroll_Zerfleischen, 1);	
		CreateInvItems	(slf, ItWr_Scroll_BeliarsRage, 1);	
		CreateInvItems	(slf, ItWr_Scroll_Skull, 1);	
		CreateInvItems	(slf, ItWr_Scroll_BreathOfDeath, 1);	
		CreateInvItems	(slf, ItPl_Zwillingsdorn, 1);
		
		Ignaz_ItemsGiven_Chapter_2 = TRUE;
	};	
	
	if ((Kapitel >= 3)
	&& (Ignaz_ItemsGiven_Chapter_3 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 300); 
		CreateInvItems   (slf, ItPo_Health_Addon_04,	3);
		CreateInvItems   (slf, ItPo_Mana_Addon_04,		3);
		CreateInvItems (slf,ItPo_Mana_01 	, 3); 
		CreateInvItems (slf,ItPo_Health_01	, 3);
		CreateInvItems (slf,ItPo_Speed 		, 3); 
		CreateInvItems (slf,ITSC_Charm		, 5);	
		CreateInvItems (slf,ITMI_Flask		,10);	
		CreateInvItems	(slf, ItWr_Scroll_SumWolf, 1);	
		CreateInvItems   (slf, ItPo_Gegengift,		2);
		CreateInvItems	(slf, ItPl_Zwillingsdorn, 1);
				
		Ignaz_ItemsGiven_Chapter_3 = TRUE;
	};

	if ((Kapitel >= 4)
	&& (Ignaz_ItemsGiven_Chapter_4 == FALSE))
	{
	
		CreateInvItems (slf, ItMi_Gold, 400); 
		CreateInvItems (slf, ItPo_Health_Addon_04,	3);
		CreateInvItems (slf, ItPo_Mana_Addon_04,		3);
		CreateInvItems (slf,ItPo_Mana_01 	, 4); 
		CreateInvItems (slf,ItPo_Health_01	, 4);
		CreateInvItems (slf,ItPo_Speed 		, 4); 
		CreateInvItems (slf,ITSC_Charm		, 5);	
		CreateInvItems (slf,ITMI_Flask		,10);	
		CreateInvItems	(slf, ItWr_Scroll_SumWolf, 1);	
	
		CreateInvItems (slf, ItPo_ZufallsDrink,		1);
		CreateInvItems   (slf, ItPo_Gegengift,		2);
		CreateInvItems	(slf, ItPl_Zwillingsdorn, 1);
		

		Ignaz_ItemsGiven_Chapter_4 = TRUE;
	};

	if ((Kapitel >= 5)
	&& (Ignaz_ItemsGiven_Chapter_5 == FALSE))
	{
		CreateInvItems (slf, ItMi_Gold, 500); 
		CreateInvItems (slf,ItPo_Mana_01 	, 5); 
		CreateInvItems (slf,ItPo_Health_01	, 5);
		CreateInvItems (slf,ItPo_Speed 		, 5); 
		CreateInvItems (slf,ITSC_Charm		, 5);	
		CreateInvItems (slf,ITMI_Flask		,10);	
		CreateInvItems	(slf, ItWr_Scroll_SumWolf, 1);	
		CreateInvItems   (slf, ItPo_Gegengift,		2);
		CreateInvItems	(slf, ItPl_Zwillingsdorn, 1);
		
		Ignaz_ItemsGiven_Chapter_5 = TRUE;
	};
};
