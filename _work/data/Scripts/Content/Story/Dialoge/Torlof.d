INSTANCE Info_Mod_Torlof_Hi (C_INFO)
{
	npc		= Mod_527_SLD_Torlof_NW;
	nr		= 1;
	condition	= Info_Mod_Torlof_Hi_Condition;
	information	= Info_Mod_Torlof_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hi.";
};

FUNC INT Info_Mod_Torlof_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Torlof_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Torlof_Hi_15_00"); //Hi.
	AI_Output(self, hero, "Info_Mod_Torlof_Hi_01_01"); //Du lebst ja noch.
	AI_Output(self, hero, "Info_Mod_Torlof_Hi_01_02"); //Hätte nicht gedacht, dass ich dich nochmal wieder sehe.
};

INSTANCE Info_Mod_Torlof_Auftrag (C_INFO)
{
	npc		= Mod_527_SLD_Torlof_NW;
	nr		= 1;
	condition	= Info_Mod_Torlof_Auftrag_Condition;
	information	= Info_Mod_Torlof_Auftrag_Info;
	permanent	= 0;
	important	= 0;
	description	= "Lares schickt mich.";
};

FUNC INT Info_Mod_Torlof_Auftrag_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lares_WillSoeldner))
	&& (Npc_KnowsInfo(hero, Info_Mod_Torlof_Hi))
	&& (Mod_Gilde	==	0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Torlof_Auftrag_Info()
{
	AI_Output(hero, self, "Info_Mod_Torlof_Auftrag_15_00"); //Lares schickt mir. Du sollst mir einen Auftrag geben.
	AI_Output(self, hero, "Info_Mod_Torlof_Auftrag_01_01"); //Ok. Wie du sicher weißt, haben die Paladine unseren Anführer Lee damals verraten. Deshalb wurde er in die Barriere geworfen.
	AI_OUtput(self, hero, "Info_Mod_Torlof_Auftrag_01_02"); //Es ist also kein Wunder, dass wir uns gegen die Paladine auflehnen.
	AI_Output(self, hero, "Info_Mod_Torlof_Auftrag_01_03"); //Wir bräuchten etwas mit dem wir sie unter Druck setzen können. Doch uns kennen die Paladine, aber du bist neu hier.
	AI_Output(self, hero, "Info_Mod_Torlof_Auftrag_01_04"); //Geh in die Stadt und finde heraus was wir gegen die Paladine machen könnten.
	AI_Output(self, hero, "Info_Mod_Torlof_Auftrag_01_05"); //Du musst etwas beschaffen oder herausfinden, womit wir die Paladine in der Stadt unter Druck setzen können.
	AI_Output(hero, self, "Info_Mod_Torlof_Auftrag_15_06"); //Und wie soll ich dazu vorgehen?
	AI_Output(self, hero, "Info_Mod_Torlof_Auftrag_01_07"); //Dir wird schon etwas einfallen. Wenn du nicht weiter weißt, dann frag Gorn, den du ja noch aus den Zeiten der Kolonie kennst. Er hat seine Kontakte in der Stadt.

	Log_CreateTopic	(TOPIC_MOD_TORLOFSPIONAGE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_TORLOFSPIONAGE, LOG_RUNNING);
	B_LogEntry_More	(TOPIC_MOD_SÖLDNER, TOPIC_MOD_TORLOFSPIONAGE, "Als Beweis meiner Loyalität zu Lee soll ich die Paladine ausspionieren.", "Torlof will, dass ich etwas herausfinde oder beschaffe, dass gegen die Paladine verwendet werden kann. Vielleicht kann Gorn mir ein paar Tipps geben.");
};

INSTANCE Info_Mod_Torlof_Kristall (C_INFO)
{
	npc		= Mod_527_SLD_Torlof_NW;
	nr		= 1;
	condition	= Info_Mod_Torlof_Kristall_Condition;
	information	= Info_Mod_Torlof_Kristall_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab hier den Kristall der Paladine.";
};

FUNC INT Info_Mod_Torlof_Kristall_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Torlof_Auftrag))
	&& (Npc_KnowsInfo(hero, Info_Mod_Diego_Dieb))
	&& (Npc_HasItems(hero, Mod_PaladinKristall) >= 1)
	&& (!Npc_KnowsInfo(hero, Info_Mod_Andre_Kristall))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Torlof_Kristall_Info()
{
	AI_Output(hero, self, "Info_Mod_Torlof_Kristall_15_00"); //Ich hab hier den Kristall der Paladine.

	B_GiveInvItems	(hero, self, Mod_PaladinKristall, 1);
	
	AI_Output(self, hero, "Info_Mod_Torlof_Kristall_01_01"); //Ein magischer Kristall. Darüber muss ich mich erst einmal mit Lares beraten. Komm in ein paar Stunden wieder.


	B_LogEntry	(TOPIC_MOD_TORLOFSPIONAGE, "Von Gorn konnte ich erfahren, dass Paladin Lothar im oberen Viertel eine schwäche für Alkohol und eine große Klappe hat.");
	B_SetTopicStatus	(TOPIC_MOD_TORLOFSPIONAGE, LOG_SUCCESS);
	
	B_GivePlayerXP	(400);

	Npc_SetRefuseTalk(self, 120);
};

