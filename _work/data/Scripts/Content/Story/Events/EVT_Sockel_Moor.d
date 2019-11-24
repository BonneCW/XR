FUNC VOID EVT_SOCKEL_MOOR_S1()
{
	if (Mod_Botschek_Wasserleichen >= 14) {
		return;
	};
	
	Npc_RemoveInvItems	(hero, ItMi_Focus_Moor, 1);

	B_GivePlayerXP	(1000);

	B_LogEntry	(TOPIC_MOD_BOTSCHEK_SEUCHENDOLCH, "Es ist getan. Der Fokus ist eingesetzt und die Barriere schützt die Umgebung erneut.");

	Mod_Botschek_Wasserleichen = 14;
};