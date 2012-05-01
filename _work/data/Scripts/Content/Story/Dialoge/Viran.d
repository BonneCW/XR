INSTANCE Info_Mod_Viran_Hi (C_INFO)
{
	npc		= Mod_3002_PSINOV_Viran_REL;
	nr		= 1;
	condition	= Info_Mod_Viran_Hi_Condition;
	information	= Info_Mod_Viran_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Fleißig an der Sumpfkrautproduktion?";
};

FUNC INT Info_Mod_Viran_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Viran_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Viran_Hi_15_00"); //Fleißig an der Sumpfkrautproduktion?
	AI_Output(self, hero, "Info_Mod_Viran_Hi_07_01"); //Ja, aber gemütlicher, als zu meiner Zeit in der Kolonie.
	AI_Output(self, hero, "Info_Mod_Viran_Hi_07_02"); //Dort stand ich von früh bis spät wie blöd im Sumpf und hab mir bei der Ernte jeden Tag den Buckel für die Gurus krumm gemacht.
	AI_Output(self, hero, "Info_Mod_Viran_Hi_07_03"); //Jetzt können selbst ihren Hintern aufs Feld bewegen, um das Kraut zu ernten.
	AI_Output(self, hero, "Info_Mod_Viran_Hi_07_04"); //Und hier kann ich sogar selbst am Alchemietisch herumexperimentieren.
	AI_Output(hero, self, "Info_Mod_Viran_Hi_15_05"); //Du warst früher Alchemist?
	AI_Output(self, hero, "Info_Mod_Viran_Hi_07_06"); //Ähh, ne ... freischaffend. Hier ein bisschen mit Rauschmitteln gehandelt, da ein bisschen geklaut ...
	AI_Output(self, hero, "Info_Mod_Viran_Hi_07_07"); //Nach dem Fall der Barriere habe ich die Verwirrung genutzt, um die Besitztümer von Cor Kalom um Nützliches zu erleichtern.
	AI_Output(self, hero, "Info_Mod_Viran_Hi_07_08"); //Na ja, viel Gold und Erz gab’s nicht, dafür aber einige Rezepte ...
	AI_Output(hero, self, "Info_Mod_Viran_Hi_15_09"); //Und wie bist du dann hierher gekommen?
	AI_Output(self, hero, "Info_Mod_Viran_Hi_07_10"); //Chani hatte einige Gurus belauscht, die den Novizen Lester damit betrauten, Sumpfkraut auf magisch beeinflussten Böden anzubauen.
	AI_Output(self, hero, "Info_Mod_Viran_Hi_07_11"); //Das sollte die Erträge deutlich steigern.
	AI_Output(self, hero, "Info_Mod_Viran_Hi_07_12"); //Ich hatte in meiner Zeit vor der Barriere von diesem verfluchten Moor gehört und brach deshalb mit ihr und Harlok hierher auf.
	AI_Output(self, hero, "Info_Mod_Viran_Hi_07_13"); //Und ich habe es nicht bereut ... auch, wenn Harlok die längste Zeit des Tages auf seinem Arsch sitzt und kaum hilft.
};

INSTANCE Info_Mod_Viran_Traenke (C_INFO)
{
	npc		= Mod_3002_PSINOV_Viran_REL;
	nr		= 1;
	condition	= Info_Mod_Viran_Traenke_Condition;
	information	= Info_Mod_Viran_Traenke_Info;
	permanent	= 0;
	important	= 0;
	description	= "Und, was machen die Tränke?";
};

