INSTANCE Info_Mod_Raritaetenhaendler_Hi (C_INFO)
{
	npc		= Mod_7542_OUT_Raritaetenhaendler_REL;
	nr		= 1;
	condition	= Info_Mod_Raritaetenhaendler_Hi_Condition;
	information	= Info_Mod_Raritaetenhaendler_Hi_Info;
	permanent	= 0;
	important	= 1;
	trade		= 1;
};

FUNC INT Info_Mod_Raritaetenhaendler_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Raritaetenhaendler_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Raritaetenhaendler_Hi_16_00"); //Hallo Freund. Tritt näher!
	AI_Output(hero, self, "Info_Mod_Raritaetenhaendler_Hi_15_01"); //Freund? Kennen wir uns?
	AI_Output(self, hero, "Info_Mod_Raritaetenhaendler_Hi_16_02"); //Noch nicht. Mein Name ist Finder. Ich handle mit Raritäten.
	AI_Output(hero, self, "Info_Mod_Raritaetenhaendler_Hi_15_03"); //Raritäten. Das sind doch seltene Dinge.
	AI_Output(self, hero, "Info_Mod_Raritaetenhaendler_Hi_16_04"); //Genau. Seltene, wunderliche, gar einmalige Sachen.
	AI_Output(hero, self, "Info_Mod_Raritaetenhaendler_Hi_15_05"); //Dann lass mal sehen.
};

INSTANCE Info_Mod_Raritaetenhaendler_Rune (C_INFO)
{
	npc		= Mod_7542_OUT_Raritaetenhaendler_REL;
	nr		= 1;
	condition	= Info_Mod_Raritaetenhaendler_Rune_Condition;
	information	= Info_Mod_Raritaetenhaendler_Rune_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich sehe hier 'ne kaputte Rune.";
};

