INSTANCE Info_Mod_Sekob_Hi (C_INFO)
{
	npc		= Mod_105_BAU_Sekob_NW;
	nr		= 1;
	condition	= Info_Mod_Sekob_Hi_Condition;
	information	= Info_Mod_Sekob_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Sekob_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Sekob_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Sekob_Hi_01_01"); //Ich bin Sekob, mir gehört dieser Hof. Was willst du von mir?
};

INSTANCE Info_Mod_Sekob_Daemonisch (C_INFO)
{
	npc		= Mod_105_BAU_Sekob_NW;
	nr		= 1;
	condition	= Info_Mod_Sekob_Daemonisch_Condition;
	information	= Info_Mod_Sekob_Daemonisch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Sekob_Daemonisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Orlan_Daemonisch4))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sekob_Daemonisch_Info()
{
	AI_Output(self, hero, "Info_Mod_Sekob_Daemonisch_01_00"); //(wütend) Verdammt, zwei Monatsgehälter habe ich für mich und den Knecht in der Taverne ausgegeben.
	AI_Output(self, hero, "Info_Mod_Sekob_Daemonisch_01_01"); //Warum hat mich niemand davon abgehalten?!
};

INSTANCE Info_Mod_Sekob_Untier (C_INFO)
{
	npc		= Mod_105_BAU_Sekob_NW;
	nr		= 1;
	condition	= Info_Mod_Sekob_Untier_Condition;
	information	= Info_Mod_Sekob_Untier_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ist dir zufällig in den letzten Tagen ein ungewöhnliches Raubtier auf dem Hof begegnet...?";
};

FUNC INT Info_Mod_Sekob_Untier_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sekob_Hi))
	&& (Mod_Cronos_Artefakt == 2)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Cronos_AW_Artefakt_02))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sekob_Untier_Info()
{
	AI_Output(hero, self, "Info_Mod_Sekob_Untier_15_00"); //Ist dir zufällig in den letzten Tagen ein ungewöhnliches Raubtier auf dem Hof begegnet...?
	AI_Output(self, hero, "Info_Mod_Sekob_Untier_01_01"); //(außer sich) Ungewöhnliches Raubtier?! Ich habe ganz andere Probleme.
	AI_Output(self, hero, "Info_Mod_Sekob_Untier_01_02"); //Diese verdammten Untoten haben sich vor kurzer Zeit aus den Gräbern erhoben und sind meinen Gehöft gefährlich nahe gekommen.
	AI_Output(self, hero, "Info_Mod_Sekob_Untier_01_03"); //Kein Auge kann ich Nachts mehr zumachen aus Sorge, sie könnten mir irgendwann ins Schlafzimmer hereinspazieren ...
	AI_Output(hero, self, "Info_Mod_Sekob_Untier_15_04"); //Ja, aber ...
	AI_Output(self, hero, "Info_Mod_Sekob_Untier_01_05"); //(wütend) Wenn du auf der Suche nach Wild bist, frag doch Balthasar. Der hat irgendetwas von einer Bestie geschwafelt.
	AI_Output(self, hero, "Info_Mod_Sekob_Untier_01_06"); //Ha, das ich nicht lache. Wahrscheinlich nur eine Ratte aus der Scheune gewesen ...

	Wld_InsertNpc	(Zombie_AtSekobsHof_01, "FP_ROAM_SEKOBSZOMBIE_01");
	Wld_InsertNpc	(Zombie_AtSekobsHof_02, "FP_ROAM_SEKOBSZOMBIE_02");
};

INSTANCE Info_Mod_Sekob_ZombiesTot (C_INFO)
{
	npc		= Mod_105_BAU_Sekob_NW;
	nr		= 1;
	condition	= Info_Mod_Sekob_ZombiesTot_Condition;
	information	= Info_Mod_Sekob_ZombiesTot_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe das Problem mit den Untoten gelöst.";
};

FUNC INT Info_Mod_Sekob_ZombiesTot_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sekob_Untier))
	&& (Npc_IsDead(Zombie_AtSekobsHof_01))
	&& (Npc_IsDead(Zombie_AtSekobsHof_02))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sekob_ZombiesTot_Info()
{
	AI_Output(hero, self, "Info_Mod_Sekob_ZombiesTot_15_00"); //Ich habe das Problem mit den Untoten gelöst.
	AI_Output(self, hero, "Info_Mod_Sekob_ZombiesTot_01_01"); //Fabelhaft, dann werde ich jetzt wieder in Ruhe schlafen können.
	AI_Output(hero, self, "Info_Mod_Sekob_ZombiesTot_15_02"); //Nicht so schnell. Wie viel ist dir denn dein ruhiger Schlaf wert
	AI_Output(self, hero, "Info_Mod_Sekob_ZombiesTot_01_03"); //(leicht mürrisch) Na schön, hier hast du 50 Goldmünzen.

	B_GiveInvItems	(self, hero, ItMi_Gold, 200);

	B_GivePlayerXP	(200);
};

