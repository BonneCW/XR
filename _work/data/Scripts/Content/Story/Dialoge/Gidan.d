var int MerkLebenspunkteGidan;
var int MerkLebenspunkteHeldGidan;

INSTANCE Info_Mod_Gidan_Hi (C_INFO)
{
	npc		= Mod_1723_MIL_Gidan_NW;
	nr		= 1;
	condition	= Info_Mod_Gidan_Hi_Condition;
	information	= Info_Mod_Gidan_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Gidan_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gidan_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Gidan_Hi_13_01"); //Ich bin Gidan.
};

INSTANCE Info_Mod_Gidan_Kampf (C_INFO)
{
	npc		= Mod_1723_MIL_Gidan_NW;
	nr		= 1;
	condition	= Info_Mod_Gidan_Kampf_Condition;
	information	= Info_Mod_Gidan_Kampf_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gidan_Kampf_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gidan_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Andre_Turnier3))
	&& (Mod_MilizTurnier	==	8)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gidan_Kampf_Info()
{
	AI_Output(self, hero, "Info_Mod_Gidan_Kampf_13_00"); //Ha, du bist mein nächster Gegner? Dass ich nicht lache!
	AI_Output(self, hero, "Info_Mod_Gidan_Kampf_13_01"); //Willst du nicht lieber gleich aufgeben? Das würde die ganze Sache verkürzen.
	AI_Output(hero, self, "Info_Mod_Gidan_Kampf_15_02"); //Das einzige, das gekürzt wird, bist du, und zwar um einen Kopf, wenn du nich gleich die Klappe hälst.
	AI_Output(self, hero, "Info_Mod_Gidan_Kampf_13_03"); //(lacht) Du Gesindel! Bringen wir das Ganze hinter uns.

	Info_ClearChoices	(Info_Mod_Gidan_Kampf);

	Info_AddChoice	(Info_Mod_Gidan_Kampf, "Nein, warte noch.", Info_Mod_Gidan_Kampf_B);
	Info_AddChoice	(Info_Mod_Gidan_Kampf, "Gut, ich bin bereit.", Info_Mod_Gidan_Kampf_A);
};

FUNC VOID Info_Mod_Gidan_Kampf_B()
{
	AI_Output(hero, self, "Info_Mod_Gidan_Kampf_B_15_00"); //Nein, warte noch.
	AI_Output(self, hero, "Info_Mod_Gidan_Kampf_B_13_01"); //Dann komm wieder, wenn du bereit bist.

	Info_ClearChoices	(Info_Mod_Gidan_Kampf);
};

FUNC VOID Info_Mod_Gidan_Kampf_A()
{
	AI_Output(hero, self, "Info_Mod_Gidan_Kampf_A_15_00"); //Gut, ich bin bereit.
	AI_Output(self, hero, "Info_Mod_Gidan_Kampf_A_13_01"); //Jetzt mach ich dich fertig!

	Info_ClearChoices	(Info_Mod_Gidan_Kampf);

	self.fight_tactic = FAI_HUMAN_STRONG;

	Mod_MilizTurnier = 10;

	AI_StopProcessInfos	(self);
	B_Attack	(self, hero, AR_NONE, 1);
};

INSTANCE Info_Mod_Gidan_Kampf2 (C_INFO)
{
	npc		= Mod_1723_MIL_Gidan_NW;
	nr		= 1;
	condition	= Info_Mod_Gidan_Kampf2_Condition;
	information	= Info_Mod_Gidan_Kampf2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Zeig mir was du kannst!";
};

FUNC INT Info_Mod_Gidan_Kampf2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gidan_Kampf))
	&& (Mod_MilizTurnier	==	8)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gidan_Kampf2_Info()
{
	AI_Output(hero, self, "Info_Mod_Gidan_Kampf2_15_00"); //Zeig mir was du kannst!
	AI_Output(self, hero, "Info_Mod_Gidan_Kampf2_13_01"); //Dann komm mal her.

	self.fight_tactic = FAI_HUMAN_STRONG;

	Mod_MilizTurnier = 10;

	AI_StopProcessInfos	(self);
	B_Attack	(self, hero, AR_NONE, 1);
};

