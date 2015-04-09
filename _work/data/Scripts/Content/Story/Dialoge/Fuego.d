INSTANCE Info_Mod_Fuego_Lehrer (C_INFO)
{
	npc		= Mod_7425_KDF_Fuego_REL;
	nr		= 1;
	condition	= Info_Mod_Fuego_Lehrer_Condition;
	information	= Info_Mod_Fuego_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mich unterweisen?";
};

FUNC INT Info_Mod_Fuego_Lehrer_Condition()
{
	if (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fuego_Lehrer_Info()
{
	AI_Output(hero, self, "Info_Mod_Fuego_Lehrer_15_00"); //Kannst du mich unterweisen?

	if ((Mod_Gottstatus == 9)
	|| (Mod_Gottstatus == 10)
	|| (Mod_Gottstatus == 11)
	|| (Mod_Gottstatus == 12))
	{
		AI_Output(self, hero, "Info_Mod_Fuego_Lehrer_32_01"); //Oh ja. Ich kann dir zeigen, wie du deine magische Kraft erweitern kannst.

		Mod_FuegoLehrer = 1;

		Log_CreateTopic	(TOPIC_MOD_LEHRER_KHORATA, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_LEHRER_KHORATA, "Fuego kann mir helfen mein MANA zu steigern.");
	}
	else if ((Mod_Gottstatus == 1)
	|| (Mod_Gottstatus == 2)
	|| (Mod_Gottstatus == 3)
	|| (Mod_Gottstatus == 4))
	{
		AI_Output(self, hero, "Info_Mod_Fuego_Lehrer_32_02"); //(nasal) Ich unterrichte nur ehrenwerte Schüler. Du bist auf dem falschen Weg.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Fuego_Lehrer_32_03"); //Gegen eine Spende für meinen Orden werde ich dich lehren, deine magische Kraft zu steigern.

		Mod_FuegoLehrer = 2;

		Log_CreateTopic	(TOPIC_MOD_LEHRER_KHORATA, LOG_NOTE);
		B_LogEntry	(TOPIC_MOD_LEHRER_KHORATA, "Fuego kann mir helfen mein MANA zu steigern.");
	};
};

INSTANCE Info_Mod_Fuego_AdanosLernen (C_INFO)
{
	npc		= Mod_7425_KDF_Fuego_REL;
	nr		= 1;
	condition	= Info_Mod_Fuego_AdanosLernen_Condition;
	information	= Info_Mod_Fuego_AdanosLernen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Unterrichte mich! (100 Gold bezahlen)";
};

FUNC INT Info_Mod_Fuego_AdanosLernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fuego_Lehrer))
	&& (Mod_FuegoLehrer == 2)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 100)
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fuego_AdanosLernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Fuego_AdanosLernen_15_00"); //Unterrichte mich!

	B_GiveInvItems	(hero, self, ItMi_Gold, 100);

	Mod_FuegoLehrer = 1;
};

INSTANCE Info_Mod_Fuego_BrokenRune (C_INFO)
{
	npc		= Mod_7425_KDF_Fuego_REL;
	nr		= 1;
	condition	= Info_Mod_Fuego_BrokenRune_Condition;
	information	= Info_Mod_Fuego_BrokenRune_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Innos zum Gruße, Bewahrer des Feuers.";
};                       

FUNC INT Info_Mod_Fuego_BrokenRune_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Daniel_BrokenRune))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Idrico_BrokenRune))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Fuego_BrokenRune_Info()
{
	AI_Output(hero, self, "Info_Mod_Fuego_BrokenRune_15_00"); //Innos zum Gruße, Bewahrer des Feuers.
	AI_Output(self, hero, "Info_Mod_Fuego_BrokenRune_32_01"); //Das Licht sei mit dir. Was führt dich zu mir?
	AI_Output(hero, self, "Info_Mod_Fuego_BrokenRune_15_02"); //Ich habe hier eine zerbrochene Rune. Kann eure Magie sie wieder richten?
	AI_Output(self, hero, "Info_Mod_Fuego_BrokenRune_32_03"); //Zeig her. Hm ... sauberer Bruch. Würde sagen ein Teleportzauber.
	AI_Output(hero, self, "Info_Mod_Fuego_BrokenRune_15_04"); //Und? Kannst du mir helfen?
	AI_Output(self, hero, "Info_Mod_Fuego_BrokenRune_32_05"); //Nein. Das ist nicht unser Zauber. Das sollte ein Wassermagier besser können.
	AI_Output(self, hero, "Info_Mod_Fuego_BrokenRune_32_06"); //Im Armenviertel lebt ein Wassermagier. Dem Alter nach sollte er alle Weihen haben.
	AI_Output(hero, self, "Info_Mod_Fuego_BrokenRune_15_07"); //Ich hab von ihm gehört. Ich werde ihn fragen.
	AI_Output(self, hero, "Info_Mod_Fuego_BrokenRune_32_08"); //Tu das. Und Innos sei mit dir.
};

