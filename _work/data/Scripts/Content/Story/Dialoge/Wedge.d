INSTANCE Info_Mod_Wedge_Hi (C_INFO)
{
	npc		= Mod_1297_SLD_Wedge_REL;
	nr		= 1;
	condition	= Info_Mod_Wedge_Hi_Condition;
	information	= Info_Mod_Wedge_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Wedge_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Wedge_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Wedge_Hi_05_00"); //Sieh an, ein neues Gesicht. Aber warte ... habe ich dich nicht damals vor dem Fall der Barriere schon im neuen Lager gesehen?
	AI_Output(hero, self, "Info_Mod_Wedge_Hi_15_01"); //Ja, das stimmt. Du scheinst ein gutes Gedächtnis zu haben.
	AI_Output(self, hero, "Info_Mod_Wedge_Hi_05_02"); //Nun, etwas Köpfchen ist nicht gerade von Nachteil, wenn man nicht als Moorleiche enden will.
	AI_Output(self, hero, "Info_Mod_Wedge_Hi_05_03"); //Denn die beste Art zu einer zu werden, ist es sich im Moor zu verlaufen.
	AI_Output(self, hero, "Info_Mod_Wedge_Hi_05_04"); //Es bedarf eben mehr, als nur leiser Sohlen, um nicht gleich beim ersten Beutezug als Kadaver zu enden.
	AI_Output(hero, self, "Info_Mod_Wedge_Hi_15_05"); //Naja, wenn es drauf ankommt, sollte man sicher auch die Beine in die Hand nehmen können ... leise Sohlen hin oder her.
	AI_Output(self, hero, "Info_Mod_Wedge_Hi_05_06"); //Das eine muss aber das andere nicht ausschließen.
	AI_Output(self, hero, "Info_Mod_Wedge_Hi_05_07"); //Wenn man erst einmal gelernt hat, wie man richtig auftreten muss, kann man auch beim Laufen fast genauso leise sein, als würde man Schleichen.
	AI_Output(hero, self, "Info_Mod_Wedge_Hi_15_08"); //Hört sich nützlich an.
	AI_Output(self, hero, "Info_Mod_Wedge_Hi_05_09"); //Ja, es ist beleibe nicht von Nachteil. Wer die leisen Sohlen beherrscht, lebt besser ... und länger.
};

INSTANCE Info_Mod_Wedge_Lehrer (C_INFO)
{
	npc		= Mod_1297_SLD_Wedge_REL;
	nr		= 1;
	condition	= Info_Mod_Wedge_Lehrer_Condition;
	information	= Info_Mod_Wedge_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir beibringen leise zu laufen?";
};

FUNC INT Info_Mod_Wedge_Lehrer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Wedge_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wedge_Lehrer_Info()
{
	AI_Output(hero, self, "Info_Mod_Wedge_Lehrer_15_00"); //Kannst du mir beibringen leise zu laufen?
	AI_Output(self, hero, "Info_Mod_Wedge_Lehrer_05_01"); //Na ich weiß nicht ... kannst du überhaupt vernünftig schleichen?
	AI_Output(self, hero, "Info_Mod_Wedge_Lehrer_05_02"); //Mit einem Trampel, der die Füße eines Golems hat, werde ich erst gar nicht meine kostbare Zeit verschwenden.

	if (Mod_Schwierigkeit != 4)
	{
		AI_Output(self, hero, "Info_Mod_Wedge_Lehrer_05_03"); //Apropos kostbar und Zeit ... wenn es dir wirklich ernst ist, wirst du bestimmt 300 Münzen locker machen können.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Wedge_Lehrer_05_04"); //Apropos kostbar und Zeit ... wenn es dir wirklich ernst ist, wirst du bestimmt 1800 Münzen locker machen können.
	};
};

INSTANCE Info_Mod_Wedge_Lernen (C_INFO)
{
	npc		= Mod_1297_SLD_Wedge_REL;
	nr		= 1;
	condition	= Info_Mod_Wedge_Lernen_Condition;
	information	= Info_Mod_Wedge_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "";
};

