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
	AI_Output(self, hero, "Info_Mod_Cavalorn_Hi_08_01"); //Es geschehen wirklich viele sonderbare Dinge in letzter Zeit ... aber warte mal. Du lebst noch?
	AI_Output(hero, self, "Info_Mod_Cavalorn_Hi_15_02"); //Ja, was machst du hier?
	AI_Output(self, hero, "Info_Mod_Cavalorn_Hi_08_03"); //Ich bin im Auftrag der Wassermagier hier. Ich soll hier alles im Auge behalten.
};

INSTANCE Info_Mod_Cavalorn_WhyForWassermagier (C_INFO)
{
	npc		= Mod_512_RDW_Cavalorn_NW;
	nr		= 1;
	condition	= Info_Mod_Cavalorn_WhyForWassermagier_Condition;
	information	= Info_Mod_Cavalorn_WhyForWassermagier_Info;
	permanent	= 0;
	important	= 0;
	description	= "Wieso sollst du für die Wassermagier hier alles im Auge behalten?";
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
	AI_Output(hero, self, "Info_Mod_Cavalorn_WhyForWassermagier_15_00"); //Wieso sollst du für die Wassermagier hier alles im Auge behalten?
	AI_Output(self, hero, "Info_Mod_Cavalorn_WhyForWassermagier_08_01"); //Ähh, dazu kann ich dir noch nicht so viel sagen. In den letzten Tagen und Wochen haben sich sonderbare Dinge ereignet.
	AI_Output(hero, self, "Info_Mod_Cavalorn_WhyForWassermagier_15_02"); //Sonderbare Dinge?
	AI_Output(self, hero, "Info_Mod_Cavalorn_WhyForWassermagier_08_03"); //Ja, dunkle Erscheinungen, von welchen wir aber noch nichts Näheres wissen.
	AI_Output(self, hero, "Info_Mod_Cavalorn_WhyForWassermagier_08_04"); //Erst nur vor der Stadt, aber zuletzt haben sich sogar innerhalb der Stadtmauern merkwürdige Dinge ereignet.
	AI_Output(self, hero, "Info_Mod_Cavalorn_WhyForWassermagier_08_05"); //Ich bin jetzt seit einigen Tagen hier, um auf seltsame Vorkommnisse zu achten.
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
	if (Npc_KnowsInfo(hero, Info_Mod_Cavalorn_WhyForWassermagier))
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
	description	= "Kannst du mir was beibringen?";
};

FUNC INT Info_Mod_Cavalorn_Lehrer_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Mod_Cavalorn_Hi))
	{
		return 1;
	};
};

FUNC VOID Info_Mod_Cavalorn_Lehrer_Info()
{
	AI_Output(hero, self, "Info_Mod_Cavalorn_Lehrer_15_00"); //Kannst du mir as beibringen?

	Log_CreateTopic	(TOPIC_MOD_LEHRER_KHORINIS, LOG_NOTE);
	if (Mod_Schwierigkeit != 4)
	{
		AI_Output(self, hero, "Info_Mod_Cavalorn_Lehrer_08_01"); //Ich kann dir Bogenschießen und Schleichen beibringen.

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