INSTANCE Info_Mod_Torlof_KristallEnd (C_INFO)
{
	npc		= Mod_527_SLD_Torlof_NW;
	nr		= 1;
	condition	= Info_Mod_Torlof_KristallEnd_Condition;
	information	= Info_Mod_Torlof_KristallEnd_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Torlof_KristallEnd_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Torlof_Kristall))
	&& (Npc_RefuseTalk(self) == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Torlof_KristallEnd_Info()
{
	AI_Output(self, hero, "Info_Mod_Torlof_KristallEnd_01_00"); //Da bist du ja. Nun, wirklich etwas anfangen können wir mit dem Kristall bei den Paladinen nicht.
	AI_Output(self, hero, "Info_Mod_Torlof_KristallEnd_01_01"); //Wir könnten ihn höchstens gegen ein paar Münzen zurückverkaufen. Aber da haben wir einen strategisch besseren Einfall.
	AI_Output(self, hero, "Info_Mod_Torlof_KristallEnd_01_02"); //Wenn du tatsächlich bei uns mitmachen willst, musst du noch den Kristall samt diesem Schreiben den Wassermagiern bei ihrer Ausgrabungsstätte bringen.

	CreateInvItems	(hero, Mod_PaladinKristall, 1);
	CreateInvItems	(hero, ItWr_TorlofForSaturas, 1);

	Npc_RemoveInvItems	(self, Mod_PaladinKristall, 1);

	B_ShowGivenThings	("Kristall des Feuers und Nachricht erhalten");

	AI_Output(self, hero, "Info_Mod_Torlof_Kristall_01_03"); //Danach kommst du mit dem Entgelt zu uns zurück.

	Log_CreateTopic	(TOPIC_MOD_NL_KRISTALL, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_NL_KRISTALL, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_NL_KRISTALL, "Torlof hat mir aufgetragen den Kristall des Feuers zusammen mit einem Schreiben zu den Wassermagiern zu bringen. Die Bezahlung soll ich dann zu ihm bringen.");
	
	Wld_InsertNpc	(Mod_7214_OUT_Halunke_NW, "PORTAL");
};

INSTANCE Info_Mod_Torlof_KristallEntgelt (C_INFO)
{
	npc		= Mod_527_SLD_Torlof_NW;
	nr		= 1;
	condition	= Info_Mod_Torlof_KristallEntgelt_Condition;
	information	= Info_Mod_Torlof_KristallEntgelt_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe den Kristall übergeben.";
};

FUNC INT Info_Mod_Torlof_KristallEntgelt_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lance_KristallEntgelt))
	&& (Npc_HasItems(hero, ItMi_Gold) >= 1000)
	&& (Npc_HasItems(hero, ItMi_MagicPaket) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Torlof_KristallEntgelt_Info()
{
	AI_Output(hero, self, "Info_Mod_Torlof_KristallEntgelt_15_00"); //Ich habe den Kristall übergeben und dafür 1000 Goldstücke und dieses Paket erhalten.

	B_ShowGivenThings	("1000 Gold und Paket gegeben");

	Npc_RemoveInvItems	(hero, ItMi_Gold, 1000);
	Npc_RemoveInvItems	(hero, ItMi_MagicPaket, 1);

	AI_Output(self, hero, "Info_Mod_Torlof_KristallEntgelt_01_01"); //Ausgezeichnet. Nun steht deiner Aufnahme nichts mehr im Weg. Geh am besten gleich zu Lares.

	B_SetTopicStatus	(TOPIC_MOD_NL_KRISTALL, LOG_SUCCESS);

	B_GivePlayerXP	(400);

	B_LogEntry	(TOPIC_MOD_SÖLDNER, "Torlof meint, dass ich jetzt Söldner werden kann.");

	B_Göttergefallen(2, 3);
};

INSTANCE Info_Mod_Torlof_NeueAufgabe (C_INFO)
{
	npc		= Mod_527_SLD_Torlof_NW;
	nr		= 1;
	condition	= Info_Mod_Torlof_NeueAufgabe_Condition;
	information	= Info_Mod_Torlof_NeueAufgabe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du eine andere Aufgabe für mich?";
};

FUNC INT Info_Mod_Torlof_NeueAufgabe_Condition()
{
	if ((Npc_KnowsInfo(hero, Info_Mod_Andre_Kristall))
	|| (Npc_KnowsInfo(hero, Info_Mod_Vatras_Kristall))
	|| (Npc_KnowsInfo(hero, Info_Mod_Pyrokar_Kristall)))
	&& (Mod_Gilde	==	0)
	&& (Npc_KnowsInfo(hero, Info_Mod_Torlof_Auftrag))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Torlof_NeueAufgabe_Info()
{
	AI_Output(hero, self, "Info_Mod_Torlof_NeueAufgabe_15_00"); //Hast du eine andere Aufgabe für mich?
	AI_Output(self, hero, "Info_Mod_Torlof_NeueAufgabe_01_01"); //Du hast deine erste Prüfung nicht bestanden. Aber wir wollen ja nicht so sein, du bekommst eine zweite Chance.
	AI_Output(hero, self, "Info_Mod_Torlof_NeueAufgabe_15_02"); //Was soll ich machen?
	AI_Output(self, hero, "Info_Mod_Torlof_NeueAufgabe_01_03"); //Bring uns einen weiteren Söldneranwärter.

	Wld_InsertNpc	(Mod_200_NONE_Alvares_NW,	"NW_CITY_ENTRANCE_01");

	B_SetTopicStatus	(TOPIC_MOD_TORLOFSPIONAGE, LOG_FAILED);
	
	Log_CreateTopic	(TOPIC_MOD_TORLOF_NEUERANWÄRTER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_TORLOF_NEUERANWÄRTER, LOG_RUNNING);
	
	B_LogEntry_More	(TOPIC_MOD_SÖLDNER, TOPIC_MOD_TORLOF_NEUERANWÄRTER, "Ich soll einen neuen Söldneranwärter zu Torlof bringen.", "Torlof hat mir aufgetragen einen Söldneranwärter zu finden. Vielleicht kann mir Gorn einen Tipp geben.");
};

INSTANCE Info_Mod_Torlof_Alvares (C_INFO)
{
	npc		= Mod_527_SLD_Torlof_NW;
	nr		= 1;
	condition	= Info_Mod_Torlof_Alvares_Condition;
	information	= Info_Mod_Torlof_Alvares_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab einen neuen Anwärter für euch.";
};

FUNC INT Info_Mod_Torlof_Alvares_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Alvares_Hof))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Torlof_Alvares_Info()
{
	AI_Output(hero, self, "Info_Mod_Torlof_Alvares_15_00"); //Ich hab einen neuen Anwärter für euch.
	AI_Output(self, hero, "Info_Mod_Torlof_Alvares_01_01"); //Wen?
	AI_Output(hero, self, "Info_Mod_Torlof_Alvares_15_02"); //Alvares. Er hat sich mit einer Miliz geprügelt und ich musste ihn aus dem Gefängnis befreien.
	AI_Output(self, hero, "Info_Mod_Torlof_Alvares_01_03"); //Sehr gut. Du hast die Prüfung bestanden. Damit kannst du uns nun beitreten.

	B_LogEntry_More	(TOPIC_MOD_SÖLDNER, TOPIC_MOD_TORLOF_NEUERANWÄRTER, "Ich hab die Prüfung bestanden", "Ich kann jetzt Söldner werden.");
	B_SetTopicStatus	(TOPIC_MOD_TORLOF_NEUERANWÄRTER, LOG_SUCCESS);

	B_GivePlayerXP	(300);

	B_Göttergefallen(2, 1);
};

