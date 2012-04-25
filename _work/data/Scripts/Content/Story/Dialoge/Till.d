var int MerkLebenspunkteTill;
var int MerkLebenspunkteHeldTill;

INSTANCE Info_Mod_Till_Hi (C_INFO)
{
	npc		= Mod_541_NONE_Till_NW;
	nr		= 1;
	condition	= Info_Mod_Till_Hi_Condition;
	information	= Info_Mod_Till_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Till_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Till_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");

	AI_Output(self, hero, "Info_Mod_Till_Hi_03_01"); //Ich bin Till und komme von Sekobs Hof.
};

INSTANCE Info_Mod_Till_Bronko (C_INFO)
{
	npc		= Mod_541_NONE_Till_NW;
	nr		= 1;
	condition	= Info_Mod_Till_Bronko_Condition;
	information	= Info_Mod_Till_Bronko_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bronko hat gesagt, du sollst deinen Arsch auf das Feld bewegen.";
};

FUNC INT Info_Mod_Till_Bronko_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bronko_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Till_Bronko_Info()
{
	AI_Output(hero, self, "Info_Mod_Till_Bronko_15_00"); //Bronko hat gesagt, du sollst deinen Arsch auf das Feld bewegen.
	AI_Output(self, hero, "Info_Mod_Till_Bronko_03_01"); //Sag Bronko mal, das kann er selbst machen.

	AI_StopProcessInfos	(self);

	B_LogEntry	(TOPIC_MOD_BRONKO_STREIT, "Till kontert. Ich werde mich wohl auf ein wenig Laufen gefasst machen müssen.");
};

INSTANCE Info_Mod_Till_Bronko02 (C_INFO)
{
	npc		= Mod_541_NONE_Till_NW;
	nr		= 1;
	condition	= Info_Mod_Till_Bronko02_Condition;
	information	= Info_Mod_Till_Bronko02_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bronko sagt, dass du dir erstmal die Nase putzen solltest.";
};

FUNC INT Info_Mod_Till_Bronko02_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bronko_Streit02))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Till_Bronko02_Info()
{
	AI_Output(hero, self, "Info_Mod_Till_Bronko02_15_00"); //Bronko sagt, dass du dir erstmal die Nase putzen solltest.
	AI_Output(self, hero, "Info_Mod_Till_Bronko02_03_01"); //Dieser aufgeblasene Blödmann kann doch nicht einmal Eins und Eins zusammenzählen.
	AI_Output(hero, self, "Info_Mod_Till_Bronko02_15_02"); //Kannst du das denn?
	AI_Output(self, hero, "Info_Mod_Till_Bronko02_03_03"); //Das spielt keine Rolle. Frag lieber mal Bronko.

	AI_StopProcessInfos	(self);

	B_LogEntry	(TOPIC_MOD_BRONKO_STREIT, "Ich soll Bronko fragen, was eins und eins ergibt ...");
};

INSTANCE Info_Mod_Till_Bronko03 (C_INFO)
{
	npc		= Mod_541_NONE_Till_NW;
	nr		= 1;
	condition	= Info_Mod_Till_Bronko03_Condition;
	information	= Info_Mod_Till_Bronko03_Info;
	permanent	= 0;
	important	= 0;
	description	= "Bronko hat Eins und Eins zusammengezählt und Elf herausbekommen.";
};

FUNC INT Info_Mod_Till_Bronko03_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bronko_Streit03))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Till_Bronko03_Info()
{
	AI_Output(hero, self, "Info_Mod_Till_Bronko03_15_00"); //Bronko hat Eins und Eins zusammengezählt und Elf herausbekommen.
	AI_Output(self, hero, "Info_Mod_Till_Bronko03_03_01"); //Der Mistkerl kann ja rechnen. Aber er ist ein Mistkerl. Sag ihm das.

	AI_StopProcessInfos	(self);

	B_LogEntry	(TOPIC_MOD_BRONKO_STREIT, "Jetzt soll ich Bronko ausrichten, dass er ein Mistkerl ist.");
};

INSTANCE Info_Mod_Till_Bronko04 (C_INFO)
{
	npc		= Mod_541_NONE_Till_NW;
	nr		= 1;
	condition	= Info_Mod_Till_Bronko04_Condition;
	information	= Info_Mod_Till_Bronko04_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du kannst gleich von Bronko was erleben.";
};

