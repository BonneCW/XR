INSTANCE Info_Mod_Sonja_Hi (C_INFO)
{
	npc		= Mod_752_NONE_Sonja_NW;
	nr		= 1;
	condition	= Info_Mod_Sonja_Hi_Condition;
	information	= Info_Mod_Sonja_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Arbeitest du hier?";
};

FUNC INT Info_Mod_Sonja_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Sonja_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Sonja_Hi_15_00"); //Arbeitest du hier?
	AI_Output(self, hero, "Info_Mod_Sonja_Hi_16_01"); //Na, wonach sieht's denn aus? Kann ich dich irgendwie ... zufrieden stellen?
};

INSTANCE Info_Mod_Sonja_News (C_INFO)
{
	npc		= Mod_752_NONE_Sonja_NW;
	nr		= 1;
	condition	= Info_Mod_Sonja_News_Condition;
	information	= Info_Mod_Sonja_News_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du bekommst doch hier sicher auch einiges an Neuigkeiten mit.";
};

FUNC INT Info_Mod_Sonja_News_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sonja_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sonja_News_Info()
{
	AI_Output(hero, self, "Info_Mod_Sonja_News_15_00"); //Du bekommst doch hier sicher auch einiges an Neuigkeiten mit.
	AI_Output(self, hero, "Info_Mod_Sonja_News_16_01"); //In den Armen einer gefühlvollen Frau wird jeder schweigsame Mann zum geschwätzigen Knaben.
	AI_Output(self, hero, "Info_Mod_Sonja_News_16_02"); //Ja, ich kenne mich von Matteos Heirat bis zu Constantinos geheimen Vorlieben aus.
	AI_Output(hero, self, "Info_Mod_Sonja_News_15_03"); //Und was hörst du so von deinen Kunden?
	AI_Output(self, hero, "Info_Mod_Sonja_News_16_04"); //Ich höre viel Ungewissheit und Verzweiflung wegen des Falls der Barriere.
	AI_Output(self, hero, "Info_Mod_Sonja_News_16_05"); //Einige meiner Kunden fürchten, dass sich die „wilden und ungehobelten Barbaren“ aus der Kolonie über ihre Besitztümer hermachen.
	AI_Output(self, hero, "Info_Mod_Sonja_News_16_06"); //Andererseits beschweren sich auch viele über die strenge Kontrolle durch die Paladine.
	AI_Output(self, hero, "Info_Mod_Sonja_News_16_07"); //Aber die meisten krächzen mir nur ins Ohr, wie gut ich denn wäre. (lacht)
};

INSTANCE Info_Mod_Sonja_Sex (C_INFO)
{
	npc		= Mod_752_NONE_Sonja_NW;
	nr		= 1;
	condition	= Info_Mod_Sonja_Sex_Condition;
	information	= Info_Mod_Sonja_Sex_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich würde gern deine Dienste in Anspruch nehmen.";
};