INSTANCE Info_Mod_Torlof_Hexen (C_INFO)
{
	npc		= Mod_527_SLD_Torlof_NW;
	nr		= 1;
	condition	= Info_Mod_Torlof_Hexen_Condition;
	information	= Info_Mod_Torlof_Hexen_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Torlof_Hexen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Torlof_Hi))
	&& (Mod_WM_Beeinflussend == 1)
	&& (Mod_TrfWoman == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Torlof_Hexen_Info()
{
	AI_Output(self, hero, "Info_Mod_Torlof_Hexen_01_00"); //Hallo Kleine. Wollen wir nicht etwas Spaß miteinander haben? So wie du aussiehst willst du es doch auch.
	AI_Output(hero, self, "Info_Mod_Torlof_Hexen_15_01"); //Gerne.
	AI_Output(self, hero, "Info_Mod_Torlof_Hexen_01_02"); //Was, wirklich ...?! Wollen wir dann etwas aufs Zimmer gehen.
	AI_Output(hero, self, "Info_Mod_Torlof_Hexen_15_03"); //Sicher. Da gibt es nur ein Problem ...
	AI_Output(self, hero, "Info_Mod_Torlof_Hexen_01_04"); //Ach, zier dich nicht so. Welches Problem?

	Mod_WM_Beeinflussend = 0;

	Info_ClearChoices	(Info_Mod_Torlof_Hexen);

	Info_AddChoice	(Info_Mod_Torlof_Hexen, "Du stehst in Flammen. Schnell.", Info_Mod_Torlof_Hexen_B);
	Info_AddChoice	(Info_Mod_Torlof_Hexen, "Auf dem Hof stehen lauter Goblins herum, die mich bedrohen.", Info_Mod_Torlof_Hexen_A);
};

FUNC VOID Info_Mod_Torlof_Hexen_B()
{
	AI_Output(hero, self, "Info_Mod_Torlof_Hexen_B_15_00"); //Du stehst in Flammen. Schnell, entledige dich deiner Kleidung und renn auf dem Hof herum, um die Flammen zu löschen.
	AI_Output(self, hero, "Info_Mod_Torlof_Hexen_B_01_01"); //Was?! Wuahh, tatsächlich, diese Hitze diese Schmerzen.

	AI_UnequipArmor	(self);

	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "So, nachdem ich Torlof dem Wahnsinn preisgab, kann ich Elena davon berichten.");

	Info_ClearChoices	(Info_Mod_Torlof_Hexen);

	AI_StopProcessInfos	(self);

	AI_StartState	(self, ZS_Flee, 0, "");
};

