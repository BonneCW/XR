INSTANCE Info_Mod_HofstaatArsch_Hi (C_INFO)
{
	npc		= Mod_7283_HS_Arsch_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatArsch_Hi_Condition;
	information	= Info_Mod_HofstaatArsch_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatArsch_Hi_Condition()
{
	if (Mod_Sekte_Verheiratet == 1)
	|| (Mod_Sekte_TraderHaus01 == 1)
	|| (Mod_Sekte_TraderHaus02 == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatArsch_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatArsch_Hi_16_00"); //(bürokratisch) Ja?

	B_Say (hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_HofstaatArsch_Hi_16_01"); //Ich bin der königliche Arsch.
	AI_Output(self, hero, "Info_Mod_HofstaatArsch_Hi_16_02"); //Wenn sie es hier zu etwas bringen wollen, dann sollten sie es sich nicht mit mir verscheißen.
	AI_Output(self, hero, "Info_Mod_HofstaatArsch_Hi_16_03"); //Der König legt großen Wert auf die Meinung seines Arsches!

	Info_ClearChoices	(Info_Mod_HofstaatArsch_Hi);

	Info_AddChoice	(Info_Mod_HofstaatArsch_Hi, "Dann kannst du doch sicher ein gutes Wort für mich einlegen.", Info_Mod_HofstaatArsch_Hi_B);
	Info_AddChoice	(Info_Mod_HofstaatArsch_Hi, "Das ist nur heiße Luft!", Info_Mod_HofstaatArsch_Hi_A);
};

FUNC VOID Info_Mod_HofstaatArsch_Hi_C()
{
	AI_Output(self, hero, "Info_Mod_HofstaatArsch_Hi_C_16_00"); //Wie dem auch sei, den Raum durchqueren, die Leiter hinauf und dann dort wieder bis zum Ende des Raumes.
	AI_Output(hero, self, "Info_Mod_HofstaatArsch_Hi_C_15_01"); //Was?
	AI_Output(self, hero, "Info_Mod_HofstaatArsch_Hi_C_16_02"); //Dort finden sie den König. Und jetzt lassen sie mich weiterarbeiten.

	B_LogEntry	(TOPIC_MOD_SEKTE_FREUDENSPENDER, "Der Weg zum König des Hofstaates ist frei. Er befindet sich im Stockwerk über mir.");

	Info_ClearChoices	(Info_Mod_HofstaatArsch_Hi);

	AI_StopProcessInfos	(self);
};

FUNC VOID Info_Mod_HofstaatArsch_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_HofstaatArsch_Hi_B_15_00"); //Dann kannst du doch sicher ein gutes Wort für mich einlegen.

	Info_Mod_HofstaatArsch_Hi_C();
};

FUNC VOID Info_Mod_HofstaatArsch_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_HofstaatArsch_Hi_A_15_00"); //Das ist nur heiße Luft!

	Info_Mod_HofstaatArsch_Hi_C();
};

INSTANCE Info_Mod_HofstaatArsch_MagierTermin (C_INFO)
{
	npc		= Mod_7283_HS_Arsch_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatArsch_MagierTermin_Condition;
	information	= Info_Mod_HofstaatArsch_MagierTermin_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich brauche einen Termin beim Hofmagier.";
};

FUNC INT Info_Mod_HofstaatArsch_MagierTermin_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HofstaatKoenig_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatArsch_MagierTermin_Info()
{
	AI_Output(hero, self, "Info_Mod_HofstaatArsch_MagierTermin_15_00"); //Ich brauche einen Termin beim Hofmagier.
	AI_Output(self, hero, "Info_Mod_HofstaatArsch_MagierTermin_16_01"); //Der königliche Hofmagier wird Sie empfangen. Gehen sie in den Turm.

	B_StartOtherRoutine	(Mod_7011_HS_Alex_REL, "MAGIER");

	AI_Teleport	(Mod_7011_HS_Alex_REL, "REL_290");

	B_LogEntry	(TOPIC_MOD_SEKTE_FREUDENSPENDER, "Der Hofmagier wird mich jetzt empfangen.");
};

INSTANCE Info_Mod_HofstaatArsch_Drogenminister (C_INFO)
{
	npc		= Mod_7283_HS_Arsch_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatArsch_Drogenminister_Condition;
	information	= Info_Mod_HofstaatArsch_Drogenminister_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatArsch_Drogenminister_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HofstaatDrogenminister_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatArsch_Drogenminister_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatArsch_Drogenminister_16_00"); //Dienstgrad?
	AI_Output(hero, self, "Info_Mod_HofstaatArsch_Drogenminister_15_01"); //Wie?
	AI_Output(self, hero, "Info_Mod_HofstaatArsch_Drogenminister_16_02"); //Dienstgrad!
	AI_Output(hero, self, "Info_Mod_HofstaatArsch_Drogenminister_15_03"); //Ahm ...
	AI_Output(self, hero, "Info_Mod_HofstaatArsch_Drogenminister_16_04"); //Sind die auf den Mund gefallen? Warten Sie ... Sie sind doch das königliche Mädchen für alles, oder?
	AI_Output(hero, self, "Info_Mod_HofstaatArsch_Drogenminister_15_05"); //Ja.
	AI_Output(self, hero, "Info_Mod_HofstaatArsch_Drogenminister_16_06"); //Falsch. Sie sind mit sofortiger Wirkung ihrem Amt enthoben, direkter Befehl von oben. Sie wurden befördert.
	AI_Output(hero, self, "Info_Mod_HofstaatArsch_Drogenminister_15_07"); //Dann bin ich jetzt die Frau für alles oder was?
	AI_Output(self, hero, "Info_Mod_HofstaatArsch_Drogenminister_16_08"); //Bedaure, der Platz ist schon vergeben, der König braucht zur Zeit kein weiteres Freudenmädchen. Der König sprach, ich zitiere:
	AI_Output(self, hero, "Info_Mod_HofstaatArsch_Drogenminister_06_09"); //(mit Stimme des Königs) Fortan soll es nichtmehr das Amt des königlichen Mädchen für alles sein, das euer Wesen ziert. Ihr habet großes Potential und noch größere Potenz bewiesen.
	AI_Output(self, hero, "Info_Mod_HofstaatArsch_Drogenminister_06_10"); //Alsdann, seied ihr fortan, da ihr Probleme einfach von dem Tisch zu wischen vermagt, als der königliche Kehrwisch bekannt! Senket euer Haupt ... in Stolz!
	AI_Output(hero, self, "Info_Mod_HofstaatArsch_Drogenminister_15_11"); //Zuviel der Ehre. Ich soll diese Aufzeichnungen dem König bringen.
	AI_Output(self, hero, "Info_Mod_HofstaatArsch_Drogenminister_16_12"); //Der ist zurzeit unabkömmlich, er sorgt sich.
	AI_Output(hero, self, "Info_Mod_HofstaatArsch_Drogenminister_15_13"); //Im Thronsaal?
	AI_Output(self, hero, "Info_Mod_HofstaatArsch_Drogenminister_16_14"); //Nein, am Freifluss, in der Nähe der Bauernhöfe.

	B_LogEntry	(TOPIC_MOD_SEKTE_ENTSCHEIDUNG, "Der König sorgt sich in der Nähe der Bauernhöfe am Freifluss. Ich sollte ihn aufsuchen, um ihm die Aufzeichnungen zu zeigen.");
};

INSTANCE Info_Mod_HofstaatArsch_Orakel (C_INFO)
{
	npc		= Mod_7283_HS_Arsch_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatArsch_Orakel_Condition;
	information	= Info_Mod_HofstaatArsch_Orakel_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatArsch_Orakel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HofstaatRaufbold_KoenigHilfe))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatArsch_Orakel_Info()
{
	AI_Output(self, hero, "Info_Mod_HofstaatArsch_Orakel_16_00"); //Was kann ich für Sie tun?
	AI_Output(hero, self, "Info_Mod_HofstaatArsch_Orakel_15_01"); //Ich möchte bei dir einen Termin beim Orakel ausmachen.
	AI_Output(self, hero, "Info_Mod_HofstaatArsch_Orakel_16_02"); //Also so geht das nicht weiter! Haben wir beide schon mal zusammen Schafe gehütet?
	AI_Output(hero, self, "Info_Mod_HofstaatArsch_Orakel_15_03"); //Nicht, dass ich wüsste.
	AI_Output(self, hero, "Info_Mod_HofstaatArsch_Orakel_16_04"); //Dann finde ich es äußerst unangebracht, stets von ihnen geduzt zu werden! Das wird nun augenblicklich unterbunden!

	Info_ClearChoices	(Info_Mod_HofstaatArsch_Orakel);

	Info_AddChoice	(Info_Mod_HofstaatArsch_Orakel, "Garnichts wirst du unterbinden!", Info_Mod_HofstaatArsch_Orakel_B);
	Info_AddChoice	(Info_Mod_HofstaatArsch_Orakel, "Verzeiht, werter Arsch, ich bitte  vielmals um Entschuldigung.", Info_Mod_HofstaatArsch_Orakel_A);
};

