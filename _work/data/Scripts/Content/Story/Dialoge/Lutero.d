INSTANCE Info_Mod_Lutero_Hi (C_INFO)
{
	npc		= Mod_594_NONE_Lutero_NW;
	nr		= 1;
	condition	= Info_Mod_Lutero_Hi_Condition;
	information	= Info_Mod_Lutero_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Lutero_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Lutero_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Lutero_Hi_13_00"); //Hey Fremder, suchst du was bestimmtest? Ich hab ein paar seltene Sachen hier.
	
	Log_CreateTopic	(TOPIC_MOD_HAENDLER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_HAENDLER_STADT, "Lutero verkauft seltene Sachen.");
};

INSTANCE Info_Mod_Lutero_Lutero (C_INFO)
{
	npc		= Mod_594_NONE_Lutero_NW;
	nr		= 1;
	condition	= Info_Mod_Lutero_Lutero_Condition;
	information	= Info_Mod_Lutero_Lutero_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo.";
};

FUNC INT Info_Mod_Lutero_Lutero_Condition()
{
	if (Mod_MitLawrenceGesprochen == 7)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lutero_Lutero_Info()
{
	AI_Output(hero, self, "Info_Mod_Lutero_Lutero_15_00"); //Hallo.
	AI_Output(self, hero, "Info_Mod_Lutero_Lutero_13_01"); //Was willst d ... du bist von der Miliz? Was kann ich für dich tun?
	AI_Output(hero, self, "Info_Mod_Lutero_Lutero_15_02"); //Ich suche Lutero.
	AI_Output(self, hero, "Info_Mod_Lutero_Lutero_13_03"); //Oh… äh der ist fort. Ich bin Junur, sein Bruder.
	AI_Output(hero, self, "Info_Mod_Lutero_Lutero_15_04"); //Wohin ist Lutero gegangen?
	AI_Output(self, hero, "Info_Mod_Lutero_Lutero_13_05"); //Der? Ähm… Ich weiß es nicht. Vielleicht ins Minental. Ich bin erst heute angekommen und fand sein Haus leer vor.
	AI_Output(hero, self, "Info_Mod_Lutero_Lutero_15_06"); //Okay. Ich wollte mit ihm über etwas Wichtiges sprechen.
	AI_Output(self, hero, "Info_Mod_Lutero_Lutero_13_07"); //Etwas… Wichtiges?
	AI_Output(hero, self, "Info_Mod_Lutero_Lutero_15_08"); //Ja, es geht um den Erfinder.
	AI_Output(self, hero, "Info_Mod_Lutero_Lutero_13_09"); //U-u-um den Erfinder? Um was geht es genau? Habt ihr etwas über sein Verschwinden rausgefunden?
	AI_Output(hero, self, "Info_Mod_Lutero_Lutero_15_10"); //Woher weißt du vom Verschwinden des Erfinders? Du bist doch erst heute angekommen?
	AI_Output(self, hero, "Info_Mod_Lutero_Lutero_13_11"); //Ich … äh… ähm… Scheiße!

	B_LogEntry	(TOPIC_MOD_MILIZ_WISSENSCHAFTLER, "Lutero ist abgehauen, er scheint gemerkt zu haben, dass ich sein Spiel durchschaut habe. Vielleicht sollte ich mich hier mal umsehen, es könnte sein, dass er hier irgendeine Notiz oder so hat liegen lassen.");

	AI_StopProcessInfos	(self);
	
	B_StartOtherRoutine	(self, "FLUCHT");

	Mod_MitLawrenceGesprochen = 8;

	AI_SetWalkmode 		(self, NPC_RUN);
	Mdl_ApplyOverlayMds	(self, "HUMANS_FLEE.MDS");
};

INSTANCE Info_Mod_Lutero_SonjaFreier (C_INFO)
{
	npc		= Mod_594_NONE_Lutero_NW;
	nr		= 1;
	condition	= Info_Mod_Lutero_SonjaFreier_Condition;
	information	= Info_Mod_Lutero_SonjaFreier_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du Sonja früher regelmäßig besucht?";
};

FUNC INT Info_Mod_Lutero_SonjaFreier_Condition()
{
	if (Mod_Sonja_Freier == 1)
	&& (Npc_HasItems(hero, Info_Mod_Lutero_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lutero_SonjaFreier_Info()
{
	AI_Output(hero, self, "Info_Mod_Lutero_SonjaFreier_15_00"); //Hast du Sonja früher regelmäßig besucht?
	AI_Output(self, hero, "Info_Mod_Lutero_SonjaFreier_13_01"); //Ein, zwei Mal vielleicht. Aber Nadja gefiel mir schon immer besser.
	AI_Output(self, hero, "Info_Mod_Lutero_SonjaFreier_13_02"); //(vertraulich) Ich hatte ihr sogar mal versprochen, sie zu heiraten. Hoffentlich hat sie es vergessen.
	AI_Output(hero, self, "Info_Mod_Lutero_SonjaFreier_15_03"); //Dann bist du auch nicht der, den ich suche.
};

INSTANCE Info_Mod_Lutero_Blutkelch (C_INFO)
{
	npc		= Mod_594_NONE_Lutero_NW;
	nr		= 1;
	condition	= Info_Mod_Lutero_Blutkelch_Condition;
	information	= Info_Mod_Lutero_Blutkelch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du bist doch Raritätenhändler?";
};

FUNC INT Info_Mod_Lutero_Blutkelch_Condition()
{
	if (Npc_HasItems(hero, Info_Mod_Lutero_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Baltram_Blutkelch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lutero_Blutkelch_Info()
{
	AI_Output(hero, self, "Info_Mod_Lutero_Blutkelch_15_00"); //Du bist doch Raritätenhändler?
	AI_Output(self, hero, "Info_Mod_Lutero_Blutkelch_13_01"); //Wohl war. Leider, könnte man sagen.
	AI_Output(hero, self, "Info_Mod_Lutero_Blutkelch_15_02"); //Warum leider?
	AI_Output(self, hero, "Info_Mod_Lutero_Blutkelch_13_03"); //Die Leute hier in der Stadt interessieren sich kaum für Raritäten.
	AI_Output(self, hero, "Info_Mod_Lutero_Blutkelch_13_04"); //Nicht mal meine Seide werde ich hier los. Feinste Ware vom Festland ...
	AI_Output(hero, self, "Info_Mod_Lutero_Blutkelch_15_05"); //Dann solltest du mal nach Relendel gehen. In Khorata gibt's einen Raritätenverkäufer, dem reißen die Leute die Ware aus den Händen.
	AI_Output(self, hero, "Info_Mod_Lutero_Blutkelch_13_06"); //Ist nicht wahr! Relendel sagst du? Soll ziemlich weit sein. Hmm ... Vielleicht sollte ich ...
	AI_Output(hero, self, "Info_Mod_Lutero_Blutkelch_15_07"); //Vielleicht kommen wir ins Geschäft. Einen Kelch suche ich. Einen Blutkelch.
	AI_Output(self, hero, "Info_Mod_Lutero_Blutkelch_13_08"); //Nie von sowas gehört. Außerdem handle ich nicht mit Trinkgefäßen.
};

INSTANCE Info_Mod_Lutero_Anschlagtafel (C_INFO)
{
	npc		= Mod_594_NONE_Lutero_NW;
	nr		= 1;
	condition	= Info_Mod_Lutero_Anschlagtafel_Condition;
	information	= Info_Mod_Lutero_Anschlagtafel_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich habe deinen Aushang an der Anschlagtafel gesehen ...";
};

FUNC INT Info_Mod_Lutero_Anschlagtafel_Condition()
{
	if (Mod_Anschlagtafel_Khorinis_Lutero == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lutero_Anschlagtafel_Info()
{
	B_Say	(hero, self, "$ANSCHLAGTAFEL01");

	if (Npc_HasItems(hero, ItMi_SilverCup) >= Mod_Anschlagtafel_Khorinis_Lutero_Silberkelch)
	&& (Npc_HasItems(hero, ItMi_SilverPlate) >= Mod_Anschlagtafel_Khorinis_Lutero_Silberteller)
	&& (Npc_HasItems(hero, ItMi_SilverCandleholder) >= Mod_Anschlagtafel_Khorinis_Lutero_SilbernerKerzenstaender)
	&& (Npc_HasItems(hero, ItMi_GoldCup) >= Mod_Anschlagtafel_Khorinis_Lutero_Goldkelch)
	&& (Npc_HasItems(hero, ItAt_TrollTooth) >= Mod_Anschlagtafel_Khorinis_Lutero_Trollhauer)
	&& (Npc_HasItems(hero, ItAt_DrgSnapperHorn) >= Mod_Anschlagtafel_Khorinis_Lutero_Drachensnapperhorn)
	&& (Npc_HasItems(hero, ItAt_SharkTeeth) >= Mod_Anschlagtafel_Khorinis_Lutero_Sumpfhaizahn)
	&& (Npc_HasItems(hero, ItAt_SharkSkin) >= Mod_Anschlagtafel_Khorinis_Lutero_Sumpfhaihaut)
	&& (Npc_HasItems(hero, ItAm_Prot_Fire_01) >= Mod_Anschlagtafel_Khorinis_Lutero_FlammenAmulett)
	&& (Npc_HasItems(hero, ItMi_Runeblank) >= Mod_Anschlagtafel_Khorinis_Lutero_Runenstein)
	&& (Npc_HasItems(hero, ItAt_StoneGolemHeart) >= Mod_Anschlagtafel_Khorinis_Lutero_Steingolemherz)
	&& (Npc_HasItems(hero, ItAt_DemonHeart) >= Mod_Anschlagtafel_Khorinis_Lutero_Daemonenherz)
	&& (Npc_HasItems(hero, ItMi_GoldRing) >= Mod_Anschlagtafel_Khorinis_Lutero_Goldring)
	{
		Npc_RemoveInvItems	(hero, ItMi_SilverCup, Mod_Anschlagtafel_Khorinis_Lutero_Silberkelch);
		Npc_RemoveInvItems	(hero, ItMi_SilverPlate, Mod_Anschlagtafel_Khorinis_Lutero_Silberteller);
		Npc_RemoveInvItems	(hero, ItMi_SilverCandleholder, Mod_Anschlagtafel_Khorinis_Lutero_SilbernerKerzenstaender);
		Npc_RemoveInvItems	(hero, ItMi_GoldCup, Mod_Anschlagtafel_Khorinis_Lutero_Goldkelch);
		Npc_RemoveInvItems	(hero, ItAt_TrollTooth, Mod_Anschlagtafel_Khorinis_Lutero_Trollhauer);
		Npc_RemoveInvItems	(hero, ItAt_DrgSnapperHorn, Mod_Anschlagtafel_Khorinis_Lutero_Drachensnapperhorn);
		Npc_RemoveInvItems	(hero, ItAt_SharkTeeth, Mod_Anschlagtafel_Khorinis_Lutero_Sumpfhaizahn);
		Npc_RemoveInvItems	(hero, ItAt_SharkSkin, Mod_Anschlagtafel_Khorinis_Lutero_Sumpfhaihaut);
		Npc_RemoveInvItems	(hero, ItAm_Prot_Fire_01, Mod_Anschlagtafel_Khorinis_Lutero_FlammenAmulett);
		Npc_RemoveInvItems	(hero, ItMi_Runeblank, Mod_Anschlagtafel_Khorinis_Lutero_Runenstein);
		Npc_RemoveInvItems	(hero, ItAt_StoneGolemHeart, Mod_Anschlagtafel_Khorinis_Lutero_Steingolemherz);
		Npc_RemoveInvItems	(hero, ItAt_DemonHeart, Mod_Anschlagtafel_Khorinis_Lutero_Daemonenherz);
		Npc_RemoveInvItems	(hero, ItMi_GoldRing, Mod_Anschlagtafel_Khorinis_Lutero_Goldring);

		AI_Output(self, hero, "Info_Mod_Lutero_Anschlagtafel_13_00"); //Was? Zeig her ... Tatsächlich, alles dabei. Ausgesprochen gut gemacht.
		AI_Output(self, hero, "Info_Mod_Lutero_Anschlagtafel_13_01"); //Hier ist deine Entlohnung.

		B_GiveInvItems	(self, hero, ItMi_Gold, Mod_Anschlagtafel_Khorinis_Lutero_Gold);

		AI_Output(self, hero, "Info_Mod_Lutero_Anschlagtafel_13_02"); //Hat mich gefreut mit dir Geschäfte zu machen.

		if (Mod_Anschlagtafel_Khorinis_Lutero_Gold < 200)
		{
			B_GivePlayerXP	(300);
		}
		else if (Mod_Anschlagtafel_Khorinis_Lutero_Gold < 400)
		{
			B_GivePlayerXP	(400);
		}
		else if (Mod_Anschlagtafel_Khorinis_Lutero_Gold < 600)
		{
			B_GivePlayerXP	(500);
		}
		else
		{
			B_GivePlayerXP	(600);
		};

		Mod_Anschlagtafel_Khorinis_Lutero = 0;
		Mod_Anschlagtafel_Khorinis_Lutero_Cooldown = 3600;

		Npc_RemoveInvItems	(hero, ItWr_Anschlagtafel_Lutero, 1);
	}
	else
	{
		B_Say	(hero, self, "$ANSCHLAGTAFEL02");
	};
};

INSTANCE Info_Mod_Lutero_Trade (C_INFO)
{
	npc		= Mod_594_NONE_Lutero_NW;
	nr		= 1;
	condition	= Info_Mod_Lutero_Trade_Condition;
	information	= Info_Mod_Lutero_Trade_Info;
	permanent	= 1;
	important	= 0;
	trade		= 1;
	description	= DIALOG_TRADE;
};

FUNC INT Info_Mod_Lutero_Trade_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lutero_Hi))
	&& (Mod_MitLawrenceGesprochen < 7)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Lutero_Trade_Info()
{
	Backup_Questitems();

	B_GiveTradeInv (self);
	B_Say (hero, self, "$TRADE_1");
};

INSTANCE Info_Mod_Lutero_Pickpocket (C_INFO)
{
	npc		= Mod_594_NONE_Lutero_NW;
	nr		= 1;
	condition	= Info_Mod_Lutero_Pickpocket_Condition;
	information	= Info_Mod_Lutero_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Lutero_Pickpocket_Condition()
{
	C_Beklauen	(68, ItMi_Gold, 400);
};

FUNC VOID Info_Mod_Lutero_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Lutero_Pickpocket);

	Info_AddChoice	(Info_Mod_Lutero_Pickpocket, DIALOG_BACK, Info_Mod_Lutero_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Lutero_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Lutero_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Lutero_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Lutero_Pickpocket);
};

FUNC VOID Info_Mod_Lutero_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Lutero_Pickpocket);
};

INSTANCE Info_Mod_Lutero_EXIT (C_INFO)
{
	npc		= Mod_594_NONE_Lutero_NW;
	nr		= 1;
	condition	= Info_Mod_Lutero_EXIT_Condition;
	information	= Info_Mod_Lutero_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Lutero_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Lutero_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};