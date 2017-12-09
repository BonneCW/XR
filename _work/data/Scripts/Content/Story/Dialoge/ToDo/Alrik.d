var int MerkLebenspunkteHeldAlrik;
var int MerkLebenspunkteAlrik;

INSTANCE Info_Mod_Alrik_Hi (C_INFO)
{
	npc		= Mod_547_NONE_Alrik_NW;
	nr		= 1;
	condition	= Info_Mod_Alrik_Hi_Condition;
	information	= Info_Mod_Alrik_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Alrik_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Alrik_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Alrik_Hi_09_01"); //Ich bin Alrik.

	if (Npc_GetDistToWP(self, "NW_CITY_PATH_HABOUR_16_01") < 1000)
	{
		AI_Output(self, hero, "Info_Mod_Alrik_Hi_09_02"); //Ich mach hier manchmal Schaukämpfe.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Alrik_Hi_09_03"); //Ich mach manchmal Schaukämpfe hinter dem Lagerhaus im Hafenviertel.
	};

	AI_Output(self, hero, "Info_Mod_Alrik_Hi_09_04"); //Du kannst mich auch mal herausfordern, wenn du willst.
	AI_Output(self, hero, "Info_Mod_Alrik_Hi_09_05"); //Der Einsatz beträgt für jeden Teilnehmer 100 Goldmünzen.

	B_StartOtherRoutine	(self, "START");
	B_StartOtherRoutine	(Mod_1051_VLK_Buerger_NW, "START");
};

INSTANCE Info_Mod_Alrik_Regeln (C_INFO)
{
	npc		= Mod_547_NONE_Alrik_NW;
	nr		= 1;
	condition	= Info_Mod_Alrik_Regeln_Condition;
	information	= Info_Mod_Alrik_Regeln_Info;
	permanent	= 0;
	important	= 0;
	description	= "Gibt es Regeln beim Kampf?";
};

FUNC INT Info_Mod_Alrik_Regeln_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alrik_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alrik_Regeln_Info()
{
	AI_Output(hero, self, "Info_Mod_Alrik_Regeln_15_00"); //Gibt es Regeln beim Kampf?
	AI_Output(self, hero, "Info_Mod_Alrik_Regeln_09_01"); //Keine Magie, keine Fernwaffen. Wenn dein Gegner am Boden liegt, hast du gewonnen.
	AI_Output(self, hero, "Info_Mod_Alrik_Regeln_09_02"); //Und nichts an die Miliz weitersagen. (lacht)
};

