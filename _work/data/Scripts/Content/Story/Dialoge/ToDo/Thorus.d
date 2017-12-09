INSTANCE Info_Mod_Thorus_Hi (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Hi_Condition;
	information	= Info_Mod_Thorus_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Thorus_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Thorus_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Thorus_Hi_12_00"); //(stöhnt) Du?! Ich werde auch von nichts verschont!
	AI_Output(hero, self, "Info_Mod_Thorus_Hi_15_01"); //Hallo, Thorus. Du hast es weit gebracht, wie ich sehe.
	AI_Output(self, hero, "Info_Mod_Thorus_Hi_12_02"); //Wie man's nimmt. Innerhalb dieser vier Wände hört jeder auf mich, aber wie es draußen aussieht, weiß ich nicht.
	AI_Output(hero, self, "Info_Mod_Thorus_Hi_15_03"); //Kannst du nicht raus?
	AI_Output(self, hero, "Info_Mod_Thorus_Hi_12_04"); //Klar doch, jederzeit. Wenn ich das Risiko eingehen will, angegriffen oder beschossen zu werden.
	AI_Output(self, hero, "Info_Mod_Thorus_Hi_12_05"); //Und glaub mir, das Risiko ist nicht sehr gering.
};

INSTANCE Info_Mod_Thorus_Schlecht (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Schlecht_Condition;
	information	= Info_Mod_Thorus_Schlecht_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab gehört ihr braucht Hilfe.";
};

FUNC INT Info_Mod_Thorus_Schlecht_Condition()
{
	if ((Npc_KnowsInfo(hero, Info_Mod_Thorus_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Bartholo_Hi)))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_Schlecht_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Schlecht_15_00"); //Ich habe gesehen, dass es euch ziemlich dreckig geht, und will euch helfen. 
	AI_Output(self, hero, "Info_Mod_Thorus_Schlecht_12_01"); //Soso, auf einmal willst du uns helfen? Nun, wir können jeden brauchen. Aber woher wissen wir, ob wir dir vertrauen können?
	AI_Output(self, hero, "Info_Mod_Thorus_Schlecht_12_02"); //Du erinnerst dich doch noch an die Aufnahme zur Zeit der Kolonie.

	Info_ClearChoices	(Info_Mod_Thorus_Schlecht);

	Info_AddChoice	(Info_Mod_Thorus_Schlecht, "Nein.", Info_Mod_Thorus_Schlecht_Nein);
	Info_AddChoice	(Info_Mod_Thorus_Schlecht, "Ja.", Info_Mod_Thorus_Schlecht_Ja);
};

FUNC VOID Info_Mod_Thorus_Schlecht_Nein()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Schlecht_Nein_15_00"); //Nein.
	AI_Output(self, hero, "Info_Mod_Thorus_Schlecht_Nein_12_01"); //Jeder Anwärter muss eine besondere Prüfung bestehen. Diese testet, ob wir dir vertrauen können.

	Info_ClearChoices	(Info_Mod_Thorus_Schlecht);
};

FUNC VOID Info_Mod_Thorus_Schlecht_Ja()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Schlecht_Ja_15_00"); //Ja, du meinst die Prüfung des Vetrauens.
	AI_Output(self, hero, "Info_Mod_Thorus_Schlecht_Ja_12_01"); //Genau.

	Info_ClearChoices	(Info_Mod_Thorus_Schlecht);
};

INSTANCE Info_Mod_Thorus_Pruefung (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Pruefung_Condition;
	information	= Info_Mod_Thorus_Pruefung_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was soll ich für dich tun?";
};

FUNC INT Info_Mod_Thorus_Pruefung_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorus_Schlecht))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_Pruefung_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Pruefung_15_00"); //Was soll ich für dich tun?
	AI_Output(self, hero, "Info_Mod_Thorus_Pruefung_12_01"); //Irgendjemand stiehlt Güter aus dem Haus der Erzbarone, und ich will, dass du denjenigen findest und mir einen Beweis gegen ihn vorlegst.
	AI_Output(hero, self, "Info_Mod_Thorus_Pruefung_15_02"); //Gut, gibt es Informationen über ihn?
	AI_Output(self, hero, "Info_Mod_Thorus_Pruefung_12_03"); //Frag Alissandro, er hat alle Informationen dazu gesammelt.

	Log_CreateTopic	(TOPIC_MOD_PDV, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_PDV, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_PDV, "Irgendwer stiehlt von den Erzbaronen und da ich ja ein Vertrauenszeugnis ablegen muss, habe ich die Ehre, den Schuldigen zu finden. Der Erzbaron Alissandro wird mir die nötigen Informationen geben.");
};

INSTANCE Info_Mod_Thorus_Diebe (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Diebe_Condition;
	information	= Info_Mod_Thorus_Diebe_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich weiß wer die Diebe sind.";
};