FUNC VOID Info_Mod_Torlof_Hexen_A()
{
	AI_Output(hero, self, "Info_Mod_Torlof_Hexen_A_15_00"); //Auf dem Hof stehen lauter Goblins herum, die mich bedrohen. Erledige sie, dann können wir zur Sache kommen.
	AI_Output(self, hero, "Info_Mod_Torlof_Hexen_A_01_01"); //Was Goblins?! Ja, tatsächlich, jetzt sehe ich sie auch.

	B_LogEntry	(TOPIC_MOD_ADANOS_UNHEIL, "So, nachdem ich Torlof dem Wahnsinn preisgab, kann ich Elena davon berichten.");

	Info_ClearChoices	(Info_Mod_Torlof_Hexen);

	AI_StopProcessInfos	(self);

	B_Attack	(self, Mod_798_SLD_Wolf_NW, AR_None, 0);
};

INSTANCE Info_Mod_Torlof_Grog (C_INFO)
{
	npc		= Mod_527_SLD_Torlof_NW;
	nr		= 1;
	condition	= Info_Mod_Torlof_Grog_Condition;
	information	= Info_Mod_Torlof_Grog_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab hier was für dich.";
};

FUNC INT Info_Mod_Torlof_Grog_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Torlof_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Skip_Francis))
	&& (Npc_HasItems(hero, Mod_GrogPaket) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Torlof_Grog_Info()
{
	AI_Output(hero, self, "Info_Mod_Torlof_Grog_15_00"); //Ich hab hier was für dich.
	AI_Output(self, hero, "Info_Mod_Torlof_Grog_01_01"); //Was denn?
	AI_Output(hero, self, "Info_Mod_Torlof_Grog_15_02"); //Ein Paket voller Grog.

	B_GiveInvItems	(hero, self, Mod_GrogPaket, 1);

	AI_Output(self, hero, "Info_Mod_Torlof_Grog_01_03"); //Wurde aber auch langsam Zeit. Endlich haben wir hier mal wieder was ordentliches zu trinken.
	AI_Output(self, hero, "Info_Mod_Torlof_Grog_01_04"); //Hier ist dein Gold.

	B_GiveInvItems	(self, hero, ItMi_Gold, 500);
};

INSTANCE Info_Mod_Torlof_HaradLehrling (C_INFO)
{
	npc		= Mod_527_SLD_Torlof_NW;
	nr		= 1;
	condition	= Info_Mod_Torlof_HaradLehrling_Condition;
	information	= Info_Mod_Torlof_HaradLehrling_Info;
	permanent	= 0;
	important	= 0;
	description	= "Harad schickt mich, um dir ein Angebot zu machen.";
};

FUNC INT Info_Mod_Torlof_HaradLehrling_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Harad_Job))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Torlof_HaradLehrling_Info()
{
	AI_Output(hero, self, "Info_Mod_Torlof_HaradLehrling_15_00"); //Harad schickt mich, um dir ein Angebot zu machen.
	AI_Output(self, hero, "Info_Mod_Torlof_HaradLehrling_01_01"); //Harad? Wir haben doch Bennet. Der stellt alles her, was wir brauchen.
	AI_Output(self, hero, "Info_Mod_Torlof_HaradLehrling_01_02"); //Außerdem soll Harad ein ziemliches Arschloch sein. Wieso sollte uns sein Angebot interessieren?
};

