INSTANCE Info_Mod_Vatras_Hi (C_INFO)
{
	npc		= Mod_524_KDW_Vatras_NW;
	nr		= 1;
	condition	= Info_Mod_Vatras_Hi_Condition;
	information	= Info_Mod_Vatras_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer bist du?";
};

FUNC INT Info_Mod_Vatras_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Vatras_Hi_Info()
{
	B_Say (hero, self, "$WHOAREYOU");
	AI_Output(self, hero, "Info_Mod_Vatras_Hi_05_01"); //Ich bin der Wassermagier Vatras.
};

INSTANCE Info_Mod_Vatras_Daemonisch (C_INFO)
{
	npc		= Mod_524_KDW_Vatras_NW;
	nr		= 1;
	condition	= Info_Mod_Vatras_Daemonisch_Condition;
	information	= Info_Mod_Vatras_Daemonisch_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Vatras_Daemonisch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_RitterBeiCoragon_Daemonisch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Vatras_Daemonisch_Info()
{
	AI_Output(self, hero, "Info_Mod_Vatras_Daemonisch_05_00"); //Was berichtest du? Wir müssen sofort die Sicherheitsmaßnahmen verschärfen ...

	B_LogEntry	(TOPIC_MOD_DAEMONISCH, "So, die Stadt wäre geschafft.");

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Vatras_Irdorath (C_INFO)
{
	npc		= Mod_524_KDW_Vatras_NW;
	nr		= 1;
	condition	= Info_Mod_Vatras_Irdorath_Condition;
	information	= Info_Mod_Vatras_Irdorath_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich gedenke mit dem Schiff eine Insel aufzusuchen, um den Kampf gegen den finsteren Xeres fortzuführen.";
};

FUNC INT Info_Mod_Vatras_Irdorath_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Diego_Irdorath))
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Vatras_Irdorath_Info()
{
	AI_Output(hero, self, "Info_Mod_Vatras_Irdorath_15_00"); //Ich gedenke mit dem Schiff eine Insel aufzusuchen, um den Kampf gegen den finsteren Xeres fortzuführen.
	AI_Output(hero, self, "Info_Mod_Vatras_Irdorath_15_01"); //Jedoch brauche ich fähige Begleiter für diesen Exkurs.
	AI_Output(self, hero, "Info_Mod_Vatras_Irdorath_05_02"); //Und da dachtest du an mich?
	AI_Output(self, hero, "Info_Mod_Vatras_Irdorath_05_03"); //Ich habe miterlebt, welche üblen Formen diese Bedrohung annehmen kann, wie sie fast die Stadt verheert hätte.
	AI_Output(self, hero, "Info_Mod_Vatras_Irdorath_05_04"); //Wenn mir die Möglichkeit geboten wird, so ist es nicht nur mein Wille dich dorthin zu begleiten, nein, es ist sogar meine Pflicht zur Errettung von ganz Khorinis.
};

INSTANCE Info_Mod_Vatras_Irdorath2 (C_INFO)
{
	npc		= Mod_524_KDW_Vatras_NW;
	nr		= 1;
	condition	= Info_Mod_Vatras_Irdorath2_Condition;
	information	= Info_Mod_Vatras_Irdorath2_Info;
	permanent	= 0;
	important	= 0;
	description	= "So ist es mir eine Ehre dich an Bord willkommen heißen zu dürfen.";
};

FUNC INT Info_Mod_Vatras_Irdorath2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Vatras_Irdorath))
	&& (Mod_Irdorath == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Vatras_Irdorath2_Info()
{
	AI_Output(hero, self, "Info_Mod_Vatras_Irdorath2_15_00"); //So ist es mir eine Ehre dich an Bord willkommen heißen zu dürfen.
	AI_Output(self, hero, "Info_Mod_Vatras_Irdorath2_05_01"); //Dann werde ich mich nun zum Hafen begeben und dort auf den Beginn unserer Reise warten.

	B_LogEntry	(TOPIC_MOD_HQ_CREW, "Der Wassermagier Vatras wird mich begleiten.");

	B_GivePlayerXP	(100);

	Mod_VatrasDabei = 1;

	Mod_CrewCount += 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "SCHIFF");
};

INSTANCE Info_Mod_Vatras_Irdorath3 (C_INFO)
{
	npc		= Mod_524_KDW_Vatras_NW;
	nr		= 1;
	condition	= Info_Mod_Vatras_Irdorath3_Condition;
	information	= Info_Mod_Vatras_Irdorath3_Info;
	permanent	= 1;
	important	= 0;
	description	= "Tut mir leid, aber es scheint das wir zu viele sind.";
};

FUNC INT Info_Mod_Vatras_Irdorath3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Vatras_Irdorath2))
	&& (Mod_Irdorath == 0)
	&& (Mod_VatrasDabei == 1)
	&& (Mod_JackDabei == 1)
	&& (Mod_CrewCount > 15)
	&& ((Mod_MiltenDabei > 0)
	|| (Mod_NamibDabei > 0)
	|| (Mod_MyxirDabei > 0))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Vatras_Irdorath3_Info()
{
	AI_Output(hero, self, "Info_Mod_Vatras_Irdorath3_15_00"); //Tut mir leid, aber es scheint das wir zu viele sind. Ich kann dich doch nicht mitnehmen.
	AI_Output(self, hero, "Info_Mod_Vatras_Irdorath3_05_01"); //Schade. Ich gehe dann wieder zurück. Du weißt wo du mich findest, wenn doch noch ein Platz frei werden sollte.

	Mod_VatrasDabei = 0;

	Mod_CrewCount -= 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "START");
};

INSTANCE Info_Mod_Vatras_Irdorath4 (C_INFO)
{
	npc		= Mod_524_KDW_Vatras_NW;
	nr		= 1;
	condition	= Info_Mod_Vatras_Irdorath4_Condition;
	information	= Info_Mod_Vatras_Irdorath4_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich kann dich doch mitnehmen.";
};

FUNC INT Info_Mod_Vatras_Irdorath4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Vatras_Irdorath2))
	&& (Mod_Irdorath == 0)
	&& (Mod_VatrasDabei == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Vatras_Irdorath4_Info()
{
	AI_Output(hero, self, "Info_Mod_Vatras_Irdorath4_15_00"); //Ich kann dich doch mitnehmen. Es hat sich noch ein Platz auf dem Schiff gefunden.
	AI_Output(self, hero, "Info_Mod_Vatras_Irdorath4_05_01"); //Sehr gut, ich bin dann wieder am Hafen.

	Mod_VatrasDabei = 1;

	Mod_CrewCount += 1;

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "SCHIFF");
};

INSTANCE Info_Mod_Vatras_Novize (C_INFO)
{
	npc		= Mod_524_KDW_Vatras_NW;
	nr		= 1;
	condition	= Info_Mod_Vatras_Novize_Condition;
	information	= Info_Mod_Vatras_Novize_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich will Wassermagier werden.";
};

