INSTANCE Info_Mod_Sentenza_Hi (C_INFO)
{
	npc		= Mod_796_SLD_Sentenza_MT;
	nr		= 1;
	condition	= Info_Mod_Sentenza_Hi_Condition;
	information	= Info_Mod_Sentenza_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Sentenza_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Kagan_Isidro))
	&& (Npc_HasItems(hero, ItMi_Addon_Joint_01) >= 6)
	&& (Npc_HasItems(hero, ItMi_Addon_Joint_02) >= 6)
	&& (Npc_HasItems(hero, ItMi_Traumruf) >= 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sentenza_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Sentenza_Hi_09_00"); //Ich habe gehört, dass du einige Sumpfkrautstängel von Baal Kagan bekommen hast. Lass mal sehen.
	AI_Output(self, hero, "Info_Mod_Sentenza_Hi_09_01"); //(zu sich selbst) Ahh, 10 Stängel.

	Npc_RemoveInvItems	(hero, ItMi_Addon_Joint_01, 5);
	Npc_RemoveInvItems	(hero, ItMi_Addon_Joint_02, 4);
	Npc_RemoveInvItems	(hero, ItMi_Traumruf, 1);

	B_ShowGivenThings	("10 Stängel Sumpfkraut gegeben");

	AI_Output(self, hero, "Info_Mod_Sentenza_Hi_09_02"); //(Zu dem Helden) Ok, du kannst jetzt weitermachen.
};