FUNC INT Info_Mod_Thorus_Diebe_Condition()
{
	if (Mod_PDV_Fisk_Infos == 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_Diebe_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Diebe_15_00"); //Ich weiß wer die Diebe sind.
	AI_Output(self, hero, "Info_Mod_Thorus_Diebe_12_01"); //Wer?
	AI_Output(hero, self, "Info_Mod_Thorus_Diebe_15_02"); //Bloodwyn stiehlt de Sachen und Cutter steht Schmiere. Aber ich glaube, dass Cutter das nicht ganz freiwillig macht, denn er gab mir einen Hinweis, sie zu entlarven.
	AI_Output(self, hero, "Info_Mod_Thorus_Diebe_12_03"); //Hast du denn auch Beweise?
	AI_Output(hero, self, "Info_Mod_Thorus_Diebe_15_04"); //Nein, der Händler Fisk wollte mir erst Beweise liefern, wenn er von den Dieben sicher ist.
	AI_Output(self, hero, "Info_Mod_Thorus_Diebe_12_05"); //Gut, wir lassen beide festhalten.

	B_LogEntry	(TOPIC_MOD_PDV, "Gut, ich habe sie bei Thorus gemeldet. Er wird sie festhalten, bis ich einen Beweis habe.");

	AI_Teleport	(Mod_943_GRD_Bloodwyn_MT, "OCC_CELLAR_BACK_RIGHT_CELL");
	AI_Teleport	(Mod_1110_GRD_Cutter_MT, "OCC_CELLAR_BACK_LEFT_CELL");

	B_StartOtherRoutine	(Mod_943_GRD_Bloodwyn_MT, "KNAST");
	B_StartOtherRoutine	(Mod_1110_GRD_Cutter_MT, "KNAST");

	AI_UnequipWeapons	(Mod_943_GRD_Bloodwyn_MT);

	Npc_RemoveInvItems	(Mod_943_GRD_Bloodwyn_MT, ItMw_Sturmbringer, 1);
};

INSTANCE Info_Mod_Thorus_Zettel (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Zettel_Condition;
	information	= Info_Mod_Thorus_Zettel_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich habe deine Beweise.";
};

FUNC INT Info_Mod_Thorus_Zettel_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Fisk_Zettel))
	&& (Npc_HasItems(hero, ItWr_FisksNotiz) == 1)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_Zettel_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Zettel_15_00"); //Ich habe deine Beweise.
	
	B_GiveInvItems	(hero, self, ItWr_FisksNotiz, 1);

	B_UseFakeScroll();

	AI_Output(self, hero, "Info_Mod_Thorus_Zettel_12_01"); //Gut, Bloodwyn und Cutter sitzen im Kerker. Wir hoffen, wir werde erfahren, wer ihre Kontaktpersonen sind.

	if (Mod_AnzahlNebengilden < MaxNebengilden)
	&& (Banditen_Dabei == FALSE)
	&& (hero.guild != GIL_MIL)
	&& (KG_Dabei == FALSE)
	{
		AI_Output(self, hero, "Info_Mod_Thorus_Zettel_12_02"); //Tja, jetzt ist ja mehr als ein Platz bei den Gardisten für dich freigeworden. Wenn du willst, kannst du uns beitreten.

		B_LogEntry	(TOPIC_MOD_PDV, "Thorus hat Cutter und Bloodwyn eingebuchtet. Ich kann jetzt Gardist werden.");

		B_Göttergefallen(2, 1);
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Thorus_Zettel_12_03"); //Leider können wir dich nicht mehr aufnehmen.
	};

	B_SetTopicStatus	(TOPIC_MOD_PDV, LOG_SUCCESS);

	B_GivePlayerXP	(400);

	B_Göttergefallen(2, 1);
};

INSTANCE Info_Mod_Thorus_Aufnahme (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Aufnahme_Condition;
	information	= Info_Mod_Thorus_Aufnahme_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich will Gardist werden.";
};

FUNC INT Info_Mod_Thorus_Aufnahme_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorus_Zettel))
	&& (Mod_AnzahlNebengilden < MaxNebengilden)
	&& (Banditen_Dabei == FALSE)
	&& (hero.guild != GIL_MIL)
	&& (KG_Dabei == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_Aufnahme_Info()
{
	Spine_UnlockAchievement(SPINE_ACHIEVEMENT_54);
	Spine_UnlockAchievement(SPINE_ACHIEVEMENT_65);
	
	AI_Output(hero, self, "Info_Mod_Thorus_Aufnahme_15_00"); //Ich will Gardist werden.
	AI_Output(self, hero, "Info_Mod_Thorus_Aufnahme_12_01"); //Dann willkommen bei der Garde. Hier hast du deine Rüstung.

	Log_CreateTopic	(TOPIC_MOD_NEBENGILDEN, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_NEBENGILDEN, "Thorus hat mich bei den Gardisten des alten Lagers aufgenommen.");

	CreateInvItems	(self, GRD_ARMOR_L, 1);
	B_GiveInvItems	(self, hero, GRD_ARMOR_L, 1);

	Gardist_Dabei = TRUE;

	Mod_AnzahlNebengilden += 1;

	B_Göttergefallen(2, 1);
};

INSTANCE Info_Mod_Thorus_Arena (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Arena_Condition;
	information	= Info_Mod_Thorus_Arena_Info;
	permanent	= 0;
	important	= 0;
	description	= "Hast du etwas zu tun für mich?";
};

FUNC INT Info_Mod_Thorus_Arena_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorus_Zettel))
	&& (Gardist_Dabei == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_Arena_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Arena_15_00"); //Hast du etwas zu tun für mich?
	AI_Output(self, hero, "Info_Mod_Thorus_Arena_12_01"); //Ja, es gibt Probleme in der Arena. Ich kann es zwar nicht beweisen, aber einer der Kämpfer kämpft mit unfairen Mitteln.
	AI_Output(hero, self, "Info_Mod_Thorus_Arena_15_02"); //Was ist denn los mit ihm?
	AI_Output(self, hero, "Info_Mod_Thorus_Arena_12_03"); //Seit Tagen hat ihn keiner mehr besiegt, und das, obwohl er nicht sehr geschickt kämpft. Ich will, dass du dir das mal ansiehst.
	AI_Output(hero, self, "Info_Mod_Thorus_Arena_15_04"); //Gut.
	AI_Output(self, hero, "Info_Mod_Thorus_Arena_12_05"); //Gleich findet einer seiner Kämpfe statt. Das solltest du dir vielleicht ansehen.

	Log_CreateTopic	(TOPIC_MOD_AL_ARENA, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_AL_ARENA, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_AL_ARENA, "Thorus meinte, ein Unbekannter, der in der Arena kämpft, wurde trotz seiner Ungeschicklichkeit seit Tagen nicht mehr besiegt. Ich glaube, dass sehe ich mir mal an.");

	B_StartOtherRoutine	(Mod_962_STT_Scatty_MT,	"ARENAFIGHT");
	B_StartOtherRoutine	(Mod_1871_TPL_GorKaranto_MT, "ARENAFIGHT");
	B_StartOtherRoutine	(Mod_1872_NONE_Unbekannt_MT, "ARENAFIGHT");
};

INSTANCE Info_Mod_Thorus_Verloren (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Verloren_Condition;
	information	= Info_Mod_Thorus_Verloren_Info;
	permanent	= 0;
	important	= 0;
	description	= "Beim Kampf mit dem Unbekannten ...";
};

