INSTANCE Info_Mod_Fingers_Hi (C_INFO)
{
	npc		= Mod_1173_STT_Fingers_MT;
	nr		= 1;
	condition	= Info_Mod_Fingers_Hi_Condition;
	information	= Info_Mod_Fingers_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo, was kann ich bei dir bekommen?";
};

FUNC INT Info_Mod_Fingers_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Fingers_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Fingers_Hi_15_00"); //Hallo, was kann ich bei dir bekommen?
	AI_Output(self, hero, "Info_Mod_Fingers_Hi_05_01"); //Bekommen? Ne, ich kann dir vielmehr zeigen, wie du dir selbst was holst ... aus den Taschen und Wohnungen deiner Mitmenschen.
	AI_Output(hero, self, "Info_Mod_Fingers_Hi_15_02"); //Hört sich nützlich an.
	AI_Output(self, hero, "Info_Mod_Fingers_Hi_05_03"); //Ahh, jemand der die Tugenden zu schätzen weiß. Sehr gut.
	AI_Output(self, hero, "Info_Mod_Fingers_Hi_05_04"); //Fürs erste kann ich dir zeigen, wie  du schleichen kannst.
	AI_Output(self, hero, "Info_Mod_Fingers_Hi_05_05"); //Falls du mehr lernen willst, müsstest du allerdings eine Kleinigkeit für mich erledigen ...

	Log_CreateTopic	(TOPIC_MOD_LEHRER_OLDCAMP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_OLDCAMP, "Fingers kann mir wieder diverse Diebestalente beibringen.");
};

INSTANCE Info_Mod_Fingers_Nek (C_INFO)
{
	npc		= Mod_1173_STT_Fingers_MT;
	nr		= 1;
	condition	= Info_Mod_Fingers_Nek_Condition;
	information	= Info_Mod_Fingers_Nek_Info;
	permanent	= 0;
	important	= 0;
	description	= "Worum geht’s?";
};

FUNC INT Info_Mod_Fingers_Nek_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fingers_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fingers_Nek_Info()
{
	AI_Output(hero, self, "Info_Mod_Fingers_Nek_15_00"); //Worum geht’s?
	AI_Output(self, hero, "Info_Mod_Fingers_Nek_05_01"); //Nun, der Schatten Sly hat etwas in seinem Besitz, was ich gerne hätte ... ein Amulett.
	AI_Output(hero, self, "Info_Mod_Fingers_Nek_15_02"); //Und ich soll es dir jetzt besorgen.
	AI_Output(self, hero, "Info_Mod_Fingers_Nek_05_03"); //Genau. Er sollte es irgendwo in seiner Hütte versteckt haben. Das ist die erste Hütte mit einem Vordach, wenn du vom Haupttor aus nach rechts gehst.
	AI_Output(self, hero, "Info_Mod_Fingers_Nek_05_04"); //Auf leisen Sohlen solltest du ohne Probleme unbemerkt hineinkommen und es an dich nehmen können.
	AI_Output(self, hero, "Info_Mod_Fingers_Nek_05_05"); //Das Amulett hat mal einem Gardisten namens Nek gehört und sein Name ist hinten eingraviert ...
	AI_Output(hero, self, "Info_Mod_Fingers_Nek_15_06"); //(halblaut) Stimmt, dass habe ich damals seinem Leichnam abgenommen ...
	AI_Output(self, hero, "Info_Mod_Fingers_Nek_05_07"); //... zumindest glauben einige Einfallspinsel, dass ER es nach SICH benannt hat.
	AI_Output(hero, self, "Info_Mod_Fingers_Nek_15_08"); //Was?!
	AI_Output(self, hero, "Info_Mod_Fingers_Nek_05_09"); //Nichts, vergiss es. Bring mir das Amulett, und ich werde dir noch mehr beibringen.
	AI_Output(self, hero, "Info_Mod_Fingers_Nek_05_10"); //Vielleicht springt auch die eine oder andere Münze dabei für dich heraus ...

	Log_CreateTopic	(TOPIC_MOD_FINGERS_NEK, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_FINGERS_NEK, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_FINGERS_NEK, "Der Schatten Fingers will mich das Diebeshandwerk lehren, wenn ich ihm ein Amulett aus Slys Hütte besorge. Slys Hütte ist die erste mit Vordach, wenn ich vom Haupttor aus nach rechts gehe.");

	Wld_InsertItem	(ItAm_Nek,	"FP_ITEM_NEKSTISCH");
	Wld_InsertItem	(ItFo_Bread,	"FP_ITEM_NEKSTISCH");
};