INSTANCE Info_Mod_Alrik_Kap2 (C_INFO)
{
	npc		= Mod_547_NONE_Alrik_NW;
	nr		= 1;
	condition	= Info_Mod_Alrik_Kap2_Condition;
	information	= Info_Mod_Alrik_Kap2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alrik_Kap2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alrik_Hi))
	&& (Npc_GetDistToWP(self, "NW_CITY_PATH_HABOUR_16_01") < 1000)
	&& (Mod_AlrikSchaukampf == 1)
	&& (Kapitel >= 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alrik_Kap2_Info()
{
	AI_Output(self, hero, "Info_Mod_Alrik_Kap2_09_00"); //Ich bin stärker geworden. Lass es uns noch mal probieren.

	Mod_AlrikSchaukampf = 0;
};

INSTANCE Info_Mod_Alrik_Kap3 (C_INFO)
{
	npc		= Mod_547_NONE_Alrik_NW;
	nr		= 1;
	condition	= Info_Mod_Alrik_Kap3_Condition;
	information	= Info_Mod_Alrik_Kap3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alrik_Kap3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alrik_Hi))
	&& (Npc_GetDistToWP(self, "NW_CITY_PATH_HABOUR_16_01") < 1000)
	&& (Mod_AlrikSchaukampf == 1)
	&& (Kapitel >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alrik_Kap3_Info()
{
	AI_Output(self, hero, "Info_Mod_Alrik_Kap3_09_00"); //Deine Bekanntheit steigt. Wie gerne würde ich dich endlich mal besiegen.

	Mod_AlrikSchaukampf = 0;
};

INSTANCE Info_Mod_Alrik_Kap4 (C_INFO)
{
	npc		= Mod_547_NONE_Alrik_NW;
	nr		= 1;
	condition	= Info_Mod_Alrik_Kap4_Condition;
	information	= Info_Mod_Alrik_Kap4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alrik_Kap4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alrik_Hi))
	&& (Npc_GetDistToWP(self, "NW_CITY_PATH_HABOUR_16_01") < 1000)
	&& (Mod_AlrikSchaukampf == 1)
	&& (Kapitel >= 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alrik_Kap4_Info()
{
	AI_Output(self, hero, "Info_Mod_Alrik_Kap4_09_00"); //Ich habe so hart wie noch nie in meinem Leben trainiert, um dir gewachsen zu sein.

	Mod_AlrikSchaukampf = 0;
};

INSTANCE Info_Mod_Alrik_Kap5 (C_INFO)
{
	npc		= Mod_547_NONE_Alrik_NW;
	nr		= 1;
	condition	= Info_Mod_Alrik_Kap2_Condition;
	information	= Info_Mod_Alrik_Kap2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alrik_Kap5_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alrik_Hi))
	&& (Npc_GetDistToWP(self, "NW_CITY_PATH_HABOUR_16_01") < 1000)
	&& (Mod_AlrikSchaukampf == 1)
	&& (Kapitel >= 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alrik_Kap5_Info()
{
	AI_Output(self, hero, "Info_Mod_Alrik_Kap5_09_00"); //(verzweifelt) Ein letztes Mal will ich es noch versuchen!

	Mod_AlrikSchaukampf = 0;
};

INSTANCE Info_Mod_Alrik_Schaukampf (C_INFO)
{
	npc		= Mod_547_NONE_Alrik_NW;
	nr		= 1;
	condition	= Info_Mod_Alrik_Schaukampf_Condition;
	information	= Info_Mod_Alrik_Schaukampf_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich fordere dich heraus.";
};

FUNC INT Info_Mod_Alrik_Schaukampf_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alrik_Hi))
	&& (Npc_GetDistToWP(self, "NW_CITY_PATH_HABOUR_16_01") < 1000)
	&& (Mod_AlrikSchaukampf == 0)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 100)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alrik_Schaukampf_Info()
{
	AI_Output(hero, self, "Info_Mod_Alrik_Schaukampf_15_00"); //Ich fordere dich heraus.

	B_GiveInvItems	(hero, self, ItMi_Gold, 100);
	Npc_RemoveInvItems(self, ItMi_Gold, 100);

	if (Kapitel == 1)
	{
		AI_Output(self, hero, "Info_Mod_Alrik_Schaukampf_09_01"); //Das sieht mir ja nach einer einfachen Aufgabe für mich aus.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Alrik_Schaukampf_09_02"); //Ein würdiger Gegner!
	};

	B_SetAttributesToChapter	(self, Kapitel);

	B_SetFightSkills	(self, 25);

	self.aivar[AIV_VictoryXPGiven] = FALSE;

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_None, 0);

	Mod_AlrikSchaukampf = 1;

	self.aivar[AIV_ArenaFight] = AF_RUNNING;
};