FUNC INT Info_Mod_Thorus_Verloren_Condition()
{
	if (Mod_GorKarantoSchwach == 5)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_Verloren_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Verloren_15_00"); //Beim Kampf mit dem Unbekannte wurde ich plötzlich schwächer, obwohl er mich nicht angegriffen hat.
	AI_Output(self, hero, "Info_Mod_Thorus_Verloren_12_01"); //Und was hilft uns das? Ich würde sagen, du beobachtest den Kerl etwas, und wenn er sich verdächtig macht, gehst du ihm auf den Grund.

	B_LogEntry	(TOPIC_MOD_AL_ARENA, "Thorus hat es nicht gerade weitergeholfen.");

	B_StartOtherRoutine	(Mod_1870_EBR_Alissandro_MT, "UNBEKANNTER");

	Mob_CreateItems	("TRUHE_MT_100", ItSc_Schwaechen, 15);
	Mob_CreateItems	("TRUHE_MT_100", ItWr_DraganNachricht, 1);
};

INSTANCE Info_Mod_Thorus_Botschaft (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Botschaft_Condition;
	information	= Info_Mod_Thorus_Botschaft_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ich hab Informationen gefunden.";
};

FUNC INT Info_Mod_Thorus_Botschaft_Condition()
{
	if (Mod_GorKarantoSchwach == 7)
	&& (Npc_HasItems(hero, ItWr_DraganNachricht) == 1)
	&& (Npc_HasItems(hero, ItSc_Schwaechen) == 15)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_Botschaft_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Botschaft_15_00"); //Hier, diese Spruchrollen und diese Botschaft habe ich in der Hütte des Unbekannten gefunden.

	Npc_RemoveInvItems	(hero, ItWr_DraganNachricht, 1);
	Npc_RemoveInvItems	(hero, ItSc_Schwaechen, 15);
	
	B_ShowGivenThings	("Botschaft und Schwächenspruchrollen gegeben");

	B_UseFakeScroll	();

	AI_Output(self, hero, "Info_Mod_Thorus_Botschaft_12_01"); //Aha, also Paran und Dragan sind es. Hätte ich ihnen nicht zugetraut.
	AI_Output(hero, self, "Info_Mod_Thorus_Botschaft_15_02"); //Wer sind Paran und Dragan?
	AI_Output(self, hero, "Info_Mod_Thorus_Botschaft_12_03"); //Zwei kleine Trickdiebe, die sich vor einiger Zeit im Lager rumtrieben. Sie wollten die Leute im Lager um ihre Habseligkeiten erleichtern. Dann haben die Gardisten es bemerkt und sie verbannt.
	AI_Output(self, hero, "Info_Mod_Thorus_Botschaft_12_04"); //Nun, jetzt wo wir die Spruchrollen haben, kannst du ihn noch mal herausfordern.

	B_LogEntry	(TOPIC_MOD_AL_ARENA, "Thorus sagte, dass es sich bei dem Unbekannten um nichts als einen kleinen Tagedieb handelt. Jetzt werde ich keine Probleme mehr haben, ihn zu besiegen.");
};

INSTANCE Info_Mod_Thorus_ParanWeg (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_ParanWeg_Condition;
	information	= Info_Mod_Thorus_ParanWeg_Info;
	permanent	= 0;
	important	= 0;
	description	= "Paran und Dragan werden keinen Ärger mehr machen.";
};

FUNC INT Info_Mod_Thorus_ParanWeg_Condition()
{
	if (Mod_GorKarantoSchwach > 9)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_ParanWeg_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_ParanWeg_15_00"); //Paran und Dragan werden keinen Ärger mehr machen.
	AI_Output(self, hero, "Info_Mod_Thorus_ParanWeg_12_01"); //Gut, hier, die Spruchrollen kannst du behalten.

	CreateInvItems	(self, ItSc_Schwaechen, 15);
	B_GiveInvItems	(self, hero, ItSc_Schwaechen, 15);

	B_SetTopicStatus	(TOPIC_MOD_AL_ARENA, LOG_SUCCESS);

	B_Göttergefallen(2, 1);

	B_GivePlayerXP	(500);
};

INSTANCE Info_Mod_Thorus_FrischeLuft (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_FrischeLuft_Condition;
	information	= Info_Mod_Thorus_FrischeLuft_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Thorus_FrischeLuft_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorus_ParanWeg))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_FrischeLuft_Info()
{
	AI_Output(self, hero, "Info_Mod_Thorus_FrischeLuft_12_00"); //Ich glaube es wird Zeit, dass du mal frische Luft schnappst. Ich hätte eine Aufgabe für dich.
	AI_Output(hero, self, "Info_Mod_Thorus_FrischeLuft_15_01"); //Um was geht's?
	AI_Output(self, hero, "Info_Mod_Thorus_FrischeLuft_12_02"); //Du wirst in das neue Lager gehen und einen von Lees Offizieren entführen. Sein Name ist Orik.
	AI_Output(hero, self, "Info_Mod_Thorus_FrischeLuft_15_03"); //Was? Es wäre Selbstmord alleine ins neue Lager zu gehen. Und dann auch noch jemanden daraus zu entführen.
	AI_Output(self, hero, "Info_Mod_Thorus_FrischeLuft_12_04"); //Schon gut, Arto wird dich begleiten. Er wird auch die Mission leiten.
	AI_Output(hero, self, "Info_Mod_Thorus_FrischeLuft_15_05"); //Warum wird ausgerechnet er die Mission leiten?
	AI_Output(self, hero, "Info_Mod_Thorus_FrischeLuft_12_06"); //Weil er Erzbaron ist und du Gardist.
	AI_Output(hero, self, "Info_Mod_Thorus_FrischeLuft_15_07"); //Verstehe.
	AI_Output(self, hero, "Info_Mod_Thorus_FrischeLuft_12_08"); //Gut, dann wünsche ich dir viel Glück. Hier ist eine Banditenrüstung. Mit der wird man dich nicht erkennen.

	CreateInvItems	(self, ItAr_BDT_M_01, 1);
	B_GiveInvItems	(self, hero, ItAr_BDT_M_01, 1);

	Log_CreateTopic	(TOPIC_MOD_AL_ORIK, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_AL_ORIK, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_AL_ORIK, "Thorus hat mir den Auftrag gegeben, mit Arto den Söldner Orik zu entführen. Er hat mir zur Tarnung eine Banditenrüstung gegeben.");
};

