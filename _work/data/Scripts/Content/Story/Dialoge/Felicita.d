INSTANCE Info_Mod_Felicita_Hi (C_INFO)
{
	npc		= Mod_7281_OUT_Felicita_REL;
	nr		= 1;
	condition	= Info_Mod_Felicita_Hi_Condition;
	information	= Info_Mod_Felicita_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Felicita_Hi_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Schneider_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Felicita_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Felicita_Hi_16_00"); //Auf ein Wort, Fremder. Du siehst so aufgeräumt aus. Würdest du mir einen Gefallen tun?
};

INSTANCE Info_Mod_Felicita_AufgabeJa (C_INFO)
{
	npc		= Mod_7281_OUT_Felicita_REL;
	nr		= 1;
	condition	= Info_Mod_Felicita_AufgabeJa_Condition;
	information	= Info_Mod_Felicita_AufgabeJa_Info;
	permanent	= 0;
	important	= 0;
	description	= "Einer so schönen Frau helfe ich gerne.";
};

FUNC INT Info_Mod_Felicita_AufgabeJa_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Felicita_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Felicita_AufgabeNein))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Felicita_AufgabeJa_Info()
{
	AI_Output(hero, self, "Info_Mod_Felicita_AufgabeJa_15_00"); //Einer so schönen Frau helfe ich gerne. Außerdem habe ich etwas Zeit.
	AI_Output(hero, self, "Info_Mod_Felicita_AufgabeJa_15_01"); //Was kann ich für dich tun?
	AI_Output(self, hero, "Info_Mod_Felicita_AufgabeJa_16_02"); //Ich bin Felicita, die Frau von August, dem Torwächter.
	AI_Output(self, hero, "Info_Mod_Felicita_AufgabeJa_16_03"); //Nun tuscheln die Weiber in meiner Nachbarschaft, er würde nicht nur das Tor bewachen, wenn es abends dunkel wird.
	AI_Output(self, hero, "Info_Mod_Felicita_AufgabeJa_16_04"); //Ich möchte zu gerne wissen, ob da was dran ist.
	AI_Output(hero, self, "Info_Mod_Felicita_AufgabeJa_15_05"); //Das kann ich machen. Aber warum schaust du nicht selber nach?
	AI_Output(self, hero, "Info_Mod_Felicita_AufgabeJa_16_06"); //Ich hab Angst im Dunkeln. Als Kind hatte ich ...
	AI_Output(hero, self, "Info_Mod_Felicita_AufgabeJa_15_07"); //Verstehe. Ich kümmer mich darum.
	AI_Output(self, hero, "Info_Mod_Felicita_AufgabeJa_16_08"); //Danke vielmals. Du findest mich im alten Viertel, hinten rechts.

	Log_CreateTopic	(TOPIC_MOD_ASS_FELICITA, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_ASS_FELICITA, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_ASS_FELICITA, "Felicita bat mich darum herauszufinden, ob ihr Mann August sie betrügt. Ich finde ihn am Tor der Stadt.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
	B_StartOtherRoutine	(Mod_7385_OUT_August_REL, "FREMDGANG");
	B_StartOtherRoutine	(Mod_7343_OUT_Buergerin_REL, "FREMDGANG");
};

INSTANCE Info_Mod_Felicita_AufgabeNein (C_INFO)
{
	npc		= Mod_7281_OUT_Felicita_REL;
	nr		= 1;
	condition	= Info_Mod_Felicita_AufgabeNein_Condition;
	information	= Info_Mod_Felicita_AufgabeNein_Info;
	permanent	= 0;
	important	= 0;
	description	= "Würde ich gerne. Hab im Moment leider keine Zeit. Vielleicht später.";
};

FUNC INT Info_Mod_Felicita_AufgabeNein_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Felicita_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Felicita_AufgabeJa))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Felicita_AufgabeNein_Info()
{
	AI_Output(hero, self, "Info_Mod_Felicita_AufgabeNein_15_00"); //Würde ich gerne. Hab im Moment leider keine Zeit. Vielleicht später.
};