INSTANCE Info_Mod_Sekob_Unheil (C_INFO)
{
	npc		= Mod_105_BAU_Sekob_NW;
	nr		= 1;
	condition	= Info_Mod_Sekob_Unheil_Condition;
	information	= Info_Mod_Sekob_Unheil_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ist in letzter Zeit etwas Sonderbares auf dem Hof bei dir vorgefallen?";
};

FUNC INT Info_Mod_Sekob_Unheil_Condition()
{
	if (Mod_WM_Boeden == 14)
	|| (Mod_WM_Boeden == 13)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sekob_Unheil_Info()
{
	AI_Output(hero, self, "Info_Mod_Sekob_Unheil_15_00"); //Ist in letzter Zeit etwas Sonderbares auf dem Hof bei dir vorgefallen?
	AI_Output(self, hero, "Info_Mod_Sekob_Unheil_01_01"); //Was?! Willst du mich zum Narren halten?! Ich jag dich gleich zu dem untoten Pack auf den Friedhof. Mach, dass du hier raus kommst!

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Sekob_Bauer (C_INFO)
{
	npc		= Mod_105_BAU_Sekob_NW;
	nr		= 1;
	condition	= Info_Mod_Sekob_Bauer_Condition;
	information	= Info_Mod_Sekob_Bauer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Gibt's hier was zu tun?";
};

FUNC INT Info_Mod_Sekob_Bauer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sekob_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sekob_Bauer_Info()
{
	AI_Output(hero, self, "Info_Mod_Sekob_Bauer_15_00"); //Gibt's hier was zu tun?
	AI_Output(self, hero, "Info_Mod_Sekob_Bauer_01_01"); //Wenn du dich nützlich machen willst, dann sprich mal mit Balthasar.
	AI_Output(self, hero, "Info_Mod_Sekob_Bauer_01_02"); //Er hat sicher eine Kleinigkeit für dich zu tun.
};

INSTANCE Info_Mod_Sekob_SagittaKraeuter (C_INFO)
{
	npc		= Mod_105_BAU_Sekob_NW;
	nr		= 1;
	condition	= Info_Mod_Sekob_SagittaKraeuter_Condition;
	information	= Info_Mod_Sekob_SagittaKraeuter_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Sekob_SagittaKraeuter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sagitta_Kraeuter2))
	&& (Npc_HasItems(hero, ItPo_SekobMedizin) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sekob_SagittaKraeuter_Info()
{
	AI_Output(self, hero, "Info_Mod_Sekob_SagittaKraeuter_01_00"); //(aufgebracht) Was willst du hier in meinem Haus?!
	AI_Output(hero, self, "Info_Mod_Sekob_SagittaKraeuter_15_01"); //Ähh, ich bring dir die Medizin von Sagitta.
	AI_Output(self, hero, "Info_Mod_Sekob_SagittaKraeuter_01_02"); //Was? Na dann gib schon her. Hat ja ewig gedauert.

	B_GiveInvItems	(hero, self, ItPo_SekobMedizin, 1);

	B_UseItem	(self, ItPo_SekobMedizin);

	AI_Output(hero, self, "Info_Mod_Sekob_SagittaKraeuter_15_03"); //Ähh, sie meinte, dass du jeweils zwei Esslöffel am Morgen und Abend nehmen sollst.
	AI_Output(self, hero, "Info_Mod_Sekob_SagittaKraeuter_01_04"); //(nicht auf den Helden achtend, zu sich selbst) Ahh, schon besser.
	AI_Output(self, hero, "Info_Mod_Sekob_SagittaKraeuter_01_05"); //(wieder zum Helden) Hä, ist noch was?
	AI_Output(hero, self, "Info_Mod_Sekob_SagittaKraeuter_15_06"); //Die Bezahlung.
	AI_Output(self, hero, "Info_Mod_Sekob_SagittaKraeuter_01_07"); //Was? Achso. Geh zu meiner Frau.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Sekob_Pickpocket (C_INFO)
{
	npc		= Mod_105_BAU_Sekob_NW;
	nr		= 1;
	condition	= Info_Mod_Sekob_Pickpocket_Condition;
	information	= Info_Mod_Sekob_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Sekob_Pickpocket_Condition()
{
	C_Beklauen	(50, ItMi_Gold, 110);
};

FUNC VOID Info_Mod_Sekob_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Sekob_Pickpocket);

	Info_AddChoice	(Info_Mod_Sekob_Pickpocket, DIALOG_BACK, Info_Mod_Sekob_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Sekob_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Sekob_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Sekob_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Sekob_Pickpocket);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Aabid_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Aabid_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Aabid_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Aabid_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		AI_StopProcessInfos	(self);

		B_Attack (self, hero, AR_Theft, 1);
	}
	else
	{
		if (rnd >= 75)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 200);
		}
		else if (rnd >= 50)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 100);
		}
		else if (rnd >= 25)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 50);
		};

		B_Say	(self, hero, "$PICKPOCKET_BESTECHUNG_01");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Aabid_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Aabid_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Sekob_EXIT (C_INFO)
{
	npc		= Mod_105_BAU_Sekob_NW;
	nr		= 1;
	condition	= Info_Mod_Sekob_EXIT_Condition;
	information	= Info_Mod_Sekob_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Sekob_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Sekob_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};