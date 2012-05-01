INSTANCE Info_Mod_Rath_Hi (C_INFO)
{
	npc		= Mod_1308_SLD_Rath_MT;
	nr		= 1;
	condition	= Info_Mod_Rath_Hi_Condition;
	information	= Info_Mod_Rath_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Rath_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Rath_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Rath_Hi_08_01"); //Ich bin Rath. Was willst du?
};

INSTANCE Info_Mod_Rath_Sumpfkraut (C_INFO)
{
	npc		= Mod_1308_SLD_Rath_MT;
	nr		= 1;
	condition	= Info_Mod_Rath_Sumpfkraut_Condition;
	information	= Info_Mod_Rath_Sumpfkraut_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab hier 'ne Lieferung Sumpfkraut.";
};

FUNC INT Info_Mod_Rath_Sumpfkraut_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Rath_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Namib_Dealer))
	&& (Npc_HasItems(hero, ItMi_HerbPaket) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rath_Sumpfkraut_Info()
{
	AI_Output(hero, self, "Info_Mod_Rath_Sumpfkraut_15_00"); //Ich hab hier 'ne Lieferung Sumpfkraut.
	AI_Output(self, hero, "Info_Mod_Rath_Sumpfkraut_08_01"); //Sumpfkraut? Was will ich mit dem Scheiß?
	AI_Output(hero, self, "Info_Mod_Rath_Sumpfkraut_15_02"); //Baal Namib hat gesagt, ich solle es bei dir abliefern.
	AI_Output(self, hero, "Info_Mod_Rath_Sumpfkraut_08_03"); //(lacht, bricht mitten drin aber ab) Du meinst das ernst, oder?
	AI_Output(hero, self, "Info_Mod_Rath_Sumpfkraut_15_04"); //Wenn dem so wäre?
	AI_Output(self, hero, "Info_Mod_Rath_Sumpfkraut_08_05"); //Das ist zu komisch (lacht) Kein Mensch raucht heute noch Sumpfkraut!
	AI_Output(self, hero, "Info_Mod_Rath_Sumpfkraut_08_06"); //Das Zeug ist schweineteuer und du bist danach gerade mal für 'ne Stunde high.
	AI_Output(self, hero, "Info_Mod_Rath_Sumpfkraut_08_07"); //Ich sag's dir, die Zukunft liegt in Freudenspender.
	AI_Output(hero, self, "Info_Mod_Rath_Sumpfkraut_15_08"); //Freudenspender? Was ist das schon wieder?
	AI_Output(self, hero, "Info_Mod_Rath_Sumpfkraut_08_09"); //Wohnst du hinterm Mond? Freudenspender ist DIE neue Droge. Billig, stark und schnell.
	AI_Output(self, hero, "Info_Mod_Rath_Sumpfkraut_08_10"); //Da kann Sumpfkraut in keiner Beziehung mithalten!
	AI_Output(hero, self, "Info_Mod_Rath_Sumpfkraut_15_11"); //Soso ... und woher bekommt ihr dieses Freudenspender?
	AI_Output(self, hero, "Info_Mod_Rath_Sumpfkraut_08_12"); //In Khorata wird dir das Ganze nachgeschmissen. Da ist so 'n Typ am Marktplatz, der das so gut wie verschenkt.

	B_LogEntry	(TOPIC_MOD_SEKTE_DEALER, "Rath findet es sehr amüsant, dass ich ihm Sumpfkraut verkaufen wollte. Er meint, dass Sumpfkraut nicht mehr geraucht wird, da es viel zu teuer ist. Die neue Droge heißt Freudenspender, welches ein Typ auf dem Marktplatz von Khorata verkauft. Ich sollte Baal Namib davon berichten.");
};

INSTANCE Info_Mod_Rath_Training (C_INFO)
{
	npc		= Mod_1308_SLD_Rath_MT;
	nr		= 1;
	condition	= Info_Mod_Rath_Training_Condition;
	information	= Info_Mod_Rath_Training_Info;
	permanent	= 0;
	important	= 0;
	description	= "Das Training bei Patrick wartet.";
};

FUNC INT Info_Mod_Rath_Training_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Patrick_Training))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rath_Training_Info()
{
	AI_Output(hero, self, "Info_Mod_Rath_Training_15_00"); //Das Training bei Patrick wartet.
	AI_Output(self, hero, "Info_Mod_Rath_Training_08_01"); //Ohh, man, das muss jetzt aber echt nicht sein. Ich geh ein andermal.

	Info_ClearChoices	(Info_Mod_Rath_Training);

	Info_AddChoice	(Info_Mod_Rath_Training, "Dann muss ich deinem Willen vielleicht mit einigen Schlägen nachhelfen.", Info_Mod_Rath_Training_B);

	if (Npc_HasItems(hero, ItMi_Gold) >= 100)
	{
		Info_AddChoice	(Info_Mod_Rath_Training, "Ich gebe dir 100 Goldmünzen. Was sagst du?", Info_Mod_Rath_Training_A);
	};
};