INSTANCE Info_Mod_Torlof_HaradLehrling2 (C_INFO)
{
	npc		= Mod_527_SLD_Torlof_NW;
	nr		= 1;
	condition	= Info_Mod_Torlof_HaradLehrling2_Condition;
	information	= Info_Mod_Torlof_HaradLehrling2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Schau dir dieses Schwert an.";
};

FUNC INT Info_Mod_Torlof_HaradLehrling2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Torlof_HaradLehrling))
	&& (Npc_HasItems(hero, ItMw_HaradSchwert) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Torlof_HaradLehrling2_Info()
{
	AI_Output(hero, self, "Info_Mod_Torlof_HaradLehrling2_15_00"); //Schau dir dieses Schwert an.

	B_GiveInvItems	(hero, self, ItMw_HaradSchwert, 1);

	EquipWeapon (self, ItMw_HaradSchwert);

	AI_DrawWeapon	(self);

	AI_PlayAni	(self, "T_1HSINSPECT");

	AI_RemoveWeapon	(self);

	AI_Output(self, hero, "Info_Mod_Torlof_HaradLehrling2_01_01"); //Wahrlich nicht schlecht. Aber ich bin kein Experte für Schwerter und kann nicht beurteilen, ob es sich besser macht als die Schwerter von Bennet.
	AI_Output(self, hero, "Info_Mod_Torlof_HaradLehrling2_01_02"); //Wie wär's, wenn du dich mit Hock messen würdest?
	AI_Output(self, hero, "Info_Mod_Torlof_HaradLehrling2_01_03"); //Der dürfte etwa deine Kragenweite haben, und ich könnte mir anschauen, wie sich die Waffe im Kampf verhält.
};

INSTANCE Info_Mod_Torlof_HaradLehrling3 (C_INFO)
{
	npc		= Mod_527_SLD_Torlof_NW;
	nr		= 1;
	condition	= Info_Mod_Torlof_HaradLehrling3_Condition;
	information	= Info_Mod_Torlof_HaradLehrling3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Klar doch.";
};

FUNC INT Info_Mod_Torlof_HaradLehrling3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Torlof_HaradLehrling2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Torlof_HaradLehrling3_Info()
{
	AI_Output(hero, self, "Info_Mod_Torlof_HaradLehrling3_15_00"); //Klar doch.

	AI_TurnToNpc	(self, Mod_1200_SLD_Soeldner_NW);

	AI_Output(self, hero, "Info_Mod_Torlof_HaradLehrling3_01_01"); //(ruft) Hock, komm mal her!

	AI_TurnToNpc	(self, hero);

	AI_Output(self, hero, "Info_Mod_Torlof_HaradLehrling3_01_02"); //Ihr zwei Hübschen werdet jetzt einen Übungskampf austragen.
	AI_Output(self, hero, "Info_Mod_Torlof_HaradLehrling3_01_03"); //Nimm das Schwert und zeig, was du drauf hast.

	B_GiveInvItems	(self, hero, ItMw_HaradSchwert, 1);

	EquipWeapon (hero, ItMw_HaradSchwert);

	AI_Output(self, hero, "Info_Mod_Torlof_HaradLehrling3_01_04"); //3, 2, 1, los!

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(Mod_1200_SLD_Soeldner_NW, "HARAD");
};

INSTANCE Info_Mod_Torlof_HaradLehrling4 (C_INFO)
{
	npc		= Mod_527_SLD_Torlof_NW;
	nr		= 1;
	condition	= Info_Mod_Torlof_HaradLehrling4_Condition;
	information	= Info_Mod_Torlof_HaradLehrling4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Torlof_HaradLehrling4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hock_HaradLehrling))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Torlof_HaradLehrling4_Info()
{
	if (Mod_HaradLehrling_Kampf == 0)
	{
		AI_Output(self, hero, "Info_Mod_Torlof_HaradLehrling4_01_00"); //Sieht passabel aus. Leicht, schnell und gut ausbalanciert.
		AI_Output(self, hero, "Info_Mod_Torlof_HaradLehrling4_01_01"); //Sag Harad, dass wir bereit wären, eine Probelieferung von ihm entgegen zu nehmen.

		B_LogEntry	(TOPIC_MOD_LEHRLING_HARAD_ONE, "Ich konnte Torlof davon überzeugen, eine Lieferung bei Harad zu bestellen. Ich sollte die Nachricht schnellstmöglich überbringen.");
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Torlof_HaradLehrling4_01_02"); //(lacht ausgiebig) Meinst du, ich sehe nicht, wenn du die Waffe wechselst?
		AI_Output(self, hero, "Info_Mod_Torlof_HaradLehrling4_01_03"); //Das war ja mal die schlechteste Verarsche, die mir je untergekommen ist!
		AI_Output(hero, self, "Info_Mod_Torlof_HaradLehrling4_15_04"); //Wollt ihr die Waffen trotzdem bei Harad kaufen?
		AI_Output(self, hero, "Info_Mod_Torlof_HaradLehrling4_01_05"); //Du hast Nerven! Scher dich zurück zu ihm!
	};

	AI_Teleport	(Mod_1200_SLD_Soeldner_NW, "NW_BIGFARM_PATH_01");
	B_StartOtherRoutine	(Mod_1200_SLD_Soeldner_NW, "START");
};

