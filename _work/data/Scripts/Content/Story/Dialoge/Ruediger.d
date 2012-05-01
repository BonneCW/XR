INSTANCE Info_Mod_Ruediger_Hi (C_INFO)
{
	npc		= Mod_7762_OUT_Ruediger_REL;
	nr		= 1;
	condition	= Info_Mod_Ruediger_Hi_Condition;
	information	= Info_Mod_Ruediger_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Warum sitzt du hier allein herum?";
};

FUNC INT Info_Mod_Ruediger_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ruediger_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Ruediger_Hi_15_00"); //Warum sitzt du hier allein herum?
	AI_Output(self, hero, "Info_Mod_Ruediger_Hi_09_01"); //Ich warte darauf, dass jemand vorbeikommt, der an einem guten Spiel interessiert ist.
};

INSTANCE Info_Mod_Ruediger_WasFuerSpiel (C_INFO)
{
	npc		= Mod_7762_OUT_Ruediger_REL;
	nr		= 1;
	condition	= Info_Mod_Ruediger_WasFuerSpiel_Condition;
	information	= Info_Mod_Ruediger_WasFuerSpiel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Und was für ein Spiel ist das?";
};

FUNC INT Info_Mod_Ruediger_WasFuerSpiel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ruediger_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ruediger_WasFuerSpiel_Info()
{
	AI_Output(hero, self, "Info_Mod_Ruediger_WasFuerSpiel_15_00"); //Und was für ein Spiel ist das?
	AI_Output(self, hero, "Info_Mod_Ruediger_WasFuerSpiel_09_01"); //Einen festen Namen hat es nicht. Ich nenne es das Wettlaufspiel. Aber manche, gerade die, die zu viel getrunken haben, nennen es auch gern Schagby.
	AI_Output(self, hero, "Info_Mod_Ruediger_WasFuerSpiel_09_02"); //Jeder der beiden Spieler besitzt auf einem Spielfeld eine Reihe von Monstern.
	AI_Output(self, hero, "Info_Mod_Ruediger_WasFuerSpiel_09_03"); //Die Monster stehen sich gegenüber, und Ziel ist es, einen eigenen Spielstein hinter die gegnerische Reihe zu befördern.
	AI_Output(self, hero, "Info_Mod_Ruediger_WasFuerSpiel_09_04"); //Lust auf eine Partie?
};

INSTANCE Info_Mod_Ruediger_HabKeineFiguren (C_INFO)
{
	npc		= Mod_7762_OUT_Ruediger_REL;
	nr		= 1;
	condition	= Info_Mod_Ruediger_HabKeineFiguren_Condition;
	information	= Info_Mod_Ruediger_HabKeineFiguren_Info;
	permanent	= 0;
	important	= 0;
	description	= "Halt - ich habe doch gar keine Spielsteine!";
};

FUNC INT Info_Mod_Ruediger_HabKeineFiguren_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ruediger_WasFuerSpiel))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ruediger_HabKeineFiguren_Info()
{
	AI_Output(hero, self, "Info_Mod_Ruediger_HabKeineFiguren_15_00"); //Halt - ich habe doch gar keine Spielsteine!
	AI_Output(self, hero, "Info_Mod_Ruediger_HabKeineFiguren_09_01"); //Das lässt sich ändern.

	B_ShowGivenThings	("Anfängerset erhalten");

	AI_Output(self, hero, "Info_Mod_Ruediger_HabKeineFiguren_09_02"); //Das ist die Anfängerkonstellation, fünf herkömmliche Spielsteine.
	AI_Output(self, hero, "Info_Mod_Ruediger_HabKeineFiguren_09_03"); //Insgesamt gibt es zehn Figuren, aus denen der Spieler für jedes Spiel neu fünf Figuren auswählen darf.
	AI_Output(self, hero, "Info_Mod_Ruediger_HabKeineFiguren_09_04"); //Allerdings habe nicht mal ich selbst alle unterschiedlichen Spielsteine.
	AI_Output(self, hero, "Info_Mod_Ruediger_HabKeineFiguren_09_05"); //Die kannst du nur erhalten, wenn du diejenigen Meister besiegst, die sie selbst erfunden haben.
	AI_Output(self, hero, "Info_Mod_Ruediger_HabKeineFiguren_09_06"); //Mit den ersten fünf Figuren bist du jedoch schon gut bedient.

	Log_CreateTopic	(TOPIC_MOD_SCHAGBY, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_SCHAGBY, "Bei Schagby handelt es sich um ein Brettspiel, bei dem es um eine taktische Platzierung von Monsterfiguren geht. Ich habe fünf Figuren erhalten, insgesamt gibt es aber zehn, die ich bei den Meistern des Spiels gewinnen kann.");

	PlayerHas_Troll = 1;
	PlayerHas_Schaf = 1;
	PlayerHas_Bloodfly = 1;
	PlayerHas_Snapper = 1;
	PlayerHas_Meatbug = 1;
};

