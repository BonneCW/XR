var int InvValue;
var int TempInvValue;
var int i;

FUNC INT HeroInventarWert()
{
	InvValue = 0;

	if (Npc_GetInvItemBySlot(hero, 0, i) > 0) {
		var int itemid; itemid = Hlp_GetInstanceID (item);

		TempInvValue += item.value*Npc_HasItems(hero, itemid);

		i += 1;

		HeroInventarWert();
	} else {
		InvValue = TempInvValue;

		TempInvValue = 0;

		i = 0;

		return InvValue;
	};

	return InvValue;
};
