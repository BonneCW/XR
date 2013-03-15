INSTANCE Info_Mod_Sly_Hi (C_INFO)
{
	npc		= Mod_801_STT_Sly_MT;
	nr		= 1;
	condition	= Info_Mod_Sly_Hi_Condition;
	information	= Info_Mod_Sly_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du hast auch nichts zu tun, oder?";
};

FUNC INT Info_Mod_Sly_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Sly_Hi_Info()
{
	AI_Output(hero, self, "Info_Mod_Sly_Hi_15_00"); //Du hast auch nichts zu tun, oder?
	AI_Output(self, hero, "Info_Mod_Sly_Hi_31_01"); //(angetrunken) Bleib mal ganz ruhig, Bruder. Warum setzt du dich nicht dazu und hast ein bisschen Spaß mit uns?
};

INSTANCE Info_Mod_Sly_WasPassiert (C_INFO)
{
	npc		= Mod_801_STT_Sly_MT;
	nr		= 1;
	condition	= Info_Mod_Sly_WasPassiert_Condition;
	information	= Info_Mod_Sly_WasPassiert_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was ist denn nur aus euch geworden?";
};

FUNC INT Info_Mod_Sly_WasPassiert_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sly_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sly_WasPassiert_Info()
{
	AI_Output(hero, self, "Info_Mod_Sly_WasPassiert_15_00"); //Was ist denn nur aus euch geworden?
	AI_Output(self, hero, "Info_Mod_Sly_WasPassiert_31_01"); //Nichts weiter ... denk ich. Solange Cutter uns nicht zur Arbeit auf den Feldern einteilt, können wir auch nichts machen.
	AI_Output(self, hero, "Info_Mod_Sly_WasPassiert_31_02"); //Na gut, ab und zu geht mal jemand jagen. Aber das lag mir eh noch nie, und ich will nicht als Wolfsfutter enden.
};

INSTANCE Info_Mod_Sly_LagerLeerer (C_INFO)
{
	npc		= Mod_801_STT_Sly_MT;
	nr		= 1;
	condition	= Info_Mod_Sly_LagerLeerer_Condition;
	information	= Info_Mod_Sly_LagerLeerer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ist es hier im Lager leerer geworden?";
};

FUNC INT Info_Mod_Sly_LagerLeerer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sly_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sly_LagerLeerer_Info()
{
	AI_Output(hero, self, "Info_Mod_Sly_LagerLeerer_15_00"); //Ist es hier im Lager leerer geworden?
	AI_Output(self, hero, "Info_Mod_Sly_LagerLeerer_31_01"); //Ein bisschen schon. Bei den meisten weiß man nicht, was aus ihnen geworden ist.
	AI_Output(self, hero, "Info_Mod_Sly_LagerLeerer_31_02"); //Manche wollten zum Jagen losziehen und sind nie wiedergekommen.
	AI_Output(self, hero, "Info_Mod_Sly_LagerLeerer_31_03"); //Entweder hat's die armen Schweine erwischt, oder die Dreckskerle haben sich abgesetzt.
	AI_Output(self, hero, "Info_Mod_Sly_LagerLeerer_31_04"); //Seit kurzem dürfen wir deshalb ohne Genehmigung das Lager nicht mehr verlassen.
	AI_Output(self, hero, "Info_Mod_Sly_LagerLeerer_31_05"); //Na ja, wer wirklich raus will, lässt sich von dem Verbot natürlich nicht behindern.
};

INSTANCE Info_Mod_Sly_Arena (C_INFO)
{
	npc		= Mod_801_STT_Sly_MT;
	nr		= 1;
	condition	= Info_Mod_Sly_Arena_Condition;
	information	= Info_Mod_Sly_Arena_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was ist mit der Arena? Willst du dich dort nicht messen?";
};

FUNC INT Info_Mod_Sly_Arena_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sly_WasPassiert))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sly_Arena_Info()
{
	AI_Output(hero, self, "Info_Mod_Sly_Arena_15_00"); //Was ist mit der Arena? Willst du dich dort nicht messen?
	AI_Output(self, hero, "Info_Mod_Sly_Arena_31_01"); //Die Arena wär schon was für mich ... immer wenn Kämpfe sind, stelle ich mir vor, ich wäre an der Stelle einer der Kämpfer.
	AI_Output(self, hero, "Info_Mod_Sly_Arena_31_02"); //Aber ich bin nur ein einfacher Schatten und hatte schon seit langem kein Schwert mehr in der Hand.
	AI_Output(self, hero, "Info_Mod_Sly_Arena_31_03"); //Früher war ich mal gut, zählte zu den Besten im Lager. Aber jetzt?
	AI_Output(self, hero, "Info_Mod_Sly_Arena_31_04"); //So was wie mich verputzen die in der Arena zum Frühstück.
};

