INSTANCE Info_Mod_Joru_Hi (C_INFO)
{
	npc		= Mod_2013_PSINOV_Joru_MT;
	nr		= 1;
	condition	= Info_Mod_Joru_Hi_Condition;
	information	= Info_Mod_Joru_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Joru_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Joru_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Joru_Hi_07_00"); //Oh, du bist zurück? Hier hat sich einiges getan, seit du das letzte Mal da warst.
};

INSTANCE Info_Mod_Joru_Sumpfmensch (C_INFO)
{
	npc		= Mod_2013_PSINOV_Joru_MT;
	nr		= 1;
	condition	= Info_Mod_Joru_Sumpfmensch_Condition;
	information	= Info_Mod_Joru_Sumpfmensch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Joru_Sumpfmensch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Balor_Sumpfmensch2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Joru_Sumpfmensch_Info()
{
	AI_Output(self, hero, "Info_Mod_Joru_Sumpfmensch_07_00"); //Da bist du ja! Sieh dir nur diesen Schlamassel an!!!
	AI_Output(hero, self, "Info_Mod_Joru_Sumpfmensch_15_01"); //Was ist denn los?
	AI_Output(self, hero, "Info_Mod_Joru_Sumpfmensch_07_02"); //Es wurde gestorben und der Templer hier war involviert! Vielmehr weiß ich auch noch nicht! Die Leute hier sprechen alle von dem "heulenden Sumpfmenschen".
	AI_Output(self, hero, "Info_Mod_Joru_Sumpfmensch_07_03"); //Und dann schreien sie mir ins Ohr! Was soll das alles überhaupt? Und ich hab' heute noch nicht einmal einen Stängel geraucht. Als wegen des "Heulenden Sumpfmenschen".
	AI_Output(self, hero, "Info_Mod_Joru_Sumpfmensch_07_04"); //VERDAMMT! Ich brauch jetzt unbedingt etwas Sumpfkraut, das hält ja der sturste Steintroll nicht aus!
	AI_Output(self, hero, "Info_Mod_Joru_Sumpfmensch_07_05"); //Kümmer dich doch bitte um diese unschöne Sache, ja?

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Joru_Sumpfmensch2 (C_INFO)
{
	npc		= Mod_2013_PSINOV_Joru_MT;
	nr		= 1;
	condition	= Info_Mod_Joru_Sumpfmensch2_Condition;
	information	= Info_Mod_Joru_Sumpfmensch2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Joru_Sumpfmensch2_Condition()
{
	if (Mod_Darrion_Sumpfmensch == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Joru_Sumpfmensch2_Info()
{
	AI_Output(hero, self, "Info_Mod_Joru_Sumpfmensch2_15_00"); //...und dann habe ich ihn hierher gebracht.
	AI_Output(self, hero, "Info_Mod_Joru_Sumpfmensch2_07_01"); //Das wird ja immer verworrener und verwirrender, da schlägt meine Migräne wieder zu... Aus Darrion werden wir wohl in naher Zukunft nichts raus kriegen.
	AI_Output(self, hero, "Info_Mod_Joru_Sumpfmensch2_07_02"); //Diesen Schlüssel hat er verloren. Vielleicht hilft er dir bei deiner Suche nach Informationen.
	
	B_GiveInvItems(self, hero, ItKe_Darrion, 1);
	
	AI_Output(self, hero, "Info_Mod_Joru_Sumpfmensch2_07_03"); //Am besten versuchst du ein paar seiner Freunde zu befragen, während ich mich um diesen fürchterlichen Migräneanfall kümmere.
	
	B_UseItem(self, ItMi_Joint);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
	
	B_LogEntry	(TOPIC_MOD_SL_SUMPFMENSCH, "Darrion ist im Sumpf K.O. gegangen. Ich sollte mich ein wenig mich ein wenig umhören. Vielleicht hat Fortuno noch ein paar Informationen über Darrion.");
};

INSTANCE Info_Mod_Joru_Sumpfmensch3 (C_INFO)
{
	npc		= Mod_2013_PSINOV_Joru_MT;
	nr		= 1;
	condition	= Info_Mod_Joru_Sumpfmensch3_Condition;
	information	= Info_Mod_Joru_Sumpfmensch3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Joru_Sumpfmensch3_Condition()
{
	if (Mod_Darrion_Sumpfmensch == 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Joru_Sumpfmensch3_Info()
{
	var c_npc Joru; Joru = Hlp_GetNpc(Mod_2013_PSINOV_Joru_MT);
	var c_npc Darrion; Darrion = Hlp_GetNpc(Mod_2014_PSINOV_Darrion_MT);

	TRIA_Invite(Darrion);
	TRIA_Start();

	TRIA_Next(Joru);
	
	AI_Output(hero, self, "Info_Mod_Joru_Sumpfmensch3_15_00"); //... und wir sind mit dem Golem hierhergekommen um dir Bericht zu erstatten.
	AI_Output(self, hero, "Info_Mod_Joru_Sumpfmensch3_07_01"); //Soso, verzwickt, verzwackt, verzwuckt, die ganze Geschichte, aber durchaus spannend mit der einen oder anderen Wendung.
	AI_Output(self, hero, "Info_Mod_Joru_Sumpfmensch3_07_02"); //Aber Fakt ist, dass das hier ein Sumpfgolem ist. Ein Monster. Wir müssen es töten. Wobei... eine Frage habe ich noch. Warum heult das Ding überhaupt?
	
	TRIA_Next(Darrion);
	
	AI_Output(self, hero, "Info_Mod_Joru_Sumpfmensch3_11_03"); //Naja... als ich mit ihm Freundschaft geschlossen habe, habe ich ihm einen Namen gegeben... den meines alten Captains.
	AI_Output(self, hero, "Info_Mod_Joru_Sumpfmensch3_11_04"); //Und Ich glaube, er hat versucht, diesen Namen auszusprechen... mehr als Heulen ist aber nie daraus geworden...

	TRIA_Next(Joru);
	
	AI_Output(self, hero, "Info_Mod_Joru_Sumpfmensch3_07_05"); //WAS? Das Ding hat einen Namen? Wie heißt es?
	
	TRIA_Next(Darrion);
	
	AI_Output(self, hero, "Info_Mod_Joru_Sumpfmensch3_11_06"); //Roger...

	TRIA_Next(Joru);
	
	AI_Output(self, hero, "Info_Mod_Joru_Sumpfmensch3_07_07"); //Soso... Fakt ist, das Ding hat einen Namen, es heißt Roger... das heißt, ich kann nicht mehr Monster zu ihm sagen... Roger zu töten wäre eine bodenlose Gemeinheit... da gibt es nur ein Problem...
	AI_Output(hero, self, "Info_Mod_Joru_Sumpfmensch3_15_08"); //Welches?
	AI_Output(self, hero, "Info_Mod_Joru_Sumpfmensch3_07_09"); //Ich glaube nicht, dass wir eine Novizenrobe in seiner Größe haben.
	
	TRIA_Next(Darrion);
	
	AI_Output(self, hero, "Info_Mod_Joru_Sumpfmensch3_11_10"); //Du meinst, Roger kann bleiben und ihr werdet ihm nichts tun?

	TRIA_Next(Joru);
	
	AI_Output(self, hero, "Info_Mod_Joru_Sumpfmensch3_07_11"); //Natürlich nicht! Er muss uns vor den Monstern beschützten. ER MUSS DIE MONSTER TÖTEN! DIE MOOOOOOOOONSTER TÖÖÖÖTEN!

	TRIA_Finish();

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Joru_GotoTempel (C_INFO)
{
	npc		= Mod_2013_PSINOV_Joru_MT;
	nr		= 1;
	condition	= Info_Mod_Joru_GotoTempel_Condition;
	information	= Info_Mod_Joru_GotoTempel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du wirst am Tempel erwartet.";
};

FUNC INT Info_Mod_Joru_GotoTempel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Namib_KarrasDa))
	&& (Npc_KnowsInfo(hero, Info_Mod_Joru_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Joru_GotoTempel_Info()
{
	AI_Output(hero, self, "Info_Mod_Joru_GotoTempel_15_00"); //Du wirst am Tempel erwartet.

	AI_StopProcessInfos	(hero);

	B_StartOtherRoutine	(self, "TEMPEL");
};

INSTANCE Info_Mod_Joru_Woher (C_INFO)
{
	npc		= Mod_2013_PSINOV_Joru_MT;
	nr		= 1;
	condition	= Info_Mod_Joru_Woher_Condition;
	information	= Info_Mod_Joru_Woher_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wieso haben sie dich in die Kolonie gesteckt?";
};

FUNC INT Info_Mod_Joru_Woher_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Joru_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Joru_Woher_Info()
{
	AI_Output(hero, self, "Info_Mod_Joru_Woher_15_00"); //Wieso haben sie dich in die Kolonie gesteckt?
	AI_Output(self, hero, "Info_Mod_Joru_Woher_07_01"); //Weil ich damals, als ich die Prüfung des Feuers abgelegt habe, einen meiner Mitstreiter getötet habe.
	AI_Output(self, hero, "Info_Mod_Joru_Woher_07_02"); //In der Kolonie hab ich mich dann mit Tondral angefreundet und bin mit ihm zusammen dann in die Bruderschaft eingetreten.
	AI_Output(self, hero, "Info_Mod_Joru_Woher_07_03"); //Tondral wurde schon bald zum Baal, ich musste bis zum Tode Y'Berions warten.
};

INSTANCE Info_Mod_Joru_Pickpocket (C_INFO)
{
	npc		= Mod_2013_PSINOV_Joru_MT;
	nr		= 1;
	condition	= Info_Mod_Joru_Pickpocket_Condition;
	information	= Info_Mod_Joru_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_90;
};

FUNC INT Info_Mod_Joru_Pickpocket_Condition()
{
	C_Beklauen	(87, ItMi_Joint, 5);
};

FUNC VOID Info_Mod_Joru_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Joru_Pickpocket);

	Info_AddChoice	(Info_Mod_Joru_Pickpocket, DIALOG_BACK, Info_Mod_Joru_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Joru_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Joru_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Joru_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Joru_Pickpocket);
};

FUNC VOID Info_Mod_Joru_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Joru_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Joru_Pickpocket);

		Info_AddChoice	(Info_Mod_Joru_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Joru_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Joru_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Joru_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Joru_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Joru_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Joru_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Joru_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Joru_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Joru_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Joru_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Joru_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Joru_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Joru_EXIT (C_INFO)
{
	npc		= Mod_2013_PSINOV_Joru_MT;
	nr		= 1;
	condition	= Info_Mod_Joru_EXIT_Condition;
	information	= Info_Mod_Joru_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Joru_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Joru_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};