INSTANCE Info_Mod_Cavalorn_Hi (C_INFO)
{
	npc		= Mod_512_RDW_Cavalorn_NW;
	nr		= 1;
	condition	= Info_Mod_Cavalorn_Hi_Condition;
	information	= Info_Mod_Cavalorn_Hi_Info;
	permanent	= 0;
	important	= 1;
};

FUNC INT Info_Mod_Cavalorn_Hi_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Cavalorn_Hi_Info()
{
	AI_Output(self, hero, "Info_Mod_Cavalorn_Hi_08_00"); //Verdammt, erst gestern habe ich diese Goblins erschlagen. Und nun erheben sich ihre Überreste mir nichts, dir nichts zu neuem Leben und greifen mich an.
	AI_Output(self, hero, "Info_Mod_Cavalorn_Hi_08_01"); //Als ob die Banditen noch nicht genug wären ... aber warte mal. Du lebst noch?
	AI_Output(hero, self, "Info_Mod_Cavalorn_Hi_15_02"); //Wieder wäre der passende Ausdruck. Was machst du hier?
	AI_Output(self, hero, "Info_Mod_Cavalorn_Hi_08_03"); //Das ist mein Beobachtungsposten. Ich bin im Auftrag der Wassermagier hier.
};

INSTANCE Info_Mod_Cavalorn_WhyForWassermagier (C_INFO)
{
	npc		= Mod_512_RDW_Cavalorn_NW;
	nr		= 1;
	condition	= Info_Mod_Cavalorn_WhyForWassermagier_Condition;
	information	= Info_Mod_Cavalorn_WhyForWassermagier_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was beobachtest du genau im Auftrag der Wassermagier?";
};

FUNC INT Info_Mod_Cavalorn_WhyForWassermagier_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cavalorn_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cavalorn_WhyForWassermagier_Info()
{
	AI_Output(hero, self, "Info_Mod_Cavalorn_WhyForWassermagier_15_00"); //Was beobachtest du genau im Auftrag der Wassermagier?
	AI_Output(self, hero, "Info_Mod_Cavalorn_WhyForWassermagier_08_01"); //Äh, dazu kann ich dir noch nicht so viel sagen. In den letzten Tagen und Wochen haben sich sonderbare Dinge ereignet.
	AI_Output(hero, self, "Info_Mod_Cavalorn_WhyForWassermagier_15_02"); //Was du nicht sagst.
	AI_Output(self, hero, "Info_Mod_Cavalorn_WhyForWassermagier_08_03"); //Ich meine nach dem Fall der Barriere.
};

INSTANCE Info_Mod_Cavalorn_WasLos (C_INFO)
{
	npc		= Mod_512_RDW_Cavalorn_NW;
	nr		= 1;
	condition	= Info_Mod_Cavalorn_WasLos_Condition;
	information	= Info_Mod_Cavalorn_WasLos_Info;
	permanent	= 0;
	important	= 0;
	description	= "Jetzt erzähl doch einfach mal, was los ist.";
};

FUNC INT Info_Mod_Cavalorn_WasLos_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cavalorn_WhyForWassermagier))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cavalorn_WasLos_Info()
{
	AI_Output(hero, self, "Info_Mod_Cavalorn_WasLos_15_00"); //Jetzt erzähl doch einfach mal, was los ist.
	AI_Output(self, hero, "Info_Mod_Cavalorn_WasLos_08_01"); //Also, ich bin mittlerweile Mitglied bei den Wassernovizen. Frag nicht, warum.
	AI_Output(hero, self, "Info_Mod_Cavalorn_WasLos_15_02"); //Warum?
	AI_Output(self, hero, "Info_Mod_Cavalorn_WasLos_08_03"); //Ach, ich bin nach dem Fall der Barriere nach Khorinis gekommen und hatte natürlich nichts zu tun.
	AI_Output(self, hero, "Info_Mod_Cavalorn_WasLos_08_04"); //Deshalb hab ich mich zu diesem Vatras gestellt, der dauernd in der Stadt predigt.
	AI_Output(self, hero, "Info_Mod_Cavalorn_WasLos_08_05"); //Und irgendwann hat er mich beiseite genommen und mich ausgefragt, woher ich komme und so und ob ich schon wüsste, was ich jetzt tun wolle.
	AI_Output(self, hero, "Info_Mod_Cavalorn_WasLos_08_06"); //Ende vom Lied war, dass er mich gefragt hat, ob ich nicht seinem Verein beitreten wollte, und weil ich nichts Besseres zu tun hatte, hab ich ja gesagt.
	AI_Output(self, hero, "Info_Mod_Cavalorn_WasLos_08_07"); //Na ja, jedenfalls fing das damals an mit den Entführungen. Es verschwanden einfach immer mal wieder Leute aus Khorinis. Meistens aus dem Hafenviertel, und dann kümmerte sich niemand drum.
	AI_Output(self, hero, "Info_Mod_Cavalorn_WasLos_08_08"); //Ab und zu wurden vorher oder nachher dunkle Gestalten in den Seitengassen gesehen.
	AI_Output(self, hero, "Info_Mod_Cavalorn_WasLos_08_09"); //Und weil die Stadtwache nichts gemacht hat, hat Vatras entschieden, dass wir das jetzt mal rausfinden sollten, was da genau vor sich geht.
	AI_Output(self, hero, "Info_Mod_Cavalorn_WasLos_08_10"); //Und deswegen sitze ich hier und versuche herauszufinden, ob die Banditenbande im Talkessel etwas damit zu tun hat oder ob sich hier sonst etwas Verdächtiges regt.
};