INSTANCE Info_Mod_Sentenza_Killer (C_INFO)
{
	npc		= Mod_796_SLD_Sentenza_MT;
	nr		= 1;
	condition	= Info_Mod_Sentenza_Killer_Condition;
	information	= Info_Mod_Sentenza_Killer_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Sentenza_Killer_Condition()
{
	if (Mod_SLD_Spy == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sentenza_Killer_Info()
{
	AI_Output(self, hero, "Info_Mod_Sentenza_Killer_09_00"); //Du brauchst nichts zu sagen, ich weiß bereits, worum es geht. Weißt du, vielleicht können wir den Angriff noch abwenden.
	AI_Output(self, hero, "Info_Mod_Sentenza_Killer_09_01"); //Du brauchst nur dieses blutige Schwert und dieses Schreiben zu nehmen und beides in Cutters Truhe zu schmuggeln und Gerüchte über ihn zu verbreiten, damit seine Truhe auch auf jeden Fall inspiziert wird.
	AI_Output(hero, self, "Info_Mod_Sentenza_Killer_15_02"); //Ich hatte gar nicht erwähnt, dass Cutter der Zeuge ... du hast den Mord verübt.
	AI_Output(self, hero, "Info_Mod_Sentenza_Killer_09_03"); //Na und wenn schon.
	AI_Output(self, hero, "Info_Mod_Sentenza_Killer_09_04"); //Wenn du dicht hältst, Lee kein Sterbenswörtchen von der ganzen Sache erzählst und schön deine Aufgabe erledigst, kommt keiner zu Schaden und für dich springt dabei auch was raus. Also?

	Info_ClearChoices	(Info_Mod_Sentenza_Killer);

	Info_AddChoice	(Info_Mod_Sentenza_Killer, "Nein, für solche dreckigen Spielchen lasse ich mich nicht einspannen.", Info_Mod_Sentenza_Killer_B);
	Info_AddChoice	(Info_Mod_Sentenza_Killer, "Ok, ich mach’s.", Info_Mod_Sentenza_Killer_A);
};

FUNC VOID Info_Mod_Sentenza_Killer_B()
{
	AI_Output(hero, self, "Info_Mod_Sentenza_Killer_B_15_00"); //Nein, für solche dreckigen Spielchen lasse ich mich nicht einspannen.
	AI_Output(self, hero, "Info_Mod_Sentenza_Killer_B_09_01"); //Na schön. Aber das wirst du noch bereuen.

	Mod_SLD_Spy = 1;
	
	Info_ClearChoices	(Info_Mod_Sentenza_Killer);
};

FUNC VOID Info_Mod_Sentenza_Killer_A()
{
	AI_Output(hero, self, "Info_Mod_Sentenza_Killer_A_15_00"); //Ok, ich mach’s.
	AI_Output(self, hero, "Info_Mod_Sentenza_Killer_A_09_01"); //Gut. Du weißt, was du zu tun hast.

	CreateInvItems	(hero, ItMw_BloodySword, 1);
	CreateInvItems	(hero, ItWr_SentenzaForCutter, 1);

	B_ShowGivenThings	("Blutiges Schwert und Zettel erhalten");

	Mod_SLD_Spy = 5;

	B_LogEntry	(TOPIC_MOD_SLD_SPY, "Ich habe von Sentenza ein blutiges Schwert erhalten und ein Schreiben, welche ich in Cutters Truhe schmuggeln soll. Danach muss ich unter den Schatten nur noch das Gerücht verbreiten, Cutter hätte selbst etwas mit Bullit’s Ableben zu tun.");
	
	Info_ClearChoices	(Info_Mod_Sentenza_Killer);
};

INSTANCE Info_Mod_Sentenza_Cutter (C_INFO)
{
	npc		= Mod_796_SLD_Sentenza_MT;
	nr		= 1;
	condition	= Info_Mod_Sentenza_Cutter_Condition;
	information	= Info_Mod_Sentenza_Cutter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe alles getan, wie du mir aufgetragen hast.";
};

FUNC INT Info_Mod_Sentenza_Cutter_Condition()
{
	if (Mod_SLD_Spy == 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sentenza_Cutter_Info()
{
	AI_Output(hero, self, "Info_Mod_Sentenza_Cutter_15_00"); //Ich habe alles getan, wie du mir aufgetragen hast.
	AI_Output(self, hero, "Info_Mod_Sentenza_Cutter_09_01"); //Sehr gut. Das wird einigen Ärger ersparen. Hier, nimm das Gold als Belohnung.

	B_ShowGivenThings	("400 Gold und 12 Erz erhalten");

	CreateInvItems	(hero, ItMi_Gold, 400);
	CreateInvItems	(hero, ItMi_Nugget, 12);

	Mod_SLD_Spy = 8;

	AI_Output(self, hero, "Info_Mod_Sentenza_Cutter_09_02"); //Deiner Aufnahme in die Reihen der Orkjäger bist du damit ein ganzes Stücke näher gekommen. Weiter so.

	B_GivePlayerXP	(600);

	B_SetTopicStatus	(TOPIC_MOD_SLD_SPY, LOG_SUCCESS);
};

INSTANCE Info_Mod_Sentenza_Bruce (C_INFO)
{
	npc		= Mod_796_SLD_Sentenza_MT;
	nr		= 1;
	condition	= Info_Mod_Sentenza_Bruce_Condition;
	information	= Info_Mod_Sentenza_Bruce_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Sentenza_Bruce_Condition()
{
	if (Mod_NL_BruceTot == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sentenza_Bruce_Info()
{
	AI_Output(self, hero, "Info_Mod_Sentenza_Bruce_09_00"); //Hey, du bist doch ein fitter Bursche, oder? Ja, das bist du. Viel herumgekommen und kampferfahren.
	AI_Output(hero, self, "Info_Mod_Sentenza_Bruce_15_01"); //Worum geht es?
	AI_Output(self, hero, "Info_Mod_Sentenza_Bruce_09_02"); //Nun, vor einiger Zeit war ich vor dem Lager Viecher jagen. Da ist mir einer dieser Bluthunde begegnet.
	AI_Output(self, hero, "Info_Mod_Sentenza_Bruce_09_03"); //Ich bin sofort mit dem Schwert auf das Vieh los, und habe es ihm in den Körper gerammt.
	AI_Output(self, hero, "Info_Mod_Sentenza_Bruce_09_04"); //Leider hat das Dreckvieh sich dabei ruckartig weggedreht und ist mit samt meinem Schwert im Körper weggelaufen.
	AI_Output(self, hero, "Info_Mod_Sentenza_Bruce_09_05"); //Es hat den Weg vor unserem Lager nach oben genommen, hat sich wahrscheinlich in seiner Höhle verkrochen.
	AI_Output(self, hero, "Info_Mod_Sentenza_Bruce_09_06"); //Nun war dieses Schwert aber ein Familienerbstück, habe seit meiner Jugend nur damit gekämpft.
	AI_Output(self, hero, "Info_Mod_Sentenza_Bruce_09_07"); //Ich möchte es unbedingt wiederhaben.
	AI_Output(hero, self, "Info_Mod_Sentenza_Bruce_15_08"); //Und ich soll es dir beschaffen.
	AI_Output(self, hero, "Info_Mod_Sentenza_Bruce_09_09"); //Ja, genau. Ich würde dafür auch einen fetten Batzen Erz springen lassen ... das ist mir die Klinge allemal Wert.
	AI_Output(hero, self, "Info_Mod_Sentenza_Bruce_15_10"); //Ok, mal schauen was sich machen lässt.
	AI_Output(self, hero, "Info_Mod_Sentenza_Bruce_09_11"); //Großartig! Ich zähl auf dich.

	Log_CreateTopic	(TOPIC_MOD_NL_SENTENZAKLINGE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_NL_SENTENZAKLINGE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_NL_SENTENZAKLINGE, "Sentenza hat mir davon berichtet, dass er bei einem Kampf sein geliebtes Schwert in einen Bluthund bohrte und das Vieh mitsamt seinem Schwert davon lief. Es soll den Weg vor dem Lager nach oben genommen haben und sitzt dort wahrscheinlich in einer Höhle. Er versprach mir eine große Belohnung, wenn ich ihm die Waffe wiederbesorge, da er sehr an ihr zu hängen scheint.");

	Wld_InsertNpc	(Mod_7641_BUD_Buddler_MT, "OC1");
	B_KillNpc	(Mod_7641_BUD_Buddler_MT);
};

INSTANCE Info_Mod_Sentenza_Pickpocket (C_INFO)
{
	npc		= Mod_796_SLD_Sentenza_MT;
	nr		= 1;
	condition	= Info_Mod_Sentenza_Pickpocket_Condition;
	information	= Info_Mod_Sentenza_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Sentenza_Pickpocket_Condition()
{
	C_Beklauen	(79, ItMi_Gold, 21);
};

FUNC VOID Info_Mod_Sentenza_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Sentenza_Pickpocket);

	Info_AddChoice	(Info_Mod_Sentenza_Pickpocket, DIALOG_BACK, Info_Mod_Sentenza_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Sentenza_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Sentenza_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Sentenza_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Sentenza_Pickpocket);
};

FUNC VOID Info_Mod_Sentenza_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Sentenza_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Sentenza_Pickpocket);

		Info_AddChoice	(Info_Mod_Sentenza_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Sentenza_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Sentenza_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Sentenza_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Sentenza_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Sentenza_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Sentenza_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Sentenza_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Sentenza_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Sentenza_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Sentenza_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Sentenza_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Sentenza_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Sentenza_EXIT (C_INFO)
{
	npc		= Mod_796_SLD_Sentenza_MT;
	nr		= 1;
	condition	= Info_Mod_Sentenza_EXIT_Condition;
	information	= Info_Mod_Sentenza_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Sentenza_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Sentenza_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};