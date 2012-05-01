INSTANCE Info_Mod_Sylvio_Hi (C_INFO)
{
	npc		= Mod_797_SLD_Sylvio_MT;
	nr		= 1;
	condition	= Info_Mod_Sylvio_Hi_Condition;
	information	= Info_Mod_Sylvio_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Sylvio_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lee_GotoSylvio))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sylvio_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Sylvio_Hi_09_00"); //Hey, du bist doch der Typ, der im Alten Lager für uns spionieren soll.
	AI_Output(hero, self, "Info_Mod_Sylvio_Hi_15_01"); //Ja, das soll ich.
	AI_Output(self, hero, "Info_Mod_Sylvio_Hi_09_02"); //Ich will dir was sagen: Falls du was herausbekommst, solltest du es zuerst mir berichten, bevor du damit zu Lee rennst, verstanden?
	AI_Output(self, hero, "Info_Mod_Sylvio_Hi_09_03"); //Damit steigst du im Nu zum Orkjäger auf und kannst dir noch zusätzlich Gold uns Erz verdienen. Wir verstehen uns?

	B_LogEntry	(TOPIC_MOD_SLD_SPY, "Sylvio wollte, dass ich zuerst ihm bericht erstatte, falls ich im Alten Lager etwas erfahren sollte.");
};

INSTANCE Info_Mod_Sylvio_InfosAnLee (C_INFO)
{
	npc		= Mod_797_SLD_Sylvio_MT;
	nr		= 1;
	condition	= Info_Mod_Sylvio_InfosAnLee_Condition;
	information	= Info_Mod_Sylvio_InfosAnLee_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Sylvio_InfosAnLee_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lee_SchlachtDabei))
	|| (Npc_KnowsInfo(hero, Info_Mod_Lee_SchlachtVerpasst))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sylvio_InfosAnLee_Info()
{
	if (!Npc_KnowsInfo(hero, Info_Mod_Sylvio_Infos))
	{
		AI_Output(self, hero, "Info_Mod_Sylvio_InfosAnLee_09_00"); //Hatte ich nicht gesagt, dass du zuerst zu mir kommen sollst?
	};

	AI_Output(self, hero, "Info_Mod_Sylvio_InfosAnLee_09_01"); //Einer meiner besten Orkjäger wurde bloßgestellt und das färbt wiederum auf mich ab. Und so was gefällt mir ganz und gar nicht.
	AI_Output(self, hero, "Info_Mod_Sylvio_InfosAnLee_09_02"); //Pass besser in Zukunft auf, ob du dir nicht einflussreiche Feinde machst.
};

INSTANCE Info_Mod_Sylvio_Infos (C_INFO)
{
	npc		= Mod_797_SLD_Sylvio_MT;
	nr		= 1;
	condition	= Info_Mod_Sylvio_Infos_Condition;
	information	= Info_Mod_Sylvio_Infos_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe wichtige Informationen (...)";
};