INSTANCE Info_Mod_Cavalorn_Banditen (C_INFO)
{
	npc		= Mod_512_RDW_Cavalorn_NW;
	nr		= 1;
	condition	= Info_Mod_Cavalorn_Banditen_Condition;
	information	= Info_Mod_Cavalorn_Banditen_Info;
	permanent	= 0;
	important	= 0;
	description	= "Du hattest Banditen erwähnt...";
};

FUNC INT Info_Mod_Cavalorn_Banditen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cavalorn_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cavalorn_Banditen_Info()
{
	AI_Output(hero, self, "Info_Mod_Cavalorn_Banditen_15_00"); //Du hattest Banditen erwähnt...
	AI_Output(self, hero, "Info_Mod_Cavalorn_Banditen_08_01"); //Ja, da ist eine richtig fette Bande unten im Talkessel. Ich muss immer aufpassen, dass sie mich nicht bemerkt, ansonsten könnte das hässlich ausgehen.
	AI_Output(self, hero, "Info_Mod_Cavalorn_Banditen_08_02"); //Aber manchmal werfe ich von oben einen Blick rein. Sie scheinen gerade erst von einem Raubzug zurückgekehrt, haben jedenfalls ordentlich Beute und Lebensmittel.
};

INSTANCE Info_Mod_Cavalorn_Banditen2 (C_INFO)
{
	npc		= Mod_512_RDW_Cavalorn_NW;
	nr		= 1;
	condition	= Info_Mod_Cavalorn_Banditen2_Condition;
	information	= Info_Mod_Cavalorn_Banditen2_Info;
	permanent	= 0;
	important	= 0;
	description	= "Soll ich die Banditen ausräuchern?";
};

FUNC INT Info_Mod_Cavalorn_Banditen2_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cavalorn_Banditen))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cavalorn_Banditen2_Info()
{
	AI_Output(hero, self, "Info_Mod_Cavalorn_Banditen2_15_00"); //Soll ich die Banditen ausräuchern?
	AI_Output(self, hero, "Info_Mod_Cavalorn_Banditen2_08_01"); //Ganz ehrlich? Du hast nicht mal eine ordentliche Rüstung. Dich fressen die zum Frühstück.
	AI_Output(self, hero, "Info_Mod_Cavalorn_Banditen2_08_02"); //Nicht mal ich traue mich, mich mit denen anzulegen, und meine Künste im Umgang mit dem Bogen kennst du ja.
};

INSTANCE Info_Mod_Cavalorn_Banditen3 (C_INFO)
{
	npc		= Mod_512_RDW_Cavalorn_NW;
	nr		= 1;
	condition	= Info_Mod_Cavalorn_Banditen3_Condition;
	information	= Info_Mod_Cavalorn_Banditen3_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was wäre, wenn ich die Banditen doch vertreiben würde?";
};

FUNC INT Info_Mod_Cavalorn_Banditen3_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cavalorn_Banditen2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cavalorn_Banditen3_Info()
{
	AI_Output(hero, self, "Info_Mod_Cavalorn_Banditen3_15_00"); //Was wäre, wenn ich die Banditen doch vertreiben würde?
	AI_Output(self, hero, "Info_Mod_Cavalorn_Banditen3_08_01"); //Lass es einfach sein. Natürlich wäre ich froh, morgen ihre Leichen zu sehen - aber das wird so schnell nicht eintreten.

	Log_CreateTopic	(TOPIC_MOD_CAVALORN_BANDITEN, LOG_MISSION);
	B_SetTopicStatus	(TOPIC_MOD_CAVALORN_BANDITEN, LOG_RUNNING);
	B_LogEntry	(TOPIC_MOD_CAVALORN_BANDITEN, "Im Talkessel bei Xardas' Turm lauert eine Horde Banditen. Cavalorn hat mir zwar eindringlich davon abgeraten, mich mit ihnen anzulegen, aber er würde sich auch freuen, sie los zu sein.");
};

