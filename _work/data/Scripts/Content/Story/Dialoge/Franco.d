INSTANCE Info_Mod_Franco_Hi (C_INFO)
{
	npc		= Mod_952_BDT_Franco_NW;
	nr		= 1;
	condition	= Info_Mod_Franco_Hi_Condition;
	information	= Info_Mod_Franco_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Franco_Hi_Condition()
{
	if (Npc_GetDistToWP(hero, "NW_FARM2_TO_TAVERN_02") < Npc_GetDistToWP(hero, "NW_FARM2_TO_TAVERN_03"))
	&& (!Npc_RefuseTalk(self))
	{
		return 1;
	}
	else
	{
		Npc_SetRefuseTalk (self, 30);
	};
};

FUNC VOID Info_Mod_Franco_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Franco_Hi_25_00"); //Lauf nur fröhlich weiter in dein Verderben.
	AI_Output(hero, self, "Info_Mod_Franco_Hi_15_01"); //Was meinst du damit?
	AI_Output(self, hero, "Info_Mod_Franco_Hi_25_02"); //Probier's aus. Über die Brücke kommst du vielleicht noch, aber bevor du bei Orlan bist, hast du einen Pfeil in der Fresse.
	AI_Output(hero, self, "Info_Mod_Franco_Hi_15_03"); //Hast du etwa Freunde auf der anderen Seite der Brücke?
	AI_Output(self, hero, "Info_Mod_Franco_Hi_25_04"); //(spuckt aus) Pah, Freunde! Dämliche Idioten aus dem Minental sind das.
	AI_Output(self, hero, "Info_Mod_Franco_Hi_25_05"); //Ein ganzer Haufen von denen, dumm wie Brot. Richtige Arschlöcher.
	AI_Output(self, hero, "Info_Mod_Franco_Hi_25_06"); //Kommen vor ein paar Tagen anspaziert und schlagen ihr Lager direkt neben meinem auf.
	AI_Output(self, hero, "Info_Mod_Franco_Hi_25_07"); //Ich habe ihnen klar gemacht, dass das hier MEIN Platz ist, aber ihnen ist dazu nichts Besseres eingefallen, als laut zu lachen.
	AI_Output(hero, self, "Info_Mod_Franco_Hi_15_08"); //Und jetzt bist du so nett und warnst alle, die vorbei kommen?
	AI_Output(self, hero, "Info_Mod_Franco_Hi_25_09"); //Die Penner sollen schön langsam ausbluten. Wenn sie niemanden zum Überfallen haben, werden sie schon wieder abziehen.
	AI_Output(self, hero, "Info_Mod_Franco_Hi_25_10"); //Hast du eigentlich Gold dabei oder irgendwas Wertvolles?
	AI_Output(hero, self, "Info_Mod_Franco_Hi_15_11"); //(leicht ironisch) Nein, tut mir Leid.
	AI_Output(self, hero, "Info_Mod_Franco_Hi_25_12"); //Dann zieh ab.

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Franco_Warnung (C_INFO)
{
	npc		= Mod_952_BDT_Franco_NW;
	nr		= 1;
	condition	= Info_Mod_Franco_Warnung_Condition;
	information	= Info_Mod_Franco_Warnung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich soll dich vor einem Miliztrupp warnen.";
};

FUNC INT Info_Mod_Franco_Warnung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Tom_Hi))
	&& (Mod_Tom_Boese == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Franco_Warnung_Info()
{
	AI_Output(hero, self, "Info_Mod_Franco_Warnung_15_00"); //Ich soll dich vor einem Miliztrupp warnen.
	AI_Output(self, hero, "Info_Mod_Franco_Warnung_25_01"); //Wer sagt das?
	AI_Output(hero, self, "Info_Mod_Franco_Warnung_15_02"); //Tom hat mich geschickt.
	AI_Output(self, hero, "Info_Mod_Franco_Warnung_25_03"); //Gut, dann glaub ich dir. Ich hau mal ab. Sag Tom, dass ich bei Edgor bin.

	B_LogEntry	(TOPIC_MOD_TOMSFREUND, "Franco haut jetzt ab. Ich soll Tom ausrichten, dass er bei Edgor ist.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "BEIFRANCO");

	B_Göttergefallen(3, 1);

	Npc_SetRefuseTalk	(self, 60);
};

INSTANCE Info_Mod_Franco_Scorpio (C_INFO)
{
	npc		= Mod_952_BDT_Franco_NW;
	nr		= 1;
	condition	= Info_Mod_Franco_Scorpio_Condition;
	information	= Info_Mod_Franco_Scorpio_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Banditen sind übrigens weg.";
};

FUNC INT Info_Mod_Franco_Scorpio_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Franco_Hi))
	&& (Mod_Tom_Boese == FALSE)
	&& (Npc_IsDead(Mod_7600_GRD_Scorpio_NW))
	&& (Npc_IsDead(Mod_7601_GRD_Gardist_NW))
	&& (Npc_IsDead(Mod_7602_GRD_Gardist_NW))
	&& (Npc_IsDead(Mod_7603_GRD_Gardist_NW))
	&& (Npc_IsDead(Mod_7604_STT_Schatten_NW))
	&& (Npc_IsDead(Mod_7605_STT_Schatten_NW))
	&& (Npc_IsDead(Mod_7606_STT_Schatten_NW))
	&& (Npc_IsDead(Mod_7607_STT_Schatten_NW))
	&& (Npc_IsDead(Mod_7608_STT_Schatten_NW))
	&& (Npc_IsDead(Mod_7609_STT_Schatten_NW))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Franco_Scorpio_Info()
{
	AI_Output(hero, self, "Info_Mod_Franco_Scorpio_15_00"); //Die Banditen sind übrigens weg.
	AI_Output(self, hero, "Info_Mod_Franco_Scorpio_25_01"); //Was? Jetzt schon? (lacht) Ich sag ja: dumm wie Brot.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Franco_Allein (C_INFO)
{
	npc		= Mod_952_BDT_Franco_NW;
	nr		= 1;
	condition	= Info_Mod_Franco_Allein_Condition;
	information	= Info_Mod_Franco_Allein_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bist du eigentlich ganz allein?";
};

FUNC INT Info_Mod_Franco_Allein_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Franco_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Franco_Allein_Info()
{
	AI_Output(hero, self, "Info_Mod_Franco_Allein_15_00"); //Bist du eigentlich ganz allein?
	AI_Output(self, hero, "Info_Mod_Franco_Allein_25_01"); //Ich bin nur 'n Kundschafter. Meine Leute wollen, dass ich von hier aus die Händler beobachte. Und das mach ich.
	AI_Output(self, hero, "Info_Mod_Franco_Allein_25_02"); //Aber ich bleib eh lieber für mich.
	AI_Output(hero, self, "Info_Mod_Franco_Allein_15_03"); //Ein Einzelgänger, wie?
	AI_Output(self, hero, "Info_Mod_Franco_Allein_25_04"); //Nee. Mit den anderen Deppen kann man nur nichts anfangen. Ich bin ganz froh, wenn ich von denen nichts mitkriege.
};

INSTANCE Info_Mod_Franco_AtEdgor (C_INFO)
{
	npc		= Mod_952_BDT_Franco_NW;
	nr		= 1;
	condition	= Info_Mod_Franco_AtEdgor_Condition;
	information	= Info_Mod_Franco_AtEdgor_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was machst du so?";
};

FUNC INT Info_Mod_Franco_AtEdgor_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Franco_Warnung))
	&& (Npc_RefuseTalk(self) == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Franco_AtEdgor_Info()
{
	AI_Output(hero, self, "Info_Mod_Franco_AtEdgor_15_00"); //Was machst du so?
	AI_Output(self, hero, "Info_Mod_Franco_AtEdgor_25_01"); //Ich denk mir was aus, wie ich Edgor umlegen kann. Der Typ nervt nur mit seinen blöden Befehlen.
};

INSTANCE Info_Mod_Franco_AtEdgor2 (C_INFO)
{
	npc		= Mod_952_BDT_Franco_NW;
	nr		= 1;
	condition	= Info_Mod_Franco_AtEdgor2_Condition;
	information	= Info_Mod_Franco_AtEdgor2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was befiehlt Edgor denn?";
};

FUNC INT Info_Mod_Franco_AtEdgor2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Franco_AtEdgor))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Franco_AtEdgor2_Info()
{
	AI_Output(hero, self, "Info_Mod_Franco_AtEdgor2_15_00"); //Was befiehlt Edgor denn?
	AI_Output(self, hero, "Info_Mod_Franco_AtEdgor2_25_01"); //"Wasch dir vorm Essen die Hände!" "Schnarch nicht so laut!" "Red ordentlich mit mir!" So einen Scheiß halt.
};

INSTANCE Info_Mod_Franco_Pickpocket (C_INFO)
{
	npc		= Mod_952_BDT_Franco_NW;
	nr		= 1;
	condition	= Info_Mod_Franco_Pickpocket_Condition;
	information	= Info_Mod_Franco_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Franco_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 133);
};

FUNC VOID Info_Mod_Franco_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Franco_Pickpocket);

	Info_AddChoice	(Info_Mod_Franco_Pickpocket, DIALOG_BACK, Info_Mod_Franco_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Franco_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Franco_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Franco_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Franco_Pickpocket);
};

FUNC VOID Info_Mod_Franco_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Franco_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Franco_Pickpocket);

		Info_AddChoice	(Info_Mod_Franco_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Franco_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Franco_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Franco_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Franco_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Franco_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Franco_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Franco_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Franco_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Franco_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Franco_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Franco_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Franco_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Franco_EXIT (C_INFO)
{
	npc		= Mod_952_BDT_Franco_NW;
	nr		= 1;
	condition	= Info_Mod_Franco_EXIT_Condition;
	information	= Info_Mod_Franco_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Franco_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Franco_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};