INSTANCE Info_Mod_Felicita_Belauscht (C_INFO)
{
	npc		= Mod_7281_OUT_Felicita_REL;
	nr		= 1;
	condition	= Info_Mod_Felicita_Belauscht_Condition;
	information	= Info_Mod_Felicita_Belauscht_Info;
	permanent	= 0;
	important	= 0;
	description	= "Guten Abend kann ich leider nicht sagen.";
};

FUNC INT Info_Mod_Felicita_Belauscht_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Felicita_AufgabeJa))
	&& (Mod_ASS_Felicita == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Felicita_Belauscht_Info()
{
	AI_Output(hero, self, "Info_Mod_Felicita_Belauscht_15_00"); //Guten Abend kann ich leider nicht sagen.
	AI_Output(self, hero, "Info_Mod_Felicita_Belauscht_16_01"); //Das heißt, du hast meinen Mann ertappt?
	AI_Output(hero, self, "Info_Mod_Felicita_Belauscht_15_02"); //Nicht in flagranti. Ich hörte ihn mit einer Frau reden. Unter der großen Birke draussen.
	AI_Output(self, hero, "Info_Mod_Felicita_Belauscht_16_03"); //Das reicht mir. Dieser Strolch! Seit er dieses Teufelszeug schluckt, ist er wie ausgewechselt.
	AI_Output(hero, self, "Info_Mod_Felicita_Belauscht_15_04"); //Du meinst dieses Freudenspender?
	AI_Output(self, hero, "Info_Mod_Felicita_Belauscht_16_05"); //Genau. Jetzt ist's genug. Ich lasse mich scheiden und werfe ihn raus aus meinem Haus.
	AI_Output(self, hero, "Info_Mod_Felicita_Belauscht_16_06"); //Hier, diesen Goldring schenke ich dir.

	B_GiveInvItems	(self, hero, ItMi_Hochzeitsring, 1);

	AI_Output(hero, self, "Info_Mod_Felicita_Belauscht_15_07"); //Dein Hochzeitsring?
	AI_Output(self, hero, "Info_Mod_Felicita_Belauscht_16_08"); //Das war er mal. Nimm!

	B_LogEntry	(TOPIC_MOD_ASS_FELICITA, "Habe den Torwächter August mit einer anderen Frau erwischt und Felicita berichtet. Sie gab mir ihren Hochzeitsring dafür.");
	B_SetTopicStatus	(TOPIC_MOD_ASS_FELICITA, LOG_SUCCESS);

	B_GivePlayerXP	(100);

	B_StartOtherRoutine	(Mod_7385_OUT_August_REL, "FREMDGANG");
	B_StartOtherRoutine	(Mod_7343_OUT_Buergerin_REL, "FREMDGANG");
};

INSTANCE Info_Mod_Felicita_Pickpocket (C_INFO)
{
	npc		= Mod_7281_OUT_Felicita_REL;
	nr		= 1;
	condition	= Info_Mod_Felicita_Pickpocket_Condition;
	information	= Info_Mod_Felicita_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60_Female;
};

FUNC INT Info_Mod_Felicita_Pickpocket_Condition()
{
	C_Beklauen	(42, ItMi_Gold, 100);
};

FUNC VOID Info_Mod_Felicita_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Felicita_Pickpocket);

	Info_AddChoice	(Info_Mod_Felicita_Pickpocket, DIALOG_BACK, Info_Mod_Felicita_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Felicita_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Felicita_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Felicita_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Felicita_Pickpocket);
};

FUNC VOID Info_Mod_Felicita_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Felicita_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Felicita_Pickpocket);

		Info_AddChoice	(Info_Mod_Felicita_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Felicita_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Felicita_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Felicita_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Felicita_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Felicita_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Felicita_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Felicita_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Felicita_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Felicita_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Felicita_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Felicita_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Felicita_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Felicita_EXIT (C_INFO)
{
	npc		= Mod_7281_OUT_Felicita_REL;
	nr		= 1;
	condition	= Info_Mod_Felicita_EXIT_Condition;
	information	= Info_Mod_Felicita_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Felicita_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Felicita_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};