FUNC INT Info_Mod_Vatras_Novize_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Vatras_Hi))
	&& (Mod_Gilde == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Vatras_Novize_Info()
{
	AI_Output(hero, self, "Info_Mod_Vatras_Novize_15_00"); //Ich will Wassermagier werden.
	AI_Output(self, hero, "Info_Mod_Vatras_Novize_05_01"); //Bevor du einer von uns werden kannst musst du uns eine Zeit lang geholfen haben.
	AI_Output(self, hero, "Info_Mod_Vatras_Novize_05_02"); //Wenn du eine große Aufgabe für uns erfüllst, werde ich dich aufnehmen. Dort wirst du Aufgaben für mich und die anderen Wassermagier erledigen.
	AI_Output(self, hero, "Info_Mod_Vatras_Novize_05_03"); //Wenn du uns dann einige Zeit gedient hast werden wir dich in den Kreis des Wassers aufnehmen.

	B_LogEntry	(TOPIC_MOD_WASSERMAGIER, "Um Wassermagier zu werden muss ich den Wassermagiern eine Zeit lang dienen. Doch bevor ich aufgenommen werde, um den Wassermagiern zu dienen, muss ich eine große Aufgabe erüllen.");
};

INSTANCE Info_Mod_Vatras_Aufgabe (C_INFO)
{
	npc		= Mod_524_KDW_Vatras_NW;
	nr		= 1;
	condition	= Info_Mod_Vatras_Aufgabe_Condition;
	information	= Info_Mod_Vatras_Aufgabe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was ist das für eine Aufgabe?";
};

FUNC INT Info_Mod_Vatras_Aufgabe_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Vatras_Novize))
	&& (Mod_Gilde == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Vatras_Aufgabe_Info()
{
	AI_Output(hero, self, "Info_Mod_Vatras_Aufgabe_15_00"); //Was ist das für eine Aufgabe?
	AI_Output(self, hero, "Info_Mod_Vatras_Aufgabe_05_01"); //In letzter Zeit werden immer mehr Leute vermisst. Finde heraus wo sie sind.

	Log_CreateTopic	(TOPIC_MOD_VERMISSTE, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_VERMISSTE, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_VERMISSTE, "Ich soll für die Wassermagier rausfinden wo sich die Vermissten Leute befinden.");

	Info_ClearChoices	(Info_Mod_Vatras_Aufgabe);

	Info_AddChoice	(Info_Mod_Vatras_Aufgabe, "Wo soll ich mit meiner Suche beginnen?", Info_Mod_Vatras_Aufgabe_Wo);
};

FUNC VOID Info_Mod_Vatras_Aufgabe_Wo()
{
	AI_Output(hero, self, "Info_Mod_Vatras_Aufgabe_Wo_15_00"); //Wo soll ich mit meiner Suche beginnen?
	AI_Output(self, hero, "Info_Mod_Vatras_Aufgabe_Wo_05_01"); //Geh in den Hafen und sprich dort mit einem unserer Mitglieder. Sein Name ist Diego.
	AI_Output(self, hero, "Info_Mod_Vatras_Aufgabe_Wo_05_02"); //Sag ihm, dass ich dich schicke, dann wird er dir alles erzählen was er weiß.

	Info_ClearChoices	(Info_Mod_Vatras_Aufgabe);

	B_LogEntry	(TOPIC_MOD_VERMISSTE, "Ich soll in den Hafen und dort mit Diego sprechen. Er wird mir alles erzählen was sie über die Vermissten wissen.");
};

INSTANCE Info_Mod_Vatras_ErsteInfos (C_INFO)
{
	npc		= Mod_524_KDW_Vatras_NW;
	nr		= 1;
	condition	= Info_Mod_Vatras_ErsteInfos_Condition;
	information	= Info_Mod_Vatras_ErsteInfos_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe erste Informationen über die Vermissten.";
};

FUNC INT Info_Mod_Vatras_ErsteInfos_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Gerbrandt_Da))
	&& (Sklavenliste_OneTime == TRUE)
	&& (Npc_HasItems(hero, Mod_Sklavenliste_DMR) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Vatras_ErsteInfos_Info()
{
	AI_Output(hero, self, "Info_Mod_Vatras_ErsteInfos_15_00"); //Ich habe erste Informationen über die Vermissten.
	AI_Output(self, hero, "Info_Mod_Vatras_ErsteInfos_05_01"); //Berichte.
	AI_Output(hero, self, "Info_Mod_Vatras_ErsteInfos_15_02"); //Diese Liste habe ich in der Nähe von Freds Haus gefunden.
	AI_Output(self, hero, "Info_Mod_Vatras_ErsteInfos_05_03"); //Zeig her.
	AI_Output(hero, self, "Info_Mod_Vatras_ErsteInfos_15_04"); //Hier.

	B_GiveInvItems	(hero, self, Mod_Sklavenliste_DMR, 1);

	B_UseFakeScroll	();

	AI_Output(self, hero, "Info_Mod_Vatras_ErsteInfos_05_05"); //Sehr gut. Es sieht so aus als wäre Elvrich ihr nächstes Opfer.
	AI_Output(self, hero, "Info_Mod_Vatras_ErsteInfos_05_06"); //Sprich mit ihm und beschatte ihn.

	B_GivePlayerXP	(150);

	B_LogEntry	(TOPIC_MOD_VERMISSTE, "Vatras sagt ich solle mit Elvrich reden und ihn dann beschatten.");

	B_Göttergefallen(2, 1);
};

INSTANCE Info_Mod_Vatras_Fertig (C_INFO)
{
	npc		= Mod_524_KDW_Vatras_NW;
	nr		= 1;
	condition	= Info_Mod_Vatras_Fertig_Condition;
	information	= Info_Mod_Vatras_Fertig_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab herausgefunden wer der Entführer ist.";
};

FUNC INT Info_Mod_Vatras_Fertig_Condition()
{
	if (Mod_VermisstenQuest == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Vatras_Fertig_Info()
{
	AI_Output(hero, self, "Info_Mod_Vatras_Fertig_15_00"); //Ich hab herausgefunden wer der Entführer ist.
	AI_Output(self, hero, "Info_Mod_Vatras_Fertig_05_01"); //Wer ist es?
	AI_Output(hero, self, "Info_Mod_Vatras_Fertig_15_02"); //Ein Dämonenritter hat Elvrich entführt. Die Vermissten werden also bei den Dämonenrittern sein.
	AI_Output(self, hero, "Info_Mod_Vatras_Fertig_05_03"); //Wirklich? Was gibt dir diese Gewissheit?
	AI_Output(hero, self, "Info_Mod_Vatras_Fertig_15_04"); //Ich sah mit eigenen Augen, wie Elvrich in der Nacht von einem Mann entführt wurde, der eine ihrer Rüstungen trug.
	AI_Output(self, hero, "Info_Mod_Vatras_Fertig_05_05"); //Und wie ging diese Entführung von statten?
	AI_Output(hero, self, "Info_Mod_Vatras_Fertig_15_06"); //Nun ... der Dämonenkrieger ist aus dem nichts aufgetaucht und auf gleiche Weise mit Elvrich verschwunden.
	AI_Output(self, hero, "Info_Mod_Vatras_Fertig_05_07"); //Hmm, nun, das klingt alles noch sehr verworren.
	AI_Output(self, hero, "Info_Mod_Vatras_Fertig_05_08"); //Und vieles bleibt in der Schwärze der Nacht verborgen.
	AI_Output(self, hero, "Info_Mod_Vatras_Fertig_05_09"); //Gewissheit werden wir erst haben, wenn du die Entführten auch gefunden hast.
	AI_Output(self, hero, "Info_Mod_Vatras_Fertig_05_10"); //Dir wurde die Richtung gewiesen. Mach dich auf den Weg und Versuch bei den Dämonenkriegern mehr herauszufinden.
	AI_Output(self, hero, "Info_Mod_Vatras_Fertig_05_11"); //Du findest ihr Lager irgendwo im Minental in den Bergen.
	AI_Output(self, hero, "Info_Mod_Vatras_Fertig_05_12"); //Ich hörte auch, sie sollen eine Mine besitzen. Vielleicht ist das auch ein wichtiger Anhaltspunkt ...

	B_LogEntry	(TOPIC_MOD_VERMISSTE, "Vatras gab mir den Auftrag, bei den Dämonenkriegern Nachforschungen über die Vermissten anzustellen. Er nannte dabei eine Mine als mögliche Anlaufstelle.");

	B_Göttergefallen(2, 1);

	B_GivePlayerXP	(200);
};

INSTANCE Info_Mod_Vatras_RealInfos (C_INFO)
{
	npc		= Mod_524_KDW_Vatras_NW;
	nr		= 1;
	condition	= Info_Mod_Vatras_RealInfos_Condition;
	information	= Info_Mod_Vatras_RealInfos_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe nun die Gewissheit, dass die Dämonenkrieger hinter allem stecken.";
};

FUNC INT Info_Mod_Vatras_RealInfos_Condition()
{
	if (Mod_WM_KurganAlarm >= 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Vatras_RealInfos_Info()
{
	AI_Output(hero, self, "Info_Mod_Vatras_RealInfos_15_00"); //Ich habe nun die Gewissheit, dass die Dämonenkrieger hinter allem stecken.

	if (Mod_WM_ElvrichImSumpf == 4)
	{
		AI_Output(hero, self, "Info_Mod_Vatras_RealInfos_15_01"); //Der entführte Elvrich selbst, berichtet mir über sein Schicksal und das der anderen.
		AI_Output(self, hero, "Info_Mod_Vatras_RealInfos_05_02"); //Was, wo befindet er sich jetzt. Noch immer in Gefangenschaft?
		AI_Output(hero, self, "Info_Mod_Vatras_RealInfos_15_03"); //Nein, ihm gelang die Flucht aus der Mine, die den anderen zum Grab wurde.
		AI_Output(hero, self, "Info_Mod_Vatras_RealInfos_15_04"); //Er sitzt im Minental im Lager der Sumpfgemeinschaft und genießt sein Leben in vollen Zügen.
		AI_Output(hero, self, "Info_Mod_Vatras_RealInfos_15_05"); //Von ihm erfuhr ich auch, dass eine Frau die Männer an die Dämonenkrieger verriet, welche der Minenchef dann mit Teleportmagie entführte.
		AI_Output(self, hero, "Info_Mod_Vatras_RealInfos_05_06"); //Hmm ... was du mir berichtest ist von nicht unerheblicher Bedeutung für die Sicherheit Stadt.
		AI_Output(self, hero, "Info_Mod_Vatras_RealInfos_05_07"); //Wir werden schnellstmöglich die nötigen Schritte einleiten, um diesem üblen Treiben Einhalt zu gebieten ...

		B_GivePlayerXP	(650);
	}
	else
	{
		AI_Output(hero, self, "Info_Mod_Vatras_RealInfos_15_08"); //In einem verlassenen Schacht ihrer Mine fand ich die Leichen von drei der Entführten.
		AI_Output(self, hero, "Info_Mod_Vatras_RealInfos_05_09"); //Bei Adanos (hält kurz inne) ... ich hatte gehofft, sie weilten noch unter den Lebenden ...
		AI_Output(self, hero, "Info_Mod_Vatras_RealInfos_05_10"); //Nun, zumindest herrscht jetzt Klarheit über ihr Schicksal und wir können alles Notwenige unternehmen, um diesem Treiben innerhalb der Stadtmauern ein Ende zu setzen ...

		B_GivePlayerXP	(400);
	};

	AI_Output(self, hero, "Info_Mod_Vatras_RealInfos_05_11"); //Wie dem auch sei, du hast deine Sache mehr als gut gemacht und mir bewiesen, dass du unserer Gemeinschaft ein würdiger Mitbruder sein wirst.
	AI_Output(self, hero, "Info_Mod_Vatras_RealInfos_05_12"); //Deiner Aufnahme in unsere Reihen steht nun nichts mehr im Wege.

	if (Mod_Gilde == 0)
	{
		AI_Output(self, hero, "Info_Mod_Vatras_RealInfos_05_13"); //Du kannst dich uns nun anschließen.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Vatras_RealInfos_05_14"); //Leider hast du dich bereits für einen anderen Weg entschieden.
	};

	Npc_RemoveInvItems	(hero, ItWr_DraalVermisstennotiz, 1);

	B_LogEntry	(TOPIC_MOD_VERMISSTE, "Ich habe Vatras alles ezählt. Ich kann mich ihnen nun anschließen.");

	B_SetTopicStatus	(TOPIC_MOD_VERMISSTE, LOG_SUCCESS);

	B_Göttergefallen(2, 3);
};

INSTANCE Info_Mod_Vatras_Aufnahme (C_INFO)
{
	npc		= Mod_524_KDW_Vatras_NW;
	nr		= 1;
	condition	= Info_Mod_vatras_Aufnahme_Condition;
	information	= Info_Mod_vatras_Aufnahme_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich bin bereit mich euch anzuschließen.";
};

FUNC INT Info_Mod_vatras_Aufnahme_Condition()
{
	if (Mod_Gilde == 0)
	&& ((Npc_KnowsInfo(hero, Info_Mod_vatras_RealInfos))
	|| (Npc_KnowsInfo(hero, Info_Mod_Vatras_Kristall)))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_vatras_Aufnahme_Info()
{
	AI_Output(hero, self, "Info_Mod_vatras_Aufnahme_15_00"); //Ich bin bereit mich euch anzuschließen.
	
	if (hero.level >= 5)
	{
		AI_Output(self, hero, "Info_Mod_vatras_Aufnahme_05_01"); //Du bist bereit dich uns anzuschließen.
		AI_Output(self, hero, "Info_Mod_vatras_Aufnahme_05_02"); //Doch wenn du einmal eine unserer Rüstungen trägst, dann gibt es kein zurück mehr.
		
		if (Mod_HatPlayerNeutraleKlamotten())
		{
			if (Mod_Gottstatus > 8)
			|| (Mod_Gottstatus <= 4)
			{
				AI_Output(self, hero, "Info_Mod_Vatras_Aufnahme_05_05"); //Du solltest allerdings vorher noch ein paar Taten zu Gunsten von Adanos vollbringen.
			}
			else
			{
				Info_ClearChoices	(Info_Mod_Vatras_Aufnahme);

				Info_AddChoice	(Info_Mod_Vatras_Aufnahme, "Ich habs mir anders überlegt.", Info_Mod_Vatras_Aufnahme_Nein);
				Info_AddChoice	(Info_Mod_Vatras_Aufnahme, "Ich will mich euch anschließen.", Info_Mod_Vatras_Aufnahme_Ja);
			};
		}
		else
		{
			AI_Output(self, hero, "Info_Mod_vatras_Aufnahme_05_04"); //Su solltest dir vorher aber noch eine neutrale Rüstung besorgen.
		};
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_vatras_Aufnahme_05_03"); //Du solltest lieber noch etwas Erfahrung sammeln.
	};
};

FUNC VOID Info_Mod_vatras_Aufnahme_Nein()
{
	AI_Output(hero, self, "Info_Mod_vatras_Aufnahme_Nein_15_00"); //Ich hab's mir anders überlegt.
	AI_Output(self, hero, "Info_Mod_vatras_Aufnahme_Nein_05_01"); //Wie du meinst.

	Info_ClearChoices	(Info_Mod_vatras_Aufnahme);
};

FUNC VOID Info_Mod_vatras_Aufnahme_Ja()
{
	AI_Output(hero, self, "Info_Mod_vatras_Aufnahme_Ja_15_00"); //Ich will mich euch anschließen.
	AI_Output(self, hero, "Info_Mod_vatras_Aufnahme_Ja_05_01"); //Gut. Hier ist deine Robe.

	CreateInvItems	(self, ITAR_Wassernovize1, 1);
	B_GiveInvItems	(self, hero, ITAR_Wassernovize1, 1);

	AI_UnequipArmor	(hero);
	AI_EquipArmor	(hero, ItAr_Wassernovize1);

	AI_Output(hero, self, "Info_Mod_vatras_Aufnahme_Ja_15_02"); //Wie steht's mit einer Waffe?
	AI_Output(self, hero, "Info_Mod_vatras_Aufnahme_Ja_05_03"); //Die Novizen haben bei uns einen Kampfstab. Hier ist deiner.

	B_GiveInvItems	(self, hero, ItMw_RangerStaff_Addon, 1);

	AI_Output(self, hero, "Info_Mod_vatras_Aufnahme_Ja_05_04"); //Wenn du eine bessere Waffe brauchst, dann musst du dir eine auf dem Marktplatz kaufen.
	AI_Output(self, hero, "Info_Mod_Vatras_Aufnahme_Ja_05_05"); //Diese Rune sollte dir dazu verhelfen sicher den Gefahren zu trotzen, die auf dem Weg zu meinen Mitbrüdern lauern könnten.

	B_GiveInvItems	(self, hero, ItRu_Icebolt, 1);

	B_LogEntry_More	(TOPIC_MOD_WASSERMAGIER, TOPIC_MOD_GILDENAUFNAHME, "Ich bin jetzt ein Mitglied der Kreises des Wassers.", "Ich bin jetzt ein Mitglied des Kreises des Wassers.");
	B_SetTopicStatus	(TOPIC_MOD_WASSERMAGIER, LOG_SUCCESS);

	B_SetTopicStatus	(TOPIC_MOD_GILDENAUFNAHME, LOG_SUCCESS);

	B_SetTopicStatus	(TOPIC_MOD_FEUERMAGIER, LOG_FAILED);
	B_SetTopicStatus	(TOPIC_MOD_MILIZ, LOG_FAILED);
	B_SetTopicStatus	(TOPIC_MOD_DAEMONENBESCHWOERER, LOG_FAILED);
	B_SetTopicStatus	(TOPIC_MOD_SÖLDNER, LOG_FAILED);

	Mod_Gilde = 9;

	hero.guild = GIL_NOV;
	Npc_SetTrueGuild	(hero, GIL_NOV);

	Info_ClearChoices	(Info_Mod_Vatras_Aufnahme);

	CreateInvItems	(Mod_9001_KDW_Cronos_AW, ItBE_Addon_WNOV_01, 1);

	Snd_Play ("LEVELUP");

	B_GivePlayerXP	(400);

	B_Göttergefallen(2, 5);
};

INSTANCE Info_Mod_Vatras_AkilsHof (C_INFO)
{
	npc		= Mod_524_KDW_Vatras_NW;
	nr		= 1;
	condition	= Info_Mod_Vatras_AkilsHof_Condition;
	information	= Info_Mod_Vatras_AkilsHof_Info;
	permanent	= 0;
	important	= 0;
	description	= "Magier Adanos’, ich habe ein Anliegen welches eurer Heilkunst bedarf.";
};

FUNC INT Info_Mod_Vatras_AkilsHof_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Vatras_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Telbor_Hi))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Telbor_AllDead))
	&& (!Npc_KnowsInfo(hero, Info_Mod_Akil_Heilung))
	&& (Mod_AkilsHofAusgestorben == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Vatras_AkilsHof_Info()
{
	AI_Output(hero, self, "Info_Mod_Vatras_AkilsHof_15_00"); //Magier Adanos’, ich habe ein Anliegen welches eurer Heilkunst bedarf.
	AI_Output(self, hero, "Info_Mod_Vatras_AkilsHof_05_01"); //So berichte mir, was dich zu mir führt.
	AI_Output(hero, self, "Info_Mod_Vatras_AkilsHof_15_02"); //Auf Akil’s Hof sind schlimme Dinge vorgefallen, nachdem ein Scherge dunkler Mächte die Nacht in ihrem Haus verbracht hatte.
	AI_Output(hero, self, "Info_Mod_Vatras_AkilsHof_15_03"); //Egill hat in einem Anfall von Tobsucht seinem Bruder schwere Verletzungen zugefügt und die anderen sind innerhalb kürzester Zeit schwer erkrankt.
	AI_Output(self, hero, "Info_Mod_Vatras_AkilsHof_05_04"); //(erschrocken) Was sagst du?! Ein Lakai des Bösen? In diesem Fall werden meine Möglichkeiten kaum ausreichen.
	AI_Output(self, hero, "Info_Mod_Vatras_AkilsHof_05_05"); //Es dürfte sich mehr um eine Form der Besessenheit handeln, als um gewöhnliche Erkrankungen und da versagen meine Künste.
	AI_Output(self, hero, "Info_Mod_Vatras_AkilsHof_05_06"); //Du tätest gut daran dich zum Kloster der Feuermagier zu eilen dort dein Anliegen nochmals vorzutragen.
	AI_Output(self, hero, "Info_Mod_Vatras_AkilsHof_05_07"); //Achja, gegen Ehnim’s Leiden sollte dieser einfache Heiltrank helfen.

	B_GiveInvItems	(self, hero, ItPo_Health_01, 1);

	AI_Output(self, hero, "Info_Mod_Vatras_AkilsHof_05_08"); //Geh jetzt, du weißt, was du zu tun hast.
	
	B_GivePlayerXP	(50);
};

INSTANCE Info_Mod_Vatras_Hexenfluch (C_INFO)
{
	npc		= Mod_524_KDW_Vatras_NW;
	nr		= 1;
	condition	= Info_Mod_Vatras_Hexenfluch_Condition;
	information	= Info_Mod_Vatras_Hexenfluch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe ein Problem und hoffe bei dir Hilfe zu erfahren.";
};

FUNC INT Info_Mod_Vatras_Hexenfluch_Condition()
{
	if (Mod_WM_Verflucht == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Vatras_Hexenfluch_Info()
{
	AI_Output(hero, self, "Info_Mod_Vatras_Hexenfluch_15_00"); //Ich habe ein Problem und hoffe bei dir Hilfe zu erfahren.
	AI_Output(self, hero, "Info_Mod_Vatras_Hexenfluch_05_01"); //Ja, ich spüre durchaus, dass du im Bann eines üblen Zaubers zu sein scheinst. Was ist geschehen?
	AI_Output(hero, self, "Info_Mod_Vatras_Hexenfluch_15_02"); //Eine Frau in Orlans Taverne hat tückische Magie auf mich gewirkt.
	AI_Output(self, hero, "Info_Mod_Vatras_Hexenfluch_05_03"); //Was?! Eine Frau?! Das hört sich für mich ganz nach ... einer Hexe an.

	AI_TurnAway	(self, hero);

	AI_Output(self, hero, "Info_Mod_Vatras_Hexenfluch_05_04"); //(nachdenklich zu sich selbst) Hier auf Khorinis ...

	AI_TurnToNpc	(self, hero);

	AI_Output(self, hero, "Info_Mod_Vatras_Hexenfluch_05_05"); //(wieder zum Helden) Was genau ist vorgefallen?

	Info_ClearChoices	(Info_Mod_Vatras_Hexenfluch);

	if (Mod_AttraktiveFrau == 2)
	{
		Info_AddChoice	(Info_Mod_Vatras_Hexenfluch, "Ähh ... sie sprach mich an und machte mir anzügliche Angebote.", Info_Mod_Vatras_Hexenfluch_C);
	};
	Info_AddChoice	(Info_Mod_Vatras_Hexenfluch, "Sie sprach mich an und ich war ihr plötzlich verfallen.", Info_Mod_Vatras_Hexenfluch_B);
	Info_AddChoice	(Info_Mod_Vatras_Hexenfluch, "Nicht viel. Sie sprach mir nur an und ich war plötzlich in diesem Zustand.", Info_Mod_Vatras_Hexenfluch_A);
};

FUNC VOID Info_Mod_Vatras_Hexenfluch_C()
{
	AI_Output(hero, self, "Info_Mod_Vatras_Hexenfluch_C_15_00"); //Ähh ... sie sprach mich an und machte mir anzügliche Angebote. Es tut mir leid. Ich war töricht mich darauf einzulassen.
	AI_Output(self, hero, "Info_Mod_Vatras_Hexenfluch_C_05_01"); //Was?! Ja, wirklich unwürdig hast du dich gebärdet. (Etwas ruhiger) Aber ich halte dir zu gute, dass du mir die Wahrheit sagst.
	AI_Output(self, hero, "Info_Mod_Vatras_Hexenfluch_C_05_02"); //Ich hoffe, dass du aus deinem Fehler gelernt hast. Begib dich jetzt ins Kloster zu Pyrokar, da ich dir bei diesem Anliegen leider nicht helfen kann.

	B_GivePlayerXP	(100);

	Info_ClearChoices	(Info_Mod_Vatras_Hexenfluch);
};

FUNC VOID Info_Mod_Vatras_Hexenfluch_B()
{
	AI_Output(hero, self, "Info_Mod_Vatras_Hexenfluch_B_15_00"); //Sie sprach mich an und ich war ihr plötzlich verfallen. Ich konnte nichts machen und war ihrem Willen unterworfen.

	if (Mod_AttraktiveFrau == 2)
	{
		AI_Output(self, hero, "Info_Mod_Vatras_Hexenfluch_B_05_01"); //Ja, ist dem so? Es könnte tatsächlich sein, da Hexen zu solchem Werk in der Lage sind. Ich kann aber dennoch nicht erkennen, dass es der Wahrheit entspricht.
		AI_Output(self, hero, "Info_Mod_Vatras_Hexenfluch_B_05_02"); //Wenn du dich schon auf unsittliche Weise mit dämonischen Dirnen einlässt – und das aus freien Stücken - so gestehe es wenigstens.
		AI_Output(self, hero, "Info_Mod_Vatras_Hexenfluch_B_05_03"); //Und während du ins Kloster zu Pyrokar gehst, der dir bei deinem Anliegen helfen kann solltest du gut über dein Verhalten nachdenken.
		AI_Output(self, hero, "Info_Mod_Vatras_Hexenfluch_B_05_04"); //Und jetzt geh mir aus den Augen.
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Vatras_Hexenfluch_B_05_05"); //Hmm, ich kann in deinen Augen erkennen, dass du die Wahrheit sagst.
		AI_Output(self, hero, "Info_Mod_Vatras_Hexenfluch_B_05_06"); //Es entspricht auch tatsächlich dem Wesen der Hexen Einfluss auf ihre Opfer nehmen zu können.
		AI_Output(self, hero, "Info_Mod_Vatras_Hexenfluch_B_05_07"); //Leider bin ich nicht dazu in der Lage dir bei diesem Anliegen zu helfen. Begib dich am besten auf direktem Weg ins Kloster zu Pyrokar.

		B_GivePlayerXP	(150);
	};

	Info_ClearChoices	(Info_Mod_Vatras_Hexenfluch);
};

FUNC VOID Info_Mod_Vatras_Hexenfluch_A()
{
	AI_Output(hero, self, "Info_Mod_Vatras_Hexenfluch_A_15_00"); //Nicht viel. Sie sprach mir nur an und ich war plötzlich in diesem Zustand.
	AI_Output(self, hero, "Info_Mod_Vatras_Hexenfluch_A_05_01"); //(streng) Ich kann nicht erkennen, dass du mir die Wahrheit sagst.
	AI_Output(self, hero, "Info_Mod_Vatras_Hexenfluch_A_05_02"); //Wenn du dich schon auf unsittliche Weise mit dämonischen Dirnen einlässt, so gestehe es wenigstens.

	Info_ClearChoices	(Info_Mod_Vatras_Hexenfluch);

	Info_AddChoice	(Info_Mod_Vatras_Hexenfluch, "Ja, du hast recht, es tut mir Leid.", Info_Mod_Vatras_Hexenfluch_E);
	Info_AddChoice	(Info_Mod_Vatras_Hexenfluch, "Es tut mir Leid. Sie sprach mich an und ich war ihr plötzlich verfallen.", Info_Mod_Vatras_Hexenfluch_D);
};

FUNC VOID Info_Mod_Vatras_Hexenfluch_E()
{
	AI_Output(hero, self, "Info_Mod_Vatras_Hexenfluch_E_15_00"); //Ja, du hast recht, es tut mir Leid.
	AI_Output(self, hero, "Info_Mod_Vatras_Hexenfluch_E_05_01"); //Ich will sehr für dich hoffen, dass du aus deinen Fehlern lernst.
	AI_Output(self, hero, "Info_Mod_Vatras_Hexenfluch_E_05_02"); //Geh jetzt ins Kloster zu Pyrokar. Bei ihm wirst du Hilfe finden.

	Info_ClearChoices	(Info_Mod_Vatras_Hexenfluch);
};

FUNC VOID Info_Mod_Vatras_Hexenfluch_D()
{
	AI_Output(hero, self, "Info_Mod_Vatras_Hexenfluch_D_15_00"); //Es tut mir Leid. Sie sprach mich an und ich war ihr plötzlich verfallen. Ich konnte nichts machen und war ihrem Willen unterworfen.

	if (Mod_AttraktiveFrau == 2)
	{
		AI_Output(self, hero, "Info_Mod_Vatras_Hexenfluch_D_05_01"); //Ja, wirklich? Ich bin tief betrübt wie auch erzürnt, dass du mich erneut so schamlos belügst.
		AI_Output(self, hero, "Info_Mod_Vatras_Hexenfluch_D_05_02"); //Und jetzt geh mir aus den Augen dreckiger Lügner.

		B_GivePlayerXP	(-100);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Vatras_Hexenfluch_D_05_03"); //Hmm, ich spüre zumindest darin Wahrheit in deinen Worten. Nun, du hättest gut daran getan gleich aufrichtig zu sein.
		AI_Output(self, hero, "Info_Mod_Vatras_Hexenfluch_D_05_04"); //Gehe jetzt ins Kloster zu Pyrokar. Er kann dir bei deinem Problem  helfen.
	};

	Info_ClearChoices	(Info_Mod_Vatras_Hexenfluch);
};

INSTANCE Info_Mod_Vatras_NovizenTrank (C_INFO)
{
	npc		= Mod_524_KDW_Vatras_NW;
	nr		= 1;
	condition	= Info_Mod_Vatras_NovizenTrank_Condition;
	information	= Info_Mod_Vatras_NovizenTrank_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich soll eine Medizin für die Feuer Novizen abholen.";
};

FUNC INT Info_Mod_Vatras_NovizenTrank_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Daron_ZugangZumKloster))
	&& (Npc_KnowsInfo(hero, Info_Mod_Vatras_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Vatras_NovizenTrank_Info()
{
	AI_Output(hero, self, "Info_Mod_Vatras_NovizenTrank_15_00"); //Ich soll eine Medizin für die Feuer Novizen abholen.
	AI_Output(self, hero, "Info_Mod_Vatras_NovizenTrank_05_01"); //Eine Medizin für die Feuer Novizen? Welches Leiden gilt es zu kurieren?
	AI_Output(hero, self, "Info_Mod_Vatras_NovizenTrank_15_02"); //Es scheint ein starkes Fieber im Kloster umzugehen, welches die Novizen befallen hat.
	AI_Output(hero, self, "Info_Mod_Vatras_NovizenTrank_15_03"); //Die Magie Innos reicht nicht aus, die Novizen zu heilen, deshalb wird deine Heilkunst benötigt.
	AI_Output(self, hero, "Info_Mod_Vatras_NovizenTrank_05_04"); //Ah, das schwarze Fieber. Nimm diesen Trank, er sollte helfen.

	B_GiveInvItems	(self, hero, VatrasNovizenTrunk, 1);

	B_LogEntry	(TOPIC_MOD_DARONSGEFALLEN, "Vatras hat mir die Medizin gegeben.");
};

INSTANCE Info_Mod_Vatras_TempelDicht (C_INFO)
{
	npc		= Mod_524_KDW_Vatras_NW;
	nr		= 1;
	condition	= Info_Mod_Vatras_TempelDicht_Condition;
	information	= Info_Mod_Vatras_TempelDicht_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich komme mit dringenden Neuigkeiten von deinen Brüdern.";
};

FUNC INT Info_Mod_Vatras_TempelDicht_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Riordian_TempelDicht2))
	&& (Npc_KnowsInfo(hero, Info_Mod_Vatras_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Vatras_TempelDicht_Info()
{
	AI_Output(hero, self, "Info_Mod_Vatras_TempelDicht_15_00"); //Ich komme mit dringenden Neuigkeiten von deinen Brüdern.
	AI_Output(self, hero, "Info_Mod_Vatras_TempelDicht_05_01"); //Sprich, mein Sohn.
	AI_Output(hero, self, "Info_Mod_Vatras_TempelDicht_15_02"); //Die Wassermagier wurden angegriffen und gefangen genommen in ihrem eigenen Tempel.
	AI_Output(hero, self, "Info_Mod_Vatras_TempelDicht_15_03"); //Der Zugang wurde durch eine Barriere versiegelt, die nur durch einen magischen Schlüssel geöffnet werden kann.
	AI_Output(hero, self, "Info_Mod_Vatras_TempelDicht_15_04"); //Riordian meinte, dass du wüsstest wo sich dieser Schlüssel befindet.
	AI_Output(self, hero, "Info_Mod_Vatras_TempelDicht_05_05"); //Das sind wahrlich schreckliche Neuigkeiten. Ich würde dir den Schlüssel gerne geben, doch leider wurde er vor einiger Zeit geraubt.
	AI_Output(hero, self, "Info_Mod_Vatras_TempelDicht_15_06"); //Was? Wer hat den Schlüssel gestohlen?
	AI_Output(self, hero, "Info_Mod_Vatras_TempelDicht_05_07"); //Es war ein Mitglied des ominösen Blutkultes. Der Blutkult ist eine Gruppe abscheulicher Wesen, die eine Störung des Gleichgewichtes herbeisinnen.
	AI_Output(hero, self, "Info_Mod_Vatras_TempelDicht_15_08"); //Wohin kann der Dieb geflohens sein?
	AI_Output(self, hero, "Info_Mod_Vatras_TempelDicht_05_09"); //Es gibt eine Höhle nahe Orlans Taverne. Wenn ich mich recht entsinne ist dort eines der Verstecke des Blutkultes. Versuche dort dein Glück.
	AI_Output(hero, self, "Info_Mod_Vatras_TempelDicht_15_10"); //Danke für den Hinweis.
	AI_Output(self, hero, "Info_Mod_Vatras_TempelDicht_05_11"); //Eins noch! Der Blutkult hat unbekannte Fähigkeiten und Kräfte, die sogar uns beängstigen. Du solltest vorsichtig sein.
	AI_Output(hero, self, "Info_Mod_Vatras_TempelDicht_15_12"); //Das werde ich. Ich werde nun aufbrechen.
	AI_Output(self, hero, "Info_Mod_Vatras_TempelDicht_05_13"); //Mögest du heil zurückkehren!

	B_LogEntry	(TOPIC_MOD_BEL_TEMPEL, "Der magische Schlüssel wurde vor einiger Zeit von einem Anhänger des Blutkultes gestohlen. Dieser soll sich in der Nähe von Orlans Taverne in einer Höhle befinden. Vatras warnte mich außerdem, dass der Blutkult sehr mächtig ist. Ich sollte auf der Hut sein.");

	AI_StopProcessInfos	(self);

	Wld_InsertNpc	(Mod_4092_BlutkultKrieger_NW,	"TAVERNE");
	Wld_InsertNpc	(Mod_4093_BlutkultKrieger_NW,	"TAVERNE");
	Wld_InsertNpc	(Mod_4094_BlutkultKrieger_NW,	"TAVERNE");
	Wld_InsertNpc	(Mod_4095_BlutkultKrieger_NW,	"TAVERNE");
	Wld_InsertNpc	(Mod_4096_BlutkultKrieger_NW,	"TAVERNE");
	Wld_InsertNpc	(Mod_4097_BlutkultMagier_NW,	"TAVERNE");
};

INSTANCE Info_Mod_Vatras_TempelDicht2 (C_INFO)
{
	npc		= Mod_524_KDW_Vatras_NW;
	nr		= 1;
	condition	= Info_Mod_Vatras_TempelDicht2_Condition;
	information	= Info_Mod_Vatras_TempelDicht2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe den Schlüssel gefunden!";
};

FUNC INT Info_Mod_Vatras_TempelDicht2_Condition()
{
	if (!Npc_KnowsInfo(hero, Info_Mod_Riordian_TempelDicht3))
	&& (Npc_KnowsInfo(hero, Info_Mod_Vatras_TempelDicht))
	&& (Npc_HasItems(hero, ItKe_MagicTempelKey) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Vatras_TempelDicht2_Info()
{
	AI_Output(hero, self, "Info_Mod_Vatras_TempelDicht2_15_00"); //Ich habe den Schlüssel gefunden!
	AI_Output(self, hero, "Info_Mod_Vatras_TempelDicht2_05_01"); //Sehr gut, mein Sohn. Du bist ein außergewöhnlicher Krieger.
	AI_Output(hero, self, "Info_Mod_Vatras_TempelDicht2_15_02"); //Ich werde nun gleich zu Riordian aufbrechen um die Anderen zu retten.
	AI_Output(self, hero, "Info_Mod_Vatras_TempelDicht2_05_03"); //Tu dies, aber beeile dich. Die Zeit ist nicht unser Verbündeter.
	
	AI_StopProcessInfos	(self);

	B_GivePlayerXP	(500);
};

INSTANCE Info_Mod_Vatras_Kristall (C_INFO)
{
	npc		= Mod_524_KDW_Vatras_NW;
	nr		= 1;
	condition	= Info_Mod_Vatras_Kristall_Condition;
	information	= Info_Mod_Vatras_Kristall_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich bringe dir den Kristall der Paladine.";
};

FUNC INT Info_Mod_Vatras_Kristall_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Lothar_Bier))
	&& (Npc_HasItems(hero, Mod_PaladinKristall) >= 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Vatras_Kristall_Info()
{
	AI_Output(hero, self, "Info_Mod_Vatras_Kristall_15_00"); //Ich bringe dir den Kristall der Paladine.
	
	B_GiveInvItems	(hero, self, Mod_PaladinKristall, 1);

	AI_Output(self, hero, "Info_Mod_Vatras_Kristall_05_01"); //Ein wertvoller Gegenstand. Ich werde dafür sorgen, dass er seinen rechtmäßigen Platz einnimmt.
	AI_Output(self, hero, "Info_Mod_Vatras_Kristall_05_02"); //Diese Tat ermöglicht es dir, dich uns anzuschließen.

	B_GivePlayerXP	(200);

	B_LogEntry_More	(TOPIC_MOD_WASSERMAGIER, TOPIC_MOD_SÖLDNER, "Vatras sagt, dass ich mich dem Kreis des Wassers anschließen kann.", "Ich hab den Kristall Vatras gegeben. Torlof wird das sicherlich nicht sehr gefallen.");

	B_SetTopicStatus	(TOPIC_MOD_TORLOFSPIONAGE, LOG_FAILED);

	B_Göttergefallen(2, 3);
};

INSTANCE Info_Mod_Vatras_Sweetwater (C_INFO)
{
	npc		= Mod_524_KDW_Vatras_NW;
	nr		= 1;
	condition	= Info_Mod_Vatras_Sweetwater_Condition;
	information	= Info_Mod_Vatras_Sweetwater_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du willst mich sprechen?";
};

FUNC INT Info_Mod_Vatras_Sweetwater_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Hock_JG_Sweetwater))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Vatras_Sweetwater_Info()
{
	AI_Output(hero, self, "Info_Mod_Vatras_Sweetwater_15_00"); //Du willst mich sprechen?
	AI_Output(self, hero, "Info_Mod_Vatras_Sweetwater_05_01"); //Ganz recht. Ich habe Kunde erhalten, dass Saturas deine Hilfe braucht.
	AI_Output(self, hero, "Info_Mod_Vatras_Sweetwater_05_02"); //Ist schon etwas her. Du solltest dich beeilen.
	AI_Output(hero, self, "Info_Mod_Vatras_Sweetwater_15_03"); //Bin schon unterwegs ...

	B_LogEntry	(TOPIC_MOD_JG_SWEETWATER, "Vatras schickt mich zu Saturas. Es eilt wieder mal ...");
};

INSTANCE Info_Mod_Vatras_Zeremoniendolch (C_INFO)
{
	npc		= Mod_524_KDW_Vatras_NW;
	nr		= 1;
	condition	= Info_Mod_Vatras_Zeremoniendolch_Condition;
	information	= Info_Mod_Vatras_Zeremoniendolch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Adanos zum Gruß. Man sagt, du weißt etwas über einen Zeremoniendolch.";
};

FUNC INT Info_Mod_Vatras_Zeremoniendolch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Amir_Zeremoniendolch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Vatras_Zeremoniendolch_Info()
{
	AI_Output(hero, self, "Info_Mod_Vatras_Zeremoniendolch_15_00"); //Adanos zum Gruß. Man sagt, du weißt etwas über einen Zeremoniendolch.
	AI_Output(self, hero, "Info_Mod_Vatras_Zeremoniendolch_05_01"); //Nur soviel, dass in Jharkendar Aufzeichnungen über ein solches Relikt gefunden wurden. Du kennst Jharkendar?
	AI_Output(hero, self, "Info_Mod_Vatras_Zeremoniendolch_15_02"); //Ja, ich habe doch das Portal geöffnet.
	AI_Output(self, hero, "Info_Mod_Vatras_Zeremoniendolch_05_03"); //Dann rede mit Merdarion. Er kann dir sicher mehr sagen.
	AI_Output(hero, self, "Info_Mod_Vatras_Zeremoniendolch_15_04"); //Danke, Magier.
	AI_Output(self, hero, "Info_Mod_Vatras_Zeremoniendolch_05_05"); //Moment noch. Wenn du rübergehst, kannst du gleich paar Dinge mitnehmen.
	AI_Output(self, hero, "Info_Mod_Vatras_Zeremoniendolch_05_06"); //Normalerweise macht Cavalon das, aber der ist lange nicht mehr hier gewesen.
	AI_Output(hero, self, "Info_Mod_Vatras_Zeremoniendolch_15_07"); //Der ist im Portaltempel und steht sich dort die Beine in den Bauch.
	AI_Output(self, hero, "Info_Mod_Vatras_Zeremoniendolch_05_08"); //Dann sag ihm, er soll gefälligst hier erscheinen. Ich habe noch mehr zu transportieren.
	AI_Output(hero, self, "Info_Mod_Vatras_Zeremoniendolch_15_09"); //Das mach ich doch. Was soll ich mitnehmen?
	AI_Output(self, hero, "Info_Mod_Vatras_Zeremoniendolch_05_10"); //Hier. Diesen Beutel gibst du dem Magier Cronos.

	B_GiveInvItems	(self, hero, ItMi_CronosBeutel, 1);

	AI_Output(hero, self, "Info_Mod_Vatras_Zeremoniendolch_15_11"); //Wird erledigt.

	B_LogEntry	(TOPIC_MOD_ASS_ZEREMONIENDOLCH, "Vatras schickt mich zu Merdarion. Für Cronos soll ich einen Beutel mitnehmen und Cavalon zurückschicken.");
};

INSTANCE Info_Mod_Vatras_BosperLehrling (C_INFO)
{
	npc		= Mod_524_KDW_Vatras_NW;
	nr		= 1;
	condition	= Info_Mod_Vatras_BosperLehrling_Condition;
	information	= Info_Mod_Vatras_BosperLehrling_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich brauche eine Tinktur, die bei Berührung zurückverwandelt.";
};

FUNC INT Info_Mod_Vatras_BosperLehrling_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Bosper_LehrlingQuest10))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Vatras_BosperLehrling_Info()
{
	AI_Output(hero, self, "Info_Mod_Vatras_BosperLehrling_15_00"); //Ich brauche eine Tinktur, die bei Berührung zurückverwandelt.

	if (hero.guild != GIL_KDF)
	{
		AI_Output(self, hero, "Info_Mod_Vatras_BosperLehrling_05_01"); //Tinkturen sind nicht mein Spezialgebiet.
		AI_Output(self, hero, "Info_Mod_Vatras_BosperLehrling_05_02"); //Ich kann dir eine Rückverwandlungs-Spruchrolle geben, die du dann noch von einem Alchemiekundigen in ihre Bestandteile zerlegen lassen musst.

		B_GiveInvItems	(self, hero, ItSc_Rueckverwandlung, 1);

		AI_Output(hero, self, "Info_Mod_Vatras_BosperLehrling_15_03"); //Das hilft mir auch schon weiter. Danke.

		Mod_Bosper_Tinktur = 1;

		B_LogEntry	(TOPIC_MOD_LEHRLING_BOSPER_FOUR, "Vatras hatte nur eine Rückverwandlungsspruchrolle für mich, die ich von einem Alchemisten zerlegen lassen muss, damit daraus eine Tinktur hergestellt werden kann.");
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Vatras_BosperLehrling_05_04"); //Du glaubst doch nicht ernsthaft, dass ich einem Satansanhänger wie dir helfe?
		AI_Output(hero, self, "Info_Mod_Vatras_BosperLehrling_15_05"); //Es geht hier nicht um eine Glaubensfrage. Bosper wird gerade von Gewissensbissen verfolgt.
		AI_Output(self, hero, "Info_Mod_Vatras_BosperLehrling_05_06"); //(zweifelnd) Na ja, Tinkturen sind nicht mein Spezialgebiet.
		AI_Output(self, hero, "Info_Mod_Vatras_BosperLehrling_05_07"); //Ich könnte dir eine Rückverwandlungs-Spruchrolle verkaufen, die du dann noch von einem Alchemiekundigen in ihre Bestandteile zerlegen lassen müsstest.
		AI_Output(hero, self, "Info_Mod_Vatras_BosperLehrling_15_08"); //Wie viel willst du haben?
		AI_Output(self, hero, "Info_Mod_Vatras_BosperLehrling_05_09"); //300 Goldstücke. Und keine Verhandlungen.
	};
};

INSTANCE Info_Mod_Vatras_BosperLehrling2 (C_INFO)
{
	npc		= Mod_524_KDW_Vatras_NW;
	nr		= 1;
	condition	= Info_Mod_Vatras_BosperLehrling2_Condition;
	information	= Info_Mod_Vatras_BosperLehrling2_Info;
	permanent	= 0;
	important	= 0;
	description	= "In Ordnung, gib mit die Spruchrolle.";
};

FUNC INT Info_Mod_Vatras_BosperLehrling2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Vatras_BosperLehrling))
	&& (Mod_Bosper_Tinktur == 0)
	&& (Npc_HasItems(hero, ItMi_Gold) >= 300)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Vatras_BosperLehrling2_Info()
{
	AI_Output(hero, self, "Info_Mod_Vatras_BosperLehrling2_15_00"); //In Ordnung, gib mit die Spruchrolle.

	B_GiveInvItems	(hero, self, ItMi_Gold, 300);

	B_GiveInvItems	(self, hero, ItSc_Rueckverwandlung, 1);

	Mod_Bosper_Tinktur = 1;

	B_LogEntry	(TOPIC_MOD_LEHRLING_BOSPER_FOUR, "Vatras hatte nur eine Rückverwandlungsspruchrolle für mich, die ich von einem Alchemisten zerlegen lassen muss, damit daraus eine Tinktur hergestellt werden kann.");
};

