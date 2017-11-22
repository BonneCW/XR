FUNC VOID EVT_GDG_SoulStone_s1()
{
	SoulStoneEingesetzt = SoulStoneEingesetzt + 1;

	Npc_RemoveInvItems	(hero, ItAt_SoulStone, 1);

	if (SoulStoneEingesetzt	==	3)
	{
		Wld_PlayEffect("FX_EarthQuake",  hero, hero, 0, 0, 0, FALSE );

		B_LogEntry	(TOPIC_MOD_URIZIEL, "Ich habe alle 3 Seelenstein eingesetzt. Beim Einsetzen des letzten Foki gab es ein Erdbeben. Ich kann jetzt Xardas, Pyrokar und Saturas holen und das Ritual kann beginnen.");

		B_GivePlayerXP	(1000);

		Npc_RemoveInvItems	(hero, ItAt_SoulStone, 3);

		Wld_InsertNpc	(Demon_GDG, "WIL_LAGERER_25");
	};
};