INSTANCE Info_Mod_Thorus_OrikDabei (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_OrikDabei_Condition;
	information	= Info_Mod_Thorus_OrikDabei_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wir haben Orik.";
};

FUNC INT Info_Mod_Thorus_OrikDabei_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Arto_BeiThorus))
	&& (Npc_GetDistToWP(Mod_1266_SLD_Orik_MT, "OCC_BARONS_DANCE2") < 1000)
	&& (Npc_HasItems(hero, ItAr_BDT_M_01) > 0)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_OrikDabei_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_OrikDabei_15_00"); //Wir haben Orik, aber ich vermute, dass das Neue Lager nicht erfreut sein wird.
	AI_Output(self, hero, "Info_Mod_Thorus_OrikDabei_12_01"); //Ja, ich weiß. Damit war zu rechnen. Aber ich habe die Lage unter Kontrolle. Wir werden, im Falle eines Angriffs, das Lager verschliessen.
	AI_Output(self, hero, "Info_Mod_Thorus_OrikDabei_12_02"); //Hier hast du deine Belohnung.

	CreateInvItems	(hero, ItMi_Gold, 500);
	CreateInvItems	(hero, GRD_ARMOR_M, 1);

	B_ShowGivenThings	("500 Gold und Garderüstung erhalten");

	var C_Item itm;
	
	itm = Npc_GetEquippedArmor(hero);
	if (Hlp_IsItem(itm, ITAR_BDT_M_01) == TRUE)
	{
		AI_UnequipArmor	(hero);

		AI_EquipBestArmor	(hero);
	};

	Mod_OrikAbgeliefert = Wld_GetDay();

	Npc_RemoveInvItems	(hero, ItAr_BDT_M_01, 1);

	B_LogEntry	(TOPIC_MOD_AL_ORIK, "Wir haben Orik Thorus übergeben, allerdings könnte es jetzt Probleme mit dem Neuen Lager geben.");
	B_SetTopicStatus	(TOPIC_MOD_AL_ORIK, LOG_SUCCESS);

	AI_Teleport	(Mod_1266_SLD_Orik_MT, "OCC_CELLAR_FRONT_RIGHT_CELL");
	B_StartOtherRoutine	(Mod_1266_SLD_Orik_MT, "KNAST");

	B_GivePlayerXP	(500);

	B_Göttergefallen(2, 1);
};

INSTANCE Info_Mod_Thorus_Templer (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Templer_Condition;
	information	= Info_Mod_Thorus_Templer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wer ist der Templer?";
};

FUNC INT Info_Mod_Thorus_Templer_Condition()
{
	if (Mod_TemplerBeiThorus == 1)
	&& (Npc_GetDistToWP(self, "OCC_BARONS_DANCE2") < 500)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_Templer_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Templer_15_00"); //Wer ist der Templer?
	AI_Output(self, hero, "Info_Mod_Thorus_Templer_12_01"); //Das ist Gor Na Kosh Er meinte, ein Problem mit Diebstählen in seinem Lager zu haben.
	AI_Output(self, hero, "Info_Mod_Thorus_Templer_12_02"); //Und diese sind den Diebstählen aus unserem Lager erschreckend ähnlich.
	AI_Output(hero, self, "Info_Mod_Thorus_Templer_15_03"); //Gibt es etwas neues davon?
	AI_Output(self, hero, "Info_Mod_Thorus_Templer_12_04"); //Ja, Cutter meinte bei einem Verhör, neue Informationen geben zu können, und du wirst sie entgegen nehmen.

	B_Say	(hero, self, "$WOFINDEICHIHN");

	AI_Output(self, hero, "Info_Mod_Thorus_Templer_12_06"); //Er ist im Kerker, du wirst ihn schon finden. Hier ist der Schlüssel.

	CreateInvItems	(self, DungeonKey, 1);
	B_GiveInvItems	(self, hero, DungeonKey, 1);

	B_KillNpc	(Mod_1110_GRD_Cutter_MT);

	Log_CreateTopic	(TOPIC_MOD_AL_SCHMUGGLER, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_AL_SCHMUGGLER, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_AL_SCHMUGGLER, "Thorus hat mich beauftragt, Informationen von Cutter zu holen. Ich finde ihn im Kerker.");
};

INSTANCE Info_Mod_Thorus_CutterTot (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_CutterTot_Condition;
	information	= Info_Mod_Thorus_CutterTot_Info;
	permanent	= 0;
	important	= 0;
	description	= "Cutter ist tot.";
};

FUNC INT Info_Mod_Thorus_CutterTot_Condition()
{
	if (Mod_TemplerBeiThorus == 2)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_CutterTot_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_CutterTot_15_00"); //Cutter ist tot.
	AI_Output(self, hero, "Info_Mod_Thorus_CutterTot_12_01"); //Verdammt, das macht die Sache natürlich komplizierter.
	AI_Output(hero, self, "Info_Mod_Thorus_CutterTot_15_02"); //Während ich bei ihm im Kerker war hat jemand das Tor geschlossen.
	AI_Output(self, hero, "Info_Mod_Thorus_CutterTot_12_03"); //Anscheinend will man dich loswerden, sei vorsichtig.
	AI_Output(hero, self, "Info_Mod_Thorus_CutterTot_15_04"); //Verstehe, ich werde aufpassen. Gibt es schon weitere Hinweise?
	AI_Output(self, hero, "Info_Mod_Thorus_CutterTot_12_05"); //Nein, ich hatte mir welche von dir erhofft.

	B_LogEntry	(TOPIC_MOD_AL_SCHMUGGLER, "Ich habe Thorus berichtet, dass Cutter tot ist.");

	B_GivePlayerXP	(200);
};