FUNC INT Info_Mod_Raritaetenhaendler_Rune_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Raritaetenhaendler_Hi))
	&& (Mod_JG_Finder == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raritaetenhaendler_Rune_Info()
{
	AI_Output(hero, self, "Info_Mod_Raritaetenhaendler_Rune_15_00"); //Ich sehe hier 'ne kaputte Rune. Das Teil interessiert mich.
	AI_Output(self, hero, "Info_Mod_Raritaetenhaendler_Rune_16_01"); //Aber gerne. Für 500 kannst du sie haben.
	AI_Output(hero, self, "Info_Mod_Raritaetenhaendler_Rune_15_02"); //Bist du verrückt? 500 Gold für diesen Klumpen Erz?
	AI_Output(hero, self, "Info_Mod_Raritaetenhaendler_Rune_15_03"); //Ist doch bestenfalls als Dekoration zu gebrauchen. Ich gebe dir 100.
	AI_Output(self, hero, "Info_Mod_Raritaetenhaendler_Rune_16_04"); //Spinnst du? Das ist eine absolute Rarität. Nicht unter 400 zu haben.
};

INSTANCE Info_Mod_Raritaetenhaendler_Rune01 (C_INFO)
{
	npc		= Mod_7542_OUT_Raritaetenhaendler_REL;
	nr		= 1;
	condition	= Info_Mod_Raritaetenhaendler_Rune01_Condition;
	information	= Info_Mod_Raritaetenhaendler_Rune01_Info;
	permanent	= 0;
	important	= 0;
	description	= "Also gut. Hier 400 Münzen. Die pure Abzocke ist das.";
};

FUNC INT Info_Mod_Raritaetenhaendler_Rune01_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Raritaetenhaendler_Rune))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 400)
	&& (Npc_HasItems(self, ItMi_BrokenRune03) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raritaetenhaendler_Rune01_Info()
{
	AI_Output(hero, self, "Info_Mod_Raritaetenhaendler_Rune01_15_00"); //Also gut. Hier 400 Münzen. Die pure Abzocke ist das.

	B_GiveInvItems	(hero, self, ItMi_Gold, 400);

	AI_Output(self, hero, "Info_Mod_Raritaetenhaendler_Rune01_16_01"); //Angebot und Nachfrage ist das. Hier. Viel Vergnügen.

	B_GiveInvItems	(self, hero, ItMi_BrokenRune02, 1);

	Npc_RemoveInvItems	(self, ItMi_BrokenRune03, 1);
	
	if (Npc_HasItems(Mod_7540_OUT_Penner_REL, ItMi_BrokenRune01) == 1)
	{
		B_LogEntry	(TOPIC_MOD_JG_PENNER, "Habe dem Raritätenhändler 'ne halbe Teleportrune abgeschwatzt. Jetzt brauche ich den Rest vom Penner zurück. Sollte nicht allzu schwer sein.");
	}
	else
	{
		B_LogEntry	(TOPIC_MOD_JG_PENNER, "Geschafft! Ich habe beide Teile. Vielleicht kann man die Rune reparieren. Am besten einen Fachmann fragen. Ob's hier einen Magier gibt? Mal fragen. Vielleicht Daniel, der handelt doch mit Magie.");
	};
};

INSTANCE Info_Mod_Raritaetenhaendler_Rune02 (C_INFO)
{
	npc		= Mod_7542_OUT_Raritaetenhaendler_REL;
	nr		= 1;
	condition	= Info_Mod_Raritaetenhaendler_Rune02_Condition;
	information	= Info_Mod_Raritaetenhaendler_Rune02_Info;
	permanent	= 0;
	important	= 0;
	description	= "Absolute Rarität? Schau mal, was ich hier habe.";
};

FUNC INT Info_Mod_Raritaetenhaendler_Rune02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Raritaetenhaendler_Rune))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 250)
	&& (Npc_HasItems(self, ItMi_BrokenRune03) == 1)
	&& (Npc_HasItems(hero, ItMi_BrokenRune01) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raritaetenhaendler_Rune02_Info()
{
	AI_Output(hero, self, "Info_Mod_Raritaetenhaendler_Rune02_15_00"); //Absolute Rarität? Schau mal, was ich hier habe.
	AI_Output(self, hero, "Info_Mod_Raritaetenhaendler_Rune02_16_01"); //Oh. Eine halbe Rune.
	AI_Output(hero, self, "Info_Mod_Raritaetenhaendler_Rune02_15_02"); //Genau. Die liegen hier so in der Gegend rum.
	AI_Output(self, hero, "Info_Mod_Raritaetenhaendler_Rune02_16_03"); //Also gut. Ich gehe auf 250 runter.
	AI_Output(hero, self, "Info_Mod_Raritaetenhaendler_Rune02_15_04"); //Weil du's bist. Hier 250 Gold.

	B_GiveInvItems	(hero, self, ItMi_Gold, 250);

	B_GiveInvItems	(self, hero, ItMi_BrokenRune02, 1);

	Npc_RemoveInvItems	(self, ItMi_BrokenRune03, 1);
	
	if (Npc_HasItems(Mod_7540_OUT_Penner_REL, ItMi_BrokenRune01) == 1)
	{
		B_LogEntry	(TOPIC_MOD_JG_PENNER, "Habe dem Raritätenhändler 'ne halbe Teleportrune abgeschwatzt. Jetzt brauche ich den Rest vom Penner zurück. Sollte nicht allzu schwer sein.");
	}
	else
	{
		B_LogEntry	(TOPIC_MOD_JG_PENNER, "Geschafft! Ich habe beide Teile. Vielleicht kann man die Rune reparieren. Am besten einen Fachmann fragen. Ob's hier einen Magier gibt? Mal fragen. Vielleicht Daniel, der handelt doch mit Magie.");
	};
};

INSTANCE Info_Mod_Raritaetenhaendler_Rune03 (C_INFO)
{
	npc		= Mod_7542_OUT_Raritaetenhaendler_REL;
	nr		= 1;
	condition	= Info_Mod_Raritaetenhaendler_Rune03_Condition;
	information	= Info_Mod_Raritaetenhaendler_Rune03_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab aber nur 200 im Beutel. Mehr geht nicht.";
};

FUNC INT Info_Mod_Raritaetenhaendler_Rune03_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Raritaetenhaendler_Rune))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 200)
	&& (Npc_HasItems(self, ItMi_BrokenRune03) == 1)
	&& (Npc_HasItems(hero, ItMi_Aquamarine) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raritaetenhaendler_Rune03_Info()
{
	AI_Output(hero, self, "Info_Mod_Raritaetenhaendler_Rune03_15_00"); //Ich hab aber nur 200 im Beutel. Mehr geht nicht.
	AI_Output(self, hero, "Info_Mod_Raritaetenhaendler_Rune03_16_01"); //Dann kommen wir nicht ins Geschäft. Tut mir leid.
	AI_Output(hero, self, "Info_Mod_Raritaetenhaendler_Rune03_15_02"); //Ich könnte dir noch einen Aquamarin dazugeben. Erstklassige Qualität.

	Npc_RemoveInvItems	(hero, ItMi_Gold, 200);
	Npc_RemoveInvItems	(hero, ItMi_Aquamarine, 1);

	B_ShowGivenThings	("200 Gold und Aquamarin gegeben");

	AI_Output(self, hero, "Info_Mod_Raritaetenhaendler_Rune03_16_03"); //Abgemacht. Hier, die Rune.

	B_GiveInvItems	(self, hero, ItMi_BrokenRune02, 1);

	Npc_RemoveInvItems	(self, ItMi_BrokenRune03, 1);
	
	if (Npc_HasItems(Mod_7540_OUT_Penner_REL, ItMi_BrokenRune01) == 1)
	{
		B_LogEntry	(TOPIC_MOD_JG_PENNER, "Habe dem Raritätenhändler 'ne halbe Teleportrune abgeschwatzt. Jetzt brauche ich den Rest vom Penner zurück. Sollte nicht allzu schwer sein.");
	}
	else
	{
		B_LogEntry	(TOPIC_MOD_JG_PENNER, "Geschafft! Ich habe beide Teile. Vielleicht kann man die Rune reparieren. Am besten einen Fachmann fragen. Ob's hier einen Magier gibt? Mal fragen. Vielleicht Daniel, der handelt doch mit Magie.");
	};
};

INSTANCE Info_Mod_Raritaetenhaendler_Rune04 (C_INFO)
{
	npc		= Mod_7542_OUT_Raritaetenhaendler_REL;
	nr		= 1;
	condition	= Info_Mod_Raritaetenhaendler_Rune04_Condition;
	information	= Info_Mod_Raritaetenhaendler_Rune04_Info;
	permanent	= 0;
	important	= 0;
	description	= "Nachfrage! Was heißt hier Nachfrage? Diesen Schrott nimmt dir doch eh keiner ab.";
};

FUNC INT Info_Mod_Raritaetenhaendler_Rune04_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Raritaetenhaendler_Rune))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 200)
	&& (Npc_HasItems(self, ItMi_BrokenRune03) == 1)
	&& (Npc_HasItems(hero, ItFo_Bread) >= 3)
	&& (Npc_HasItems(hero, ItFo_FishSoup) >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raritaetenhaendler_Rune04_Info()
{
	AI_Output(hero, self, "Info_Mod_Raritaetenhaendler_Rune04_15_00"); //Nachfrage! Was heißt hier Nachfrage? Diesen Schrott nimmt dir doch eh keiner ab.
	AI_Output(self, hero, "Info_Mod_Raritaetenhaendler_Rune04_16_01"); //Denkst du. Fast jeder fragt mich, was es auf sich hat mit der Rune.
	AI_Output(hero, self, "Info_Mod_Raritaetenhaendler_Rune04_15_02"); //Und du sagst natürlich: keine Ahnung. Hier. 200 Gold.

	B_GiveInvItems	(hero, self, ItMi_Gold, 200);

	AI_Output(self, hero, "Info_Mod_Raritaetenhaendler_Rune04_16_03"); //Mein letztes Wort. 250. Ich muss auch leben. Und die Frau und die sieben Kinder ...
	AI_Output(hero, self, "Info_Mod_Raritaetenhaendler_Rune04_15_04"); //Hab aber nur 200. Ich geb dir drei Brote und drei Teller Suppe dazu. Für die Familie ...

	Npc_RemoveInvItems	(hero, ItFo_Bread, 3);
	Npc_RemoveInvItems	(hero, ItFo_FishSoup, 3);

	B_ShowGivenThings	("3 Brote und 3 Teller Suppe gegeben");

	AI_Output(self, hero, "Info_Mod_Raritaetenhaendler_Rune04_16_05"); //Du bist ein Verbrecher. Hier. Die Rune.

	B_GiveInvItems	(self, hero, ItMi_BrokenRune02, 1);

	Npc_RemoveInvItems	(self, ItMi_BrokenRune03, 1);
	
	if (Npc_HasItems(Mod_7540_OUT_Penner_REL, ItMi_BrokenRune01) == 1)
	{
		B_LogEntry	(TOPIC_MOD_JG_PENNER, "Habe dem Raritätenhändler 'ne halbe Teleportrune abgeschwatzt. Jetzt brauche ich den Rest vom Penner zurück. Sollte nicht allzu schwer sein.");
	}
	else
	{
		B_LogEntry	(TOPIC_MOD_JG_PENNER, "Geschafft! Ich habe beide Teile. Vielleicht kann man die Rune reparieren. Am besten einen Fachmann fragen. Ob's hier einen Magier gibt? Mal fragen. Vielleicht Daniel, der handelt doch mit Magie.");
	};
};

INSTANCE Info_Mod_Raritaetenhaendler_BrokenRune (C_INFO)
{
	npc		= Mod_7542_OUT_Raritaetenhaendler_REL;
	nr		= 1;
	condition	= Info_Mod_Raritaetenhaendler_BrokenRune_Condition;
	information	= Info_Mod_Raritaetenhaendler_BrokenRune_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo noch mal.";
};

FUNC INT Info_Mod_Raritaetenhaendler_BrokenRune_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Daniel_BrokenRune2))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 200)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Daniel_BrokenRune3))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Raritaetenhaendler_BrokenRune_Info()
{
	AI_Output(hero, self, "Info_Mod_Raritaetenhaendler_BrokenRune_15_00"); //Hallo noch mal.
	AI_Output(self, hero, "Info_Mod_Raritaetenhaendler_BrokenRune_16_01"); //Was? Du schon wieder? Was willst Du?
	AI_Output(hero, self, "Info_Mod_Raritaetenhaendler_BrokenRune_15_02"); //Ich komme von Daniel. Er hat dir eine Adanosfigur verkauft.
	AI_Output(self, hero, "Info_Mod_Raritaetenhaendler_BrokenRune_16_03"); //Das mag sein. Ein schönes Teil. Ganz aus Aquamarin geschnitzt.

	B_GiveInvItems	(self, hero, ItMi_AdanosStatue, 1);

	AI_Output(hero, self, "Info_Mod_Raritaetenhaendler_BrokenRune_15_04"); //Genau das möchte ich kaufen. Du weißt ja, als Dekoration ...
	AI_Output(self, hero, "Info_Mod_Raritaetenhaendler_BrokenRune_16_05"); //Gewiss. 500 Gold ...
	AI_Output(hero, self, "Info_Mod_Raritaetenhaendler_BrokenRune_15_06"); //Nicht schon wieder. Das ist höchstens 200 wert.

	B_GiveInvItems	(hero, self, ItMi_Gold, 200);

	B_LogEntry	(TOPIC_MOD_JG_RUNENZAUBER, "Ich habe jetzt die Adanosfigur. Muss zum Magier zurück.");
};