INSTANCE Info_Mod_Ruediger_Regeln (C_INFO)
{
	npc		= Mod_7762_OUT_Ruediger_REL;
	nr		= 1;
	condition	= Info_Mod_Ruediger_Regeln_Condition;
	information	= Info_Mod_Ruediger_Regeln_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie lauten denn die Regeln des Spiels?";
};

FUNC INT Info_Mod_Ruediger_Regeln_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ruediger_HabKeineFiguren))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ruediger_Regeln_Info()
{
	AI_Output(hero, self, "Info_Mod_Ruediger_Regeln_15_00"); //Wie lauten denn die Regeln des Spiels?
	AI_Output(self, hero, "Info_Mod_Ruediger_Regeln_09_01"); //Die Positionierung der Figuren verläuft abwechselnd.
	AI_Output(self, hero, "Info_Mod_Ruediger_Regeln_09_02"); //Der zufällig bestimmte erste Spieler wählt eine Figur und setzt sie irgendwo auf seine Angriffsreihe, danach setzt der andere Spieler seinen ersten Spielstein, und so fort, bis beide Spiele alle ihre Figuren platziert haben.
	AI_Output(self, hero, "Info_Mod_Ruediger_Regeln_09_03"); //Dann beginnt das eigentliche Spiel. In jedem Zug müssen alle Figuren bewegt werden.
	AI_Output(self, hero, "Info_Mod_Ruediger_Regeln_09_04"); //Jeder Spielstein hat unterschiedliche Fähigkeiten; die zeige ich dir während des Spiels.
	AI_Output(self, hero, "Info_Mod_Ruediger_Regeln_09_05"); //Hat ein Spieler alle Figuren bewegt, ist sein Gegner dran.
	AI_Output(self, hero, "Info_Mod_Ruediger_Regeln_09_06"); //Stößt während des Spiels eine Figur auf ihrem Zielfeld auf eine andere, gewinnt der angreifende Stein, und der unterliegende wird aus dem Spiel entfernt.
	AI_Output(self, hero, "Info_Mod_Ruediger_Regeln_09_07"); //Der Spieler, der es zuerst schafft, eins seiner Monster auf die dunkel gefärbte Reihe hinter der Angriffslinie des Gegners zu rücken, gewinnt.

	B_LogEntry	(TOPIC_MOD_SCHAGBY, "Spielverlauf: Die Positionierung der Figuren verläuft abwechselnd.                             Der zufällig bestimmte erste Spieler wählt eine Figur und setzt sie irgendwo auf seine Angriffsreihe, danach setzt der andere Spieler seinen ersten Spielstein, und so fort, bis beide Spiele alle ihre Figuren platziert haben.                      Dann beginnt das eigentliche Spiel. In jedem Zug müssen alle Figuren bewegt werden. Jeder Spielstein hat unterschiedliche Fähigkeiten.                       Hat ein Spieler alle Figuren bewegt, ist sein Gegner dran. Stößt während des Spiels eine Figur auf ihrem Zielfeld auf eine andere, gewinnt der angreifende Stein, und der unterliegende wird aus dem Spiel entfernt.                       Der Spieler, der es zuerst schafft, eins seiner Monster auf die dunkel gefärbte Reihe hinter der Angriffslinie des Gegners zu rücken, gewinnt.");
};

INSTANCE Info_Mod_Ruediger_Preis (C_INFO)
{
	npc		= Mod_7762_OUT_Ruediger_REL;
	nr		= 1;
	condition	= Info_Mod_Ruediger_Preis_Condition;
	information	= Info_Mod_Ruediger_Preis_Info;
	permanent	= 0;
	important	= 0;
	description	= "Um welchen Preis wird gespielt?";
};

FUNC INT Info_Mod_Ruediger_Preis_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ruediger_HabKeineFiguren))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ruediger_Preis_Info()
{
	AI_Output(hero, self, "Info_Mod_Ruediger_Preis_15_00"); //Um welchen Preis wird gespielt?
	AI_Output(self, hero, "Info_Mod_Ruediger_Preis_09_01"); //Der Preis ist verhandelbar. Da du ein Neuling bist, sollten wir nicht um allzu viel Gold spielen.
	AI_Output(self, hero, "Info_Mod_Ruediger_Preis_09_02"); //Wenn du es schaffst, ein Mal gegen mich zu gewinnen, würde ich dir allerdings die Figur geben, die meine eigene Kreation ist.
};

