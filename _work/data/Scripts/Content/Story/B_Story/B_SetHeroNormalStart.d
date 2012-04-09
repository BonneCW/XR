FUNC VOID B_SetHeroNormalStart()
{
	hero.attribute[ATR_STRENGTH] -= 190;
	hero.attribute[ATR_DEXTERITY] = 10;
	hero.attribute[ATR_HITPOINTS_MAX] = 40 + hero.level*HP_PER_LEVEL;
	hero.attribute[ATR_HITPOINTS] = 40 + hero.level*HP_PER_LEVEL;

	hero.aivar[AIV_Damage] = hero.attribute[ATR_HITPOINTS];
};