FUNC INT Info_Mod_Sonja_Sex_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sonja_Hi))
	&& (Mod_SonjaSex == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sonja_Sex_Info()
{
	AI_Output(hero, self, "Info_Mod_Sonja_Sex_15_00"); //Ich würde gern deine Dienste in Anspruch nehmen.
	AI_Output(self, hero, "Info_Mod_Sonja_Sex_16_01"); //Für 100 Goldstücke gehöre ich die ganze Nacht dir, Süßer. Eine ganze aufregende Nacht.

	Info_ClearChoices	(Info_Mod_Sonja_Sex);

	Info_AddChoice	(Info_Mod_Sonja_Sex, "Vielleicht später.", Info_Mod_Sonja_Sex_B);

	if (Npc_HasItems(hero, ItMi_Gold) >= 100)
	{
		Info_AddChoice	(Info_Mod_Sonja_Sex, "Lass uns nach oben gehen. (100 Gold)", Info_Mod_Sonja_Sex_A);
	};
};

FUNC VOID Info_Mod_Sonja_Sex_B()
{
	AI_Output(hero, self, "Info_Mod_Sonja_Sex_B_15_00"); //Vielleicht später.

	Info_ClearChoices	(Info_Mod_Sonja_Sex);
};

FUNC VOID Info_Mod_Sonja_Sex_A()
{
	AI_Output(hero, self, "Info_Mod_Sonja_Sex_A_15_00"); //Lass uns nach oben gehen.

	B_GiveInvItems	(hero, self, ItMi_Gold, 100);

	Mod_SonjaSex = 1;

	Info_ClearChoices	(Info_Mod_Sonja_Sex);

	AI_StopProcessInfos	(hero);

	B_StartOtherRoutine	(self, "SEX");
};

INSTANCE Info_Mod_Sonja_SexLos (C_INFO)
{
	npc		= Mod_752_NONE_Sonja_NW;
	nr		= 1;
	condition	= Info_Mod_Sonja_SexLos_Condition;
	information	= Info_Mod_Sonja_SexLos_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Sonja_SexLos_Condition()
{
	if (Mod_SonjaSex == 1)
	&& (Npc_GetDistToWP(self, "NW_CITY_HABOUR_PUFF_NADJA") < 300)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sonja_SexLos_Info()
{
	AI_Output(self, hero, "Info_Mod_Sonja_SexLos_16_00"); //Entspann dich, Süßer.

	PlayVideo ("LOVESCENE.BIK");

	Mod_SonjaSex = 0;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
	
	Spine_OverallSaveSetInt("SonjaSex", 1);
	CheckSexAchievement();
};

INSTANCE Info_Mod_Sonja_Bartok (C_INFO)
{
	npc		= Mod_752_NONE_Sonja_NW;
	nr		= 1;
	condition	= Info_Mod_Sonja_Bartok_Condition;
	information	= Info_Mod_Sonja_Bartok_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Sonja_Bartok_Condition()
{
	if (Mod_KampfGegenBartokVerloren == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sonja_Bartok_Info()
{
	AI_Output(self, hero, "Info_Mod_Sonja_Bartok_16_00"); //Hey du! Ich hab gesehen, wie du von Bartok verprügelt wurdest. Vielleicht kann ich dir helfen.
	AI_Output(hero, self, "Info_Mod_Sonja_Bartok_15_01"); //Wie willst du mir helfen?
	AI_Output(self, hero, "Info_Mod_Sonja_Bartok_16_02"); //Nun ja, ich könnte zu Bartok gehen und ein wenig Zeit mit ihm verbringen und dann dafür sorgen, dass er auf dich hört.
	AI_Output(hero, self, "Info_Mod_Sonja_Bartok_15_03"); //Und was soll ich dafür machen?
	AI_Output(self, hero, "Info_Mod_Sonja_Bartok_16_04"); //Noch nichts, aber ich werde schon noch auf dich zurückkommen.

	Npc_ExchangeRoutine	(self, "BARTOK");

	Mod_SonjaHilftGegenBartok = Wld_GetDay();
};

INSTANCE Info_Mod_Sonja_Freier (C_INFO)
{
	npc		= Mod_752_NONE_Sonja_NW;
	nr		= 1;
	condition	= Info_Mod_Sonja_Freier_Condition;
	information	= Info_Mod_Sonja_Freier_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Sonja_Freier_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sonja_Bartok))
	&& (Wld_GetDay()-8 >= Mod_SonjaHilftGegenBartok)
	&& (Kapitel >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sonja_Freier_Info()
{
	AI_Output(self, hero, "Info_Mod_Sonja_Freier_16_00"); //Erinnerst du dich an dein kleines Versprechen, Süßer?
	AI_Output(hero, self, "Info_Mod_Sonja_Freier_15_01"); //Ich schulde dir noch einen Gefallen.
	AI_Output(self, hero, "Info_Mod_Sonja_Freier_16_02"); //Nun ist der Zeitpunkt, da ich darauf zurückkommen muss.

	Info_ClearChoices	(Info_Mod_Sonja_Freier);

	Info_AddChoice	(Info_Mod_Sonja_Freier, "Das interessiert mich nicht.", Info_Mod_Sonja_Freier_B);
	Info_AddChoice	(Info_Mod_Sonja_Freier, "Was gibt es zu tun?", Info_Mod_Sonja_Freier_A);
};

FUNC VOID Info_Mod_Sonja_Freier_B()
{
	AI_Output(hero, self, "Info_Mod_Sonja_Freier_B_15_00"); //Das interessiert mich nicht.
	AI_Output(self, hero, "Info_Mod_Sonja_Freier_B_16_01"); //(gekränkt) Ich hatte gehofft, dass ich mich auf dich verlassen kann.

	Info_ClearChoices	(Info_Mod_Sonja_Freier);
};

FUNC VOID Info_Mod_Sonja_Freier_A()
{
	AI_Output(hero, self, "Info_Mod_Sonja_Freier_A_15_00"); //Was gibt es zu tun?
	AI_Output(self, hero, "Info_Mod_Sonja_Freier_A_16_01"); //Einer meiner häufigsten Freier ist schon seit einer ganzen Weile nicht mehr aufgekreuzt.
	AI_Output(self, hero, "Info_Mod_Sonja_Freier_A_16_02"); //Ich habe nichts davon gehört, dass ihm etwas zugestoßen ist, also muss es andere Gründe geben, warum er mich nicht mehr besucht.
	AI_Output(hero, self, "Info_Mod_Sonja_Freier_A_15_03"); //Wer ist dieser Freier?
	AI_Output(self, hero, "Info_Mod_Sonja_Freier_A_16_04"); //Das darf ich dir nicht sagen. Berufsgeheimnis.
	AI_Output(hero, self, "Info_Mod_Sonja_Freier_A_15_05"); //Und warum siehst du dann nicht selbst nach ihm?
	AI_Output(self, hero, "Info_Mod_Sonja_Freier_A_16_06"); //Weil er im Oberen Viertel wohnt, Dummchen. Dort habe ich keinen Zutritt.

	if (Mil_305_Torwache.aivar[AIV_Passgate] == FALSE)
	{
		AI_Output(self, hero, "Info_Mod_Sonja_Freier_A_16_07"); //Aber du bist so ein aufstrebender junger Mann, du wirst sicher bald Gelegenheit haben.
	};

	AI_Output(hero, self, "Info_Mod_Sonja_Freier_A_15_08"); //Also soll ich jetzt wohl das ganze Obere Viertel nach deinem Freier absuchen?
	AI_Output(self, hero, "Info_Mod_Sonja_Freier_A_16_09"); //Ich kann dir noch verraten, dass es sich nicht um einen der Paladine oder Milizionäre handelt. Da sollte die Auswahl doch nicht mehr allzu groß sein.
	AI_Output(self, hero, "Info_Mod_Sonja_Freier_A_16_10"); //Wenn du ihn gefunden hast, bitte ihn, dass er mal wieder bei mir vorbeischauen soll.

	Mod_Sonja_Freier = 1;

	Log_createTopic	(TOPIC_MOD_SONJA_FREIER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SONJA_FREIER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_SONJA_FREIER, "Ein Kunde von Sonja besucht sie schon seit einiger Zeit nicht mehr. Sie will mir seinen Namen nicht nennen, aber er wohnt im Oberen Viertel und gehört weder zur Miliz noch zu den Paladinen.");

	Info_ClearChoices	(Info_Mod_Sonja_Freier);
};

INSTANCE Info_Mod_Sonja_Freier2 (C_INFO)
{
	npc		= Mod_752_NONE_Sonja_NW;
	nr		= 1;
	condition	= Info_Mod_Sonja_Freier2_Condition;
	information	= Info_Mod_Sonja_Freier2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Fernando hatte Stress mit seiner Frau.";
};

FUNC INT Info_Mod_Sonja_Freier2_Condition()
{
	if (Mod_Sonja_Freier == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sonja_Freier2_Info()
{
	AI_Output(hero, self, "Info_Mod_Sonja_Freier2_15_00"); //Fernando hatte Stress mit seiner Frau. Er wagt sich nicht mehr hier her.
	AI_Output(self, hero, "Info_Mod_Sonja_Freier2_16_01"); //Äußerst schade. Er war immer so gut zu mir.
	AI_Output(self, hero, "Info_Mod_Sonja_Freier2_16_02"); //Aber er wird schon zurück kommen, da bin ich mir sicher. 
	AI_Output(self, hero, "Info_Mod_Sonja_Freier2_16_03"); //Er hat mir viel über seine Frau erzählt. Seine Ehe ist nicht für die Ewigkeit geschaffen.
	AI_Output(self, hero, "Info_Mod_Sonja_Freier2_16_04"); //In der Zwischenzeit könnten wir zwei uns die Zeit vertreiben, Süßer. (lacht anzüglich)

	B_GiveInvItems	(self, hero, ItMi_Gold, 50);

	B_GivePlayerXP	(100);

	B_SetTopicStatus	(TOPIC_MOD_SONJA_FREIER, LOG_SUCCESS);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Sonja_Pickpocket (C_INFO)
{
	npc		= Mod_752_NONE_Sonja_NW;
	nr		= 1;
	condition	= Info_Mod_Sonja_Pickpocket_Condition;
	information	= Info_Mod_Sonja_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60_Female;
};

FUNC INT Info_Mod_Sonja_Pickpocket_Condition()
{
	C_Beklauen	(38, ItMi_Gold, 19);
};

FUNC VOID Info_Mod_Sonja_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Sonja_Pickpocket);

	Info_AddChoice	(Info_Mod_Sonja_Pickpocket, DIALOG_BACK, Info_Mod_Sonja_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Sonja_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Sonja_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Sonja_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Sonja_Pickpocket);
};

FUNC VOID Info_Mod_Sonja_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Sonja_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Sonja_Pickpocket);

		Info_AddChoice	(Info_Mod_Sonja_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Sonja_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Sonja_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Sonja_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Sonja_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Sonja_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Sonja_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Sonja_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Sonja_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Sonja_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Sonja_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Sonja_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Sonja_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Sonja_EXIT (C_INFO)
{
	npc		= Mod_752_NONE_Sonja_NW;
	nr		= 1;
	condition	= Info_Mod_Sonja_EXIT_Condition;
	information	= Info_Mod_Sonja_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Sonja_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Sonja_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};