INSTANCE Info_Mod_Ruediger_Meister (C_INFO)
{
	npc		= Mod_7762_OUT_Ruediger_REL;
	nr		= 1;
	condition	= Info_Mod_Ruediger_Meister_Condition;
	information	= Info_Mod_Ruediger_Meister_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wo finde ich die Meister?";
};

FUNC INT Info_Mod_Ruediger_Meister_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ruediger_HabKeineFiguren))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ruediger_Meister_Info()
{
	AI_Output(hero, self, "Info_Mod_Ruediger_Meister_15_00"); //Wo finde ich die Meister?
	AI_Output(self, hero, "Info_Mod_Ruediger_Meister_09_01"); //Einer sitzt genau vor dir. Ich habe den Steinwächter entworfen. Zugegeben, wirklich stolz kann ich nicht auf ihn sein.
	AI_Output(self, hero, "Info_Mod_Ruediger_Meister_09_02"); //Wo sich die anderen Meister aufhalten, kann ich dir nicht genau sagen. Allerdings ist die Chance, sie in Gasthäusern zu finden, am größten.
	AI_Output(self, hero, "Info_Mod_Ruediger_Meister_09_03"); //So viel, wie du rumkommst, wirst du schon noch auf den einen oder anderen stoßen.
};

FUNC VOID B_MG_Start_Ruediger()
{
	MG_CurrentOpp = MG_GEGNER_RUEDIGER;

	FF_Apply(B_MG_GameLoop);
};

INSTANCE Info_Mod_Ruediger_Spielstart01 (C_INFO)
{
	npc		= Mod_7762_OUT_Ruediger_REL;
	nr		= 1;
	condition	= Info_Mod_Ruediger_Spielstart01_Condition;
	information	= Info_Mod_Ruediger_Spielstart01_Info;
	permanent	= 1;
	important	= 0;
	description	= "Lass uns eine Runde spielen.";
};