INSTANCE Info_Mod_Torlof_HaradLehrling5 (C_INFO)
{
	npc		= Mod_527_SLD_Torlof_NW;
	nr		= 1;
	condition	= Info_Mod_Torlof_HaradLehrling5_Condition;
	information	= Info_Mod_Torlof_HaradLehrling5_Info;
	permanent	= 0;
	important	= 0;
	description	= "Eine Waffenlieferung von Torlof.";
};

FUNC INT Info_Mod_Torlof_HaradLehrling5_Condition()
{
	if (Npc_HasItems(hero, ItMi_Waffenbuendel) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Torlof_HaradLehrling5_Info()
{
	AI_Output(hero, self, "Info_Mod_Torlof_HaradLehrling5_15_00"); //Eine Waffenlieferung von Torlof.
	AI_Output(self, hero, "Info_Mod_Torlof_HaradLehrling5_01_01"); //Das wurde aber auch Zeit. Wir haben schon seit Tagen darauf gewartet.
	AI_Output(hero, self, "Info_Mod_Torlof_HaradLehrling5_15_02"); //Die Paladine waren nicht damit einverstanden, dass Harad für euch arbeitet.
	AI_Output(self, hero, "Info_Mod_Torlof_HaradLehrling5_01_03"); //(lacht) Das verstehe ich gut. Aber das Schlitzohr hat's dann ja doch geschafft.
	AI_Output(self, hero, "Info_Mod_Torlof_HaradLehrling5_01_04"); //Dann lass mal sehen.

	B_GiveInvItems	(hero, self, ItMi_Waffenbuendel, 1);

	AI_Output(self, hero, "Info_Mod_Torlof_HaradLehrling5_01_05"); //(zählt murmelnd) 5, 10, 15, 17... Bloß 17 Schwerter? Wir hatten 20 bestellt.
	AI_Output(hero, self, "Info_Mod_Torlof_HaradLehrling5_15_06"); //Bist du dir sicher?
	AI_Output(self, hero, "Info_Mod_Torlof_HaradLehrling5_01_07"); //Ja. 20 Schwerter zu je 100 Goldmünzen. Ganz klare Rechnung.
	AI_Output(hero, self, "Info_Mod_Torlof_HaradLehrling5_15_08"); //Dann gibst du mir jetzt das Gold, und ich sag Harad, dass er noch drei Schwerter schmieden soll.
	AI_Output(self, hero, "Info_Mod_Torlof_HaradLehrling5_01_09"); //So läuft das nicht. Wir bezahlen nur das, was wir auch bekommen.

	B_GiveInvItems	(self, hero, ItMi_Gold, 1700);

	AI_Output(self, hero, "Info_Mod_Torlof_HaradLehrling5_01_10"); //Wenn Harad mehr will, soll er schnell liefern, sonst überlegen wir es uns vielleicht anders.

	B_LogEntry	(TOPIC_MOD_LEHRLING_HARAD_TWO, "Torlof behauptet, dass er drei Schwerter zu wenig von Harad erhalten hat, und hat mir deshalb auch nicht so viel Gold gegeben, wie Harad wollte.");
};

INSTANCE Info_Mod_Torlof_HaradLehrling6 (C_INFO)
{
	npc		= Mod_527_SLD_Torlof_NW;
	nr		= 1;
	condition	= Info_Mod_Torlof_HaradLehrling6_Condition;
	information	= Info_Mod_Torlof_HaradLehrling6_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier sind die fehlenden Schwerter.";
};

FUNC INT Info_Mod_Torlof_HaradLehrling6_Condition()
{
	if (Npc_HasItems(hero, ItMw_1H_Common_01) >= 3)
	&& (Schaerfen_Perk == TRUE)
	&& (Npc_KnowsInfo(hero, Info_Mod_Harad_LehrlingQuest3))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Torlof_HaradLehrling6_Info()
{
	AI_Output(hero, self, "Info_Mod_Torlof_HaradLehrling6_15_00"); //Hier sind die fehlenden Schwerter.

	B_GiveInvItems	(hero, self, ItMw_1H_Common_01, 3);

	AI_Output(self, hero, "Info_Mod_Torlof_HaradLehrling6_01_01"); //Du und dein Meister, ihr braucht immer ziemlich lang. Aber über die Qualität kann man sich nicht beschweren.

	B_GiveInvItems	(self, hero, ItMi_Gold, 300);

	AI_Output(self, hero, "Info_Mod_Torlof_HaradLehrling6_01_02"); //Ich hoffe nur, dass ihr euch beim nächsten Auftrag mehr beeilt.

	B_SetTopicStatus	(TOPIC_MOD_LEHRLING_HARAD_TWO, LOG_SUCCESS);

	B_GivePlayerXP	(100);
};

INSTANCE Info_Mod_Torlof_HaradLehrling7 (C_INFO)
{
	npc		= Mod_527_SLD_Torlof_NW;
	nr		= 1;
	condition	= Info_Mod_Torlof_HaradLehrling7_Condition;
	information	= Info_Mod_Torlof_HaradLehrling7_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kann ich euch meine Dienste als Schmied anbieten?";
};

FUNC INT Info_Mod_Torlof_HaradLehrling7_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Harad_LehrlingQuest9))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Torlof_HaradLehrling7_Info()
{
	AI_Output(hero, self, "Info_Mod_Torlof_HaradLehrling7_15_00"); //Kann ich euch meine Dienste als Schmied anbieten?
	AI_Output(self, hero, "Info_Mod_Torlof_HaradLehrling7_01_01"); //Nein, danke. Nach den Schwierigkeiten, die wir mit Harad hatten, bleiben wir jetzt doch lieber bei Bennet. Tut mir Leid.
};

INSTANCE Info_Mod_Torlof_Lehrer (C_INFO)
{
	npc		= Mod_527_SLD_Torlof_NW;
	nr		= 1;
	condition	= Info_Mod_Torlof_Lehrer_Condition;
	information	= Info_Mod_Torlof_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir was beibringen?";
};

FUNC INT Info_Mod_Torlof_Lehrer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Torlof_Hi))
	&& ((Mod_Gilde == 4)
	|| (Mod_Gilde == 5)
	|| (Mod_Gilde == 19))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Torlof_Lehrer_Info()
{
	B_Say	(hero, self, "$KANNSTDUMIRWASBEIBRINGEN");

	AI_Output(self, hero, "Info_Mod_Torlof_Lehrer_01_01"); //Ich kann dir helfen stärker zu werden.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_SOELDNER_ONAR, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_SOELDNER_ONAR, "Torlof kann mir helfen Stärker zu werden.");
};