INSTANCE Info_Mod_Vatras_Kreis1	(C_INFO)
{
	npc		= Mod_524_KDW_Vatras_NW;
	nr		= 1;
	condition	= Info_Mod_Vatras_Kreis1_Condition;
	information	= Info_Mod_Vatras_Kreis1_Info;
	permanent	= 1;
	important	= 0;
	description	= "Lehre mich den ersten Kreis der Magie.";
};
FUNC INT Info_Mod_Vatras_Kreis1_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Mod_Vatras_Hi))
	&& ((Mod_Gilde == 9)
	|| (Mod_Gilde == 10)
	|| (Mod_Gilde == 11)
	|| (Mod_Gilde == 17)
	|| (Mod_Gilde == 18))
	&& (Mod_MagieKreis == 0)
	{
		return 1;
	};
};
FUNC VOID Info_Mod_Vatras_Kreis1_Info ()
{
	AI_Output (hero, self, "Info_Mod_Vatras_Kreis1_15_00"); //Lehre mich den ersten Kreis der Magie.
	
	if B_TeachMagicCircle (self, hero, 1)
	{
		AI_Output (self, hero, "Info_Mod_Vatras_Kreis1_05_01"); //Der erste Kreis erlaubt es dir, Runen, die du erschaffen hast, anzuwenden.
		AI_Output (self, hero, "Info_Mod_Vatras_Kreis1_05_02"); //Du kannst jetzt die Formeln der Zaubersprüche lernen, um deine eigenen Runen herzustellen.

		Mod_MagieKreis = 1;
	};
};	
///////////////////////////////////////////////////////////////////////
//	Info TECH_CIRCLE_02
///////////////////////////////////////////////////////////////////////
INSTANCE Info_Mod_Vatras_Kreis2		(C_INFO)
{
	npc		= Mod_524_KDW_Vatras_NW;
	nr		= 1;
	condition	= Info_Mod_Vatras_Kreis2_Condition;
	information	= Info_Mod_Vatras_Kreis2_Info;
	permanent	= 1;
	important	= 0;
	description	= "Lehre mich den zweiten Kreis der Magie.";
};
FUNC INT Info_Mod_Vatras_Kreis2_Condition ()
{	
	if ((Mod_Gilde == 9)
	|| (Mod_Gilde == 10)
	|| (Mod_Gilde == 11)
	|| (Mod_Gilde == 17)
	|| (Mod_Gilde == 18))
	&& (Mod_MagieKreis == 1)
	{
		return 1;
	};
};
FUNC VOID Info_Mod_Vatras_Kreis2_Info ()
{
	AI_Output (hero, self, "Info_Mod_Vatras_Kreis2_15_00"); //Lehre mich den zweiten Kreis der Magie.
	
	if (Kapitel >= 2)
	{
		if B_TeachMagicCircle (self, hero, 2)
		{
			AI_Output (self, hero, "Info_Mod_Vatras_Kreis2_05_01"); //Tritt nun in den zweiten Kreis und lerne, noch mächtigere Zauber zu wirken.

			Mod_MagieKreis = 2;
		};
	}
	else
	{
		AI_Output (self, hero, "Info_Mod_Vatras_Kreis2_05_02"); //Die Zeit ist noch nicht gekommen.
	};
};	
///////////////////////////////////////////////////////////////////////
//	Info TECH_CIRCLE_03
///////////////////////////////////////////////////////////////////////
INSTANCE Info_Mod_Vatras_Kreis3		(C_INFO)
{
	npc		= Mod_524_KDW_Vatras_NW;
	nr		= 1;
	condition	= Info_Mod_Vatras_Kreis3_Condition;
	information	= Info_Mod_Vatras_Kreis3_Info;
	permanent	= 1;
	important	= 0;
	description	= "Lehre mich den dritten Kreis der Magie.";
};
FUNC INT Info_Mod_Vatras_Kreis3_Condition ()
{	
	if ((Mod_Gilde == 10)
	|| (Mod_Gilde == 11))
	&& (Mod_MagieKreis == 2)
	{
		return 1;
	};
};
FUNC VOID Info_Mod_Vatras_Kreis3_Info ()
{
	AI_Output (hero, self, "Info_Mod_Vatras_Kreis3_15_00"); //Lehre mich den dritten Kreis der Magie.
	
	if (Kapitel >= 3)
	{
		if B_TeachMagicCircle (self, hero, 3)
		{
			AI_Output (self, hero, "Info_Mod_Vatras_Kreis3_05_01"); //Ja, die Zeit ist gekommen. Tritt ein in den dritten Kreis der Magie. Neue Zauber erwarten dich.

			Mod_MagieKreis = 3;
		};
	}
	else
	{
		AI_Output (self, hero, "Info_Mod_Vatras_Kreis3_05_02"); //Es ist noch nicht an der Zeit für dich, den dritten Kreis zu lernen.
	};
};		