INSTANCE Info_Mod_Fingers_Nek2 (C_INFO)
{
	npc		= Mod_1173_STT_Fingers_MT;
	nr		= 1;
	condition	= Info_Mod_Fingers_Nek2_Condition;
	information	= Info_Mod_Fingers_Nek2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe das Amulett gefunden.";
};

FUNC INT Info_Mod_Fingers_Nek2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fingers_Nek))
	&& (Npc_HasItems(hero, ItAm_Nek) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fingers_Nek2_Info()
{
	AI_Output(hero, self, "Info_Mod_Fingers_Nek2_15_00"); //Ich habe das Amulett gefunden.
	AI_Output(self, hero, "Info_Mod_Fingers_Nek2_05_01"); //Ausgezeichnet, nichts anderes habe ich erwartet.
	AI_Output(hero, self, "Info_Mod_Fingers_Nek2_15_02"); //Hier, nimm.
	AI_Output(self, hero, "Info_Mod_Fingers_Nek2_05_03"); //(Zögerlich) Ähh, nein lass mal ... ich habe da einen besseren Einfall.
	AI_Output(self, hero, "Info_Mod_Fingers_Nek2_05_04"); //Du gibst mir 200 Goldmünzen und ich sage dir den Namen des Mannes, der das Amulett möchte.
	AI_Output(self, hero, "Info_Mod_Fingers_Nek2_05_05"); //Von ihm bekommst du dann 350 Goldmünzen ... also immer noch 150 Münzen Gewinn für dich ... neben den Diebestalenten, die ich dir beibringen kann.

	B_GivePlayerXP	(300);
};

INSTANCE Info_Mod_Fingers_Nek3 (C_INFO)
{
	npc		= Mod_1173_STT_Fingers_MT;
	nr		= 1;
	condition	= Info_Mod_Fingers_Nek3_Condition;
	information	= Info_Mod_Fingers_Nek3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ok, hier ist das Gold.";
};

FUNC INT Info_Mod_Fingers_Nek3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fingers_Nek2))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 200)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fingers_Nek3_Info()
{
	AI_Output(hero, self, "Info_Mod_Fingers_Nek3_15_00"); //Ok, hier ist das Gold.
	AI_Output(self, hero, "Info_Mod_Fingers_Nek3_05_01"); //Gut, es ist Sancho. Er steht direkt vor dem Lager der Banditen.
	AI_Output(self, hero, "Info_Mod_Fingers_Nek3_05_02"); //Sag ihm einfach, dass du Neks Amulett hast und die Sache ist perfekt. Alles klar?

	B_LogEntry	(TOPIC_MOD_FINGERS_NEK, "Ich habe Fingers 200 Goldmünzen für den Namen des Mannes gegeben, der dass Amulett haben möchte. Es ist Sancho, den ich vor dem Lager der Banditen antreffe. Ich hoffe, Fingers hat mich nicht reingelegt.");
};

INSTANCE Info_Mod_Fingers_Nek4 (C_INFO)
{
	npc		= Mod_1173_STT_Fingers_MT;
	nr		= 1;
	condition	= Info_Mod_Fingers_Nek4_Condition;
	information	= Info_Mod_Fingers_Nek4_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer sagt mir denn, dass du mich nicht übers Ohr haust?";
};