FUNC INT Info_Mod_Sylvio_Infos_Condition()
{
	if (Mod_SLD_Spy == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sylvio_Infos_Info()
{
	AI_Output(hero, self, "Info_Mod_Lee_Infos_15_00"); //Ich habe wichtige Informationen aus meinen Gesprächen mit einigen Schatten gewonnen. Offenbar ist ein Gardist einem Mord zum Opfer gefallen.
	AI_Output(hero, self, "Info_Mod_Lee_Infos_15_01"); //Ein anderer Gardist will einen von unseren Männern als Täter ausgemacht haben und das Alte Lager plant einen Überfall auf uns im Morgengrauen der nächsten Tage.
	AI_Output(self, hero, "Info_Mod_Sylvio_Infos_09_02"); //Das ist interessant. Geh zu Sentenza. Er wird dir die weiteren Anweisungen geben.
	
	B_LogEntry	(TOPIC_MOD_SLD_SPY, "Ich soll zu Sentenza, um weitere Anweisungen zu erhalten.");

	Mod_SLD_Spy = 4;
};

INSTANCE Info_Mod_Sylvio_Frauenraub (C_INFO)
{
	npc		= Mod_797_SLD_Sylvio_MT;
	nr		= 1;
	condition	= Info_Mod_Sylvio_Frauenraub_Condition;
	information	= Info_Mod_Sylvio_Frauenraub_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Sylvio_Frauenraub_Condition()
{
	if (Mod_SLD_Spy == 7)
	|| (Mod_SLD_Spy == 8)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sylvio_Frauenraub_Info()
{
	AI_Output(self, hero, "Info_Mod_Sylvio_Frauenraub_09_00"); //Achja, es hat sich übrigens eine weitere Möglichkeit für dich gefunden, dich zu bewähren.
	AI_Output(self, hero, "Info_Mod_Sylvio_Frauenraub_09_01"); //Geh zu Bullco. Er wird dir alles Weitere mitteilen.
	AI_Output(hero, self, "Info_Mod_Sylvio_Frauenraub_15_02"); //Aber Bullco ist doch kein Orkjäger.
	AI_Output(self, hero, "Info_Mod_Sylvio_Frauenraub_09_03"); //Genau, er ist Drachenjäger. Na und? Für mich zu arbeiten lohnt sich eben. Du findest ihn tagsüber meistens vor der Kneipe.

	Log_CreateTopic	(TOPIC_MOD_SLD_BULLCO, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SLD_BULLCO, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_SLD_BULLCO, "Ich soll zu Bullco, der sich meistens vor der Kneipe befindet, um mir weitere Anweisungen zu holen.");
};

INSTANCE Info_Mod_Sylvio_VelayaWeg (C_INFO)
{
	npc		= Mod_797_SLD_Sylvio_MT;
	nr		= 1;
	condition	= Info_Mod_Sylvio_VelayaWeg_Condition;
	information	= Info_Mod_Sylvio_VelayaWeg_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Sylvio_VelayaWeg_Condition()
{
	if (Mod_SLD_Velaya == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sylvio_VelayaWeg_Info()
{
	AI_Output(self, hero, "Info_Mod_Sylvio_VelayaWeg_09_00"); //Was?! Du hier? Und ohne Begleitung?
	AI_Output(hero, self, "Info_Mod_Sylvio_VelayaWeg_15_01"); //Es hat leider nicht geklappt.
	AI_Output(self, hero, "Info_Mod_Sylvio_VelayaWeg_09_02"); //Nicht geklappt?! Nachdem du dir das geleistet hast, wird so manch anderes für dich wahrscheinlich auch nicht klappen. Geh mir aus den Augen.

	B_SetTopicStatus	(TOPIC_MOD_SLD_BULLCO, LOG_SUCCESS);
};

INSTANCE Info_Mod_Sylvio_VelayaDabei (C_INFO)
{
	npc		= Mod_797_SLD_Sylvio_MT;
	nr		= 1;
	condition	= Info_Mod_Sylvio_VelayaDabei_Condition;
	information	= Info_Mod_Sylvio_VelayaDabei_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Sylvio_VelayaDabei_Condition()
{
	if (Mod_SLD_Velaya == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sylvio_VelayaDabei_Info()
{
	AI_Output(self, hero, "Info_Mod_Sylvio_VelayaDabei_09_00"); //Sieh mal einer an, wen man uns hergebracht hat. Sie wird mir schöne Stunden bereiten.
	AI_Output(self, hero, "Info_Mod_Sylvio_VelayaDabei_09_01"); //(Zu dem Helden) Du hast deine Sache mehr als gut gemacht. Damit bist du der Aufnahme in die Reihen der Orkjäger wesentlich näher gekommen.
	AI_Output(self, hero, "Info_Mod_Sylvio_VelayaDabei_09_02"); //Hier deine Entlohnung. Die hast du dir redlich verdient.

	B_ShowGivenThings	("350 Gold, 10 Erz und 12 Stängel Sumpfkraut erhalten");

	CreateInvItems	(hero, ItMi_Gold, 350);
	CreateInvItems	(hero, ItMi_Nugget, 10);
	CreateInvItems	(hero, ItMi_Joint, 12);

	B_SetTopicStatus	(TOPIC_MOD_SLD_BULLCO, LOG_SUCCESS);

	B_GivePlayerXP	(450);

	B_StartOtherRoutine	(Mod_1621_EBR_Velaya_MT, "ATSYLVIO");
};

INSTANCE Info_Mod_Sylvio_Befoerderung (C_INFO)
{
	npc		= Mod_797_SLD_Sylvio_MT;
	nr		= 1;
	condition	= Info_Mod_Sylvio_Befoerderung_Condition;
	information	= Info_Mod_Sylvio_Befoerderung_Info;
	permanent	= 1;
	important	= 0;
	description	= "Bin ich bereit in die Reihen der Orkjäger aufgenommen zu werden?";
};

FUNC INT Info_Mod_Sylvio_Befoerderung_Condition()
{
	if (Mod_Gilde == 4)
	&& (Mod_SLD_Orkjaeger == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sylvio_Befoerderung_Info()
{
	AI_Output(hero, self, "Info_Mod_Sylvio_Befoerderung_15_00"); //Bin ich bereit in die Reihen der Orkjäger aufgenommen zu werden?

	if (Kapitel == 1)
	{
		AI_Output(self, hero, "Info_Mod_Sylvio_Befoerderung_04_01"); //Was?! Ach die Aufnahme ... ich denke in ein paar Tagen darüber nach.
	}
	else
	{
		if (Npc_KnowsInfo(hero, Info_Mod_Sylvio_VelayaDabei))
		&& (Npc_KnowsInfo(hero, Info_Mod_Sentenza_Cutter))
		{
			AI_Output(self, hero, "Info_Mod_Sylvio_Befoerderung_04_02"); //Achja, deine Aufnahme. Du hast gezeigt, dass du auf der richtigen Seite stehst und deine Aufgaben zu meiner vollsten Zufriedenheit erfüllt.
			AI_Output(self, hero, "Info_Mod_Sylvio_Befoerderung_04_03"); //Damit hast du dir deine Aufnahme mehr als verdient. Willkommen bei den Orkjägern. Hier ist deine neue Rüstung.

			B_ShowGivenThings	("Orkjägerrüstung erhalten");

			CreateInvItems	(hero, ItAr_Sld_H, 1);

			AI_UnequipArmor	(hero);
			AI_EquipArmor	(hero, ItAr_Sld_H);

			AI_Output(self, hero, "Info_Mod_Sylvio_Befoerderung_04_04"); //Deine Waffe kannst du dir bei Thofeistos abholen.

			Snd_Play ("LEVELUP");

			B_GivePlayerXP	(600);

			B_Göttergefallen(2, 5);

			Mod_Gilde = 19;

			Mod_SLD_Orkjaeger = 1;

			B_SetTopicStatus	(TOPIC_MOD_SLD_ORKJAEGER, LOG_SUCCESS);
		}
		else if (Npc_KnowsInfo(hero, Info_Mod_Sylvio_VelayaWeg))
		&& (Npc_KnowsInfo(hero, Info_Mod_Sylvio_InfosAnLee))
		{
			AI_Output(self, hero, "Info_Mod_Sylvio_Befoerderung_04_05"); //Achja, die Aufnahme. Du hast mir und meinen Jungs wirklich einigen Kummer gemacht, Bürschchen.
			AI_Output(self, hero, "Info_Mod_Sylvio_Befoerderung_04_06"); //Sei froh, dass du ein ehemaliger Bekannter von Lee bist, sonst würde ich dich mit meiner Waffe in Stücke hacken.
			AI_Output(self, hero, "Info_Mod_Sylvio_Befoerderung_04_07"); //Aufnahme? Bei den Bauern auf dem Reisfeld, aber nicht bei uns. Und jetzt geh mir aus den Augen, bevor ich mich doch noch vergesse.

			Mod_SLD_Orkjaeger = 2;

			B_LogEntry	(TOPIC_MOD_SLD_ORKJAEGER, "Na toll. Wenn es nach Sylvio geht, bin ich nicht dabei. Ich sollte Lee fragen, ob es nicht doch einen anderen Weg gibt.");
		}
		else if ((Npc_KnowsInfo(hero, Info_Mod_Sylvio_VelayaDabei))
		|| (Npc_KnowsInfo(hero, Info_Mod_Sentenza_Cutter)))
		&& ((Mod_SLD_Rufus == 7)
		|| ((Npc_KnowsInfo(hero, Info_Mod_Reislord_Hi))
		&& (Npc_KnowsInfo(hero, Info_Mod_Patrick_ShrikeDa))
		&& (Npc_KnowsInfo(hero, Info_Mod_Fester_BackAtCamp))
		&& (Mod_SLD_Engardo == 5)))
		{
			AI_Output(self, hero, "Info_Mod_Sylvio_Befoerderung_04_08"); //Manches hast du hinbekommen, einiges auch verhauen, jedoch alles in allem gute Arbeit geleistet.
			AI_Output(self, hero, "Info_Mod_Sylvio_Befoerderung_04_09"); //Du hast dich zwar nicht mit Ruhm bekleckert, aber für eine Aufnahme bei uns reicht es trotzdem gerade so. Hier ist deine neue Rüstung.

			B_ShowGivenThings	("Orkjägerrüstung erhalten");

			CreateInvItems	(hero, ItAr_Sld_H, 1);

			AI_UnequipArmor	(hero);
			AI_EquipArmor	(hero, ItAr_Sld_H);

			AI_Output(self, hero, "Info_Mod_Sylvio_Befoerderung_04_04"); //Deine Waffe kannst du dir bei Thofeistos abholen.

			Snd_Play ("LEVELUP");

			B_GivePlayerXP	(600);

			B_Göttergefallen(2, 5);

			Mod_Gilde = 19;

			Mod_SLD_Orkjaeger = 1;

			B_SetTopicStatus	(TOPIC_MOD_SLD_ORKJAEGER, LOG_SUCCESS);
		}
		else
		{
			AI_Output(self, hero, "Info_Mod_Sylvio_Befoerderung_04_10"); //Was, du hast du noch kaum etwas gemacht.
			AI_Output(self, hero, "Info_Mod_Sylvio_Befoerderung_04_11"); //Ehe du dich nicht bewährt hast, lautet die Antwort nein.
		};
	};
};

INSTANCE Info_Mod_Sylvio_Wettstreit (C_INFO)
{
	npc		= Mod_797_SLD_Sylvio_MT;
	nr		= 1;
	condition	= Info_Mod_Sylvio_Wettstreit_Condition;
	information	= Info_Mod_Sylvio_Wettstreit_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich fordere dich zum Wettstreit.";
};

FUNC INT Info_Mod_Sylvio_Wettstreit_Condition()
{
	if ((Npc_KnowsInfo(hero, Info_Mod_Lee_Wettstreit))
	|| (Npc_KnowsInfo(hero, Info_Mod_Lee_Orkfriedhof)))
	&& (Mod_Gilde == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sylvio_Wettstreit_Info()
{
	AI_Output(hero, self, "Info_Mod_Sylvio_Wettstreit_15_00"); //Ich fordere dich zum Wettstreit.
	AI_Output(self, hero, "Info_Mod_Sylvio_Wettstreit_09_01"); //Was ... was sagst du?
	AI_Output(hero, self, "Info_Mod_Sylvio_Wettstreit_15_02"); //Zum Wettstreit um den Posten des 2. Offiziers und Anführers der Orkjäger.
	AI_Output(self, hero, "Info_Mod_Sylvio_Wettstreit_09_03"); //Du Wicht erdreistest dich ... das wirst du bitter bereuen.
	AI_Output(hero, self, "Info_Mod_Sylvio_Wettstreit_15_04"); //Wollte auch nur Bescheid sagen und wieder zurück zu Lee.
	AI_Output(self, hero, "Info_Mod_Sylvio_Wettstreit_09_05"); //Ok, wenn du einen Wettstreit willst, sollst du einen bekommen.
};

INSTANCE Info_Mod_Sylvio_AtStonehenge (C_INFO)
{
	npc		= Mod_797_SLD_Sylvio_MT;
	nr		= 1;
	condition	= Info_Mod_Sylvio_AtStonehenge_Condition;
	information	= Info_Mod_Sylvio_AtStonehenge_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Sylvio_AtStonehenge_Condition()
{
	if (Mod_SLD_Wettstreit == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sylvio_AtStonehenge_Info()
{
	AI_Output(self, hero, "Info_Mod_Sylvio_AtStonehenge_09_00"); //Du hier? (zu sich selbst) Verdammt, wo bleibt nur Sentenza mit meinem Schlüssel.
	AI_Output(self, hero, "Info_Mod_Sylvio_AtStonehenge_09_01"); //(Zu dem Helden) Tja, wie es aussieht werde ich dir deinen Schlüssel abnehmen müssen. Du hättest dich besser nicht mit mir anlegen sollen.

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_GuildEnemy, 0);
};

INSTANCE Info_Mod_Sylvio_Pickpocket (C_INFO)
{
	npc		= Mod_797_SLD_Sylvio_MT;
	nr		= 1;
	condition	= Info_Mod_Sylvio_Pickpocket_Condition;
	information	= Info_Mod_Sylvio_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_100;
};

FUNC INT Info_Mod_Sylvio_Pickpocket_Condition()
{
	C_Beklauen	(99, ItMi_Gold, 600);
};

FUNC VOID Info_Mod_Sylvio_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Sylvio_Pickpocket);

	Info_AddChoice	(Info_Mod_Sylvio_Pickpocket, DIALOG_BACK, Info_Mod_Sylvio_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Sylvio_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Sylvio_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Sylvio_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Sylvio_Pickpocket);
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

INSTANCE Info_Mod_Sylvio_EXIT (C_INFO)
{
	npc		= Mod_797_SLD_Sylvio_MT;
	nr		= 1;
	condition	= Info_Mod_Sylvio_EXIT_Condition;
	information	= Info_Mod_Sylvio_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Sylvio_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Sylvio_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};