INSTANCE Info_Mod_Vatras_Kreis4 (C_INFO)
{
	npc		= Mod_524_KDW_Vatras_NW;
	nr		= 1;
	condition	= Info_Mod_Vatras_Kreis4_Condition;
	information	= Info_Mod_Vatras_Kreis4_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich will den vierten Kreis der Magie lernen.";
};

FUNC INT Info_Mod_Vatras_Kreis4_Condition()
{	
	if (Mod_MagieKreis == 3)
	&& ((Mod_Gilde == 10)
	|| (Mod_Gilde == 11))
	{
		return 1;
	};
};
FUNC VOID Info_Mod_Vatras_Kreis4_Info ()
{
	AI_Output (hero, self, "Info_Mod_Vatras_Kreis4_15_00"); //Ich will den vierten Kreis der Magie lernen.
	
	if (Kapitel >= 4)
	{
		if B_TeachMagicCircle (self,hero, 4)
		{
			AI_Output (self, hero, "Info_Mod_Vatras_Kreis4_05_01"); //Gut. Alle Zeichen sind erfüllt. Tritt nun ein in den vierten Kreis, auf dass dir die Macht der neuen Zauber inne ist.

			Mod_MagieKreis = 4;
		};
	}
	else
	{
			AI_Output (self, hero, "Info_Mod_Vatras_Kreis4_05_02"); //Noch ist es nicht soweit.
	};
};

