FUNC VOID TORINORCCITY()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ranad_OC_AtHoshPak))
	&& (Mod_TorInStadt == 0)
	{
		Wld_SendTrigger	("EVT_OCC_RITUALTOR_01");
		Wld_SendTrigger	("EVT_OCC_RITUALTOR_02");

		Mod_TorInStadt = 1;		

		B_LogEntry	(TOPIC_MOD_FOKUSSUCHE, "Was ist das? Warum ist das Tor zu? Naja, ich werde mich darum kümmern, wenn ich den Fokus von Hosh Pak habe.");
	};

	if (Mod_TorInStadt == 1)
	&& (Npc_IsDead(Mod_10005_Orc_HoshPak_OC))
	{
		Mod_TorInStadt = 2;

		Wld_SendTrigger	("EVT_OCC_RITUALTOR_01");
		Wld_SendTrigger	("EVT_OCC_RITUALTOR_02");

		B_InitMonsterAttitudes();

		B_LogEntry	(TOPIC_MOD_FOKUSSUCHE, "Scheint so, als hätte Hosh Pak das Tor geschlossen. Jetzt, wo er tot ist, ist es jedenfalls wieder offen.");
	};
};