INSTANCE Info_Mod_Alrik_Umgehauen (C_INFO)
{
	npc		= Mod_547_NONE_Alrik_NW;
	nr		= 1;
	condition	= Info_Mod_Alrik_Umgehauen_Condition;
	information	= Info_Mod_Alrik_Umgehauen_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Alrik_Umgehauen_Condition()
{
	if (self.aivar[AIV_ArenaFight] == AF_AFTER)
	&& (Mod_MilizTurnier != 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alrik_Umgehauen_Info()
{
	if (self.aivar[AIV_LastPlayerAR] == AR_NONE) //Kampf aus Dialog heraus.
	{
		if (B_GetAivar(self, AIV_LastFightAgainstPlayer) == FIGHT_LOST)
		{
			if (Kapitel == 1)
			{
				AI_Output(self, hero, "Info_Mod_Alrik_Umgehauen_09_00"); //Junge, Junge, dich hab ich unterschätzt.
			}
			else if (Kapitel == 2)
			|| (Kapitel == 4)
			{
				AI_Output(self, hero, "Info_Mod_Alrik_Umgehauen_09_01"); //Nicht schon wieder ...
			}
			else if (Kapitel == 3)
			{
				AI_Output(self, hero, "Info_Mod_Alrik_Umgehauen_09_02"); //Ich werde nicht aufgeben!
			}
			else if (Kapitel == 5)
			{
				AI_Output(self, hero, "Info_Mod_Alrik_Umgehauen_09_03"); //Das war's. Ich bin dir nicht gewachsen.
				AI_Output(self, hero, "Info_Mod_Alrik_Umgehauen_09_04"); //Du bist mittlerweile so mächtig, dass du dich wahrscheinlich sogar mit einer Dämonenarmee anlegen könntest.
			};

			B_GiveInvItems	(self, hero, ItMi_Gold, 200);		

			B_GivePlayerXP	(Kapitel*50);
		}
		else if (B_GetAivar(self, AIV_LastFightAgainstPlayer) == FIGHT_WON)
		{
			AI_Output(self, hero, "Info_Mod_Alrik_Umgehauen_09_05"); //Du bist eine gute Einnahmequelle. Wenn du Lust auf eine weitere Runde hast, komm wieder vorbei.

			Mod_AlrikSchaukampf = 0;
		};
							
		// ------ In jedem Fall: Arena-Kampf abgeschlossen ------
		self.aivar[AIV_ArenaFight] = AF_NONE;
		
		// ------ AIVAR resetten! ------	
		self.aivar[AIV_LastFightComment] = TRUE;
	};
};

INSTANCE Info_Mod_Alrik_Flugblaetter (C_INFO)
{
	npc		= Mod_547_NONE_Alrik_NW;
	nr		= 1;
	condition	= Info_Mod_Alrik_Flugblaetter_Condition;
	information	= Info_Mod_Alrik_Flugblaetter_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab hier ein Flugblatt für dich.";
};

FUNC INT Info_Mod_Alrik_Flugblaetter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Matteo_Auftrag_2))
	&& (Npc_HasItems(hero, MatteoFlugblaetter) >= 1)
	&& (Mod_Flugblaetter < 20)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Matteo_Flugblaetter))
	&& (Npc_KnowsInfo(hero, Info_Mod_Alrik_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alrik_Flugblaetter_Info()
{
	B_Say (hero, self, "$MATTEOPAPER");

	B_GiveInvItems	(hero, self, MatteoFlugblaetter, 1);

	AI_Output(self, hero, "Info_Mod_Alrik_Flugblaetter_09_01"); //Oh, danke. Mal sehen ...

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Alrik_Flugblaetter_09_02"); //Ah ja. Vielleicht werd ich mal bei Matteo vorbeischauen.

	Mod_Flugblaetter += 1;

	Npc_RemoveInvItems	(self, MatteoFlugblaetter, 1);
};

INSTANCE Info_Mod_Alrik_ArenaFighter (C_INFO)
{
	npc		= Mod_547_NONE_Alrik_NW;
	nr		= 1;
	condition	= Info_Mod_Alrik_ArenaFighter_Condition;
	information	= Info_Mod_Alrik_ArenaFighter_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alrik_ArenaFighter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_Turnier2))
	&& (Mod_MilizTurnier == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alrik_ArenaFighter_Info()
{
	AI_Output(self, hero, "Info_Mod_Alrik_ArenaFighter_09_00"); //Hey!
};

INSTANCE Info_Mod_Alrik_Kampf (C_INFO)
{
	npc		= Mod_547_NONE_Alrik_NW;
	nr		= 1;
	condition	= Info_Mod_Alrik_Kampf_Condition;
	information	= Info_Mod_Alrik_Kampf_Info;
	permanent	= 1;
	important	= 0;
	description	= "Du bist mein zweiter Gegner im Turnier.";
};

FUNC INT Info_Mod_Alrik_Kampf_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alrik_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Andre_Turnier2))
	&& (Mod_MilizTurnier == 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alrik_Kampf_Info()
{
	AI_Output(hero, self, "Info_Mod_Alrik_Kampf_15_00"); //Du bist mein zweiter Gegner im Turnier.
	AI_Output(self, hero, "Info_Mod_Alrik_Kampf_09_01"); //Ok, bist du bereit?

	Info_ClearChoices	(Info_Mod_Alrik_Kampf);
	
	Info_AddChoice	(Info_Mod_Alrik_Kampf, "Noch nicht ...", Info_Mod_Alrik_Kampf_Nein);
	Info_AddChoice	(Info_Mod_Alrik_Kampf, "Ja, lass uns anfangen ...", Info_Mod_Alrik_Kampf_Ja);
};

FUNC VOID Info_Mod_Alrik_Kampf_Nein()
{
	AI_Output(hero, self, "Info_Mod_Alrik_Kampf_Nein_15_00"); //Noch nicht ...
	AI_Output(self, hero, "Info_Mod_Alrik_Kampf_Nein_09_01"); //Ok, komm, sobald du bereit bist.

	Info_ClearChoices	(Info_Mod_Alrik_Kampf);
};

FUNC VOID Info_Mod_Alrik_Kampf_Ja()
{
	AI_Output(hero, self, "Info_Mod_Alrik_Kampf_Ja_15_00"); //Ja, lass uns anfangen ...
	AI_Output(self, hero, "Info_Mod_Alrik_Kampf_Ja_09_01"); //Ok.

	Mod_MilizTurnier = 5;

	AI_StopProcessInfos	(self);
	B_Attack	(self, hero, AR_NONE, 1);

	self.aivar[AIV_VictoryXPGiven] = FALSE;
};

INSTANCE Info_Mod_Alrik_KampfEnde (C_INFO)
{
	npc		= Mod_547_NONE_Alrik_NW;
	nr		= 1;
	condition	= Info_Mod_Alrik_KampfEnde_Condition;
	information	= Info_Mod_Alrik_KampfEnde_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Alrik_KampfEnde_Condition()
{
	if (Mod_MilizTurnier == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alrik_KampfEnde_Info()
{
	if (self.aivar[AIV_LastPlayerAR] == AR_NONE) //Kampf aus Dialog heraus.
	{
		if (B_GetAivar(self, AIV_LastFightAgainstPlayer) == FIGHT_LOST)
		{
			AI_Output(self, hero, "Info_Mod_Alrik_KampfEnde_09_00"); //Du bist wirklich gut. Du solltest mal zu mir kommen und ein wenig mit mir trainieren.

			Mod_MilizTurnier = 6;
			
			B_StartOtherRoutine	(Mod_547_NONE_Alrik_NW,	"START");
				
			B_LogEntry	(TOPIC_MOD_MILIZTURNIER, "Ich habe meinen Kampf gegen Alrik gewonnen. Ich sollte jetzt mit Lord Andre sprechen.");
	
		}
		else if (B_GetAivar(self, AIV_LastFightAgainstPlayer) == FIGHT_WON)
		{
			AI_Output(self, hero, "Info_Mod_Alrik_KampfEnde_09_01"); //Tja, das war wohl nichts. Jetzt werde ich vielleicht ein Mitglied der Miliz. Wenn du willst, kannst du mal zu mir kommen, dann können wir zusammen trainieren.

			Mod_MilizTurnier = 7;

			B_LogEntry	(TOPIC_MOD_MILIZTURNIER, "Ich habe meinen Kampf gegen Alrik verloren. Ich sollte jetzt mit Lord Andre sprechen.");

			B_SetTopicStatus	(TOPIC_MOD_MILIZTURNIER, LOG_FAILED);
		}
		else //FIGHT_CANCEL
		{
			AI_Output (self, other,"Info_Mod_Alrik_KampfEnde_09_02"); //Du bist abgehauen und dadurch hab ich gewonnen. Dumm gelaufen für dich.

			Mod_MilizTurnier = 7;

			B_LogEntry	(TOPIC_MOD_MILIZTURNIER, "Ich habe meinen Kampf gegen Alrik verloren. Ich sollte jetzt mit Lord Andre sprechen.");

			B_SetTopicStatus	(TOPIC_MOD_MILIZTURNIER, LOG_FAILED);
		};
		
					
		// ------ In jedem Fall: Arena-Kampf abgeschlossen ------
		self.aivar[AIV_ArenaFight] = AF_NONE;
		
		// ------ AIVAR resetten! ------	
		self.aivar[AIV_LastFightComment] = TRUE;
	};

	B_StartOtherRoutine	(Mod_1176_MIL_Miliz_NW, "START");
	B_StartOtherRoutine	(Mod_1177_MIL_Miliz_NW, "START");
	B_StartOtherRoutine	(Mod_1175_MIL_Miliz_NW, "START");
	B_StartOtherRoutine	(Mod_755_MIL_Wambo_NW, "START");
};

INSTANCE Info_Mod_Alrik_Lehrer (C_INFO)
{
	npc		= Mod_547_NONE_Alrik_NW;
	nr		= 1;
	condition	= Info_Mod_Alrik_Lehrer_Condition;
	information	= Info_Mod_Alrik_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir was beibringen?";
};

FUNC INT Info_Mod_Alrik_Lehrer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alrik_Hi))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alrik_Lehrer_Info()
{
	B_Say	(hero, self, "$KANNSTDUMIRWASBEIBRINGEN");

	AI_Output(self, hero, "Info_Mod_Alrik_Lehrer_09_00"); //Ich kann dir den Umgang mit Einhändern beibringen.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_STADT, "Alrik kann mir den Umgang mit Einhändern beibringen.");
};

INSTANCE Info_Mod_Alrik_Lernen (C_INFO)
{
	npc		= Mod_547_NONE_Alrik_NW;
	nr		= 1;
	condition	= Info_Mod_Alrik_Lernen_Condition;
	information	= Info_Mod_Alrik_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich will lernen.";
};

FUNC INT Info_Mod_Alrik_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alrik_Lehrer))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Alrik_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Alrik_Lernen_15_00"); //Ich will lernen.

	Info_ClearChoices	(Info_Mod_Alrik_Lernen);

	Info_AddChoice	(Info_Mod_Alrik_Lernen, DIALOG_BACK, Info_Mod_Alrik_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Alrik_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Alrik_Lernen_1H_5);
	Info_AddChoice	(Info_Mod_Alrik_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Alrik_Lernen_1H_1);
};