INSTANCE Info_Mod_Cavalorn_DunklerPilger (C_INFO)
{
	npc		= Mod_512_RDW_Cavalorn_NW;
	nr		= 1;
	condition	= Info_Mod_Cavalorn_DunklerPilger_Condition;
	information	= Info_Mod_Cavalorn_DunklerPilger_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was ist mit diesem dunklen Wanderer, der vorher an dir vorbeigekommen ist?";
};

FUNC INT Info_Mod_Cavalorn_DunklerPilger_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cavalorn_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cavalorn_DunklerPilger_Info()
{
	AI_Output(hero, self, "Info_Mod_Cavalorn_DunklerPilger_15_00"); //Was ist mit diesem dunklen Wanderer, der vorher an dir vorbeigekommen ist?
	AI_Output(self, hero, "Info_Mod_Cavalorn_DunklerPilger_08_01"); //Dunkler Wanderer? Ich habe hier seit Stunden niemanden vorbeikommen sehen.
	AI_Output(self, hero, "Info_Mod_Cavalorn_DunklerPilger_08_02"); //Aber vielleicht war ich auch so mit den Goblins beschäftigt, dass ich ihn übersehen habe. Merkwürdig.
	AI_Output(self, hero, "Info_Mod_Cavalorn_DunklerPilger_08_03"); //Ich werde auf alle Fälle bald wieder zu Vatras gehen und ihm Bericht erstatten. Genug zu erzählen gibt es ja.

	B_LogEntry	(TOPIC_MOD_DUNKLERPILGER, "Sonderbar. Cavalorn will den dunklen Wanderer nicht gesehen haben.");
};

INSTANCE Info_Mod_Cavalorn_XardasTurm (C_INFO)
{
	npc		= Mod_512_RDW_Cavalorn_NW;
	nr		= 1;
	condition	= Info_Mod_Cavalorn_XardasTurm_Condition;
	information	= Info_Mod_Cavalorn_XardasTurm_Info;
	permanent	= 0;
	important	= 0;
	description	= "Was sagst du zu Xardas' neuem Turm?";
};

FUNC INT Info_Mod_Cavalorn_XardasTurm_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cavalorn_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cavalorn_XardasTurm_Info()
{
	AI_Output(hero, self, "Info_Mod_Cavalorn_XardasTurm_15_00"); //Was sagst du zu Xardas' neuem Turm?
	AI_Output(self, hero, "Info_Mod_Cavalorn_XardasTurm_08_01"); //Ach so, Xardas ist da drin. Ich dachte schon, das wär ein altes Spukschloss oder so.
	AI_Output(self, hero, "Info_Mod_Cavalorn_XardasTurm_08_02"); //Wobei ... Xardas in der Nähe zu wissen, macht es nicht weniger unheimlich.
};

INSTANCE Info_Mod_Cavalorn_Zeremoniendolch (C_INFO)
{
	npc		= Mod_512_RDW_Cavalorn_NW;
	nr		= 1;
	condition	= Info_Mod_Cavalorn_Zeremoniendolch_Condition;
	information	= Info_Mod_Cavalorn_Zeremoniendolch_Info;
	permanent	= 0;
	important	= 0;
	description	= "Dir gefällt's hier unten?";
};

FUNC INT Info_Mod_Cavalorn_Zeremoniendolch_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Vatras_Zeremoniendolch))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cavalorn_Zeremoniendolch_Info()
{
	AI_Output(hero, self, "Info_Mod_Cavalorn_Zeremoniendolch_15_00"); //Dir gefällt's hier unten?
	AI_Output(self, hero, "Info_Mod_Cavalorn_Zeremoniendolch_08_01"); //Ganz und gar nicht. Aber ich muss auf Anweisungen von Merdarion warten.
	AI_Output(hero, self, "Info_Mod_Cavalorn_Zeremoniendolch_15_02"); //Ich habe Anweisung von Vatras für dich. Du sollst dich wieder mal blicken lassen.
	AI_Output(self, hero, "Info_Mod_Cavalorn_Zeremoniendolch_08_03"); //Adanos sei Dank! Endlich wieder Tageslicht. Du sagst Merdarion Bescheid?
	AI_Output(hero, self, "Info_Mod_Cavalorn_Zeremoniendolch_15_04"); //Natürlich.

	B_StartOtherRoutine	(self, "ATVATRAS");
};