FUNC INT Info_Mod_Till_Bronko04_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bronko_Streit04))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Till_Bronko04_Info()
{
	AI_Output(hero, self, "Info_Mod_Till_Bronko04_15_00"); //Du kannst gleich von Bronko was erleben.
	AI_Output(self, hero, "Info_Mod_Till_Bronko04_03_01"); //Der Angeber soll ruhig herkommen. Sag ihm das.
	AI_Output(hero, self, "Info_Mod_Till_Bronko04_15_02"); //Sag es ihm doch selbst.
	AI_Output(self, hero, "Info_Mod_Till_Bronko04_03_03"); //Das werde ich.

	B_LogEntry	(TOPIC_MOD_BRONKO_STREIT, "Ich habe den Streit geschlichtet, indem ich die beiden habe aufeinander losgehen lassen. Endlich Ruhe. Vielleicht hat der Verlierer ja Gold bei sich.");
	B_SetTopicStatus	(TOPIC_MOD_BRONKO_STREIT, LOG_SUCCESS);

	B_GivePlayerXP	(50);

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");

	B_Attack	(self, Mod_103_BAU_Bronko_NW, AR_None, 0);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Till_InnosNase (C_INFO)
{
	npc		= Mod_541_NONE_Till_NW;
	nr		= 1;
	condition	= Info_Mod_Till_InnosNase_Condition;
	information	= Info_Mod_Till_InnosNase_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Till_InnosNase_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hagen_AndreVermaechtnis2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Till_InnosNase_Info()
{
	AI_Output(self, hero, "Info_Mod_Till_InnosNase_03_00"); //Ahh, dann können wir also nun loslegen.
	AI_Output(self, hero, "Info_Mod_Till_InnosNase_03_01"); //Du zeigst uns den Weg und wir folgen dir und schauen uns aufmerksam um.
	AI_Output(self, hero, "Info_Mod_Till_InnosNase_03_02"); //(halblaut) Und je schneller wir fertig sind, desto schneller kommen wir auch aus diesem Gestank heraus.

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ASSIS");
	B_StartOtherRoutine	(Mod_744_MIL_Pablo_NW, "ASSIS");
	B_StartOtherRoutine	(Mod_968_MIL_Bilgot_NW, "ASSIS");
};

INSTANCE Info_Mod_Till_InnosNase2 (C_INFO)
{
	npc		= Mod_541_NONE_Till_NW;
	nr		= 1;
	condition	= Info_Mod_Till_InnosNase2_Condition;
	information	= Info_Mod_Till_InnosNase2_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Till_InnosNase2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Halbtoter_Hi))
	&& (Npc_GetDistToWP(hero, "WP_ASSASSINE_08") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Till_InnosNase2_Info()
{
	AI_Output(self, hero, "Info_Mod_Till_InnosNase2_03_00"); //Tja, hört sich so an, als hätte der Roboter sich um diese dunklen Gestalten gekümmert, wer immer die auch waren.
	AI_Output(self, hero, "Info_Mod_Till_InnosNase2_03_01"); //Muss’n ganz schöner Kampf gewesen sein. Die Höhle ist sogar eingestürzt.
	AI_Output(self, hero, "Info_Mod_Till_InnosNase2_03_02"); //Naja, wie dem auch sei, die Arbeit ist getan und wir können gehen, oder?
	AI_Output(hero, self, "Info_Mod_Till_InnosNase2_15_03"); //Lord Hagen meinte, dass die Quelle beseitigt werden soll.
	AI_Output(self, hero, "Info_Mod_Till_InnosNase2_03_04"); //Soll das etwa heißen? Ohh, nöö.
	AI_Output(self, hero, "Info_Mod_Till_InnosNase2_03_05"); //(halblaut) Hätte der Roboter nicht wenigstens hinter sich aufräumen können?
	AI_Output(self, hero, "Info_Mod_Till_InnosNase2_03_06"); //Jetzt darf ich den Mist machen.
	AI_Output(self, hero, "Info_Mod_Till_InnosNase2_03_07"); //Und dabei war es doch auf dem Hof so schön ...

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "ASSIS2");
	B_StartOtherRoutine	(Mod_744_MIL_Pablo_NW, "ASSIS2");
	B_StartOtherRoutine	(Mod_968_MIL_Bilgot_NW, "ASSIS2");

	B_LogEntry	(TOPIC_MOD_MILIZ_NASE, "Offensichtlich hat der Roboter einige Halunken in einer nahe gelegenen Höhle erschlagen, die jetzt vor sich hinrotten. Die Stadtwachen werden das Problem unter die Erde bringen.");

	B_KillNpc	(Mod_7681_ASS_Halbtoter_NW);
};

INSTANCE Info_Mod_Till_InnosNase3 (C_INFO)
{
	npc		= Mod_541_NONE_Till_NW;
	nr		= 1;
	condition	= Info_Mod_Till_InnosNase3_Condition;
	information	= Info_Mod_Till_InnosNase3_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Till_InnosNase3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Till_InnosNase))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Till_InnosNase2))
	&& (Npc_RefuseTalk(self) == FALSE)
	&& (Npc_GetDistToWP(hero, "NW_CITY_CONNECT_FOREST") > 1500)
	&& (Npc_GetDistToWP(hero, "WP_ASSASSINE_03") > 1500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Till_InnosNase3_Info()
{
	AI_Output(self, hero, "Info_Mod_Till_InnosNase3_03_00"); //Hier merkt man nichts mehr vom Fäulnisgeruch. Wir müssen zurück.

	AI_StopProcessInfos	(self);

	Npc_SetRefuseTalk (self, 30);
};

INSTANCE Info_Mod_Till_NachGildenstories (C_INFO)
{
	npc		= Mod_541_NONE_Till_NW;
	nr		= 1;
	condition	= Info_Mod_Till_NachGildenstories_Condition;
	information	= Info_Mod_Till_NachGildenstories_Info;
	permanent	= 0;
	important	= 0;
	description	= "Till?";
};

FUNC INT Info_Mod_Till_NachGildenstories_Condition()
{
	if (Mod_TillChange == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Till_NachGildenstories_Info()
{
	AI_Output(hero, self, "Info_Mod_Till_NachGildenstories_15_00"); //Till?

	if (hero.guild == GIL_VLK)
	|| (hero.guild == GIL_NOV)
	{
		AI_Output(self, hero, "Info_Mod_Till_NachGildenstories_03_01"); //(überrascht) Was du…? (stockt) Ohh, verzeih mir, Meister.
	};

	if (hero.guild == GIL_VLK)
	{
		AI_Output(self, hero, "Info_Mod_Till_NachGildenstories_03_02"); //(erklärt sich) Nachdem ihr Feuermagier uns alle vor diesen Eiswesen gerettet habt, gab es für mich keinen Zweifel daran, dass ich mich in den Dienst des Klosters stellen möchte.
		AI_Output(self, hero, "Info_Mod_Till_NachGildenstories_03_03"); //Ein Diener Innos zu sein muss das Größte sein.
	}
	else if (hero.guild == GIL_NOV)
	{
		AI_Output(self, hero, "Info_Mod_Till_NachGildenstories_03_04"); //(erklärt sich) Nachdem ihr Wassermagier uns alle vor diesen Monstern bewahrt habt, gab es für mich keinen Zweifel, daran, dass auch ich für eure Sache kämpfen möchte.
		AI_Output(self, hero, "Info_Mod_Till_NachGildenstories_03_05"); //Ein Diener Adanos’ zu sein muss das Größte sein.
	};

	if (hero.guild == GIL_VLK)
	|| (hero.guild == GIL_NOV)
	{
		AI_Output(hero, self, "Info_Mod_Till_NachGildenstories_15_06"); //Naja, aber nicht immer ungefährlich.
	};

	if (hero.guild == GIL_VLK)
	{
		AI_Output(hero, self, "Info_Mod_Till_NachGildenstories_15_07"); //Bei der Sache mit den Eiswesen haben einige Novizen ihr Leben gelassen.
	}
	else if (hero.guild == GIL_NOV)
	{
		AI_Output(hero, self, "Info_Mod_Till_NachGildenstories_15_08"); //Bei der Sache mit dem Weidenplateau haben einige Streiter ihr Leben gelassen.
	};

	if (hero.guild == GIL_VLK)
	|| (hero.guild == GIL_NOV)
	{
		AI_Output(self, hero, "Info_Mod_Till_NachGildenstories_03_09"); //(erschrocken) Was!?

		AI_TurnAway	(self, hero);
	};

	if (hero.guild == GIL_VLK)
	{
		AI_Output(self, hero, "Info_Mod_Till_NachGildenstories_03_10"); //(zu sich selbst) Also deshalb haben sie mich so schnell im Kloster aufgenommen.
	}
	else if (hero.guild == GIL_NOV)
	{
		AI_Output(self, hero, "Info_Mod_Till_NachGildenstories_03_11"); //(zu sich selbst) Also deshalb haben sie mich so schnell zum Novizen gemacht.
	};

	if (hero.guild == GIL_VLK)
	|| (hero.guild == GIL_NOV)
	{
		AI_Output(self, hero, "Info_Mod_Till_NachGildenstories_03_12"); //(besorgt) Wenn das mal gut geht ...
	};

	if (hero.guild == GIL_MIL)
	{
		AI_Output(self, hero, "Info_Mod_Till_NachGildenstories_03_13"); //(überrascht) Was du…? (stockt) Ohh, der Drachentöter.
		AI_Output(self, hero, "Info_Mod_Till_NachGildenstories_03_14"); //(erklärt sich) Nachdem ihr Söldner uns alle von diesen Drachen befreit habt, gab es für mich keinen Zweifel, daran, dass auch ich an eurer Seite kämpfen möchte.
		AI_Output(self, hero, "Info_Mod_Till_NachGildenstories_03_15"); //Ein Söldner zu sein muss das Größte sein. Und mein Vater hat mir jetzt nichts mehr zu sagen!
	};

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Till_ArenaFighter (C_INFO)
{
	npc		= Mod_541_NONE_Till_NW;
	nr		= 1;
	condition	= Info_Mod_Till_ArenaFighter_Condition;
	information	= Info_Mod_Till_ArenaFighter_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Till_ArenaFighter_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Andre_Turnier1))
	&& (Mod_MilizTurnier == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Till_ArenaFighter_Info()
{
	AI_Output(self, hero, "Info_Mod_Till_ArenaFighter_03_00"); //Hey!
};

INSTANCE Info_Mod_Till_Kampf (C_INFO)
{
	npc		= Mod_541_NONE_Till_NW;
	nr		= 1;
	condition	= Info_Mod_Till_Kampf_Condition;
	information	= Info_Mod_Till_Kampf_Info;
	permanent	= 1;
	important	= 0;
	description	= "Du bist mein erster Gegner im Turnier.";
};

FUNC INT Info_Mod_Till_Kampf_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Till_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Andre_Turnier1))
	&& (Mod_MilizTurnier	==	0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Till_Kampf_Info()
{
	AI_Output(hero, self, "Info_Mod_Till_Kampf_15_00"); //Du bist mein erster Gegner im Turnier.
	AI_Output(self, hero, "Info_Mod_Till_Kampf_03_01"); //Ok, bist du bereit?

	self.fight_tactic = FAI_HUMAN_STRONG;

	Info_ClearChoices	(Info_Mod_Till_Kampf);
	
	Info_AddChoice	(Info_Mod_Till_Kampf, "Noch nicht ...", Info_Mod_Till_Kampf_Nein);
	Info_AddChoice	(Info_Mod_Till_Kampf, "Ja, lass uns anfangen ...", Info_Mod_Till_Kampf_Ja);
};

FUNC VOID Info_Mod_Till_Kampf_Nein()
{
	AI_Output(hero, self, "Info_Mod_Till_Kampf_Nein_15_00"); //Noch nicht ...
	AI_Output(self, hero, "Info_Mod_Till_Kampf_Nein_03_01"); //Ok, komm sobald du bereit bist.

	Info_ClearChoices	(Info_Mod_Till_Kampf);
};

FUNC VOID Info_Mod_Till_Kampf_Ja()
{
	AI_Output(hero, self, "Info_Mod_Till_Kampf_Ja_15_00"); //Ja, lass uns anfangen ...
	AI_Output(self, hero, "Info_Mod_Till_Kampf_Ja_03_01"); //Ok.

	Mod_MilizTurnier	=	1;

	AI_StopProcessInfos	(self);
	B_Attack	(self, hero, AR_NONE, 1);
};

INSTANCE Info_Mod_Till_KampfEnde (C_INFO)
{
	npc		= Mod_541_NONE_Till_NW;
	nr		= 1;
	condition	= Info_Mod_Till_KampfEnde_Condition;
	information	= Info_Mod_Till_KampfEnde_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Till_KampfEnde_Condition()
{
	if (Mod_MilizTurnier == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Till_KampfEnde_Info()
{
	if (self.aivar[AIV_LastPlayerAR] == AR_NONE) //Kampf aus Dialog heraus.
	{
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output(self, hero, "Info_Mod_Till_KampfEnde_03_00"); //Du bist wirklich gut. Ich geh zurück auf den Hof meines Vaters, vielleicht sehen wir uns mal wieder.

			Mod_MilizTurnier = 2;
			
			B_StartOtherRoutine	(Mod_541_NONE_Till_NW,	"PRESTART");
				
			B_LogEntry	(TOPIC_MOD_MILIZTURNIER, "Ich habe meinen Kampf gegen Till gewonnen. Ich sollte jetzt mit Lord Andre sprechen.");
		}
		else if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
		{
			AI_Output(self, hero, "Info_Mod_Till_KampfEnde_03_01"); //Tja, das war wohl nichts. Jetzt werde ich vielleicht ein Mitglied der Miliz.

			Mod_MilizTurnier = 3;

			B_LogEntry	(TOPIC_MOD_MILIZTURNIER, "Ich habe meinen Kampf gegen Till verloren. Ich sollte jetzt mit Lord Andre sprechen.");

			B_SetTopicStatus	(TOPIC_MOD_MILIZTURNIER, LOG_FAILED);
		}
		else //FIGHT_CANCEL
		{
			AI_Output (self, other,"Info_Mod_Till_KampfEnde_03_02"); //Du bist abgehauen und dadurch hab ich gewonnen. Dumm gelaufen für dich.

			Mod_MilizTurnier = 3;

			B_LogEntry	(TOPIC_MOD_MILIZTURNIER, "Ich habe meinen Kampf gegen Till verloren. Ich sollte jetzt mit Lord Andre sprechen.");

			B_SetTopicStatus	(TOPIC_MOD_MILIZTURNIER, LOG_FAILED);
		};
		
					
		// ------ In jedem Fall: Arena-Kampf abgeschlossen ------
		self.aivar[AIV_ArenaFight] = AF_NONE;
		
		// ------ AIVAR resetten! ------	
		self.aivar[AIV_LastFightComment] = TRUE;
	};

	self.fight_tactic = FAI_HUMAN_COWARD;

	B_StartOtherRoutine	(Mod_1176_MIL_Miliz_NW, "START");
	B_StartOtherRoutine	(Mod_1177_MIL_Miliz_NW, "START");
	B_StartOtherRoutine	(Mod_1175_MIL_Miliz_NW, "START");
	B_StartOtherRoutine	(Mod_755_MIL_Wambo_NW, "START");
};

INSTANCE Info_Mod_Till_Pickpocket (C_INFO)
{
	npc		= Mod_541_NONE_Till_NW;
	nr		= 1;
	condition	= Info_Mod_Till_Pickpocket_Condition;
	information	= Info_Mod_Till_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_20;
};

FUNC INT Info_Mod_Till_Pickpocket_Condition()
{
	C_Beklauen	(20, ItMi_Gold, 40);
};

FUNC VOID Info_Mod_Till_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Till_Pickpocket);

	Info_AddChoice	(Info_Mod_Till_Pickpocket, DIALOG_BACK, Info_Mod_Till_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Till_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Till_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Till_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Till_Pickpocket);
};

FUNC VOID Info_Mod_Till_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Till_Pickpocket);
};

INSTANCE Info_Mod_Till_EXIT (C_INFO)
{
	npc		= Mod_541_NONE_Till_NW;
	nr		= 1;
	condition	= Info_Mod_Till_EXIT_Condition;
	information	= Info_Mod_Till_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Till_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Till_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};