FUNC VOID Info_Mod_Alrik_Lernen_BACK()
{
	Info_ClearChoices	(Info_Mod_Alrik_Lernen);
};

FUNC VOID Info_Mod_Alrik_Lernen_1H_5()
{
	if B_TeachFightTalentPercent_New	(self, hero, NPC_TALENT_1H, 5, 60)
	{
		Info_ClearChoices	(Info_Mod_Alrik_Lernen);

		Info_AddChoice	(Info_Mod_Alrik_Lernen, DIALOG_BACK, Info_Mod_Alrik_Lernen_BACK);
		Info_AddChoice	(Info_Mod_Alrik_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Alrik_Lernen_1H_5);
		Info_AddChoice	(Info_Mod_Alrik_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Alrik_Lernen_1H_1);
	};
};

FUNC VOID Info_Mod_Alrik_Lernen_1H_1()
{
	if B_TeachFightTalentPercent	(self, hero, NPC_TALENT_1H, 1, 60)
	{
		Info_ClearChoices	(Info_Mod_Alrik_Lernen);

		Info_AddChoice	(Info_Mod_Alrik_Lernen, DIALOG_BACK, Info_Mod_Alrik_Lernen_BACK);
		Info_AddChoice	(Info_Mod_Alrik_Lernen, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent_New(hero, NPC_TALENT_1H)), Info_Mod_Alrik_Lernen_1H_5);
		Info_AddChoice	(Info_Mod_Alrik_Lernen, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(hero, NPC_TALENT_1H, 1)), Info_Mod_Alrik_Lernen_1H_1);
	};
};