INSTANCE Info_Mod_Cavalorn_Lehrer (C_INFO)
{
	npc		= Mod_512_RDW_Cavalorn_NW;
	nr		= 1;
	condition	= Info_Mod_Cavalorn_Lehrer_Condition;
	information	= Info_Mod_Cavalorn_Lehrer_Info;
	permanent	= 0;
	important	= 0;
	description	= "Kannst du mir auch beibringen, mit dem Bogen umzugehen?";
};

FUNC INT Info_Mod_Cavalorn_Lehrer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cavalorn_Banditen2))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cavalorn_Lehrer_Info()
{
	AI_Output(hero, self, "Info_Mod_Cavalorn_Lehrer_15_00"); //Kannst du mir auch beibringen, mit dem Bogen umzugehen?

	Log_CreateTopic	(TOPIC_MOD_LEHRER_KHORINIS, LOG_NOTE);

	if (Mod_Schwierigkeit != 4)
	{
		AI_Output(self, hero, "Info_Mod_Cavalorn_Lehrer_08_01"); //Du scheinst ja ordentlich was vergessen zu haben, wie? Klar kann ich dir die Grundlagen zeigen.

		B_LogEntry	(TOPIC_MOD_LEHRER_KHORINIS, "Cavalorn kann mir Bogenschießen und Schleichen beibringen.");
	}
	else
	{
		AI_Output(self, hero, "Info_Mod_Cavalorn_Lehrer_08_02"); //Ich kann dir das Schleichen beibringen.

		B_LogEntry	(TOPIC_MOD_LEHRER_KHORINIS, "Cavalorn kann mir Schleichen beibringen.");
	};
};

INSTANCE Info_Mod_Cavalorn_Lernen_Schleichen (C_INFO)
{
	npc		= Mod_512_RDW_Cavalorn_NW;
	nr		= 1;
	condition	= Info_Mod_Cavalorn_Lernen_Schleichen_Condition;
	information	= Info_Mod_Cavalorn_Lernen_Schleichen_Info;
	permanent	= 1;
	important	= 0;
	description	= B_BuildLearnString("Schleichen", B_GetLearnCostTalent(other, NPC_TALENT_SNEAK, 1));
};

FUNC INT Info_Mod_Cavalorn_Lernen_Schleichen_Condition()
{
	Info_Mod_Cavalorn_Lernen_Schleichen.description = B_BuildLearnString("Schleichen", B_GetLearnCostTalent(hero, NPC_TALENT_SNEAK, 1));

	if (Npc_KnowsInfo(hero, Info_Mod_Cavalorn_Lehrer))
	&& (Npc_GetTalentSkill (hero, NPC_TALENT_SNEAK) == FALSE)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cavalorn_Lernen_Schleichen_Info()
{
	AI_Output(hero, self, "Info_Mod_Cavalorn_Lernen_Schleichen_15_00"); //Bring mir das Schleichen bei.

	if (B_TeachThiefTalent (self, other, NPC_TALENT_SNEAK))
	{
		AI_Output(self, other, "Info_Mod_Cavalorn_Lernen_Schleichen_08_01"); //Mit weichen Sohlen hast du eine größere Chance, dich deinen Gegnern zu nähern, ohne dass sie es merken.
	};
};

INSTANCE Info_Mod_Cavalorn_Lernen_Bogen (C_INFO)
{
	npc		= Mod_512_RDW_Cavalorn_NW;
	nr		= 1;
	condition	= Info_Mod_Cavalorn_Lernen_Bogen_Condition;
	information	= Info_Mod_Cavalorn_Lernen_Bogen_Info;
	permanent	= 1;
	important	= 0;
	description	= "Bring mir Bogenschießen bei.";
};

FUNC INT Info_Mod_Cavalorn_Lernen_Bogen_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cavalorn_Lehrer))
	&& (hero.hitchance[NPC_TALENT_BOW] < 100)
	&& (Mod_Schwierigkeit != 4)
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cavalorn_Lernen_Bogen_Info()
{
	AI_Output(hero, self, "Info_Mod_Cavalorn_Lernen_Bogen_15_00"); //Bring mir Bogenschießen bei.

	Info_ClearChoices	(Info_Mod_Cavalorn_Lernen_Bogen);
	
	Info_AddChoice	(Info_Mod_Cavalorn_Lernen_Bogen, "Zurück.", Info_Mod_Cavalorn_Lernen_Bogen_BACK);
	Info_AddChoice	(Info_Mod_Cavalorn_Lernen_Bogen, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent_New(hero, NPC_TALENT_BOW)), Info_Mod_Cavalorn_Lernen_Bogen_5);
	Info_AddChoice	(Info_Mod_Cavalorn_Lernen_Bogen, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(hero, NPC_TALENT_BOW, 1)), Info_Mod_Cavalorn_Lernen_Bogen_1);
};