INSTANCE Info_Mod_Vatras_Kreis5 (C_INFO)
{
	npc		= Mod_524_KDW_Vatras_NW;
	nr		= 1;
	condition	= Info_Mod_Vatras_Kreis5_Condition;
	information	= Info_Mod_Vatras_Kreis5_Info;
	permanent	= 1;
	important	= 0;
	description	= "Ich will den fünften Kreis der Magie lernen.";
};

FUNC INT Info_Mod_Vatras_Kreis5_Condition()
{	
	if (Mod_MagieKreis == 4)
	&& (Mod_Gilde == 11)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Vatras_Kreis5_Info()
{
	AI_Output (hero, self, "Info_Mod_Vatras_Kreis5_15_00"); //Ich will den fünften Kreis der Magie lernen.
	
	if (Kapitel >= 5)
	{
		if B_TeachMagicCircle (self,hero, 5)
		{
			AI_Output (self, hero, "Info_Mod_Vatras_Kreis5_05_01"); //Dann tritt nun ein, in den fünften Kreis der Magie. Du wirst nun mächtigere Zauber als je zuvor beherrschen.

			Mod_MagieKreis = 5;
		};
	}
	else
	{
			AI_Output (self, hero, "Info_Mod_Vatras_Kreis5_05_02"); //Die Zeit ist noch nicht reif dafür.
	};
};

INSTANCE Info_Mod_Vatras_Kreis6	(C_INFO)
{
	npc		= Mod_524_KDW_Vatras_NW;
	nr		= 1;
	condition	= Info_Mod_Vatras_Kreis6_Condition;
	information	= Info_Mod_Vatras_Kreis6_Info;
	permanent	= 1;
	important	= 0;
	description	= "Lehre mich den letzten Kreis der Magie.";
};

FUNC INT Info_Mod_Vatras_Kreis6_Condition()
{	
	if (Mod_MagieKreis == 5)
	&& (Mod_Gilde == 11)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Vatras_Kreis6_Info()
{
	AI_Output (hero, self, "Info_Mod_Vatras_Kreis6_15_00"); //Lehre mich den letzten Kreis der Magie.
	
	if (Kapitel >= 6)
	{
		if B_TeachMagicCircle (self,hero, 6)  
		{
			AI_Output (self, hero, "Info_Mod_Vatras_Kreis6_05_01"); //Viel Zeit ist vergangen, seit du den Bund mit Innos eingegangen bist. Viel ist geschehen und wir finden keine Ruhe.
			AI_Output (self, hero, "Info_Mod_Vatras_Kreis6_05_02"); //Du bist der Erwählte Adanos'. Und als solcher wirst du alle Kraft brauchen, um deine Kämpfe zu bestehen.
			AI_Output (self, hero, "Info_Mod_Vatras_Kreis6_05_03"); //Ich weihe dich nun, Erwählter. Du trittst in den sechsten Kreis.
			AI_Output (self, hero, "Info_Mod_Vatras_Kreis6_05_04"); //Die Zauberformeln des letzten Kreises kannst du nun von Nefarius lernen, wenn du es wünscht.

			Mod_MagieKreis = 6;
		};
	}
	else
	{
		AI_Output (self, hero, "Info_Mod_Vatras_Kreis6_05_05"); //Noch ist es nicht an der Zeit dafür. Wenn du ein Stück weiter auf dem Weg gegangen bist, den Beliar dir zeigt, dann werde ich dich unterweisen.
	};
};

INSTANCE Info_Mod_Vatras_Lehrer (C_INFO)
{
	npc		= Mod_524_KDW_Vatras_NW;
	nr		= 1;
	condition	= Info_Mod_Vatras_Lehrer_Condition;
	information	= Info_Mod_Vatras_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer kann mir beibringen meine magische Kraft zu erhöhen?";
};

FUNC INT Info_Mod_Vatras_Lehrer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Vatras_Hi))
	&& ((Mod_Gilde == 9)
	|| (Mod_Gilde == 10)
	|| (Mod_Gilde == 11))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Vatras_Lehrer_Info()
{
	AI_Output(hero, self, "Info_Mod_Vatras_Lehrer_15_00"); //Wer kann mir beibringen meine magische Kraft zu erhöhen?
	AI_Output(self, hero, "Info_Mod_Vatras_Lehrer_05_01"); //Ich kann dir dabei sicher behilflich sein.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_STADT, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_STADT, "Vatras kann mir beibringen meine MANA zu steigern.");
};