FUNC INT Info_Mod_Ruediger_Spielstart01_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Ruediger_Regeln))
	&& (Npc_KnowsInfo(hero, Info_Mod_Ruediger_Preis))
	&& (MG_Ruediger_Runde == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ruediger_Spielstart01_Info()
{
	AI_Output(hero, self, "Info_Mod_Ruediger_Spielstart01_15_00"); //Lass uns eine Runde spielen.
	AI_Output(self, hero, "Info_Mod_Ruediger_Spielstart01_09_01"); //Gern. Der Einsatz beträgt zehn Goldmünzen. Der Sieger erhält alles.

	Info_ClearChoices	(Info_Mod_Ruediger_Spielstart01);

	Info_AddChoice	(Info_Mod_Ruediger_Spielstart01, "Ich bin gerade etwas klamm ...", Info_Mod_Ruediger_Spielstart01_B);
	Info_AddChoice	(Info_Mod_Ruediger_Spielstart01, "Ich riskier's.", Info_Mod_Ruediger_Spielstart01_A);
};

FUNC VOID Info_Mod_Ruediger_Spielstart01_B()
{
	AI_Output(hero, self, "Info_Mod_Ruediger_Spielstart01_B_15_00"); //Ich bin gerade etwas klamm ...
	AI_Output(self, hero, "Info_Mod_Ruediger_Spielstart01_B_09_01"); //Kein Problem, ich sitze auch noch länger hier.

	Info_ClearChoices	(Info_Mod_Ruediger_Spielstart01);
};

FUNC VOID Info_Mod_Ruediger_Spielstart01_A()
{
	AI_Output(hero, self, "Info_Mod_Ruediger_Spielstart01_A_15_00"); //Ich riskier's.
	AI_Output(self, hero, "Info_Mod_Ruediger_Spielstart01_A_09_01"); //Möge der mit der besseren Taktik gewinnen!

	Info_ClearChoices	(Info_Mod_Ruediger_Spielstart01);

	AI_StopProcessInfos	(self);

	AI_Function (self, B_MG_Start_Ruediger);
};

INSTANCE Info_Mod_Ruediger_Spielende01 (C_INFO)
{
	npc		= Mod_7762_OUT_Ruediger_REL;
	nr		= 1;
	condition	= Info_Mod_Ruediger_Spielende01_Condition;
	information	= Info_Mod_Ruediger_Spielende01_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Ruediger_Spielende01_Condition()
{
	if (MG_SiegState > 0)
	&& (MG_CurrentOpp == MG_GEGNER_RUEDIGER)
	&& (MG_Ruediger_Runde == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ruediger_Spielende01_Info()
{
	if (MG_SiegState == 2)
	{
		AI_Output(self, hero, "Info_Mod_Ruediger_Spielende01_09_00"); //Knappe Niederlage. Aber mit ein bisschen Übung kann das noch etwas werden.

		B_GiveInvItems	(hero, self, ItMi_Gold, 10);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Ruediger_Spielende01_09_01"); //Verdammt! Ich bin auch so blöd!

		B_GiveInvItems	(self, hero, ItMi_Gold, 10);

		AI_Output(self, hero, "Info_Mod_Ruediger_Spielende01_09_02"); //Es war zwar größtenteils Glück, aber ich muss mein Versprechen einhalten und dir nun einen Steinwächter-Spielstein abgeben.

		B_ShowGivenThings	("Steinwächter-Figur erhalten");

		PlayerHas_Stoneguardian = 1;

		AI_Output(self, hero, "Info_Mod_Ruediger_Spielende01_09_03"); //Du scheinst mir ein ebenbürtiger Gegner zu sein.
		AI_Output(self, hero, "Info_Mod_Ruediger_Spielende01_09_04"); //Hast du Lust auf noch eine Runde mit verdoppeltem Einsatz?

		B_GivePlayerXP	(100);

		MG_Ruediger_Runde = 1;
	};

	MG_SiegState = 0;
	MG_CurrentOpp = 0;
};

INSTANCE Info_Mod_Ruediger_Spielstart02 (C_INFO)
{
	npc		= Mod_7762_OUT_Ruediger_REL;
	nr		= 1;
	condition	= Info_Mod_Ruediger_Spielstart02_Condition;
	information	= Info_Mod_Ruediger_Spielstart02_Info;
	permanent	= 1;
	important	= 0;
	description	= "Lass uns eine weitere Partie mit verdoppeltem Einsatz spielen.";
};

FUNC INT Info_Mod_Ruediger_Spielstart02_Condition()
{
	if (MG_Ruediger_Runde >= 1)
	&& (MG_Ruediger_Runde < 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ruediger_Spielstart02_Info()
{
	AI_Output(hero, self, "Info_Mod_Ruediger_Spielstart02_15_00"); //Lass uns eine weitere Partie mit verdoppeltem Einsatz spielen.
	AI_Output(self, hero, "DEFAULT"); //

	Info_ClearChoices	(Info_Mod_Ruediger_Spielstart02);

	AI_StopProcessInfos	(self);

	AI_Function (self, B_MG_Start_Ruediger);
};

INSTANCE Info_Mod_Ruediger_Spielende02 (C_INFO)
{
	npc		= Mod_7762_OUT_Ruediger_REL;
	nr		= 1;
	condition	= Info_Mod_Ruediger_Spielende02_Condition;
	information	= Info_Mod_Ruediger_Spielende02_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Ruediger_Spielende02_Condition()
{
	if (MG_SiegState > 0)
	&& (MG_CurrentOpp == MG_GEGNER_RUEDIGER)
	&& (MG_Ruediger_Runde >= 1)
	&& (MG_Ruediger_Runde < 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ruediger_Spielende02_Info()
{
	if (MG_SiegState == 2)
	{
		AI_Output(self, hero, "Info_Mod_Ruediger_Spielende02_09_00"); //Wusste ich's doch, dass dein erster Sieg unverdient war!

		if (MG_Ruediger_Runde == 1)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 20);
		}
		else if (MG_Ruediger_Runde == 2)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 40);
		}
		else if (MG_Ruediger_Runde == 3)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 80);
		}
		else if (MG_Ruediger_Runde == 4)
		{
			B_GiveInvItems	(hero, self, ItMi_Gold, 160);
		};
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Ruediger_Spielende02_09_01"); //Das gibt es doch nicht! Schon wieder bin ich überrumpelt!

		if (MG_Ruediger_Runde == 1)
		{
			B_GiveInvItems	(self, hero, ItMi_Gold, 20);
		}
		else if (MG_Ruediger_Runde == 2)
		{
			B_GiveInvItems	(self, hero, ItMi_Gold, 40);
		}
		else if (MG_Ruediger_Runde == 3)
		{
			B_GiveInvItems	(self, hero, ItMi_Gold, 80);
		}
		else if (MG_Ruediger_Runde == 4)
		{
			B_GiveInvItems	(self, hero, ItMi_Gold, 160);
		};

		if (MG_Ruediger_Runde < 4)
		{
			AI_Output(self, hero, "Info_Mod_Ruediger_Spielende02_09_02"); //Du lernst wirklich schnell. Aber es wäre doch gelacht, wenn ich da nicht mithalten könnte.
		}
		else
		{
			AI_Output(self, hero, "Info_Mod_Ruediger_Spielende02_09_03"); //Schluss, Schluss! Jetzt reicht es aber wirklich!
			AI_Output(self, hero, "Info_Mod_Ruediger_Spielende02_09_04"); //Das macht doch keinen Spaß mehr. Ab jetzt spiele ich nicht mehr um Gold mir dir.
		};

		B_GivePlayerXP	(50);

		MG_Ruediger_Runde += 1;
	};

	MG_SiegState = 0;
	MG_CurrentOpp = 0;
};

INSTANCE Info_Mod_Ruediger_Spielstart03 (C_INFO)
{
	npc		= Mod_7762_OUT_Ruediger_REL;
	nr		= 1;
	condition	= Info_Mod_Ruediger_Spielstart03_Condition;
	information	= Info_Mod_Ruediger_Spielstart03_Info;
	permanent	= 1;
	important	= 0;
	description	= "Lass uns eine weitere Partie spielen.";
};

FUNC INT Info_Mod_Ruediger_Spielstart03_Condition()
{
	if (MG_Ruediger_Runde >= 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ruediger_Spielstart03_Info()
{
	AI_Output(hero, self, "Info_Mod_Ruediger_Spielstart03_15_00"); //Lass uns eine weitere Partie spielen.
	AI_Output(self, hero, "DEFAULT"); //

	Info_ClearChoices	(Info_Mod_Ruediger_Spielstart03);

	AI_StopProcessInfos	(self);

	AI_Function (self, B_MG_Start_Ruediger);
};

INSTANCE Info_Mod_Ruediger_Spielende03 (C_INFO)
{
	npc		= Mod_7762_OUT_Ruediger_REL;
	nr		= 1;
	condition	= Info_Mod_Ruediger_Spielende03_Condition;
	information	= Info_Mod_Ruediger_Spielende03_Info;
	permanent	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Ruediger_Spielende03_Condition()
{
	if (MG_SiegState > 0)
	&& (MG_CurrentOpp == MG_GEGNER_RUEDIGER)
	&& (MG_Ruediger_Runde >= 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Ruediger_Spielende03_Info()
{
	if (MG_SiegState == 2)
	{
		AI_Output(self, hero, "Info_Mod_Ruediger_Spielende03_09_00"); //Wusste ich's doch, dass dein erster Sieg unverdient war!
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Ruediger_Spielende03_09_01"); //Das gibt es doch nicht! Schon wieder bin ich überrumpelt!
		AI_Output(self, hero, "Info_Mod_Ruediger_Spielende03_09_02"); //Du lernst wirklich schnell. Aber es wäre doch gelacht, wenn ich da nicht mithalten könnte.

		MG_Ruediger_Runde += 1;
	};

	MG_SiegState = 0;
	MG_CurrentOpp = 0;
};

INSTANCE Info_Mod_Ruediger_Pickpocket (C_INFO)
{
	npc		= Mod_7762_OUT_Ruediger_REL;
	nr		= 1;
	condition	= Info_Mod_Ruediger_Pickpocket_Condition;
	information	= Info_Mod_Ruediger_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_80;
};

FUNC INT Info_Mod_Ruediger_Pickpocket_Condition()
{
	C_Beklauen	(77, ItMi_Gold, 1000);
};

FUNC VOID Info_Mod_Ruediger_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Ruediger_Pickpocket);

	Info_AddChoice	(Info_Mod_Ruediger_Pickpocket, DIALOG_BACK, Info_Mod_Ruediger_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Ruediger_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Ruediger_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Ruediger_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Ruediger_Pickpocket);
};

FUNC VOID Info_Mod_Ruediger_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Ruediger_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Ruediger_Pickpocket);

		Info_AddChoice	(Info_Mod_Ruediger_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Ruediger_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Ruediger_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Ruediger_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Ruediger_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Ruediger_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Ruediger_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Ruediger_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Ruediger_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Ruediger_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Ruediger_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Ruediger_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Ruediger_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Ruediger_EXIT (C_INFO)
{
	npc		= Mod_7762_OUT_Ruediger_REL;
	nr		= 1;
	condition	= Info_Mod_Ruediger_EXIT_Condition;
	information	= Info_Mod_Ruediger_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Ruediger_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Ruediger_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};