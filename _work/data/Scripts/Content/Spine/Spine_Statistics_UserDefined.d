// this function can be called in B_Kapitelwechsel to determine all basic player stats of the original game
// feel free to add own stuff or remove unused things
func void Spine_UpdateChapterStatistics(var C_NPC player, var int chapter) {
	// General statistics
	// Level
	Spine_UpdateStatistic(chapter, Mod_Gilde, "Level", player.level);
	// Strength
	Spine_UpdateStatistic(chapter, Mod_Gilde, "Strength", player.attribute[ATR_STRENGTH]);
	// Dexterity
	Spine_UpdateStatistic(chapter, Mod_Gilde, "Dexterity", player.attribute[ATR_DEXTERITY]);
	// Mana
	Spine_UpdateStatistic(chapter, Mod_Gilde, "Mana", player.attribute[ATR_MANA_MAX]);
	// Hitpoints
	Spine_UpdateStatistic(chapter, Mod_Gilde, "Hitpoints", player.attribute[ATR_HITPOINTS_MAX]);
	// Circle
	Spine_UpdateStatistic(chapter, Mod_Gilde, "Circle", Npc_GetTalentSkill(player, NPC_TALENT_MAGE));
	// Fast Learning
	Spine_UpdateStatistic(chapter, Mod_Gilde, "FastLearning", SchnellesLernen_Perk);
	// HP Regeneration
	Spine_UpdateStatistic(chapter, Mod_Gilde, "HPRegeneration", HP_Perk);
	// Mana Regneration
	Spine_UpdateStatistic(chapter, Mod_Gilde, "ManaRegneration", Mana_Perk);
	// Trading
	Spine_UpdateStatistic(chapter, Mod_Gilde, "Trading", Mod_Verhandlungsgeschick);
	// Digging
	Spine_UpdateStatistic(chapter, Mod_Gilde, "Digging", ErzHackChance);
	// Poison
	Spine_UpdateStatistic(chapter, Mod_Gilde, "Poison", Gift);
	// Illness
	Spine_UpdateStatistic(chapter, Mod_Gilde, "Illness", Krankheit);
	// Learnpoints
	Spine_UpdateStatistic(chapter, Mod_Gilde, "Learnpoints", player.lp);
	
	// Protection
	Spine_UpdateStatistic(chapter, Mod_Gilde, "ProtectionEdge", player.protection[PROT_EDGE] / 1000);
	Spine_UpdateStatistic(chapter, Mod_Gilde, "ProtectionBlunt", player.protection[PROT_BLUNT] / 1000);
	Spine_UpdateStatistic(chapter, Mod_Gilde, "ProtectionPoint", player.protection[PROT_POINT] / 1000);
	Spine_UpdateStatistic(chapter, Mod_Gilde, "ProtectionMagic", player.protection[PROT_MAGIC]);
	Spine_UpdateStatistic(chapter, Mod_Gilde, "ProtectionFire", player.protection[PROT_FIRE]);
	
	
	// Fighting Skills
	// 1H
	Spine_UpdateStatistic(chapter, Mod_Gilde, "1H", player.hitChance[NPC_TALENT_1H]);
	// 2H
	Spine_UpdateStatistic(chapter, Mod_Gilde, "2H", player.hitChance[NPC_TALENT_2H]);
	// Bow
	Spine_UpdateStatistic(chapter, Mod_Gilde, "Bow", player.hitChance[NPC_TALENT_BOW]);
	// Crossbow
	Spine_UpdateStatistic(chapter, Mod_Gilde, "Crossbow", player.hitChance[NPC_TALENT_CROSSBOW]);
	// Defense Break
	Spine_UpdateStatistic(chapter, Mod_Gilde, "DefenseBreak", DefenseBreak_Perk);
	// Twohand as Onehand
	Spine_UpdateStatistic(chapter, Mod_Gilde, "TwohandAsOnehand", ZweihandAlsEinhand_Perk);
	// Stable
	Spine_UpdateStatistic(chapter, Mod_Gilde, "Stable", Standfest_Perk);
	
	// Thief Skills
	// Sneak
	Spine_UpdateStatistic(chapter, Mod_Gilde, "Sneak", Npc_GetTalentSkill(player, NPC_TALENT_SNEAK));
	// Acrobat
	Spine_UpdateStatistic(chapter, Mod_Gilde, "Acrobat", Npc_GetTalentSkill(player, NPC_TALENT_ACROBAT));
	// Pickpocket
	Spine_UpdateStatistic(chapter, Mod_Gilde, "Pickpocket", Npc_GetTalentSkill(player, NPC_TALENT_PICKPOCKET));
	// Picklocking
	Spine_UpdateStatistic(chapter, Mod_Gilde, "Picklock", Npc_GetTalentSkill(player, NPC_TALENT_PICKLOCK));
	// Skilled Fingers
	Spine_UpdateStatistic(chapter, Mod_Gilde, "SkilledFingers", Dietrich_Perk);
	// Knockout
	Spine_UpdateStatistic(chapter, Mod_Gilde, "Knockout", Knockout_Perk);
	// Walk Silent
	Spine_UpdateStatistic(chapter, Mod_Gilde, "WalkSilent", LeisenLaufen_Perk);
	
	// Wisp Skills
	// Ranged Weapon
	Spine_UpdateStatistic(chapter, Mod_Gilde, "WispRangedWeapon", PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF]);
	// None
	Spine_UpdateStatistic(chapter, Mod_Gilde, "WispNone", PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE]);
	// Rune
	Spine_UpdateStatistic(chapter, Mod_Gilde, "WispRune", PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE]);
	// Magic
	Spine_UpdateStatistic(chapter, Mod_Gilde, "WispMagic", PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC]);
	// Food
	Spine_UpdateStatistic(chapter, Mod_Gilde, "WispFood", PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD]);
	// Potions
	Spine_UpdateStatistic(chapter, Mod_Gilde, "WispPotions", PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS]);
	
	// AnimalTrophies
	// Teeth
	Spine_UpdateStatistic(chapter, Mod_Gilde, "Teeth", PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth]);
	// Blood
	Spine_UpdateStatistic(chapter, Mod_Gilde, "Blood", PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Blood]);
	// Claws
	Spine_UpdateStatistic(chapter, Mod_Gilde, "Claws", PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws]);
	// Troll Teeth
	Spine_UpdateStatistic(chapter, Mod_Gilde, "TrollTeeth", PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TrollTeeth]);
	// Swampshark Teeth
	Spine_UpdateStatistic(chapter, Mod_Gilde, "SwampSharkTeeth", PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SwampSharkTeeth]);
	// Alligator Claws
	Spine_UpdateStatistic(chapter, Mod_Gilde, "AlligatorClaws", PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_AlligatorClaws]);
	// Fur
	Spine_UpdateStatistic(chapter, Mod_Gilde, "Fur", PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur]);
	// Reptile Skin
	Spine_UpdateStatistic(chapter, Mod_Gilde, "ReptileSkin", PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin]);
	// Hearth
	Spine_UpdateStatistic(chapter, Mod_Gilde, "Heart", PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart]);
	// Shadow Horn
	Spine_UpdateStatistic(chapter, Mod_Gilde, "ShadowHorn", PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn]);
	// Fire Tongue
	Spine_UpdateStatistic(chapter, Mod_Gilde, "FireTongue", PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue]);
	// Bloodfly Wing
	Spine_UpdateStatistic(chapter, Mod_Gilde, "BFWing", PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing]);
	// Bloodfly Sting
	Spine_UpdateStatistic(chapter, Mod_Gilde, "BFSting", PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting]);
	// Mandibles
	Spine_UpdateStatistic(chapter, Mod_Gilde, "Mandibles", PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles]);
	// Crawler Plate
	Spine_UpdateStatistic(chapter, Mod_Gilde, "CrawlerPlate", PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate]);
	// Dragonsnapper Horn
	Spine_UpdateStatistic(chapter, Mod_Gilde, "DrgSnapperHorn", PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn]);
	// Dragon Scale
	Spine_UpdateStatistic(chapter, Mod_Gilde, "DragonScale", PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale]);
	// Dragon Blood
	Spine_UpdateStatistic(chapter, Mod_Gilde, "DragonBlood", PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood]);
	
	// Alchemy
	// Health 01
	Spine_UpdateStatistic(chapter, Mod_Gilde, "AlchemyHealth01", PLAYER_TALENT_ALCHEMY[POTION_Health_01]);
	// Health 02
	Spine_UpdateStatistic(chapter, Mod_Gilde, "AlchemyHealth02", PLAYER_TALENT_ALCHEMY[POTION_Health_02]);
	// Health 03
	Spine_UpdateStatistic(chapter, Mod_Gilde, "AlchemyHealth03", PLAYER_TALENT_ALCHEMY[POTION_Health_03]);
	// Health 05
	Spine_UpdateStatistic(chapter, Mod_Gilde, "AlchemyHealth05", PLAYER_TALENT_ALCHEMY[POTION_Health_05]);
	// Health 06
	Spine_UpdateStatistic(chapter, Mod_Gilde, "AlchemyHealth06", PLAYER_TALENT_ALCHEMY[POTION_Health_06]);
	// Health 07
	Spine_UpdateStatistic(chapter, Mod_Gilde, "AlchemyHealth07", PLAYER_TALENT_ALCHEMY[POTION_Health_07]);
	// Mana 01
	Spine_UpdateStatistic(chapter, Mod_Gilde, "AlchemyMana01", PLAYER_TALENT_ALCHEMY[POTION_Mana_01]);
	// Mana 02
	Spine_UpdateStatistic(chapter, Mod_Gilde, "AlchemyMana02", PLAYER_TALENT_ALCHEMY[POTION_Mana_02]);
	// Mana 03
	Spine_UpdateStatistic(chapter, Mod_Gilde, "AlchemyMana03", PLAYER_TALENT_ALCHEMY[POTION_Mana_03]);
	// Mana 05
	Spine_UpdateStatistic(chapter, Mod_Gilde, "AlchemyMana05", PLAYER_TALENT_ALCHEMY[POTION_Mana_05]);
	// Mana 06
	Spine_UpdateStatistic(chapter, Mod_Gilde, "AlchemyMana06", PLAYER_TALENT_ALCHEMY[POTION_Mana_06]);
	// Speed
	Spine_UpdateStatistic(chapter, Mod_Gilde, "AlchemySpeed", PLAYER_TALENT_ALCHEMY[POTION_Speed]);
	// Perm Str
	Spine_UpdateStatistic(chapter, Mod_Gilde, "AlchemyPermStr", PLAYER_TALENT_ALCHEMY[POTION_Perm_STR]);
	// Perm Dex
	Spine_UpdateStatistic(chapter, Mod_Gilde, "AlchemyPermDex", PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX]);
	// Perm Mana
	Spine_UpdateStatistic(chapter, Mod_Gilde, "AlchemyPermMana", PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana]);
	// Perm Health
	Spine_UpdateStatistic(chapter, Mod_Gilde, "AlchemyPermHealth", PLAYER_TALENT_ALCHEMY[POTION_Perm_Health]);
	// Adanos Wohltat
	Spine_UpdateStatistic(chapter, Mod_Gilde, "AlchemyAdanosWohltat", PLAYER_TALENT_ALCHEMY[POTION_AdanosWohltat]);
	// Poison Neutralizer
	Spine_UpdateStatistic(chapter, Mod_Gilde, "AlchemyPoisonNeutralizer", PLAYER_TALENT_ALCHEMY[POTION_GiftNeutralisierer]);
	// Poison
	Spine_UpdateStatistic(chapter, Mod_Gilde, "AlchemyPoison", PLAYER_TALENT_ALCHEMY[POTION_Gift]);
	// Anti Poison
	Spine_UpdateStatistic(chapter, Mod_Gilde, "AlchemyAntiPoison", PLAYER_TALENT_ALCHEMY[POTION_Gegengift]);
	// Genesung
	Spine_UpdateStatistic(chapter, Mod_Gilde, "AlchemyGenesung", PLAYER_TALENT_ALCHEMY[POTION_Genesung]);
	// Regeneration
	Spine_UpdateStatistic(chapter, Mod_Gilde, "AlchemyRegneration", PLAYER_TALENT_ALCHEMY[POTION_Regeneration]);
	
	// Languages
	// Foreign 1
	Spine_UpdateStatistic(chapter, Mod_Gilde, "LanguageForeign1", PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1]);
	// Foreign 2
	Spine_UpdateStatistic(chapter, Mod_Gilde, "LanguageForeign2", PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2]);
	// Foreing 3
	Spine_UpdateStatistic(chapter, Mod_Gilde, "LanguageForeign3", PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3]);
	// Orc
	Spine_UpdateStatistic(chapter, Mod_Gilde, "LanguageOrc", PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_Orc]);
	// Draconian
	Spine_UpdateStatistic(chapter, Mod_Gilde, "LanguageOrc", PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_Draconian]);
	// Animal
	Spine_UpdateStatistic(chapter, Mod_Gilde, "LanguageAnimal", PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_Tier]);
	
	// Scrolls
	Spine_UpdateStatistic(chapter, Mod_Gilde, "Scrolls", Npc_GetTalentSkill(player, NPC_TALENT_SCROLLS));
	
	// Smith
	// Sharpen
	Spine_UpdateStatistic(chapter, Mod_Gilde, "SmithSharpen", Schaerfen_Perk);
	// Arrows
	Spine_UpdateStatistic(chapter, Mod_Gilde, "SmithArrows", Mod_PfeileSpitzen);
	// Common
	Spine_UpdateStatistic(chapter, Mod_Gilde, "SmithCommon", PLAYER_TALENT_SMITH[WEAPON_Common]);
	// 1H Special 01
	Spine_UpdateStatistic(chapter, Mod_Gilde, "Smith1HSpecial01", PLAYER_TALENT_SMITH[WEAPON_1H_Special_01]);
	// 2H Special 01
	Spine_UpdateStatistic(chapter, Mod_Gilde, "Smith2HSpecial01", PLAYER_TALENT_SMITH[WEAPON_2H_Special_01]);
	// 1H Special 02
	Spine_UpdateStatistic(chapter, Mod_Gilde, "Smith1HSpecial02", PLAYER_TALENT_SMITH[WEAPON_1H_Special_02]);
	// 2H Special 02
	Spine_UpdateStatistic(chapter, Mod_Gilde, "Smith2HSpecial02", PLAYER_TALENT_SMITH[WEAPON_2H_Special_02]);
	// 1H Special 03
	Spine_UpdateStatistic(chapter, Mod_Gilde, "Smith1HSpecial03", PLAYER_TALENT_SMITH[WEAPON_1H_Special_03]);
	// 2H Special 03
	Spine_UpdateStatistic(chapter, Mod_Gilde, "Smith2HSpecial03", PLAYER_TALENT_SMITH[WEAPON_2H_Special_03]);
	// 1H Special 04
	Spine_UpdateStatistic(chapter, Mod_Gilde, "Smith1HSpecial04", PLAYER_TALENT_SMITH[WEAPON_1H_Special_04]);
	// 1H Special 04 Dex
	Spine_UpdateStatistic(chapter, Mod_Gilde, "Smith1HSpecial04Dex", PLAYER_TALENT_SMITH[WEAPON_1H_Special_04_Dex]);
	// 2H Special 04
	Spine_UpdateStatistic(chapter, Mod_Gilde, "Smith2HSpecial04", PLAYER_TALENT_SMITH[WEAPON_2H_Special_04]);
	// 1H Harad 01
	Spine_UpdateStatistic(chapter, Mod_Gilde, "Smith1HHarad01", PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01]);
	// 1H Harad 02
	Spine_UpdateStatistic(chapter, Mod_Gilde, "Smith1HHarad02", PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02]);
	// 1H Harad 03
	Spine_UpdateStatistic(chapter, Mod_Gilde, "Smith1HHarad03", PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03]);
	// 1H Harad 04
	Spine_UpdateStatistic(chapter, Mod_Gilde, "Smith1HHarad04", PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04]);
	
	// Runes
	// PalLight
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RunePalLight", PLAYER_TALENT_RUNES[SPL_PalLight]);
	// PalLightHeal
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RunePalLightHeal", PLAYER_TALENT_RUNES[SPL_PalLightHeal]);
	// PalHolyBolt
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RunePalHolyBolt", PLAYER_TALENT_RUNES[SPL_PalHolyBolt]);
	// PalMediumHeal
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RunePalMediumHeal", PLAYER_TALENT_RUNES[SPL_PalMediumHeal]);
	// PalRepelEvil
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RunePalRepelEvil", PLAYER_TALENT_RUNES[SPL_PalRepelEvil]);
	// Summon Goblin Warrior
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneSummonGoblinWarrior", PLAYER_TALENT_RUNES[SPL_SummonGoblinKrieger]);
	// Summon Ice Goblin
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneSummonIceGoblin", PLAYER_TALENT_RUNES[SPL_SummonEisgoblin]);
	// PalFullHeal
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RunePalFullHeal", PLAYER_TALENT_RUNES[SPL_PalFullHeal]);
	// PalDestroyEvil
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RunePalDestroyEvil", PLAYER_TALENT_RUNES[SPL_PalDestroyEvil]);
	// Light
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneLight", PLAYER_TALENT_RUNES[SPL_LIGHT]);
	// Firebolt
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneFirebolt", PLAYER_TALENT_RUNES[SPL_Firebolt]);
	// Icebolt
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneIcebolt", PLAYER_TALENT_RUNES[SPL_Icebolt]);
	// Light Heal
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneLightHeal", PLAYER_TALENT_RUNES[SPL_LightHeal]);
	// Summon Goblin Skeleton
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneSummonGoblinSkeleton", PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton]);
	// Iceball
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneIceball", PLAYER_TALENT_RUNES[SPL_InstantIceball]);
	// Instant Fireball
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneInstantFireball", PLAYER_TALENT_RUNES[SPL_InstantFireball]);
	// Zap
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneZap", PLAYER_TALENT_RUNES[SPL_Zap]);
	// Summon Wolf
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneSummonWolf", PLAYER_TALENT_RUNES[SPL_SummonWolf]);
	// Windfist
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneWindfist", PLAYER_TALENT_RUNES[SPL_WINDFIST]);
	// Sleep
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneSleep", PLAYER_TALENT_RUNES[SPL_Sleep]);
	// Medium Heal
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneMediumHeal", PLAYER_TALENT_RUNES[SPL_MediumHeal]);
	// Lightning Flash
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneLightningFlash", PLAYER_TALENT_RUNES[SPL_LightningFlash]);
	// Charge Fireball
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneChargeFireball", PLAYER_TALENT_RUNES[SPL_ChargeFireball]);
	// Summon Skeleton
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneSummonSkeleton", PLAYER_TALENT_RUNES[SPL_SummonSkeleton]);
	// Fear
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneFear", PLAYER_TALENT_RUNES[SPL_Fear]);
	// Icecube
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneIcecube", PLAYER_TALENT_RUNES[SPL_IceCube]);
	// Charge Zap
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneChargeZap", PLAYER_TALENT_RUNES[SPL_ChargeZap]);
	// Summon Golem
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneSummonGolem", PLAYER_TALENT_RUNES[SPL_SummonGolem]);
	// Summon Fire Golem
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneSummonFireGolem", PLAYER_TALENT_RUNES[SPL_SummonFireGolem]);
	// Summon Ice Golem
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneSummonIceGolem", PLAYER_TALENT_RUNES[SPL_SummonIceGolem]);
	// Destroy Undead
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneDestroyUndead", PLAYER_TALENT_RUNES[SPL_DestroyUndead]);
	// Pyrokinesis
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RunePyrokinesis", PLAYER_TALENT_RUNES[SPL_Pyrokinesis]);
	// Firestorm
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneFirestorm", PLAYER_TALENT_RUNES[SPL_Firestorm]);
	// Pyrokensis G1
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RunePyrokensisG1", PLAYER_TALENT_RUNES[SPL_Pyrokinesis_g1]);
	// Icewave
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneIcewave", PLAYER_TALENT_RUNES[SPL_IceWave]);
	// Summon Demon
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneSummonDemon", PLAYER_TALENT_RUNES[SPL_SummonDemon]);
	// Full Heal
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneFullHeal", PLAYER_TALENT_RUNES[SPL_FullHeal]);
	// Firerain
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneFirerain", PLAYER_TALENT_RUNES[SPL_Firerain]);
	// Breath of Death
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneBreathOfDeath", PLAYER_TALENT_RUNES[SPL_BreathOfDeath]);
	// Mass Death
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneMassDeath", PLAYER_TALENT_RUNES[SPL_MassDeath]);
	// Army of Darkness
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneArmyOfDarkness", PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness]);
	// Ice Rain
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneIceRain", PLAYER_TALENT_RUNES[SPL_Icerain]);
	// Summon Dragon
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneSummonDragon", PLAYER_TALENT_RUNES[SPL_SummonDragon]);
	// Shrink
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneShrink", PLAYER_TALENT_RUNES[SPL_Shrink]);
	// Whirlwind
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneWhirlwind", PLAYER_TALENT_RUNES[SPL_Whirlwind]);
	// Waterfist
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneWaterfist", PLAYER_TALENT_RUNES[SPL_WaterFist]);
	// Icelance
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneIcelance", PLAYER_TALENT_RUNES[SPL_IceLance]);
	// Geyser
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneGeyser", PLAYER_TALENT_RUNES[SPL_Geyser]);
	// Thunderstorm
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneThunderstorm", PLAYER_TALENT_RUNES[SPL_Thunderstorm]);
	// Suck Energy
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneSuckEnergy", PLAYER_TALENT_RUNES[SPL_SuckEnergy]);
	// Summon Guardian
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneSummonGuardian", PLAYER_TALENT_RUNES[SPL_SummonGuardian]);
	// Summon Zombie
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneSummonZombie", PLAYER_TALENT_RUNES[SPL_SummonZombie]);
	// Energy Ball
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneEnergyBall", PLAYER_TALENT_RUNES[SPL_EnergyBall]);
	// Skull
	Spine_UpdateStatistic(chapter, Mod_Gilde, "RuneSkull", PLAYER_TALENT_RUNES[SPL_Skull]);
	
	// Inventory statistics
	// Gold
	Spine_UpdateStatistic(chapter, Mod_Gilde, "Gold", Npc_HasItems(player, ItMi_Gold));
	// Inventory Value
	Spine_UpdateStatistic(chapter, Mod_Gilde, "InventoryValue", HeroInventarWert());
};
