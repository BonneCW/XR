// ************************************************************************
// B_GetLearnCostTalent
// --------------------
// Ermittelt die Kosten eines beliebigen Talentes
// oder die Kosten eines Kampftalent %-Punktes
// in Abhängigkeit des zugeordneten "verwandten" Kampftalentes
// Einhänder - Zweihänder
// Bogen - Armbrust
// Die Kosten für ein Talent% verdoppeln sich, 
// wenn der Spieler das "verwandte" Talent eine STUFE schlechter beherrscht
// Das "untere" Talent wird simultan mit-hochgezogen
// ************************************************************************

func int B_GetLearnCostTalent (var C_NPC oth, var int talent, var int skill)
{
	// ------ Kostenberechnung ------
	var int kosten; kosten = 0;
	
	// ------ Kosten für Magiekreis ------
	if (talent == NPC_TALENT_MAGE)
	{
		kosten = (5);

		kosten = kosten * skill;
	};
	
	// ------ Kosten für Einhand % ------
	if (talent == NPC_TALENT_1H)
	{	
		if (oth.HitChance[NPC_TALENT_1H]-Bonus_1h >= 90)	{	kosten = (4);	}
		else if (oth.HitChance[NPC_TALENT_1H]-Bonus_1h >= 60)	{	kosten = (3);	}
		else if (oth.HitChance[NPC_TALENT_1H]-Bonus_1h >= 30)	{	kosten = (2);	}
		else 					{	kosten = (1);	};

		if (Mod_Gilde == 6)
		|| (Mod_Gilde == 7)
		|| (Mod_Gilde == 8)
		|| (Mod_Gilde == 10)
		|| (Mod_Gilde == 11)
		|| (Mod_Gilde == 13)
		|| (Mod_Gilde == 14)
		{
			kosten = kosten*2;
		};
		
		kosten = (kosten * skill);
	};
	
	// ------ Kosten für Zweihand % ------
	if (talent == NPC_TALENT_2H)
	{	
		if (oth.HitChance[NPC_TALENT_2H]-Bonus_2h >= 90)	{	kosten = (4);	}
		else if (oth.HitChance[NPC_TALENT_2H]-Bonus_2h >= 60)	{	kosten = (3);	}
		else if (oth.HitChance[NPC_TALENT_2H]-Bonus_2h >= 30)	{	kosten = (2);	}
		else 							{	kosten = (1);	};	

		if (Mod_Gilde == 6)
		|| (Mod_Gilde == 7)
		|| (Mod_Gilde == 8)
		|| (Mod_Gilde == 10)
		|| (Mod_Gilde == 11)
		|| (Mod_Gilde == 13)
		|| (Mod_Gilde == 14)
		{
			kosten = kosten*2;
		};
		
		kosten = (kosten * skill);
	};
	
		// ------ Kosten für Bogen % ------
	if (talent == NPC_TALENT_BOW)
	{	
		if (oth.HitChance[NPC_TALENT_BOW]-Bonus_Bow >= 90)	{	kosten = (4);	}
		else if (oth.HitChance[NPC_TALENT_BOW]-Bonus_Bow >= 60)	{	kosten = (3);	}
		else if (oth.HitChance[NPC_TALENT_BOW]-Bonus_Bow >= 30)	{	kosten = (2);	}
		else 							{	kosten = (1);	};

		if (Mod_Gilde == 6)
		|| (Mod_Gilde == 7)
		|| (Mod_Gilde == 8)
		|| (Mod_Gilde == 10)
		|| (Mod_Gilde == 11)
		|| (Mod_Gilde == 13)
		|| (Mod_Gilde == 14)
		{
			kosten = kosten*2;
		};
		
		kosten = (kosten * skill);
	};
	
	// ------ Kosten für Crossbow % ------
	if (talent == NPC_TALENT_CROSSBOW)
	{	
		if (oth.HitChance[NPC_TALENT_CROSSBOW]-Bonus_CBow >= 90)	{	kosten = (4);	}
		else if (oth.HitChance[NPC_TALENT_CROSSBOW]-Bonus_CBow >= 60)	{	kosten = (3);	}
		else if (oth.HitChance[NPC_TALENT_CROSSBOW]-Bonus_CBow >= 30)	{	kosten = (2);	}
		else 								{	kosten = (1);	};

		if (Mod_Gilde == 6)
		|| (Mod_Gilde == 7)
		|| (Mod_Gilde == 8)
		|| (Mod_Gilde == 10)
		|| (Mod_Gilde == 11)
		|| (Mod_Gilde == 13)
		|| (Mod_Gilde == 14)
		{
			kosten = kosten*2;
		};
		
		kosten = (kosten * skill);
	};
	
	// ------ Kosten für Diebestalente ------
	if (talent == NPC_TALENT_SNEAK)
	|| (talent == NPC_TALENT_ACROBAT)
	|| (talent == NPC_TALENT_SCROLLS)
	{
		kosten = (5);
	};
	
	if (talent == NPC_TALENT_PICKLOCK)
	{
		kosten = (20);
	};

	if (talent == NPC_TALENT_PICKPOCKET)
	{
		kosten = (20);
	};
		
	// ------ Kosten für Schmieden ------
	if (talent == NPC_TALENT_SMITH)
	{
		if 	(skill == WEAPON_Common) 		{	kosten = (2);	}
		else if (skill == WEAPON_1H_Special_01) 	{	kosten = (4);	}
		else if (skill == WEAPON_2H_Special_01) 	{	kosten = (4);	}
		else if (skill == WEAPON_1H_Special_02) 	{	kosten = (6);	}
		else if (skill == WEAPON_2H_Special_02) 	{	kosten = (6);	}
		else if (skill == WEAPON_1H_Special_03) 	{	kosten = (5);	}
		else if (skill == WEAPON_2H_Special_03) 	{	kosten = (5);	}
		else if (skill == WEAPON_1H_Special_04) 	{	kosten = (10);	}
		else if (skill == WEAPON_2H_Special_04) 	{	kosten = (15);	}

		else if (skill == WEAPON_1H_Harad_01)		{	kosten = (4);	}
		else if (skill == WEAPON_1H_Harad_02)		{	kosten = (6);	}
		else if (skill == WEAPON_1H_Harad_03)		{	kosten = (8);	}
		else if (skill == WEAPON_1H_Harad_04)		{	kosten = (10);	};
	};

	// ------ Kosten für Alchemie ------
	if (talent == NPC_TALENT_ALCHEMY)
	{
		if 	(skill == POTION_Health_01	) 	{	kosten = (2);	}
		else if (skill == POTION_Health_02  ) 		{	kosten = (3);	}
		else if (skill == POTION_Health_03  ) 		{	kosten = (5);	}
		else if (skill == POTION_Health_04	) 	{	kosten = (8);	}
		else if (skill == POTION_Health_05  ) 		{	kosten = (1);	}
		else if (skill == POTION_Health_06  ) 		{	kosten = (1);	}
		else if (skill == POTION_Health_07  ) 		{	kosten = (1);	}
		else if (skill == POTION_Mana_01  	) 	{	kosten = (2);	}
		else if (skill == POTION_Mana_02  	) 	{	kosten = (3);	}
		else if (skill == POTION_Mana_03 	) 	{	kosten = (5);	}
		else if (skill == POTION_Mana_04	) 	{	kosten = (8);	}
		else if (skill == POTION_Mana_05	) 	{	kosten = (1);	}
		else if (skill == POTION_Mana_06	) 	{	kosten = (1);	}
		else if (skill == POTION_Speed  	) 	{	kosten = (5);	}
		else if (skill == POTION_Perm_STR  	) 	{	kosten = (20);	}
		else if (skill == POTION_Perm_DEX  	) 	{	kosten = (20);	}
		else if (skill == POTION_Perm_Mana  ) 		{	kosten = (20);	}
		else if (skill == POTION_Perm_Health) 		{	kosten = (20);	}
		else if (skill == POTION_AdanosWohltat) 	{	kosten = (0);	}
		else if (skill == POTION_MegaDrink	) 	{	kosten = (20);	}
		else if (skill == POTION_GiftNeutralisierer) 	{	kosten = (15);	}
		else if (skill == POTION_Gift	) 		{	kosten = (5);	}
		else if (skill == POTION_Gegengift	) 	{	kosten = (3);	}
		else if (skill == POTION_Genesung	) 	{	kosten = (3);	}
		else if (skill == POTION_Regeneration	) 	{	kosten = (3);	};
	};                                                              
	
	// ------ Kosten für Animaltrophy ------
	if (talent == NPC_TALENT_TAKEANIMALTROPHY)
	{
		if 	(skill == TROPHY_Teeth			) 	{	kosten = (4);	}
		else if (skill == TROPHY_Claws			) 	{	kosten = (4);	}
		else if (skill == TROPHY_Fur			) 	{	kosten = (3);	}
		else if (skill == TROPHY_Heart			) 	{	kosten = (3);	}
		else if (skill == TROPHY_ShadowHorn 	) 		{	kosten = (5);	}
		else if (skill == TROPHY_FireTongue		) 	{	kosten = (5);	}
		else if (skill == TROPHY_BFWing			) 	{	kosten = (3);	}
		else if (skill == TROPHY_BFSting		) 	{	kosten = (3);	}
		else if (skill == TROPHY_Mandibles		) 	{	kosten = (3);	}
		else if (skill == TROPHY_CrawlerPlate	) 		{	kosten = (5);	}
		else if (skill == TROPHY_DrgSnapperHorn	) 		{	kosten = (5);	}
		else if (skill == TROPHY_DragonScale	) 		{	kosten = (6);	}
		else if (skill == TROPHY_DragonBlood	) 		{	kosten = (5);	}
		else if (skill == TROPHY_ReptileSkin	) 		{	kosten = (4);	}
		else if (skill == TROPHY_SwampSharkTeeth)		{	kosten = (5);	}
		else if (skill == TROPHY_TrollTeeth	)		{	kosten = (5);	}
		else if (skill == TROPHY_AlligatorClaws	)		{	kosten = (1);	}
		else if (skill == TROPHY_Blood	)			{	kosten = (1);	};
	};                                                                  

	// ------ Kosten für Sprache der Erbauer ------
	if (talent == NPC_TALENT_FOREIGNLANGUAGE) 	//ADDON
	{
		if 	(skill == LANGUAGE_1			) 	{	kosten = (5);	}
		else if (skill == LANGUAGE_2			) 	{	kosten = (10);	}
		else if (skill == LANGUAGE_3			) 	{	kosten = (15);	}
		else if (skill == LANGUAGE_ORC			) 	{	kosten = (10);	}
		else if (skill == LANGUAGE_DRACONIAN		) 	{	kosten = (5);	}
		else if (skill == LANGUAGE_TIER			) 	{	kosten = (5);	};
	};

	if (talent == NPC_TALENT_WISPDETECTOR) 	//ADDON
	{
		if 	(skill == WISPSKILL_NF	 	) 	{	kosten = (0);	}
		else if (skill == WISPSKILL_FF	 	) 	{	kosten = (1);	}
		else if (skill == WISPSKILL_NONE 	) 	{	kosten = (1);	}
		else if (skill == WISPSKILL_RUNE 	) 	{	kosten = (2);	}
		else if (skill == WISPSKILL_MAGIC   ) 		{	kosten = (2);	}
		else if (skill == WISPSKILL_FOOD 	) 	{	kosten = (1);	}
		else if (skill == WISPSKILL_POTIONS ) 		{	kosten = (2);	};
	};                                                              
	                                                                
	// ------ Kosten für Runen ------
	if (talent == NPC_TALENT_RUNES)
	{
		// PAL
		if 	(skill == SPL_PalLight			) 	{	kosten = (1);	}
		else if (skill == SPL_PalLightHeal		) 	{	kosten = (3);	}
		else if (skill == SPL_PalHolyBolt	    ) 		{	kosten = (3);	}
		else if (skill == SPL_PalMediumHeal		) 	{	kosten = (5);	}
		else if (skill == SPL_PalRepelEvil		) 	{	kosten = (5);	}
		else if (skill == SPL_PalFullHeal	    ) 		{	kosten = (10);	}
		else if (skill == SPL_PalDestroyEvil  	) 		{	kosten = (10);	}
		else if (skill == SPL_PalTeleportSecret ) 		{	kosten = (5);	}
		// 1                                                            
		else if (skill == SPL_Light 			) 	{	kosten = (1);	}
		else if (skill == SPL_Firebolt			) 	{	kosten = (5);	}
		else if (skill == SPL_LightHeal			) 	{	kosten = (3);	}
		else if (skill == SPL_SummonGoblinSkeleton)		{	kosten = (5);	}
		else if (skill == SPL_SummonGoblinKrieger)		{	kosten = (3);	}
		else if (skill == SPL_SummonEisGoblin)			{	kosten = (3);	}
		else if (skill == SPL_Zap			) 	{	kosten = (3);	}
		else if (skill == SPL_SuckEnergy)			{	kosten = (3);	}
		// 2                                                            
		else if (skill == SPL_Icebolt			) 	{	kosten = (5);	}
		else if (skill == SPL_InstantFireball	) 		{	kosten = (5);	}
		else if (skill == SPL_InstantIceball	) 		{	kosten = (5);	}
		else if (skill == SPL_SummonWolf		) 	{	kosten = (3);	}
		else if (skill == SPL_WindFist			) 	{	kosten = (5);	}
		else if (skill == SPL_Sleep			) 	{	kosten = (5);	}
		else if (skill == SPL_Charm			) 	{	kosten = (5);	}
		else if (skill == SPL_IceLance			) 	{	kosten = (5);	}  
		else if (skill == SPL_Whirlwind			) 	{	kosten = (5);	}
		// 3                                                            
		else if (skill == SPL_MediumHeal	    ) 		{	kosten = (5);	}
		else if (skill == SPL_LightningFlash  	) 		{	kosten = (5);	}
		else if (skill == SPL_ChargeFireball  	) 		{	kosten = (10);	}
		else if (skill == SPL_SummonSkeleton  	) 		{	kosten = (10);	}
		else if (skill == SPL_Fear			) 	{	kosten = (5);	}
		else if (skill == SPL_IceCube		    ) 		{	kosten = (10);	}
		else if (skill == SPL_Thunderstorm		)	{	kosten = (5);	}
		else if (skill == SPL_SummonGuardian	)		{	kosten = (10);	}
		else if (skill == SPL_EnergyBall	)		{	kosten = (10);	}
     		else if (skill == SPL_Geyser			) 	{	kosten = (10);	}
     		else if (skill == SPL_Zerfleischen		) 	{	kosten = (10);	}
		// 4                                                            
		else if (skill == SPL_ChargeZap			) 	{	kosten = (10);	}
		else if (skill == SPL_SummonGolem	    ) 		{	kosten = (15);	}
		else if (skill == SPL_SummonFireGolem	    ) 		{	kosten = (15);	}
		else if (skill == SPL_SummonIceGolem	    ) 		{	kosten = (15);	}
		else if (skill == SPL_DestroyUndead		) 	{	kosten = (10);	}
		else if (skill == SPL_Pyrokinesis	    ) 		{	kosten = (10);	}
		else if (skill == SPL_WaterFist			) 	{	kosten = (10);	}   
		else if (skill == SPL_SummonZombie	)		{	kosten = (10);	}
		// 5                                                            
		else if (skill == SPL_Firestorm			) 	{	kosten = (15);	}
		else if (skill == SPL_IceWave		    ) 		{	kosten = (20);	}
		else if (skill == SPL_SummonDemon	    ) 		{	kosten = (20);	}
		else if (skill == SPL_FullHeal			) 	{	kosten = (10);	}
		else if (skill == SPL_Pyrokinesis_G1	    ) 		{	kosten = (20);	}
		else if (skill == SPL_MasterOfDisaster	)		{	kosten = (15);	}
		else if (skill == SPL_Skull		)		{	kosten = (20);	}
		// 6                                                            
		else if (skill == SPL_Firerain			) 	{	kosten = (20);	}
		else if (skill == SPL_Icerain			) 	{	kosten = (20);	}
		else if (skill == SPL_BreathOfDeath		) 	{	kosten = (20);	}
		else if (skill == SPL_MassDeath			) 	{	kosten = (20);	}
		else if (skill == SPL_ArmyOfDarkness  	) 		{	kosten = (20);	}
		else if (skill == SPL_Shrink		    ) 		{	kosten = (20);	}
		else if (skill == SPL_SummonDragon		    ) 	{	kosten = (20);	}

		else 							{	kosten = (5);	};
	};

	if (Mod_Schwierigkeit == 4)
	{
		kosten = kosten*100;
	};

	return kosten;
};