FUNC VOID Info_Mod_Cavalorn_Lernen_Bogen_BACK()
{
	Info_ClearChoices	(Info_Mod_Cavalorn_Lernen_Bogen);
};

FUNC VOID Info_Mod_Cavalorn_Lernen_Bogen_5()
{
	B_TeachFightTalentPercent_New (self, hero, NPC_TALENT_BOW, 5, 100);

	Info_ClearChoices	(Info_Mod_Cavalorn_Lernen_Bogen);

	Info_AddChoice	(Info_Mod_Cavalorn_Lernen_Bogen, "Zurück.", Info_Mod_Cavalorn_Lernen_Bogen_BACK);
	Info_AddChoice	(Info_Mod_Cavalorn_Lernen_Bogen, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent_New(hero, NPC_TALENT_BOW)), Info_Mod_Cavalorn_Lernen_Bogen_5);
	Info_AddChoice	(Info_Mod_Cavalorn_Lernen_Bogen, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(hero, NPC_TALENT_BOW, 1)), Info_Mod_Cavalorn_Lernen_Bogen_1);
};

FUNC VOID Info_Mod_Cavalorn_Lernen_Bogen_1()
{
	B_TeachFightTalentPercent (self, hero, NPC_TALENT_BOW, 1, 100);

	Info_ClearChoices	(Info_Mod_Cavalorn_Lernen_Bogen);

	Info_AddChoice	(Info_Mod_Cavalorn_Lernen_Bogen, "Zurück.", Info_Mod_Cavalorn_Lernen_Bogen_BACK);
	Info_AddChoice	(Info_Mod_Cavalorn_Lernen_Bogen, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent_New(hero, NPC_TALENT_BOW)), Info_Mod_Cavalorn_Lernen_Bogen_5);
	Info_AddChoice	(Info_Mod_Cavalorn_Lernen_Bogen, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(hero, NPC_TALENT_BOW, 1)), Info_Mod_Cavalorn_Lernen_Bogen_1);
};

INSTANCE Info_Mod_Cavalorn_Pickpocket (C_INFO)
{
	npc		= Mod_512_RDW_Cavalorn_NW;
	nr		= 1;
	condition	= Info_Mod_Cavalorn_Pickpocket_Condition;
	information	= Info_Mod_Cavalorn_Pickpocket_Info;
	permanent	= 1;
	important	= 0;
	description	= Pickpocket_60;
};

FUNC INT Info_Mod_Cavalorn_Pickpocket_Condition()
{
	C_Beklauen	(55, ItMi_Gold, 130);
};

FUNC VOID Info_Mod_Cavalorn_Pickpocket_Info()
{
	Info_ClearChoices	(Info_Mod_Cavalorn_Pickpocket);

	Info_AddChoice	(Info_Mod_Cavalorn_Pickpocket, DIALOG_BACK, Info_Mod_Cavalorn_Pickpocket_BACK);
	Info_AddChoice	(Info_Mod_Cavalorn_Pickpocket, DIALOG_PICKPOCKET, Info_Mod_Cavalorn_Pickpocket_DoIt);
};

FUNC VOID Info_Mod_Cavalorn_Pickpocket_BACK()
{
	Info_ClearChoices	(Info_Mod_Cavalorn_Pickpocket);
};

FUNC VOID Info_Mod_Cavalorn_Pickpocket_DoIt()
{
	B_Beklauen();
	Info_ClearChoices	(Info_Mod_Cavalorn_Pickpocket);
};

INSTANCE Info_Mod_Cavalorn_EXIT (C_INFO)
{
	npc		= Mod_512_RDW_Cavalorn_NW;
	nr		= 1;
	condition	= Info_Mod_Cavalorn_EXIT_Condition;
	information	= Info_Mod_Cavalorn_EXIT_Info;
	permanent	= 1;
	important	= 0;
	description	= DIALOG_ENDE;
};

FUNC INT Info_Mod_Cavalorn_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mod_Cavalorn_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};