FUNC INT Info_Mod_Viran_Traenke_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Viran_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Viran_Traenke_Info()
{
	AI_Output(hero, self, "Info_Mod_Viran_Traenke_15_00"); //Und, was machen die Tränke?
	AI_Output(self, hero, "Info_Mod_Viran_Traenke_02_01"); //Den Kunden schmeckt’s. Ich bin auch gerade wieder an einem neuen Trank ... nur fehlen mir da einige Zutaten.
	AI_Output(hero, self, "Info_Mod_Viran_Traenke_15_02"); //Was brauchst du?
	AI_Output(self, hero, "Info_Mod_Viran_Traenke_02_03"); //Vor allem Sumpfbeeren. Ja davon bräuchte ich mindestens fünf Stück.
	AI_Output(self, hero, "Info_Mod_Viran_Traenke_02_04"); //Nur sind die verdammt selten ... es sei denn, man hat keine Angst vor den Monsterpflanzen.

	Log_CreateTopic	(TOPIC_MOD_VIRAN_SUMPFBEEREN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_VIRAN_SUMPFBEEREN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_VIRAN_SUMPFBEEREN, "Viran bräuchte mindestens 5 Sumpfbeeren, um einen Trank zu vervollständigen. Er sprach davon, sie seien selten ... nannte jedoch in dem Zusammenhang Monsterpflanzen als mögliche Quelle.");
};

INSTANCE Info_Mod_Viran_Sumpfbeeren (C_INFO)
{
	npc		= Mod_3002_PSINOV_Viran_REL;
	nr		= 1;
	condition	= Info_Mod_Viran_Sumpfbeeren_Condition;
	information	= Info_Mod_Viran_Sumpfbeeren_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier sind fünf Sumpfbeeren.";
};