INSTANCE Info_Mod_Fuego_Unruhen (C_INFO)
{
	npc		= Mod_7425_KDF_Fuego_REL;
	nr		= 1;
	condition	= Info_Mod_Fuego_Unruhen_Condition;
	information	= Info_Mod_Fuego_Unruhen_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_Mod_Fuego_Unruhen_Condition()
{
	if (Mod_REL_Stadthalter == 3)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Fuego_Unruhen_Info()
{
	AI_Output(self, hero, "Info_Mod_Fuego_Unruhen_32_00"); //(sarkastisch) Ja, vielen Dank auch, dass du uns Lukas beschert hast.
	AI_Output(hero, self, "Info_Mod_Fuego_Unruhen_15_01"); //Gibt's ein Problem damit?
	AI_Output(self, hero, "Info_Mod_Fuego_Unruhen_32_02"); //Allerdings. Er hat Elvira und mich vor die Wahl gestellt, Khorata zu verlassen oder den Glauben zu wechseln.
	AI_Output(self, hero, "Info_Mod_Fuego_Unruhen_32_03"); //Was für eine Entscheidung! Wir werden noch heute unsere Sachen packen und abreisen.
	AI_Output(self, hero, "Info_Mod_Fuego_Unruhen_32_04"); //Lass dich bloß nicht mehr bei uns blicken!

	Mod_REL_FuegoDay = Wld_GetDay();
};

INSTANCE Info_Mod_Fuego_Blutkelch (C_INFO)
{
	npc		= Mod_7425_KDF_Fuego_REL;
	nr		= 1;
	condition	= Info_Mod_Fuego_Blutkelch_Condition;
	information	= Info_Mod_Fuego_Blutkelch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich suche einen Kelch. Einen Blutkelch.";
};                       

FUNC INT Info_Mod_Fuego_Blutkelch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Morpheus_Blutkelch))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Fuego_Blutkelch_Info()
{
	AI_Output(hero, self, "Info_Mod_Fuego_Blutkelch_15_00"); //Ich suche einen Kelch. Einen Blutkelch.
	AI_Output(self, hero, "Info_Mod_Fuego_Blutkelch_32_01"); //Nie gesehen, nie davon gehört.
	AI_Output(self, hero, "Info_Mod_Fuego_Blutkelch_32_02"); //Aber ich könnte Innos um eine Eingebung bitten. Für eine kleine Spende ...
	AI_Output(hero, self, "Info_Mod_Fuego_Blutkelch_15_03"); //Schon gut. Bis dann.
};

INSTANCE Info_Mod_Fuego_ElviraKey (C_INFO)
{
	npc		= Mod_7425_KDF_Fuego_REL;
	nr		= 1;
	condition	= Info_Mod_Fuego_ElviraKey_Condition;
	information	= Info_Mod_Fuego_ElviraKey_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir etwas über Elvira erzählen?";
};                       

FUNC INT Info_Mod_Fuego_ElviraKey_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cassia_Elvira))
	&& (Npc_HasItems(Mod_7499_KDF_Elvira_REL, ItKe_RELMagier) == 1)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Fuego_ElviraKey_Info()
{
	AI_Output(hero, self, "Info_Mod_Fuego_ElviraKey_15_00"); //Kannst du mir etwas über Elvira erzählen?

	if (Npc_KnowsInfo(hero, Info_Mod_Fuego_ElviraKey2))
	{
		AI_Output(self, hero, "Info_Mod_Fuego_ElviraKey_32_01"); //Ahh, es erscheint einem Gläubigen Innos natürlich ungewöhnlich, eine Frau in dieser Rolle zu sehen.
		AI_Output(self, hero, "Info_Mod_Fuego_ElviraKey_32_02"); //Ich kann dir aber versichern, dass sie ihren Pflichten als eine Auserwählte Innos mit äußerster Gewissenhaftigkeit nachgeht.
		AI_Output(self, hero, "Info_Mod_Fuego_ElviraKey_32_03"); //Einzig ... nun ...
		AI_Output(hero, self, "Info_Mod_Fuego_ElviraKey_15_04"); //Ja?
		AI_Output(self, hero, "Info_Mod_Fuego_ElviraKey_32_05"); //Sie trinkt den Klosterwein stets alkoholfrei. Hat extra eine Flasche davon in ihrer Truhe.
		AI_Output(self, hero, "Info_Mod_Fuego_ElviraKey_32_06"); //Das ist natürlich nicht wirklich verwerflich, eher eine Angewohnheit die schmunzeln lässt.
		AI_Output(self, hero, "Info_Mod_Fuego_ElviraKey_32_07"); //Aber ich habe schon zu viel geredet. Innos begleite dich auf deinen Wegen.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Fuego_ElviraKey_32_08"); //Sie ist eine wahre Auserwählte Innos, rechtschaffend und stets ihrer Pflicht ergeben.
		AI_Output(hero, self, "Info_Mod_Fuego_ElviraKey_15_09"); //Kannst du mir noch etwas mehr über sie erzählen?
		AI_Output(self, hero, "Info_Mod_Fuego_ElviraKey_32_10"); //(argwöhnisch) Wie, was meinst du? Worauf willst du hinaus?
		AI_Output(self, hero, "Info_Mod_Fuego_ElviraKey_32_11"); //Was es auch immer sein mag… ich würde dir raten besser nicht respektlos zu werden.
		AI_Output(self, hero, "Info_Mod_Fuego_ElviraKey_32_12"); //Und jetzt geh! Ich habe zu tun.
	};
};

