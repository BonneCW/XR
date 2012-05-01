INSTANCE Info_Mod_Rangar_DragoHelp (C_INFO)
{
	npc		= Mod_747_MIL_Rangar_NW;
	nr		= 1;
	condition	= Info_Mod_Rangar_DragoHelp_Condition;
	information	= Info_Mod_Rangar_DragoHelp_Info;
	permanent	= 0;
	important	= 0;
	description	= "Nanu Rangar! Was treibt dich hierher?";
};

FUNC INT Info_Mod_Rangar_DragoHelp_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cyrco_SuchenderZettel))
	&& (Npc_HasItems(hero, ItPo_Health_01) >= 10)
	&& (Npc_HasItems(hero, ItPo_Mana_01) >= 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Rangar_DragoHelp_Info()
{
	AI_Output(hero, self, "Info_Mod_Rangar_DragoHelp_15_00"); //Nanu Rangar! Was treibt dich hierher?
	AI_Output(self, hero, "Info_Mod_Rangar_DragoHelp_07_01"); //Hör bloß auf! Da hat mich doch irgendein Strolch so bei Lord Andre angeschwärtzt, dass ich bei der Garde total unten durch war.
	AI_Output(self, hero, "Info_Mod_Rangar_DragoHelp_07_02"); //Jeder hat mich rumgeschubst. Da bin ich einfach abgehauen.
	AI_Output(hero, self, "Info_Mod_Rangar_DragoHelp_15_03"); //Und dann?
	AI_Output(self, hero, "Info_Mod_Rangar_DragoHelp_07_04"); //Dann hab ich später Dragomir in der Taverne gesprochen.
	AI_Output(self, hero, "Info_Mod_Rangar_DragoHelp_07_05"); //Der hat mir angeboten, bei den Jägern mitzumachen. Natur, frische Luft und nicht die staubigen Stadtmauern ...
	AI_Output(hero, self, "Info_Mod_Rangar_DragoHelp_15_06"); //Na, wenn du das so siehst ...
	AI_Output(self, hero, "Info_Mod_Rangar_DragoHelp_07_07"); //Ja. Und kein eintöniger Trott.
	AI_Output(hero, self, "Info_Mod_Rangar_DragoHelp_15_08"); //Wohl war! Du kennst die augenblickliche Situation?
	AI_Output(self, hero, "Info_Mod_Rangar_DragoHelp_07_09"); //Nun, ich weiß von Torgan, dass Dragomir mit seiner Gruppe unterhalb der Sonnenkreistreppe festsitzt und angegriffen wird.
	AI_Output(hero, self, "Info_Mod_Rangar_DragoHelp_15_10"); //Du kennst Torgan?
	AI_Output(self, hero, "Info_Mod_Rangar_DragoHelp_07_11"); //Jo. Ich musste letzhin was bei Torgan abliefern.
	AI_Output(self, hero, "Info_Mod_Rangar_DragoHelp_07_12"); //Da hieß es dann, ich solle mich hier postieren und auf Nachricht warten.
	AI_Output(hero, self, "Info_Mod_Rangar_DragoHelp_15_13"); //Ich soll dir von Cyrco ausrichten, unbedingt Dragomir zu unterstützen.
	AI_Output(hero, self, "Info_Mod_Rangar_DragoHelp_15_14"); //Er wird angegriffen und ohne deine Hilfe vielleicht nicht überstehen können.
	AI_Output(self, hero, "Info_Mod_Rangar_DragoHelp_07_15"); //Ich habe geahnt, dass so etwas passieren würde. Ich mache mich sofort auf den Weg. Bis später.
	AI_Output(hero, self, "Info_Mod_Rangar_DragoHelp_15_16"); //Warte. Ich habe hier noch ein paar Tränke von Cyrco für Dragomir. Nimm sie mit.
	AI_Output(self, hero, "Info_Mod_Rangar_DragoHelp_07_17"); //Ah, sehr gut. Das wird ihm auf jeden Fall helfen. Wieviele hast du?
	AI_Output(hero, self, "Info_Mod_Rangar_DragoHelp_15_18"); //Hier hast du je zehn Heil- und zehn Manatränke.

	Npc_RemoveInvItems	(hero, ItPo_Health_01, 10);
	Npc_RemoveInvItems	(hero, ItPo_Mana_01, 10);

	B_ShowGivenThings	("20 Tränke gegeben");

	AI_Output(self, hero, "Info_Mod_Rangar_DragoHelp_07_19"); //Danke. Das ist aber eine verdammte Menge.
	AI_Output(self, hero, "Info_Mod_Rangar_DragoHelp_07_20"); //Die wird er gut brauchen können. Hier hast du ein paar Wolfszähne, vielleicht kannst du sie gebrauchen.

	B_GiveInvItems	(self, hero, ItAt_Teeth, 4);

	AI_Output(hero, self, "Info_Mod_Rangar_DragoHelp_15_21"); //So, ich muss zurück.

	if (!Npc_KnowsInfo(hero, Info_Mod_Novize_JG_Pass_Hi))
	{
		AI_Output(self, hero, "Info_Mod_Rangar_DragoHelp_07_22"); //Dann solltest du dich vielleicht auf dem Weg dorthin um diese Gestalt kümmern, die hier vorhin vorbeigekommen ist.
		AI_Output(hero, self, "Info_Mod_Rangar_DragoHelp_15_23"); //Was für eine Gestalt war das?
		AI_Output(self, hero, "Info_Mod_Rangar_DragoHelp_07_24"); //Sah aus wie ein Novize, hat aber ziemlich seltsam geschaut. Ist über den Pass ins Minental gegangen, sehr weit kann er noch nicht gekommen sein.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Rangar_DragoHelp_07_25"); //Viel Glück, Kumpel.
	};

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ATNANDOR");

	B_SetTopicStatus	(TOPIC_MOD_JG_DRAGOMIRHILFE, LOG_SUCCESS);
};

INSTANCE Info_Mod_Rangar_Pickpocket (C_INFO)
{
	npc		= Mod_747_MIL_Rangar_NW;
	nr		= 1;
	condition	= Info_Mod_Rangar_Pickpocket_Condition;
	information	= Info_Mod_Rangar_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Rangar_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 300);
};

FUNC VOID Info_Mod_Rangar_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Rangar_Pickpocket);

	Info_AddChoice	(Info_Mod_Rangar_Pickpocket, DIALOG_BACK, Info_Mod_Rangar_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Rangar_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Rangar_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Rangar_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Rangar_Pickpocket);
};

FUNC VOID Info_Mod_Rangar_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Rangar_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Rangar_Pickpocket);

		Info_AddChoice	(Info_Mod_Rangar_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Rangar_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Rangar_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Rangar_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Rangar_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Rangar_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Rangar_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Rangar_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Rangar_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Rangar_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Rangar_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Rangar_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Rangar_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Rangar_EXIT (C_INFO)
{
	npc		= Mod_747_MIL_Rangar_NW;
	nr		= 1;
	condition	= Info_Mod_Rangar_EXIT_Condition;
	information	= Info_Mod_Rangar_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Rangar_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Rangar_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};