FUNC INT Info_Mod_Viran_Sumpfbeeren_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Viran_Traenke))
	&& (Npc_HasItems(hero, ItFo_Beere_01) >= 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Viran_Sumpfbeeren_Info()
{
	AI_Output(hero, self, "Info_Mod_Viran_Sumpfbeeren_15_00"); //Hier sind fünf Sumpfbeeren.

	B_GiveInvItems	(hero, self, ItFo_Beere_01, 5);

	AI_Output(self, hero, "Info_Mod_Viran_Sumpfbeeren_02_01"); //Was willst du mich verarschen? Tatsächlich. Wie du das nur hinbekommen hast ...
	AI_Output(self, hero, "Info_Mod_Viran_Sumpfbeeren_02_02"); //Das ist mir auf jeden Fall 500 Goldmünzen wert. Hier.

	B_GiveInvItems	(self, hero, ItMi_Gold, 500);

	AI_Output(self, hero, "Info_Mod_Viran_Sumpfbeeren_02_03"); //Morgen sollte der Trank fertig sein. Du sollst dann auch 'n Schluck davon haben.

	B_GivePlayerXP	(500);

	B_SetTopicStatus	(TOPIC_MOD_VIRAN_SUMPFBEEREN, LOG_SUCCESS);

	CurrentNQ += 1;

	Mod_Viran_Sumpfbeeren_Tag = Wld_GetDay();
};

INSTANCE Info_Mod_Viran_Sumpfbeeren2 (C_INFO)
{
	npc		= Mod_3002_PSINOV_Viran_REL;
	nr		= 1;
	condition	= Info_Mod_Viran_Sumpfbeeren2_Condition;
	information	= Info_Mod_Viran_Sumpfbeeren2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Viran_Sumpfbeeren2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Viran_Sumpfbeeren))
	&& (Wld_GetDay() > Mod_Viran_Sumpfbeeren_Tag)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Viran_Sumpfbeeren2_Info()
{
	AI_Output(self, hero, "Info_Mod_Viran_Sumpfbeeren2_02_00"); //Hey, der Trank ist fertig. Ist gut geworden, glaube ich. Hier, probier mal.

	B_GiveInvItems	(self, hero, ItFo_Bruehe, 1);

	AI_Output(hero, self, "Info_Mod_Viran_Sumpfbeeren2_15_01"); //Na dann ...

	B_UseItem	(hero, ItFo_Bruehe);

	AI_Output(self, hero, "Info_Mod_Viran_Sumpfbeeren2_02_02"); //Und?
	AI_Output(hero, self, "Info_Mod_Viran_Sumpfbeeren2_15_03"); //Ich ...
	AI_Output(self, hero, "DEFAULT"); //

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Viran_Sumpfbeeren3 (C_INFO)
{
	npc		= Mod_3002_PSINOV_Viran_REL;
	nr		= 1;
	condition	= Info_Mod_Viran_Sumpfbeeren3_Condition;
	information	= Info_Mod_Viran_Sumpfbeeren3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Viran_Sumpfbeeren3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Viran_Sumpfbeeren2))
	&& (Mod_SumpfbeerenTraum == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Viran_Sumpfbeeren3_Info()
{
	AI_Output(self, hero, "Info_Mod_Viran_Sumpfbeeren3_02_00"); //Hey, alles wieder ok?
	AI_Output(hero, self, "Info_Mod_Viran_Sumpfbeeren3_15_01"); //(benommen) Klirrendes Metall bringt den Tod ... Erlösung durch das, was der Brust des Moores entrissen ...
	AI_Output(self, hero, "Info_Mod_Viran_Sumpfbeeren3_02_02"); //Ohh man, das war wohl etwas zu heftig.
	AI_Output(hero, self, "Info_Mod_Viran_Sumpfbeeren3_15_03"); //(wieder zu sich kommend) Was? Ähh, nein, mir geht’s wieder gut. Ich hatte nur einen sonderbaren Traum.
	AI_Output(self, hero, "Info_Mod_Viran_Sumpfbeeren3_02_04"); //Nach solchen Tränken würde es mich auch eher wundern, wenn die Träume ausblieben, hähä. Nichts für ungut.
	AI_Output(self, hero, "Info_Mod_Viran_Sumpfbeeren3_02_05"); //Werde den Trank auf meine Liste setzen.
};

INSTANCE Info_Mod_Viran_Wasserleichen (C_INFO)
{
	npc		= Mod_3002_PSINOV_Viran_REL;
	nr		= 1;
	condition	= Info_Mod_Viran_Wasserleichen_Condition;
	information	= Info_Mod_Viran_Wasserleichen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Viran_Wasserleichen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Botschek_Wasserleichen2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Viran_Wasserleichen_Info()
{
	AI_Output(self, hero, "Info_Mod_Viran_Wasserleichen_02_00"); //Hey, keine Untoten mehr in 100 Schritt ... das nenn ich saubere Arbeit.
	AI_Output(self, hero, "Info_Mod_Viran_Wasserleichen_02_01"); //Ohne Wasserleichen haben wir ein Problem weniger bei der Sumpfkrautpflege.
	AI_Output(self, hero, "Info_Mod_Viran_Wasserleichen_02_02"); //Hier, nimm dieses Rezept als kleines Dankeschön.

	B_GiveInvItems	(self, hero, ItWr_Rezept_Purpurmond, 1);

	AI_Output(self, hero, "Info_Mod_Viran_Wasserleichen_02_03"); //Aber sei nicht zu gierig ... ein Fläschchen reicht für schöne Träume, hähä.

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Viran_Pickpocket (C_INFO)
{
	npc		= Mod_3002_PSINOV_Viran_REL;
	nr		= 1;
	condition	= Info_Mod_Viran_Pickpocket_Condition;
	information	= Info_Mod_Viran_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_20;
};

FUNC INT Info_Mod_Viran_Pickpocket_Condition()
{
	C_Beklauen	(20, ItMi_Gold, 35);
};

FUNC VOID Info_Mod_Viran_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Viran_Pickpocket);

	Info_AddChoice	(Info_Mod_Viran_Pickpocket, DIALOG_BACK, Info_Mod_Viran_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Viran_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Viran_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Viran_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Viran_Pickpocket);
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

INSTANCE Info_Mod_Viran_EXIT (C_INFO)
{
	npc		= Mod_3002_PSINOV_Viran_REL;
	nr		= 1;
	condition	= Info_Mod_Viran_EXIT_Condition;
	information	= Info_Mod_Viran_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Viran_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Viran_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};