INSTANCE Info_Mod_HofstaatDrogenminister_Hi (C_INFO)
{
	npc		= Mod_7288_HS_Drogenminister_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatDrogenminister_Hi_Condition;
	information	= Info_Mod_HofstaatDrogenminister_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatDrogenminister_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HofstaatGleichgewichtsminister_Drogenminister))
	&& ((Npc_HasItems(hero, ItMi_FreudenspenderSporen) == 1)
	|| (Npc_HasItems(hero, ItMi_FakeFreudenspenderSporen) == 1))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatDrogenminister_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatDrogenminister_Hi_04_00"); //Was willst du?
	AI_Output(hero, self, "Info_Mod_HofstaatDrogenminister_Hi_15_01"); //Ich soll diese Sporen hier vorbeibringen.

	if (Npc_HasItems(hero, ItMi_FreudenspenderSporen) == 1)
	{
		B_GiveInvItems	(hero, self, ItMi_FreudenspenderSporen, 1);
	}
	else
	{
		B_GiveInvItems	(hero, self, ItMi_FakeFreudenspenderSporen, 1);
	};

	AI_Output(self, hero, "Info_Mod_HofstaatDrogenminister_Hi_04_02"); //Aaaaahh ausgezeichnet.

	if (Npc_HasItems(self, ItMi_FreudenspenderSporen) == 1)
	{
		AI_Output(hero, self, "Info_Mod_HofstaatDrogenminister_Hi_15_03"); //Was hat es denn jetzt mit dieser Droge auf sich?
		AI_Output(self, hero, "Info_Mod_HofstaatDrogenminister_Hi_04_04"); //Wie du sicherlich gesehen hast bauen wir Getreide an.
		AI_Output(self, hero, "Info_Mod_HofstaatDrogenminister_Hi_04_05"); //Diese Sporen sind die Sporen des Mutterkornpilzes. Er setzt sich am Getreide ab und wächst dort.
		AI_Output(self, hero, "Info_Mod_HofstaatDrogenminister_Hi_04_06"); //Wir ernten ihn und verarbeiten ihn und erhalten so ein starkes Halluzinogen, stärker und billiger als all die andren Rauschmittel.
		AI_Output(hero, self, "Info_Mod_HofstaatDrogenminister_Hi_15_07"); //Hast du noch was für mich zu tun?
		AI_Output(self, hero, "Info_Mod_HofstaatDrogenminister_Hi_04_08"); //Ja, bring dem König diese Aufzeichnungen.

		B_GiveInvItems	(self, hero, ItWr_HSAufzeichnung, 1);

		AI_Output(hero, self, "Info_Mod_HofstaatDrogenminister_Hi_15_09"); //Mach ich.

		AI_StopProcessInfos	(self);

		B_StartOtherRoutine	(Mod_7285_HS_Koenig_REL, "FREIFLUSS");
		B_StartOtherRoutine	(Mod_7284_HS_Raufbold_REL, "FREIFLUSS");

		B_LogEntry	(TOPIC_MOD_SEKTE_ENTSCHEIDUNG, "Der Drogenminister hat mir Aufzeichnungen für den König mitgegeben. Die sollte ich dort wohl baldmöglichst abliefern.");
	}
	else
	{
		AI_StopProcessInfos	(self);

		B_LogEntry	(TOPIC_MOD_SEKTE_ENTSCHEIDUNG, "Das Paket ist abgeliefert. Ich sollte morgen mal in der Festung vorbei sehen ...");

		Mod_SL_Schwaechen = 6;

		Mod_SL_HofstaatFutsch = Wld_GetDay();
	};
};

INSTANCE Info_Mod_HofstaatDrogenminister_Maler (C_INFO)
{
	npc		= Mod_7288_HS_Drogenminister_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatDrogenminister_Maler_Condition;
	information	= Info_Mod_HofstaatDrogenminister_Maler_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du hast die ... Meisterwerke für den König gemalt?";
};