INSTANCE Info_Mod_Fuego_ElviraKey2 (C_INFO)
{
	npc		= Mod_7425_KDF_Fuego_REL;
	nr		= 1;
	condition	= Info_Mod_Fuego_ElviraKey2_Condition;
	information	= Info_Mod_Fuego_ElviraKey2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich möchte Innos spenden. (100 Gold)";
};                       

FUNC INT Info_Mod_Fuego_ElviraKey2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cassia_Elvira))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Fuego_ElviraKey))
	&& (Npc_HasItems(Mod_7499_KDF_Elvira_REL, ItKe_RELMagier) == 1)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 100)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Fuego_ElviraKey2_Info()
{
	AI_Output(hero, self, "Info_Mod_Fuego_ElviraKey2_15_00"); //Ich möchte Innos spenden.
	AI_Output(self, hero, "Info_Mod_Fuego_ElviraKey2_32_01"); //Ich nehme deine großzügige Gabe für Innos und seine Kirche dankbar entgegen.

	B_Göttergefallen(1, 3);
};

INSTANCE Info_Mod_Fuego_DickeLuft (C_INFO)
{
	npc		= Mod_7425_KDF_Fuego_REL;
	nr		= 1;
	condition	= Info_Mod_Fuego_DickeLuft_Condition;
	information	= Info_Mod_Fuego_DickeLuft_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du Verwandlungsspruchrollen?";
};                       

FUNC INT Info_Mod_Fuego_DickeLuft_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Irmgard_Kneipe))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Anselm_DickeLuft))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Fuego_DickeLuft_Info()
{
	AI_Output(hero, self, "Info_Mod_Fuego_DickeLuft_15_00"); //Hast du Verwandlungsspruchrollen?
	AI_Output(self, hero, "Info_Mod_Fuego_DickeLuft_32_01"); //Ein paar habe ich noch übrig. Was darf's sein?
	AI_Output(hero, self, "Info_Mod_Fuego_DickeLuft_15_02"); //In ein Schaf.
	AI_Output(self, hero, "Info_Mod_Fuego_DickeLuft_32_03"); //(lacht auf) In ein Schaf? Wieso sollte man sich in so was verwandeln?
	AI_Output(self, hero, "Info_Mod_Fuego_DickeLuft_32_04"); //Das ist ja fast so beknackt wie eine Verwandlung in eine Fleischwanze!
	AI_Output(hero, self, "Info_Mod_Fuego_DickeLuft_15_05"); //Mag ja sein.
	AI_Output(self, hero, "Info_Mod_Fuego_DickeLuft_32_06"); //Da kann ich dir wirklich nicht behilflich sein. Ich habe nur nützliche Zauber.
	AI_Output(hero, self, "Info_Mod_Fuego_DickeLuft_15_07"); //Alles klar.
};

INSTANCE Info_Mod_Fuego_Freudenspender (C_INFO)
{
	npc		= Mod_7425_KDF_Fuego_REL;
	nr		= 1;
	condition	= Info_Mod_Fuego_Freudenspender_Condition;
	information	= Info_Mod_Fuego_Freudenspender_Info;
	permanent	= 0;
	important	= 0;
	description 	= "Brauchst du Freudenspender?";
};                       