INSTANCE Info_Mod_Sly_Arena2 (C_INFO)
{
	npc		= Mod_801_STT_Sly_MT;
	nr		= 1;
	condition	= Info_Mod_Sly_Arena2_Condition;
	information	= Info_Mod_Sly_Arena2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wie wär's, wenn ich dich trainiere?";
};

FUNC INT Info_Mod_Sly_Arena2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sly_Arena))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sly_Arena2_Info()
{
	AI_Output(hero, self, "Info_Mod_Sly_Arena2_15_00"); //Wie wär's, wenn ich dich trainiere?
	AI_Output(self, hero, "Info_Mod_Sly_Arena2_31_01"); //(abschätzend) Du siehst schon aus, als hättest du was auf dem Kasten. Meinetwegen.
	AI_Output(self, hero, "Info_Mod_Sly_Arena2_31_02"); //Wenn ich an der Arena erfolgreich bin, wirst du am Gewinn beteiligt.
	AI_Output(hero, self, "Info_Mod_Sly_Arena2_15_03"); //Schön. Wann willst du anfangen?
	AI_Output(self, hero, "Info_Mod_Sly_Arena2_31_04"); //Lass mich erst mal ganz nüchtern werden. Morgen Früh können wir uns, äh, auf dem Rasenstück zwischen dem kleinen Tümpel da vorn und dem Marktplatz treffen.
	AI_Output(self, hero, "Info_Mod_Sly_Arena2_31_05"); //Dort sollte genügend Platz sein.

	Log_CreateTopic	(TOPIC_MOD_SLY_ARENA, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_SLY_ARENA, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_SLY_ARENA, "Ich habe mit Sly ausgemacht, dass wir uns morgens auf dem Rasenstück zwischen Tümpel und Marktplatz treffen, damit ich ihn für die Arena trainieren kann.");

	Mod_Sly_Arena_Tag = Wld_GetDay();
};

INSTANCE Info_Mod_Sly_Arena3 (C_INFO)
{
	npc		= Mod_801_STT_Sly_MT;
	nr		= 1;
	condition	= Info_Mod_Sly_Arena3_Condition;
	information	= Info_Mod_Sly_Arena3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Sly_Arena3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sly_Arena2))
	&& (Mod_Sly_Arena == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sly_Arena3_Info()
{
	AI_Output(self, hero, "Info_Mod_Sly_Arena3_31_00"); //Na, komm endlich. Ich bin schon ganz heiß! Wie wollen wir anfangen?
	AI_Output(hero, self, "Info_Mod_Sly_Arena3_15_01"); //Wenn ich mir dich so anschaue, mit Konditionstraining. Ein gemütlicher Lauf um die Burg wird dir ganz gut tun.
	AI_Output(hero, self, "Info_Mod_Sly_Arena3_15_02"); //Ich komme lieber mit, damit du nicht schummelst.
	AI_Output(self, hero, "Info_Mod_Sly_Arena3_31_03"); //(jammert) Laufen? Ich dachte, wir perfektionieren meinen Schwertkampf?
	AI_Output(hero, self, "Info_Mod_Sly_Arena3_15_04"); //Damit du einen Schlag tun kannst und dann außer Puste bist? Los, auf die Beine!
	AI_Output(self, hero, "Info_Mod_Sly_Arena3_31_05"); //Na schön, wenn's sein muss ...

	AI_StopProcessInfos	(self);

	B_StartOtherRoutine	(self, "TRAINING2");
};

INSTANCE Info_Mod_Sly_Arena4 (C_INFO)
{
	npc		= Mod_801_STT_Sly_MT;
	nr		= 1;
	condition	= Info_Mod_Sly_Arena4_Condition;
	information	= Info_Mod_Sly_Arena4_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Sly_Arena4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sly_Arena3))
	&& (Mod_Sly_Arena == 3)
	&& (Npc_GetDistToWP(hero, "OCR_OUTSIDE_HUT_65_MOVEMENT") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sly_Arena4_Info()
{
	AI_Output(self, hero, "Info_Mod_Sly_Arena4_31_00"); //(nach Luft ringend) Ah, ich sterbe!
	AI_Output(hero, self, "Info_Mod_Sly_Arena4_15_01"); //Vorher müssen wir uns noch duellieren. Hast du eine Waffe?
	AI_Output(self, hero, "Info_Mod_Sly_Arena4_31_02"); //(keuchend) Ja, ja, alles dabei. Hab auch was für dich, damit du mir nicht allzu sehr weh tust.

	B_GiveInvItems	(self, hero, ItMw_Schlagstock, 1);

	EquipItem	(hero, ItMw_Schlagstock);

	AI_Output(hero, self, "Info_Mod_Sly_Arena4_15_03"); //Dann zeig mal, was du noch so drauf hast.
	AI_Output(self, hero, "Info_Mod_Sly_Arena4_31_04"); //Ok.

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_None, 0);
};