INSTANCE Info_Mod_Gidan_KampfEnde (C_INFO)
{
	npc		= Mod_1723_MIL_Gidan_NW;
	nr		= 1;
	condition	= Info_Mod_Gidan_KampfEnde_Condition;
	information	= Info_Mod_Gidan_KampfEnde_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gidan_KampfEnde_Condition()
{
	if (Mod_MilizTurnier == 10)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gidan_KampfEnde_Info()
{
	if (self.aivar[AIV_LastPlayerAR] == AR_NONE) //Kampf aus Dialog heraus.
	{
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output(self, hero, "Info_Mod_Gidan_KampfEnde_13_00"); //(brüllt) Betrug! Man hat mich betrogen!
			AI_Output(self, hero, "Info_Mod_Gidan_KampfEnde_13_03"); //Nie hätte jemand wie du es geschafft einen Kämpfer meinesgleichen zu besiegen!
			AI_Output(hero, self, "Info_Mod_Gidan_KampfEnde_15_04"); //Reg dich ab! Ich habe dich fair und ehrlich geschlagen.
			AI_Output(self, hero, "Info_Mod_Gidan_KampfEnde_13_05"); //Das werde ich mir nicht gefallen lassen!

			Mod_MilizTurnier	=	11;
			
			B_StartOtherRoutine	(Mod_1723_MIL_Gidan_NW,	"SAUER");
				
			B_LogEntry	(TOPIC_MOD_MILIZTURNIER, "Ich habe meinen Kampf gegen Gidan gewonnen. Ich sollte jetzt mit Lord Andre sprechen.");
		}
		else if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
		{
			AI_Output(self, hero, "Info_Mod_Gidan_KampfEnde_13_01"); //Tja, das war wohl nichts. Jetzt werde ich vielleicht ein Mitglied der Miliz.

			Mod_MilizTurnier	=	12;

			B_LogEntry	(TOPIC_MOD_MILIZTURNIER, "Ich habe meinen Kampf gegen Gidan verloren. Ich sollte jetzt mit Lord Andre sprechen.");

			B_SetTopicStatus	(TOPIC_MOD_MILIZTURNIER, LOG_FAILED);
		}
		else //FIGHT_CANCEL
		{
			AI_Output (self, other,"Info_Mod_Gidan_KampfEnde_13_02"); //Du bist abgehauen und dadurch hab ich gewonnen. Dumm gelaufen für dich.

			Mod_MilizTurnier	=	12;

			B_LogEntry	(TOPIC_MOD_MILIZTURNIER, "Ich habe meinen Kampf gegen Gidan verloren. Ich sollte jetzt mit Lord Andre sprechen.");

			B_SetTopicStatus	(TOPIC_MOD_MILIZTURNIER, LOG_FAILED);
		};
		
					
		// ------ In jedem Fall: Arena-Kampf abgeschlossen ------
		self.aivar[AIV_ArenaFight] = AF_NONE;
		
		// ------ AIVAR resetten! ------	
		self.aivar[AIV_LastFightComment] = TRUE;
	};

	self.fight_tactic = FAI_HUMAN_STRONG;

	B_StartOtherRoutine	(Mod_1176_MIL_Miliz_NW, "START");
	B_StartOtherRoutine	(Mod_1177_MIL_Miliz_NW, "START");
	B_StartOtherRoutine	(Mod_1175_MIL_Miliz_NW, "START");
	B_StartOtherRoutine	(Mod_755_MIL_Wambo_NW, "START");
};

INSTANCE Info_Mod_Gidan_Andre (C_INFO)
{
	npc		= Mod_1723_MIL_Gidan_NW;
	nr		= 1;
	condition	= Info_Mod_Gidan_Andre_Condition;
	information	= Info_Mod_Gidan_Andre_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gidan_Andre_Condition()
{
	if (Kapitel >= 2)
	&& ((Mod_Gilde == 1)
	|| (Mod_Gilde == 2)
	|| (Mod_Gilde == 3))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gidan_Andre_Info()
{
	AI_Output(self, hero, "Info_Mod_Gidan_Andre_13_00"); //So sieht man sich wieder.
	AI_Output(hero, self, "Info_Mod_Gidan_Andre_15_01"); //Was machst du denn hier?
	AI_Output(self, hero, "Info_Mod_Gidan_Andre_13_02"); //Ich erfülle nur meine Pflicht als Miliz dieser Stadt.
	AI_Output(hero, self, "Info_Mod_Gidan_Andre_15_03"); //Hast dir den Posten wohl erkauft was?
	AI_Output(self, hero, "Info_Mod_Gidan_Andre_13_04"); //Ts, auf solche Beleidigungen gehe ich gar nicht ein. Ich muss jetzt der Pflicht nachgehen!

	AI_StopProcessInfos	(self);
};

INSTANCE Info_Mod_Gidan_Golem (C_INFO)
{
	npc		= Mod_1723_MIL_Gidan_NW;
	nr		= 1;
	condition	= Info_Mod_Gidan_Golem_Condition;
	information	= Info_Mod_Gidan_Golem_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Gidan_Golem_Condition()
{
	if (Mod_PalaKapitel3 == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Gidan_Golem_Info()
{
	AI_Output(self, hero, "Info_Mod_Gidan_Golem_13_00"); //Du hast mir das Leben gerettet.
	AI_Output(hero, self, "Info_Mod_Gidan_Golem_15_01"); //Sieht so aus.
	AI_Output(self, hero, "Info_Mod_Gidan_Golem_13_02"); //Ich mag dich trotzdem nicht! Aber ich glaube ich, schulde dir was ...
	AI_Output(self, hero, "Info_Mod_Gidan_Golem_13_03"); //Sieh dir mal den Golem an. Hast du schon mal einen solchen Golem gesehen?
	AI_Output(hero, self, "Info_Mod_Gidan_Golem_15_04"); //Du hast Recht. Ein Eisengolem ... Es gibt doch eigentlich nur Feuer, Eis, Stein und Sumpf.
	AI_Output(self, hero, "Info_Mod_Gidan_Golem_13_05"); //Ja, dieser Golem da ist auch nur eine Maschine.
	AI_Output(hero, self, "Info_Mod_Gidan_Golem_15_06"); //Eine Maschine? Das erklärt einiges ...
	AI_Output(self, hero, "Info_Mod_Gidan_Golem_13_07"); //Ja, wie das Verschwinden des Erfinders. Die Sekte hat ihn entführt, um ihn diese Maschinen machen zu lassen.
	AI_Output(self, hero, "Info_Mod_Gidan_Golem_13_08"); //Vermutlich halten sie ihn am Hügel vor Khorinis gefangen, beim Leuchtturm.
	AI_Output(hero, self, "Info_Mod_Gidan_Golem_15_10"); //Dann werde ich mir das mal ansehen.

	Mod_PalaKapitel3 = 3;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "UNTERWEGS");

	B_LogEntry	(TOPIC_MOD_MILIZ_GIDAN, "Ein Eisengolem hat Gidan angegriffen ... sehr mysteriös. Gidan meinst, dass der Erfindern sicherlich beim Leuchtturm gefangen gehalten wird. Ich sollte dort mal vorbei sehen.");
};

INSTANCE Info_Mod_Gidan_Pickpocket (C_INFO)
{
	npc		= Mod_1723_MIL_Gidan_NW;
	nr		= 1;
	condition	= Info_Mod_Gidan_Pickpocket_Condition;
	information	= Info_Mod_Gidan_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_20;
};

FUNC INT Info_Mod_Gidan_Pickpocket_Condition()
{
	C_Beklauen	(20, ItMi_Gold, 40);
};

FUNC VOID Info_Mod_Gidan_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Gidan_Pickpocket);

	Info_AddChoice	(Info_Mod_Gidan_Pickpocket, DIALOG_BACK, Info_Mod_Gidan_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Gidan_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Gidan_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Gidan_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Gidan_Pickpocket);
};

FUNC VOID Info_Mod_Gidan_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Gidan_Pickpocket);
};

INSTANCE Info_Mod_Gidan_EXIT (C_INFO)
{
	npc		= Mod_1723_MIL_Gidan_NW;
	nr		= 1;
	condition	= Info_Mod_Gidan_EXIT_Condition;
	information	= Info_Mod_Gidan_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Gidan_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Gidan_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};