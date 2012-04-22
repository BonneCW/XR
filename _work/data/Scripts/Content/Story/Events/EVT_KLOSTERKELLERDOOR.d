FUNC INT ENTER_KLOSTERKELLERDOOR ()
{
	var int KLOSTERKELLER_DOOR_OPENED;

	if (Npc_KnowsInfo(hero, Info_Mod_Xardas_NW_Goetterschwerter))
	&& (KLOSTERKELLER_DOOR_OPENED == FALSE)
	{
		KLOSTERKELLER_DOOR_OPENED == TRUE;

		return 1;
	}
	else if (KLOSTERKELLER_DOOR_OPENED == TRUE)
	{
		return 1;
	}
	else
	{
		AI_PrintScreen	("Ich bin noch nicht so weit", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

		return 0;
	};
};