INSTANCE Info_Mod_Thorus_WasLos (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_WasLos_Condition;
	information	= Info_Mod_Thorus_WasLos_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was ist denn los?";
};

FUNC INT Info_Mod_Thorus_WasLos_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorus_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_WasLos_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_WasLos_15_00"); //Was ist denn los?
	AI_Output(self, hero, "Info_Mod_Thorus_WasLos_12_01"); //Och, einige Gardisten und Buddler sind immer noch sauer, dass ich nach Gomez' Verschwinden die Sache in die Hand genommen habe.
	AI_Output(self, hero, "Info_Mod_Thorus_WasLos_12_02"); //Scorpio und die treuesten Anhänger sind zwar jetzt abgehauen, aber er hat hier noch immer genug gewaltbereite Sympathisanten, die lieber ihn als neues Oberhaupt gesehen hätten.
};

INSTANCE Info_Mod_Thorus_Ian (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Ian_Condition;
	information	= Info_Mod_Thorus_Ian_Info;
	permanent	= 0;
	important	= 0;
	description	= "Ian hat mir die Sache von der Alten Mine erzählt.";
};

FUNC INT Info_Mod_Thorus_Ian_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorus_Hi))
	&& (Npc_KnowsInfo(hero, Info_Mod_Ian_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_Ian_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Ian_15_00"); //Ian hat mir die Sache von der Alten Mine erzählt.
	AI_Output(self, hero, "Info_Mod_Thorus_Ian_12_01"); //Ja, und? Erwartest du jetzt auch, dass ich das ganze Lager unbewacht zurücklasse und Kopf und Kragen riskiere, um etwas zurückzugewinnen, mit dem wir derzeit nichts anfangen können?
	AI_Output(self, hero, "Info_Mod_Thorus_Ian_12_02"); //Wir haben nach dem Verlust etlicher guter Männer keine Kapazitäten, den Lagerbetrieb und die Minenarbeit gleichzeitig aufrecht zu erhalten und zu kontrollieren!
};

INSTANCE Info_Mod_Thorus_Erzbaron (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Erzbaron_Condition;
	information	= Info_Mod_Thorus_Erzbaron_Info;
	permanent	= 0;
	important	= 0;
	description	= "Warum bist du Erzbaron?";
};

FUNC INT Info_Mod_Thorus_Erzbaron_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorus_Schlecht))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_Erzbaron_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Erzbaron_15_00"); //Warum bist du Erzbaron?
	AI_Output(self, hero, "Info_Mod_Thorus_Erzbaron_12_01"); //Gomez ist fort. Wir gehen davon aus, dass er tot ist, aber sein Leichnam wurde nie gefunden.
	AI_Output(self, hero, "Info_Mod_Thorus_Erzbaron_12_02"); //Scar und Raven sind ebenfalls über Nacht verschwunden, und keiner weiß, ob sie Schiss gekriegt haben oder diskret um die Ecke gebracht wurden.
	AI_Output(self, hero, "Info_Mod_Thorus_Erzbaron_12_03"); //Für kurze Zeit war es Bartholo, aber der war nicht fähig, länger als eine Woche das Lager zu leiten und hat wieder sein altes Amt als Verwalter eingenommen.
	AI_Output(self, hero, "Info_Mod_Thorus_Erzbaron_12_04"); //Arto hat auf das Amt dankend verzichtet. Nun hatten wir ein Problem, aber auf Grund einer internen Entscheidung wurde ich Erzbaron.
	AI_Output(hero, self, "Info_Mod_Thorus_Erzbaron_15_05"); //Verstehe.

	if (!Npc_KnowsInfo(hero, Info_Mod_Thorus_Erzbaron))
	{
		B_LogEntry	(TOPIC_MOD_ALTESLAGER, "Thorus hat also Gomez' Platz eingenommen und er gab sich ziemlich wohlwollend. Naja, die können froh sein, Gomez' losgeworden zu sein. Raven und Scar sind auch abgehauen.");
	};
};

var int Thorus_LastPetzCounter;
var int Thorus_LastPetzCrime;

INSTANCE Info_Mod_Thorus_PMSchulden (C_INFO)
{
	npc         	= Mod_966_GRD_Thorus_MT;
	nr          	= 1;
	condition   	= Info_Mod_Thorus_PMSchulden_Condition;
	information 	= Info_Mod_Thorus_PMSchulden_Info;
	permanent   	= 1;
	important 	= 1; 
};