FUNC INT Info_Mod_Fuego_Freudenspender_Condition()
{
	if (Npc_HasItems(hero, ItMi_Freudenspender) >= 1)
	&& (Mod_Freudenspender < 5)
	&& (Npc_KnowsInfo(hero, Info_Mod_Sabine_Hi))
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Fuego_Freudenspender_Info()
{
	AI_Output(hero, self, "Info_Mod_Fuego_Freudenspender_15_00"); //Brauchst du Freudenspender?
	AI_Output(self, hero, "Info_Mod_Fuego_Freudenspender_32_01"); //Hmm, eigentlich ist es mir untersagt, aber wenn du's für dich behältst ...
	AI_Output(hero, self, "Info_Mod_Fuego_Freudenspender_15_02"); //Selbstverständlich.

	B_GiveInvItems	(hero, self, ItMi_Freudenspender, 1);

	B_GiveInvItems	(self, hero, ItMi_Gold, 10);

	Mod_Freudenspender	+= 1;
};

INSTANCE Info_Mod_Fuego_Lernen (C_INFO)
{
	npc		= Mod_7425_KDF_Fuego_REL;
	nr		= 1;
	condition	= Info_Mod_Fuego_Lernen_Condition;
	information	= Info_Mod_Fuego_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich möchte meine magische Kraft erweitern.";
};

FUNC INT Info_Mod_Fuego_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fuego_Lehrer))
	&& (Mod_RealMana < 200)
	&& (Mod_FuegoLehrer == 1)
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fuego_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Fuego_Lernen_15_00"); //Ich möchte meine magische Kraft erweitern.

	Info_ClearChoices	(Info_Mod_Fuego_Lernen);

	Info_AddChoice		(Info_Mod_Fuego_Lernen, DIALOG_BACK, INFO_MOD_Fuego_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Fuego_Lernen, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Fuego_Lernen_5);
	Info_AddChoice		(Info_Mod_Fuego_Lernen, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Fuego_Lernen_1);
};

FUNC VOID Info_Mod_Fuego_Lernen_BACK()
{
	if (Mod_RealMana	>=	200)
	{
		AI_Output(self, hero, "Info_Mod_Fuego_Lernen_BACK_05_01"); //Deine magischen Kenntnisse sind jetzt so gut, dass ich dir nichts mehr beibringen kann.
	};
	Info_ClearChoices	(Info_Mod_Fuego_Lernen);
};

FUNC VOID Info_Mod_Fuego_Lernen_5()
{
	B_TeachAttributePoints_New (self, hero, ATR_MANA_MAX, 5, 200);

	Info_ClearChoices	(Info_Mod_Fuego_Lernen);

	Info_AddChoice		(Info_Mod_Fuego_Lernen, DIALOG_BACK, INFO_MOD_Fuego_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Fuego_Lernen, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Fuego_Lernen_5);
	Info_AddChoice		(Info_Mod_Fuego_Lernen, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Fuego_Lernen_1);
};

FUNC VOID Info_Mod_Fuego_Lernen_1()
{
	B_TeachAttributePoints (self, hero, ATR_MANA_MAX, 1, 200);

	Info_ClearChoices	(Info_Mod_Fuego_Lernen);

	Info_AddChoice		(Info_Mod_Fuego_Lernen, DIALOG_BACK, INFO_MOD_Fuego_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Fuego_Lernen, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Fuego_Lernen_5);
	Info_AddChoice		(Info_Mod_Fuego_Lernen, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Fuego_Lernen_1);
};

INSTANCE Info_Mod_Fuego_Pickpocket (C_INFO)
{
	npc		= Mod_7425_KDF_Fuego_REL;
	nr		= 1;
	condition	= Info_Mod_Fuego_Pickpocket_Condition;
	information	= Info_Mod_Fuego_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_180;
};

FUNC INT Info_Mod_Fuego_Pickpocket_Condition()
{
	C_Beklauen	(157, ItMi_Gold, 100);
};

FUNC VOID Info_Mod_Fuego_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Fuego_Pickpocket);

	Info_AddChoice	(Info_Mod_Fuego_Pickpocket, DIALOG_BACK, Info_Mod_Fuego_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Fuego_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Fuego_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Fuego_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Fuego_Pickpocket);
};

FUNC VOID Info_Mod_Fuego_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Fuego_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Fuego_Pickpocket);

		Info_AddChoice	(Info_Mod_Fuego_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Fuego_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Fuego_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Fuego_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Fuego_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Fuego_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Fuego_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Fuego_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Fuego_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Fuego_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Fuego_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Fuego_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Fuego_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Fuego_EXIT (C_INFO)
{
	npc		= Mod_7425_KDF_Fuego_REL;
	nr		= 1;
	condition	= Info_Mod_Fuego_EXIT_Condition;
	information	= Info_Mod_Fuego_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Fuego_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Fuego_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};