INSTANCE Info_Mod_Vatras_Lernen (C_INFO)
{
	npc		= Mod_524_KDW_Vatras_NW;
	nr		= 1;
	condition	= Info_Mod_Vatras_Lernen_Condition;
	information	= Info_Mod_Vatras_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Bring mir was bei.";
};

FUNC INT Info_Mod_Vatras_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Vatras_Lehrer))
	&& (hero.attribute[ATR_MANA_MAX]	<	300)
	&& ((Mod_Gilde == 9)
	|| (Mod_Gilde == 10)
	|| (Mod_Gilde == 11))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Vatras_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Vatras_Lernen_15_00"); //Bring mir was bei.

	Info_ClearChoices	(Info_Mod_Vatras_Lernen);

	Info_AddChoice		(Info_Mod_Vatras_Lernen, DIALOG_BACK, INFO_MOD_Vatras_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Vatras_Lernen, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Vatras_Lernen_5);
	Info_AddChoice		(Info_Mod_Vatras_Lernen, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Vatras_Lernen_1);
};

FUNC VOID Info_Mod_Vatras_Lernen_BACK()
{
	if (hero.attribute[ATR_MANA_MAX]	>=	300)
	{
		AI_Output(self, hero, "Info_Mod_Vatras_Lernen_BACK_05_01"); //Deine magischen Kenntnisse sind jetzt so gut, dass ich dir nichts mehr beibringen kann.
	};
	Info_ClearChoices	(Info_Mod_Vatras_Lernen);
};