FUNC INT Info_Mod_Thorus_PMSchulden_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Thorus_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Thorus_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Thorus_PMSchulden_Info()
{
	AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_00"); //Bist du gekommen, um deine Strafe zu zahlen?

	if (B_GetTotalPetzCounter(self) > Thorus_LastPetzCounter)
	{
		AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_01"); //Ich hatte mich schon gefragt, ob du es überhaupt noch wagst, hierher zu kommen!
		AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_02"); //Anscheinend ist es nicht bei den letzten Anschuldigungen geblieben!

		if (Thorus_Schulden < 1000)
		{
			AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_03"); //Ich hatte dich gewarnt! Die Strafe, die du jetzt zahlen musst, ist höher!
			AI_Output (hero, self, "Info_Mod_Thorus_PMAdd_15_00"); //Wieviel?
			
			var int diff; diff = (B_GetTotalPetzCounter(self) - Thorus_LastPetzCounter);
		
			if (diff > 0)
			{
				Thorus_Schulden = Thorus_Schulden + (diff * 50);
			};
		
			if (Thorus_Schulden > 1000)	{	Thorus_Schulden = 1000;	};
		
			B_Say_Gold (self, hero, Thorus_Schulden);
		}
		else
		{
			AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_04"); //Du hast mich schwer enttäuscht!
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Thorus_LastPetzCrime)
	{
		AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_05"); //Es haben sich einige neue Dinge ergeben.
		
		if (Thorus_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_06"); //Plötzlich gibt es niemanden mehr, der dich des Mordes bezichtigt.
		};
		
		if (Thorus_LastPetzCrime == CRIME_THEFT)
		|| ( (Thorus_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT) )
		{
			AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_07"); //Niemand erinnert sich mehr, dich bei einem Diebstahl gesehen zu haben.
		};
		
		if (Thorus_LastPetzCrime == CRIME_ATTACK)
		|| ( (Thorus_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) )
		{
			AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_08"); //Es gibt keine Zeugen mehr dafür, dass du jemals in eine Schlägerei verwickelt warst.
		};
		
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_09"); //Anscheinend haben sich alle Anklagen gegen dich in Wohlgefallen aufgelöst.
		};
		
		AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_10"); //Ich weiß nicht, was da gelaufen ist, aber ich warne dich: Spiel keine Spielchen mit mir.
				
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_11"); //Ich habe mich jedenfalls entschieden, dir deine Schulden zu erlassen.
			AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_12"); //Sieh zu, dass du nicht wieder in Schwierigkeiten kommst.
	
			Thorus_Schulden			= 0;
			Thorus_LastPetzCounter 	= 0;
			Thorus_LastPetzCrime		= CRIME_NONE;
		}
		else
		{
			AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_13"); //Damit eins klar ist: Deine Strafe musst du trotzdem in voller Höhe zahlen.
			B_Say_Gold (self, hero, Thorus_Schulden);
			AI_Output (self, hero, "Info_Mod_Thorus_PMSchulden_12_14"); //Also, was ist?
		};
	};
	
	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices  	(Info_Mod_Thorus_PMSchulden);
		Info_ClearChoices  	(Info_Mod_Thorus_PETZMASTER);
		Info_AddChoice		(Info_Mod_Thorus_PMSchulden,"Ich habe nicht genug Gold!",Info_Mod_Thorus_PETZMASTER_PayLater);
		Info_AddChoice		(Info_Mod_Thorus_PMSchulden,"Wieviel war es nochmal?",Info_Mod_Thorus_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(hero, itmi_gold) >= Thorus_Schulden)
		{
			Info_AddChoice 	(Info_Mod_Thorus_PMSchulden,"Ich will die Strafe zahlen.",Info_Mod_Thorus_PETZMASTER_PayNow);
		};
	};
};

func void Info_Mod_Thorus_PMSchulden_HowMuchAgain()
{
	AI_Output (hero, self, "Info_Mod_Thorus_PMSchulden_HowMuchAgain_15_00"); //Wie viel war es noch mal?
	B_Say_Gold (self, hero, Thorus_Schulden);

	Info_ClearChoices  	(Info_Mod_Thorus_PMSchulden);
	Info_ClearChoices  	(Info_Mod_Thorus_PETZMASTER);
	Info_AddChoice		(Info_Mod_Thorus_PMSchulden,"Ich habe nicht genug Gold!",Info_Mod_Thorus_PETZMASTER_PayLater);
	Info_AddChoice		(Info_Mod_Thorus_PMSchulden,"Wieviel war es nochmal?",Info_Mod_Thorus_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(hero, itmi_gold) >= Thorus_Schulden)
	{
		Info_AddChoice 	(Info_Mod_Thorus_PMSchulden,"Ich will die Strafe zahlen.",Info_Mod_Thorus_PETZMASTER_PayNow);
	};
};

INSTANCE Info_Mod_Thorus_PETZMASTER   (C_INFO)
{
	npc         	= Mod_966_GRD_Thorus_MT;
	nr          	= 1;
	condition   	= Info_Mod_Thorus_PETZMASTER_Condition;
	information 	= Info_Mod_Thorus_PETZMASTER_Info;
	permanent   	= 1;
	important	= 1;
};

FUNC INT Info_Mod_Thorus_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Thorus_LastPetzCrime)
	{
		return TRUE;
	};
};

FUNC VOID Info_Mod_Thorus_PETZMASTER_Info()
{
	Thorus_Schulden = 0; //weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...	
	
	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER) 
	{
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_01"); //Gut, dass du zu mir kommst, bevor alles noch schlimmer für dich wird.
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_02"); //Mord ist ein schweres Vergehen!

		Thorus_Schulden = (B_GetTotalPetzCounter(self) * 50); 		//Anzahl der Zeugen * 50

		Thorus_Schulden = Thorus_Schulden + 500;						//PLUS Mörder-Malus

		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_03"); //Ganz zu schweigen von den anderen Sachen, die du angerichtet hast.
		};

		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_04"); //Die Wachen haben Befehl, jeden Mörder auf der Stelle zu richten.
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_05"); //Und auch die meisten Schatten werden einen Mörder im Lager nicht dulden!
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_06"); //Ich habe kein Interesse daran, dich an den Galgen zu bringen. Wir sind im Krieg und wir brauchen jeden Mann.
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_07"); //Aber es wird nicht leicht sein, die Leute wieder gnädig zu stimmen.
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_08"); //Du könntest deine Reue zeigen, indem du eine Strafe zahlst - natürlich muss die Strafe angemessen hoch sein.
	};
		
	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT) 
	{
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_09"); //Gut, dass du kommst! Du wirst des Diebstahls bezichtigt! Es gibt Zeugen!

		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_10"); //Von den anderen Dingen, die mir zu Ohren gekommen sind, will ich gar nicht erst reden.
		};

		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_11"); //Ich werde so ein Verhalten im Lager nicht dulden!
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_12"); //Du wirst eine Strafe zahlen müssen, um dein Verbrechen wieder gutzumachen!
		
		Thorus_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_13"); //Wenn du dich mit den Buddlers herumprügelst, ist das eine Sache ...
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_14"); //Aber wenn du Schatten oder Gardisten angreifst, muss ich dich zur Rechenschaft ziehen.

		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_15"); //Und die Sache mit den Schafen musste wohl auch nicht sein.
		};

		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_16"); //Wenn ich dir das durchgehen lasse, macht hier bald jeder, was er will.
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_17"); //Also wirst du eine angemessene Strafe zahlen - und die Sache ist vergessen.
		
		Thorus_Schulden = (B_GetTotalPetzCounter(self) * 50); //Anzahl der Zeugen * 50
	};
	
	// ------ Schaf getötet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER) 
	{
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_18"); //Mir ist zu Ohren gekommen, du hättest dich an unseren Schafen vergriffen.
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_19"); //Dir ist klar, dass ich das nicht durchgehen lassen kann.
		AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_12_20"); //Du wirst eine Entschädigung zahlen müssen!
		
		Thorus_Schulden = 100;
	};
	
	AI_Output (hero, self, "Info_Mod_Thorus_PETZMASTER_15_21"); //Wie viel?
	
	if (Thorus_Schulden > 1000)	{	Thorus_Schulden = 1000;	};
		
	B_Say_Gold (self, hero, Thorus_Schulden);
	
	Info_ClearChoices  	(Info_Mod_Thorus_PMSchulden);
	Info_ClearChoices  	(Info_Mod_Thorus_PETZMASTER);
	Info_AddChoice		(Info_Mod_Thorus_PETZMASTER,"Ich habe nicht genug Gold!",Info_Mod_Thorus_PETZMASTER_PayLater);
	if (Npc_HasItems(hero, itmi_gold) >= Thorus_Schulden)
	{
		Info_AddChoice 	(Info_Mod_Thorus_PETZMASTER,"Ich will die Strafe zahlen.",Info_Mod_Thorus_PETZMASTER_PayNow);
	};
};

