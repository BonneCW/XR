FUNC VOID GILDENSTORY_KG()
{
	if (CurrentLevel == ABANDONEDMINE_ZEN)
	{
		if (Npc_KnowsInfo(hero, Info_Mod_Granmar_VM_AtNager))
		&& (!Npc_IsInState(Mod_7625_KGD_Granmar_VM, ZS_Talk))
		&& (Npc_GetDistToNpc(Mod_7625_KGD_Granmar_VM, hero) > 1000)
		&& (Mod_KG_WaitInMine == 0)
		{
			Mod_KG_WaitInMine = 1;

			AI_StandUP	(hero);

			AI_Output(hero, NULL, "Info_Mod_Hero_VM_GehtNichtVoran_15_00"); //Wenn wir so weiter machen, bekommen wir die Mine nie richtig in Gang. Sieht so aus, als ob ich wieder alles allein machen darf.

			B_LogEntry	(TOPIC_MOD_KG_STEINMONSTER, "Ich sollte mich hier ein wenig umsehen, solange Granmar die anderen in die Mine holt.");
		};

		if (Mod_KG_WaitInMine == 1)
		&& (Npc_GetDistToWP(hero, "MINE_GO_41") < 500)
		&& (Mod_KG_TrentLicht == FALSE)
		{
			AI_StandUP	(hero);

			if (Mod_KG_RightTunnel == 0)
			{
				Mod_KG_RightTunnel = 1;

				AI_Output(hero, NULL, "Info_Mod_Hero_VM_RightTunnel_15_00"); //Hier sieht man ja nicht mal die Hand vor Augen. Und meine Fackel bekomm ich hier auch nicht an. Scheint so, als würde es hier einen Windzug geben. Ich sollte lieber umkehren, bevor ich hier noch irgendwelchen Monstern in die Arme laufe, falls die sowas überhaupt haben ...

				B_LogEntry	(TOPIC_MOD_KG_STEINMONSTER, "Der rechte Tunnel ist zu dunkel, um ihn zu betreten. Ich sollte es später noch einmal versuchen ...");
			};

			AI_GotoWP	(hero, "MINE_GO_36");
		};

		if (Mod_KG_SpecialErzguardian == 0)
		&& (Npc_IsDead(Erzguardian_Special_01))
		{
			Mod_KG_SpecialErzguardian = 1;

			AI_StandUP	(hero);

			AI_Output(hero, NULL, "Info_Mod_Hero_VM_SpecialErzguardian_15_00"); //Ich sollte jetzt langsam mal bei Granmar vorbeischauen ...

			B_LogEntry	(TOPIC_MOD_KG_STEINMONSTER, "Ich sollte jetzt langsam mal bei Granmar vorbeischauen ...");
		};

		if (Mod_KG_SchwarzesErz == 0)
		&& (Npc_KnowsInfo(hero, Info_Mod_Trent_VM_AfterQueenAttack))
		&& (!Npc_IsInState(Mod_7630_RIT_Trent_VM, ZS_Talk))
		{
			Mod_KG_SchwarzesErz = 1;

			AI_StandUP	(hero);

			AI_Output(hero, NULL, "Info_Mod_Hero_VM_AfterQueenAttack_15_00"); //Ich sollte das schwarze Erz auf keinen Fall den Paladinen übergeben. Xardas wir mir damit bestimmt weiterhelfen können ...

			Log_CreateTopic	(TOPIC_MOD_KG_RITUAL, LOG_MISSION);
			B_SetTopicStatus	(TOPIC_MOD_KG_RITUAL, LOG_RUNNING);
			B_LogEntry	(TOPIC_MOD_KG_RITUAL, "Ich sollte das schwarze Erz auf keinen Fall den Paladinen übergeben. Xardas wir mir damit bestimmt weiterhelfen können ...");
		};

		if (Mod_KG_TrentLicht > 0)
		{
			Mod_KG_TrentLicht -= 1;
		};

		if (Mod_KG_VMGate_02 == 0)
		&& (Npc_KnowsInfo(hero, Info_Mod_Hymir_MineFertig))
		{
			Mod_KG_VMGate_02 = 1;

			Wld_SendTrigger	("EVT_VMGATE_02");
		};
	};

	if (CurrentLevel == MINENTAL_ZEN)
	{
		if (Mod_KG_OrkZauber == 0)
		&& (Npc_KnowsInfo(hero, Info_Mod_OrcSchamane_KG_Hi))
		&& (!Npc_IsInState(Mod_10041_Orc_Schamane_MT, ZS_Talk))
		{
			Mod_KG_OrkZauber = 1;

			Wld_PlayEffect	("SPELLFX_INVOCATION_RED", Mod_10041_Orc_Schamane_MT, Mod_10041_Orc_Schamane_MT, 0, 0, 0, FALSE);

			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX]/2;

			B_KillNpc	(Mod_7528_RIT_Trent_MT);
			B_KillNpc	(Mod_7635_MIL_Miliz_MT);
			B_KillNpc	(Mod_7636_MIL_Miliz_MT);
		};

		if (Mod_KG_NachOrkZauber == 0)
		&& (Npc_KnowsInfo(hero, Info_Mod_OrcSchamane_KG_NichtTot))
		&& (Npc_GetDistToWP(hero, "CASTLE_30") < 300)
		{
			Mod_KG_NachOrkZauber = 1;

			AI_StandUP	(hero);

			AI_Output(hero, NULL, "Info_Mod_Hero_KG_OrkNichtTot_15_00"); //Verdammt, das war's wohl für Trent. Ich sollte Xardas aufsuchen, vielleicht hilft mir hier das schwarze Erz weiter. Hm ... hat der Schamane nicht auch etwas schwarzes erwähnt?

			B_LogEntry	(TOPIC_MOD_KG_RITUAL, "Verdammt, das war's wohl für Trent. Ich sollte Xardas aufsuchen, vielleicht hilft mir hier das schwarze Erz weiter. Hm ... hat der Schamane nicht auch etwas schwarzes erwähnt?");
		};

		if (Mod_KG_OrkTot == 0)
		&& (Npc_IsDead(Mod_10041_Orc_Schamane_MT))
		&& (Npc_KnowsInfo(hero, Info_Mod_OrcSchamane_KG_KillYou))
		{
			Mod_KG_OrkTot = 1;

			AI_StandUP	(hero);

			AI_Output(hero, NULL, "Info_Mod_Hero_KG_OrkTot_15_00"); //Das wäre erledigt. Ich sollte jetzt noch mal Hymir und Lord Andre aufsuchen.

			B_LogEntry	(TOPIC_MOD_KG_RITUAL, "Das wäre erledigt. Ich sollte jetzt noch mal Hymir und Lord Andre aufsuchen.");
		};

		if (Npc_KnowsInfo(hero, Info_Mod_OrcSchamane_KG_NichtTot))
		&& (Mod_KG_SchwarzerRing == 0)
		&& (Npc_GetDistToWP(hero, "CASTLE_37") < 1000)
		{
			AI_StandUP	(hero);

			AI_GotoWP	(hero, "CASTLE_30");

			AI_Output(hero, NULL, "Info_Mod_Hero_KG_OrkNochNichtBereit_15_00"); //Ich sollte mich lieber noch nicht wieder hineinwagen.
		};
	};

	if (CurrentLevel == NEWWORLD_ZEN)
	{
		if (Mod_KG_VMGate_01 == 0)
		&& (Npc_KnowsInfo(hero, Info_Mod_Hymir_MineFertig))
		{
			Mod_KG_VMGate_01 = 1;

			Wld_SendTrigger	("EVT_VMGATE_01");
		};
	};
};