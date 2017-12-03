// this function can be called in B_Kapitelwechsel to determine all basic player stats of the original game
// feel free to add own stuff or remove unused things
func void Spine_UpdateChapterStatistics(var C_NPC player, var int chapter) {
	// General statistics
	// Level
	Spine_UpdateStatistic(chapter, player.guild, "Level", player.level);
	// Strength
	Spine_UpdateStatistic(chapter, player.guild, "Strength", player.attribute[ATR_STRENGTH]);
	// Dexterity
	Spine_UpdateStatistic(chapter, player.guild, "Dexterity", player.attribute[ATR_DEXTERITY]);
	// Mana
	Spine_UpdateStatistic(chapter, player.guild, "Mana", player.attribute[ATR_MANA_MAX]);
	// Hitpoints
	Spine_UpdateStatistic(chapter, player.guild, "Hitpoints", player.attribute[ATR_HITPOINTS_MAX]);
	// Circle
	Spine_UpdateStatistic(chapter, player.guild, "Circle", Npc_GetTalentSkill(player, NPC_TALENT_MAGE));
	// Fast Learning
	Spine_UpdateStatistic(chapter, player.guild, "FastLearning", SchnellesLernen_Perk);
	// HP Regeneration
	Spine_UpdateStatistic(chapter, player.guild, "HPRegeneration", HP_Perk);
	// Mana Regneration
	Spine_UpdateStatistic(chapter, player.guild, "ManaRegneration", Mana_Perk);
	// Trading
	Spine_UpdateStatistic(chapter, player.guild, "Trading", Mod_Verhandlungsgeschick);
	// Digging
	Spine_UpdateStatistic(chapter, player.guild, "Digging", ErzHackChance);
	// Poison
	Spine_UpdateStatistic(chapter, player.guild, "Poison", Gift);
	// Illness
	Spine_UpdateStatistic(chapter, player.guild, "Illness", Krankheit);
	// Learnpoints
	Spine_UpdateStatistic(chapter, player.guild, "Learnpoints", player.lp);
	
	// Protection
	Spine_UpdateStatistic(chapter, player.guild, "ProtectionEdge", player.protection[PROT_EDGE] / 1000);
	Spine_UpdateStatistic(chapter, player.guild, "ProtectionBlunt", player.protection[PROT_BLUNT] / 1000);
	Spine_UpdateStatistic(chapter, player.guild, "ProtectionPoint", player.protection[PROT_POINT] / 1000);
	Spine_UpdateStatistic(chapter, player.guild, "ProtectionMagic", player.protection[PROT_MAGIC]);
	Spine_UpdateStatistic(chapter, player.guild, "ProtectionFire", player.protection[PROT_FIRE]);
	
	
	// Fighting Skills
	// 1H
	Spine_UpdateStatistic(chapter, player.guild, "1H", player.hitChance[NPC_TALENT_1H]);
	// 2H
	Spine_UpdateStatistic(chapter, player.guild, "2H", player.hitChance[NPC_TALENT_2H]);
	// Bow
	Spine_UpdateStatistic(chapter, player.guild, "Bow", player.hitChance[NPC_TALENT_BOW]);
	// Crossbow
	Spine_UpdateStatistic(chapter, player.guild, "Crossbow", player.hitChance[NPC_TALENT_CROSSBOW]);
	// Defense Break
	Spine_UpdateStatistic(chapter, player.guild, "DefenseBreak", DefenseBreak_Perk);
	// Twohand as Onehand
	Spine_UpdateStatistic(chapter, player.guild, "TwohandAsOnehand", ZweihandAlsEinhand_Perk);
	// Stable
	Spine_UpdateStatistic(chapter, player.guild, "Stable", Standfest_Perk);
	
	// Thief Skills
	// Sneak
	Spine_UpdateStatistic(chapter, player.guild, "Sneak", Npc_GetTalentSkill(player, NPC_TALENT_SNEAK));
	// Acrobat
	Spine_UpdateStatistic(chapter, player.guild, "Acrobat", Npc_GetTalentSkill(player, NPC_TALENT_ACROBAT));
	// Pickpocket
	Spine_UpdateStatistic(chapter, player.guild, "Pickpocket", Npc_GetTalentSkill(player, NPC_TALENT_PICKPOCKET));
	// Picklocking
	Spine_UpdateStatistic(chapter, player.guild, "Picklock", Npc_GetTalentSkill(player, NPC_TALENT_PICKLOCK));
	// Skilled Fingers
	Spine_UpdateStatistic(chapter, player.guild, "SkilledFingers", Dietrich_Perk);
	// Knockout
	Spine_UpdateStatistic(chapter, player.guild, "Knockout", Knockout_Perk);
	// Walk Silent
	Spine_UpdateStatistic(chapter, player.guild, "WalkSilent", LeisenLaufen_Perk);
	
	// Wisp Skills
	// Ranged Weapon
	Spine_UpdateStatistic(chapter, player.guild, "WispRangedWeapon", PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF]);
	// None
	Spine_UpdateStatistic(chapter, player.guild, "WispNone", PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE]);
	// Rune
	Spine_UpdateStatistic(chapter, player.guild, "WispRune", PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE]);
	// Magic
	Spine_UpdateStatistic(chapter, player.guild, "WispMagic", PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC]);
	// Food
	Spine_UpdateStatistic(chapter, player.guild, "WispFood", PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD]);
	// Potions
	Spine_UpdateStatistic(chapter, player.guild, "WispPotions", PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS]);
	
	// AnimalTrophies
	// Teeth
	Spine_UpdateStatistic(chapter, player.guild, "Teeth", PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth]);
	// Blood
	Spine_UpdateStatistic(chapter, player.guild, "Blood", PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Blood]);
	// Claws
	Spine_UpdateStatistic(chapter, player.guild, "Claws", PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws]);
	// Troll Teeth
	Spine_UpdateStatistic(chapter, player.guild, "TrollTeeth", PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TrollTeeth]);
	// Swampshark Teeth
	Spine_UpdateStatistic(chapter, player.guild, "SwampSharkTeeth", PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SwampSharkTeeth]);
	// Alligator Claws
	Spine_UpdateStatistic(chapter, player.guild, "AlligatorClaws", PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_AlligatorClaws]);
	// Fur
	Spine_UpdateStatistic(chapter, player.guild, "Fur", PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur]);
	// Reptile Skin
	Spine_UpdateStatistic(chapter, player.guild, "ReptileSkin", PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin]);
	// Hearth
	Spine_UpdateStatistic(chapter, player.guild, "Heart", PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart]);
	// Shadow Horn
	Spine_UpdateStatistic(chapter, player.guild, "ShadowHorn", PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn]);
	// Fire Tongue
	Spine_UpdateStatistic(chapter, player.guild, "FireTongue", PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue]);
	// Bloodfly Wing
	Spine_UpdateStatistic(chapter, player.guild, "BFWing", PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing]);
	// Bloodfly Sting
	Spine_UpdateStatistic(chapter, player.guild, "BFSting", PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting]);
	// Mandibles
	Spine_UpdateStatistic(chapter, player.guild, "Mandibles", PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles]);
	// Crawler Plate
	Spine_UpdateStatistic(chapter, player.guild, "CrawlerPlate", PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate]);
	// Dragonsnapper Horn
	Spine_UpdateStatistic(chapter, player.guild, "DrgSnapperHorn", PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn]);
	// Dragon Scale
	Spine_UpdateStatistic(chapter, player.guild, "DragonScale", PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale]);
	// Dragon Blood
	Spine_UpdateStatistic(chapter, player.guild, "DragonBlood", PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood]);
	
	// Alchemy
	// Health 01
	Spine_UpdateStatistic(chapter, player.guild, "AlchemyHealth01", PLAYER_TALENT_ALCHEMY[POTION_Health_01]);
	// Health 02
	Spine_UpdateStatistic(chapter, player.guild, "AlchemyHealth02", PLAYER_TALENT_ALCHEMY[POTION_Health_02]);
	// Health 03
	Spine_UpdateStatistic(chapter, player.guild, "AlchemyHealth03", PLAYER_TALENT_ALCHEMY[POTION_Health_03]);
	// Health 05
	Spine_UpdateStatistic(chapter, player.guild, "AlchemyHealth05", PLAYER_TALENT_ALCHEMY[POTION_Health_05]);
	// Health 06
	Spine_UpdateStatistic(chapter, player.guild, "AlchemyHealth06", PLAYER_TALENT_ALCHEMY[POTION_Health_06]);
	// Health 07
	Spine_UpdateStatistic(chapter, player.guild, "AlchemyHealth07", PLAYER_TALENT_ALCHEMY[POTION_Health_07]);
	// Mana 01
	Spine_UpdateStatistic(chapter, player.guild, "AlchemyMana01", PLAYER_TALENT_ALCHEMY[POTION_Mana_01]);
	// Mana 02
	Spine_UpdateStatistic(chapter, player.guild, "AlchemyMana02", PLAYER_TALENT_ALCHEMY[POTION_Mana_02]);
	// Mana 03
	Spine_UpdateStatistic(chapter, player.guild, "AlchemyMana03", PLAYER_TALENT_ALCHEMY[POTION_Mana_03]);
	// Mana 05
	Spine_UpdateStatistic(chapter, player.guild, "AlchemyMana05", PLAYER_TALENT_ALCHEMY[POTION_Mana_05]);
	// Mana 06
	Spine_UpdateStatistic(chapter, player.guild, "AlchemyMana06", PLAYER_TALENT_ALCHEMY[POTION_Mana_06]);
	// Speed
	Spine_UpdateStatistic(chapter, player.guild, "AlchemySpeed", PLAYER_TALENT_ALCHEMY[POTION_Speed]);
	// Perm Str
	Spine_UpdateStatistic(chapter, player.guild, "AlchemyPermStr", PLAYER_TALENT_ALCHEMY[POTION_Perm_STR]);
	// Perm Dex
	Spine_UpdateStatistic(chapter, player.guild, "AlchemyPermDex", PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX]);
	// Perm Mana
	Spine_UpdateStatistic(chapter, player.guild, "AlchemyPermMana", PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana]);
	// Perm Health
	Spine_UpdateStatistic(chapter, player.guild, "AlchemyPermHealth", PLAYER_TALENT_ALCHEMY[POTION_Perm_Health]);
	// Adanos Wohltat
	Spine_UpdateStatistic(chapter, player.guild, "AlchemyAdanosWohltat", PLAYER_TALENT_ALCHEMY[POTION_AdanosWohltat]);
	// Poison Neutralizer
	Spine_UpdateStatistic(chapter, player.guild, "AlchemyPoisonNeutralizer", PLAYER_TALENT_ALCHEMY[POTION_GiftNeutralisierer]);
	// Poison
	Spine_UpdateStatistic(chapter, player.guild, "AlchemyPoison", PLAYER_TALENT_ALCHEMY[POTION_Gift]);
	// Anti Poison
	Spine_UpdateStatistic(chapter, player.guild, "AlchemyAntiPoison", PLAYER_TALENT_ALCHEMY[POTION_Gegengift]);
	// Genesung
	Spine_UpdateStatistic(chapter, player.guild, "AlchemyGenesung", PLAYER_TALENT_ALCHEMY[POTION_Genesung]);
	// Regeneration
	Spine_UpdateStatistic(chapter, player.guild, "AlchemyRegneration", PLAYER_TALENT_ALCHEMY[POTION_Regeneration]);
	
	// Languages
	// Foreign 1
	Spine_UpdateStatistic(chapter, player.guild, "LanguageForeign1", PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1]);
	// Foreign 2
	Spine_UpdateStatistic(chapter, player.guild, "LanguageForeign2", PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2]);
	// Foreing 3
	Spine_UpdateStatistic(chapter, player.guild, "LanguageForeign3", PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3]);
	// Orc
	Spine_UpdateStatistic(chapter, player.guild, "LanguageOrc", PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_Orc]);
	// Draconian
	Spine_UpdateStatistic(chapter, player.guild, "LanguageOrc", PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_Draconian]);
	// Animal
	Spine_UpdateStatistic(chapter, player.guild, "LanguageAnimal", PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_Tier]);
	
	// Scrolls
	Spine_UpdateStatistic(chapter, player.guild, "Scrolls", Npc_GetTalentSkill(player, NPC_TALENT_SCROLLS));
	
	// Smith
	// Sharpen
	Spine_UpdateStatistic(chapter, player.guild, "SmithSharpen", Schaerfen_Perk);
	// Arrows
	Spine_UpdateStatistic(chapter, player.guild, "SmithArrows", Mod_PfeileSpitzen);
	// Common
	Spine_UpdateStatistic(chapter, player.guild, "SmithCommon", PLAYER_TALENT_SMITH[WEAPON_Common]);
	// 1H Special 01
	Spine_UpdateStatistic(chapter, player.guild, "Smith1HSpecial01", PLAYER_TALENT_SMITH[WEAPON_1H_Special_01]);
	// 2H Special 01
	Spine_UpdateStatistic(chapter, player.guild, "Smith2HSpecial01", PLAYER_TALENT_SMITH[WEAPON_2H_Special_01]);
	// 1H Special 02
	Spine_UpdateStatistic(chapter, player.guild, "Smith1HSpecial02", PLAYER_TALENT_SMITH[WEAPON_1H_Special_02]);
	// 2H Special 02
	Spine_UpdateStatistic(chapter, player.guild, "Smith2HSpecial02", PLAYER_TALENT_SMITH[WEAPON_2H_Special_02]);
	// 1H Special 03
	Spine_UpdateStatistic(chapter, player.guild, "Smith1HSpecial03", PLAYER_TALENT_SMITH[WEAPON_1H_Special_03]);
	// 2H Special 03
	Spine_UpdateStatistic(chapter, player.guild, "Smith2HSpecial03", PLAYER_TALENT_SMITH[WEAPON_2H_Special_03]);
	// 1H Special 04
	Spine_UpdateStatistic(chapter, player.guild, "Smith1HSpecial04", PLAYER_TALENT_SMITH[WEAPON_1H_Special_04]);
	// 1H Special 04 Dex
	Spine_UpdateStatistic(chapter, player.guild, "Smith1HSpecial04Dex", PLAYER_TALENT_SMITH[WEAPON_1H_Special_04_Dex]);
	// 2H Special 04
	Spine_UpdateStatistic(chapter, player.guild, "Smith2HSpecial04", PLAYER_TALENT_SMITH[WEAPON_2H_Special_04]);
	// 1H Harad 01
	Spine_UpdateStatistic(chapter, player.guild, "Smith1HHarad01", PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01]);
	// 1H Harad 02
	Spine_UpdateStatistic(chapter, player.guild, "Smith1HHarad02", PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02]);
	// 1H Harad 03
	Spine_UpdateStatistic(chapter, player.guild, "Smith1HHarad03", PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03]);
	// 1H Harad 04
	Spine_UpdateStatistic(chapter, player.guild, "Smith1HHarad04", PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04]);
	
	// Runes
	// PalLight
	Spine_UpdateStatistic(chapter, player.guild, "RunePalLight", PLAYER_TALENT_RUNES[SPL_PalLight]);
	// PalLightHeal
	Spine_UpdateStatistic(chapter, player.guild, "RunePalLightHeal", PLAYER_TALENT_RUNES[SPL_PalLightHeal]);
	// PalHolyBolt
	Spine_UpdateStatistic(chapter, player.guild, "RunePalHolyBolt", PLAYER_TALENT_RUNES[SPL_PalHolyBolt]);
	// PalMediumHeal
	Spine_UpdateStatistic(chapter, player.guild, "RunePalMediumHeal", PLAYER_TALENT_RUNES[SPL_PalMediumHeal]);
	// PalRepelEvil
	Spine_UpdateStatistic(chapter, player.guild, "RunePalRepelEvil", PLAYER_TALENT_RUNES[SPL_PalRepelEvil]);
	// Summon Goblin Warrior
	Spine_UpdateStatistic(chapter, player.guild, "RuneSummonGoblinWarrior", PLAYER_TALENT_RUNES[SPL_SummonGoblinKrieger]);
	// Summon Ice Goblin
	Spine_UpdateStatistic(chapter, player.guild, "RuneSummonIceGoblin", PLAYER_TALENT_RUNES[SPL_SummonEisgoblin]);
	// PalFullHeal
	Spine_UpdateStatistic(chapter, player.guild, "RunePalFullHeal", PLAYER_TALENT_RUNES[SPL_PalFullHeal]);
	// PalDestroyEvil
	Spine_UpdateStatistic(chapter, player.guild, "RunePalDestroyEvil", PLAYER_TALENT_RUNES[SPL_PalDestroyEvil]);
	// Light
	Spine_UpdateStatistic(chapter, player.guild, "RuneLight", PLAYER_TALENT_RUNES[SPL_LIGHT]);
	// Firebolt
	Spine_UpdateStatistic(chapter, player.guild, "RuneFirebolt", PLAYER_TALENT_RUNES[SPL_Firebolt]);
	// Icebolt
	Spine_UpdateStatistic(chapter, player.guild, "RuneIcebolt", PLAYER_TALENT_RUNES[SPL_Icebolt]);
	// Light Heal
	Spine_UpdateStatistic(chapter, player.guild, "RuneLightHeal", PLAYER_TALENT_RUNES[SPL_LightHeal]);
	// Summon Goblin Skeleton
	Spine_UpdateStatistic(chapter, player.guild, "RuneSummonGoblinSkeleton", PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton]);
	// Iceball
	Spine_UpdateStatistic(chapter, player.guild, "RuneIceball", PLAYER_TALENT_RUNES[SPL_InstantIceball]);
	// Instant Fireball
	Spine_UpdateStatistic(chapter, player.guild, "RuneInstantFireball", PLAYER_TALENT_RUNES[SPL_InstantFireball]);
	// Zap
	Spine_UpdateStatistic(chapter, player.guild, "RuneZap", PLAYER_TALENT_RUNES[SPL_Zap]);
	// Summon Wolf
	Spine_UpdateStatistic(chapter, player.guild, "RuneSummonWolf", PLAYER_TALENT_RUNES[SPL_SummonWolf]);
	// Windfist
	Spine_UpdateStatistic(chapter, player.guild, "RuneWindfist", PLAYER_TALENT_RUNES[SPL_WINDFIST]);
	// Sleep
	Spine_UpdateStatistic(chapter, player.guild, "RuneSleep", PLAYER_TALENT_RUNES[SPL_Sleep]);
	// Medium Heal
	Spine_UpdateStatistic(chapter, player.guild, "RuneMediumHeal", PLAYER_TALENT_RUNES[SPL_MediumHeal]);
	// Lightning Flash
	Spine_UpdateStatistic(chapter, player.guild, "RuneLightningFlash", PLAYER_TALENT_RUNES[SPL_LightningFlash]);
	// Charge Fireball
	Spine_UpdateStatistic(chapter, player.guild, "RuneChargeFireball", PLAYER_TALENT_RUNES[SPL_ChargeFireball]);
	// Summon Skeleton
	Spine_UpdateStatistic(chapter, player.guild, "RuneSummonSkeleton", PLAYER_TALENT_RUNES[SPL_SummonSkeleton]);
	// Fear
	Spine_UpdateStatistic(chapter, player.guild, "RuneFear", PLAYER_TALENT_RUNES[SPL_Fear]);
	// Icecube
	Spine_UpdateStatistic(chapter, player.guild, "RuneIcecube", PLAYER_TALENT_RUNES[SPL_IceCube]);
	// Charge Zap
	Spine_UpdateStatistic(chapter, player.guild, "RuneChargeZap", PLAYER_TALENT_RUNES[SPL_ChargeZap]);
	// Summon Golem
	Spine_UpdateStatistic(chapter, player.guild, "RuneSummonGolem", PLAYER_TALENT_RUNES[SPL_SummonGolem]);
	// Summon Fire Golem
	Spine_UpdateStatistic(chapter, player.guild, "RuneSummonFireGolem", PLAYER_TALENT_RUNES[SPL_SummonFireGolem]);
	// Summon Ice Golem
	Spine_UpdateStatistic(chapter, player.guild, "RuneSummonIceGolem", PLAYER_TALENT_RUNES[SPL_SummonIceGolem]);
	// Destroy Undead
	Spine_UpdateStatistic(chapter, player.guild, "RuneDestroyUndead", PLAYER_TALENT_RUNES[SPL_DestroyUndead]);
	// Pyrokinesis
	Spine_UpdateStatistic(chapter, player.guild, "RunePyrokinesis", PLAYER_TALENT_RUNES[SPL_Pyrokinesis]);
	// Firestorm
	Spine_UpdateStatistic(chapter, player.guild, "RuneFirestorm", PLAYER_TALENT_RUNES[SPL_Firestorm]);
	// Pyrokensis G1
	Spine_UpdateStatistic(chapter, player.guild, "RunePyrokensisG1", PLAYER_TALENT_RUNES[SPL_Pyrokinesis_g1]);
	// Icewave
	Spine_UpdateStatistic(chapter, player.guild, "RuneIcewave", PLAYER_TALENT_RUNES[SPL_IceWave]);
	// Summon Demon
	Spine_UpdateStatistic(chapter, player.guild, "RuneSummonDemon", PLAYER_TALENT_RUNES[SPL_SummonDemon]);
	// Full Heal
	Spine_UpdateStatistic(chapter, player.guild, "RuneFullHeal", PLAYER_TALENT_RUNES[SPL_FullHeal]);
	// Firerain
	Spine_UpdateStatistic(chapter, player.guild, "RuneFirerain", PLAYER_TALENT_RUNES[SPL_Firerain]);
	// Breath of Death
	Spine_UpdateStatistic(chapter, player.guild, "RuneBreathOfDeath", PLAYER_TALENT_RUNES[SPL_BreathOfDeath]);
	// Mass Death
	Spine_UpdateStatistic(chapter, player.guild, "RuneMassDeath", PLAYER_TALENT_RUNES[SPL_MassDeath]);
	// Army of Darkness
	Spine_UpdateStatistic(chapter, player.guild, "RuneArmyOfDarkness", PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness]);
	// Ice Rain
	Spine_UpdateStatistic(chapter, player.guild, "RuneIceRain", PLAYER_TALENT_RUNES[SPL_Icerain]);
	// Summon Dragon
	Spine_UpdateStatistic(chapter, player.guild, "RuneSummonDragon", PLAYER_TALENT_RUNES[SPL_SummonDragon]);
	// Shrink
	Spine_UpdateStatistic(chapter, player.guild, "RuneShrink", PLAYER_TALENT_RUNES[SPL_Shrink]);
	// Whirlwind
	Spine_UpdateStatistic(chapter, player.guild, "RuneWhirlwind", PLAYER_TALENT_RUNES[SPL_Whirlwind]);
	// Waterfist
	Spine_UpdateStatistic(chapter, player.guild, "RuneWaterfist", PLAYER_TALENT_RUNES[SPL_WaterFist]);
	// Icelance
	Spine_UpdateStatistic(chapter, player.guild, "RuneIcelance", PLAYER_TALENT_RUNES[SPL_IceLance]);
	// Geyser
	Spine_UpdateStatistic(chapter, player.guild, "RuneGeyser", PLAYER_TALENT_RUNES[SPL_Geyser]);
	// Thunderstorm
	Spine_UpdateStatistic(chapter, player.guild, "RuneThunderstorm", PLAYER_TALENT_RUNES[SPL_Thunderstorm]);
	// Suck Energy
	Spine_UpdateStatistic(chapter, player.guild, "RuneSuckEnergy", PLAYER_TALENT_RUNES[SPL_SuckEnergy]);
	// Summon Guardian
	Spine_UpdateStatistic(chapter, player.guild, "RuneSummonGuardian", PLAYER_TALENT_RUNES[SPL_SummonGuardian]);
	// Summon Zombie
	Spine_UpdateStatistic(chapter, player.guild, "RuneSummonZombie", PLAYER_TALENT_RUNES[SPL_SummonZombie]);
	// Energy Ball
	Spine_UpdateStatistic(chapter, player.guild, "RuneEnergyBall", PLAYER_TALENT_RUNES[SPL_EnergyBall]);
	// Skull
	Spine_UpdateStatistic(chapter, player.guild, "RuneSkull", PLAYER_TALENT_RUNES[SPL_Skull]);
	
	// Inventory statistics
	// Gold
	Spine_UpdateStatistic(chapter, player.guild, "Gold", Npc_HasItems(player, ItMi_Gold));
	// Inventory Value
	Spine_UpdateStatistic(chapter, player.guild, "InventoryValue", HeroInventarWert());
};
