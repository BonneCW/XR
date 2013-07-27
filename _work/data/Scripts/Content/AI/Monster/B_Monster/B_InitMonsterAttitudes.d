// ***************************************************************
// B_InitMonsterAttitudes
// ---------------------- 
// Setzt die Monster/Monster-Attitüden
// und Monster/Mensch-(Mensch/Monster)-Attitüden 
// Alle Menschen werden gesammelt über GIL_SEPERATOR_HUM angegeben
// ***************************************************************

func void B_InitMonsterAttitudes ()
{
	// ------ Mensch zu Monster ------
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_FRIENDLY,	GIL_SEPERATOR_HUM					);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_FRIENDLY,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_NEUTRAL,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_FRIENDLY,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_NEUTRAL,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_NEUTRAL,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_FRIENDLY,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_NEUTRAL, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_NEUTRAL, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE, 	GIL_Spider			);
	
	

	// ------ Dementor zu Monstern ------
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_DMT, 	ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_DMT, 	ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_DMT, 	ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_DMT,	ATT_NEUTRAL, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_DMT, 	ATT_NEUTRAL, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_DMT, ATT_NEUTRAL, 	GIL_Spider			);
	B_SetMonsterAttitude	(GIL_DMT, ATT_NEUTRAL, 	GIL_STRF			);

	// ------ Meatbug zu allen anderen ------
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_GIANT_RAT 				);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_MEATBUG,	ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_MEATBUG, 	ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_MEATBUG, 	ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_MEATBUG, 	ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_MEATBUG, 	ATT_NEUTRAL, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_MEATBUG, 	ATT_NEUTRAL, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_MEATBUG, ATT_NEUTRAL, 	GIL_Spider			);
	
	// ------ Schaf zu allen anderen ------
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_GIANT_RAT 				);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_HOSTILE,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_HOSTILE,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_HOSTILE,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_SHEEP,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_SHEEP, ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_SHEEP, ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_SHEEP, ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_SHEEP, ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_SHEEP, ATT_NEUTRAL, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_SHEEP, ATT_NEUTRAL, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_SHEEP, ATT_NEUTRAL, 	GIL_Spider			);

	// ------ Goblin zu allen anderen ------
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_FRIENDLY,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_GIANT_RAT 				);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_GOBBO,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_GOBBO, ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_GOBBO, ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_GOBBO, ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_GOBBO, ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_GOBBO, ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_GOBBO, ATT_HOSTILE, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_GOBBO, ATT_HOSTILE, 	GIL_Spider			);
	
	// ------ Goblin Skelett zu allen anderen ------
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_FRIENDLY,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON, 	ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON, 	ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON, 	ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON, 	ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON, 	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_GOBBO_SKELETON,	ATT_HOSTILE, 	GIL_Spider			);
	
	// ------ SUMMONED_GOBBO_SKELETON zu allen anderen ------
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_NEUTRAL,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_NEUTRAL,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_GIANT_RAT					);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_NEUTRAL,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_NEUTRAL,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON, 	ATT_HOSTILE, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON, 	ATT_HOSTILE, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON, 	ATT_HOSTILE, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON, 	ATT_HOSTILE, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON, 	ATT_NEUTRAL, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_NEUTRAL, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOBBO_SKELETON,	ATT_HOSTILE, 	GIL_Spider			);

	// ------ Scavenger zu allen anderen ------
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_FRIENDLY,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_GIANT_RAT					);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_SCAVENGER, ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_SCAVENGER, ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_SCAVENGER, ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_SCAVENGER, ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_SCAVENGER, ATT_NEUTRAL, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_SCAVENGER,	ATT_NEUTRAL, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_SCAVENGER, ATT_NEUTRAL, 	GIL_Spider			);

	// ------ Giant Rat zu allen anderen ------
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_FRIENDLY,	GIL_GIANT_RAT					);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_GIANT_RAT, ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_GIANT_RAT, ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_GIANT_RAT, ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_GIANT_RAT, ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_GIANT_RAT, ATT_NEUTRAL, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_GIANT_RAT,	ATT_NEUTRAL, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_GIANT_RAT, ATT_NEUTRAL, 	GIL_Spider			);

	// ------ Giant Bug zu allen anderen ------
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_GIANT_BUG, ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_GIANT_BUG, ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_GIANT_BUG, ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_GIANT_BUG, ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_GIANT_BUG, ATT_NEUTRAL, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_GIANT_BUG,	ATT_NEUTRAL, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_GIANT_BUG, ATT_NEUTRAL, 	GIL_Spider			);


	// ------ Bloodfly zu allen anderen ------
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_HOSTILE,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_BLOODFLY, 	ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_BLOODFLY, 	ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_BLOODFLY, 	ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_BLOODFLY, 	ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_BLOODFLY, ATT_NEUTRAL, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_NEUTRAL, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_BLOODFLY, ATT_NEUTRAL, 	GIL_Spider			);

	// ------ Warane zu allen anderen ------
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_FRIENDLY,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_WARAN, ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_WARAN, ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_WARAN, ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_WARAN, ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_WARAN, ATT_NEUTRAL, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_WARAN,	ATT_NEUTRAL, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_WARAN, ATT_NEUTRAL, 	GIL_Spider			);


	// ------ Wölfe zu allen anderen ------
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_HOSTILE,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_HOSTILE,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_HOSTILE,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_FRIENDLY,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_HOSTILE,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_WOLF, 	ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_WOLF, 	ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_WOLF, 	ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_WOLF, 	ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_WOLF, ATT_NEUTRAL, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_WOLF,	ATT_NEUTRAL, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_WOLF, ATT_NEUTRAL, 	GIL_Spider			);


	// ------ Summoned Wolf zu allen anderen ------
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_FRIENDLY,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_NEUTRAL,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_NEUTRAL,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_NEUTRAL,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF	,	ATT_HOSTILE,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF, 	ATT_HOSTILE, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF, 	ATT_HOSTILE, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF, 	ATT_HOSTILE, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF, 	ATT_HOSTILE, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF, 	ATT_NEUTRAL, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF,		ATT_NEUTRAL, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_SUMMONED_WOLF, ATT_HOSTILE, 	GIL_Spider			);

	// ------ Minecrawler zu allen anderen ------
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_FRIENDLY,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_MINECRAWLER, 	ATT_HOSTILE, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_MINECRAWLER, 	ATT_HOSTILE, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_MINECRAWLER, 	ATT_HOSTILE, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_MINECRAWLER, 	ATT_HOSTILE, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_MINECRAWLER, 	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_HOSTILE, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_MINECRAWLER, ATT_NEUTRAL, 	GIL_Spider			);

	// ------ Lurker zu allen anderen ------
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_HOSTILE,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_LURKER, 	ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_LURKER, 	ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_LURKER, 	ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_LURKER, 	ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_LURKER, 	ATT_NEUTRAL, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_LURKER,	ATT_NEUTRAL, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_LURKER, ATT_NEUTRAL, 	GIL_Spider			);

	// ------ Skelette zu allen anderen ------
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_FRIENDLY,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_FRIENDLY,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_FRIENDLY,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_FRIENDLY,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_FRIENDLY,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_FRIENDLY,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_FRIENDLY,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_FRIENDLY,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_FRIENDLY,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_SKELETON, 	ATT_HOSTILE, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_SKELETON, 	ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_SKELETON, 	ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_SKELETON, 	ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_SKELETON, 	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_SKELETON,	ATT_HOSTILE, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_SKELETON, ATT_HOSTILE, 	GIL_Spider			);

	// ------ Summoned Skeleton zu allen anderen ------
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_NEUTRAL,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_NEUTRAL,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_NEUTRAL,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_NEUTRAL,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_HOSTILE,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON, ATT_HOSTILE, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON, ATT_HOSTILE, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON, ATT_HOSTILE, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON, ATT_HOSTILE, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_NEUTRAL, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON,	ATT_NEUTRAL, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_SUMMONED_SKELETON, ATT_HOSTILE, 	GIL_Spider			);


	// ------ Skeleton Mage zu allen anderen ------
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_FRIENDLY,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_FRIENDLY,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_FRIENDLY,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_FRIENDLY,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_FRIENDLY,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_FRIENDLY,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_FRIENDLY,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_FRIENDLY,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_FRIENDLY,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE, ATT_HOSTILE, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE, ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE, ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE, ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE,	ATT_HOSTILE, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_SKELETON_MAGE, ATT_HOSTILE, 	GIL_Spider			);
	
	// ------ Zombie zu allen anderen ------
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_FRIENDLY,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_FRIENDLY,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_FRIENDLY,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_FRIENDLY,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_FRIENDLY,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_FRIENDLY,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_FRIENDLY,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_FRIENDLY,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_FRIENDLY,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_ZOMBIE, 	ATT_HOSTILE, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_ZOMBIE, 	ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_ZOMBIE, 	ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_ZOMBIE, 	ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_HOSTILE, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_ZOMBIE, ATT_HOSTILE, 	GIL_Spider			);

	// ------ Snapper zu allen anderen ------
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_HOSTILE,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_HOSTILE,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_HOSTILE,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_HOSTILE,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_FRIENDLY,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_HOSTILE,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_SNAPPER, 	ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_SNAPPER, 	ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_SNAPPER, 	ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_SNAPPER, 	ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_SNAPPER,	ATT_NEUTRAL, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_SNAPPER, ATT_NEUTRAL, 	GIL_Spider			);
		
	// ------ Shadowbeast zu allen anderen ------
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_HOSTILE,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_HOSTILE,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_HOSTILE,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_HOSTILE,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_HOSTILE,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_HOSTILE,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_HOSTILE,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_HOSTILE,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_HOSTILE,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_HOSTILE,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST, 	ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST, 	ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST, 	ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST,	ATT_HOSTILE, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST, ATT_HOSTILE, 	GIL_Spider			);
	
	// ------ Shadowbeast Skelett zu allen anderen ------
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_FRIENDLY,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_FRIENDLY,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_FRIENDLY,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_FRIENDLY,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_FRIENDLY,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_FRIENDLY,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_FRIENDLY,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_FRIENDLY,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_FRIENDLY,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON, 	ATT_HOSTILE, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON, 	ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON, 	ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON, 	ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON,	ATT_HOSTILE, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_SHADOWBEAST_SKELETON, ATT_HOSTILE, 	GIL_Spider			);

	// ------ Harpie zu allen anderen ------
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_HOSTILE,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_FRIENDLY,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_HARPY, ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_HARPY, ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_HARPY, ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_HARPY, ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_HARPY,	ATT_HOSTILE, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_HARPY, ATT_HOSTILE, 	GIL_Spider			);
	
	// ------ Steingolem zu allen anderen ------
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_STONEGOLEM, 	ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_STONEGOLEM, 	ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_STONEGOLEM, 	ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_STONEGOLEM, 	ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_HOSTILE, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_STONEGOLEM, ATT_HOSTILE, 	GIL_Spider			);
	
	// ------ Feuergolem zu allen anderen ------
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_FRIENDLY,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_FRIENDLY,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_FIREGOLEM, ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_FIREGOLEM, ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_FIREGOLEM, ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_FIREGOLEM, ATT_FRIENDLY, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_FIREGOLEM,	ATT_HOSTILE, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_FIREGOLEM, ATT_HOSTILE, 	GIL_Spider			);

	// ------ Eisgolem zu allen anderen ------
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_ICEGOLEM, 	ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_ICEGOLEM, 	ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_ICEGOLEM, 	ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_ICEGOLEM, 	ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_ICEGOLEM,	ATT_HOSTILE, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_ICEGOLEM, ATT_HOSTILE, 	GIL_Spider			);

	// ------ Summoned Golem zu allen anderen ------
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_NEUTRAL,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_NEUTRAL,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_NEUTRAL,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_NEUTRAL,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_HOSTILE,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM, 	ATT_HOSTILE, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM, 	ATT_HOSTILE, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM, 	ATT_HOSTILE, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM, 	ATT_HOSTILE, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_NEUTRAL, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM,	ATT_NEUTRAL, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_SUMMONED_GOLEM, ATT_HOSTILE, 	GIL_Spider			);

	// ------ Demon zu allen anderen ------
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_FRIENDLY,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_FRIENDLY,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_FRIENDLY,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_DEMON, 			ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_DEMON, 			ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_DEMON, 			ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_DEMON, 			ATT_FRIENDLY, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_DEMON,				ATT_HOSTILE, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_DEMON, ATT_HOSTILE, 	GIL_Spider			);

	// ------ Summoned Demon zu allen anderen ------
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_NEUTRAL,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_NEUTRAL,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_NEUTRAL,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_NEUTRAL,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_HOSTILE,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON, 	ATT_HOSTILE, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON, 	ATT_HOSTILE, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON, 	ATT_HOSTILE, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON, 	ATT_HOSTILE, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_NEUTRAL, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON,	ATT_NEUTRAL, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_SUMMONED_DEMON, ATT_HOSTILE, 	GIL_Spider			);

	// ------ Trolle zu allen anderen ------
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_TROLL, ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_TROLL, ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_TROLL, ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_TROLL, ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_TROLL,	ATT_NEUTRAL, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_TROLL, ATT_NEUTRAL, 	GIL_Spider			);

	// ------ Swampsharks zu allen anderen ------
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_FRIENDLY,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK, 	ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK, 	ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK, 	ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK, 	ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK,	ATT_NEUTRAL, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_SWAMPSHARK, ATT_HOSTILE, 	GIL_Spider			);

	// ------ Drachen zu allen anderen ------
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_DRAGON, 	ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_DRAGON, 	ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_DRAGON, 	ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_DRAGON, 	ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_DRAGON,	ATT_HOSTILE, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_DRAGON, ATT_HOSTILE, 	GIL_Spider			);

	// ------ Molerat zu allen anderen ------
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_FRIENDLY,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_MOLERAT		, 	ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_MOLERAT		, 	ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_MOLERAT		, 	ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_MOLERAT		,	ATT_HOSTILE, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_MOLERAT, ATT_NEUTRAL, 	GIL_Spider			);

	if (Mod_UluMulu == 0)
	{
	// ------ Orks zu allen anderen ------
		B_SetMonsterAttitude	(GIL_ORC,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	}
	else if (Mod_UluMulu == 1)
	{
		B_SetMonsterAttitude	(GIL_ORC,	ATT_FRIENDLY,	GIL_SEPERATOR_HUM			);
	}
	else if (Mod_TorInStadt == 2)
	{
		B_SetMonsterAttitude	(GIL_ORC,	ATT_FRIENDLY,	GIL_SEPERATOR_HUM	);
	};

	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_ORC,	ATT_HOSTILE,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_FRIENDLY,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_ORC,	ATT_FRIENDLY,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_ORC,	ATT_FRIENDLY,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_ORC,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_ORC,	ATT_FRIENDLY,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_ORC, 	ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_ORC, 	ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_ORC, 	ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_ORC, 	ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_ORC,	ATT_HOSTILE, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_ORC, ATT_HOSTILE, 	GIL_Spider			);

	// ------ Friendly Orcs zu allen anderen ------
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_FRIENDLY,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_HOSTILE,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_FRIENDLY,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC, 	ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC, 	ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC, 	ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC, 	ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_FRIENDLY_ORC, ATT_HOSTILE, 	GIL_Spider			);
	
	// ------ Untote Orks zu allen anderen ------
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_FRIENDLY,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_FRIENDLY,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_FRIENDLY,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_FRIENDLY,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_FRIENDLY,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_FRIENDLY,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_FRIENDLY,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_FRIENDLY,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_FRIENDLY,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_UNDEADORC, ATT_HOSTILE, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_UNDEADORC, ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_UNDEADORC, ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_UNDEADORC, ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_HOSTILE, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_UNDEADORC, ATT_HOSTILE, 	GIL_Spider			);

	// ------ Drakonier zu allen anderen ------
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_FRIENDLY,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_FRIENDLY,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_FRIENDLY,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_FRIENDLY,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_FRIENDLY,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_FRIENDLY,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_DRACONIAN, ATT_HOSTILE, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_DRACONIAN, ATT_HOSTILE, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_DRACONIAN, ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_DRACONIAN, ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_DRACONIAN,	ATT_HOSTILE, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_DRACONIAN, ATT_HOSTILE, 	GIL_Spider			);
	