FUNC VOID Info_Mod_Vatras_Lernen_5()
{
	B_TeachAttributePoints_New (self, hero, ATR_MANA_MAX, 5, 300);

	Info_ClearChoices	(Info_Mod_Vatras_Lernen);

	Info_AddChoice		(Info_Mod_Vatras_Lernen, DIALOG_BACK, INFO_MOD_Vatras_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Vatras_Lernen, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Vatras_Lernen_5);
	Info_AddChoice		(Info_Mod_Vatras_Lernen, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Vatras_Lernen_1);
};

FUNC VOID Info_Mod_Vatras_Lernen_1()
{
	B_TeachAttributePoints (self, hero, ATR_MANA_MAX, 1, 300);

	Info_ClearChoices	(Info_Mod_Vatras_Lernen);

	Info_AddChoice		(Info_Mod_Vatras_Lernen, DIALOG_BACK, INFO_MOD_Vatras_Lernen_BACK);
	Info_AddChoice		(Info_Mod_Vatras_Lernen, B_BuildLearnString_New(PRINT_LearnMANA5	, B_GetLearnCostAttribute_New(hero, ATR_MANA_MAX), ATR_MANA_MAX)	,Info_Mod_Vatras_Lernen_5);
	Info_AddChoice		(Info_Mod_Vatras_Lernen, B_BuildLearnString_New(PRINT_LearnMANA1	, B_GetLearnCostAttribute(hero, ATR_MANA_MAX), ATR_MANA_MAX)		,Info_Mod_Vatras_Lernen_1);
};