FUNC VOID Info_Mod_HofstaatArsch_Orakel_B()
{
	AI_Output(hero, self, "Info_Mod_HofstaatArsch_Orakel_B_15_00"); //Garnichts wirst du unterbinden!
	AI_Output(self, hero, "Info_Mod_HofstaatArsch_Orakel_B_16_01"); //Entschuldigen sie sich augenblicklich, Unhold!
	
	Info_ClearChoices	(Info_Mod_HofstaatArsch_Orakel);

	Info_AddChoice	(Info_Mod_HofstaatArsch_Orakel, "Garnichts werd ich!", Info_Mod_HofstaatArsch_Orakel_D);
	Info_AddChoice	(Info_Mod_HofstaatArsch_Orakel, "Entschuldigung, mir liegt nur das Sie nicht.", Info_Mod_HofstaatArsch_Orakel_C);
};

FUNC VOID Info_Mod_HofstaatArsch_Orakel_A()
{
	AI_Output(hero, self, "Info_Mod_HofstaatArsch_Orakel_A_15_00"); //Verzeiht, werter Arsch, ich bitte  vielmals um Entschuldigung.
	AI_Output(self, hero, "Info_Mod_HofstaatArsch_Orakel_A_16_01"); //Ach, bleiben Sie beim du, das klingt ja furchtbar wenn Sie sich in der gehobenen Sprache versuchen.
	
	Info_ClearChoices	(Info_Mod_HofstaatArsch_Orakel);
};

