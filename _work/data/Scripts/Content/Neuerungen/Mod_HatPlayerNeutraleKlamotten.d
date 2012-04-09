FUNC INT Mod_HatPlayerNeutraleKlamotten()
{
	if (Npc_HasItems(hero, ITAR_SMITH) > 0)
	|| (Npc_HasItems(hero, ITAR_VLK_L) > 0)
	|| (Npc_HasItems(hero, ITAR_VLK_M) > 0)
	|| (Npc_HasItems(hero, ITAR_VLK_H) > 0)
	|| (Npc_HasItems(hero, ITAR_BAU_L) > 0)
	|| (Npc_HasItems(hero, ITAR_BAU_M) > 0)
	|| (Npc_HasItems(hero, ITAR_DJG_CRAWLER) > 0)
	|| (Npc_HasItems(hero, ITAR_LEATHER_L) > 0)
	|| (Npc_HasItems(hero, Snapperlederrüstung) > 0)
	|| (Npc_HasItems(hero, ITAR_Schattenläufer) > 0)
	|| (Npc_HasItems(hero, ITAR_Schaf) > 0)
	|| (Npc_HasItems(hero, ITAR_Waldlaeufer_01) > 0)
	|| (Npc_HasItems(hero, ITAR_Lurker) > 0)
	|| (Npc_HasItems(hero, ITAR_Swampshark) > 0)
	|| (Npc_HasItems(hero, ITAR_Prisoner) > 0)
	{
		return 1;
	};
	
	return 0;
};