func int B_GetLearnCostTalent_New (var C_NPC oth, var int talent)
{
	// ------ Kostenberechnung ------
	var int kosten; kosten = 0;
	
	// ------ Kosten für Einhand % ------
	if (talent == NPC_TALENT_1H)
	{	
		if (oth.HitChance[NPC_TALENT_1H]-Bonus_1h >= 90)	{ kosten = 20; }
		else if (oth.HitChance[NPC_TALENT_1H]-Bonus_1h == 89)	{ kosten = 19; }
		else if (oth.HitChance[NPC_TALENT_1H]-Bonus_1h == 88)	{ kosten = 18; }
		else if (oth.HitChance[NPC_TALENT_1H]-Bonus_1h == 87)	{ kosten = 17; }
		else if (oth.HitChance[NPC_TALENT_1H]-Bonus_1h == 86)	{ kosten = 16; }
		else if (oth.HitChance[NPC_TALENT_1H]-Bonus_1h >= 60)	{ kosten = 15; }
		else if (oth.HitChance[NPC_TALENT_1H]-Bonus_1h == 59)	{ kosten = 14; }
		else if (oth.HitChance[NPC_TALENT_1H]-Bonus_1h == 58)	{ kosten = 13; }
		else if (oth.HitChance[NPC_TALENT_1H]-Bonus_1h == 57)	{ kosten = 12; }
		else if (oth.HitChance[NPC_TALENT_1H]-Bonus_1h == 56)	{ kosten = 11; }
		else if (oth.HitChance[NPC_TALENT_1H]-Bonus_1h >= 30)	{ kosten = 10; }
		else if (oth.HitChance[NPC_TALENT_1H]-Bonus_1h >= 29)	{ kosten = 9; }
		else if (oth.HitChance[NPC_TALENT_1H]-Bonus_1h >= 28)	{ kosten = 8; }
		else if (oth.HitChance[NPC_TALENT_1H]-Bonus_1h >= 27)	{ kosten = 7; }
		else if (oth.HitChance[NPC_TALENT_1H]-Bonus_1h >= 26)	{ kosten = 6; }
		else 							{ kosten = 5; };

		if (Mod_Gilde == 6)
		|| (Mod_Gilde == 7)
		|| (Mod_Gilde == 8)
		|| (Mod_Gilde == 10)
		|| (Mod_Gilde == 11)
		|| (Mod_Gilde == 13)
		|| (Mod_Gilde == 14)
		{
			kosten = kosten*2;
		};
	};
	
	// ------ Kosten für Zweihand % ------
	if (talent == NPC_TALENT_2H)
	{	
		if (oth.HitChance[NPC_TALENT_2H]-Bonus_2h >= 90)	{ kosten = 20; }
		else if (oth.HitChance[NPC_TALENT_2H]-Bonus_2h == 89)	{ kosten = 19; }
		else if (oth.HitChance[NPC_TALENT_2H]-Bonus_2h == 88)	{ kosten = 18; }
		else if (oth.HitChance[NPC_TALENT_2H]-Bonus_2h == 87)	{ kosten = 17; }
		else if (oth.HitChance[NPC_TALENT_2H]-Bonus_2h == 86)	{ kosten = 16; }
		else if (oth.HitChance[NPC_TALENT_2H]-Bonus_2h >= 60)	{ kosten = 15; }
		else if (oth.HitChance[NPC_TALENT_2H]-Bonus_2h == 59)	{ kosten = 14; }
		else if (oth.HitChance[NPC_TALENT_2H]-Bonus_2h == 58)	{ kosten = 13; }
		else if (oth.HitChance[NPC_TALENT_2H]-Bonus_2h == 57)	{ kosten = 12; }
		else if (oth.HitChance[NPC_TALENT_2H]-Bonus_2h == 56)	{ kosten = 11; }
		else if (oth.HitChance[NPC_TALENT_2H]-Bonus_2h >= 30)	{ kosten = 10; }
		else if (oth.HitChance[NPC_TALENT_2H]-Bonus_2h >= 29)	{ kosten = 9; }
		else if (oth.HitChance[NPC_TALENT_2H]-Bonus_2h >= 28)	{ kosten = 8; }
		else if (oth.HitChance[NPC_TALENT_2H]-Bonus_2h >= 27)	{ kosten = 7; }
		else if (oth.HitChance[NPC_TALENT_2H]-Bonus_2h >= 26)	{ kosten = 6; }
		else 							{ kosten = 5; };

		if (Mod_Gilde == 6)
		|| (Mod_Gilde == 7)
		|| (Mod_Gilde == 8)
		|| (Mod_Gilde == 10)
		|| (Mod_Gilde == 11)
		|| (Mod_Gilde == 13)
		|| (Mod_Gilde == 14)
		{
			kosten = kosten*2;
		};
	};
	
		// ------ Kosten für Bogen % ------
	if (talent == NPC_TALENT_BOW)
	{	
		if (oth.HitChance[NPC_TALENT_BOW]-Bonus_Bow >= 90)	{ kosten = 20; }
		else if (oth.HitChance[NPC_TALENT_BOW]-Bonus_Bow == 89)	{ kosten = 19; }
		else if (oth.HitChance[NPC_TALENT_BOW]-Bonus_Bow == 88)	{ kosten = 18; }
		else if (oth.HitChance[NPC_TALENT_BOW]-Bonus_Bow == 87)	{ kosten = 17; }
		else if (oth.HitChance[NPC_TALENT_BOW]-Bonus_Bow == 86)	{ kosten = 16; }
		else if (oth.HitChance[NPC_TALENT_BOW]-Bonus_Bow >= 60)	{ kosten = 15; }
		else if (oth.HitChance[NPC_TALENT_BOW]-Bonus_Bow == 59)	{ kosten = 14; }
		else if (oth.HitChance[NPC_TALENT_BOW]-Bonus_Bow == 58)	{ kosten = 13; }
		else if (oth.HitChance[NPC_TALENT_BOW]-Bonus_Bow == 57)	{ kosten = 12; }
		else if (oth.HitChance[NPC_TALENT_BOW]-Bonus_Bow == 56)	{ kosten = 11; }
		else if (oth.HitChance[NPC_TALENT_BOW]-Bonus_Bow >= 30)	{ kosten = 10; }
		else if (oth.HitChance[NPC_TALENT_BOW]-Bonus_Bow >= 29)	{ kosten = 9; }
		else if (oth.HitChance[NPC_TALENT_BOW]-Bonus_Bow >= 28)	{ kosten = 8; }
		else if (oth.HitChance[NPC_TALENT_BOW]-Bonus_Bow >= 27)	{ kosten = 7; }
		else if (oth.HitChance[NPC_TALENT_BOW]-Bonus_Bow >= 26)	{ kosten = 6; }
		else 							{ kosten = 5; };

		if (Mod_Gilde == 6)
		|| (Mod_Gilde == 7)
		|| (Mod_Gilde == 8)
		|| (Mod_Gilde == 10)
		|| (Mod_Gilde == 11)
		|| (Mod_Gilde == 13)
		|| (Mod_Gilde == 14)
		{
			kosten = kosten*2;
		};
	};
	
	// ------ Kosten für Crossbow % ------
	if (talent == NPC_TALENT_CROSSBOW)
	{	
		if (oth.HitChance[NPC_TALENT_CROSSBOW]-Bonus_CBow >= 90)	{ kosten = 20; }
		else if (oth.HitChance[NPC_TALENT_CROSSBOW]-Bonus_CBow == 89)	{ kosten = 19; }
		else if (oth.HitChance[NPC_TALENT_CROSSBOW]-Bonus_CBow == 88)	{ kosten = 18; }
		else if (oth.HitChance[NPC_TALENT_CROSSBOW]-Bonus_CBow == 87)	{ kosten = 17; }
		else if (oth.HitChance[NPC_TALENT_CROSSBOW]-Bonus_CBow == 86)	{ kosten = 16; }
		else if (oth.HitChance[NPC_TALENT_CROSSBOW]-Bonus_CBow >= 60)	{ kosten = 15; }
		else if (oth.HitChance[NPC_TALENT_CROSSBOW]-Bonus_CBow == 59)	{ kosten = 14; }
		else if (oth.HitChance[NPC_TALENT_CROSSBOW]-Bonus_CBow == 58)	{ kosten = 13; }
		else if (oth.HitChance[NPC_TALENT_CROSSBOW]-Bonus_CBow == 57)	{ kosten = 12; }
		else if (oth.HitChance[NPC_TALENT_CROSSBOW]-Bonus_CBow == 56)	{ kosten = 11; }
		else if (oth.HitChance[NPC_TALENT_CROSSBOW]-Bonus_CBow >= 30)	{ kosten = 10; }
		else if (oth.HitChance[NPC_TALENT_CROSSBOW]-Bonus_CBow >= 29)	{ kosten = 9; }
		else if (oth.HitChance[NPC_TALENT_CROSSBOW]-Bonus_CBow >= 28)	{ kosten = 8; }
		else if (oth.HitChance[NPC_TALENT_CROSSBOW]-Bonus_CBow >= 27)	{ kosten = 7; }
		else if (oth.HitChance[NPC_TALENT_CROSSBOW]-Bonus_CBow >= 26)	{ kosten = 6; }
		else 								{ kosten = 5; };

		if (Mod_Gilde == 6)
		|| (Mod_Gilde == 7)
		|| (Mod_Gilde == 8)
		|| (Mod_Gilde == 10)
		|| (Mod_Gilde == 11)
		|| (Mod_Gilde == 13)
		|| (Mod_Gilde == 14)
		{
			kosten = kosten*2;
		};
	};

	if (Mod_Schwierigkeit == 4)
	{
		kosten = kosten*100;
	};

	return kosten;
};