FUNC VOID Info_Mod_HofstaatArsch_Orakel_D()
{
	AI_Output(hero, self, "Info_Mod_HofstaatArsch_Orakel_D_15_00"); //Garnichts werd ich!
	AI_Output(self, hero, "Info_Mod_HofstaatArsch_Orakel_D_16_01"); //Dieses Gespräch geht erst weiter, wenn du dich entschuldigt hast!
	
	Info_ClearChoices	(Info_Mod_HofstaatArsch_Orakel);

	Mod_SL_Arsch_Entschuldigung = 1;
};

FUNC VOID Info_Mod_HofstaatArsch_Orakel_C()
{
	AI_Output(hero, self, "Info_Mod_HofstaatArsch_Orakel_C_15_00"); //Entschuldigung, mir liegt nur das Sie nicht.
	AI_Output(self, hero, "Info_Mod_HofstaatArsch_Orakel_C_16_01"); //Na gut, dann bleiben Sie beim du.
	
	Info_ClearChoices	(Info_Mod_HofstaatArsch_Orakel);
};

INSTANCE Info_Mod_HofstaatArsch_Entschuldigung (C_INFO)
{
	npc		= Mod_7283_HS_Arsch_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatArsch_Entschuldigung_Condition;
	information	= Info_Mod_HofstaatArsch_Entschuldigung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Entschuldigung, mir liegt nur das Sie nicht.";
};

