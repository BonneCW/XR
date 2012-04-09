var int CurrentInventarGewicht;
var int MaxInventarGewicht;

FUNC VOID GewichtsBegrenzung()
{
	CurrentInventarGewicht = 0;
	MaxInventarGewicht = hero.attribute[ATR_STRENGTH]*10;

	CurrentInventarGewicht += Npc_HasItems(hero, Uriziel_1H) * 40;

	PrintScreen	(ConcatStrings(ConcatStrings(IntToString(CurrentInventarGewicht), " / "), IntToString(MaxInventarGewicht)), 1, 16, FONT_SCREENSMALL, 2);

	if (CurrentInventarGewicht > MaxInventarGewicht)
	{
		//AI_SetWalkMode(hero, NPC_WALK);
	};
};