FUNC VOID Info_Mod_Rath_Training_B()
{
	AI_Output(hero, self, "Info_Mod_Rath_Training_B_15_00"); //Dann muss ich deinem Willen vielleicht mit einigen Schlägen nachhelfen.
	AI_Output(self, hero, "Info_Mod_Rath_Training_B_08_01"); //Du Wicht willst dich mit mir anlegen?! Komm her!

	Info_ClearChoices	(Info_Mod_Rath_Training);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_None, 0);

	Mod_SLD_Rath = 2;
};

FUNC VOID Info_Mod_Rath_Training_A()
{
	AI_Output(hero, self, "Info_Mod_Rath_Training_A_15_00"); //Ich gebe dir 100 Goldmünzen. Was sagst du?
	AI_Output(self, hero, "Info_Mod_Rath_Training_A_08_01"); //100 Goldmünzen? Was will ich damit. Ne, wenn du mir 5 grüne Novizen, oder 12 normale Sumpfkrautstängel besorgst, bin ich dabei.

	Info_ClearChoices	(Info_Mod_Rath_Training);

	Mod_SLD_Rath = 1;
};

INSTANCE Info_Mod_Rath_Joints (C_INFO)
{
	npc		= Mod_1308_SLD_Rath_MT;
	nr		= 1;
	condition	= Info_Mod_Rath_Joints_Condition;
	information	= Info_Mod_Rath_Joints_Info;
	permanent	= 1;
	important	= 0;
	description	= "Hier hast du ...";
};

