INSTANCE Info_Mod_Vino_Hi (C_INFO)
{
	npc		= Mod_912_BAU_Vino_NW;
	nr		= 1;
	condition	= Info_Mod_Vino_Hi_Condition;
	information	= Info_Mod_Vino_Hi_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was machst du hier?";
};

FUNC INT Info_Mod_Vino_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Vino_Hi_Info()
{
	B_Say	(hero, self, "$WASMACHSTDUHIER");

	AI_Output(self, hero, "Info_Mod_Vino_Hi_28_01"); //Ordentlich arbeiten, Penner. Während ihr es euch in eurer Kuppel gemütlich gemacht habt.
	AI_Output(hero, self, "Info_Mod_Vino_Hi_15_02"); //Da hast du ein paar falsche Vorstellungen, fürchte ich.
	AI_Output(self, hero, "Info_Mod_Vino_Hi_28_03"); //Ich hab gesehen, was euch alles reingeschickt wurde. Davon hätte ein Fürst leben können!

	Info_ClearChoices	(Info_Mod_Vino_Hi);

	Info_AddChoice	(Info_Mod_Vino_Hi, "Das war ein herrliches Leben!", Info_Mod_Vino_Hi_B);
	Info_AddChoice	(Info_Mod_Vino_Hi, "Richtig, einer. Der Rest hat davon nichts gesehen.", Info_Mod_Vino_Hi_A);
};

FUNC VOID Info_Mod_Vino_Hi_B()
{
	AI_Output(hero, self, "Info_Mod_Vino_Hi_B_15_00"); //(süffisant) Das war ein herrliches Leben!
	AI_Output(self, hero, "Info_Mod_Vino_Hi_B_28_01"); //Halt die Schnauze!

	Info_ClearChoices	(Info_Mod_Vino_Hi);

	Info_AddChoice	(Info_Mod_Vino_Hi, "Jeden Abend Bier und Weiber ...", Info_Mod_Vino_Hi_D);
	Info_AddChoice	(Info_Mod_Vino_Hi, "Ist wohl besser, ich gehe langsam.", Info_Mod_Vino_Hi_C);
};

FUNC VOID Info_Mod_Vino_Hi_A()
{
	AI_Output(hero, self, "Info_Mod_Vino_Hi_A_15_00"); //Richtig, einer. Der Rest hat davon nichts gesehen.
	AI_Output(self, hero, "Info_Mod_Vino_Hi_A_28_01"); //Du gehst mir aufn Sack, Mann. Hau endlich ab!

	Info_ClearChoices	(Info_Mod_Vino_Hi);
};

FUNC VOID Info_Mod_Vino_Hi_D()
{
	AI_Output(hero, self, "Info_Mod_Vino_Hi_D_15_00"); //Jeden Abend Bier und Weiber ...
	AI_Output(self, hero, "Info_Mod_Vino_Hi_D_28_01"); //Dir werd ich's zeigen!

	Info_ClearChoices	(Info_Mod_Vino_Hi);

	AI_StopProcessInfos	(self);

	B_Attack	(self, hero, AR_None, 0);
};

FUNC VOID Info_Mod_Vino_Hi_C()
{
	AI_Output(hero, self, "Info_Mod_Vino_Hi_C_15_00"); //Ist wohl besser, ich gehe langsam.
	AI_Output(self, hero, "Info_Mod_Vino_Hi_C_28_01"); //Ja, verzieh dich bloß!

	Info_ClearChoices	(Info_Mod_Vino_Hi);
};

INSTANCE Info_Mod_Vino_Pruegel (C_INFO)
{
	npc		= Mod_912_BAU_Vino_NW;
	nr		= 1;
	condition	= Info_Mod_Vino_Pruegel_Condition;
	information	= Info_Mod_Vino_Pruegel_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Vino_Pruegel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Vino_Hi))
	&& (B_GetAivar(self, AIV_LastFightAgainstPlayer) == FIGHT_WON)
	{
		return 1;
	}
	else if (Npc_KnowsInfo(hero, Info_Mod_Vino_Hi))
	&& (B_GetAivar(self, AIV_LastFightAgainstPlayer) == FIGHT_LOST)
	{
		Mod_VinoWillRache = 1;
	};
};