FUNC INT Info_Mod_Wedge_Lernen_Condition()
{
	if (Mod_Schwierigkeit != 4)
	{
		Info_Mod_Wedge_Lernen.description = "Leises Laufen (15 LP, 300 Gold, erfordert Schleichen)";
	}
	else
	{
		Info_Mod_Wedge_Lernen.description = "Leises Laufen (1800 Gold, erfordert Schleichen)";
	};

	if (Npc_KnowsInfo(hero, Info_Mod_Wedge_Lehrer))
	&& (LeisenLaufen_Perk == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Wedge_Lernen_Info()
{
	if (Mod_Schwierigkeit != 4)
	&& (hero.lp < 15)
	{
		AI_Output(self, hero, "Info_Mod_Wedge_Lernen_05_00"); //Sammele erst einmal die nötige Erfahrung, Grünschnabel.
	}
	else if ((Mod_Schwierigkeit != 4)
	&& (Npc_HasItems(hero, ItMi_Gold) < 300))
	|| ((Mod_Schwierigkeit == 4)
	&& (Npc_HasItems(hero, ItMi_Gold) < 1800))
	{
		AI_Output(self, hero, "Info_Mod_Wedge_Lernen_05_01"); //Und das Gold?! Umsonst ist der Tod ...
	}
	else if (Npc_GetTalentSkill(hero, NPC_TALENT_SNEAK) == FALSE)
	{
		AI_Output(self, hero, "Info_Mod_Wedge_Lernen_05_02"); //Anfänger, lern erst mal vernünftig zu schleichen. Mit deinen Schritten übertönst du jeden Troll.
	}
	else
	{
		if (Mod_Schwierigkeit != 4)
		{
			hero.lp -= 15;

			B_GiveInvItems	(hero, self, ItMi_Gold, 300);
		}
		else
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 1800);
		};

		AI_Output(self, hero, "Info_Mod_Wedge_Lernen_05_03"); //Gut, ein Würdiger will lernen seinen Fuß leise und doch Geschwind aufzusetzen.
		AI_Output(self, hero, "Info_Mod_Wedge_Lernen_05_04"); //Du musst darauf achten, sanft mit der Ferse aufzusetzen und den Fuß gleichmäßig abzurollen.
		AI_Output(self, hero, "Info_Mod_Wedge_Lernen_05_05"); //Weiches Schuhwerk ist auch nicht von Nachteil. Ich zeige es dir.

		AI_PlayAni	(self, "T_PLUNDER");

		AI_Output(self, hero, "Info_Mod_Wedge_Lernen_05_06"); //So, jetzt solltest du nicht mehr so viel Lärm beim Laufen machen.
		AI_Output(self, hero, "Info_Mod_Wedge_Lernen_05_07"); //Viel Spaß mit deiner neuen Fertigkeit.

		LeisenLaufen_Perk = TRUE;
	};
};

INSTANCE Info_Mod_Wedge_Pickpocket (C_INFO)
{
	npc		= Mod_1297_SLD_Wedge_REL;
	nr		= 1;
	condition	= Info_Mod_Wedge_Pickpocket_Condition;
	information	= Info_Mod_Wedge_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Wedge_Pickpocket_Condition()
{
	C_Beklauen	(74, ItMi_Gold, 300);
};

FUNC VOID Info_Mod_Wedge_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Wedge_Pickpocket);

	Info_AddChoice	(Info_Mod_Wedge_Pickpocket, DIALOG_BACK, Info_Mod_Wedge_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Wedge_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Wedge_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Wedge_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Wedge_Pickpocket);
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

INSTANCE Info_Mod_Wedge_EXIT (C_INFO)
{
	npc		= Mod_1297_SLD_Wedge_REL;
	nr		= 1;
	condition	= Info_Mod_Wedge_EXIT_Condition;
	information	= Info_Mod_Wedge_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Wedge_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Wedge_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};