//*********************************
//		Addon
//********************************	
	
	
	// ------ Alligatoren zu allen anderen ------
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_HOSTILE,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_HOSTILE,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_HOSTILE,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_HOSTILE,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_HOSTILE,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_ALLIGATOR, ATT_FRIENDLY, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_ALLIGATOR, ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_ALLIGATOR, ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_ALLIGATOR, ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_ALLIGATOR,	ATT_HOSTILE, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_ALLIGATOR, ATT_HOSTILE, 	GIL_Spider			);
	

	
	// ------ Schlammgolem zu allen anderen ------
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_HOSTILE,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_HOSTILE,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_HOSTILE,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_HOSTILE,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_HOSTILE,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_HOSTILE,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM, 	ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM, 	ATT_FRIENDLY, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM, 	ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM, 	ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM,	ATT_HOSTILE, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_SWAMPGOLEM, ATT_HOSTILE, 	GIL_Spider			);
	
	// ------ Steinwächtern zu allen anderen ------
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN, ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN, ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN, ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN, ATT_NEUTRAL, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN,	ATT_HOSTILE, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_STONEGUARDIAN, ATT_HOSTILE, 	GIL_Spider			);
	
	// ------ Steinpuma zu allen anderen ------
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_HOSTILE,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_FRIENDLY,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_FRIENDLY,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_NEUTRAL,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_GARGOYLE, 	ATT_NEUTRAL, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_GARGOYLE, 	ATT_NEUTRAL, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_GARGOYLE, 	ATT_NEUTRAL, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_GARGOYLE, 	ATT_FRIENDLY, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_HOSTILE, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_GARGOYLE,	ATT_HOSTILE, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_GARGOYLE, ATT_HOSTILE, 	GIL_Spider			);
	
	
	//---------- Summoned Stoneguardian ----------------------------------------------------
	
	// ------ Summoned Demon zu allen anderen ------
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_NEUTRAL,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_NEUTRAL,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_NEUTRAL,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_NEUTRAL,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_HOSTILE,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian, 	ATT_HOSTILE, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian, 	ATT_HOSTILE, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian, 	ATT_HOSTILE, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian, 	ATT_HOSTILE, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_NEUTRAL, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_SUMMONEDGuardian,	ATT_NEUTRAL, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_SUMMONEDGUARDIAN, ATT_HOSTILE, 	GIL_Spider			);
	
	//----------------------- Summoned Zombie ----------------------------------------------------
	
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_NEUTRAL,	GIL_SEPERATOR_HUM			);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_DMT						);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_NEUTRAL,	GIL_MEATBUG					);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_SHEEP					);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_GOBBO					);	// Green Goblin / Black Goblin
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_GOBBO_SKELETON			);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_NEUTRAL,	GIL_SUMMONED_GOBBO_SKELETON	);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_SCAVENGER				);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_GIANT_RAT				);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_GIANT_BUG				);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_BLOODFLY				);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_WARAN					);	// Waren / Feuerwaran	
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_WOLF					);	// Wolf / Warg	
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_NEUTRAL,	GIL_SUMMONED_WOLF			);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_MINECRAWLER				);	// Minecrawler / Minecrawler Warrior
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_LURKER					);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_SKELETON				);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_NEUTRAL,	GIL_SUMMONED_SKELETON		);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_SKELETON_MAGE			);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_ZOMBIE					);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_SNAPPER					);	// Snapper / Dragon Snapper
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_SHADOWBEAST				);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_SHADOWBEAST_SKELETON	);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_HARPY					);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_STONEGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_FIREGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_ICEGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_NEUTRAL,	GIL_SUMMONED_GOLEM			);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_DEMON					);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_NEUTRAL,	GIL_SUMMONED_DEMON			);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_TROLL					);	// Troll / Schwarzer Troll
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_SWAMPSHARK				);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_DRAGON					);	// Feuerdrache / Eisdrache / Felsdrache / Sumpfdrache / Untoter Drache
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_MOLERAT					);	
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_ORC						);	// Ork-Krieger / Ork-Shamane / Ork-Elite
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC			);	
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_UNDEADORC				);	// Ork-Sklave / Ur-Shak	
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_HOSTILE,	GIL_DRACONIAN				);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie, 	ATT_HOSTILE, 	GIL_ALLIGATOR				);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie, 	ATT_HOSTILE, 	GIL_SWAMPGOLEM				);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie, 	ATT_HOSTILE, 	GIL_STONEGUARDIAN			);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie, 	ATT_HOSTILE, 	GIL_GARGOYLE				);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_NEUTRAL, 	GIL_SummonedGuardian		);
	B_SetMonsterAttitude	(GIL_SUMMONEDZombie,	ATT_NEUTRAL, 	GIL_SummonedZombie			);
	B_SetMonsterAttitude	(GIL_SUMMONEDZOMBIE, ATT_HOSTILE, 	GIL_Spider			);
	
	if (Mod_Gilde == 1)
	|| (Mod_Gilde == 2)
	|| (Mod_Gilde == 3)
	|| (Mod_Gilde == 6)
	|| (Mod_Gilde == 7)
	|| (Mod_Gilde == 8)
	{
		B_SetMonsterAttitude	(GIL_STRF, ATT_HOSTILE, 	GIL_PAL);
		B_SetMonsterAttitude	(GIL_STRF, ATT_HOSTILE, 	GIL_VLK);
		B_SetMonsterAttitude	(GIL_PAL, ATT_HOSTILE, 	GIL_STRF);
		B_SetMonsterAttitude	(GIL_VLK, ATT_HOSTILE, 	GIL_STRF);
		B_SetMonsterAttitude	(GIL_STRF, ATT_FRIENDLY, 	GIL_HARPY);
		B_SetMonsterAttitude	(GIL_HARPY, ATT_FRIENDLY, 	GIL_STRF);			
	};

	B_SetMonsterAttitude	(GIL_STRF, ATT_HOSTILE, 	GIL_SEPERATOR_HUM);
	B_SetMonsterAttitude	(GIL_SEPERATOR_HUM, ATT_HOSTILE, 	GIL_STRF);
	B_SetMonsterAttitude	(GIL_STRF, ATT_FRIENDLY, GIL_STRF);

	B_SetMonsterAttitude	(GIL_STRF, ATT_NEUTRAL, 	GIL_DMT);
	B_SetMonsterAttitude	(GIL_DMT, ATT_NEUTRAL, GIL_STRF);


	if (CurrentLevel == PATHERION_ZEN)
	{
		B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_DRAGON);
		B_SetMonsterAttitude	(GIL_DRAGON,	ATT_HOSTILE,	GIL_SEPERATOR_HUM);
		B_SetMonsterAttitude	(GIL_KDF,	ATT_NEUTRAL,	GIL_DRAGON);
		B_SetMonsterAttitude	(GIL_DRAGON,	ATT_NEUTRAL,	GIL_KDF);
	};

	if (CurrentLevel == XERESDEMO_ZEN)
	{
		B_SetMonsterAttitude	(GIL_STRF,	ATT_HOSTILE,	GIL_SEPERATOR_HUM);
		B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_STRF);
		B_SetMonsterAttitude	(GIL_STRF,	ATT_FRIENDLY,	GIL_STRF);
	};

	if (CurrentLevel == MINENTAL_ZEN)
	&& (Npc_KnowsInfo(hero, Info_Mod_Alissandro_ThorusTot))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Alissandro_BelohnungFuerEroberung))
	{
		//B_SetMonsterAttitude	(GIL_DMT,	ATT_HOSTILE,	GIL_SEPERATOR_HUM);
		//B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_DMT);
		//B_SetMonsterAttitude	(GIL_DMT,	ATT_FRIENDLY,	GIL_DMT);
	};

	if (CurrentLevel == MINENTAL_ZEN)
	{
		B_SetMonsterAttitude	(GIL_STRF,	ATT_HOSTILE,	GIL_SEPERATOR_HUM);
		B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_STRF);
		B_SetMonsterAttitude	(GIL_STRF,	ATT_FRIENDLY,	GIL_STRF);
		B_SetMonsterAttitude	(GIL_DRAGON,	ATT_HOSTILE,	GIL_SEPERATOR_HUM);
	};

	if (CurrentLevel == FLIEGENDEINSEL_ZEN)
	{
		B_SetMonsterAttitude	(GIL_STRF,	ATT_HOSTILE,	GIL_SEPERATOR_HUM);
		B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_STRF);
		B_SetMonsterAttitude	(GIL_STRF,	ATT_FRIENDLY,	GIL_DMT);
		B_SetMonsterAttitude	(GIL_DMT,	ATT_FRIENDLY,	GIL_STRF);
		B_SetMonsterAttitude	(GIL_DMT,	ATT_FRIENDLY,	GIL_DMT);
		B_SetMonsterAttitude	(GIL_STRF,	ATT_FRIENDLY,	GIL_STRF);
		B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_FRIENDLY,	GIL_STRF);
		B_SetMonsterAttitude	(GIL_STRF,	ATT_FRIENDLY,	GIL_STONEGOLEM);
		B_SetMonsterAttitude	(GIL_STONEGOLEM,	ATT_FRIENDLY,	GIL_DMT);
		B_SetMonsterAttitude	(GIL_DMT,	ATT_FRIENDLY,	GIL_STONEGOLEM);
		B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_FRIENDLY,	GIL_SEPERATOR_HUM);
		B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_FRIENDLY,	GIL_MINECRAWLER);
	};

	if (Mod_AL_Oric > 0)
	&& (Mod_AL_Oric < 7)
	&& ((CurrentLevel == OLDMINE_ZEN)
	|| (CurrentLevel == MINENTAL_ZEN))
	{
		B_SetMonsterAttitude	(GIL_OUT,	ATT_FRIENDLY,	GIL_PAL);
		B_SetMonsterAttitude	(GIL_PAL,	ATT_FRIENDLY,	GIL_OUT);
		B_SetMonsterAttitude	(GIL_PAL,	ATT_HOSTILE,	GIL_KDF);
		B_SetMonsterAttitude	(GIL_OUT,	ATT_HOSTILE,	GIL_KDF);
		B_SetMonsterAttitude	(GIL_KDF,	ATT_HOSTILE,	GIL_OUT);
		B_SetMonsterAttitude	(GIL_KDF,	ATT_HOSTILE,	GIL_PAL);
	};

	if (CurrentLevel == OLDMINE_ZEN)
	{
		B_SetMonsterAttitude	(GIL_STRF,	ATT_NEUTRAL,	GIL_FRIENDLY_ORC);
		B_SetMonsterAttitude	(GIL_FRIENDLY_ORC,	ATT_NEUTRAL,	GIL_STRF);
	};

	if (CurrentLevel == FREEMINE_ZEN)
	{
		B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_FRIENDLY,	GIL_MINECRAWLER);
		B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_FRIENDLY,	GIL_ZOMBIE);
		B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_FRIENDLY,	GIL_GOBBO);
		B_SetMonsterAttitude	(GIL_MINECRAWLER,	ATT_FRIENDLY,	GIL_GOBBO);
		B_SetMonsterAttitude	(GIL_GOBBO,	ATT_FRIENDLY,	GIL_MINECRAWLER);
		B_SetMonsterAttitude	(GIL_GOBBO,	ATT_FRIENDLY,	GIL_ZOMBIE);
	};

	if (CurrentLevel == ORCGRAVEYARD_ZEN)
	{
		B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_FRIENDLY,	GIL_ORC);
		B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_FRIENDLY,	GIL_SKELETON);
		B_SetMonsterAttitude	(GIL_ZOMBIE,	ATT_FRIENDLY,	GIL_UNDEADORC);
		B_SetMonsterAttitude	(GIL_ORC,	ATT_FRIENDLY,	GIL_ZOMBIE);
		B_SetMonsterAttitude	(GIL_ORC,	ATT_FRIENDLY,	GIL_SKELETON);
		B_SetMonsterAttitude	(GIL_ORC,	ATT_FRIENDLY,	GIL_UNDEADORC);
		B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_FRIENDLY,	GIL_ZOMBIE);
		B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_FRIENDLY,	GIL_SKELETON);
		B_SetMonsterAttitude	(GIL_UNDEADORC,	ATT_FRIENDLY,	GIL_ORC);
	};

	if (CurrentLevel == EISGEBIET_ZEN)
	{
		B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_FRIENDLY,	GIL_SEPERATOR_HUM);
		B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_FRIENDLY,	GIL_BLOODFLY);
		B_SetMonsterAttitude	(GIL_BLOODFLY,	ATT_HOSTILE,	GIL_DEMON);
		B_SetMonsterAttitude	(GIL_DEMON,	ATT_HOSTILE,	GIL_BLOODFLY);
	};

	if (CurrentLevel == HALLUZINATION_ZEN)
	{
		B_SetMonsterAttitude	(GIL_MOLERAT,	ATT_FRIENDLY,	GIL_SEPERATOR_HUM);
	};

	if (CurrentLevel == DRAGONISLAND_ZEN)
	{
		B_SetMonsterAttitude	(GIL_DRAGON,	ATT_HOSTILE,	GIL_SEPERATOR_HUM);
		B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_DRAGON);
	};

	if (CurrentLevel == NEWWORLD_ZEN)
	&& (Mod_NL_HasKamm >= 4)
	{
		B_SetMonsterAttitude	(GIL_SEPERATOR_HUM,	ATT_HOSTILE,	GIL_DRAGON);
		B_SetMonsterAttitude	(GIL_DRAGON,	ATT_HOSTILE,	GIL_SEPERATOR_HUM);
	};
}; 