INSTANCE Info_Mod_Sly_Arena5 (C_INFO)
{
	npc		= Mod_801_STT_Sly_MT;
	nr		= 1;
	condition	= Info_Mod_Sly_Arena5_Condition;
	information	= Info_Mod_Sly_Arena5_Info;
	permanent	= 0;
	important	= 0;
	description	= "Das war doch schon mal ganz ordentlich.";
};

FUNC INT Info_Mod_Sly_Arena5_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Sly_Arena4))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sly_Arena5_Info()
{
	AI_Output(hero, self, "Info_Mod_Sly_Arena5_15_00"); //Das war doch schon mal ganz ordentlich. Kommt das Gefühl langsam wieder?
	AI_Output(self, hero, "Info_Mod_Sly_Arena5_31_01"); //(ächzt) Wenn du mit Gefühlen die Schmerzen meinst, dann auf jeden Fall.
	AI_Output(self, hero, "Info_Mod_Sly_Arena5_31_02"); //Hast du noch irgendwelche Tipps für mich?

	Info_ClearChoices	(Info_Mod_Sly_Arena5);

	Info_AddChoice	(Info_Mod_Sly_Arena5, "Nö, passt schon.", Info_Mod_Sly_Arena5_B);
	Info_AddChoice	(Info_Mod_Sly_Arena5, "Kämpfe weniger offensiv. Die Defensive liegt dir mehr.", Info_Mod_Sly_Arena5_A);
};

FUNC VOID Info_Mod_Sly_Arena5_C()
{
	AI_Output(self, hero, "Info_Mod_Sly_Arena5_C_31_00"); //Gut. Vielen Dank für deine Hilfe. Ich glaube, ich hab's langsam wieder raus. Ich werd Scatty mal Bescheid sagen, dass er mich auf die Liste setzen soll.
	AI_Output(self, hero, "Info_Mod_Sly_Arena5_C_31_01"); //Wenn ich gewinnen sollte, kriegst du die Hälfte meiner Bezahlung.
	AI_Output(self, hero, "Info_Mod_Sly_Arena5_C_31_02"); //Jetzt werde ich noch ein wenig üben.

	Info_ClearChoices	(Info_Mod_Sly_Arena5);

	B_LogEntry	(TOPIC_MOD_SLY_ARENA, "Sly will sich nun bei Scatty für Arenakämpfe bewerben. Ich sollte also demnächst mal bei ihm vorbeischauen und fragen, wann Sly kämpft. Sollte Sly gewinnen, hat er mir die Hälfte seiner Bezahlung versprochen.");

	B_StartOtherRoutine	(self, "ATARENA");
};

FUNC VOID Info_Mod_Sly_Arena5_B()
{
	AI_Output(hero, self, "Info_Mod_Sly_Arena5_B_15_00"); //Nö, passt schon.

	B_LogEntry	(TOPIC_MOD_SLY_ARENA, "Ich habe Sly in einem Schnellprogramm auf die Kämpfe in der Arena vorbereitet. Das muss jetzt reichen, um bestehen zu können.");

	Info_Mod_Sly_Arena5_C();
};

FUNC VOID Info_Mod_Sly_Arena5_A()
{
	AI_Output(hero, self, "Info_Mod_Sly_Arena5_A_15_00"); //Kämpfe weniger offensiv. Die Defensive liegt dir mehr.

	B_LogEntry	(TOPIC_MOD_SLY_ARENA, "Ich habe Sly in einem Schnellprogramm auf die Kämpfe in der Arena vorbereitet und ihm noch einen Vorschlag mitgegeben.");

	Mod_Sly_Tipp = 1;

	Info_Mod_Sly_Arena5_C();
};