FUNC INT Info_Mod_HofstaatDrogenminister_Maler_Condition()
{
	if (Mod_SL_Meer == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatDrogenminister_Maler_Info()
{
	AI_Output(hero, self, "Info_Mod_HofstaatDrogenminister_Maler_15_00"); //Du hast die ... Meisterwerke für den König gemalt?
	AI_Output(self, hero, "Info_Mod_HofstaatDrogenminister_Maler_04_01"); //Oh ja, die Kunst ist meine Obsession.
	AI_Output(hero, self, "Info_Mod_HofstaatDrogenminister_Maler_15_02"); //Könntest du mir ein Bild malen?
	AI_Output(self, hero, "Info_Mod_HofstaatDrogenminister_Maler_04_03"); //Eine Sonderanfertigung? Was soll ich dir malen?
	AI_Output(hero, self, "Info_Mod_HofstaatDrogenminister_Maler_15_04"); //Ein Landschaftsbild.
	AI_Output(self, hero, "Info_Mod_HofstaatDrogenminister_Maler_04_05"); //Wovon?
	AI_Output(hero, self, "Info_Mod_HofstaatDrogenminister_Maler_15_06"); //Von dem Sumpf. Du findest ihn in der ehemaligen Minenkolonie.
	AI_Output(self, hero, "Info_Mod_HofstaatDrogenminister_Maler_04_07"); //Na gut. Komm morgen wieder, da sollte ich zurück sein. Samt Bild.

	Mod_SL_BildMalTag = Wld_GetDay();

	B_LogEntry	(TOPIC_MOD_SEKTE_ENTSCHEIDUNG, "Morgen kann ich das Gemälde beim Dorgenminister abholen.");
};

INSTANCE Info_Mod_HofstaatDrogenminister_BildFertig (C_INFO)
{
	npc		= Mod_7288_HS_Drogenminister_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatDrogenminister_BildFertig_Condition;
	information	= Info_Mod_HofstaatDrogenminister_BildFertig_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatDrogenminister_BildFertig_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HofstaatDrogenminister_Maler))
	&& (Wld_GetDay() > Mod_SL_BildMalTag)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatDrogenminister_BildFertig_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatDrogenminister_BildFertig_04_00"); //Hier, dein Bild.

	B_GiveInvItems	(self, hero, ItMi_StrandBild, 1);

	AI_Output(self, hero, "Info_Mod_HofstaatDrogenminister_BildFertig_04_01"); //Das Ist ein Kuuuuuuuuuuuuuuuuuuuuuunstwerk!!!
	AI_Output(hero, self, "Info_Mod_HofstaatDrogenminister_BildFertig_15_02"); //Vielen Dank. Es ist ... umwerfend.

	B_LogEntry	(TOPIC_MOD_SEKTE_ENTSCHEIDUNG, "Ich habe das Gemälde des Drogenministers. Hoffentlich ist der König nicht zu anspruchsvoll.");
};

INSTANCE Info_Mod_HofstaatDrogenminister_Spezialauftrag (C_INFO)
{
	npc		= Mod_7288_HS_Drogenminister_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatDrogenminister_Spezialauftrag_Condition;
	information	= Info_Mod_HofstaatDrogenminister_Spezialauftrag_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatDrogenminister_Spezialauftrag_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HofstaatKoenig_Tuersteher))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatDrogenminister_Spezialauftrag_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatDrogenminister_Spezialauftrag_04_00"); //Sehr gut! Ich habe gewartet und du bist gekommen, einfach fabelhaft!
	AI_Output(hero, self, "Info_Mod_HofstaatDrogenminister_Spezialauftrag_15_01"); //Was gibt’s zu tun?
	AI_Output(self, hero, "Info_Mod_HofstaatDrogenminister_Spezialauftrag_04_02"); //Oh, etwas so geheimes und gefährliches, dass nur IHR es tun könnt!
	AI_Output(hero, self, "Info_Mod_HofstaatDrogenminister_Spezialauftrag_15_03"); //Soweit war ich auch schon ...
	AI_Output(self, hero, "Info_Mod_HofstaatDrogenminister_Spezialauftrag_04_04"); //Hier, bringt dieses Päckchen in den Sumpf. Gib es Lester. Und HÜTE dich!

	B_GiveInvItems	(self, hero, ItMi_PaketFuerLester, 1);

	B_LogEntry	(TOPIC_MOD_SEKTE_KING, "Der Spezialauftrag besteht darin, dass ich ein Paket zu Lester bringe. Na toll.");

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_HofstaatDrogenminister_Pickpocket (C_INFO)
{
	npc		= Mod_7288_HS_Drogenminister_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatDrogenminister_Pickpocket_Condition;
	information	= Info_Mod_HofstaatDrogenminister_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_HofstaatDrogenminister_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 100);
};

FUNC VOID Info_Mod_HofstaatDrogenminister_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_HofstaatDrogenminister_Pickpocket);

	Info_AddChoice	(Info_Mod_HofstaatDrogenminister_Pickpocket, DIALOG_BACK, Info_Mod_HofstaatDrogenminister_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_HofstaatDrogenminister_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_HofstaatDrogenminister_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_HofstaatDrogenminister_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_HofstaatDrogenminister_Pickpocket);
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

INSTANCE Info_Mod_HofstaatDrogenminister_EXIT (C_INFO)
{
	npc		= Mod_7288_HS_Drogenminister_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatDrogenminister_EXIT_Condition;
	information	= Info_Mod_HofstaatDrogenminister_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_HofstaatDrogenminister_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_HofstaatDrogenminister_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};