INSTANCE Info_Mod_Raritaetenhaendler_Pickpocket (C_INFO)
{
	npc		= Mod_7542_OUT_Raritaetenhaendler_REL;
	nr		= 1;
	condition	= Info_Mod_Raritaetenhaendler_Pickpocket_Condition;
	information	= Info_Mod_Raritaetenhaendler_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_120;
};

FUNC INT Info_Mod_Raritaetenhaendler_Pickpocket_Condition()
{
	C_Beklauen	(107, ItMi_Runeblank, 1);
};

FUNC VOID Info_Mod_Raritaetenhaendler_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Raritaetenhaendler_Pickpocket);

	Info_AddChoice	(Info_Mod_Raritaetenhaendler_Pickpocket, DIALOG_BACK, Info_Mod_Raritaetenhaendler_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Raritaetenhaendler_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Raritaetenhaendler_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Raritaetenhaendler_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Raritaetenhaendler_Pickpocket);
};

FUNC VOID Info_Mod_Raritaetenhaendler_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Raritaetenhaendler_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Raritaetenhaendler_Pickpocket);

		Info_AddChoice	(Info_Mod_Raritaetenhaendler_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Raritaetenhaendler_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Raritaetenhaendler_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Raritaetenhaendler_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Raritaetenhaendler_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Raritaetenhaendler_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Raritaetenhaendler_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Raritaetenhaendler_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Raritaetenhaendler_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Raritaetenhaendler_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Raritaetenhaendler_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Raritaetenhaendler_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Raritaetenhaendler_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Raritaetenhaendler_EXIT (C_INFO)
{
	npc		= Mod_7542_OUT_Raritaetenhaendler_REL;
	nr		= 1;
	condition	= Info_Mod_Raritaetenhaendler_EXIT_Condition;
	information	= Info_Mod_Raritaetenhaendler_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Raritaetenhaendler_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Raritaetenhaendler_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};