INSTANCE Info_Mod_Sly_Arena6 (C_INFO)
{
	npc		= Mod_801_STT_Sly_MT;
	nr		= 1;
	condition	= Info_Mod_Sly_Arena6_Condition;
	information	= Info_Mod_Sly_Arena6_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Sly_Arena6_Condition()
{
	if (Mod_Sly_Arena == 5)
	|| (Mod_Sly_Arena == 6)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sly_Arena6_Info()
{
	if (Mod_Sly_Arena == 5)
	{
		AI_Output(self, hero, "Info_Mod_Sly_Arena6_31_00"); //Schade, ich hätte diesen Karanto fast besiegt. Das schreit nach einer Revanche!
		AI_Output(hero, self, "Info_Mod_Sly_Arena6_15_01"); //Du bleibst also dabei?
		AI_Output(self, hero, "Info_Mod_Sly_Arena6_31_02"); //Na klar! Der soll sich nur warm anziehen!

		B_GivePlayerXP	(50);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Sly_Arena6_31_03"); //Mann, ohne deinen Hinweis mit der Defensive hätte ich Gor Karanto nicht geknackt. Knapp, aber verdient, würde ich sagen.
		AI_Output(hero, self, "Info_Mod_Sly_Arena6_15_04"); //Glückwunsch.
		AI_Output(self, hero, "Info_Mod_Sly_Arena6_31_05"); //Hier hast du deinen Anteil.

		B_GiveInvItems	(self, hero, ItMi_Gold, 150);

		AI_Output(self, hero, "Info_Mod_Sly_Arena6_31_06"); //Ich fiebere schon meinen nächsten Duell entgegen.

		B_GivePlayerXP	(100);
	};

	B_SetTopicStatus	(TOPIC_MOD_SLY_ARENA, LOG_SUCCESS);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Sly_SLDSpy (C_INFO)
{
	npc		= Mod_801_STT_Sly_MT;
	nr		= 1;
	condition	= Info_Mod_Sly_SLDSpy_Condition;
	information	= Info_Mod_Sly_SLDSpy_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hallo, was gibt’s Neues im Lager?";
};

FUNC INT Info_Mod_Sly_SLDSpy_Condition()
{
	if (Mod_SLD_STT_Mordrag == 1)
	&& (Npc_KnowsInfo(hero, Info_Mod_Lee_GotoSylvio))
	&& (Mod_SLD_Spy == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Sly_SLDSpy_Info()
{
	AI_Output(hero, self, "Info_Mod_Sly_SLDSpy_15_00"); //Hallo, was gibt’s Neues im Lager?
	AI_Output(self, hero, "Info_Mod_Sly_SLDSpy_31_01"); //Warum fragst du?
	AI_Output(hero, self, "Info_Mod_Sly_SLDSpy_15_02"); //Ich war einige Zeit im Sumpflager und habe dort alles ausgekundschaftet. Hier hast du einen Stängel.

	B_ShowGivenThings	("Stängel Sumpfkraut gegeben");

	CreateInvItems	(self, ItMi_Joint, 1);

	AI_Output(self, hero, "Info_Mod_Sly_SLDSpy_31_03"); //Ahh, ein frischer harziger Stängel.

	B_UseItem	(self, ItMi_Joint);

	AI_Output(self, hero, "Info_Mod_Sly_SLDSpy_31_04"); //Ach ja, wegen der Neuigkeiten. Hab gehört, dass die Gardisten in den nächsten Tagen was Großes planen.
	AI_Output(self, hero, "Info_Mod_Sly_SLDSpy_31_05"); //Irgendeinen Angriff in der Morgendämmerung, hieß es. Bin schon mächtig gespannt ...

	B_LogEntry	(TOPIC_MOD_SLD_SPY, "Sly meinte, die Gardisten würden demnächst in der Morgendämmerung einen großen Angriff planen.");
};

INSTANCE Info_Mod_Sly_Pickpocket (C_INFO)
{
	npc		= Mod_801_STT_Sly_MT;
	nr		= 1;
	condition	= Info_Mod_Sly_Pickpocket_Condition;
	information	= Info_Mod_Sly_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Sly_Pickpocket_Condition()
{
	C_Beklauen	(45, ItMi_Gold, 80);
};

FUNC VOID Info_Mod_Sly_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Sly_Pickpocket);

	Info_AddChoice	(Info_Mod_Sly_Pickpocket, DIALOG_BACK, Info_Mod_Sly_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Sly_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Sly_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Sly_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Sly_Pickpocket);
};

FUNC VOID Info_Mod_Sly_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Sly_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Sly_Pickpocket);

		Info_AddChoice	(Info_Mod_Sly_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Sly_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Sly_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Sly_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Sly_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Sly_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Sly_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Sly_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Sly_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Sly_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Sly_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Sly_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Sly_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Sly_EXIT (C_INFO)
{
	npc		= Mod_801_STT_Sly_MT;
	nr		= 1;
	condition	= Info_Mod_Sly_EXIT_Condition;
	information	= Info_Mod_Sly_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Sly_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Sly_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};