INSTANCE Info_Mod_Torlof_Lernen (C_INFO)
{
	npc		= Mod_527_SLD_Torlof_NW;
	nr		= 1;
	condition	= Info_Mod_Torlof_Lernen_Condition;
	information	= Info_Mod_Torlof_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Bring mir was bei.";
};

FUNC INT Info_Mod_Torlof_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Torlof_Lehrer))
	&& ((Mod_Gilde == 4)
	|| (Mod_Gilde == 5)
	|| (Mod_Gilde == 19))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Torlof_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Torlof_Lernen_15_00"); //Bring mir was bei.
	AI_Output(self, hero, "Info_Mod_Torlof_Lernen_01_01"); //Was willst du lernen?

	Info_ClearChoices	(Info_Mod_Torlof_Lernen);

	Info_AddChoice 		(Info_Mod_Torlof_Lernen, DIALOG_BACK, Info_Mod_Torlof_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Torlof_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5	, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Torlof_Lernen_Staerke_5);
	Info_AddChoice		(Info_Mod_Torlof_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1	, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Torlof_Lernen_Staerke_1);
};

FUNC VOID Info_Mod_Torlof_Lernen_BACK()
{
	Info_ClearChoices (Info_Mod_Torlof_Lernen);
};

FUNC VOID Info_Mod_Torlof_Lernen_Staerke_5()
{
	B_TeachAttributePoints_New (self, hero, ATR_STRENGTH, 5, 200);
	
	Info_ClearChoices	(Info_Mod_Torlof_Lernen);

	Info_AddChoice 		(Info_Mod_Torlof_Lernen, DIALOG_BACK, Info_Mod_Torlof_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Torlof_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5	, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Torlof_Lernen_Staerke_5);
	Info_AddChoice		(Info_Mod_Torlof_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1	, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Torlof_Lernen_Staerke_1);
};

