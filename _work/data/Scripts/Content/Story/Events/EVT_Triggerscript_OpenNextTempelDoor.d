var int adanosdoor_open;

FUNC VOID EVT_TRIGGERSCRIPT_OPENNEXTTEMPELDOOR_FUNC ()
{
	if (Npc_HasItems(hero, ItMw_Adanos_Stab_Teil1) == 1)
	&& (Npc_HasItems(hero, ItMw_Adanos_Stab_Teil2) == 1)
	&& (!adanosdoor_open)
	{
		Wld_SendTrigger	("EVT_ADANOS_ROOM03_DOORMOVER_01_01");

		adanosdoor_open = TRUE;
	};
};