FUNC INT Info_Mod_Fingers_Nek4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fingers_Nek2))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Fingers_Nek3))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fingers_Nek4_Info()
{
	AI_Output(hero, self, "Info_Mod_Fingers_Nek4_15_00"); //Wer sagt mir denn, dass du mich nicht übers Ohr haust?
	AI_Output(self, hero, "Info_Mod_Fingers_Nek4_05_01"); //Nun, wenn du nicht willst, kannst du ja versuchen das Amulett für paar Münzen einem anderen Händler zu verkaufen.
	AI_Output(self, hero, "Info_Mod_Fingers_Nek4_05_02"); //Aber glaub bloß nicht, dass du mehr als 10 Goldstücke dafür bekommst.
};

INSTANCE Info_Mod_Fingers_SLDSpy (C_INFO)
{
	npc		= Mod_1173_STT_Fingers_MT;
	nr		= 1;
	condition	= Info_Mod_Fingers_SLDSpy_Condition;
	information	= Info_Mod_Fingers_SLDSpy_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was gibt es Neues und Wissenswertes zu hören?";
};

FUNC INT Info_Mod_Fingers_SLDSpy_Condition()
{
	if (Mod_SLD_STT_Mordrag == 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Lee_GotoSylvio))
	&& (Mod_SLD_Spy == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fingers_SLDSpy_Info()
{
	AI_Output(hero, self, "Info_Mod_Fingers_SLDSpy_15_00"); //Was gibt es Neues und Wissenswertes zu hören?
	AI_Output(self, hero, "Info_Mod_Fingers_SLDSpy_05_01"); //Nun, für geschickte Diebe wird sich im Morgengrauen in den nächsten Tagen Gelegenheit auf leichte Beute finden, wenn viele Gardisten ausgerückt sind.

	B_LogEntry	(TOPIC_MOD_SLD_SPY, "Fingers meinte, dass die Gardisten demnächst im Morgengrauen in großer Zahl ausrücken werden.");
};

INSTANCE Info_Mod_Fingers_Kap4 (C_INFO)
{
	npc		= Mod_1173_STT_Fingers_MT;
	nr		= 1;
	condition	= Info_Mod_Fingers_Kap4_Condition;
	information	= Info_Mod_Fingers_Kap4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Fingers_Kap4_Condition()
{
	if (Kapitel >= 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fingers_Kap4_Info()
{
	AI_Output(self, hero, "Info_Mod_Fingers_Kap4_05_00"); //Sieh an ... ein Besucher.
	AI_Output(hero, self, "Info_Mod_Fingers_Kap4_15_01"); //Fingers?
	AI_Output(self, hero, "Info_Mod_Fingers_Kap4_05_02"); //Überrascht mich zu sehen?
	AI_Output(self, hero, "Info_Mod_Fingers_Kap4_05_03"); //Nun, es hätte tatsächlich nicht viel gefehlt und die Orks hätte mich zu Frikassee verarbeitet.
	AI_Output(self, hero, "Info_Mod_Fingers_Kap4_05_04"); //Aber ich habe einen kühlen Kopf bewahrt, als der Tumult mit den Orks im Lager losging und bin erst mal untergetaucht.
	AI_Output(hero, self, "Info_Mod_Fingers_Kap4_15_05"); //Untergetaucht?
	AI_Output(self, hero, "Info_Mod_Fingers_Kap4_05_06"); //Ja ... in einem Fass ... und das einen ganzen Tag, ehe ich mich nachts aus dem Lager schleichen konnte.
	AI_Output(self, hero, "Info_Mod_Fingers_Kap4_05_07"); //War ganz schön unbequem da drin ... glaub mir.
	AI_Output(hero, self, "Info_Mod_Fingers_Kap4_15_08"); //Und warum bist du jetzt hier?
	AI_Output(self, hero, "Info_Mod_Fingers_Kap4_05_09"); //Nun, ich hatte schon vor dem Fall des Alten Lagers meine Kontakte zu den Banditen ... und ich bin ein Mann mit Tugenden, die sie zu schätzen wissen, wenn du verstehst.
	AI_Output(hero, self, "Info_Mod_Fingers_Kap4_15_10"); //Ich denke schon. Na ja, ich muss weiter. Pass auf dich auf.
	AI_Output(self, hero, "Info_Mod_Fingers_Kap4_05_11"); //Immer doch. Bis dann.

	if (Npc_KnowsInfo(hero, Info_Mod_Fisk_NW_Hi))
	&& (Mod_Fisk_LeiseHoffnung == 0)
	{
		B_LogEntry	(TOPIC_MOD_LEISEHOFFNUNG, "Fingers hat seinen Platz bei den Banditen gefunden. Es scheint ihm dort ganz gut zu gehen.");
	};
};

INSTANCE Info_Mod_Fingers_Lernen (C_INFO)
{
	npc		= Mod_1173_STT_Fingers_MT;
	nr		= 1;
	condition	= Info_Mod_Fingers_Lernen_Condition;
	information	= Info_Mod_Fingers_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Bring mir was bei.";
};

FUNC INT Info_Mod_Fingers_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fingers_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Fingers_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Fingers_Lernen_15_00"); //Bring mir was bei.
	AI_Output(self, hero, "Info_Mod_Fingers_Lernen_05_01"); //Was willst du lernen?

	Info_ClearChoices	(Info_Mod_Fingers_Lernen);

	Info_AddChoice 		(Info_Mod_Fingers_Lernen, DIALOG_BACK, Info_Mod_Fingers_Lernen_BACK);

	if (Npc_GetTalentSkill (hero, NPC_TALENT_PICKPOCKET) == FALSE)
	&& (Npc_KnowsInfo(hero, Info_Mod_Fingers_Nek2))
	{
		Info_AddChoice		(Info_Mod_Fingers_Lernen, B_BuildLearnString("Taschendiebstahl", B_GetLearnCostTalent(hero, NPC_TALENT_PICKPOCKET, 1)), Info_Mod_Fingers_Lernen_Pickpocket);
	};
	if (Npc_GetTalentSkill (hero, NPC_TALENT_PICKLOCK) == FALSE)
	&& (Npc_KnowsInfo(hero, Info_Mod_Fingers_Nek2))
	{
		Info_AddChoice		(Info_Mod_Fingers_Lernen, B_BuildLearnString("Schlösser knacken", B_GetLearnCostTalent(hero, NPC_TALENT_PICKLOCK, 1)), Info_Mod_Fingers_Lernen_Picklock);
	};
	if (Npc_GetTalentSkill (hero, NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice		(Info_Mod_Fingers_Lernen, B_BuildLearnString("Schleichen", B_GetLearnCostTalent(hero, NPC_TALENT_SNEAK, 1)), Info_Mod_Fingers_Lernen_Sneak);
	};
	if (Npc_GetTalentSkill (hero, NPC_TALENT_ACROBAT) == FALSE)
	&& (Npc_KnowsInfo(hero, Info_Mod_Fingers_Nek2))
	{
		Info_AddChoice		(Info_Mod_Fingers_Lernen, B_BuildLearnString("Akrobatik", B_GetLearnCostTalent(hero, NPC_TALENT_ACROBAT, 1)), Info_Mod_Fingers_Lernen_Acrobat);
	};
	if (Mod_Schwierigkeit != 4)
	{
		Info_AddChoice		(Info_Mod_Fingers_Lernen, B_BuildLearnString_New(PRINT_LearnDEX5	, B_GetLearnCostAttribute_New(hero, ATR_DEXTERITY), ATR_DEXTERITY)	, Info_Mod_Fingers_Lernen_Geschick_5);
		Info_AddChoice		(Info_Mod_Fingers_Lernen, B_BuildLearnString_New(PRINT_LearnDEX1	, B_GetLearnCostAttribute(hero, ATR_DEXTERITY), ATR_DEXTERITY)	, Info_Mod_Fingers_Lernen_Geschick_1);
	};
};

FUNC VOID Info_Mod_Fingers_Lernen_BACK()
{
	Info_ClearChoices (Info_Mod_Fingers_Lernen);
};

FUNC VOID Info_Mod_Fingers_Lernen_Pickpocket()
{
	B_TeachThiefTalent (self, hero, NPC_TALENT_PICKPOCKET);
};

FUNC VOID Info_Mod_Fingers_Lernen_Picklock()
{
	B_TeachThiefTalent (self, hero, NPC_TALENT_PICKLOCK);
};

FUNC VOID Info_Mod_Fingers_Lernen_Sneak()
{
	B_TeachThiefTalent (self, hero, NPC_TALENT_SNEAK);
};

FUNC VOID Info_Mod_Fingers_Lernen_Acrobat()
{
	AI_Output(hero, self, "Info_Mod_Buster_Lernen_15_00"); //Bring mir Akrobatik bei.

	if (B_TeachThiefTalent (self, hero, NPC_TALENT_ACROBAT))
	{
		AI_Output(self, hero, "Info_Mod_Fingers_Lernen_Acrobat_05_01"); //Wenn du deinen Körper beherrschst, bist du in der Lage viel weiter zu springen.
		AI_Output(self, hero, "Info_Mod_Fingers_Lernen_Acrobat_05_02"); //Du lernst dich richtig abzurollen und aus dem Fall heraus richtig zu landen. Aber denk daran, du bist nicht unsterblich!
		AI_Output(self, hero, "Info_Mod_Fingers_Lernen_Acrobat_05_03"); //Auch im Kampf ist Akrobatik sehr hilfreich. Du kannst deinen Abstand zum Gegner sehr schnell verändern. Viel Glück!
	};
};

FUNC VOID Info_Mod_Fingers_Lernen_Geschick_5()
{
	B_TeachAttributePoints_New (self, hero, ATR_DEXTERITY, 5, 140);
	
	Info_ClearChoices	(Info_Mod_Fingers_Lernen);
};

FUNC VOID Info_Mod_Fingers_Lernen_Geschick_1()
{
	B_TeachAttributePoints (self, hero, ATR_DEXTERITY, 1, 140);
	
	Info_ClearChoices	(Info_Mod_Fingers_Lernen);
};

INSTANCE Info_Mod_Fingers_Pickpocket (C_INFO)
{
	npc		= Mod_1173_STT_Fingers_MT;
	nr		= 1;
	condition	= Info_Mod_Fingers_Pickpocket_Condition;
	information	= Info_Mod_Fingers_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_100;
};

FUNC INT Info_Mod_Fingers_Pickpocket_Condition()
{
	C_Beklauen	(100, ItMi_Gold, 400);
};

FUNC VOID Info_Mod_Fingers_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Fingers_Pickpocket);

	Info_AddChoice	(Info_Mod_Fingers_Pickpocket, DIALOG_BACK, Info_Mod_Fingers_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Fingers_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Fingers_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Fingers_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Fingers_Pickpocket);
};

FUNC VOID Info_Mod_Fingers_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Fingers_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Fingers_Pickpocket);

		Info_AddChoice	(Info_Mod_Fingers_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Fingers_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Fingers_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Fingers_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Fingers_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Fingers_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Fingers_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Fingers_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Fingers_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Fingers_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Fingers_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Fingers_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Fingers_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Fingers_EXIT (C_INFO)
{
	npc		= Mod_1173_STT_Fingers_MT;
	nr		= 1;
	condition	= Info_Mod_Fingers_EXIT_Condition;
	information	= Info_Mod_Fingers_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Fingers_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Fingers_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};