FUNC INT Info_Mod_Rath_Joints_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Rath_Training))
	&& (Mod_SLD_Rath == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rath_Joints_Info()
{
	AI_Output(hero, self, "Info_Mod_Rath_Joints_15_00"); //Hier hast du ...
	
	Info_ClearChoices	(Info_Mod_Rath_Joints);

	Info_AddChoice	(Info_Mod_Rath_Joints, DIALOG_BACK, Info_Mod_Rath_Joints_C);

	if (Npc_HasItems(hero, ItMi_Joint) >= 12)
	{
		Info_AddChoice	(Info_Mod_Rath_Joints, "... 12 Stängel Sumpfkraut", Info_Mod_Rath_Joints_B);
	};
	if (Npc_HasItems(hero, ItMi_Addon_Joint_01) >= 5)
	{
		Info_AddChoice	(Info_Mod_Rath_Joints, "... 5 grüne Novizen", Info_Mod_Rath_Joints_A);
	};
};

FUNC VOID Info_Mod_Rath_Joints_C()
{
	Info_ClearChoices	(Info_Mod_Rath_Joints);
};

FUNC VOID Info_Mod_Rath_Joints_D()
{
	AI_Output(self, hero, "Info_Mod_Rath_Joints_D_08_00"); //Ausgezeichnet. Du scheinst tatsächlich noch nicht lange im Lager zu sein. Für so viel Sumpfkraut würde ich es sogar mit zwei Trollen auf einmal aufnehmen.

	Info_ClearChoices	(Info_Mod_Rath_Joints);

	AI_StopProcessInfos	(self);

	Mod_SLD_Rath = 3;

	B_LogEntry	(TOPIC_MOD_SLD_PATRICK, "So, mit etwas Überredungskunst ist Rath unterwegs zum Training.");

	B_StartOtherRoutine	(self, "TRAINING");
};

FUNC VOID Info_Mod_Rath_Joints_B()
{
	AI_Output(hero, self, "Info_Mod_Rath_Joints_B_15_00"); //... 12 Stängel Sumpfkraut.

	B_GiveInvItems	(hero, self, ItMi_Joint, 12);

	Info_Mod_Rath_Joints_D();
};

FUNC VOID Info_Mod_Rath_Joints_A()
{
	AI_Output(hero, self, "Info_Mod_Rath_Joints_A_15_00"); //... 5 grüne Novizen.

	B_GiveInvItems	(hero, self, ItMi_Addon_Joint_01, 5);

	Info_Mod_Rath_Joints_D();
};

INSTANCE Info_Mod_Rath_Umgehauen (C_INFO)
{
	npc		= Mod_1308_SLD_Rath_MT;
	nr		= 1;
	condition	= Info_Mod_Rath_Umgehauen_Condition;
	information	= Info_Mod_Rath_Umgehauen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Rath_Umgehauen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Rath_Training))
	&& (Mod_SLD_Rath == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rath_Umgehauen_Info()
{
	if (self.aivar[AIV_LastPlayerAR] == AR_NONE) //Kampf aus Dialog heraus.
	{
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output(self, hero, "Info_Mod_Rath_Umgehauen_08_00"); //Verdammt, mein Rücken ...
			AI_Output(hero, self, "Info_Mod_Rath_Umgehauen_15_01"); //Na, ein bisschen Training wird deinem Rücken bestimmt gut tun.
			AI_Output(self, hero, "Info_Mod_Rath_Umgehauen_08_02"); //Jaja, ich geh ja schon.

			Mod_SLD_Rath = 3;

			B_LogEntry	(TOPIC_MOD_SLD_PATRICK, "So, mit etwas Überredungskunst ist Rath unterwegs zum Training.");

			B_StartOtherRoutine	(self, "TRAINING");
		}
		else if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
		{
			AI_Output(self, hero, "Info_Mod_Rath_Umgehauen_08_03"); //Nichts mit Trainig.

			Mod_SLD_Rath = 1;
		};
							
		// ------ In jedem Fall: Arena-Kampf abgeschlossen ------
		self.aivar[AIV_ArenaFight] = AF_NONE;
		
		// ------ AIVAR resetten! ------	
		self.aivar[AIV_LastFightComment] = TRUE;
	};
};

INSTANCE Info_Mod_Rath_Pickpocket (C_INFO)
{
	npc		= Mod_1308_SLD_Rath_MT;
	nr		= 1;
	condition	= Info_Mod_Rath_Pickpocket_Condition;
	information	= Info_Mod_Rath_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Rath_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 100);
};

FUNC VOID Info_Mod_Rath_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Rath_Pickpocket);

	Info_AddChoice	(Info_Mod_Rath_Pickpocket, DIALOG_BACK, Info_Mod_Rath_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Rath_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Rath_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Rath_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Rath_Pickpocket);
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

INSTANCE Info_Mod_Rath_EXIT (C_INFO)
{
	npc		= Mod_1308_SLD_Rath_MT;
	nr		= 1;
	condition	= Info_Mod_Rath_EXIT_Condition;
	information	= Info_Mod_Rath_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Rath_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Rath_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};