func void Info_Mod_Thorus_PETZMASTER_PayNow()
{
	AI_Output (hero, self, "Info_Mod_Thorus_PETZMASTER_PayNow_15_00"); //Ich will die Strafe zahlen!
	B_GiveInvItems (hero, self, itmi_gold, Thorus_Schulden);
	AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_PayNow_12_01"); //Gut! Ich werde dafür sorgen, dass es jeder im Lager erfährt - damit wäre dein Ruf einigermaßen wiederhergestellt.

	B_GrantAbsolution (LOC_OLDCAMP);
	
	Thorus_Schulden			= 0;
	Thorus_LastPetzCounter 	= 0;
	Thorus_LastPetzCrime		= CRIME_NONE;
	
	Info_ClearChoices  	(Info_Mod_Thorus_PETZMASTER);
	Info_ClearChoices  	(Info_Mod_Thorus_PMSchulden);	//!!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void Info_Mod_Thorus_PETZMASTER_PayLater()
{
	AI_Output (hero, self, "Info_Mod_Thorus_PETZMASTER_PayLater_15_00"); //Ich habe nicht genug Gold!
	AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_PayLater_12_01"); //Dann sieh zu, dass du das Gold so schnell wie möglich beschaffst.
	AI_Output (self, hero, "Info_Mod_Thorus_PETZMASTER_PayLater_12_02"); //Und ich warne dich: Wenn du dir noch was zu schulden kommen lässt, wird die Sache noch schlimmer für dich!
	
	Thorus_LastPetzCounter 	= B_GetTotalPetzCounter(self);
	Thorus_LastPetzCrime		= B_GetGreatestPetzCrime(self);
	
	AI_StopProcessInfos (self);
};

INSTANCE Info_Mod_Thorus_Lehrer (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Lehrer_Condition;
	information	= Info_Mod_Thorus_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kann ich von dir lernen?";
};

FUNC INT Info_Mod_Thorus_Lehrer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorus_Hi))
	&& ((Schatten_Dabei == TRUE)
	|| (Gardist_Dabei == TRUE)
	|| (Erzbaron_Dabei == TRUE))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_Lehrer_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Lehrer_15_00"); //Kann ich von dir lernen?
	AI_Output(self, hero, "Info_Mod_Thorus_Lehrer_12_01"); //Da du einer von uns bist werde ich dir beibringen wie du stärker und geschickter wirst.

	Log_CreateTopic	(TOPIC_MOD_LEHRER_OLDCAMP, LOG_NOTE);
	B_LogEntry	(TOPIC_MOD_LEHRER_OLDCAMP, "Thorus kann mir beibringen stärker und geschickter zu werden.");
};

INSTANCE Info_Mod_Thorus_Lernen (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Lernen_Condition;
	information	= Info_Mod_Thorus_Lernen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Bring mir was bei.";
};

FUNC INT Info_Mod_Thorus_Lernen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Thorus_Lehrer))
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Thorus_Lernen_Info()
{
	AI_Output(hero, self, "Info_Mod_Thorus_Lernen_15_00"); //Bring mir was bei.

	Info_ClearChoices	(Info_Mod_Thorus_Lernen);

	Info_AddChoice	(Info_Mod_Thorus_Lernen, DIALOG_BACK, Info_Mod_Thorus_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnDEX5, B_GetLearnCostAttribute_New(hero, ATR_DEXTERITY), ATR_DEXTERITY), Info_Mod_Thorus_Lernen_DEX_5);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnDEX1, B_GetLearnCostAttribute(hero, ATR_DEXTERITY), ATR_DEXTERITY), Info_Mod_Thorus_Lernen_DEX_1);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Thorus_Lernen_STR_5);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Thorus_Lernen_STR_1);
};

FUNC VOID Info_Mod_Thorus_Lernen_BACK()
{
	Info_ClearChoices	(Info_Mod_Thorus_Lernen);
};

FUNC VOID Info_Mod_Thorus_Lernen_DEX_5()
{
	B_TeachAttributePoints_New	(self, hero, ATR_DEXTERITY, 5, 200);

	Info_ClearChoices	(Info_Mod_Thorus_Lernen);

	Info_AddChoice	(Info_Mod_Thorus_Lernen, DIALOG_BACK, Info_Mod_Thorus_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnDEX5, B_GetLearnCostAttribute_New(hero, ATR_DEXTERITY), ATR_DEXTERITY), Info_Mod_Thorus_Lernen_DEX_5);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnDEX1, B_GetLearnCostAttribute(hero, ATR_DEXTERITY), ATR_DEXTERITY), Info_Mod_Thorus_Lernen_DEX_1);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Thorus_Lernen_STR_5);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Thorus_Lernen_STR_1);
};