FUNC VOID Info_Mod_Vino_Pruegel_Info()
{
	AI_Output(self, hero, "Info_Mod_Vino_Pruegel_28_00"); //Für solche Momente schufte ich den ganzen Tag.
							
	// ------ In jedem Fall: Arena-Kampf abgeschlossen ------
	self.aivar[AIV_ArenaFight] = AF_NONE;
		
	// ------ AIVAR resetten! ------	
	self.aivar[AIV_LastFightComment] = TRUE;
};

INSTANCE Info_Mod_Vino_KingImRing (C_INFO)
{
	npc		= Mod_912_BAU_Vino_NW;
	nr		= 1;
	condition	= Info_Mod_Vino_KingImRing_Condition;
	information	= Info_Mod_Vino_KingImRing_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Vino_KingImRing_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Vino_Hi))
	&& (Kapitel > 2)
	&& (Mod_VinoWillRache == 1)
	&& (((!Npc_KnowsInfo(hero, Info_Mod_BauerLobart_01_VinoBrennerei))
	&& (!Npc_KnowsInfo(hero, Info_Mod_BauerLobart_02_VinoBrennerei)))
	|| (Npc_KnowsInfo(hero, Info_Mod_Vino_Brennerei3)))
	&& (Npc_RefuseTalk(self) == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Vino_KingImRing_Info()
{
	AI_Output(self, hero, "Info_Mod_Vino_KingImRing_28_00"); //Hey, du da!
	AI_Output(hero, self, "Info_Mod_Vino_KingImRing_15_01"); //Redest du mit mir?
	AI_Output(self, hero, "Info_Mod_Vino_KingImRing_28_02"); //Du hast mich mal ziemlich beleidigt.
	AI_Output(hero, self, "Info_Mod_Vino_KingImRing_15_03"); //Du willst sagen: fertig gemacht?
	AI_Output(self, hero, "Info_Mod_Vino_KingImRing_28_04"); //Ich habe lange auf diesen Moment gewartet.
	AI_Output(hero, self, "Info_Mod_Vino_KingImRing_15_05"); //Bleib doch vernünftig.
	AI_Output(self, hero, "Info_Mod_Vino_KingImRing_28_06"); //Jetzt geht's dir an den Kragen!

	AI_StopProcessInfos	(self);

	B_SetAttributesToChapter	(self, 3);

	self.level = 10;

	B_Attack	(self, hero, AR_None, 0);
};

INSTANCE Info_Mod_Vino_Brennerei (C_INFO)
{
	npc		= Mod_912_BAU_Vino_NW;
	nr		= 1;
	condition	= Info_Mod_Vino_Brennerei_Condition;
	information	= Info_Mod_Vino_Brennerei_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hier steckst du also. Was ist los?";
};

FUNC INT Info_Mod_Vino_Brennerei_Condition()
{
	if (Kapitel >= 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Vino_Brennerei_Info()
{
	AI_Output(hero, self, "Info_Mod_Vino_Brennerei_15_00"); //Hier steckst du also. Was ist los?
	AI_Output(self, hero, "Info_Mod_Vino_Brennerei_28_01"); //Was los ist? Mich hätte es beinahe erwischt.
	AI_Output(self, hero, "Info_Mod_Vino_Brennerei_28_02"); //Nur Nandor verdanke ich es, dass ich noch lebe. Er hat mich aus der Höhle gezogen, als mir die Sinne schwanden ...
	AI_Output(hero, self, "Info_Mod_Vino_Brennerei_15_03"); //Was genau ist denn geschehen?
	AI_Output(self, hero, "Info_Mod_Vino_Brennerei_28_04"); //Diese abscheulichen Biester ... ich hätte nicht so neugierig sein sollen und die Fässer dort stehen lassen, wo sie waren.
	AI_Output(self, hero, "Info_Mod_Vino_Brennerei_28_05"); //Aber als ich diese Geräusche bei der Türe hörte, stellte ich sie beiseite um mit dem Ohr an der Türe zu lauschen.
	AI_Output(self, hero, "Info_Mod_Vino_Brennerei_28_06"); //Und als ich wieder nach unten blickte ... da hingen diese grässlichen Viecher an meinen Beinen ... und danach wurde es schwarz um mich.
	AI_Output(hero, self, "Info_Mod_Vino_Brennerei_15_07"); //Ja, klingt nicht so schön. Aber wie geht es dir denn jetzt? Auf dem Hof vermissen sie dich schon ...
	AI_Output(self, hero, "Info_Mod_Vino_Brennerei_28_08"); //Eigentlich fühle ich mich schon ziemlich erholt ... aber zurück zum Hof kann ich trotzdem nicht.
	AI_Output(self, hero, "Info_Mod_Vino_Brennerei_28_09"); //Bei der Plattform unten krabbeln noch unzählige von diesen ekligen Spinnenbiestern.
	AI_Output(self, hero, "Info_Mod_Vino_Brennerei_28_10"); //Solange die dort sind, setz ich keinen Fuß in die Höhle.

	if (!Npc_KnowsInfo(hero, Info_Mod_Nandor_VinoBrennerei))
	{
		B_LogEntry	(TOPIC_MOD_VINO_WO, "Vino ist in Nandors Lager. Er wurde von kleinen Spinnen angegriffen, wird sich aber bald wieder erholen.");
	};

	B_LogEntry	(TOPIC_MOD_VINO_WO, "Zum Hof kann er jedoch nicht zurück, da bei dem Teleporter in der Höhle immer noch die Spinnen herumwuseln.");

	B_GivePlayerXP	(150);

	// Tür zum Spinnenbau aufschließen

	var int ptr;
	ptr = MEM_SearchVobByName("DOOR_SPINNENBAU_01");

	if (ptr > 0)
	{
		MEM_AssignInst(Platzhalter_Door, ptr);

		Platzhalter_Door._oCMobLockable_bitfield = Platzhalter_Door._oCMobLockable_bitfield & ~ oCMobLockable_bitfield_locked;
	};

	ptr = MEM_SearchVobByName("DOOR_SPINNENBAU_02");

	if (ptr > 0)
	{
		MEM_AssignInst(Platzhalter_Door, ptr);

		Platzhalter_Door._oCMobLockable_bitfield = Platzhalter_Door._oCMobLockable_bitfield & ~ oCMobLockable_bitfield_locked;
	};
};

INSTANCE Info_Mod_Vino_Brennerei2 (C_INFO)
{
	npc		= Mod_912_BAU_Vino_NW;
	nr		= 1;
	condition	= Info_Mod_Vino_Brennerei2_Condition;
	information	= Info_Mod_Vino_Brennerei2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Die Plattform ist sicher.";
};

FUNC INT Info_Mod_Vino_Brennerei2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Vino_Brennerei))
	&& (Mod_Vino_Brennerei == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Vino_Brennerei2_Info()
{
	AI_Output(hero, self, "Info_Mod_Vino_Brennerei2_15_00"); //Die Plattform ist sicher.
	AI_Output(self, hero, "Info_Mod_Vino_Brennerei2_28_01"); //Wirklich? Keine von diesen garstigen Biestern mehr da?
	AI_Output(self, hero, "Info_Mod_Vino_Brennerei2_28_02"); //Na schön, ich werde mal einen Blick riskieren, ob es  auch wirklich ungefährlich ist.

	B_GivePlayerXP	(250);

	B_StartOtherRoutine	(self, "TELEPORT");
};

INSTANCE Info_Mod_Vino_Brennerei3 (C_INFO)
{
	npc		= Mod_912_BAU_Vino_NW;
	nr		= 1;
	condition	= Info_Mod_Vino_Brennerei3_Condition;
	information	= Info_Mod_Vino_Brennerei3_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Vino_Brennerei3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Vino_Brennerei2))
	&& (Npc_GetDistToWP(self, "FARM1") < 10000)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Vino_Brennerei3_Info()
{
	AI_Output(self, hero, "Info_Mod_Vino_Brennerei3_28_00"); //(munter) Ahh, da bist du ja. Hab vielen Dank für deine Hilfe bei der Spinnensache.
	AI_Output(hero, self, "Info_Mod_Vino_Brennerei3_15_01"); //Du bist wieder wohl auf?
	AI_Output(self, hero, "Info_Mod_Vino_Brennerei3_28_02"); //Ja, mir geht es großartig.
	AI_Output(self, hero, "Info_Mod_Vino_Brennerei3_28_03"); //(etwas wehmütig) Tja, nur in die Brennerei setze ich wohl vorerst keinen Fuß mehr, solange sich die Spinnen in den Höhlen und Gängen tummeln.
	AI_Output(self, hero, "Info_Mod_Vino_Brennerei3_28_04"); //(wieder fröhlicher) Wie dem auch sei, hier, als kleines Dankeschön etwas Gold und ein paar meiner guten Kräuterschnäpse.
	AI_Output(self, hero, "Info_Mod_Vino_Brennerei3_28_05"); //Die wirken belebend und machen jeden Kränkelnden rasch wieder munter. Auf dein Wohl.

	B_GivePlayerXP	(200);

	B_GiveInvItems	(self, hero, ItMi_Gold, 60);

	B_SetTopicStatus	(TOPIC_MOD_VINO_WO, LOG_SUCCESS);

	CurrentNQ += 1;
};

INSTANCE Info_Mod_Vino_Brennerei4 (C_INFO)
{
	npc		= Mod_912_BAU_Vino_NW;
	nr		= 1;
	condition	= Info_Mod_Vino_Brennerei4_Condition;
	information	= Info_Mod_Vino_Brennerei4_Info;
	permanent	= 0;
	important	= 0;
	description	= "Von den Spinnen geht keine Gefahr mehr aus.";
};

FUNC INT Info_Mod_Vino_Brennerei4_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Vino_Brennerei3))
	&& (Npc_IsDead(Spider_Queen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Vino_Brennerei4_Info()
{
	AI_Output(hero, self, "Info_Mod_Vino_Brennerei4_15_00"); //Von den Spinnen geht keine Gefahr mehr aus. Ihre Königin war einmal.
	AI_Output(self, hero, "Info_Mod_Vino_Brennerei4_28_01"); //Wirklich? Das sind großartige Neuigkeiten. Dann kann ich meiner Brennerei ja bald wieder einen Besuch abstatten.
	AI_Output(self, hero, "Info_Mod_Vino_Brennerei4_28_02"); //Ich hatte meinen Alchemietisch schon vermisst ...
	AI_Output(self, hero, "Info_Mod_Vino_Brennerei4_28_03"); //Hmm, aber wie kann ich mich nun dafür bedanken? Schnapps habe ich keinen mehr.
	AI_Output(self, hero, "Info_Mod_Vino_Brennerei4_28_04"); //Aber warte ... nimm diesen Ring hier.

	B_GiveInvItems	(self, hero, ItRi_Alchemist, 1);

	AI_Output(self, hero, "Info_Mod_Vino_Brennerei4_28_05"); //Ich fand ihn damals in der Höhle, bevor ich mit dem Brennen anfing.
	AI_Output(self, hero, "Info_Mod_Vino_Brennerei4_28_06"); //Ich hatte den Eindruck, dass er mir dabei half die Grundlagen der Alchemie schnell zu begreifen.
	AI_Output(self, hero, "Info_Mod_Vino_Brennerei4_28_07"); //Na ja, jetzt brauch ich ihn mittlerweile nicht mehr. Vielleicht nützt er dir etwas.

	B_GivePlayerXP	(200);
};

INSTANCE Info_Mod_Vino_Pickpocket (C_INFO)
{
	npc		= Mod_912_BAU_Vino_NW;
	nr		= 1;
	condition	= Info_Mod_Vino_Pickpocket_Condition;
	information	= Info_Mod_Vino_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Vino_Pickpocket_Condition()
{
	C_Beklauen	(34, ItPl_Weed, 4);
};

FUNC VOID Info_Mod_Vino_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Vino_Pickpocket);

	Info_AddChoice	(Info_Mod_Vino_Pickpocket, DIALOG_BACK, Info_Mod_Vino_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Vino_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Vino_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Vino_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Vino_Pickpocket);
};

FUNC VOID Info_Mod_Vino_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Vino_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Vino_Pickpocket);

		Info_AddChoice	(Info_Mod_Vino_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Vino_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Vino_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Vino_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Vino_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Vino_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Vino_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Vino_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Vino_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Vino_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Vino_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Vino_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Vino_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Vino_EXIT (C_INFO)
{
	npc		= Mod_912_BAU_Vino_NW;
	nr		= 1;
	condition	= Info_Mod_Vino_EXIT_Condition;
	information	= Info_Mod_Vino_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Vino_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Vino_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};