INSTANCE Info_Mod_Vatras_Ruestung (C_INFO)
{
	npc		= Mod_524_KDW_Vatras_NW;
	nr		= 1;
	condition	= Info_Mod_Vatras_Ruestung_Condition;
	information	= Info_Mod_Vatras_Ruestung_Info;
	permanent	= 1;
	important	= 0;
	description	= "Kann ich bei dir eine bessere Robe bekommen?";
};

FUNC INT Info_Mod_Vatras_Ruestung_Condition()
{
	if ((Mod_Gilde == 9)
	|| (Mod_Gilde == 10))
	&& (Npc_KnowsInfo(hero, Info_Mod_Vatras_Hi))
	&& (Mod_ZweiteVerbesserung < 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Vatras_Ruestung_Info()
{
	AI_Output(hero, self, "Info_Mod_Vatras_Ruestung_15_00"); //Kann ich bei dir eine bessere Robe bekommen?

	if (Kapitel > 1)
	&& (Mod_ErsteVerbesserung == FALSE)
	&& (Mod_Gilde < 10)
	{
		AI_Output(self, hero, "Info_Mod_Vatras_Ruestung_05_02"); //Ich hab gehört, dass beim See nordwestlich der Ausgrabungsstätte ein Rudel Wassersnapper hausen soll. Mit deren Haut könnte ich deine Wasser Novizenrobe sicher ein wenig verbessern.
	
		Mod_ErsteVerbesserung = TRUE;
	
		Wld_InsertNpc	(Wassersnapper,	"NW_TROLLAREA_PATH_72");
		Wld_InsertNpc	(Wassersnapper,	"NW_TROLLAREA_PATH_72");
		Wld_InsertNpc	(Wassersnapper,	"NW_TROLLAREA_PATH_72");
	};

	if (Kapitel > 3)
	&& (Mod_ZweiteVerbesserung == FALSE)
	{
		AI_Output(self, hero, "Info_Mod_Vatras_Ruestung_05_03"); //Ich hab gehört, dass beim Weg zur Ausgrabungsstätte ein Wasserläufer sein soll. Mit dessen Fell könnte ich deine Wassermagierrobe sicher ein wenig verbessern.
	
		Mod_ZweiteVerbesserung = TRUE;
	
		Wld_InsertNpc	(Wasserlaeufer,	"FP_MAGICGOLEM");
	};

	Info_ClearChoices	(Info_Mod_Vatras_Ruestung);
	Info_AddChoice	(Info_Mod_Vatras_Ruestung, DIALOG_BACK, Info_Mod_Vatras_Ruestung_BACK);

	if (Mod_ErsteVerbesserung == TRUE)
	&& ((Mod_Gilde == 9)
	|| (Mod_Gilde == 10)
	|| (Mod_Gilde == 11)
	|| (Mod_Gilde == 17)
	|| (Mod_Gilde == 18))
	&& (Npc_HasItems(hero, ItAr_KDW_L_ADDON) == 0)
	&& (Mod_Gilde < 10)
	{
		Info_AddChoice	(Info_Mod_Vatras_Ruestung, "Wasser Novizenrobe verbessern", Info_Mod_Vatras_Ruestung_WNOV_S);
	};

	if (Mod_ZweiteVerbesserung == TRUE)
	&& ((Mod_Gilde == 9)
	|| (Mod_Gilde == 10)
	|| (Mod_Gilde == 11)
	|| (Mod_Gilde == 17)
	|| (Mod_Gilde == 18))
	{
		Info_AddChoice	(Info_Mod_Vatras_Ruestung, "Wassermagierrobe verbessern", Info_Mod_Vatras_Ruestung_KDW_S);
	};
};

FUNC VOID Info_Mod_Vatras_Ruestung_BACK ()
{
	Info_ClearChoices	(Info_Mod_Vatras_Ruestung);
};

FUNC VOID Info_Mod_Vatras_Ruestung_WNOV_S ()
{
	AI_Output(hero, self, "Info_Mod_Vatras_Ruestung_WNOV_S_15_00"); //Verbessere meine Wasser Novizenrobe.

	if (Npc_HasItems(hero, ItAt_WassersnapperHaut) >= 1)
	&& (Npc_HasItems(hero, ItAr_Wassernovize1) == 1)
	{
		AI_Output(self, hero, "Info_Mod_Vatras_Ruestung_WNOV_S_05_01"); //Alles klar.

		Npc_RemoveInvItems	(hero, ItAt_WassersnapperHaut, 1);
		
		AI_UnequipArmor	(hero);

		Npc_RemoveInvItems	(hero, ItAr_Wassernovize1, 1);

		CreateInvItems	(self, ItAr_WNOV_S, 1);

		B_GiveInvItems	(self, hero, ItAr_WNOV_S, 1);

		AI_UnequipArmor	(hero);
		AI_EquipArmor	(hero, ItAr_WNOV_S);

		Mod_ErsteVerbesserung = 2;
	}
	else if (Npc_HasItems(hero, ItAr_Wassernovize1) == 0)
	{
		AI_Output(self, hero, "Info_Mod_Vatras_Ruestung_WNOV_S_05_02"); //Du musst schon eine Wasser Novizenrobe haben, sonst kann ich sie dir nicht verbessern.
	}
	else if (Npc_HasItems(hero, ItAt_Wassersnapperhaut) == 0)
	{
		AI_Output(self, hero, "Info_Mod_Vatras_Ruestung_WNOV_S_05_03"); //Wenn du nicht die Snapperhaut hast, kann ich deine Rüstung nicht verbessern.
	};

	Info_ClearChoices	(Info_Mod_Vatras_Ruestung);
};

FUNC VOID Info_Mod_Vatras_Ruestung_KDW_S ()
{
	AI_Output(hero, self, "Info_Mod_Vatras_Ruestung_KDW_S_15_00"); //Verbessere meine Wassermagierrobe.

	if (Npc_HasItems(hero, ItAt_WaterShadowFur) == 1)
	&& (Npc_HasItems(hero, ItAr_KDW_L_ADDON) == 1)
	{
		AI_Output(self, hero, "Info_Mod_Vatras_Ruestung_KDW_S_05_01"); //Alles klar.

		Npc_RemoveInvItems	(hero, ItAt_WaterShadowFur, 1);
		
		AI_UnequipArmor	(hero);

		Npc_RemoveInvItems	(hero, ItAr_KDW_L_ADDON, 1);

		CreateInvItems	(self, ItAr_KDW_L_S, 1);

		B_GiveInvItems	(self, hero, ItAr_KDW_L_S, 1);

		AI_UnequipArmor	(hero);
		AI_EquipArmor	(hero, ItAr_KDW_L_S);

		Mod_ZweiteVerbesserung = 2;
	}
	else if (Npc_HasItems(hero, ItAr_KDW_L_ADDON) == 0)
	{
		AI_Output(self, hero, "Info_Mod_Vatras_Ruestung_RIT_S_05_02"); //Du musst schon eine Wassermagierrobe haben, sonst kann ich sie dir nicht verbessern.
	}
	else if (Npc_HasItems(hero, ItAt_WaterShadowFur) == 0)
	{
		AI_Output(self, hero, "Info_Mod_Vatras_Ruestung_RIT_S_05_03"); //Wenn du nicht das Wasserläuferfell hast, kann ich deine Rüstung nicht verbessern.
	};

	Info_ClearChoices	(Info_Mod_Vatras_Ruestung);
};

INSTANCE Info_Mod_Vatras_Pickpocket (C_INFO)
{
	npc		= Mod_524_KDW_Vatras_NW;
	nr		= 1;
	condition	= Info_Mod_Vatras_Pickpocket_Condition;
	information	= Info_Mod_Vatras_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_180;
};

FUNC INT Info_Mod_Vatras_Pickpocket_Condition()
{
	C_Beklauen	(180, ItMi_Gold, 97);
};

FUNC VOID Info_Mod_Vatras_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Vatras_Pickpocket);

	Info_AddChoice	(Info_Mod_Vatras_Pickpocket, DIALOG_BACK, Info_Mod_Vatras_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Vatras_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Vatras_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Vatras_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Vatras_Pickpocket);
};

FUNC VOID Info_Mod_Vatras_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Vatras_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Vatras_Pickpocket);

		Info_AddChoice	(Info_Mod_Vatras_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Vatras_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Vatras_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Vatras_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Vatras_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Vatras_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Vatras_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Vatras_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Vatras_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Vatras_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Vatras_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Vatras_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Vatras_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Vatras_EXIT (C_INFO)
{
	npc		= Mod_524_KDW_Vatras_NW;
	nr		= 1;
	condition	= Info_Mod_Vatras_EXIT_Condition;
	information	= Info_Mod_Vatras_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Vatras_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Vatras_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};