FUNC VOID Info_Mod_Thorus_Lernen_DEX_1()
{
	B_TeachAttributePoints	(self, hero, ATR_DEXTERITY, 1, 200);

	Info_ClearChoices	(Info_Mod_Thorus_Lernen);

	Info_AddChoice	(Info_Mod_Thorus_Lernen, DIALOG_BACK, Info_Mod_Thorus_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnDEX5, B_GetLearnCostAttribute_New(hero, ATR_DEXTERITY), ATR_DEXTERITY), Info_Mod_Thorus_Lernen_DEX_5);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnDEX1, B_GetLearnCostAttribute(hero, ATR_DEXTERITY), ATR_DEXTERITY), Info_Mod_Thorus_Lernen_DEX_1);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Thorus_Lernen_STR_5);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Thorus_Lernen_STR_1);
};

FUNC VOID Info_Mod_Thorus_Lernen_STR_5()
{
	B_TeachAttributePoints_New	(self, hero, ATR_STRENGTH, 5, 200);

	Info_ClearChoices	(Info_Mod_Thorus_Lernen);

	Info_AddChoice	(Info_Mod_Thorus_Lernen, DIALOG_BACK, Info_Mod_Thorus_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnDEX5, B_GetLearnCostAttribute_New(hero, ATR_DEXTERITY), ATR_DEXTERITY), Info_Mod_Thorus_Lernen_DEX_5);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnDEX1, B_GetLearnCostAttribute(hero, ATR_DEXTERITY), ATR_DEXTERITY), Info_Mod_Thorus_Lernen_DEX_1);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Thorus_Lernen_STR_5);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Thorus_Lernen_STR_1);
};

FUNC VOID Info_Mod_Thorus_Lernen_STR_1()
{
	B_TeachAttributePoints	(self, hero, ATR_STRENGTH, 1, 200);

	Info_ClearChoices	(Info_Mod_Thorus_Lernen);

	Info_AddChoice	(Info_Mod_Thorus_Lernen, DIALOG_BACK, Info_Mod_Thorus_Lernen_BACK);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnDEX5, B_GetLearnCostAttribute_New(hero, ATR_DEXTERITY), ATR_DEXTERITY), Info_Mod_Thorus_Lernen_DEX_5);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnDEX1, B_GetLearnCostAttribute(hero, ATR_DEXTERITY), ATR_DEXTERITY), Info_Mod_Thorus_Lernen_DEX_1);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnSTR5, B_GetLearnCostAttribute_New(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Thorus_Lernen_STR_5);
	Info_AddChoice	(Info_Mod_Thorus_Lernen, B_BuildLearnString_New(PRINT_LearnSTR1, B_GetLearnCostAttribute(hero, ATR_STRENGTH), ATR_STRENGTH), Info_Mod_Thorus_Lernen_STR_1);
};

INSTANCE Info_Mod_Thorus_Pickpocket (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_Pickpocket_Condition;
	information	= Info_Mod_Thorus_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_150;
};

FUNC INT Info_Mod_Thorus_Pickpocket_Condition()
{
	C_Beklauen	(130, ItMi_Gold, 67);
};

FUNC VOID Info_Mod_Thorus_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Thorus_Pickpocket);

	Info_AddChoice	(Info_Mod_Thorus_Pickpocket, DIALOG_BACK, Info_Mod_Thorus_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Thorus_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Thorus_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Thorus_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Thorus_Pickpocket);
};

FUNC VOID Info_Mod_Thorus_Pickpocket_DoIt()
{
	if (B_Beklauen() == TRUE)
	{
		Info_ClearChoices	(Info_Mod_Thorus_Pickpocket);
	}
	else
	{
		Info_ClearChoices	(Info_Mod_Thorus_Pickpocket);

		Info_AddChoice	(Info_Mod_Thorus_Pickpocket, DIALOG_PP_BESCHIMPFEN, Info_Mod_Thorus_Pickpocket_Beschimpfen);
		Info_AddChoice	(Info_Mod_Thorus_Pickpocket, DIALOG_PP_BESTECHUNG, Info_Mod_Thorus_Pickpocket_Bestechung);
		Info_AddChoice	(Info_Mod_Thorus_Pickpocket, DIALOG_PP_HERAUSREDEN, Info_Mod_Thorus_Pickpocket_Herausreden);
	};
};

FUNC VOID Info_Mod_Thorus_Pickpocket_Beschimpfen()
{
	B_Say	(hero, self, "$PICKPOCKET_BESCHIMPFEN");
	B_Say	(self, hero, "$DIRTYTHIEF");

	Info_ClearChoices	(Info_Mod_Thorus_Pickpocket);

	AI_StopProcessInfos	(self);

	B_Attack (self, hero, AR_Theft, 1);
};

FUNC VOID Info_Mod_Thorus_Pickpocket_Bestechung()
{
	B_Say	(hero, self, "$PICKPOCKET_BESTECHUNG");

	var int rnd; rnd = r_max(99);

	if (rnd < 25)
	|| ((rnd >= 25) && (rnd < 50) && (Npc_HasItems(hero, ItMi_Gold) < 50))
	|| ((rnd >= 50) && (rnd < 75) && (Npc_HasItems(hero, ItMi_Gold) < 100))
	|| ((rnd >= 75) && (rnd < 100) && (Npc_HasItems(hero, ItMi_Gold) < 200))
	{
		B_Say	(self, hero, "$DIRTYTHIEF");

		Info_ClearChoices	(Info_Mod_Thorus_Pickpocket);

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

		Info_ClearChoices	(Info_Mod_Thorus_Pickpocket);

		AI_StopProcessInfos	(self);
	};
};

FUNC VOID Info_Mod_Thorus_Pickpocket_Herausreden()
{
	B_Say	(hero, self, "$PICKPOCKET_HERAUSREDEN");

	if (r_max(99) < Mod_Verhandlungsgeschick)
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_01");

		Info_ClearChoices	(Info_Mod_Thorus_Pickpocket);
	}
	else
	{
		B_Say	(self, hero, "$PICKPOCKET_HERAUSREDEN_02");
	};
};

INSTANCE Info_Mod_Thorus_EXIT (C_INFO)
{
	npc		= Mod_966_GRD_Thorus_MT;
	nr		= 1;
	condition	= Info_Mod_Thorus_EXIT_Condition;
	information	= Info_Mod_Thorus_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Thorus_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Thorus_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};