FUNC INT Info_Mod_HofstaatArsch_Entschuldigung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HofstaatArsch_Orakel))
	&& (Mod_SL_Arsch_Entschuldigung == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatArsch_Entschuldigung_Info()
{
	Info_Mod_HofstaatArsch_Orakel_C();

	Mod_SL_Arsch_Entschuldigung = 0;
};

INSTANCE Info_Mod_HofstaatArsch_OrakelTermin (C_INFO)
{
	npc		= Mod_7283_HS_Arsch_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatArsch_OrakelTermin_Condition;
	information	= Info_Mod_HofstaatArsch_OrakelTermin_Info;
	permanent	= 0;
	important	= 0;
	description	= "Könnte ich jetzt vielleicht mit dem Orakel sprechen?";
};

FUNC INT Info_Mod_HofstaatArsch_OrakelTermin_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_HofstaatArsch_Orakel))
	&& (Mod_SL_Arsch_Entschuldigung == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatArsch_OrakelTermin_Info()
{
	AI_Output(hero, self, "Info_Mod_HofstaatArsch_OrakelTermin_15_00"); //Könnte ich jetzt vielleicht mit dem Orakel sprechen?
	AI_Output(self, hero, "Info_Mod_HofstaatArsch_OrakelTermin_16_01"); //Erst wenn du einen Termin vereinbart hast.
	AI_Output(hero, self, "Info_Mod_HofstaatArsch_OrakelTermin_15_02"); //Wann ist der nächste freie Termin?
	AI_Output(self, hero, "Info_Mod_HofstaatArsch_OrakelTermin_16_03"); //In drei Minuten.
	AI_Output(hero, self, "Info_Mod_HofstaatArsch_OrakelTermin_15_04"); //Dann hätte ich den gern.
	AI_Output(self, hero, "Info_Mod_HofstaatArsch_OrakelTermin_16_05"); //Tut mir leid, der wurde gerade vergeben.
	AI_Output(hero, self, "Info_Mod_HofstaatArsch_OrakelTermin_15_06"); //Gibt es sonst keinen Termin?
	AI_Output(self, hero, "Info_Mod_HofstaatArsch_OrakelTermin_16_07"); //Doch, nach dem Termin in drei Minuten immer.
	AI_Output(hero, self, "Info_Mod_HofstaatArsch_OrakelTermin_15_08"); //Immer? Ach was soll's, den Termin hätt' ich gern.
	AI_Output(self, hero, "Info_Mod_HofstaatArsch_OrakelTermin_16_09"); //Gut, Sie sind eingetragen, aber verpassen Sie ihren Termin nicht.
	AI_Output(hero, self, "Info_Mod_HofstaatArsch_OrakelTermin_15_10"); //Und wo finde ich das Orakel?
	AI_Output(self, hero, "Info_Mod_HofstaatArsch_OrakelTermin_16_11"); //Im Thronsaal. Er wird sie erwarten.

	B_LogEntry	(TOPIC_MOD_SEKTE_ENTSCHEIDUNG, "Ich habe jetzt einen Termin beim Orakel. Es soll im Thronsaal zu finden sein.");
};

INSTANCE Info_Mod_HofstaatArsch_Transportsystem (C_INFO)
{
	npc		= Mod_7283_HS_Arsch_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatArsch_Transportsystem_Condition;
	information	= Info_Mod_HofstaatArsch_Transportsystem_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich suche einen bequemen Weg in die Sümpfe.";
};

FUNC INT Info_Mod_HofstaatArsch_Transportsystem_Condition()
{
	if (Mod_SL_Meer == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatArsch_Transportsystem_Info()
{
	AI_Output(hero, self, "Info_Mod_HofstaatArsch_Transportsystem_15_00"); //Ich suche einen bequemen Weg in die Sümpfe.
	AI_Output(self, hero, "Info_Mod_HofstaatArsch_Transportsystem_16_01"); //Perverser Lüstling! Wenn Sie sich nicht augenblicklich in Luft auflösen bekommen Sie einen Tritt. Einen schmerzhaften. Einen UNGLAUBLICH schmerzhaften!
};

INSTANCE Info_Mod_HofstaatArsch_Liste (C_INFO)
{
	npc		= Mod_7283_HS_Arsch_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatArsch_Liste_Condition;
	information	= Info_Mod_HofstaatArsch_Liste_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_HofstaatArsch_Liste_Condition()
{
	if (Mod_SL_ListeSpawn == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_HofstaatArsch_Liste_Info()
{
	AI_TurnToNpc	(self, Mod_7285_HS_Koenig_REL);

	AI_Output(self, hero, "Info_Mod_HofstaatArsch_Liste_16_00"); //Hier ist die Liste ...

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_HofstaatArsch_Pickpocket (C_INFO)
{
	npc		= Mod_7283_HS_Arsch_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatArsch_Pickpocket_Condition;
	information	= Info_Mod_HofstaatArsch_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_HofstaatArsch_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 100);
};

FUNC VOID Info_Mod_HofstaatArsch_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_HofstaatArsch_Pickpocket);

	Info_AddChoice	(Info_Mod_HofstaatArsch_Pickpocket, DIALOG_BACK, Info_Mod_HofstaatArsch_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_HofstaatArsch_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_HofstaatArsch_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_HofstaatArsch_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_HofstaatArsch_Pickpocket);
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

INSTANCE Info_Mod_HofstaatArsch_EXIT (C_INFO)
{
	npc		= Mod_7283_HS_Arsch_REL;
	nr		= 1;
	condition	= Info_Mod_HofstaatArsch_EXIT_Condition;
	information	= Info_Mod_HofstaatArsch_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_HofstaatArsch_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_HofstaatArsch_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};