INSTANCE Info_Mod_Alrik_Pickpocket (C_INFO)
{
	npc		= Mod_547_NONE_Alrik_NW;
	nr		= 1;
	condition	= Info_Mod_Alrik_Pickpocket_Condition;
	information	= Info_Mod_Alrik_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Alrik_Pickpocket_Condition()
{
	C_Beklauen	(36, ItMi_Gold, 16);
};

FUNC VOID Info_Mod_Alrik_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Alrik_Pickpocket);

	Info_AddChoice	(Info_Mod_Alrik_Pickpocket, DIALOG_BACK, Info_Mod_Alrik_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Alrik_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Alrik_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Alrik_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Alrik_Pickpocket);
};

FUNC VOID Info_Mod_Alrik_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Alrik_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Alrik_Pickpocket);

		Info_AddChoice	(Info_Mod_Alrik_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Alrik_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Alrik_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Alrik_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Alrik_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Alrik_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Alrik_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Alrik_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Alrik_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Alrik_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Alrik_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Alrik_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Alrik_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Alrik_EXIT (C_INFO)
{
	npc		= Mod_547_NONE_Alrik_NW;
	nr		= 1;
	condition	= Info_Mod_Alrik_EXIT_Condition;
	information	= Info_Mod_Alrik_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Alrik_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Alrik_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};