FUNC VOID Info_Mod_Torlof_Lernen_Staerke_1()
{
	B_TeachAttributePoints (self, hero, ATR_STRENGTH, 1, 200);
	
	Info_ClearChoices	(Info_Mod_Torlof_Lernen);

	Info_AddChoice 		(Info_Mod_Torlof_Lernen, DIALOG_BACK, Info_Mod_Torlof_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Torlof_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5	, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Torlof_Lernen_Staerke_5);
	Info_AddChoice		(Info_Mod_Torlof_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1	, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH)	, Info_Mod_Torlof_Lernen_Staerke_1);
};

INSTANCE Info_Mod_Torlof_Pickpocket (C_INFO)
{
	npc		= Mod_527_SLD_Torlof_NW;
	nr		= 1;
	condition	= Info_Mod_Torlof_Pickpocket_Condition;
	information	= Info_Mod_Torlof_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_150;
};

FUNC INT Info_Mod_Torlof_Pickpocket_Condition()
{
	C_Beklauen	(130, ItMi_Gold, 500);
};

FUNC VOID Info_Mod_Torlof_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Torlof_Pickpocket);

	Info_AddChoice	(Info_Mod_Torlof_Pickpocket, DIALOG_BACK, Info_Mod_Torlof_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Torlof_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Torlof_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Torlof_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Torlof_Pickpocket);
};

FUNC VOID Info_Mod_Torlof_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Torlof_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Torlof_Pickpocket);

		Info_AddChoice	(Info_Mod_Torlof_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Torlof_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Torlof_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Torlof_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Torlof_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Torlof_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Torlof_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Torlof_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Torlof_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Torlof_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Torlof_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Torlof_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Torlof_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Torlof_EXIT (C_INFO)
{
	npc		= Mod_527_SLD_Torlof_NW;
	nr		= 1;
	condition	= Info_Mod_Torlof_EXIT_Condition;
	information	= Info_Mod_Torlof_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Torlof_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Torlof_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};