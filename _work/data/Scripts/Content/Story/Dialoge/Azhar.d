INSTANCE Info_Mod_Azhar_Hi (C_INFO)
{
	npc		= Mod_7138_ASS_Azhar_NW;
	nr		= 1;
	condition	= Info_Mod_Azhar_Hi_Condition;
	information	= Info_Mod_Azhar_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo! Na'im schickt mich. Du hast wohl ein Problem.";
};

FUNC INT Info_Mod_Azhar_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Naim_Hi))
	&& (Mod_ASS_Krieger == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Azhar_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Azhar_Hi_15_00"); //Hallo! Na'im schickt mich. Du hast wohl ein Problem.
	AI_Output(self, hero, "Info_Mod_Azhar_Hi_04_01"); //Was die erzählen. Es ist nichts. Jedenfalls im Moment nicht. Später vielleicht.
	AI_Output(hero, self, "Info_Mod_Azhar_Hi_15_02"); //Verstehe. Bis dann.
};

INSTANCE Info_Mod_Azhar_Later (C_INFO)
{
	npc		= Mod_7138_ASS_Azhar_NW;
	nr		= 1;
	condition	= Info_Mod_Azhar_Later_Condition;
	information	= Info_Mod_Azhar_Later_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Azhar_Later_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Azhar_Hi))
	&& (Mod_ASS_Krieger == 1)
	&& (Kapitel >= 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Azhar_Later_Info()
{
	AI_Output(self, hero, "Info_Mod_Azhar_Later_04_00"); //Bei Beliar! Wo schleichst du rum?
	AI_Output(hero, self, "Info_Mod_Azhar_Later_15_01"); //Man hat ja auch noch anderes zu tun. Wo brennt's denn?
	AI_Output(self, hero, "Info_Mod_Azhar_Later_04_02"); //Anderes zu tun? Von einem Anwärter auf die Kriegerschaft erwarte ich volle Bereitschaft.
	AI_Output(self, hero, "Info_Mod_Azhar_Later_04_03"); //Ich frage mich schon, wie du's überhaupt so weit gebracht hast.
	AI_Output(hero, self, "Info_Mod_Azhar_Later_15_04"); //Durch volle Bereitschaft natürlich. Also, was ist los?
	AI_Output(self, hero, "Info_Mod_Azhar_Later_04_05"); //Es geht ein Gerücht um, dass einer der sagenhaften Zeremoniendolche der Alten auf der Insel zu finden ist.
	AI_Output(hero, self, "Info_Mod_Azhar_Later_15_06"); //Ein Zeremoniendolch? Noch nie davon gehört. Was soll ...
	AI_Output(self, hero, "Info_Mod_Azhar_Later_04_07"); //Schweig! Such das Teil und bringe es mir, sonst ist deine Laufbahn bei uns Kriegern beendet!
	AI_Output(hero, self, "Info_Mod_Azhar_Later_15_08"); //Reg dich ab. Ich muss wenigstens wissen, woher dieses Gerücht kommt.
	AI_Output(self, hero, "Info_Mod_Azhar_Later_04_09"); //Amir hat in der Stadt so was gehört. Und nun verschwinde!

	Log_CreateTopic	(TOPIC_MOD_ASS_ZEREMONIENDOLCH, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ASS_ZEREMONIENDOLCH, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ASS_ZEREMONIENDOLCH, "Was ein ungemütlicher Mann, dieser Azhar. Ich soll ihm einen Zeremoniendolch, eine Waffe der Alten, besorgen, der angeblich irgendwo auf Khorinis zu finden ist. Amir hat das Gerücht ins Lager gebracht, vielleicht weiß der Näheres. Müsste am Tempelplatz sein ...");
};

INSTANCE Info_Mod_Azhar_Blutkelch (C_INFO)
{
	npc		= Mod_7138_ASS_Azhar_NW;
	nr		= 1;
	condition	= Info_Mod_Azhar_Blutkelch_Condition;
	information	= Info_Mod_Azhar_Blutkelch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Beliar zum Gruß, Bruder!";
};

FUNC INT Info_Mod_Azhar_Blutkelch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Erol_Blutkelch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Azhar_Blutkelch_Info()
{
	AI_Output(hero, self, "Info_Mod_Azhar_Blutkelch_15_00"); //Beliar zum Gruß, Bruder!
	AI_Output(self, hero, "Info_Mod_Azhar_Blutkelch_04_01"); //Bruder? Ich bin immer noch dein Vorgesetzter. Hast du den Kelch?
	AI_Output(hero, self, "Info_Mod_Azhar_Blutkelch_15_02"); //Nein. Aber hat vielleicht ein anderer Assassine das Teil schon beschafft?
	AI_Output(self, hero, "Info_Mod_Azhar_Blutkelch_04_03"); //Nicht, dass ich wüsste. Mir hat ihn jedenfalls niemand gegeben.
	AI_Output(self, hero, "Info_Mod_Azhar_Blutkelch_04_04"); //Vielleicht hat Mustafa schon den Kelch. Er hat den Auftrag dazu gegeben.
	AI_Output(hero, self, "Info_Mod_Azhar_Blutkelch_15_05"); //Den du umgehend an mich weitergegeben hast.
	AI_Output(self, hero, "Info_Mod_Azhar_Blutkelch_04_06"); //Werd nicht unverschämt, Bursche! Du wolltest doch meine Stimme haben.
	AI_Output(self, hero, "Info_Mod_Azhar_Blutkelch_04_07"); //Die bekommst du natürlich nicht, wenn der Kelch schon im Lager ist.
	AI_Output(hero, self, "Info_Mod_Azhar_Blutkelch_15_08"); //Aber ich bin tagelang über die ganze Insel gelaufen.
	AI_Output(self, hero, "Info_Mod_Azhar_Blutkelch_04_09"); //Dein Pech. Nun sprich mit dem Boss.
	AI_Output(hero, self, "Info_Mod_Azhar_Blutkelch_15_10"); //Du meinst den Rat Mustafa?
	AI_Output(self, hero, "Info_Mod_Azhar_Blutkelch_04_11"); //Wen sonst? Beeil dich.

	B_LogEntry	(TOPIC_MOD_ASS_LASTBLUTKELCH, "Ich soll mich bei Mustafa erkundigen, ob ihm der Kelch bereits gebracht wurde.");
};

INSTANCE Info_Mod_Azhar_Pickpocket (C_INFO)
{
	npc		= Mod_7138_ASS_Azhar_NW;
	nr		= 1;
	condition	= Info_Mod_Azhar_Pickpocket_Condition;
	information	= Info_Mod_Azhar_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Azhar_Pickpocket_Condition()
{
	C_Beklauen	(118, ItMi_Gold, 2000);
};

FUNC VOID Info_Mod_Azhar_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Azhar_Pickpocket);

	Info_AddChoice	(Info_Mod_Azhar_Pickpocket, DIALOG_BACK, Info_Mod_Azhar_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Azhar_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Azhar_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Azhar_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Azhar_Pickpocket);
};

FUNC VOID Info_Mod_Azhar_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Azhar_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Azhar_Pickpocket);

		Info_AddChoice	(Info_Mod_Azhar_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Azhar_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Azhar_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Azhar_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Azhar_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Azhar_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Azhar_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Azhar_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Azhar_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Azhar_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Azhar_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Azhar_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Azhar_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Azhar_EXIT (C_INFO)
{
	npc		= Mod_7138_ASS_Azhar_NW;
	nr		= 1;
	condition	= Info_Mod_Azhar_EXIT_Condition;
	information	= Info_Mod_Azhar_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Azhar_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Azhar_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};